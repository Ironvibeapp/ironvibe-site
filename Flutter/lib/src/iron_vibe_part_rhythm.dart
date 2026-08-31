part of 'package:fitness_app/main.dart';

const int _kRhythmWindowDays = 28;
const double _kRhythmDeloadMinFreq = 2.5;
const double _kRhythmDeloadVolumeKeep = 0.70;
const String _kPrefsKeyDeloadNudgeAt = 'ironvibe_deload_nudge_at';

DateTime _rhythmDateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

DateTime _rhythmMondayOf(DateTime d) {
  final day = _rhythmDateOnly(d);
  return day.subtract(Duration(days: day.weekday - 1));
}

double? _rhythmParseNum(String raw) {
  return double.tryParse(raw.trim().replaceAll(',', '.'));
}

/// Силовая нагрузка за календарный день. Кардио полностью игнорируется.
class IronVibeDayLoad {
  final DateTime day;
  final double tonnageKg;
  final double reps;

  const IronVibeDayLoad({
    required this.day,
    required this.tonnageKg,
    required this.reps,
  });
}

class IronVibeRhythmSnapshot {
  final double daysPerWeek;
  final int daysInWindow;
  final bool hasGauge;
  final bool deloadIndicated;
  final double? deloadEveryWeeks;
  final double accumulationWeeks;
  final bool recentDeload;

  const IronVibeRhythmSnapshot({
    required this.daysPerWeek,
    required this.daysInWindow,
    required this.hasGauge,
    required this.deloadIndicated,
    required this.deloadEveryWeeks,
    required this.accumulationWeeks,
    required this.recentDeload,
  });

  bool get suggestsDeloadNudge =>
      deloadIndicated &&
      !recentDeload &&
      deloadEveryWeeks != null &&
      accumulationWeeks + 0.001 >= deloadEveryWeeks!;
}

class _RhythmWeekLoad {
  final DateTime monday;
  final double tonnage;
  final double reps;
  final int days;

  const _RhythmWeekLoad({
    required this.monday,
    required this.tonnage,
    required this.reps,
    required this.days,
  });
}

Map<DateTime, IronVibeDayLoad> ironVibeStrengthLoadByDay(
  Iterable<WorkoutLog> history,
) {
  final map = <DateTime, IronVibeDayLoad>{};
  for (final w in history) {
    var tonnage = 0.0;
    var reps = 0.0;
    var any = false;
    for (final ex in w.exercises) {
      if (ex.isCardio) continue;
      for (final set in ex.sets) {
        if (set.isCardio) continue;
        final r = _rhythmParseNum(set.reps);
        if (r == null || r <= 0) continue;
        any = true;
        reps += r;
        final kg = _rhythmParseNum(set.weight);
        if (kg != null && kg > 0) tonnage += kg * r;
      }
    }
    if (!any) continue;
    final key = _rhythmDateOnly(w.date);
    final prev = map[key];
    if (prev == null) {
      map[key] = IronVibeDayLoad(day: key, tonnageKg: tonnage, reps: reps);
    } else {
      map[key] = IronVibeDayLoad(
        day: key,
        tonnageKg: prev.tonnageKg + tonnage,
        reps: prev.reps + reps,
      );
    }
  }
  return map;
}

double ironVibeDeloadIntervalWeeks(double daysPerWeek) {
  final f = daysPerWeek.clamp(2.5, 6.0);
  final t = 6.0 + 10.0 * (6.0 - f) / 3.5;
  return t.clamp(5.0, 16.0);
}

Color ironVibeRhythmZoneColor(double daysPerWeek) {
  final x = daysPerWeek.clamp(1.0, 6.0);
  const steel = Color(0xFF8B919A);
  const copper = kIronVibeAccent;
  const brass = Color(0xFFD4B07A);
  const rust = Color(0xFFB85A48);
  if (x <= 2) return Color.lerp(steel, copper, x - 1)!;
  if (x <= 4) return copper;
  if (x <= 5) return Color.lerp(copper, brass, x - 4)!;
  return Color.lerp(brass, rust, x - 5)!;
}

bool _rhythmWeekLooksLikeDeload(
  _RhythmWeekLoad week,
  List<_RhythmWeekLoad> prior,
) {
  if (week.days == 0) return true;
  final baseline = prior.reversed.where((w) => w.days >= 2).take(3).toList();
  if (baseline.length < 2) return false;
  final baseT =
      baseline.map((w) => w.tonnage).reduce((a, b) => a + b) / baseline.length;
  final baseR =
      baseline.map((w) => w.reps).reduce((a, b) => a + b) / baseline.length;
  final hasTonnage = baseT >= 50;
  final hasReps = baseR >= 10;
  if (!hasTonnage && !hasReps) return week.days <= 1;
  final tDropped = !hasTonnage || week.tonnage <= baseT * _kRhythmDeloadVolumeKeep;
  final rDropped = !hasReps || week.reps <= baseR * _kRhythmDeloadVolumeKeep;
  return tDropped && rDropped;
}

