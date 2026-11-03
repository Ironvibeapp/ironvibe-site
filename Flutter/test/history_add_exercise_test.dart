import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<WorkoutLog> savedHistory;
  late List<String> savedBank;
  late Map<String, IronVibeMuscleGroup> savedGroups;

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    savedHistory = List.of(workoutHistory);
    savedBank = List.of(exerciseBank);
    savedGroups = Map<String, IronVibeMuscleGroup>.of(
      ironVibeExerciseMuscleGroups,
    );
    workoutHistory = [];
    exerciseBank = [];
    ironVibeExerciseMuscleGroups = {};
  });

  tearDown(() {
    workoutHistory = savedHistory;
    exerciseBank = savedBank;
    ironVibeExerciseMuscleGroups = savedGroups;
  });

  testWidgets('a finished workout can gain an exercise that was left out', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final workout = WorkoutLog(DateTime.now(), [
      ExerciseLog('ЖИМ', [SetLog('60', '8', '2')]),
    ]);
    workoutHistory.add(workout);
    ironVibeExerciseMuscleGroups['ТЯГА БЛОКА'] = IronVibeMuscleGroup.back;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ru'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ironVibeBuildTheme(Brightness.light),
        home: const Scaffold(body: CalendarScreen()),
      ),
    );
    await tester.pump();
    await tester.tap(find.byType(ExpansionTile));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Добавить упражнение'));
    await tester.pumpAndSettle();

    final cards = find.byType(ExerciseCard);
    expect(cards, findsNWidgets(2));
    final fields = find.descendant(
      of: cards.last,
      matching: find.byType(TextField),
    );
    await tester.enterText(fields.at(0), 'тяга блока');
    await tester.pump();
    await tester.enterText(fields.at(1), '40');
    await tester.pump();
    await tester.enterText(fields.at(2), '10');
    await tester.pump();

    expect(workout.exercises, hasLength(2));
    expect(workout.exercises.last.name, 'ТЯГА БЛОКА');
    expect(workout.exercises.last.sets.single.weight, '40');
    expect(workout.exercises.last.sets.single.reps, '10');
    expect(exerciseBank, contains('ТЯГА БЛОКА'));
  });
}
