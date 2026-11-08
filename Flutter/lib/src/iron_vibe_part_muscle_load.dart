part of 'package:fitness_app/main.dart';

const String kIronVibeMuscleLoadAsset = 'assets/muscle_load.png';

/// Same window as training rhythm: the last 28 days, averaged into one week.
const int kIronVibeLoadWindowDays = 28;

const List<IronVibeMuscleGroup> kIronVibeLoadMuscleGroups = [
  IronVibeMuscleGroup.chest,
  IronVibeMuscleGroup.back,
  IronVibeMuscleGroup.shoulders,
  IronVibeMuscleGroup.core,
  IronVibeMuscleGroup.quad,
  IronVibeMuscleGroup.hamstring,
  IronVibeMuscleGroup.glute,
  IronVibeMuscleGroup.calf,
  IronVibeMuscleGroup.armFlex,
  IronVibeMuscleGroup.armExt,
];

class IronVibeMuscleWeekLoad {
  final int sets;
  final double tonnage;

  const IronVibeMuscleWeekLoad({required this.sets, required this.tonnage});

  static const zero = IronVibeMuscleWeekLoad(sets: 0, tonnage: 0);

  double get setsPerWeek => sets * 7 / kIronVibeLoadWindowDays;

  double get tonnagePerWeek => tonnage * 7 / kIronVibeLoadWindowDays;
}

class IronVibeMuscleLoadSnapshot {
  final Map<IronVibeMuscleGroup, IronVibeMuscleWeekLoad> byGroup;

  const IronVibeMuscleLoadSnapshot(this.byGroup);

  IronVibeMuscleWeekLoad loadFor(IronVibeMuscleGroup group) =>
      byGroup[group] ?? IronVibeMuscleWeekLoad.zero;
}

/// Working set for the load screen: a strength set with a real RIR.
/// An empty RIR is a warm-up. ∞ is the warm-up value already used in the logger.
bool ironVibeSetCountsTowardMuscleLoad(SetLog set) {
  if (set.isCardio) return false;
  final rir = normalizeRirStored(set.rir);
  if (rir.isEmpty) return false;
  if (rir == '∞') return false;
  final token = rir.toLowerCase();
  if (token == 'inf' || token == 'infinity') return false;
  return true;
}

IronVibeMuscleLoadSnapshot ironVibeComputeMuscleLoadFor({
  String? clientName,
  DateTime? now,
}) {
  return ironVibeComputeMuscleLoad(
    ironVibeRhythmHistoryFor(clientName: clientName),
    now: now,
  );
}

IronVibeMuscleLoadSnapshot ironVibeComputeMuscleLoad(
  Iterable<WorkoutLog> history, {
  DateTime? now,
}) {
  final today = ironVibeDateOnly(now ?? DateTime.now());
  final windowStart = today.subtract(
    const Duration(days: kIronVibeLoadWindowDays - 1),
  );
  final sets = {for (final g in kIronVibeLoadMuscleGroups) g: 0};
  final tonnage = {for (final g in kIronVibeLoadMuscleGroups) g: 0.0};

  for (final workout in history) {
    final day = ironVibeDateOnly(workout.date);
    if (day.isBefore(windowStart) || day.isAfter(today)) continue;
    for (final ex in workout.exercises) {
      if (ex.isCardio) continue;
      final group = ironVibeMuscleGroupForName(ex.name);
      if (group == null || group == IronVibeMuscleGroup.skip) continue;
      if (!sets.containsKey(group)) continue;
      for (final set in ex.sets) {
        if (!ironVibeSetCountsTowardMuscleLoad(set)) continue;
        sets[group] = sets[group]! + 1;
        final volume = ironVibeVolumeKgFromFields(set.weight, set.reps);
        if (volume != null) tonnage[group] = tonnage[group]! + volume;
      }
    }
  }

  return IronVibeMuscleLoadSnapshot({
    for (final g in kIronVibeLoadMuscleGroups)
      g: IronVibeMuscleWeekLoad(sets: sets[g]!, tonnage: tonnage[g]!),
  });
}

/// Monday of the calendar week that contains [date].
DateTime ironVibeLoadWeekMonday(DateTime date) {
  final day = ironVibeDateOnly(date);
  return day.subtract(Duration(days: day.weekday - DateTime.monday));
}

class IronVibeMuscleWeekPoint {
  final DateTime monday;
  final int sets;
  final double tonnage;

