import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:fitness_app/main.dart';

void main() {
  late List<WorkoutLog> savedHistory;
  late List<TrainerSession> savedSchedule;
  late List<Client> savedClients;
  late List<String> savedBank;
  late ActiveWorkoutDraft? savedDraft;

  setUp(() {
    savedHistory = List.of(workoutHistory);
    savedSchedule = List.of(trainerSchedule);
    savedClients = List.of(clients);
    savedBank = List.of(exerciseBank);
    savedDraft = activeWorkoutDraft;
    workoutHistory = [];
    trainerSchedule = [];
    clients = [];
    exerciseBank = [];
    activeWorkoutDraft = null;
  });

  tearDown(() {
    workoutHistory = savedHistory;
    trainerSchedule = savedSchedule;
    clients = savedClients;
    exerciseBank = savedBank;
    activeWorkoutDraft = savedDraft;
  });

  testWidgets('client workout keeps a space in a new exercise name', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final session = TrainerSession(
      DateTime(2026, 9, 26, 12),
      'Маша',
      '',
      id: 'client-space',
      isLiveCurrent: true,
    );

    await _pumpScreen(
      tester,
      TrainerWorkoutSessionScreen(session: session),
    );
    await _addExercise(tester);

    await _enterExerciseName(tester, 'становая ');
    expect(_exerciseName(tester), 'СТАНОВАЯ ');

    await _enterExerciseName(tester, 'становая тяга');
    expect(_exerciseName(tester), 'СТАНОВАЯ ТЯГА');
  });

  testWidgets('personal workout keeps a space in a new exercise name', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await _pumpScreen(tester, const WorkoutSessionScreen());
    await _addExercise(tester);

    await _enterExerciseName(tester, 'становая ');
    expect(_exerciseName(tester), 'СТАНОВАЯ ');

    await _enterExerciseName(tester, 'жим лежа');
    expect(_exerciseName(tester), 'ЖИМ ЛЕЖА');
  });
}

Future<void> _pumpScreen(WidgetTester tester, Widget home) async {
  await tester.pumpWidget(
    MaterialApp(
      locale: const Locale('ru'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ironVibeBuildTheme(Brightness.dark),
      home: home,
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
}

Future<void> _addExercise(WidgetTester tester) async {
  final add = find.text('Добавить упражнение');
  await tester.ensureVisible(add);
  await tester.tap(add);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
  expect(_nameField, findsOneWidget);
}

Future<void> _enterExerciseName(WidgetTester tester, String text) async {
  await tester.ensureVisible(_nameField);
  await tester.enterText(_nameField, text);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 50));
}

Finder get _nameField => find.byWidgetPredicate((widget) {
  if (widget is! TextField) return false;
  return widget.decoration?.hintText == 'Введите название упражнения';
});

String _exerciseName(WidgetTester tester) {
  return tester.widget<TextField>(_nameField).controller!.text;
}
