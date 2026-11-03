import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/main.dart';

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

  test('sheet headers do not collide and known labels map', () {
    final fields = ironVibeSheetHeaderFields;
    expect(fields['date'], 'date');
    expect(fields['дата'], 'date');
    expect(fields['вес'], 'weight');
    expect(fields['вес тела'], 'body_weight');
    expect(fields['заметка'], 'session_note');
    expect(fields['о клиенте'], 'client_notes');
    expect(fields['session id'], 'session_id');
    expect(fields['id тренировки'], 'session_id');
  });

  test('coach spreadsheet round-trips in every language', () {
    _seedCoachLog();
    for (final language in const [
      'en',
      'ru',
      'uk',
      'de',
      'es',
      'fr',
      'it',
      'pt',
      'pl',
      'zh',
      'hi',
      'ar',
    ]) {
      final csv = ironVibeBuildSheetCsv(coach: true, languageCode: language);
      final plan = ironVibePlanSheetImport(csv, coach: true);
      expect(plan.rejection, isNull, reason: language);
      expect(plan.hasChanges, isFalse, reason: language);
      expect(plan.skippedRows, 0, reason: language);
    }
    expect(clients.first.favoriteExercises, ['ПРИСЕД']);
  });

  test('edited sheet replaces sets and leaves other workouts', () {
    _seedCoachLog();
    final csv = ironVibeBuildSheetCsv(coach: true, languageCode: 'en');
    final lines = csv.split(RegExp(r'\r?\n'));
    final edited = lines
        .where((line) => !line.contains('"90"'))
        .map((line) => line.replaceAll('"80"', '"82"'))
        .join('\r\n');
    final plan = ironVibePlanSheetImport(edited, coach: true);
    expect(plan.rejection, isNull);
    expect(plan.sessionsToUpdate, 1);
    expect(plan.sessionsToAdd, 0);
    expect(plan.clientsToAdd, 0);
    plan.commit();

    final updated = trainerSchedule.singleWhere((s) => s.id == 's1');
    expect(updated.isCompleted, isTrue);
    expect(updated.exercises.first.name, 'ПРИСЕД');
    expect(updated.exercises.first.sets.map((s) => s.weight), ['82']);
    expect(updated.exercises[1].isCardio, isTrue);
    expect(updated.exercises[1].sets.single.duration, '20');
    expect(updated.exercises.last.name, '=HYPER');
    expect(
      trainerSchedule.singleWhere((s) => s.id == 's2').isScheduledPlan,
      isTrue,
    );
    expect(
      trainerSchedule.singleWhere((s) => s.id == 's2').isCompleted,
      isFalse,
    );
    expect(clients.first.favoriteExercises, ['ПРИСЕД']);
    expect(clients.map((c) => c.id), containsAll(['c1', 'c2', 'c3']));
  });

  test('new row adds a workout and a profile row adds a client', () {
    _seedCoachLog();
    const extra = '''
Date,Time,Client,Last name,Goal,Body weight,Height,Client notes,Exercise,Type,Set,Weight,Reps,RIR,Duration,Intensity,Session note,Session id,Client id
2020-07-01,12:00,Анна,Иванова,,,,,ТЯГА НОВАЯ,strength,1,50,10,2,,,new,,c1
,,Ника,Орлова,гибкость
''';
    final plan = ironVibePlanSheetImport(extra, coach: true);
    expect(plan.rejection, isNull);
    expect(plan.sessionsToAdd, 1);
    expect(plan.sessionsToUpdate, 0);
    expect(plan.clientsToAdd, 1);
    plan.commit();
    expect(trainerSchedule, hasLength(4));
    expect(clients.map((c) => c.name), contains('Ника'));
    expect(clients.singleWhere((c) => c.name == 'Ника').goal, 'гибкость');
    final added = trainerSchedule.singleWhere((s) => s.note == 'new');
    expect(added.clientId, 'c1');
    expect(added.isCompleted, isTrue);
    expect(added.exercises.single.sets.single.weight, '50');
  });

  test('several workouts on one day without ids are skipped', () {
    clients.add(Client('Анна', '', id: 'c1', lastName: 'Иванова'));
    trainerSchedule.add(
      TrainerSession(
        DateTime(2020, 8, 1, 10),
        'Анна',
        '',
        id: 'a',
        clientId: 'c1',
        clientLastName: 'Иванова',
        isCompleted: true,
        exercises: [
          ExerciseLog('ЖИМ', [SetLog('20', '5', '')]),
        ],
      ),
    );
    trainerSchedule.add(
      TrainerSession(
        DateTime(2020, 8, 1, 18),
        'Анна',
        '',
        id: 'b',
        clientId: 'c1',
        clientLastName: 'Иванова',
        isCompleted: true,
        exercises: [
          ExerciseLog('ТЯГА', [SetLog('30', '5', '')]),
        ],
      ),
    );
    const csv = '''
Date,Client,Last name,Exercise,Weight,Reps
2020-08-01,Анна,Иванова,ЖИМ,21,5
2020-08-01,Анна,Иванова,ТЯГА,31,5
''';
    final plan = ironVibePlanSheetImport(csv, coach: true);
    expect(plan.hasChanges, isFalse);
    expect(plan.skippedRows, 2);
    expect(
      trainerSchedule
          .singleWhere((s) => s.id == 'a')
          .exercises
          .single
          .sets
          .single
          .weight,
      '20',
    );
  });

  test('the only workout that day updates when the id column is empty', () {
    clients.add(Client('Анна', '', id: 'c1', lastName: 'Иванова'));
    trainerSchedule.add(
      TrainerSession(
        DateTime(2020, 9, 1, 18, 4, 9),
        'Анна',
        'keep',
        id: 'only',
        clientId: 'c1',
        clientLastName: 'Иванова',
        isCompleted: true,
        exercises: [
          ExerciseLog('ЖИМ', [SetLog('10', '5', '2')]),
        ],
      ),
    );
    const csv = '''
Date,Client,Last name,Exercise,Set,Weight,Reps,RIR
2020-09-01,Анна,Иванова,ЖИМ,1,15,6,1
''';
    final plan = ironVibePlanSheetImport(csv, coach: true);
    expect(plan.sessionsToUpdate, 1);
    expect(plan.sessionsToAdd, 0);
    plan.commit();
    final session = trainerSchedule.single;
    expect(session.id, 'only');
    expect(session.exercises.single.sets.single.weight, '15');
    expect(session.exercises.single.sets.single.reps, '6');
    expect(session.isCompleted, isTrue);
  });

  test('semicolon European sheet reads day-month-year and decimal commas', () {
    const csv = '''
Дата;Время;Клиент;Фамилия;Цель;Вес тела;Рост;О клиенте;Упражнение;Тип;Подход;Вес;Повторы;RIR;Длительность;Интенсивность;Заметка;Id тренировки;Id клиента
03.11.2026;19:05;Оля;Смирнова;тонус;61,5;168;колено;ЖИМ;силовая;1;40,5;12;1;;;нормально;;
''';
    final plan = ironVibePlanSheetImport(csv, coach: true);
    expect(plan.rejection, isNull);
    expect(plan.clientsToAdd, 1);
    expect(plan.sessionsToAdd, 1);
    plan.commit();
    final client = clients.single;
    expect(client.name, 'Оля');
    expect(client.lastName, 'Смирнова');
    expect(client.weight, '61,5');
    expect(client.height, '168');
    final session = trainerSchedule.single;
    expect(session.dateTime, DateTime(2026, 11, 3, 19, 5));
    expect(session.note, 'нормально');
    expect(session.exercises.single.isCardio, isFalse);
    expect(session.exercises.single.sets.single.weight, '40,5');
    expect(session.exercises.single.sets.single.reps, '12');
  });

  test('excel serial dates and a title row still import', () {
    const csv = '''
IronVibe
Date,Client,Exercise,Weight,Reps
25569,Нора,ПРИСЕД,40,8
''';
    final plan = ironVibePlanSheetImport('\uFEFF$csv', coach: true);
    expect(plan.sessionsToAdd, 1);
    plan.commit();
    expect(trainerSchedule.single.dateTime, DateTime(1970, 1, 1));
    expect(trainerSchedule.single.exercises.single.name, 'ПРИСЕД');
  });

  test('personal log stays personal and coach file stays with the coach', () {
    workoutHistory.add(
      WorkoutLog(DateTime(2020, 5, 1, 7, 15, 4), [
        ExerciseLog('БЕГ', [
          SetLog(
            '',
            '',
            '',
            isCardio: true,
            duration: '30',
            intensity: 'легко',
          ),
        ], isCardio: true),
      ], id: 'w1'),
    );
    final personal = ironVibeBuildSheetCsv(coach: false, languageCode: 'ru');
    final back = ironVibePlanSheetImport(personal, coach: false);
    expect(back.rejection, isNull);
    expect(back.hasChanges, isFalse);
    final asCoach = ironVibePlanSheetImport(personal, coach: true);
    expect(asCoach.rejection, IronVibeSheetRejection.personalIntoCoach);

    _seedCoachLog();
    final coachFile = ironVibeBuildSheetCsv(coach: true, languageCode: 'en');
    final asPersonal = ironVibePlanSheetImport(coachFile, coach: false);
    expect(asPersonal.rejection, IronVibeSheetRejection.coachIntoPersonal);
  });

  test(
    'first name stays locked, last name and blank goal follow the sheet',
    () {
      _seedCoachLog();
      const renamed = '''
Date,Time,Client,Last name,Goal,Exercise,Set,Weight,Reps,RIR,Session id,Client id
2020-06-02,18:30,Мария,Петрова,,ПРИСЕД,1,80,5,2,s1,c1
2020-06-02,18:30,Мария,Петрова,,ПРИСЕД,2,90,3,,s1,c1
2020-06-02,18:30,Мария,Петрова,,ВЕЛО,1,,,,,s1,c1
2020-06-02,18:30,Мария,Петрова,,=HYPER,1,10,8,1,s1,c1
''';
      final plan = ironVibePlanSheetImport(renamed, coach: true);
      expect(plan.clientsToUpdate, 1);
      plan.commit();
      final anna = clients.singleWhere((c) => c.id == 'c1');
      expect(anna.name, 'Анна');
      expect(anna.lastName, 'Петрова');
      expect(anna.goal, 'сила');
      expect(
        trainerSchedule.singleWhere((s) => s.id == 's1').clientLastName,
        'Петрова',
      );
    },
  );

  test('restarting the set number splits the exercise', () {
    const csv = '''
Date,Exercise,Set,Weight,Reps
2020-03-03,ЖИМ,1,10,5
2020-03-03,ЖИМ,2,10,5
2020-03-03,ЖИМ,1,12,3
''';
    final plan = ironVibePlanSheetImport(csv, coach: false);
    expect(plan.sessionsToAdd, 1);
    plan.commit();
    final exercises = workoutHistory.single.exercises;
    expect(exercises, hasLength(2));
    expect(exercises.first.sets, hasLength(2));
    expect(exercises.last.sets.single.weight, '12');
  });

  test('utf-16 bytes decode and a garbage file is rejected', () {
    const csv = 'Date,Exercise,Weight,Reps\n2020-01-02,ЖИМ,20,5\n';
    final units = csv.codeUnits;
    final bytes = <int>[0xFF, 0xFE];
    for (final unit in units) {
      bytes.add(unit & 0xFF);
      bytes.add((unit >> 8) & 0xFF);
    }
    final decoded = ironVibeDecodeSheetBytes(bytes);
    final plan = ironVibePlanSheetImport(decoded, coach: false);
    expect(plan.sessionsToAdd, 1);
    expect(
      ironVibePlanSheetImport('a,b,c\n1,2,3\n', coach: true).rejection,
      IronVibeSheetRejection.notASheet,
    );
    expect(
      ironVibePlanSheetImport('Date,Exercise\n', coach: false).rejection,
      IronVibeSheetRejection.empty,
    );
  });

  test('formula-looking names survive a round trip', () {
    workoutHistory.add(
      WorkoutLog(DateTime(2020, 4, 4, 8), [
        ExerciseLog('=HYPER', [SetLog('10', '8', '')]),
      ], id: 'w-formula'),
    );
    final csv = ironVibeBuildSheetCsv(coach: false);
    expect(csv.contains("'=HYPER"), isTrue);
    final plan = ironVibePlanSheetImport(csv, coach: false);
    expect(plan.hasChanges, isFalse);
  });
}

