part of 'package:fitness_app/main.dart';

List<String> exerciseBank = [];

class WorkoutLog {
  final DateTime date;
  final List<ExerciseLog> exercises;
  String? id;
  WorkoutLog(this.date, this.exercises, {this.id});

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    'date': date.toIso8601String(),
    'exercises': exercises.map((e) => e.toJson()).toList(),
  };

  factory WorkoutLog.fromJson(Map<String, dynamic> json) {
    final exercises = <ExerciseLog>[];
    final rawList = json['exercises'];
    if (rawList is List) {
      for (final item in rawList) {
        final m = _jsonMap(item);
        if (m != null) exercises.add(ExerciseLog.fromJson(m));
      }
    }
    return WorkoutLog(
      DateTime.tryParse(_jsonString(json['date'])) ?? DateTime.now(),
      exercises,
      id: json['id'] as String?,
    );
  }
}

class ExerciseLog {
  final String name;
  final List<SetLog> sets;
  final bool isCardio;
  ExerciseLog(this.name, this.sets, {this.isCardio = false});

  Map<String, dynamic> toJson() => {
    'name': name,
    'sets': sets.map((s) => s.toJson()).toList(),
    'isCardio': isCardio,
  };

  factory ExerciseLog.fromJson(Map<String, dynamic> json) {
    final j = _jsonMap(json);
    if (j == null) {
      return ExerciseLog('', [], isCardio: false);
    }
    final isCardio = _jsonPickBool(j, ['isCardio', 'is_cardio', 'cardio']);

    var rawSets = _jsonValueForKeys(j, ['sets', 'setList', 'set_list', 'approaches', 'set']);
    if (rawSets is String) {
      try {
        rawSets = jsonDecode(rawSets);
      } catch (_) {
        rawSets = null;
      }
    }
    if (rawSets is Map) {
      rawSets = [rawSets];
    }

    final sets = <SetLog>[];
    if (rawSets is List) {
      for (final item in rawSets) {
        final parsed = _setLogFromDecoded(item, parentExerciseIsCardio: isCardio);
        if (parsed != null) sets.add(parsed);
      }
    }

    if (sets.isEmpty) {
      final w = _jsonPickString(j, ['weight', 'w', 'kg', 'mass']);
      final r = _jsonPickString(j, ['reps', 'r', 'repetitions', 'rep']);
      final ri = _jsonPickString(j, ['rir', 'RIR']);
      if (w.isNotEmpty || r.isNotEmpty) {
        sets.add(SetLog(w, r, normalizeRirStored(ri)));
      } else {
        final d = _jsonPickString(j, ['duration', 'time', 'minutes', 'min']);
        final i = _jsonPickString(j, ['intensity', 'level']);
        if (d.isNotEmpty || i.isNotEmpty) {
          sets.add(SetLog('', '', '', isCardio: true, duration: d, intensity: i));
        }
      }
    }

    var name = _jsonPickString(j, ['name', 'exerciseName', 'exercise', 'title', 'label']);
    if (name.isEmpty) name = _jsonString(j['name']);

    return ExerciseLog(
      normalizeExerciseName(name),
      sets,
      isCardio: isCardio,
    );
  }
}

class SetLog {
  final String weight;
  final String reps;
  final String rir;
  final bool isCardio;
  final String duration;
  final String intensity;
  SetLog(this.weight, this.reps, this.rir, {this.isCardio = false, this.duration = '', this.intensity = ''});

  Map<String, dynamic> toJson() => {
    'weight': weight,
    'reps': reps,
    'rir': rir,
    'isCardio': isCardio,
    'duration': duration,
    'intensity': intensity,
  };