  const IronVibeMuscleWeekPoint({
    required this.monday,
    required this.sets,
    required this.tonnage,
  });
}

enum IronVibeMuscleLoadTrendSpan { month, year, all }

/// One point per calendar week, including weeks with no working sets, so a
/// drop in load stays visible. Weeks run Monday–Sunday and stop at [now].
List<IronVibeMuscleWeekPoint> ironVibeMuscleLoadTrend(
  Iterable<WorkoutLog> history, {
  required IronVibeMuscleGroup group,
  IronVibeMuscleLoadTrendSpan span = IronVibeMuscleLoadTrendSpan.all,
  DateTime? now,
}) {
  final today = ironVibeDateOnly(now ?? DateTime.now());
  final byWeek = <DateTime, IronVibeMuscleWeekPoint>{};

  for (final workout in history) {
    final day = ironVibeDateOnly(workout.date);
    if (day.isAfter(today)) continue;
    for (final ex in workout.exercises) {
      if (ex.isCardio) continue;
      if (ironVibeMuscleGroupForName(ex.name) != group) continue;
      for (final set in ex.sets) {
        if (!ironVibeSetCountsTowardMuscleLoad(set)) continue;
        final monday = ironVibeLoadWeekMonday(day);
        final prev = byWeek[monday];
        final volume = ironVibeVolumeKgFromFields(set.weight, set.reps) ?? 0;
        byWeek[monday] = IronVibeMuscleWeekPoint(
          monday: monday,
          sets: (prev?.sets ?? 0) + 1,
          tonnage: (prev?.tonnage ?? 0) + volume,
        );
      }
    }
  }
  if (byWeek.isEmpty) return const [];

  final todayMonday = ironVibeLoadWeekMonday(today);
  final DateTime windowStart;
  switch (span) {
    case IronVibeMuscleLoadTrendSpan.month:
      windowStart = ironVibeLoadWeekMonday(
        DateTime(today.year, today.month, 1),
      );
    case IronVibeMuscleLoadTrendSpan.year:
      windowStart = ironVibeLoadWeekMonday(DateTime(today.year, 1, 1));
    case IronVibeMuscleLoadTrendSpan.all:
      windowStart = byWeek.keys.reduce((a, b) => a.isBefore(b) ? a : b);
  }

  final out = <IronVibeMuscleWeekPoint>[];
  for (
    var monday = windowStart;
    !monday.isAfter(todayMonday);
    monday = monday.add(const Duration(days: 7))
  ) {
    out.add(
      byWeek[monday] ??
          IronVibeMuscleWeekPoint(monday: monday, sets: 0, tonnage: 0),
    );
  }
  return out;
}

String ironVibeFormatLoadSets(double setsPerWeek, String locale) {
  return NumberFormat('#0.##', locale).format(setsPerWeek);
}

String ironVibeFormatLoadTonnage(double tonnagePerWeek, String locale) {
  if (tonnagePerWeek <= 0) return '—';
  if (tonnagePerWeek >= 100) {
    return NumberFormat('#,##0', locale).format(tonnagePerWeek.round());
  }
  return NumberFormat('#0.#', locale).format(tonnagePerWeek);
}

void ironVibeOpenMuscleLoad(BuildContext context, {String? clientName}) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => MuscleLoadScreen(clientName: clientName),
    ),
  );
}

class IronVibeMuscleLoadCard extends StatelessWidget {
  final VoidCallback? onTap;
  final double height;

  const IronVibeMuscleLoadCard({super.key, this.onTap, this.height = 128});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final plate = Container(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
      decoration: ironVibeElevatedCardDecoration(pal),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ColoredBox(
            color: const Color(0xFFF7F4F1),
            child: Image.asset(
              kIronVibeMuscleLoadAsset,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.medium,
              semanticLabel: l.loadInsightTitle,
            ),
          ),
        ),
      ),
    );
    if (onTap == null) return plate;
    return Semantics(
      button: true,
      label: l.loadInsightTitle,
      child: IronVibePressScale(onPressed: onTap!, child: plate),
    );
  }
}

class IronVibeRhythmAndLoadRow extends StatelessWidget {
  final IronVibeRhythmSnapshot rhythm;
  final VoidCallback onRhythm;
  final VoidCallback onLoad;
  final bool showRhythm;

  const IronVibeRhythmAndLoadRow({
    super.key,
    required this.rhythm,
    required this.onRhythm,
    required this.onLoad,
    this.showRhythm = true,
  });

