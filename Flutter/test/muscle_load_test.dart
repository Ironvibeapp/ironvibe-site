import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:fitness_app/main.dart';

void main() {
  late List<WorkoutLog> savedHistory;
  late Map<String, IronVibeMuscleGroup> savedGroups;

  setUp(() {
    savedHistory = List.of(workoutHistory);
    savedGroups = Map<String, IronVibeMuscleGroup>.of(
      ironVibeExerciseMuscleGroups,
    );
    workoutHistory = [];
    ironVibeExerciseMuscleGroups = {};
  });

  tearDown(() {
    workoutHistory
      ..clear()
      ..addAll(savedHistory);
    ironVibeExerciseMuscleGroups
      ..clear()
      ..addAll(savedGroups);
  });

  test('glute and calf ids round-trip', () {
    expect(ironVibeMuscleGroupFromId('glute'), IronVibeMuscleGroup.glute);
    expect(ironVibeMuscleGroupFromId('calf'), IronVibeMuscleGroup.calf);
    expect(kIronVibeLoadMuscleGroups, hasLength(10));
    expect(
      kIronVibeLoadMuscleGroups,
      containsAll([IronVibeMuscleGroup.glute, IronVibeMuscleGroup.calf]),
    );
  });

  test('only sets with a real RIR count toward load', () {
    expect(ironVibeSetCountsTowardMuscleLoad(SetLog('20', '10', '2')), isTrue);
    expect(ironVibeSetCountsTowardMuscleLoad(SetLog('20', '10', '0')), isTrue);
    expect(ironVibeSetCountsTowardMuscleLoad(SetLog('20', '10', '')), isFalse);
    expect(ironVibeSetCountsTowardMuscleLoad(SetLog('20', '10', '—')), isFalse);
    expect(ironVibeSetCountsTowardMuscleLoad(SetLog('20', '10', '∞')), isFalse);
    expect(
      ironVibeSetCountsTowardMuscleLoad(SetLog('20', '10', 'infinity')),
      isFalse,
    );
    expect(
      ironVibeSetCountsTowardMuscleLoad(
        SetLog('', '', '', isCardio: true, duration: '10', intensity: '3'),
      ),
      isFalse,
    );
  });

  test('weekly average is the last 28 days divided by four', () {
    final now = DateTime(2026, 11, 7, 18);
    ironVibeExerciseMuscleGroups['CURL'] = IronVibeMuscleGroup.armFlex;
    ironVibeExerciseMuscleGroups['SQUAT'] = IronVibeMuscleGroup.quad;
    ironVibeExerciseMuscleGroups['HIP THRUST'] = IronVibeMuscleGroup.glute;
    ironVibeExerciseMuscleGroups['CALF RAISE'] = IronVibeMuscleGroup.calf;
    ironVibeExerciseMuscleGroups['WALK'] = IronVibeMuscleGroup.skip;
    ironVibeExerciseMuscleGroups['ROW'] = IronVibeMuscleGroup.back;

    workoutHistory.addAll([
      WorkoutLog(DateTime(2026, 10, 11), [
        ExerciseLog('CURL', [SetLog('20', '10', '2')]),
      ]),
      WorkoutLog(DateTime(2026, 10, 10, 23), [
        ExerciseLog('CURL', [SetLog('20', '10', '2')]),
      ]),
      WorkoutLog(DateTime(2026, 11, 8), [
        ExerciseLog('CURL', [SetLog('100', '10', '1')]),
      ]),
      WorkoutLog(now, [
        ExerciseLog('CURL', [
          SetLog('20', '10', '1'),
          SetLog('20', '10', '2'),
          SetLog('20', '10', ''),
          SetLog('20', '10', '∞'),
          SetLog('20,5', '8', '3'),
          SetLog('', '12', '2'),
          SetLog('40', '0', '1'),
        ]),
        ExerciseLog('SQUAT', [SetLog('100', '5', '2'), SetLog('60', '5', '')]),
        ExerciseLog('HIP THRUST', [SetLog('80', '8', '2')]),
        ExerciseLog('CALF RAISE', [SetLog('40', '12', '1')]),
        ExerciseLog('WALK', [SetLog('20', '10', '2')]),
        ExerciseLog('UNKNOWN', [SetLog('20', '10', '2')]),
        ExerciseLog('RUN', [
          SetLog('', '', '', isCardio: true, duration: '20', intensity: '3'),
        ], isCardio: true),
        ExerciseLog('ROW', [
          SetLog('50', '8', '2', isCardio: true, duration: '1', intensity: '1'),
        ]),
      ]),
    ]);

    final snap = ironVibeComputeMuscleLoad(workoutHistory, now: now);
    final curl = snap.loadFor(IronVibeMuscleGroup.armFlex);
    // Oct 11 counts. Oct 10 and Nov 8 do not.
    // Today: two plain sets, one comma-weight set, one bodyweight set, one
    // zero-rep set. Empty RIR, ∞, and the out-of-window sets stay out.
    expect(curl.sets, 1 + 5);
    expect(curl.setsPerWeek, 1.5);
    // 20*10 + 20*10 + 20*10 + 20.5*8 + 12 reps without weight + 40*0.
    expect(curl.tonnage, 20 * 10 * 3 + 20.5 * 8);
    expect(curl.tonnagePerWeek, curl.tonnage / 4);

    expect(snap.loadFor(IronVibeMuscleGroup.quad).sets, 1);
    expect(snap.loadFor(IronVibeMuscleGroup.quad).tonnage, 500);
    expect(snap.loadFor(IronVibeMuscleGroup.glute).setsPerWeek, 0.25);
    expect(snap.loadFor(IronVibeMuscleGroup.glute).tonnagePerWeek, 160);
    expect(snap.loadFor(IronVibeMuscleGroup.calf).sets, 1);
    expect(snap.loadFor(IronVibeMuscleGroup.back).sets, 0);
    expect(snap.loadFor(IronVibeMuscleGroup.chest).sets, 0);
    expect(snap.loadFor(IronVibeMuscleGroup.skip).sets, 0);
  });

  test('empty history still reports every group', () {
    final snap = ironVibeComputeMuscleLoad(
      const [],
      now: DateTime(2026, 11, 7),
    );
    expect(snap.byGroup.length, 10);
    for (final group in kIronVibeLoadMuscleGroups) {
      expect(snap.loadFor(group).sets, 0);
      expect(snap.loadFor(group).tonnagePerWeek, 0);
    }
  });

  testWidgets('load screen shows weekly sets and tonnage on the plate', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    ironVibeExerciseMuscleGroups['CURL'] = IronVibeMuscleGroup.armFlex;
    workoutHistory.add(
      WorkoutLog(DateTime.now(), [
        ExerciseLog('CURL', [
          for (var i = 0; i < 8; i++) SetLog('20', '10', '2'),
          SetLog('20', '10', ''),
          SetLog('20', '10', '∞'),
        ]),
      ]),
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ironVibeBuildTheme(Brightness.dark),
        home: const MuscleLoadScreen(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Muscle load'), findsOneWidget);
    expect(find.text('Biceps'), findsOneWidget);
    expect(find.text('Glutes'), findsOneWidget);
    expect(find.text('Calves'), findsOneWidget);
    expect(find.text('2 · 400'), findsOneWidget);
    expect(find.text('0 · —'), findsWidgets);
    expect(find.textContaining('28'), findsOneWidget);
    expect(find.textContaining('∞'), findsOneWidget);

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ru'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ironVibeBuildTheme(Brightness.dark),
        home: const MuscleLoadScreen(),
      ),
    );
    tester.view.physicalSize = const Size(360, 640);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    expect(find.text('Нагрузка'), findsOneWidget);
    expect(find.text('Бицепс'), findsOneWidget);
    expect(find.text('Ягодицы'), findsOneWidget);
    expect(find.text('2 · 400'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('athlete home puts the load plate beside rhythm', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final today = DateTime.now();
    for (var i = 0; i < 3; i++) {
      workoutHistory.add(
        WorkoutLog(today.subtract(Duration(days: i)), [
          ExerciseLog('SQUAT', [SetLog('100', '5', '2')]),
        ]),
      );
    }
    ironVibeExerciseMuscleGroups['SQUAT'] = IronVibeMuscleGroup.quad;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ironVibeBuildTheme(Brightness.dark),
        home: const AthleteScreen(),
      ),
    );
    await tester.pumpAndSettle();

    final rhythm = find.byType(IronVibeRhythmCard);
    final load = find.byType(IronVibeMuscleLoadCard);
    expect(rhythm, findsOneWidget);
    expect(load, findsOneWidget);
    final rhythmBox = tester.getRect(rhythm);
    final loadBox = tester.getRect(load);
    expect(loadBox.left, greaterThan(rhythmBox.left));
    expect((loadBox.center.dy - rhythmBox.center.dy).abs(), lessThan(12));
    expect(tester.takeException(), isNull);

    await tester.tap(load);
    await tester.pumpAndSettle();
    expect(find.text('Muscle load'), findsOneWidget);
    expect(find.text('Front thigh'), findsOneWidget);
    expect(find.textContaining('0.75'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test('trend keeps a mark for every week, including empty ones', () {
    final now = DateTime(2026, 11, 7);
    ironVibeExerciseMuscleGroups['CURL'] = IronVibeMuscleGroup.armFlex;
    ironVibeExerciseMuscleGroups['SQUAT'] = IronVibeMuscleGroup.quad;
    final history = [
      WorkoutLog(DateTime(2026, 10, 12), [
        ExerciseLog('CURL', [SetLog('20', '10', '2'), SetLog('20', '10', '')]),
      ]),
      WorkoutLog(DateTime(2026, 10, 18), [
        ExerciseLog('CURL', [SetLog('20', '8', '1')]),
      ]),
      WorkoutLog(DateTime(2026, 11, 3), [
        ExerciseLog('CURL', [SetLog('22', '10', '2')]),
        ExerciseLog('SQUAT', [SetLog('100', '5', '2')]),
      ]),
      WorkoutLog(DateTime(2026, 11, 9), [
        ExerciseLog('CURL', [SetLog('30', '10', '1')]),
      ]),
    ];

    expect(
      ironVibeLoadWeekMonday(DateTime(2026, 10, 18)),
      DateTime(2026, 10, 12),
    );

    final all = ironVibeMuscleLoadTrend(
      history,
      group: IronVibeMuscleGroup.armFlex,
      now: now,
    );
    expect(all.map((p) => p.monday), [
      DateTime(2026, 10, 12),
      DateTime(2026, 10, 19),
      DateTime(2026, 10, 26),
      DateTime(2026, 11, 2),
    ]);
    expect(all[0].sets, 2);
    expect(all[0].tonnage, 20 * 10 + 20 * 8);
    expect(all[1].sets, 0);
    expect(all[1].tonnage, 0);
    expect(all[3].sets, 1);
    expect(all[3].tonnage, 220);

    final month = ironVibeMuscleLoadTrend(
      history,
      group: IronVibeMuscleGroup.armFlex,
      span: IronVibeMuscleLoadTrendSpan.month,
      now: now,
    );
    expect(month.first.monday, ironVibeLoadWeekMonday(DateTime(2026, 11, 1)));
    expect(month.last.monday, ironVibeLoadWeekMonday(now));
    expect(month.map((p) => p.sets), [0, 1]);

    final year = ironVibeMuscleLoadTrend(
      history,
      group: IronVibeMuscleGroup.armFlex,
      span: IronVibeMuscleLoadTrendSpan.year,
      now: now,
    );
    expect(year.first.monday, ironVibeLoadWeekMonday(DateTime(2026, 1, 1)));
    expect(year.singleWhere((p) => p.monday == DateTime(2026, 10, 12)).sets, 2);

    final squat = ironVibeMuscleLoadTrend(
      history,
      group: IronVibeMuscleGroup.quad,
      now: now,
    );
    expect(squat, hasLength(1));
    expect(squat.single.sets, 1);
    expect(
      ironVibeMuscleLoadTrend(
        history,
        group: IronVibeMuscleGroup.chest,
        now: now,
      ),
      isEmpty,
    );
  });

  testWidgets('tapping a callout opens the weekly trend', (tester) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    ironVibeExerciseMuscleGroups['CURL'] = IronVibeMuscleGroup.armFlex;
    workoutHistory.add(
      WorkoutLog(DateTime.now().subtract(const Duration(days: 10)), [
        ExerciseLog('CURL', [SetLog('20', '8', '2')]),
      ]),
    );
    workoutHistory.add(
      WorkoutLog(DateTime.now(), [
        ExerciseLog('CURL', [SetLog('22', '8', '1')]),
      ]),
    );

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ironVibeBuildTheme(Brightness.dark),
        home: const MuscleLoadScreen(),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    await tester.tap(find.text('Biceps'));
    await tester.pumpAndSettle();

    expect(
      find.text('Each mark is one calendar week: working sets and tonnage.'),
      findsOneWidget,
    );
    expect(find.text('Month'), findsOneWidget);
    expect(find.text('All time'), findsOneWidget);
    expect(tester.takeException(), isNull);

    Navigator.of(
      tester.element(
        find.text('Each mark is one calendar week: working sets and tonnage.'),
      ),
    ).pop();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Glutes'));
    await tester.pumpAndSettle();
    expect(find.text('No entries'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
