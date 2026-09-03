import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:fitness_app/main.dart';

IronVibeRhythmSnapshot _snap({
  required double daysPerWeek,
  bool hasGauge = true,
  bool? deloadIndicated,
  double? deloadEveryWeeks,
  double accumulationWeeks = 0,
  bool recentDeload = false,
}) {
  final indicated = deloadIndicated ?? daysPerWeek >= 2.5;
  return IronVibeRhythmSnapshot(
    daysPerWeek: daysPerWeek,
    daysInWindow: (daysPerWeek * 4).round(),
    hasGauge: hasGauge,
    deloadIndicated: indicated,
    deloadEveryWeeks: indicated
        ? (deloadEveryWeeks ?? ironVibeDeloadIntervalWeeks(daysPerWeek))
        : null,
    accumulationWeeks: accumulationWeeks,
    recentDeload: recentDeload,
  );
}

WorkoutLog _strengthDay(DateTime date) {
  return WorkoutLog(date, [
    ExerciseLog('Squat', [SetLog('100', '5', '1')]),
  ]);
}

void main() {
  late List<WorkoutLog> savedHistory;
  late List<TrainerSession> savedSchedule;

  setUp(() {
    savedHistory = List.of(workoutHistory);
    savedSchedule = List.of(trainerSchedule);
  });

  tearDown(() {
    workoutHistory = savedHistory;
    trainerSchedule = savedSchedule;
  });

  test('advice bands follow density thresholds', () {
    expect(
      ironVibeRhythmAdviceBand(_snap(daysPerWeek: 2.0)),
      IronVibeRhythmAdviceBand.light,
    );
    expect(
      ironVibeRhythmAdviceBand(_snap(daysPerWeek: 2.4)),
      IronVibeRhythmAdviceBand.light,
    );
    expect(
      ironVibeRhythmAdviceBand(_snap(daysPerWeek: 3.2)),
      IronVibeRhythmAdviceBand.steady,
    );
    expect(
      ironVibeRhythmAdviceBand(_snap(daysPerWeek: 4.8)),
      IronVibeRhythmAdviceBand.dense,
    );
    expect(
      ironVibeRhythmAdviceBand(_snap(daysPerWeek: 4.9)),
      IronVibeRhythmAdviceBand.dense,
    );
    expect(
      ironVibeRhythmAdviceBand(_snap(daysPerWeek: 5.0)),
      IronVibeRhythmAdviceBand.veryDense,
    );
    expect(
      ironVibeRhythmAdviceBand(_snap(daysPerWeek: 5.5)),
      IronVibeRhythmAdviceBand.veryDense,
    );
    expect(
      ironVibeRhythmAdviceBand(_snap(daysPerWeek: 6.0)),
      IronVibeRhythmAdviceBand.veryDense,
    );
  });

  test('client rhythm history uses only that client completed sessions', () {
    final now = DateTime.now();
    workoutHistory = [_strengthDay(now.subtract(const Duration(days: 1)))];
    trainerSchedule = [
      TrainerSession(
        now.subtract(const Duration(days: 2)),
        'Ada',
        '',
        exercises: [
          ExerciseLog('Bench', [SetLog('60', '8', '2')]),
        ],
        isCompleted: true,
      ),
      TrainerSession(
        now.subtract(const Duration(days: 3)),
        'Bea',
        '',
        exercises: [
          ExerciseLog('Deadlift', [SetLog('120', '3', '1')]),
        ],
        isCompleted: true,
      ),
      TrainerSession(
        now.subtract(const Duration(days: 4)),
        'Ada',
        '',
        exercises: [
          ExerciseLog('Press', [SetLog('40', '10', '2')]),
        ],
        isCompleted: false,
      ),
    ];

    final ada = ironVibeRhythmHistoryFor(clientName: 'Ada').toList();
    expect(ada, hasLength(1));
    expect(ada.single.exercises.single.name, 'Bench');

    final self = ironVibeRhythmHistoryFor().toList();
    expect(self, hasLength(1));
    expect(self.single.exercises.single.name, 'Squat');
  });

  test('rhythm gauge color densifies toward rust with no mid plateau', () {
    final c1 = ironVibeRhythmZoneColor(1.0);
    final c2 = ironVibeRhythmZoneColor(2.0);
    final c3 = ironVibeRhythmZoneColor(3.0);
    final c4 = ironVibeRhythmZoneColor(4.0);
    final c6 = ironVibeRhythmZoneColor(6.0);

    expect(c2, isNot(c4));
    expect(c3, isNot(c4));
    expect(c3, kIronVibeAccent);
    expect(c6, kIronVibeRhythmRustDeep);
    expect(c6.computeLuminance(), lessThan(c3.computeLuminance()));
    expect(c6.computeLuminance(), lessThan(c4.computeLuminance()));
    expect(c6.g, lessThan(c3.g));
    expect(c1, isNot(c2));
  });

  testWidgets('rhythm insight copy uses active recovery week', (tester) async {
    late AppLocalizations en;
    late AppLocalizations ru;
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            en = AppLocalizations.of(context)!;
            return const SizedBox();
          },
        ),
      ),
    );
    expect(en.rhythmInsightWhatTitle, 'Active recovery week');
    expect(en.rhythmInsightDisclaimer, contains('reference note'));
    expect(en.rhythmInsightPraiseSteady, contains('Well done'));
    expect(en.rhythmInsightPraiseDense, contains('dedicated'));
    expect(en.rhythmInsightPraiseVeryDense, contains('secret'));
    expect(en.deloadNudgeTitle, 'An active recovery week?');

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ru'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            ru = AppLocalizations.of(context)!;
            return const SizedBox();
          },
        ),
      ),
    );
    expect(ru.rhythmInsightWhatTitle, 'Неделя активного отдыха');
    expect(ru.rhythmInsightDisclaimer, contains('справочная'));
    expect(ru.rhythmInsightPraiseSteady, contains('Молодец'));
    expect(ru.rhythmInsightAdviceSteady, startsWith('Сейчас'));
    expect(ru.deloadNudgeTitle, 'Неделя активного отдыха?');
  });
}