  factory SetLog.fromJson(Map<String, dynamic> json) {
    final j = _jsonMap(json);
    if (j == null) {
      return SetLog('', '', '0');
    }
    return SetLog(
      _jsonPickString(j, ['weight', 'w', 'kg', 'mass']),
      _jsonPickString(j, ['reps', 'r', 'repetitions', 'rep', 'reps_count']),
      normalizeRirStored(_jsonPickString(j, ['rir', 'RIR', 'rir_value'])),
      isCardio: _jsonPickBool(j, ['isCardio', 'is_cardio', 'cardio']),
      duration: _jsonPickString(j, ['duration', 'time', 'minutes', 'min']),
      intensity: _jsonPickString(j, ['intensity', 'level']),
    );
  }
}

class Client {
  String name;
  String goal;
  String weight;
  String height;
  String notes;
  List<String> favoriteExercises;
  Client(
    this.name,
    this.goal, {
    this.weight = '',
    this.height = '',
    this.notes = '',
    List<String>? favoriteExercises,
  }) : favoriteExercises = favoriteExercises ?? [];

  Map<String, dynamic> toJson() => {
    'name': name,
    'goal': goal,
    'weight': weight,
    'height': height,
    'notes': notes,
    'favoriteExercises': favoriteExercises,
  };

  factory Client.fromJson(Map<String, dynamic> json) {
    final favorites = <String>[];
    final rawFavorites = json['favoriteExercises'];
    if (rawFavorites is List) {
      for (final item in rawFavorites) {
        if (item is String && item.trim().isNotEmpty) {
          favorites.add(normalizeExerciseName(item));
        }
      }
    }
    return Client(
      _jsonString(json['name']),
      _jsonString(json['goal']),
      weight: _jsonString(json['weight']),
      height: _jsonString(json['height']),
      notes: _jsonString(json['notes']),
      favoriteExercises: favorites,
    );
  }
}

class TrainerSession {
  final DateTime dateTime;
  final String clientName;
  String note;
  List<ExerciseLog> exercises;
  String? id;
  TrainerSession(this.dateTime, this.clientName, this.note, {this.exercises = const [], this.id});

  Map<String, dynamic> toJson() => {
    if (id != null) 'id': id,
    'dateTime': dateTime.toIso8601String(),
    'clientName': clientName,
    'note': note,
    'exercises': exercises.map((e) => e.toJson()).toList(),
  };

  factory TrainerSession.fromJson(Map<String, dynamic> json) {
    final exercises = <ExerciseLog>[];
    final rawList = json['exercises'];
    if (rawList is List) {
      for (final item in rawList) {
        final m = _jsonMap(item);
        if (m != null) exercises.add(ExerciseLog.fromJson(m));
      }
    }
    return TrainerSession(
      DateTime.tryParse(_jsonString(json['dateTime'])) ?? DateTime.now(),
      _jsonString(json['clientName']),
      _jsonString(json['note']),
      exercises: exercises,
      id: json['id'] as String?,
    );
  }
}

