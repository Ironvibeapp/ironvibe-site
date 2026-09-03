import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/main.dart';

WorkoutLog _athleteDay(DateTime date, {String? id, String exercise = 'Athlete Curl'}) {
  return WorkoutLog(
    date,
    [
      ExerciseLog(exercise, [SetLog('20', '10', '2')]),
    ],
    id: id,
  );
}

void main() {
  late List<WorkoutLog> savedHistory;
  late List<TrainerSession> savedSchedule;
  late List<Client> savedClients;
  late List<String> savedBank;
  late List<String> savedAthleteFavorites;
  late Map<String, IronVibeMuscleGroup> savedMuscleGroups;

  setUp(() {
    savedHistory = List.of(workoutHistory);
    savedSchedule = List.of(trainerSchedule);
    savedClients = List.of(clients);
    savedBank = List.of(exerciseBank);
    savedAthleteFavorites = List.of(ironVibeAthleteFavoriteExercises);
    savedMuscleGroups = Map.of(ironVibeExerciseMuscleGroups);
    workoutHistory = [];
    trainerSchedule = [];
    clients = [];
    exerciseBank = [];
    ironVibeAthleteFavoriteExercises = [];
    ironVibeExerciseMuscleGroups = {};
  });

  tearDown(() {
    workoutHistory = savedHistory;
    trainerSchedule = savedSchedule;
    clients = savedClients;
    exerciseBank = savedBank;
    ironVibeAthleteFavoriteExercises = savedAthleteFavorites;
    ironVibeExerciseMuscleGroups
      ..clear()
      ..addAll(savedMuscleGroups);
  });

  test('client name uniqueness ignores case and trim', () {
    clients.add(Client('Серёжа', ''));
    expect(ironVibeClientNameTaken('серёжа'), isTrue);
    expect(ironVibeClientNameTaken('  СЕРЁЖА  '), isTrue);
    expect(ironVibeClientNameTaken('Наташа'), isFalse);
  });

  test('athlete-only backup is detected, coach backup is not', () {
    expect(
      ironVibeBackupLooksLikeAthleteOnly({
        'version': 1,
        'workoutHistory': [
          _athleteDay(DateTime(2026, 1, 1), id: 'w1').toJson(),
        ],
      }),
      isTrue,
    );
    expect(
      ironVibeBackupLooksLikeAthleteOnly({
        'version': 1,
        'clients': [
          {'name': 'Alex', 'goal': ''},
        ],
        'trainerSchedule': [],
      }),
      isFalse,
    );
    expect(
      ironVibeBackupLooksLikeAthleteOnly({
        'version': 1,
        'workoutHistory': [
          _athleteDay(DateTime(2026, 1, 1), id: 'w1').toJson(),
        ],
        'clients': [
          {'name': 'Alex', 'goal': ''},
        ],
      }),
      isFalse,
    );
  });

  test('import creates a client and imported sessions without touching the bank', () {
    final workouts = [
      _athleteDay(DateTime(2026, 3, 1), id: 'w-a', exercise: 'Weird Curl'),
      _athleteDay(DateTime(2026, 3, 2), id: 'w-b', exercise: 'Weird Press'),
    ];
    exerciseBank.add('SQUAT');

    final outcome = ironVibeImportAthleteHistory(
      workouts: workouts,
      clientName: 'Ivan',
      height: '180',
      weight: '80',
    );

    expect(outcome.status, IronVibeAthleteImportStatus.success);
    expect(outcome.addedSessionCount, 2);
    expect(clients, hasLength(1));
    expect(clients.single.name, 'Ivan');
    expect(clients.single.height, '180');
    expect(clients.single.weight, '80');
    expect(trainerSchedule, hasLength(2));
    expect(trainerSchedule.every((s) => s.isImportedHistory), isTrue);
    expect(trainerSchedule.every((s) => s.isCompleted), isTrue);
    expect(trainerSchedule.every((s) => s.clientName == 'Ivan'), isTrue);
    expect(exerciseBank, ['SQUAT']);

    ironVibeRebuildExerciseBankFromCompletedWorkouts();
    expect(exerciseBank, ['SQUAT']);
    expect(
      ironVibeExerciseNameSuggestions(query: 'weird', clientName: 'Ivan'),
      isEmpty,
    );
    expect(
      ironVibeExerciseNameSuggestions(query: 'sq', clientName: 'Ivan'),
      ['SQUAT'],
    );
    expect(
      trainerSchedule.map((s) => s.exercises.single.name).toSet(),
      {'Weird Curl', 'Weird Press'},
    );
    expect(
      ironVibeCompletedExerciseNames(clientName: 'Ivan'),
      isEmpty,
    );
    expect(
      trainerSchedule.where(ironVibeTrainerSessionCountsAsWork),
      isEmpty,
    );
    expect(
      trainerSchedule.where(ironVibeTrainerSessionIsCompleted),
      hasLength(2),
    );
    expect(ironVibeRhythmHistoryFor(clientName: 'Ivan'), hasLength(2));
  });

  test('import refuses a taken name and does not write sessions', () {
    clients.add(Client('Ivan', ''));
    final outcome = ironVibeImportAthleteHistory(
      workouts: [_athleteDay(DateTime(2026, 3, 1), id: 'w-a')],
      clientName: 'ivan',
    );
    expect(outcome.status, IronVibeAthleteImportStatus.nameTaken);
    expect(trainerSchedule, isEmpty);
    expect(clients, hasLength(1));
  });

  test('re-import without ids is skipped by content fingerprint', () {
    final day = _athleteDay(DateTime(2026, 6, 1), exercise: 'Row');
    expect(day.id, isNull);
    expect(
      ironVibeImportAthleteHistory(workouts: [day], clientName: 'Alex').status,
      IronVibeAthleteImportStatus.success,
    );
    expect(trainerSchedule, hasLength(1));
    expect(
      ironVibeImportAthleteHistory(workouts: [day], clientName: 'Boris').status,
      IronVibeAthleteImportStatus.nothingNew,
    );
    expect(clients, hasLength(1));
    expect(trainerSchedule, hasLength(1));
  });

  test('re-import of the same workout ids adds nothing', () {
    final workouts = [
      _athleteDay(DateTime(2026, 3, 1), id: 'same-id'),
    ];
    expect(
      ironVibeImportAthleteHistory(
        workouts: workouts,
        clientName: 'Ivan',
      ).status,
      IronVibeAthleteImportStatus.success,
    );
    expect(
      ironVibeImportAthleteHistory(
        workouts: workouts,
        clientName: 'Petr',
      ).status,
      IronVibeAthleteImportStatus.nothingNew,
    );
    expect(clients, hasLength(1));
    expect(trainerSchedule, hasLength(1));
  });

  test('coach-owned sessions still count as work and feed suggestions', () {
    clients.add(Client('Ivan', ''));
    trainerSchedule.add(
      TrainerSession(
        DateTime(2026, 4, 1),
        'Ivan',
        '',
        exercises: [
          ExerciseLog('Bench', [SetLog('80', '5', '1')]),
        ],
        id: 'owned',
        isCompleted: true,
      ),
    );
    trainerSchedule.add(
      TrainerSession(
        DateTime(2026, 3, 1),
        'Ivan',
        '',
        exercises: [
          ExerciseLog('Weird Curl', [SetLog('20', '10', '2')]),
        ],
        id: 'imported',
        isCompleted: true,
        isImportedHistory: true,
      ),
    );

    expect(
      trainerSchedule.where(ironVibeTrainerSessionCountsAsWork),
      hasLength(1),
    );
    expect(
      ironVibeCompletedExerciseNames(clientName: 'Ivan'),
      ['BENCH'],
    );
    ironVibeRebuildExerciseBankFromCompletedWorkouts();
    expect(exerciseBank, ['BENCH']);
    expect(
      ironVibeLastRepeatableTrainerSession('Ivan')?.id,
      'owned',
    );
  });

  test('name suggestions use the shared bank even for a new client', () {
    exerciseBank.addAll(['SQUAT', 'BENCH PRESS']);

    expect(
      ironVibeExerciseNameSuggestions(query: 'sq', clientName: 'Ivan'),
      ['SQUAT'],
    );
    expect(
      ironVibeExerciseNameSuggestions(query: 'be'),
      ['BENCH PRESS'],
    );
    expect(
      ironVibeExerciseNameSuggestions(query: '   ', clientName: 'Ivan'),
      isEmpty,
    );
  });

  test('rebuild merges completed names into the bank without dropping catalog entries', () {
    exerciseBank.add('SQUAT');
    workoutHistory.add(
      WorkoutLog(
        DateTime(2026, 4, 1),
        [
          ExerciseLog('Deadlift', [SetLog('100', '5', '1')]),
        ],
      ),
    );
    trainerSchedule.add(
      TrainerSession(
        DateTime(2026, 4, 2),
        'Ivan',
        '',
        exercises: [
          ExerciseLog('Bench', [SetLog('80', '5', '1')]),
        ],
        id: 'owned',
        isCompleted: true,
      ),
    );
    trainerSchedule.add(
      TrainerSession(
        DateTime(2026, 3, 1),
        'Ivan',
        '',
        exercises: [
          ExerciseLog('Weird Curl', [SetLog('20', '10', '2')]),
        ],
        id: 'imported',
        isCompleted: true,
        isImportedHistory: true,
      ),
    );

    ironVibeRebuildExerciseBankFromCompletedWorkouts();
    expect(exerciseBank, ['SQUAT', 'DEADLIFT', 'BENCH']);
  });

  test('imported flag survives json round-trip', () {
    final session = TrainerSession(
      DateTime(2026, 3, 1, 10),
      'Ivan',
      '',
      exercises: [
        ExerciseLog('Curl', [SetLog('20', '10', '2')]),
      ],
      id: 'imp-1',
      isCompleted: true,
      isImportedHistory: true,
    );
    final restored = TrainerSession.fromJson(session.toJson());
    expect(restored.isImportedHistory, isTrue);
    expect(restored.isCompleted, isTrue);
    expect(restored.id, 'imp-1');
  });

  test('workouts without ids get a stable import id', () {
    final w = _athleteDay(DateTime(2026, 5, 1, 8));
    final first = ironVibeAthleteImportSessionId(w);
    final second = ironVibeAthleteImportSessionId(w);
    expect(first, second);
    expect(first, startsWith('athleteImport:'));
  });

  test('athlete backup catalog merge keeps favorites and muscle tags', () {
    ironVibeMergeAthleteBackupCatalog({
      'favoriteExercises': ['Bench Press', 'bench press', 'Row'],
      'exerciseMuscleGroups': {
        'BENCH PRESS': 'chest',
        'Row': 'back',
        'unknown': 'not-a-group',
      },
    });

    expect(ironVibeAthleteFavoriteExercises, ['BENCH PRESS', 'ROW']);
    expect(ironVibeMuscleGroupForName('bench press'), IronVibeMuscleGroup.chest);
    expect(ironVibeMuscleGroupForName('row'), IronVibeMuscleGroup.back);
    expect(ironVibeMuscleGroupForName('unknown'), isNull);
  });

  test('import copies athlete favorites and tags without mixing names', () {
    exerciseBank.add('SQUAT');
    ironVibeAthleteFavoriteExercises.add('SQUAT');
    ironVibeExerciseMuscleGroups['SQUAT'] = IronVibeMuscleGroup.chest;

    final workouts = [
      _athleteDay(DateTime(2026, 3, 1), id: 'w-curl', exercise: 'Weird Curl'),
      _athleteDay(DateTime(2026, 3, 2), id: 'w-press', exercise: 'Weird Press'),
    ];

    final outcome = ironVibeImportAthleteHistory(
      workouts: workouts,
      clientName: 'Ivan',
      favoriteExercises: ['weird curl', 'Ghost Fly'],
      exerciseMuscleGroups: {
        'WEIRD CURL': 'armFlex',
        'WEIRD PRESS': 'chest',
        'GHOST FLY': 'shoulders',
        'SQUAT': 'quad',
        'DEADLIFT': 'back',
      },
    );

    expect(outcome.status, IronVibeAthleteImportStatus.success);
    expect(clients.single.favoriteExercises, ['WEIRD CURL', 'GHOST FLY']);
    expect(
      ironVibeIsFavoriteExercise('Weird Curl', clientName: 'Ivan'),
      isTrue,
    );
    expect(
      ironVibeIsFavoriteExercise('Ghost Fly', clientName: 'Ivan'),
      isTrue,
    );
    expect(ironVibeAthleteFavoriteExercises, ['SQUAT']);
    expect(exerciseBank, ['SQUAT']);
    expect(ironVibeMuscleGroupForName('Weird Curl'), IronVibeMuscleGroup.armFlex);
    expect(ironVibeMuscleGroupForName('Weird Press'), IronVibeMuscleGroup.chest);
    expect(ironVibeMuscleGroupForName('Ghost Fly'), IronVibeMuscleGroup.shoulders);
    expect(ironVibeMuscleGroupForName('Squat'), IronVibeMuscleGroup.chest);
    expect(ironVibeMuscleGroupForName('Deadlift'), isNull);
    expect(
      ironVibeRhythmHistoryFor(clientName: 'Ivan').map((w) => w.exercises.single.name).toSet(),
      {'Weird Curl', 'Weird Press'},
    );
  });
}
