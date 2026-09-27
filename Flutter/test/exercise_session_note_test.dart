import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitness_app/main.dart';

void main() {
  late List<WorkoutLog> savedHistory;
  late List<TrainerSession> savedSchedule;
  late List<Client> savedClients;
  late List<String> savedBank;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    savedHistory = List.of(workoutHistory);
    savedSchedule = List.of(trainerSchedule);
    savedClients = List.of(clients);
    savedBank = List.of(exerciseBank);
    workoutHistory = [];
    trainerSchedule = [];
    clients = [];
    exerciseBank = [];
  });

  tearDown(() {
    workoutHistory = savedHistory;
    trainerSchedule = savedSchedule;
    clients = savedClients;
    exerciseBank = savedBank;
  });

  ExerciseLog bench(String note) => ExerciseLog('ЖИМ', [SetLog('80', '8', '2')], note: note);

  test('old exercise JSON without a note still loads', () {
    final log = ExerciseLog.fromJson({
      'name': 'жим',
      'isCardio': false,
      'sets': [
        {
          'weight': '80',
          'reps': '8',
          'rir': '2',
          'isCardio': false,
          'duration': '',
          'intensity': '',
        },
      ],
    });
    expect(log.name, 'ЖИМ');
    expect(log.note, '');
    expect(log.sets.single.weight, '80');
    expect(log.sets.single.reps, '8');
    expect(log.sets.single.rir, '2');
    expect(log.toJson().containsKey('note'), isFalse);
  });

  test('a saved note round-trips in JSON and shows as dd.MM.yy — text', () {
    final workout = WorkoutLog(DateTime(2025, 1, 17, 18, 30), [
      bench('короткая амплитуда'),
    ], id: 'w1');
    final restored = WorkoutLog.fromJson(workout.toJson());
    expect(restored.date, DateTime(2025, 1, 17, 18, 30));
    expect(restored.exercises.single.note, 'короткая амплитуда');
    expect(restored.exercises.single.sets.single.weight, '80');
    expect(restored.exercises.single.sets.single.reps, '8');
    expect(restored.exercises.single.sets.single.rir, '2');

    workoutHistory = [restored];
    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'жим'), [
      '17.01.25 — короткая амплитуда',
    ]);
  });

  test('a second workout adds a line and does not erase the first', () {
    final first = WorkoutLog(DateTime(2025, 1, 17), [bench('короткая амплитуда')]);
    workoutHistory = [first];
    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'ЖИМ'), [
      '17.01.25 — короткая амплитуда',
    ]);

    workoutHistory.add(
      WorkoutLog(DateTime(2025, 3, 25), [
        ExerciseLog('ЖИМ', [SetLog('75', '8', '1')], note: 'полная амплитуда'),
      ]),
    );
    workoutHistory.add(
      WorkoutLog(DateTime(2025, 8, 11), [
        ExerciseLog('ЖИМ', [SetLog('90', '5', '1')], note: 'амплитуда до максимума'),
      ]),
    );
    workoutHistory.add(
      WorkoutLog(DateTime(2025, 5, 2), [
        ExerciseLog('ЖИМ', [SetLog('85', '6', '1')], note: '   '),
        ExerciseLog('ПРИСЕД', [SetLog('100', '5', '2')], note: 'другая'),
      ]),
    );

    expect(first.exercises.single.note, 'короткая амплитуда');
    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'ЖИМ'), [
      '17.01.25 — короткая амплитуда',
      '25.03.25 — полная амплитуда',
      '11.08.25 — амплитуда до максимума',
    ]);
    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'ЖИМ', excludeWorkout: first), [
      '25.03.25 — полная амплитуда',
      '11.08.25 — амплитуда до максимума',
    ]);
  });

  test('editing the note keeps that session date and the logged set', () {
    final workout = WorkoutLog(DateTime(2025, 1, 17), [bench('короткая амплитуда')]);
    workoutHistory = [workout];
    ironVibeSetExerciseNoteAt(workout.exercises, 0, 'полная амплитуда');
    expect(workout.date, DateTime(2025, 1, 17));
    expect(workout.exercises.single.note, 'полная амплитуда');
    expect(workout.exercises.single.sets.single.weight, '80');
    expect(workout.exercises.single.sets.single.reps, '8');
    expect(workout.exercises.single.sets.single.rir, '2');
    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'ЖИМ'), ['17.01.25 — полная амплитуда']);

    ironVibeSetExerciseNoteAt(workout.exercises, 0, '  ');
    expect(workout.exercises.single.note, '');
    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'ЖИМ'), isEmpty);
  });

  test('a client note stays out of personal history and other clients', () {
    workoutHistory = [
      WorkoutLog(DateTime(2025, 1, 17), [bench('личная')]),
    ];
    final anna = TrainerSession(
      DateTime(2025, 3, 25),
      'Анна',
      'whole session',
      exercises: [
        ExerciseLog('ЖИМ', [SetLog('40', '10', '2')], note: 'клиент анна'),
      ],
      id: 'anna-1',
      clientId: 'client-anna',
      isCompleted: true,
    );
    final boris = TrainerSession(
      DateTime(2025, 8, 11),
      'Борис',
      '',
      exercises: [
        ExerciseLog('ЖИМ', [SetLog('50', '8', '1')], note: 'клиент борис'),
      ],
      id: 'boris-1',
      clientId: 'client-boris',
      isCompleted: true,
    );
    final annaPlan = TrainerSession(
      DateTime(2025, 9, 1),
      'Анна',
      '',
      exercises: [
        ExerciseLog('ЖИМ', [SetLog('', '', '')], note: 'ещё не было'),
      ],
      id: 'anna-plan',
      clientId: 'client-anna',
      isCompleted: false,
      isScheduledPlan: true,
    );
    trainerSchedule = [anna, boris, annaPlan];

    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'ЖИМ'), ['17.01.25 — личная']);
    expect(
      ironVibeExerciseSessionNoteLines(
        exerciseName: 'ЖИМ',
        clientName: 'Анна',
        clientId: 'client-anna',
      ),
      ['25.03.25 — клиент анна'],
    );
    expect(
      ironVibeExerciseSessionNoteLines(
        exerciseName: 'ЖИМ',
        clientName: 'Борис',
        clientId: 'client-boris',
      ),
      ['11.08.25 — клиент борис'],
    );
    expect(anna.note, 'whole session');
    expect(
      ironVibeExerciseSessionNoteLines(
        exerciseName: 'ЖИМ',
        clientName: 'Анна',
        clientId: 'client-anna',
        excludeSession: anna,
      ),
      isEmpty,
    );
  });

  test('rename keeps the note on the log', () {
    workoutHistory = [
      WorkoutLog(DateTime(2025, 1, 17), [bench('короткая амплитуда')], id: 'w1'),
    ];
    exerciseBank = ['ЖИМ'];

    ironVibeRenameExercise('ЖИМ', 'ЖИМ ЛЕЖА');

    final log = workoutHistory.single.exercises.single;
    expect(log.name, 'ЖИМ ЛЕЖА');
    expect(log.note, 'короткая амплитуда');
    expect(log.sets.single.weight, '80');
    expect(log.sets.single.reps, '8');
    expect(log.sets.single.rir, '2');
    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'ЖИМ ЛЕЖА'), [
      '17.01.25 — короткая амплитуда',
    ]);
    expect(ironVibeExerciseSessionNoteLines(exerciseName: 'ЖИМ'), isEmpty);

    final merged = ironVibeRenameExerciseLogs(
      [
        ExerciseLog('ЖИМ', [SetLog('60', '10', '2')], note: 'первая'),
        ExerciseLog('ЖИМ ЛЕЖА', [SetLog('100', '3', '1')], note: 'вторая'),
      ],
      'ЖИМ',
      'ЖИМ ЛЕЖА',
    );
    expect(merged, hasLength(1));
    expect(merged.single.note, 'первая\nвторая');
    expect(merged.single.sets.map((s) => s.weight), ['60', '100']);
  });

  test('session draft keeps the note and a new workout does not copy the last one', () {
    final logged = bench('короткая амплитуда');
    final editing = ironVibeExerciseDataFromLog(logged);
    expect(editing.note, 'короткая амплитуда');
    expect(editing.sets.single.weight.text, '80');
    expect(editing.sets.single.reps.text, '8');

    final fresh = ironVibeExerciseDataFromPreviousAsHints(logged);
    expect(fresh.note, '');

    final restored = ironVibeExerciseDataFromDraftJson(ironVibeExerciseDataToDraftJson(editing));
    expect(restored.note, 'короткая амплитуда');
    expect(restored.sets.single.weight.text, '80');
    expect(restored.sets.single.reps.text, '8');
    expect(restored.sets.single.rir.text, '2');

    final saved = ExerciseLog(normalizeExerciseName(restored.nameController.text), [
      SetLog(
        restored.sets.single.weight.text,
        restored.sets.single.reps.text,
        restored.sets.single.rir.text,
      ),
    ], note: restored.note);
    expect(saved.note, 'короткая амплитуда');
    expect(saved.toJson()['note'], 'короткая амплитуда');
    expect(saved.sets.single.rir, '2');
  });
}