  @override
  Widget build(BuildContext context) {
    final load = IronVibeMuscleLoadCard(onTap: onLoad);
    if (!showRhythm) {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(width: 168, child: load),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: IronVibeRhythmCard(snapshot: rhythm, onTap: onRhythm),
        ),
        const SizedBox(width: 10),
        Expanded(child: load),
      ],
    );
  }
}

class MuscleLoadScreen extends StatelessWidget {
  final String? clientName;

  const MuscleLoadScreen({super.key, this.clientName});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final snapshot = ironVibeComputeMuscleLoadFor(clientName: clientName);
    final legend =
        '${l.loadSetsShort} · ${l.loadTonnageShort}, ${l.weightUnitsChoiceShort}';

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ironVibeTopBarMaterial(
              context,
              leading: _ironVibeHeaderIconButton(
                context,
                icon: Icons.arrow_back,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
              child: Text(
                ironVibeSentenceCase(l.loadInsightTitle),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 20, 2),
              child: Text(
                legend,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kIronVibeAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 4, 22, 8),
              child: Text(
                l.loadWindow,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pal.textSecondary,
                  fontSize: 12.5,
                  height: 1.35,
                ),
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const sideInset = 8.0;
                  final width = math.min(
                    constraints.maxWidth - sideInset * 2,
                    460.0,
                  );
                  final diagramHeight = _muscleLoadDiagramHeight(
                    width,
                    constraints.maxHeight,
                  );
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      height: math.max(diagramHeight, constraints.maxHeight),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: width,
                          height: diagramHeight,
                          child: _MuscleLoadDiagram(
                            snapshot: snapshot,
                            width: width,
                            height: diagramHeight,
                            clientName: clientName,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const double _kLoadChipHeight = 52;
const double _kLoadChipGap = 4;
const double _kLoadImageGap = 6;

double _muscleLoadDiagramHeight(double width, double maxHeight) {
  const chrome = _kLoadChipHeight * 2 + _kLoadImageGap * 2;
  final room = maxHeight - chrome;
  final imageSide = room >= 160
      ? math.min(width, room)
      : math.min(width, 240.0);
  return chrome + imageSide;
}

/// Points on the plate, as fractions of the image. Each band is left to right
/// so the leader lines stay apart.
const List<_LoadAnchor> _kLoadAnchors = [
  _LoadAnchor(IronVibeMuscleGroup.armFlex, 0.156, 0.355, true),
  _LoadAnchor(IronVibeMuscleGroup.chest, 0.228, 0.242, true),
  _LoadAnchor(IronVibeMuscleGroup.shoulders, 0.332, 0.198, true),
  _LoadAnchor(IronVibeMuscleGroup.back, 0.678, 0.305, true),
  _LoadAnchor(IronVibeMuscleGroup.armExt, 0.823, 0.357, true),
  _LoadAnchor(IronVibeMuscleGroup.core, 0.262, 0.368, false),
  _LoadAnchor(IronVibeMuscleGroup.quad, 0.304, 0.615, false),
  _LoadAnchor(IronVibeMuscleGroup.glute, 0.652, 0.488, false),
  _LoadAnchor(IronVibeMuscleGroup.hamstring, 0.748, 0.635, false),
  _LoadAnchor(IronVibeMuscleGroup.calf, 0.762, 0.820, false),
];

class _LoadAnchor {
  final IronVibeMuscleGroup group;
  final double x;
  final double y;
  final bool above;

  const _LoadAnchor(this.group, this.x, this.y, this.above);
}

class _CalloutSegment {
  final Offset from;
  final Offset to;
  final bool active;

  const _CalloutSegment(this.from, this.to, this.active);
}

class _MuscleLoadDiagram extends StatelessWidget {
  final IronVibeMuscleLoadSnapshot snapshot;
  final double width;
  final double height;
  final String? clientName;

  const _MuscleLoadDiagram({
    required this.snapshot,
    required this.width,
    required this.height,
    this.clientName,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    const chrome = _kLoadChipHeight * 2 + _kLoadImageGap * 2;
    final imageSide = math.max(0.0, math.min(width, height - chrome));
    final imageLeft = (width - imageSide) / 2;
    final imageTop = _kLoadChipHeight + _kLoadImageGap;
    final belowTop = imageTop + imageSide + _kLoadImageGap;

    final above = _kLoadAnchors.where((a) => a.above).toList();
    final below = _kLoadAnchors.where((a) => !a.above).toList();

    final segments = <_CalloutSegment>[];
    final chips = <Widget>[];

    void place(List<_LoadAnchor> band, double chipTop, bool fromBelow) {
      if (band.isEmpty) return;
      final chipW = (width - _kLoadChipGap * (band.length - 1)) / band.length;
      for (var i = 0; i < band.length; i++) {
        final anchor = band[i];
        final left = i * (chipW + _kLoadChipGap);
        final load = snapshot.loadFor(anchor.group);
        final active = load.sets > 0;
        final sets = ironVibeFormatLoadSets(load.setsPerWeek, locale);
        final tonnage = ironVibeFormatLoadTonnage(load.tonnagePerWeek, locale);
        chips.add(
          Positioned(
            left: left,
            top: chipTop,
            width: chipW,
            height: _kLoadChipHeight,
            child: _LoadChip(
              name: ironVibeMuscleGroupLabel(l, anchor.group),
              stats: '$sets · $tonnage',
              active: active,
              onTap: () => ironVibeOpenMuscleLoadTrend(
                context,
                group: anchor.group,
                clientName: clientName,
              ),
            ),
          ),
        );
        segments.add(
          _CalloutSegment(
            Offset(
              left + chipW / 2,
              fromBelow ? chipTop : chipTop + _kLoadChipHeight,
            ),
            Offset(
              imageLeft + anchor.x * imageSide,
              imageTop + anchor.y * imageSide,
            ),
            active,
          ),
        );
      }
    }

    place(above, 0, false);
    place(below, belowTop, true);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            left: imageLeft,
            top: imageTop,
            width: imageSide,
            height: imageSide,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: const ColoredBox(
                color: Color(0xFFF7F4F1),
                child: Image(
                  image: AssetImage(kIronVibeMuscleLoadAsset),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.medium,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: _LoadCalloutPainter(segments: segments),
              ),
            ),
          ),
          ...chips,
        ],
      ),
    );
  }
}

class _LoadChip extends StatelessWidget {
  final String name;
  final String stats;
  final bool active;
  final VoidCallback onTap;

