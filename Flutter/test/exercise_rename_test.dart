import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:fitness_app/main.dart';

void main() {
  late List<WorkoutLog> savedHistory;
  late List<TrainerSession> savedSchedule;
  late List<Client> savedClients;
  late List<String> savedBank;
  late List<String> savedFavorites;
  late Map<String, IronVibeMuscleGroup> savedGroups;
  late ActiveWorkoutDraft? savedDraft;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    savedHistory = List.of(workoutHistory);
    savedSchedule = List.of(trainerSchedule);
    savedClients = List.of(clients);
    savedBank = List.of(exerciseBank);
    savedFavorites = List.of(ironVibeAthleteFavoriteExercises);
    savedGroups = Map<String, IronVibeMuscleGroup>.of(
      ironVibeExerciseMuscleGroups,
    );
    savedDraft = activeWorkoutDraft;
    workoutHistory = [];
    trainerSchedule = [];
    clients = [];
    exerciseBank = [];
    ironVibeAthleteFavoriteExercises = [];
    ironVibeExerciseMuscleGroups = {};
    activeWorkoutDraft = null;
  });

  tearDown(() {
    workoutHistory = savedHistory;
    trainerSchedule = savedSchedule;
    clients = savedClients;
    exerciseBank = savedBank;
    ironVibeAthleteFavoriteExercises = savedFavorites;
    ironVibeExerciseMuscleGroups = savedGroups;
    activeWorkoutDraft = savedDraft;
  });

  test('formatter keeps spaces while typing and save normalizes', () {
    final midWord = ironVibeFormatExerciseNameEdit(
      TextEditingValue.empty,
      const TextEditingValue(
        text: 'становая ',
        selection: TextSelection.collapsed(offset: 9),
      ),
    );
    expect(midWord.text, 'СТАНОВАЯ ');
    expect(normalizeExerciseName('  становая тяга  '), 'СТАНОВАЯ ТЯГА');
  });

  test('renaming ЖИМ to ЖИМ ЛЕЖА moves the same history', () {
    final date = DateTime(2026, 4, 1, 18, 30);
    workoutHistory = [
      WorkoutLog(date, [
        ExerciseLog('ЖИМ', [SetLog('80', '8', '2'), SetLog('70', '10', '1')]),
      ], id: 'w1'),
    ];
    exerciseBank = ['ЖИМ'];
    ironVibeAthleteFavoriteExercises = ['ЖИМ'];
    ironVibeExerciseMuscleGroups['ЖИМ'] = IronVibeMuscleGroup.chest;
    activeWorkoutDraft = ActiveWorkoutDraft(
      kind: ActiveWorkoutDraftKind.personal,
      isCardio: false,
      exercisesJson: [
        {'name': 'ЖИМ', 'isCardio': false, 'sets': []},
      ],
      savedAt: date,
    );

    ironVibeRenameExercise('  жим ', 'жим лежа');

    final rows = ironVibePersonalProgressRows();
    expect(rows.map((r) => r.name).toList(), ['ЖИМ ЛЕЖА']);
    expect(rows.single.bestWeight, 80);
    expect(rows.single.bestReps, 8);
    final log = workoutHistory.single;
    expect(log.date, date);
    expect(log.id, 'w1');
    expect(log.exercises, hasLength(1));
    expect(log.exercises.single.name, 'ЖИМ ЛЕЖА');
    expect(log.exercises.single.sets.map((s) => '${s.weight}x${s.reps}'), [
      '80x8',
      '70x10',
    ]);
    expect(exerciseBank, ['ЖИМ ЛЕЖА']);
    expect(ironVibeAthleteFavoriteExercises, ['ЖИМ ЛЕЖА']);
    expect(
      ironVibeExerciseMuscleGroups[normalizeExerciseName('жим лежа')],
      IronVibeMuscleGroup.chest,
    );
    expect(ironVibeExerciseMuscleGroups.containsKey('ЖИМ'), isFalse);
    expect(activeWorkoutDraft!.exercisesJson.single['name'], 'ЖИМ ЛЕЖА');
  });

  test('renaming onto an existing exercise leaves one progress row', () {
    workoutHistory = [
      WorkoutLog(DateTime(2026, 4, 1), [
        ExerciseLog('ЖИМ', [SetLog('80', '8', '2')]),
        ExerciseLog('ПРИСЕД', [SetLog('100', '5', '2')]),
      ], id: 'w1'),
      WorkoutLog(DateTime(2026, 4, 8), [
        ExerciseLog('ЖИМ ЛЕЖА', [SetLog('90', '5', '1')]),
      ], id: 'w2'),
      WorkoutLog(DateTime(2026, 5, 1), [
        ExerciseLog('ЖИМ ЛЕЖА', [SetLog('85', '6', '1')]),
        ExerciseLog('ЖИМ ЛЕЖА', [SetLog('75', '8', '2')]),
      ], id: 'untouched-dupes'),
    ];
    exerciseBank = ['ЖИМ', 'ЖИМ ЛЕЖА', 'ПРИСЕД'];
    ironVibeExerciseMuscleGroups['ЖИМ'] = IronVibeMuscleGroup.shoulders;
    ironVibeExerciseMuscleGroups['ЖИМ ЛЕЖА'] = IronVibeMuscleGroup.chest;

    ironVibeRenameExercise('ЖИМ', 'ЖИМ ЛЕЖА');

    final rows = ironVibePersonalProgressRows();
    expect(rows.where((r) => r.name == 'ЖИМ'), isEmpty);
    expect(rows.where((r) => r.name == 'ЖИМ ЛЕЖА'), hasLength(1));
    expect(rows.singleWhere((r) => r.name == 'ЖИМ ЛЕЖА').bestWeight, 90);
    expect(rows.singleWhere((r) => r.name == 'ЖИМ ЛЕЖА').bestReps, 5);

    final first = workoutHistory[0];
    expect(first.exercises.map((e) => e.name).toList(), ['ЖИМ ЛЕЖА', 'ПРИСЕД']);
    expect(first.exercises.first.sets.single.weight, '80');
    expect(workoutHistory[1].exercises.single.name, 'ЖИМ ЛЕЖА');
    expect(workoutHistory[1].exercises.single.sets.single.weight, '90');
    expect(workoutHistory[1].date, DateTime(2026, 4, 8));
    final dupes = workoutHistory.singleWhere((w) => w.id == 'untouched-dupes');
    expect(dupes.exercises, hasLength(2));
    expect(dupes.exercises.map((e) => e.name), ['ЖИМ ЛЕЖА', 'ЖИМ ЛЕЖА']);

    final sameSession = WorkoutLog(DateTime(2026, 6, 1), [
      ExerciseLog('ЖИМ', [SetLog('60', '10', '2')]),
      ExerciseLog('ЖИМ ЛЕЖА', [SetLog('100', '3', '1')]),
    ], id: 'same');
    workoutHistory = [sameSession];
    exerciseBank = ['ЖИМ', 'ЖИМ ЛЕЖА'];
    ironVibeRenameExercise('ЖИМ', 'ЖИМ ЛЕЖА');
    expect(ironVibePersonalProgressRows().map((r) => r.name), ['ЖИМ ЛЕЖА']);
    expect(workoutHistory.single.exercises, hasLength(1));
    expect(workoutHistory.single.exercises.single.name, 'ЖИМ ЛЕЖА');
    expect(
      workoutHistory.single.exercises.single.sets.map((s) => s.weight),
      ['60', '100'],
    );
    expect(
      exerciseBank.where((e) => normalizeExerciseName(e) == 'ЖИМ'),
      isEmpty,
    );
    expect(
      ironVibeExerciseMuscleGroups['ЖИМ ЛЕЖА'],
      IronVibeMuscleGroup.chest,
    );
  });

  testWidgets('progress list rename replaces ЖИМ with ЖИМ ЛЕЖА', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(800, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    workoutHistory = [
      WorkoutLog(DateTime(2026, 4, 1), [
        ExerciseLog('ЖИМ', [SetLog('80', '8', '2')]),
      ], id: 'w1'),
    ];
    exerciseBank = ['ЖИМ'];

    await tester.pumpWidget(
      MaterialApp(
        theme: ironVibeBuildTheme(Brightness.dark),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: const PersonalProgressScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('ЖИМ'), findsOneWidget);
    expect(find.text('ЖИМ ЛЕЖА'), findsNothing);

    await tester.tap(find.byTooltip('Rename exercise'));
    await tester.pumpAndSettle();

    final dialogField = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byType(TextField),
    );
    await tester.enterText(dialogField, 'жим лежа');
    await tester.pump();
    expect(
      tester.widget<TextField>(dialogField).controller!.text,
      'ЖИМ ЛЕЖА',
    );

    await tester.tap(find.widgetWithText(TextButton, 'Save'));
    await tester.pumpAndSettle();

    expect(find.text('ЖИМ'), findsNothing);
    expect(find.text('ЖИМ ЛЕЖА'), findsOneWidget);
    expect(workoutHistory.single.exercises.single.name, 'ЖИМ ЛЕЖА');
    expect(workoutHistory.single.exercises.single.sets.single.weight, '80');
    expect(workoutHistory.single.exercises.single.sets.single.reps, '8');
    expect(ironVibePersonalProgressRows().map((r) => r.name), ['ЖИМ ЛЕЖА']);
  });
}