void _seedCoachLog() {
  clients.add(
    Client(
      'Анна',
      'сила',
      id: 'c1',
      lastName: 'Иванова',
      weight: '60',
      height: '170',
      notes: 'knee, "slow"',
      favoriteExercises: ['ПРИСЕД'],
    ),
  );
  clients.add(Client('Борис', 'масса', id: 'c2', lastName: 'Петров'));
  clients.add(Client('Анна', 'скорость', id: 'c3', lastName: 'Смирнова'));
  trainerSchedule.add(
    TrainerSession(
      DateTime(2020, 6, 2, 18, 30, 15),
      'Анна',
      'say "hi"',
      id: 's1',
      clientId: 'c1',
      clientLastName: 'Иванова',
      isCompleted: true,
      exercises: [
        ExerciseLog('ПРИСЕД', [SetLog('80', '5', '2'), SetLog('90', '3', '')]),
        ExerciseLog('ВЕЛО', [
          SetLog(
            '',
            '',
            '',
            isCardio: true,
            duration: '20',
            intensity: 'легко',
          ),
        ], isCardio: true),
        ExerciseLog('=HYPER', [SetLog('10', '8', '1')]),
      ],
    ),
  );
  trainerSchedule.add(
    TrainerSession(
      DateTime(2099, 1, 4, 9),
      'Анна',
      '',
      id: 's2',
      clientId: 'c1',
      clientLastName: 'Иванова',
      isScheduledPlan: true,
      exercises: [
        ExerciseLog('ЖИМ', [SetLog('40', '12', '3')]),
      ],
    ),
  );
  trainerSchedule.add(
    TrainerSession(
      DateTime(2021, 2, 2, 11),
      'Анна',
      '',
      id: 's3',
      clientId: 'c3',
      clientLastName: 'Смирнова',
      isCompleted: true,
      exercises: [
        ExerciseLog('ТЯГА', [SetLog('55', '6', '2')]),
      ],
    ),
  );
}