DateTime ironVibeDateOnly(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

bool ironVibeIsSameCalendarDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

bool ironVibeSetLogHasLoggedData(SetLog s) {
  if (s.isCardio) {
    return s.duration.trim().isNotEmpty || s.intensity.trim().isNotEmpty;
  }
  return s.weight.trim().isNotEmpty ||
      s.reps.trim().isNotEmpty ||
      rirIndicatesMeaningfulUserChoice(s.rir);
}

bool ironVibeExerciseLogHasLoggedData(ExerciseLog e) =>
    e.sets.any(ironVibeSetLogHasLoggedData);

bool ironVibeTrainerSessionHasLoggedData(TrainerSession s) =>
    s.exercises.any(ironVibeExerciseLogHasLoggedData);

int ironVibeTrainerSessionNamedExerciseCount(TrainerSession s) => s.exercises
    .where((e) => normalizeExerciseName(e.name).isNotEmpty)
    .length;

bool ironVibeTrainerSessionHasPlan(TrainerSession s) =>
    ironVibeTrainerSessionNamedExerciseCount(s) > 0;

enum TrainerSessionUiMode { live, plan, history }

TrainerSessionUiMode ironVibeTrainerSessionUiMode(TrainerSession session) {
  if (ironVibeTrainerSessionHasLoggedData(session)) {
    return TrainerSessionUiMode.history;
  }
  return TrainerSessionUiMode.plan;
}

bool ironVibePurgeExpiredUnloggedTrainerSessions() {
  final today = ironVibeDateOnly(DateTime.now());
  final protectedId =
      activeWorkoutDraft?.kind == ActiveWorkoutDraftKind.trainer
      ? activeWorkoutDraft?.sessionId
      : null;
  final before = trainerSchedule.length;
  trainerSchedule.removeWhere((s) {
    if (ironVibeTrainerSessionHasLoggedData(s)) return false;
    if (protectedId != null && s.id != null && s.id == protectedId) {
      return false;
    }
    return ironVibeDateOnly(s.dateTime).isBefore(today);
  });
  return trainerSchedule.length < before;
}

Future<bool> ironVibePurgeExpiredUnloggedTrainerSessionsAndSave() async {
  if (!ironVibePurgeExpiredUnloggedTrainerSessions()) return false;
  await DataService.saveData();
  return true;
}

TrainerSession ironVibeNewTrainerSession({
  required DateTime dateTime,
  required String clientName,
  String note = '',
  List<ExerciseLog>? exercises,
}) {
  return TrainerSession(
    dateTime,
    clientName,
    note,
    exercises: exercises ?? const [],
    id: const Uuid().v4(),
  );
}

bool _ironVibeSameTrainerSession(TrainerSession a, TrainerSession b) {
  if (identical(a, b)) return true;
  if (a.id != null && b.id != null && a.id == b.id) return true;
  if (a.id == null && b.id == null) {
    return a.clientName == b.clientName && a.dateTime == b.dateTime;
  }
  return false;
}

bool ironVibeTrainerSessionIsAbandonedStub(TrainerSession s) {
  return !ironVibeTrainerSessionHasLoggedData(s) &&
      !ironVibeTrainerSessionHasPlan(s) &&
      s.note.trim().isEmpty;
}

void ironVibeRemoveTrainerSession(TrainerSession session) {
  trainerSchedule.removeWhere((s) => _ironVibeSameTrainerSession(s, session));
}

void ironVibeSyncTrainerSessionInSchedule(TrainerSession session) {
  for (final s in trainerSchedule) {
    if (!_ironVibeSameTrainerSession(s, session)) continue;
    if (identical(s, session)) return;
    s.note = session.note;
    s.exercises = session.exercises;
    return;
  }
}

Future<void> ironVibeDiscardAbandonedTrainerSession(
  TrainerSession session,
) async {
  if (!ironVibeTrainerSessionIsAbandonedStub(session)) return;
  ironVibeRemoveTrainerSession(session);
  await DataService.saveData();
}

TrainerSession? ironVibeLastLoggedTrainerSessionForClient(
  String clientName, {
  TrainerSession? exclude,
}) {
  final name = clientName.trim();
  if (name.isEmpty) return null;
  TrainerSession? best;
  for (final s in trainerSchedule) {
    if (s.clientName != name) continue;
    if (exclude != null && _ironVibeSameTrainerSession(s, exclude)) continue;
    if (!ironVibeTrainerSessionHasLoggedData(s)) continue;
    if (best == null || s.dateTime.isAfter(best.dateTime)) best = s;
  }
  return best;
}

TrainerSession? ironVibeLastRepeatableTrainerSession(
  String clientName, {
  TrainerSession? exclude,
}) {
  final logged = ironVibeLastLoggedTrainerSessionForClient(
    clientName,
    exclude: exclude,
  );
  if (logged != null) return logged;
  final name = clientName.trim();
  if (name.isEmpty) return null;
  TrainerSession? best;
  for (final s in trainerSchedule) {
    if (s.clientName != name) continue;
    if (exclude != null && _ironVibeSameTrainerSession(s, exclude)) continue;
    if (!ironVibeTrainerSessionHasPlan(s)) continue;
    if (best == null || s.dateTime.isAfter(best.dateTime)) best = s;
  }
  return best;
}

TrainerSession? ironVibeNextTrainerSessionForClient(String clientName) {
  final name = clientName.trim();
  if (name.isEmpty) return null;
  final today = ironVibeDateOnly(DateTime.now());
  TrainerSession? best;
  for (final s in trainerSchedule) {
    if (s.clientName != name) continue;
    final day = ironVibeDateOnly(s.dateTime);
    if (day.isBefore(today)) continue;
    if (day == today && ironVibeTrainerSessionHasLoggedData(s)) continue;
    if (best == null || s.dateTime.isBefore(best.dateTime)) best = s;
  }
  return best;
}

List<ExerciseLog> ironVibeTrainerPlanLogsFrom(TrainerSession source) {
  final out = <ExerciseLog>[];
  for (final ex in source.exercises) {
    final name = normalizeExerciseName(ex.name);
    if (name.isEmpty) continue;
    if (ex.isCardio) {
      out.add(
        ExerciseLog(
          name,
          [SetLog('', '', '', isCardio: true, duration: '', intensity: '')],
          isCardio: true,
        ),
      );
    } else {
      final n = math.max(1, ex.sets.length);
      out.add(
        ExerciseLog(
          name,
          List<SetLog>.generate(n, (_) => SetLog('', '', '0')),
        ),
      );
    }
  }
  return out;
}

List<WorkoutLog> _parseWorkoutHistoryDecoded(dynamic decoded) {
  final out = <WorkoutLog>[];
  if (decoded is! List) return out;
  for (final e in decoded) {
    final m = _jsonMap(e);
    if (m == null) continue;
    try {
      out.add(WorkoutLog.fromJson(m));
    } catch (err, st) {
      debugPrint('IronVibe: пропуск записи тренировки: $err\n$st');
    }
  }
  return out;
}

List<Client> _parseClientsDecoded(dynamic decoded) {
  final out = <Client>[];
  if (decoded is! List) return out;
  for (final e in decoded) {
    final m = _jsonMap(e);
    if (m == null) continue;
    try {
      out.add(Client.fromJson(m));
    } catch (err, st) {
      debugPrint('IronVibe: пропуск клиента: $err\n$st');
    }
  }
  return out;
}

List<TrainerSession> _parseTrainerScheduleDecoded(dynamic decoded) {
  final out = <TrainerSession>[];
  if (decoded is! List) return out;
  for (final e in decoded) {
    final m = _jsonMap(e);
    if (m == null) continue;
    try {
      out.add(TrainerSession.fromJson(m));
    } catch (err, st) {
      debugPrint('IronVibe: пропуск сессии тренера: $err\n$st');
    }
  }
  return out;
}

List<WorkoutLog> workoutHistory = [];

List<Client> clients = [];

List<String> ironVibeAthleteFavoriteExercises = [];

List<TrainerSession> trainerSchedule = [];

enum ActiveWorkoutDraftKind { personal, trainer }

class ActiveWorkoutDraft {
  static const _kindPersonal = 'personal';
  static const _kindTrainer = 'trainer';

  final ActiveWorkoutDraftKind kind;
  final DateTime? targetDate;
  final String? sessionId;
  final String? clientName;
  final DateTime? sessionDateTime;
  final String? sessionNote;
  final bool isCardio;
  final List<dynamic> exercisesJson;
  final DateTime savedAt;

  const ActiveWorkoutDraft({
    required this.kind,
    this.targetDate,
    this.sessionId,
    this.clientName,
    this.sessionDateTime,
    this.sessionNote,
    required this.isCardio,
    required this.exercisesJson,
    required this.savedAt,
  });

  bool get hasRecoverableContent =>
      exercisesJson.isNotEmpty &&
      ironVibeDraftExercisesHaveMeaningfulInput(exercisesJson);

  Map<String, dynamic> toJson() => {
    'kind': kind == ActiveWorkoutDraftKind.personal ? _kindPersonal : _kindTrainer,
    if (targetDate != null) 'targetDate': targetDate!.toIso8601String(),
    if (sessionId != null) 'sessionId': sessionId,
    if (clientName != null) 'clientName': clientName,
    if (sessionDateTime != null) 'sessionDateTime': sessionDateTime!.toIso8601String(),
    if (sessionNote != null) 'sessionNote': sessionNote,
    'isCardio': isCardio,
    'exercises': exercisesJson,
    'savedAt': savedAt.toIso8601String(),
  };

  factory ActiveWorkoutDraft.fromJson(Map<String, dynamic> json) {
    final kindRaw = _jsonString(json['kind']);
    final kind = kindRaw == _kindTrainer
        ? ActiveWorkoutDraftKind.trainer
        : ActiveWorkoutDraftKind.personal;
    final rawExercises = json['exercises'];
    final exercisesJson = rawExercises is List ? List<dynamic>.from(rawExercises) : <dynamic>[];
    return ActiveWorkoutDraft(
      kind: kind,
      targetDate: DateTime.tryParse(_jsonString(json['targetDate'])),
      sessionId: json['sessionId'] as String?,
      clientName: _jsonString(json['clientName']).isEmpty
          ? null
          : _jsonString(json['clientName']),
      sessionDateTime: DateTime.tryParse(_jsonString(json['sessionDateTime'])),
      sessionNote: _jsonString(json['sessionNote']).isEmpty
          ? null
          : _jsonString(json['sessionNote']),
      isCardio: _jsonPickBool(json, ['isCardio', 'is_cardio', 'cardio']),
      exercisesJson: exercisesJson,
      savedAt: DateTime.tryParse(_jsonString(json['savedAt'])) ?? DateTime.now(),
    );
  }
}

ActiveWorkoutDraft? activeWorkoutDraft;

class DataService {
  static const String _keyExerciseBank = 'exerciseBank';
  static const String _keyWorkoutHistory = 'workoutHistory';
  static const String _keyClients = 'clients';
  static const String _keyTrainerSchedule = 'trainerSchedule';
  static const String _keyActiveWorkoutDraft = 'activeWorkoutDraft';
  static const String _keyAthleteFavoriteExercises = 'athleteFavoriteExercises';
  /// Separate from workout history so older installs keep loading logs as-is.
  static const String _keyExerciseMuscleGroups = 'exerciseMuscleGroups';

  static Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();

    final bankJson = prefs.getStringList(_keyExerciseBank);
    if (bankJson != null) {
      exerciseBank = bankJson;
    }

    final historyJson = prefs.getString(_keyWorkoutHistory);
    if (historyJson != null) {
      workoutHistory = _parseWorkoutHistoryDecoded(jsonDecode(historyJson));
    }

    final clientsJson = prefs.getString(_keyClients);
    if (clientsJson != null) {
      clients = _parseClientsDecoded(jsonDecode(clientsJson));
    }

    final scheduleJson = prefs.getString(_keyTrainerSchedule);
    if (scheduleJson != null) {
      trainerSchedule = _parseTrainerScheduleDecoded(jsonDecode(scheduleJson));
    }

    final draftJson = prefs.getString(_keyActiveWorkoutDraft);
    if (draftJson != null) {
      try {
        final decoded = jsonDecode(draftJson);
        final m = _jsonMap(decoded);
        if (m != null) {
          activeWorkoutDraft = ActiveWorkoutDraft.fromJson(m);
        }
      } catch (err, st) {
        debugPrint('IronVibe: не удалось загрузить черновик тренировки: $err\n$st');
        activeWorkoutDraft = null;
      }
    } else {
      activeWorkoutDraft = null;
    }

    final favoritesJson = prefs.getStringList(_keyAthleteFavoriteExercises);
    if (favoritesJson != null) {
      ironVibeAthleteFavoriteExercises = favoritesJson;
    }

    final muscleGroupsJson = prefs.getString(_keyExerciseMuscleGroups);
    if (muscleGroupsJson != null && muscleGroupsJson.isNotEmpty) {
      try {
        ironVibeExerciseMuscleGroups = ironVibeParseExerciseMuscleGroups(
          jsonDecode(muscleGroupsJson),
        );
      } catch (err, st) {
        debugPrint(
          'IronVibe: не удалось загрузить группы мышц (история не затронута): $err\n$st',
        );
      }
    }

    exerciseBank = _dedupeNormalizedExerciseBank(exerciseBank);
    ironVibeAthleteFavoriteExercises =
        _dedupeNormalizedExerciseBank(ironVibeAthleteFavoriteExercises);
    for (final client in clients) {
      client.favoriteExercises =
          _dedupeNormalizedExerciseBank(client.favoriteExercises);
    }
    workoutHistory = workoutHistory.map(_normalizeWorkoutLogExerciseNames).toList();
    trainerSchedule = trainerSchedule.map(_normalizeTrainerSessionExerciseNames).toList();
    ironVibePurgeExpiredUnloggedTrainerSessions();
    await saveData();
  }

  static Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(_keyExerciseBank, exerciseBank);
    await prefs.setStringList(
      _keyAthleteFavoriteExercises,
      ironVibeAthleteFavoriteExercises,
    );
    
    final historyJson = jsonEncode(workoutHistory.map((e) => e.toJson()).toList());
    await prefs.setString(_keyWorkoutHistory, historyJson);

    final clientsJson = jsonEncode(clients.map((e) => e.toJson()).toList());
    await prefs.setString(_keyClients, clientsJson);

    final scheduleJson = jsonEncode(trainerSchedule.map((e) => e.toJson()).toList());
    await prefs.setString(_keyTrainerSchedule, scheduleJson);

    await prefs.setString(
      _keyExerciseMuscleGroups,
      jsonEncode(ironVibeExerciseMuscleGroupsToJsonMap()),
    );
  }

  static Future<void> saveActiveWorkoutDraft(ActiveWorkoutDraft draft) async {
    activeWorkoutDraft = draft;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyActiveWorkoutDraft, jsonEncode(draft.toJson()));
  }

  static Future<void> clearActiveWorkoutDraft() async {
    activeWorkoutDraft = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyActiveWorkoutDraft);
  }
}