  const _LoadChip({
    required this.name,
    required this.stats,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final number = active ? kIronVibeAccent : pal.textMuted;
    final title = active ? pal.textPrimary : pal.textMuted;
    return Material(
      color: pal.card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: active
              ? kIronVibeAccent.withValues(alpha: 0.7)
              : pal.borderSubtle,
          width: 0.6,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: title,
                  fontSize: 9.5,
                  fontWeight: FontWeight.w700,
                  height: 1.05,
                ),
              ),
              const SizedBox(height: 2),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  stats,
                  maxLines: 1,
                  style: TextStyle(
                    color: number,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    height: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadCalloutPainter extends CustomPainter {
  final List<_CalloutSegment> segments;

  const _LoadCalloutPainter({required this.segments});

  @override
  void paint(Canvas canvas, Size size) {
    for (final segment in segments) {
      final ink = segment.active
          ? const Color(0xFF8C5A32)
          : const Color(0xFF9AA3AE);
      final halo = Paint()
        ..color = const Color(0xFFF7F4F1)
        ..strokeWidth = 3.4
        ..strokeCap = StrokeCap.round;
      final line = Paint()
        ..color = ink
        ..strokeWidth = 1.35
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(segment.from, segment.to, halo);
      canvas.drawLine(segment.from, segment.to, line);
      canvas.drawCircle(
        segment.to,
        4.2,
        Paint()..color = const Color(0xFFF7F4F1),
      );
      canvas.drawCircle(segment.to, 2.5, Paint()..color = ink);
    }
  }

  @override
  bool shouldRepaint(covariant _LoadCalloutPainter oldDelegate) {
    if (oldDelegate.segments.length != segments.length) return true;
    for (var i = 0; i < segments.length; i++) {
      final a = segments[i];
      final b = oldDelegate.segments[i];
      if (a.active != b.active || a.from != b.from || a.to != b.to) {
        return true;
      }
    }
    return false;
  }
}

void ironVibeOpenMuscleLoadTrend(
  BuildContext context, {
  required IronVibeMuscleGroup group,
  String? clientName,
}) {
  final pal = IronVibePalette.of(context);
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: pal.sheetModal,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      side: BorderSide(color: pal.borderSubtle, width: 0.5),
    ),
    builder: (ctx) => MuscleLoadTrendSheet(
      group: group,
      clientName: clientName,
      height: MediaQuery.sizeOf(ctx).height * 0.58,
    ),
  );
}

class MuscleLoadTrendSheet extends StatefulWidget {
  final IronVibeMuscleGroup group;
  final String? clientName;
  final double height;

