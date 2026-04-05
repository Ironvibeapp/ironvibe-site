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
  Client(this.name, this.goal, {this.weight = '', this.height = '', this.notes = ''});

  Map<String, dynamic> toJson() => {
    'name': name,
    'goal': goal,
    'weight': weight,
    'height': height,
    'notes': notes,
  };

  factory Client.fromJson(Map<String, dynamic> json) => Client(
    _jsonString(json['name']),
    _jsonString(json['goal']),
    weight: _jsonString(json['weight']),
    height: _jsonString(json['height']),
    notes: _jsonString(json['notes']),
  );
}

class TrainerSession {
  final DateTime dateTime;
  final String clientName;
  final String note;
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

List<TrainerSession> trainerSchedule = [];

class DataService {
  static const String _keyExerciseBank = 'exerciseBank';
  static const String _keyWorkoutHistory = 'workoutHistory';
  static const String _keyClients = 'clients';
  static const String _keyTrainerSchedule = 'trainerSchedule';

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

    exerciseBank = _dedupeNormalizedExerciseBank(exerciseBank);
    workoutHistory = workoutHistory.map(_normalizeWorkoutLogExerciseNames).toList();
    trainerSchedule = trainerSchedule.map(_normalizeTrainerSessionExerciseNames).toList();
    await saveData();
  }

  static Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(_keyExerciseBank, exerciseBank);
    
    final historyJson = jsonEncode(workoutHistory.map((e) => e.toJson()).toList());
    await prefs.setString(_keyWorkoutHistory, historyJson);

    final clientsJson = jsonEncode(clients.map((e) => e.toJson()).toList());
    await prefs.setString(_keyClients, clientsJson);

    final scheduleJson = jsonEncode(trainerSchedule.map((e) => e.toJson()).toList());
    await prefs.setString(_keyTrainerSchedule, scheduleJson);
  }
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

  DataService.saveData();
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
          borderRadius: BorderRadius.zero,
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
              borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
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