TrainerSession? ironVibeFindTrainerSessionForDraft(ActiveWorkoutDraft draft) {
  if (draft.kind != ActiveWorkoutDraftKind.trainer) return null;
  if (draft.sessionId != null) {
    for (final s in trainerSchedule) {
      if (s.id == draft.sessionId) return s;
    }
  }
  if (draft.sessionDateTime != null && draft.clientName != null) {
    for (final s in trainerSchedule) {
      if (s.clientName != draft.clientName) continue;
      if (s.dateTime.year == draft.sessionDateTime!.year &&
          s.dateTime.month == draft.sessionDateTime!.month &&
          s.dateTime.day == draft.sessionDateTime!.day &&
          s.dateTime.hour == draft.sessionDateTime!.hour &&
          s.dateTime.minute == draft.sessionDateTime!.minute) {
        return s;
      }
    }
  }
  return null;
}

void _renameExerciseGlobally(String oldName, String newName) {
  final o = normalizeExerciseName(oldName);
  final n = normalizeExerciseName(newName);
  if (o.isEmpty || n.isEmpty || o == n) return;

  exerciseBank.removeWhere((e) => normalizeExerciseName(e) == o);
  ensureExerciseInBank(n);

  workoutHistory = workoutHistory.map((w) {
    final newExercises = w.exercises.map((ex) {
      if (normalizeExerciseName(ex.name) == o) return ExerciseLog(n, ex.sets, isCardio: ex.isCardio);
      return ex;
    }).toList();
    return WorkoutLog(w.date, newExercises, id: w.id);
  }).toList();

  for (var s in trainerSchedule) {
    s.exercises = s.exercises.map((ex) {
      if (normalizeExerciseName(ex.name) == o) return ExerciseLog(n, ex.sets, isCardio: ex.isCardio);
      return ex;
    }).toList();
  }

  ironVibeRenameFavoriteExercise(o, n);
  ironVibeRenameMuscleGroup(o, n);

  DataService.saveData();
}