  const MuscleLoadTrendSheet({
    super.key,
    required this.group,
    this.clientName,
    required this.height,
  });

  @override
  State<MuscleLoadTrendSheet> createState() => _MuscleLoadTrendSheetState();
}

class _MuscleLoadTrendSheetState extends State<MuscleLoadTrendSheet> {
  IronVibeMuscleLoadTrendSpan _span = IronVibeMuscleLoadTrendSpan.all;

  List<IronVibeMuscleWeekPoint> get _points => ironVibeMuscleLoadTrend(
    ironVibeRhythmHistoryFor(clientName: widget.clientName),
    group: widget.group,
    span: _span,
  );

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final points = _points;
    return Container(
      height: widget.height,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            ironVibeMuscleGroupLabel(l, widget.group),
            style: TextStyle(
              color: pal.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            l.loadTrendHint,
            style: TextStyle(
              color: pal.textSecondary,
              fontSize: 12.5,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _FilterChip(
                label: l.filterMonth,
                selected: _span == IronVibeMuscleLoadTrendSpan.month,
                onTap: () =>
                    setState(() => _span = IronVibeMuscleLoadTrendSpan.month),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: l.filterYear,
                selected: _span == IronVibeMuscleLoadTrendSpan.year,
                onTap: () =>
                    setState(() => _span = IronVibeMuscleLoadTrendSpan.year),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: l.filterAllTime,
                selected: _span == IronVibeMuscleLoadTrendSpan.all,
                onTap: () =>
                    setState(() => _span = IronVibeMuscleLoadTrendSpan.all),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: points.isEmpty
                ? Center(
                    child: Text(
                      l.noEntries,
                      style: TextStyle(color: pal.textMuted, fontSize: 14),
                    ),
                  )
                : _MuscleLoadTrendChart(points: points),
          ),
        ],
      ),
    );
  }
}

String _loadTrendWeekRange(DateTime monday) {
  final end = monday.add(const Duration(days: 6));
  return '${monday.day}.${monday.month}–${end.day}.${end.month}';
}

double _loadTrendBottomInterval(int weeks) {
  if (weeks <= 6) return 1;
  if (weeks <= 14) return 2;
  if (weeks <= 32) return 4;
  return 8;
}

class _MuscleLoadTrendChart extends StatelessWidget {
  final List<IronVibeMuscleWeekPoint> points;

  const _MuscleLoadTrendChart({required this.points});

  static const double _norm = 100;

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final l = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final maxSets = points.fold<int>(0, (a, p) => a > p.sets ? a : p.sets);
    final maxTon = points.fold<double>(
      0,
      (a, p) => a > p.tonnage ? a : p.tonnage,
    );
    final denomSets = maxSets > 0 ? maxSets.toDouble() : 1.0;
    final denomTon = maxTon > 0.02 ? maxTon : 1.0;
    final single = points.length == 1;
    double xFor(int i) => single ? 0 : i.toDouble();
    final minX = single ? -1.0 : 0.0;
    final maxX = single ? 1.0 : (points.length - 1).toDouble();
    final dotRadius = points.length > 18 ? 2.6 : 3.8;

    final setSpots = List<FlSpot>.generate(
      points.length,
      (i) => FlSpot(xFor(i), (points[i].sets / denomSets) * _norm),
    );
    final tonSpots = List<FlSpot>.generate(
      points.length,
      (i) => FlSpot(xFor(i), (points[i].tonnage / denomTon) * _norm),
    );

    int nearest(double x) {
      var best = 0;
      var bestDx = double.infinity;
      for (var i = 0; i < points.length; i++) {
        final dx = (xFor(i) - x).abs();
        if (dx < bestDx) {
          bestDx = dx;
          best = i;
        }
      }
      return best;
    }

