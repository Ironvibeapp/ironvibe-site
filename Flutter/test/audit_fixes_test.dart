import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/main.dart';

void main() {
  late List<WorkoutLog> savedHistory;
  late List<TrainerSession> savedSchedule;
  late List<Client> savedClients;
  late List<String> savedBank;

  setUp(() {
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

  test('quantity parser accepts comma decimals and trims', () {
    expect(ironVibeParseQuantity('80,5'), 80.5);
    expect(ironVibeParseQuantity(' 10 '), 10);
    expect(ironVibeVolumeKgFromFields('80,5', '10'), 805);
    expect(ironVibeVolumeKgFromFields('80.5', '10'), 805);
  });

  test('new workout logs get an id', () {
    final w = ironVibeNewWorkoutLog(DateTime(2026, 5, 1), [
      ExerciseLog('Squat', [SetLog('100', '5', '1')]),
    ]);
    expect(w.id, isNotNull);
    expect(w.id, isNotEmpty);
  });

  test('missing workout date is skipped on parse', () {
    expect(
      () => WorkoutLog.fromJson({
        'exercises': [
          {
            'name': 'Squat',
            'sets': [
              {'weight': '100', 'reps': '5', 'rir': '1'},
            ],
          },
        ],
      }),
      throwsFormatException,
    );
  });

  test('content fingerprint skips null-id reimport duplicates', () {
    final date = DateTime(2026, 5, 2, 10);
    final a = WorkoutLog(date, [
      ExerciseLog('Squat', [SetLog('100', '5', '1')]),
    ]);
    final b = WorkoutLog(date, [
      ExerciseLog('Squat', [SetLog('100', '5', '1')]),
    ]);
    expect(
      ironVibeWorkoutContentFingerprint(a),
      ironVibeWorkoutContentFingerprint(b),
    );
    expect(ironVibeWorkoutIdentityKey(a).startsWith('fp:'), isTrue);
  });

  test('1RM prefers Epley over set volume', () {
    workoutHistory = [
      WorkoutLog(DateTime(2026, 1, 1), [
        ExerciseLog('Bench', [
          SetLog('100', '10', '1'),
          SetLog('140', '3', '1'),
        ]),
      ], id: 'w1'),
    ];
    exerciseBank = ['BENCH'];
    final rows = ironVibePersonalProgressRows();
    final bench = rows.singleWhere((r) => r.name == 'BENCH');
    expect(bench.bestWeight, 140);
    expect(bench.bestReps, 3);
    expect(bench.oneRmFromBestSetKg, ironVibeEpleyOneRmKg(140, 3));
  });

  test('imported history is excluded from progress and last logged', () {
    clients.add(Client('Ivan', '', id: 'c1'));
    trainerSchedule.add(
      TrainerSession(
        DateTime(2026, 3, 1),
        'Ivan',
        '',
        exercises: [
          ExerciseLog('Curl', [SetLog('20', '10', '2')]),
        ],
        id: 'imp',
        clientId: 'c1',
        isCompleted: true,
        isImportedHistory: true,
      ),
    );
    expect(ironVibeLastLoggedTrainerSessionForClient('Ivan'), isNull);
    expect(ironVibePersonalProgressRows(clientName: 'Ivan'), isEmpty);
    expect(ironVibeRhythmHistoryFor(clientName: 'Ivan'), hasLength(1));
    expect(
      ironVibeRhythmHistoryFor(clientName: 'Ivan').single.exercises.single.name,
      'Curl',
    );
  });

  test('live current ignores yesterday and binds same-day plan', () {
    clients.add(Client('Ivan', '', id: 'c1'));
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    trainerSchedule.add(
      TrainerSession(
        yesterday,
        'Ivan',
        '',
        id: 'old',
        clientId: 'c1',
        isLiveCurrent: true,
      ),
    );
    expect(
      ironVibeLiveCurrentTrainerSessionForClient('Ivan', clientId: 'c1'),
      isNull,
    );

    final todayPlan = ironVibeNewTrainerSession(
      dateTime: DateTime.now(),
      clientName: 'Ivan',
      clientId: 'c1',
      isScheduledPlan: true,
      exercises: [
        ExerciseLog('Squat', [SetLog('', '', '0')]),
      ],
    );
    trainerSchedule.add(todayPlan);
    expect(
      ironVibeTodaysIncompleteTrainerSessionForClient('Ivan', clientId: 'c1')?.id,
      todayPlan.id,
    );
  });

  test('ui mode returns live for today live-current', () {
    final session = TrainerSession(
      DateTime.now(),
      'Ivan',
      '',
      id: 'live',
      isLiveCurrent: true,
    );
    expect(ironVibeTrainerSessionUiMode(session), TrainerSessionUiMode.live);
  });

  test('client match ignores case via clientId or name', () {
    final c = Client('Ivan', '', id: 'c1');
    clients.add(c);
    final s = TrainerSession(
      DateTime.now(),
      'ivan',
      '',
      id: 's1',
      clientId: 'c1',
    );
    expect(ironVibeSessionBelongsToClientRecord(s, c), isTrue);
    expect(ironVibeFindClient(name: 'IVAN')?.id, 'c1');
  });

  test('ensure ids fills missing workout and client ids', () {
    workoutHistory.add(
      WorkoutLog(DateTime(2026, 1, 1), [
        ExerciseLog('Squat', [SetLog('100', '5', '1')]),
      ]),
    );
    clients.add(Client('Ivan', ''));
    expect(ironVibeEnsurePersistentIds(), isTrue);
    expect(workoutHistory.single.id, isNotNull);
    expect(clients.single.id, isNotNull);
  });
}