List<_RhythmWeekLoad> _rhythmWeeksFromDays(
  Map<DateTime, IronVibeDayLoad> byDay,
  DateTime fromMonday,
  DateTime toMondayInclusive,
) {
  final out = <_RhythmWeekLoad>[];
  var monday = fromMonday;
  while (!monday.isAfter(toMondayInclusive)) {
    var t = 0.0;
    var r = 0.0;
    var days = 0;
    for (var i = 0; i < 7; i++) {
      final d = monday.add(Duration(days: i));
      final load = byDay[d];
      if (load == null) continue;
      days++;
      t += load.tonnageKg;
      r += load.reps;
    }
    out.add(_RhythmWeekLoad(monday: monday, tonnage: t, reps: r, days: days));
    monday = monday.add(const Duration(days: 7));
  }
  return out;
}

IronVibeRhythmSnapshot ironVibeComputeRhythm(
  Iterable<WorkoutLog> history, {
  DateTime? now,
}) {
  final today = _rhythmDateOnly(now ?? DateTime.now());
  final windowStart = today.subtract(const Duration(days: _kRhythmWindowDays - 1));
  final byDay = ironVibeStrengthLoadByDay(history);

  var daysInWindow = 0;
  for (var i = 0; i < _kRhythmWindowDays; i++) {
    if (byDay.containsKey(windowStart.add(Duration(days: i)))) daysInWindow++;
  }
  final daysPerWeek = daysInWindow / 4.0;
  final hasGauge = daysInWindow >= 3;

  final deloadIndicated = daysPerWeek >= _kRhythmDeloadMinFreq;
  final deloadEveryWeeks =
      deloadIndicated ? ironVibeDeloadIntervalWeeks(daysPerWeek) : null;

  final thisMonday = _rhythmMondayOf(today);
  DateTime? firstDay;
  for (final d in byDay.keys) {
    if (firstDay == null || d.isBefore(firstDay)) firstDay = d;
  }

  var accumulationWeeks = 0.0;
  var recentDeload = false;

  if (firstDay != null) {
    final firstMonday = _rhythmMondayOf(firstDay);
    final weeks = _rhythmWeeksFromDays(byDay, firstMonday, thisMonday);
    final complete = weeks.length <= 1
        ? const <_RhythmWeekLoad>[]
        : weeks.sublist(0, weeks.length - 1);
    final current = weeks.isEmpty ? null : weeks.last;

    final isDeload = <int, bool>{};
    for (var i = 0; i < complete.length; i++) {
      isDeload[i] = _rhythmWeekLooksLikeDeload(
        complete[i],
        complete.sublist(0, i),
      );
    }
    var lastDeload = -1;
    for (var i = 0; i < complete.length; i++) {
      if (isDeload[i] == true) lastDeload = i;
    }

    final after = lastDeload < 0
        ? complete
        : complete.sublist(lastDeload + 1);
    accumulationWeeks = after.length.toDouble();
    if (current != null) {
      accumulationWeeks += (today.weekday / 7.0);
    }

    final lastCompleteWasDeload =
        complete.isNotEmpty && isDeload[complete.length - 1] == true;
    final currentLooksQuiet = current != null &&
        today.weekday >= 5 &&
        _rhythmWeekLooksLikeDeload(current, complete);
    recentDeload = lastCompleteWasDeload || currentLooksQuiet;
    if (recentDeload) accumulationWeeks = 0;
  }

  return IronVibeRhythmSnapshot(
    daysPerWeek: daysPerWeek,
    daysInWindow: daysInWindow,
    hasGauge: hasGauge,
    deloadIndicated: deloadIndicated,
    deloadEveryWeeks: deloadEveryWeeks,
    accumulationWeeks: accumulationWeeks,
    recentDeload: recentDeload,
  );
}

Future<DateTime?> ironVibeLoadDeloadNudgeAt() async {
  final prefs = await SharedPreferences.getInstance();
  final raw = prefs.getString(_kPrefsKeyDeloadNudgeAt);
  if (raw == null || raw.isEmpty) return null;
  return DateTime.tryParse(raw);
}

Future<void> ironVibeMarkDeloadNudgeShown(DateTime at) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(_kPrefsKeyDeloadNudgeAt, at.toIso8601String());
}

bool ironVibeSameMondayWeek(DateTime a, DateTime b) {
  return _rhythmMondayOf(a) == _rhythmMondayOf(b);
}