    List<LineTooltipItem?> tooltipFor(List<LineBarSpot> touched) {
      if (touched.isEmpty) return [];
      final point = points[nearest(touched.first.x)];
      final base = TextStyle(color: pal.textPrimary, fontSize: 12);
      final setsStyle = base.copyWith(
        color: kProgressChartRepsColor,
        fontWeight: FontWeight.w800,
      );
      final tonStyle = base.copyWith(
        color: kProgressChartVolumeColor,
        fontWeight: FontWeight.w800,
      );
      final item = LineTooltipItem(
        '',
        base,
        children: [
          TextSpan(text: '${_loadTrendWeekRange(point.monday)}\n', style: base),
          TextSpan(text: '${point.sets}', style: setsStyle),
          TextSpan(text: ' ${l.loadSetsShort}', style: base),
          TextSpan(text: '\n', style: base),
          TextSpan(
            text: ironVibeFormatLoadTonnage(point.tonnage, locale),
            style: tonStyle,
          ),
          TextSpan(text: ' ${l.weightUnitsChoiceShort}', style: base),
        ],
      );
      return List<LineTooltipItem?>.generate(
        touched.length,
        (i) => i == 0 ? item : null,
      );
    }

    LineChartBarData bar(List<FlSpot> spots, Color color) {
      return LineChartBarData(
        spots: spots,
        isCurved: false,
        color: color,
        barWidth: 2.5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: dotRadius,
            color: color,
            strokeWidth: 1,
            strokeColor: pal.borderDefault,
          ),
        ),
        belowBarData: BarAreaData(show: false),
      );
    }

    Widget tick(String text, Color color) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: color, fontSize: 10),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: LineChart(
            LineChartData(
              minX: minX,
              maxX: maxX,
              minY: 0,
              maxY: _norm,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                drawHorizontalLine: true,
                getDrawingHorizontalLine: (value) =>
                    FlLine(color: pal.borderSubtle, strokeWidth: 0.5),
                getDrawingVerticalLine: (value) =>
                    FlLine(color: pal.borderSubtle, strokeWidth: 0.5),
              ),
              borderData: FlBorderData(show: false),
              lineTouchData: LineTouchData(
                touchSpotThreshold: 28,
                touchTooltipData: LineTouchTooltipData(
                  maxContentWidth: 280,
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItems: tooltipFor,
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  axisNameWidget: Text(
                    l.loadSetsShort,
                    style: const TextStyle(
                      color: kProgressChartRepsColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  axisNameSize: 18,
                  sideTitles: SideTitles(
                    showTitles: maxSets > 0,
                    reservedSize: maxSets > 0 ? 36 : 8,
                    interval: 25,
                    getTitlesWidget: (value, meta) {
                      final sets = (value / _norm) * denomSets;
                      final label = (sets - sets.round()).abs() < 0.08
                          ? sets.round().toString()
                          : sets.toStringAsFixed(1);
                      return tick(label, pal.textSecondary);
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  axisNameWidget: Text(
                    l.loadTonnageShort,
                    style: const TextStyle(
                      color: kProgressChartVolumeColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  axisNameSize: 18,
                  sideTitles: SideTitles(
                    showTitles: maxTon > 0.02,
                    reservedSize: maxTon > 0.02 ? 44 : 8,
                    interval: 25,
                    getTitlesWidget: (value, meta) {
                      final ton = (value / _norm) * denomTon;
                      final label = ton <= 0.5 ? '0' : ironVibeFormatKgTon(ton);
                      return tick(
                        label,
                        kProgressChartVolumeColor.withValues(alpha: 0.92),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: _loadTrendBottomInterval(points.length),
                    getTitlesWidget: (value, meta) {
                      final index = value.round();
                      if ((value - index).abs() > 0.2 ||
                          index < 0 ||
                          index >= points.length) {
                        return const SizedBox.shrink();
                      }
                      final monday = points[index].monday;
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '${monday.day}.${monday.month}',
                          style: TextStyle(color: pal.textMuted, fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                bar(setSpots, kProgressChartRepsColor),
                bar(tonSpots, kProgressChartVolumeColor),
              ],
            ),
            duration: const Duration(milliseconds: 200),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 18,
          runSpacing: 6,
          children: [
            _LoadTrendLegendItem(
              color: kProgressChartRepsColor,
              label: l.loadSetsShort,
            ),
            _LoadTrendLegendItem(
              color: kProgressChartVolumeColor,
              label: l.loadTonnageShort,
            ),
          ],
        ),
      ],
    );
  }
}

class _LoadTrendLegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LoadTrendLegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: pal.chartLegendBorder),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: pal.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