/// One row in [exercises] only: same sets, new exercise name. Progress charts follow [newName].
void reassignExerciseInExerciseList(List<ExerciseLog> exercises, int exerciseIndex, String newName) {
  final n = normalizeExerciseName(newName);
  if (n.isEmpty) return;
  if (exerciseIndex < 0 || exerciseIndex >= exercises.length) return;
  final old = exercises[exerciseIndex];
  if (normalizeExerciseName(old.name) == n) return;
  ensureExerciseInBank(n);
  exercises[exerciseIndex] = ExerciseLog(n, old.sets, isCardio: old.isCardio);
  DataService.saveData();
}

Iterable<String> _sortedExerciseBankOptions() {
  final out = List<String>.from(exerciseBank);
  out.sort(
    (a, b) => normalizeExerciseName(a).compareTo(normalizeExerciseName(b)),
  );
  return out;
}

Iterable<String> _exerciseBankOptionsForQuery(String rawQuery) {
  final q = normalizeExerciseName(rawQuery);
  final sorted = _sortedExerciseBankOptions();
  if (q.isEmpty) return sorted.take(50);
  return sorted.where((option) => normalizeExerciseName(option).contains(q));
}

/// Picks a normalized exercise name (bank + manual). Returns null if cancelled.
Future<String?> showExerciseReassignPickerDialog(
  BuildContext context, {
  required String initialName,
}) async {
  final controller = TextEditingController(text: normalizeExerciseName(initialName));
  final locale = AppLocalizations.of(context)!;

  try {
    return await showDialog<String>(
      context: context,
      builder: (ctx) {
        final pal = IronVibePalette.of(ctx);
        void trySave() {
          final newName = normalizeExerciseName(controller.text);
          if (newName.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(locale.renameExerciseEmpty), backgroundColor: Colors.grey[900]),
            );
            return;
          }
          Navigator.pop(ctx, newName);
        }

        return StatefulBuilder(
          builder: (ctx, setModal) {
            final options = _exerciseBankOptionsForQuery(controller.text).toList();
            return AlertDialog(
              backgroundColor: pal.dialog,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: pal.borderDefault, width: 0.5),
                borderRadius: BorderRadius.circular(kIronVibeRadiusDialog),
              ),
              title: Text(
                locale.reassignHistoryExerciseTitle,
                style: TextStyle(color: pal.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      locale.reassignHistoryExerciseBody,
                      style: TextStyle(color: pal.textSecondary, fontSize: 12, height: 1.35),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: controller,
                      autofocus: true,
                      onChanged: (_) => setModal(() {}),
                      onSubmitted: (_) => trySave(),
                      inputFormatters: [_UpperCaseExerciseNameInputFormatter()],
                      style: TextStyle(color: pal.textPrimary),
                      decoration: InputDecoration(
                        hintText: locale.exerciseHint,
                        filled: true,
                        fillColor: pal.inputFill,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: pal.borderSubtle, width: 0.5),
                          borderRadius: BorderRadius.circular(kIronVibeRadiusField),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kIronVibeAccent, width: 1.6),
                          borderRadius: BorderRadius.all(Radius.circular(kIronVibeRadiusField)),
                        ),
                      ),
                    ),
                    if (options.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 200,
                        child: Material(
                          color: pal.autocompleteBg,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: pal.borderDefault, width: 0.5),
                            borderRadius: BorderRadius.circular(kIronVibeRadiusDialog),
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: options.length,
                            itemBuilder: (BuildContext itemContext, int index) {
                              final String option = options[index];
                              return InkWell(
                                onTap: () {
                                  controller.text = normalizeExerciseName(option);
                                  controller.selection = TextSelection.fromPosition(
                                    TextPosition(offset: controller.text.length),
                                  );
                                  setModal(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    option,
                                    style: TextStyle(color: pal.textPrimary, fontSize: 13),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(locale.cancel, style: TextStyle(color: pal.textMuted)),
                ),
                TextButton(
                  onPressed: trySave,
                  child: Text(locale.save, style: TextStyle(color: pal.textPrimary, fontWeight: FontWeight.w600)),
                ),
              ],
            );
          },
        );
      },
    );
  } finally {
    controller.dispose();
  }
}

Future<void> showRenameExerciseDialog(
  BuildContext context,
  String currentName,
  void Function(String newName) onSuccess,
) async {
  final controller = TextEditingController(text: normalizeExerciseName(currentName));
  final locale = AppLocalizations.of(context)!;

  await showDialog<void>(
    context: context,
    builder: (ctx) {
      final pal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: pal.dialog,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: pal.borderDefault, width: 0.5),
          borderRadius: BorderRadius.circular(kIronVibeRadiusDialog),
        ),
        title: Text(
          locale.renameExerciseTitle,
          style: TextStyle(color: pal.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          inputFormatters: [_UpperCaseExerciseNameInputFormatter()],
          style: TextStyle(color: pal.textPrimary),
          decoration: InputDecoration(
            filled: true,
            fillColor: pal.inputFill,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: pal.borderSubtle, width: 0.5),
              borderRadius: BorderRadius.circular(kIronVibeRadiusField),
            ),
          ),
          onSubmitted: (value) {
            final newName = normalizeExerciseName(value);
            if (newName.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(locale.renameExerciseEmpty), backgroundColor: Colors.grey[900]),
              );
              return;
            }
            _renameExerciseGlobally(currentName, newName);
            onSuccess(newName);
            Navigator.pop(ctx);
          },
        ),
        actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text(locale.cancel, style: TextStyle(color: pal.textMuted)),
        ),
        TextButton(
          onPressed: () {
            final newName = normalizeExerciseName(controller.text);
            if (newName.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(locale.renameExerciseEmpty), backgroundColor: Colors.grey[900]),
              );
              return;
            }
            _renameExerciseGlobally(currentName, newName);
            onSuccess(newName);
            Navigator.pop(ctx);
          },
          child: Text(locale.save, style: TextStyle(color: pal.textPrimary, fontWeight: FontWeight.w600)),
        ),
        ],
      );
    },
  );
}

Future<bool> showRemoveExerciseFromBankDialog(
  BuildContext context,
  String exerciseName,
) async {
  final locale = AppLocalizations.of(context)!;
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      final dpal = IronVibePalette.of(dialogContext);
      return AlertDialog(
        backgroundColor: dpal.dialog,
        shape: ironVibeDialogShape(dpal),
        title: Text(
          locale.deleteFromHistory,
          style: TextStyle(color: dpal.textPrimary),
        ),
        content: Text(
          '"$exerciseName" ${locale.deleteExerciseHint}',
          style: TextStyle(color: dpal.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(
              locale.cancel,
              style: TextStyle(color: dpal.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(
              locale.delete,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      );
    },
  );
  if (confirmed != true) return false;
  ironVibeRemoveExerciseFromBank(exerciseName);
  await DataService.saveData();
  return true;
}
