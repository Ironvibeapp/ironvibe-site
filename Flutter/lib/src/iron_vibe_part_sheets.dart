part of 'package:fitness_app/main.dart';

/// Spreadsheet exchange for Google Sheets and Excel.
///
/// The phone shares a CSV file. The coach opens it in Google Sheets, edits
/// sets at home, downloads CSV, and imports it back. No account and no
/// network: the file leaves the device only when the user shares it.
///
/// Rows with a known session id replace that workout. Rows without an id
/// update the only workout of that client on that day, or are added. Workouts
/// missing from the file stay. Client name, goal, and notes come from the
/// first filled row. The JSON backup is still the full copy.

enum IronVibeSheetRejection {
  notASheet,
  empty,
  personalIntoCoach,
  coachIntoPersonal,
}

class IronVibeSheetImportPlan {
  final IronVibeSheetRejection? rejection;
  final int sessionsToAdd;
  final int sessionsToUpdate;
  final int clientsToAdd;
  final int clientsToUpdate;
  final int skippedRows;

  final void Function()? _commit;
  bool _done = false;

  IronVibeSheetImportPlan._({
    this.rejection,
    this.sessionsToAdd = 0,
    this.sessionsToUpdate = 0,
    this.clientsToAdd = 0,
    this.clientsToUpdate = 0,
    this.skippedRows = 0,
    void Function()? commit,
  }) : _commit = commit;

  bool get hasChanges =>
      sessionsToAdd + sessionsToUpdate + clientsToAdd + clientsToUpdate > 0;

  void commit() {
    if (_done || rejection != null) return;
    _done = true;
    _commit?.call();
  }
}

const List<String> _kCoachColumns = [
  'date',
  'time',
  'client',
  'last_name',
  'goal',
  'body_weight',
  'height',
  'client_notes',
  'exercise',
  'type',
  'set',
  'weight',
  'reps',
  'rir',
  'duration',
  'intensity',
  'exercise_note',
  'session_note',
  'session_id',
  'client_id',
];

const List<String> _kPersonalColumns = [
  'date',
  'time',
  'exercise',
  'type',
  'set',
  'weight',
  'reps',
  'rir',
  'duration',
  'intensity',
  'exercise_note',
  'session_note',
  'session_id',
];

const Set<String> _kCoachOnlyColumns = {
  'client',
  'last_name',
  'goal',
  'body_weight',
  'height',
  'client_notes',
  'client_id',
};

const Map<String, Map<String, String>> _kSheetLabels = {
  'en': {
    'date': 'Date',
    'time': 'Time',
    'client': 'Client',
    'last_name': 'Last name',
    'goal': 'Goal',
    'body_weight': 'Body weight',
    'height': 'Height',
    'client_notes': 'Client notes',
    'exercise': 'Exercise',
    'type': 'Type',
    'set': 'Set',
    'weight': 'Weight',
    'reps': 'Reps',
    'rir': 'RIR',
    'duration': 'Duration',
    'intensity': 'Intensity',
    'exercise_note': 'Exercise note',
    'session_note': 'Session note',
    'session_id': 'Session id',
    'client_id': 'Client id',
  },
  'ru': {
    'date': 'Дата',
    'time': 'Время',
    'client': 'Клиент',
    'last_name': 'Фамилия',
    'goal': 'Цель',
    'body_weight': 'Вес тела',
    'height': 'Рост',
    'client_notes': 'О клиенте',
    'exercise': 'Упражнение',
    'type': 'Тип',
    'set': 'Подход',
    'weight': 'Вес',
    'reps': 'Повторы',
    'rir': 'RIR',
    'duration': 'Длительность',
    'intensity': 'Интенсивность',
    'exercise_note': 'Заметка к упражнению',
    'session_note': 'Заметка',
    'session_id': 'Id тренировки',
    'client_id': 'Id клиента',
  },
  'uk': {
    'date': 'Дата',
    'time': 'Час',
    'client': 'Клієнт',
    'last_name': 'Прізвище',
    'goal': 'Мета',
    'body_weight': 'Вага тіла',
    'height': 'Зріст',
    'client_notes': 'Про клієнта',
    'exercise': 'Вправа',
    'type': 'Тип',
    'set': 'Підхід',
    'weight': 'Вага',
    'reps': 'Повтори',
    'rir': 'RIR',
    'duration': 'Тривалість',
    'intensity': 'Інтенсивність',
    'exercise_note': 'Нотатка до вправи',
    'session_note': 'Нотатка',
    'session_id': 'Id тренування',
    'client_id': 'Id клієнта',
  },
  'de': {
    'date': 'Datum',
    'time': 'Zeit',
    'client': 'Kunde',
    'last_name': 'Nachname',
    'goal': 'Ziel',
    'body_weight': 'Körpergewicht',
    'height': 'Größe',
    'client_notes': 'Kundennotiz',
    'exercise': 'Übung',
    'type': 'Typ',
    'set': 'Satz',
    'weight': 'Gewicht',
    'reps': 'Wdh',
    'rir': 'RIR',
    'duration': 'Dauer',
    'intensity': 'Intensität',
    'exercise_note': 'Übungsnotiz',
    'session_note': 'Trainingsnotiz',
    'session_id': 'Training-Id',
    'client_id': 'Kunden-Id',
  },
  'es': {
    'date': 'Fecha',
    'time': 'Hora',
    'client': 'Cliente',
    'last_name': 'Apellido',
    'goal': 'Objetivo',
    'body_weight': 'Peso corporal',
    'height': 'Altura',
    'client_notes': 'Notas del cliente',
    'exercise': 'Ejercicio',
    'type': 'Tipo',
    'set': 'Serie',
    'weight': 'Peso',
    'reps': 'Reps',
    'rir': 'RIR',
    'duration': 'Duración',
    'intensity': 'Intensidad',
    'exercise_note': 'Nota del ejercicio',
    'session_note': 'Nota de sesión',
    'session_id': 'Id de sesión',
    'client_id': 'Id de cliente',
  },
  'fr': {
    'date': 'Date',
    'time': 'Heure',
    'client': 'Client',
    'last_name': 'Nom',
    'goal': 'Objectif',
    'body_weight': 'Poids du corps',
    'height': 'Taille',
    'client_notes': 'Notes client',
    'exercise': 'Exercice',
    'type': 'Type',
    'set': 'Série',
    'weight': 'Poids',
    'reps': 'Reps',
    'rir': 'RIR',
    'duration': 'Durée',
    'intensity': 'Intensité',
    'exercise_note': 'Note d\'exercice',
    'session_note': 'Note de séance',
    'session_id': 'Id séance',
    'client_id': 'Id client',
  },
  'it': {
    'date': 'Data',
    'time': 'Ora',
    'client': 'Cliente',
    'last_name': 'Cognome',
    'goal': 'Obiettivo',
    'body_weight': 'Peso corporeo',
    'height': 'Altezza',
    'client_notes': 'Note cliente',
    'exercise': 'Esercizio',
    'type': 'Tipo',
    'set': 'Serie',
    'weight': 'Peso',
    'reps': 'Rip',
    'rir': 'RIR',
    'duration': 'Durata',
    'intensity': 'Intensità',
    'exercise_note': 'Nota esercizio',
    'session_note': 'Nota sessione',
    'session_id': 'Id sessione',
    'client_id': 'Id cliente',
  },
  'pt': {
    'date': 'Data',
    'time': 'Hora',
    'client': 'Cliente',
    'last_name': 'Apelido',
    'goal': 'Objetivo',
    'body_weight': 'Peso corporal',
    'height': 'Altura',
    'client_notes': 'Notas do cliente',
    'exercise': 'Exercício',
    'type': 'Tipo',
    'set': 'Série',
    'weight': 'Peso',
    'reps': 'Reps',
    'rir': 'RIR',
    'duration': 'Duração',
    'intensity': 'Intensidade',
    'exercise_note': 'Nota do exercício',
    'session_note': 'Nota da sessão',
    'session_id': 'Id da sessão',
    'client_id': 'Id do cliente',
  },
  'pl': {
    'date': 'Data',
    'time': 'Godzina',
    'client': 'Klient',
    'last_name': 'Nazwisko',
    'goal': 'Cel',
    'body_weight': 'Masa ciała',
    'height': 'Wzrost',
    'client_notes': 'Notatki o kliencie',
    'exercise': 'Ćwiczenie',
    'type': 'Typ',
    'set': 'Seria',
    'weight': 'Ciężar',
    'reps': 'Powt.',
    'rir': 'RIR',
    'duration': 'Czas',
    'intensity': 'Intensywność',
    'exercise_note': 'Notatka ćwiczenia',
    'session_note': 'Notatka sesji',
    'session_id': 'Id sesji',
    'client_id': 'Id klienta',
  },
  'zh': {
    'date': '日期',
    'time': '时间',
    'client': '客户',
    'last_name': '姓',
    'goal': '目标',
    'body_weight': '体重',
    'height': '身高',
    'client_notes': '客户备注',
    'exercise': '动作',
    'type': '类型',
    'set': '组',
    'weight': '重量',
    'reps': '次数',
    'rir': 'RIR',
    'duration': '时长',
    'intensity': '强度',
    'exercise_note': '动作备注',
    'session_note': '训练备注',
    'session_id': '训练ID',
    'client_id': '客户ID',
  },
  'hi': {
    'date': 'तारीख',
    'time': 'समय',
    'client': 'क्लाइंट',
    'last_name': 'उपनाम',
    'goal': 'लक्ष्य',
    'body_weight': 'शरीर का वजन',
    'height': 'कद',
    'client_notes': 'क्लाइंट नोट',
    'exercise': 'एक्सरसाइज़',
    'type': 'प्रकार',
    'set': 'सेट',
    'weight': 'वजन',
    'reps': 'रेप्स',
    'rir': 'RIR',
    'duration': 'अवधि',
    'intensity': 'तीव्रता',
    'exercise_note': 'व्यायाम नोट',
    'session_note': 'सत्र नोट',
    'session_id': 'सत्र आईडी',
    'client_id': 'क्लाइंट आईडी',
  },
  'ar': {
    'date': 'التاريخ',
    'time': 'الوقت',
    'client': 'العميل',
    'last_name': 'اللقب',
    'goal': 'الهدف',
    'body_weight': 'وزن الجسم',
    'height': 'الطول',
    'client_notes': 'ملاحظات العميل',
    'exercise': 'التمرين',
    'type': 'النوع',
    'set': 'مجموعة',
    'weight': 'الوزن',
    'reps': 'التكرارات',
    'rir': 'RIR',
    'duration': 'المدة',
    'intensity': 'الشدة',
    'exercise_note': 'ملاحظة التمرين',
    'session_note': 'ملاحظة الجلسة',
    'session_id': 'معرّف الجلسة',
    'client_id': 'معرّف العميل',
  },
};

const Map<String, String> _kStrengthWord = {
  'en': 'strength',
  'ru': 'силовая',
  'uk': 'силова',
  'de': 'Kraft',
  'es': 'fuerza',
  'fr': 'force',
  'it': 'forza',
  'pt': 'força',
  'pl': 'siła',
  'zh': '力量',
  'hi': 'शक्ति',
  'ar': 'قوة',
};

const Map<String, String> _kCardioWord = {
  'en': 'cardio',
  'ru': 'кардио',
  'uk': 'кардіо',
  'de': 'Cardio',
  'es': 'cardio',
  'fr': 'cardio',
  'it': 'cardio',
  'pt': 'cardio',
  'pl': 'cardio',
  'zh': '有氧',
  'hi': 'कार्डियो',
  'ar': 'كارديو',
};

const List<(String, String)> _kExtraHeaderAliases = [
  ('name', 'client'),
  ('first name', 'client'),
  ('firstname', 'client'),
  ('имя', 'client'),
  ('surname', 'last_name'),
  ('lastname', 'last_name'),
  ('family name', 'last_name'),
  ('workout id', 'session_id'),
  ('workout_id', 'session_id'),
  ('упражнения', 'exercise'),
  ('повторения', 'reps'),
  ('повторений', 'reps'),
  ('повторов', 'reps'),
  ('bodyweight', 'body_weight'),
];

Map<String, String>? _sheetHeaderFields;

Map<String, String> get ironVibeSheetHeaderFields =>
    _sheetHeaderFields ??= _buildSheetHeaderFields();

Map<String, String> _buildSheetHeaderFields() {
  final map = <String, String>{};
  void add(String alias, String field) {
    final key = ironVibeNormalizeSheetHeader(alias);
    if (key.isEmpty) return;
    final prev = map[key];
    if (prev != null && prev != field) {
      throw StateError('Sheet header "$key" is both $prev and $field');
    }
    map[key] = field;
  }

  for (final field in _kCoachColumns) {
    add(field, field);
    add(field.replaceAll('_', ' '), field);
  }
  for (final labels in _kSheetLabels.values) {
    for (final entry in labels.entries) {
      add(entry.value, entry.key);
    }
  }
  for (final extra in _kExtraHeaderAliases) {
    add(extra.$1, extra.$2);
  }
  return map;
}

Set<String>? _strengthTokens;
Set<String>? _cardioTokens;

Set<String> get _strengthTokenSet => _strengthTokens ??= {
  for (final word in _kStrengthWord.values) word.trim().toLowerCase(),
  'strength',
  'силовая',
  'силовое',
  'силова',
};

Set<String> get _cardioTokenSet => _cardioTokens ??= {
  for (final word in _kCardioWord.values) word.trim().toLowerCase(),
  'cardio',
  'кардио',
  'кардіо',
  'kardio',
};

String ironVibeNormalizeSheetHeader(String raw) {
  var s = raw.replaceAll('\uFEFF', '').trim().toLowerCase();
  s = s.replaceAll(RegExp(r'[_\-]+'), ' ');
  s = s.replaceAll(RegExp(r'\([^)]*\)'), ' ');
  s = s.replaceAll(RegExp(r'[:*#]+'), ' ');
  s = s.replaceAll(RegExp(r'\s+'), ' ').trim();
  return s;
}

bool ironVibeSheetHasExportableData({required bool coach}) {
  if (!coach) return workoutHistory.isNotEmpty;
  if (clients.isNotEmpty) return true;
  return trainerSchedule.any((s) => !ironVibeTrainerSessionIsAbandonedStub(s));
}

String ironVibeBuildSheetCsv({
  required bool coach,
  String languageCode = 'en',
}) {
  final lang = _kSheetLabels.containsKey(languageCode) ? languageCode : 'en';
  final labels = _kSheetLabels[lang]!;
  final columns = coach ? _kCoachColumns : _kPersonalColumns;
  final rows = <List<String>>[
    [for (final column in columns) labels[column]!],
  ];
  if (coach) {
    rows.addAll(_coachSheetRows(columns, lang));
  } else {
    rows.addAll(_personalSheetRows(columns, lang));
  }
  return Csv(quoteMode: QuoteMode.always, addBom: true).encode(rows);
}

List<List<String>> _coachSheetRows(List<String> columns, String lang) {
  final rows = <List<String>>[];
  final owned = <TrainerSession>{};
  final roster = [...clients]
    ..sort((a, b) {
      return ironVibeClientDisplayName(
        a.name,
        lastName: a.lastName,
      ).toLowerCase().compareTo(
        ironVibeClientDisplayName(b.name, lastName: b.lastName).toLowerCase(),
      );
    });
  for (final client in roster) {
    final sessions =
        trainerSchedule
            .where((s) => _sheetSessionOwnedBy(s, client))
            .where((s) => !ironVibeTrainerSessionIsAbandonedStub(s))
            .toList()
          ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    if (sessions.isEmpty) {
      rows.add(_profileRow(columns, client));
      continue;
    }
    for (final session in sessions) {
      owned.add(session);
      rows.addAll(_sessionRows(columns, lang, session, client));
    }
  }
  final orphans =
      trainerSchedule
          .where((s) => !owned.contains(s))
          .where((s) => !ironVibeTrainerSessionIsAbandonedStub(s))
          .toList()
        ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  for (final session in orphans) {
    rows.addAll(_sessionRows(columns, lang, session, null));
  }
  return rows;
}

List<List<String>> _personalSheetRows(List<String> columns, String lang) {
  final logs = [...workoutHistory]..sort((a, b) => a.date.compareTo(b.date));
  final rows = <List<String>>[];
  for (final log in logs) {
    rows.addAll(_workoutRows(columns, lang, log));
  }
  return rows;
}

List<String> _profileRow(List<String> columns, Client client) {
  return _cells(columns, {
    'client': client.name,
    'last_name': client.lastName,
    'goal': client.goal,
    'body_weight': client.weight,
    'height': client.height,
    'client_notes': client.notes,
    'client_id': client.id ?? '',
  });
}

List<List<String>> _sessionRows(
  List<String> columns,
  String lang,
  TrainerSession session,
  Client? client,
) {
  final shared = <String, String>{
    'date': _formatSheetDate(session.dateTime),
    'time': _formatSheetTime(session.dateTime),
    'client': client?.name ?? session.clientName,
    'last_name': client?.lastName ?? session.clientLastName,
    'goal': client?.goal ?? '',
    'body_weight': client?.weight ?? '',
    'height': client?.height ?? '',
    'client_notes': client?.notes ?? '',
    'session_note': session.note,
    'session_id': session.id ?? '',
    'client_id': client?.id ?? session.clientId ?? '',
  };
  return _exerciseRows(columns, lang, shared, session.exercises, session.note);
}

List<List<String>> _workoutRows(
  List<String> columns,
  String lang,
  WorkoutLog log,
) {
  final shared = <String, String>{
    'date': _formatSheetDate(log.date),
    'time': _formatSheetTime(log.date),
    'session_id': log.id ?? '',
  };
  return _exerciseRows(columns, lang, shared, log.exercises, '');
}

List<List<String>> _exerciseRows(
  List<String> columns,
  String lang,
  Map<String, String> shared,
  List<ExerciseLog> exercises,
  String note,
) {
  if (exercises.isEmpty) {
    return [
      _cells(columns, {...shared, 'session_note': note}),
    ];
  }
  final rows = <List<String>>[];
  for (final exercise in exercises) {
    final cardio = exercise.isCardio || exercise.sets.any((s) => s.isCardio);
    final typeWord = cardio
        ? (_kCardioWord[lang] ?? 'cardio')
        : (_kStrengthWord[lang] ?? 'strength');
    if (exercise.sets.isEmpty) {
      rows.add(
        _cells(columns, {
          ...shared,
          'exercise': exercise.name,
          'type': typeWord,
          'exercise_note': exercise.note,
        }),
      );
      continue;
    }
    for (var i = 0; i < exercise.sets.length; i++) {
      final set = exercise.sets[i];
      rows.add(
        _cells(columns, {
          ...shared,
          'exercise': exercise.name,
          'type': typeWord,
          'set': '${i + 1}',
          'weight': cardio ? '' : set.weight,
          'reps': cardio ? '' : set.reps,
          'rir': cardio ? '' : set.rir,
          'duration': cardio ? set.duration : '',
          'intensity': cardio ? set.intensity : '',
          'exercise_note': exercise.note,
        }),
      );
    }
  }
  return rows;
}

List<String> _cells(List<String> columns, Map<String, String> values) {
  return [
    for (final column in columns) _guardSheetFormula(values[column] ?? ''),
  ];
}

String _guardSheetFormula(String value) {
  if (value.isEmpty) return value;
  final c = value[0];
  if (c == '=' || c == '+' || c == '@' || c == '\t' || c == '\r') {
    return "'$value";
  }
  if (c == '-' && (value.length == 1 || !_isDigit(value[1]))) {
    return "'$value";
  }
  return value;
}

bool _isDigit(String ch) {
  if (ch.isEmpty) return false;
  final code = ch.codeUnitAt(0);
  return code >= 48 && code <= 57;
}

bool _sheetSessionOwnedBy(TrainerSession session, Client client) {
  final sessionId = session.clientId?.trim();
  final clientId = client.id?.trim();
  if (sessionId != null &&
      sessionId.isNotEmpty &&
      clientId != null &&
      clientId.isNotEmpty) {
    return sessionId == clientId;
  }
  return ironVibeClientIdentityKey(
        session.clientName,
        lastName: session.clientLastName,
      ) ==
      ironVibeClientIdentityKey(client.name, lastName: client.lastName);
}

String _formatSheetDate(DateTime dt) {
  final y = dt.year.toString().padLeft(4, '0');
  final m = dt.month.toString().padLeft(2, '0');
  final d = dt.day.toString().padLeft(2, '0');
  return '$y-$m-$d';
}

String _formatSheetTime(DateTime dt) {
  final h = dt.hour.toString().padLeft(2, '0');
  final m = dt.minute.toString().padLeft(2, '0');
  return '$h:$m';
}

IronVibeSheetImportPlan ironVibePlanSheetImport(
  String csv, {
  required bool coach,
}) {
  final table = _parseSheetTable(csv);
  if (table == null) {
    return IronVibeSheetImportPlan._(
      rejection: IronVibeSheetRejection.notASheet,
    );
  }
  if (table.rows.isEmpty) {
    return IronVibeSheetImportPlan._(rejection: IronVibeSheetRejection.empty);
  }
  if (coach && !table.coachFile) {
    return IronVibeSheetImportPlan._(
      rejection: IronVibeSheetRejection.personalIntoCoach,
    );
  }
  if (!coach && table.coachFile) {
    return IronVibeSheetImportPlan._(
      rejection: IronVibeSheetRejection.coachIntoPersonal,
    );
  }
  if (coach) return _planCoachSheet(table);
  return _planPersonalSheet(table);
}

class _SheetTable {
  final Set<String> columns;
  final List<_SheetRow> rows;
  final bool coachFile;
  const _SheetTable({
    required this.columns,
    required this.rows,
    required this.coachFile,
  });

  bool has(String column) => columns.contains(column);
}

class _SheetRow {
  final Map<String, String> values;
  final DateTime? when;
  final bool badDate;
  final int order;
  String personKey = '';

  _SheetRow({
    required this.values,
    required this.when,
    required this.badDate,
    required this.order,
  });

  String get(String field) => values[field] ?? '';
}

_SheetTable? _parseSheetTable(String raw) {
  final decoded = _decodeSheetRows(raw);
  if (decoded == null || decoded.isEmpty) return null;

  var headerAt = -1;
  Map<int, String>? columnByIndex;
  var bestScore = 1;
  for (var i = 0; i < decoded.length && i < 30; i++) {
    final mapped = <int, String>{};
    for (var c = 0; c < decoded[i].length; c++) {
      final field =
          ironVibeSheetHeaderFields[ironVibeNormalizeSheetHeader(
            decoded[i][c],
          )];
      if (field == null || mapped.containsValue(field)) continue;
      mapped[c] = field;
    }
    final useful =
        mapped.containsValue('date') ||
        mapped.containsValue('exercise') ||
        mapped.containsValue('client');
    if (useful && mapped.length > bestScore) {
      bestScore = mapped.length;
      headerAt = i;
      columnByIndex = mapped;
    }
  }
  if (headerAt < 0 || columnByIndex == null) return null;

  final columns = columnByIndex.values.toSet();
  final rows = <_SheetRow>[];
  for (var i = headerAt + 1; i < decoded.length; i++) {
    final source = decoded[i];
    final values = <String, String>{};
    var any = false;
    for (final entry in columnByIndex.entries) {
      final rawCell = entry.key < source.length ? source[entry.key] : '';
      final cell = _cleanSheetCell(rawCell);
      if (cell.isNotEmpty) any = true;
      values[entry.value] = cell;
    }
    if (!any) continue;
    final dateRaw = values['date'] ?? '';
    DateTime? when;
    var badDate = false;
    if (dateRaw.isNotEmpty) {
      when = _parseSheetWhen(dateRaw, values['time'] ?? '');
      if (when == null && (values['session_id'] ?? '').isEmpty) {
        badDate = true;
      }
    }
    rows.add(
      _SheetRow(
        values: values,
        when: when,
        badDate: badDate,
        order: rows.length,
      ),
    );
  }
  return _SheetTable(
    columns: columns,
    rows: rows,
    coachFile: columns.any(_kCoachOnlyColumns.contains),
  );
}

List<List<String>>? _decodeSheetRows(String raw) {
  var text = raw;
  if (text.startsWith('\uFEFF')) text = text.substring(1);
  String? forced;
  final sepMatch = RegExp(
    r'^sep=(.+?)(?:\r\n|\n|\r)',
    caseSensitive: false,
  ).firstMatch(text);
  if (sepMatch != null) {
    final spec = sepMatch.group(1)!.trim();
    if (spec.isNotEmpty) forced = spec.substring(0, 1);
    text = text.substring(sepMatch.end);
  }
  try {
    if (forced != null) {
      return _decodeWithDelimiter(text, forced);
    }
    List<List<String>>? best;
    var bestScore = 1;
    for (final delimiter in [',', ';', '\t']) {
      final rows = _decodeWithDelimiter(text, delimiter);
      final score = _headerScore(rows);
      if (score > bestScore) {
        bestScore = score;
        best = rows;
      }
    }
    return best;
  } catch (_) {
    return null;
  }
}

List<List<String>> _decodeWithDelimiter(String text, String delimiter) {
  final decoded = CsvDecoder(
    fieldDelimiter: delimiter,
    skipEmptyLines: true,
  ).convert(text);
  return [
    for (final row in decoded) [for (final cell in row) _cellText(cell)],
  ];
}

int _headerScore(List<List<String>> rows) {
  var best = 0;
  for (var i = 0; i < rows.length && i < 15; i++) {
    final seen = <String>{};
    for (final cell in rows[i]) {
      final field =
          ironVibeSheetHeaderFields[ironVibeNormalizeSheetHeader(cell)];
      if (field != null) seen.add(field);
    }
    if (seen.length > best) best = seen.length;
  }
  return best;
}

String _cellText(dynamic value) {
  if (value == null) return '';
  return value.toString();
}

String _cleanSheetCell(String raw) {
  var s = raw.replaceAll('\u0000', '').replaceAll('\uFEFF', '').trim();
  if (s.startsWith("'") && s.length > 1) s = s.substring(1).trim();
  return s;
}

bool _rowIsSession(Map<String, String> values) {
  if (normalizeExerciseName(values['exercise'] ?? '').isNotEmpty) return true;
  if ((values['weight'] ?? '').isNotEmpty ||
      (values['reps'] ?? '').isNotEmpty ||
      (values['rir'] ?? '').isNotEmpty ||
      (values['duration'] ?? '').isNotEmpty ||
      (values['intensity'] ?? '').isNotEmpty) {
    return true;
  }
  if ((values['session_id'] ?? '').isNotEmpty) return true;
  if ((values['date'] ?? '').isNotEmpty &&
      (values['session_note'] ?? '').isNotEmpty) {
    return true;
  }
  return false;
}

DateTime? _parseSheetWhen(String dateRaw, String timeRaw) {
  final dateText = dateRaw.trim();
  final timeText = timeRaw.trim();
  if (dateText.isEmpty) return null;

  final isoDate = RegExp(r'^(\d{4})-(\d{1,2})-(\d{1,2})$').firstMatch(dateText);
  if (isoDate != null) {
    return _dateWithClock(
      int.parse(isoDate.group(1)!),
      int.parse(isoDate.group(2)!),
      int.parse(isoDate.group(3)!),
      timeText,
    );
  }

  final serial = _parseExcelSerial(dateText);
  if (serial != null) {
    final clock = _parseClock(timeText);
    if (clock == null) return serial;
    return DateTime(serial.year, serial.month, serial.day, clock.$1, clock.$2);
  }

  final combined = RegExp(
    r'^(.+?)[ T](\d{1,2}:\d{2}(?::\d{2})?)$',
  ).firstMatch(dateText);
  var datePart = dateText;
  var clockText = timeText;
  if (combined != null) {
    datePart = combined.group(1)!.trim();
    if (clockText.isEmpty) clockText = combined.group(2)!;
  }

  if (datePart.contains('T')) {
    final iso = DateTime.tryParse(dateText);
    if (iso != null) {
      final local = iso.isUtc ? iso.toLocal() : iso;
      return DateTime(
        local.year,
        local.month,
        local.day,
        local.hour,
        local.minute,
      );
    }
  }

  final ymd = RegExp(
    r'^(\d{4})[./](\d{1,2})[./](\d{1,2})$',
  ).firstMatch(datePart);
  if (ymd != null) {
    return _dateWithClock(
      int.parse(ymd.group(1)!),
      int.parse(ymd.group(2)!),
      int.parse(ymd.group(3)!),
      clockText,
    );
  }

  final dmy = RegExp(
    r'^(\d{1,2})[./](\d{1,2})[./](\d{4})$',
  ).firstMatch(datePart);
  if (dmy != null) {
    final a = int.parse(dmy.group(1)!);
    final b = int.parse(dmy.group(2)!);
    final year = int.parse(dmy.group(3)!);
    late final int day;
    late final int month;
    if (a > 12 && b <= 12) {
      day = a;
      month = b;
    } else if (b > 12 && a <= 12) {
      month = a;
      day = b;
    } else {
      day = a;
      month = b;
    }
    return _dateWithClock(year, month, day, clockText);
  }
  return null;
}

DateTime? _parseExcelSerial(String raw) {
  if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(raw)) return null;
  final value = double.tryParse(raw);
  if (value == null || value < 20000 || value > 80000) return null;
  final whole = value.floor();
  final base = DateTime.utc(1899, 12, 30).add(Duration(days: whole));
  final minutes = ((value - whole) * 24 * 60).round();
  final withTime = base.add(Duration(minutes: minutes));
  return DateTime(
    withTime.year,
    withTime.month,
    withTime.day,
    withTime.hour,
    withTime.minute,
  );
}

DateTime? _dateWithClock(int year, int month, int day, String timeText) {
  if (month < 1 || month > 12 || day < 1 || day > 31) return null;
  final clock = _parseClock(timeText);
  final date = clock == null
      ? DateTime(year, month, day)
      : DateTime(year, month, day, clock.$1, clock.$2);
  if (date.month != month || date.day != day) return null;
  return date;
}

(int, int)? _parseClock(String raw) {
  final match = RegExp(r'^(\d{1,2}):(\d{2})').firstMatch(raw.trim());
  if (match == null) return null;
  final hour = int.parse(match.group(1)!);
  final minute = int.parse(match.group(2)!);
  if (hour > 23 || minute > 59) return null;
  return (hour, minute);
}

String _canonSheetQty(String raw) {
  final text = raw.trim();
  final match = RegExp(r'^(-?\d+)\.0+$').firstMatch(text);
  if (match != null) return match.group(1)!;
  return text;
}

bool _sameSheetQty(String a, String b) =>
    _canonSheetQty(a) == _canonSheetQty(b);

bool _sameSheetMinute(DateTime a, DateTime b) =>
    a.year == b.year &&
    a.month == b.month &&
    a.day == b.day &&
    a.hour == b.hour &&
    a.minute == b.minute;

bool _sameSheetDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

String _sheetDayToken(DateTime dt) =>
    '${dt.year.toString().padLeft(4, '0')}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';

String _sheetTimeToken(DateTime dt) =>
    '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

bool? _parseSheetType(String raw) {
  var text = raw.trim().toLowerCase();
  if (text.endsWith('.')) text = text.substring(0, text.length - 1).trim();
  if (text.isEmpty) return null;
  if (_strengthTokenSet.contains(text)) return false;
  if (_cardioTokenSet.contains(text)) return true;
  return null;
}

int? _parseSheetSetNumber(String raw) {
  final text = _canonSheetQty(raw.trim());
  if (text.isEmpty) return null;
  final value = int.tryParse(text);
  if (value == null || value <= 0) return null;
  return value;
}

class _BuiltExercise {
  final String name;
  final bool cardio;
  final List<SetLog> sets = [];
  int? lastSetNumber;
  String note;
  _BuiltExercise(this.name, this.cardio, {this.note = ''});
}

List<ExerciseLog> _exercisesFromRows(List<_SheetRow> rows) {
  final built = <_BuiltExercise>[];
  final ordered = [...rows]..sort((a, b) => a.order.compareTo(b.order));
  for (final row in ordered) {
    final name = normalizeExerciseName(row.get('exercise'));
    if (name.isEmpty) continue;
    final explicit = _parseSheetType(row.get('type'));
    final hasStrength =
        row.get('weight').isNotEmpty ||
        row.get('reps').isNotEmpty ||
        normalizeRirStored(row.get('rir')).isNotEmpty;
    final hasCardio =
        row.get('duration').isNotEmpty || row.get('intensity').isNotEmpty;
    final cardio = explicit ?? (hasCardio && !hasStrength);
    final setNumber = _parseSheetSetNumber(row.get('set'));
    final note = row.get('exercise_note').trim();
    final restart =
        setNumber != null &&
        built.isNotEmpty &&
        built.last.name == name &&
        built.last.cardio == cardio &&
        built.last.lastSetNumber != null &&
        setNumber <= built.last.lastSetNumber!;
    if (built.isEmpty ||
        built.last.name != name ||
        built.last.cardio != cardio ||
        restart) {
      built.add(_BuiltExercise(name, cardio, note: note));
    } else if (built.last.note.isEmpty && note.isNotEmpty) {
      built.last.note = note;
    }
    built.last.sets.add(_setFromRow(row, cardio));
    if (setNumber != null) built.last.lastSetNumber = setNumber;
  }
  return [
    for (final exercise in built)
      ExerciseLog(
        exercise.name,
        exercise.sets,
        isCardio: exercise.cardio,
        note: exercise.note,
      ),
  ];
}

SetLog _setFromRow(_SheetRow row, bool cardio) {
  if (cardio) {
    return SetLog(
      '',
      '',
      '',
      isCardio: true,
      duration: _canonSheetQty(row.get('duration')),
      intensity: _canonSheetQty(row.get('intensity')),
    );
  }
  return SetLog(
    _canonSheetQty(row.get('weight')),
    _canonSheetQty(row.get('reps')),
    normalizeRirStored(_canonSheetQty(row.get('rir'))),
  );
}

/// A spreadsheet saved before the exercise-note column existed should not
/// wipe notes that already live on the phone.
List<ExerciseLog> _sheetKeepExerciseNotes(
  List<ExerciseLog> previous,
  List<ExerciseLog> next,
) {
  if (previous.length != next.length) return next;
  return [
    for (var i = 0; i < next.length; i++)
      normalizeExerciseName(previous[i].name) ==
                  normalizeExerciseName(next[i].name) &&
              previous[i].isCardio == next[i].isCardio
          ? ExerciseLog(
              next[i].name,
              next[i].sets,
              isCardio: next[i].isCardio,
              note: previous[i].note,
            )
          : next[i],
  ];
}

bool _sameSheetExercises(List<ExerciseLog> a, List<ExerciseLog> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (normalizeExerciseName(a[i].name) != normalizeExerciseName(b[i].name)) {
      return false;
    }
    if (a[i].isCardio != b[i].isCardio) return false;
    if (a[i].note.trim() != b[i].note.trim()) return false;
    if (a[i].sets.length != b[i].sets.length) return false;
    for (var j = 0; j < a[i].sets.length; j++) {
      final left = a[i].sets[j];
      final right = b[i].sets[j];
      if (!_sameSheetQty(left.weight, right.weight) ||
          !_sameSheetQty(left.reps, right.reps) ||
          normalizeRirStored(left.rir) != normalizeRirStored(right.rir) ||
          !_sameSheetQty(left.duration, right.duration) ||
          !_sameSheetQty(left.intensity, right.intensity) ||
          left.isCardio != right.isCardio) {
        return false;
      }
    }
  }
  return true;
}

class _ClientBucket {
  String sheetId = '';
  String name = '';
  String lastName = '';
  String goal = '';
  String bodyWeight = '';
  String height = '';
  String notes = '';
  Client? existing;
  Client? created;
  bool changed = false;

  String get resolvedName => existing?.name ?? created?.name ?? name;

  String get resolvedLastName {
    if (lastName.isNotEmpty) return lastName;
    return existing?.lastName ?? created?.lastName ?? '';
  }

  String? get resolvedId => existing?.id ?? created?.id;
}

class _ClientPatch {
  final Client target;
  final String? lastName;
  final String? goal;
  final String? weight;
  final String? height;
  final String? notes;
  const _ClientPatch({
    required this.target,
    this.lastName,
    this.goal,
    this.weight,
    this.height,
    this.notes,
  });
}

class _SessionWrite {
  final String? replaceId;
  final TrainerSession session;
  const _SessionWrite({required this.replaceId, required this.session});
}

class _WorkoutWrite {
  final String? replaceId;
  final WorkoutLog log;
  const _WorkoutWrite({required this.replaceId, required this.log});
}

void _absorbClient(_ClientBucket bucket, _SheetRow row) {
  final id = row.get('client_id');
  if (bucket.sheetId.isEmpty && id.isNotEmpty) bucket.sheetId = id;
  final name = row.get('client');
  if (bucket.name.isEmpty && name.isNotEmpty) bucket.name = name.trim();
  final last = row.get('last_name');
  if (bucket.lastName.isEmpty && last.isNotEmpty) bucket.lastName = last.trim();
  final goal = row.get('goal');
  if (bucket.goal.isEmpty && goal.isNotEmpty) bucket.goal = goal.trim();
  final weight = row.get('body_weight');
  if (bucket.bodyWeight.isEmpty && weight.isNotEmpty) {
    bucket.bodyWeight = _canonSheetQty(weight);
  }
  final height = row.get('height');
  if (bucket.height.isEmpty && height.isNotEmpty) {
    bucket.height = _canonSheetQty(height);
  }
  final notes = row.get('client_notes');
  if (bucket.notes.isEmpty && notes.isNotEmpty) bucket.notes = notes.trim();
}

String _directPersonKey(_SheetRow row) {
  final id = row.get('client_id');
  if (id.isNotEmpty) return 'id:$id';
  final name = row.get('client');
  if (name.isEmpty) return '';
  final last = row.get('last_name');
  if (last.isEmpty) {
    final matches = clients
        .where(
          (client) =>
              ironVibeClientNameKey(client.name) == ironVibeClientNameKey(name),
        )
        .toList();
    final matchId = matches.length == 1 ? matches.single.id?.trim() : null;
    if (matchId != null && matchId.isNotEmpty) return 'id:$matchId';
  }
  return 'name:${ironVibeClientIdentityKey(name, lastName: last)}';
}

IronVibeSheetImportPlan _planCoachSheet(_SheetTable table) {
  final buckets = <String, _ClientBucket>{};
  var carryKey = '';
  var carrySession = '';
  DateTime? carryWhen;
  var skipped = 0;

  for (final row in table.rows) {
    var key = _directPersonKey(row);
    final sessionRow = _rowIsSession(row.values);
    if (key.isEmpty && carryKey.isNotEmpty && sessionRow) {
      final sameId =
          row.get('session_id').isNotEmpty &&
          row.get('session_id') == carrySession;
      final sameDay =
          row.when != null &&
          carryWhen != null &&
          _sameSheetDay(row.when!, carryWhen);
      if (sameId || sameDay) key = carryKey;
    }
    row.personKey = key;
    if (key.isEmpty) {
      if (!sessionRow && row.values.values.any((value) => value.isNotEmpty)) {
        skipped++;
      }
      continue;
    }
    _absorbClient(buckets.putIfAbsent(key, _ClientBucket.new), row);
    if (row.get('client').isNotEmpty || row.get('client_id').isNotEmpty) {
      carryKey = key;
      if (row.get('session_id').isNotEmpty) {
        carrySession = row.get('session_id');
      }
      carryWhen = row.when ?? carryWhen;
    }
  }

  final takenIds = clients.map((c) => c.id).whereType<String>().toSet();
  final patches = <_ClientPatch>[];
  final newClients = <Client>[];
  for (final bucket in buckets.values) {
    Client? existing;
    if (bucket.sheetId.isNotEmpty) {
      for (final client in clients) {
        if (client.id == bucket.sheetId) {
          existing = client;
          break;
        }
      }
    }
    existing ??= _matchClientByName(bucket.name, bucket.lastName);
    if (existing != null) {
      bucket.existing = existing;
      final patch = _patchClient(existing, bucket);
      if (patch != null) {
        bucket.changed = true;
        patches.add(patch);
      }
      continue;
    }
    if (bucket.name.trim().isEmpty) continue;
    var id = bucket.sheetId;
    if (id.isEmpty || takenIds.contains(id)) id = ironVibeNewEntityId();
    takenIds.add(id);
    final created = Client(
      bucket.name.trim(),
      bucket.goal,
      id: id,
      lastName: bucket.lastName,
      weight: bucket.bodyWeight,
      height: bucket.height,
      notes: bucket.notes,
    );
    bucket.created = created;
    newClients.add(created);
  }

  final groups = <String, List<_SheetRow>>{};
  final groupOrder = <String>[];
  for (final row in table.rows) {
    if (!_rowIsSession(row.values)) continue;
    if (normalizeExerciseName(row.get('exercise')).isEmpty &&
        (row.get('weight').isNotEmpty ||
            row.get('reps').isNotEmpty ||
            row.get('rir').isNotEmpty ||
            row.get('duration').isNotEmpty ||
            row.get('intensity').isNotEmpty)) {
      skipped++;
      continue;
    }
    final person = row.personKey;
    if (person.isEmpty) {
      skipped++;
      continue;
    }
    final bucket = buckets[person];
    if (bucket == null || bucket.resolvedId == null && bucket.name.isEmpty) {
      skipped++;
      continue;
    }
    final sessionId = row.get('session_id');
    final String groupKey;
    if (sessionId.isNotEmpty) {
      groupKey = 'id:$sessionId';
    } else if (row.when != null) {
      groupKey =
          'day:$person|${_sheetDayToken(row.when!)}|${_sheetTimeToken(row.when!)}';
    } else {
      skipped++;
      continue;
    }
    final list = groups.putIfAbsent(groupKey, () {
      groupOrder.add(groupKey);
      return <_SheetRow>[];
    });
    list.add(row);
  }

  final claimed = <String>{};
  final claimedSessions = <TrainerSession>{};
  final writes = <_SessionWrite>[];
  var added = 0;
  var updated = 0;
  final idGroups = groupOrder.where((key) => key.startsWith('id:')).toList();
  final dayGroups = groupOrder.where((key) => key.startsWith('day:')).toList();

  void takeGroup(String key) {
    final rows = groups[key]!;
    final badRows = rows.where((row) => row.badDate).length;
    if (badRows == rows.length) {
      skipped += rows.length;
      return;
    }
    skipped += badRows;
    final usable = rows.where((row) => !row.badDate).toList();
    final person = usable.first.personKey;
    final bucket = buckets[person];
    if (bucket == null || (bucket.resolvedId == null && bucket.name.isEmpty)) {
      skipped += usable.length;
      return;
    }
    final sessionId = usable
        .map((row) => row.get('session_id'))
        .firstWhere((id) => id.isNotEmpty, orElse: () => '');
    TrainerSession? target;
    if (sessionId.isNotEmpty) {
      for (final session in trainerSchedule) {
        if (session.id == sessionId) {
          target = session;
          break;
        }
      }
    } else {
      final when = usable
          .map((row) => row.when)
          .whereType<DateTime>()
          .firstOrNull;
      if (when == null) {
        skipped += usable.length;
        return;
      }
      final sameDay = trainerSchedule.where((session) {
        if (claimedSessions.contains(session)) return false;
        final id = session.id;
        if (id != null && claimed.contains(id)) return false;
        if (!_sessionMatchesBucket(session, bucket)) return false;
        return _sameSheetDay(session.dateTime, when);
      }).toList();
      final sameMinute = sameDay
          .where((session) => _sameSheetMinute(session.dateTime, when))
          .toList();
      if (sameMinute.length == 1) {
        target = sameMinute.single;
      } else if (sameMinute.isEmpty && sameDay.length == 1) {
        target = sameDay.single;
      } else if (sameDay.isEmpty) {
        target = null;
      } else {
        skipped += usable.length;
        return;
      }
    }
    if (target != null &&
        (claimedSessions.contains(target) ||
            (target.id != null && claimed.contains(target.id)))) {
      skipped += usable.length;
      return;
    }

    final when = _groupWhen(usable, target);
    if (when == null) {
      skipped += usable.length;
      return;
    }
    var exercises = _exercisesFromRows(usable);
    if (!table.has('exercise_note') && target != null) {
      exercises = _sheetKeepExerciseNotes(target.exercises, exercises);
    }
    final note = table.has('session_note')
        ? _firstText(usable, 'session_note')
        : (target?.note ?? '');
    if (target == null && exercises.isEmpty && note.trim().isEmpty) {
      skipped += usable.length;
      return;
    }
    final ownerName = bucket.resolvedName;
    final ownerLast = bucket.resolvedLastName;
    final ownerId = bucket.resolvedId;
    final flags = _sheetSessionFlags(
      when: when,
      exercises: exercises,
      existing: target,
    );
    final id =
        target?.id ??
        (sessionId.isNotEmpty && !claimed.contains(sessionId)
            ? sessionId
            : ironVibeNewEntityId());
    final next = TrainerSession(
      when,
      ownerName,
      note,
      exercises: exercises,
      id: id,
      clientId: ownerId,
      clientLastName: ownerLast,
      isLiveCurrent: flags.live,
      isScheduledPlan: flags.scheduled,
      isCompleted: flags.completed,
      isImportedHistory: flags.imported,
      remindMinutesBefore: target?.remindMinutesBefore,
    );
    if (target != null) {
      claimedSessions.add(target);
      final targetId = target.id;
      if (targetId != null && targetId.isNotEmpty) claimed.add(targetId);
      if (_sameTrainerSessionSheet(target, next)) return;
      updated++;
      writes.add(_SessionWrite(replaceId: target.id, session: next));
    } else {
      claimed.add(id);
      added++;
      writes.add(_SessionWrite(replaceId: null, session: next));
    }
  }

  for (final key in idGroups) {
    takeGroup(key);
  }
  for (final key in dayGroups) {
    takeGroup(key);
  }

  return IronVibeSheetImportPlan._(
    sessionsToAdd: added,
    sessionsToUpdate: updated,
    clientsToAdd: newClients.length,
    clientsToUpdate: patches.length,
    skippedRows: skipped,
    commit: () {
      clients.addAll(newClients);
      for (final patch in patches) {
        if (patch.lastName != null) patch.target.lastName = patch.lastName!;
        if (patch.goal != null) patch.target.goal = patch.goal!;
        if (patch.weight != null) patch.target.weight = patch.weight!;
        if (patch.height != null) patch.target.height = patch.height!;
        if (patch.notes != null) patch.target.notes = patch.notes!;
      }
      for (final write in writes) {
        _putTrainerSession(write);
        for (final exercise in write.session.exercises) {
          ensureExerciseInBank(exercise.name);
        }
      }
      for (final client in [...newClients, ...patches.map((p) => p.target)]) {
        ironVibeStampClientLastNameOnSessions(client);
      }
      trainerSchedule.sort((a, b) => a.dateTime.compareTo(b.dateTime));
      ironVibeEnsurePersistentIds();
    },
  );
}

Client? _matchClientByName(String name, String lastName) {
  if (name.trim().isEmpty) return null;
  final identity = ironVibeClientIdentityKey(name, lastName: lastName);
  final exact = clients
      .where(
        (client) =>
            ironVibeClientIdentityKey(client.name, lastName: client.lastName) ==
            identity,
      )
      .toList();
  if (exact.length == 1) return exact.single;
  if (lastName.trim().isEmpty) {
    final byFirst = clients
        .where(
          (client) =>
              ironVibeClientNameKey(client.name) == ironVibeClientNameKey(name),
        )
        .toList();
    if (byFirst.length == 1) return byFirst.single;
  }
  return null;
}

_ClientPatch? _patchClient(Client existing, _ClientBucket bucket) {
  final last =
      bucket.lastName.isNotEmpty &&
          bucket.lastName.trim() != existing.lastName.trim()
      ? bucket.lastName.trim()
      : null;
  final goal =
      bucket.goal.isNotEmpty && bucket.goal.trim() != existing.goal.trim()
      ? bucket.goal.trim()
      : null;
  final weight =
      bucket.bodyWeight.isNotEmpty &&
          !_sameSheetQty(bucket.bodyWeight, existing.weight)
      ? bucket.bodyWeight
      : null;
  final height =
      bucket.height.isNotEmpty && !_sameSheetQty(bucket.height, existing.height)
      ? bucket.height
      : null;
  final notes =
      bucket.notes.isNotEmpty && bucket.notes.trim() != existing.notes.trim()
      ? bucket.notes.trim()
      : null;
  if (last == null &&
      goal == null &&
      weight == null &&
      height == null &&
      notes == null) {
    return null;
  }
  return _ClientPatch(
    target: existing,
    lastName: last,
    goal: goal,
    weight: weight,
    height: height,
    notes: notes,
  );
}

bool _sessionMatchesBucket(TrainerSession session, _ClientBucket bucket) {
  final ownerId = bucket.resolvedId?.trim();
  final sessionClientId = session.clientId?.trim();
  if (ownerId != null &&
      ownerId.isNotEmpty &&
      sessionClientId != null &&
      sessionClientId.isNotEmpty) {
    return sessionClientId == ownerId;
  }
  return ironVibeClientIdentityKey(
        session.clientName,
        lastName: session.clientLastName,
      ) ==
      ironVibeClientIdentityKey(
        bucket.resolvedName,
        lastName: bucket.resolvedLastName,
      );
}

DateTime? _groupWhen(List<_SheetRow> rows, TrainerSession? existing) {
  final parsed = rows.map((row) => row.when).whereType<DateTime>().toList();
  if (parsed.isEmpty) return existing?.dateTime;
  final first = parsed.first;
  if (existing != null && _sameSheetMinute(existing.dateTime, first)) {
    return existing.dateTime;
  }
  return first;
}

String _firstText(List<_SheetRow> rows, String field) {
  for (final row in rows) {
    final value = row.get(field).trim();
    if (value.isNotEmpty) return value;
  }
  return '';
}

({bool completed, bool scheduled, bool live, bool imported})
_sheetSessionFlags({
  required DateTime when,
  required List<ExerciseLog> exercises,
  required TrainerSession? existing,
}) {
  final future = ironVibeDateOnly(
    when,
  ).isAfter(ironVibeDateOnly(DateTime.now()));
  if (existing == null) {
    final logged = exercises.any(ironVibeExerciseLogHasLoggedData);
    final named = exercises.any(
      (exercise) => normalizeExerciseName(exercise.name).isNotEmpty,
    );
    if (future) {
      return (completed: false, scheduled: true, live: false, imported: false);
    }
    return (
      completed: logged,
      scheduled: !logged && named,
      live: false,
      imported: false,
    );
  }
  if (future) {
    return (
      completed: false,
      scheduled: true,
      live: false,
      imported: existing.isImportedHistory,
    );
  }
  return (
    completed: existing.isCompleted,
    scheduled: existing.isScheduledPlan,
    live:
        existing.isLiveCurrent &&
        ironVibeIsSameCalendarDay(when, DateTime.now()),
    imported: existing.isImportedHistory,
  );
}

bool _sameTrainerSessionSheet(TrainerSession old, TrainerSession next) {
  if (!_sameSheetMinute(old.dateTime, next.dateTime)) return false;
  if (old.note.trim() != next.note.trim()) return false;
  if ((old.clientId ?? '') != (next.clientId ?? '')) return false;
  if (old.clientLastName.trim() != next.clientLastName.trim()) return false;
  if (old.clientName.trim() != next.clientName.trim()) return false;
  if (old.isCompleted != next.isCompleted) return false;
  if (old.isScheduledPlan != next.isScheduledPlan) return false;
  if (old.isLiveCurrent != next.isLiveCurrent) return false;
  if (old.isImportedHistory != next.isImportedHistory) return false;
  return _sameSheetExercises(old.exercises, next.exercises);
}

void _putTrainerSession(_SessionWrite write) {
  final replaceId = write.replaceId;
  if (replaceId != null && replaceId.isNotEmpty) {
    final index = trainerSchedule.indexWhere(
      (session) => session.id == replaceId,
    );
    if (index >= 0) {
      trainerSchedule[index] = write.session;
      return;
    }
  }
  trainerSchedule.add(write.session);
}

IronVibeSheetImportPlan _planPersonalSheet(_SheetTable table) {
  final groups = <String, List<_SheetRow>>{};
  final groupOrder = <String>[];
  var skipped = 0;
  for (final row in table.rows) {
    if (!_rowIsSession(row.values)) {
      if (row.values.values.any((value) => value.isNotEmpty)) skipped++;
      continue;
    }
    if (normalizeExerciseName(row.get('exercise')).isEmpty &&
        (row.get('weight').isNotEmpty ||
            row.get('reps').isNotEmpty ||
            row.get('duration').isNotEmpty ||
            row.get('intensity').isNotEmpty)) {
      skipped++;
      continue;
    }
    final sessionId = row.get('session_id');
    final String key;
    if (sessionId.isNotEmpty) {
      key = 'id:$sessionId';
    } else if (row.when != null) {
      key = 'day:${_sheetDayToken(row.when!)}|${_sheetTimeToken(row.when!)}';
    } else {
      skipped++;
      continue;
    }
    groups
        .putIfAbsent(key, () {
          groupOrder.add(key);
          return <_SheetRow>[];
        })
        .add(row);
  }

  final claimed = <String>{};
  final writes = <_WorkoutWrite>[];
  var added = 0;
  var updated = 0;
  final idGroups = groupOrder.where((key) => key.startsWith('id:')).toList();
  final dayGroups = groupOrder.where((key) => key.startsWith('day:')).toList();

  void takeGroup(String key) {
    final rows = groups[key]!;
    final badRows = rows.where((row) => row.badDate).length;
    if (badRows == rows.length) {
      skipped += rows.length;
      return;
    }
    skipped += badRows;
    final usable = rows.where((row) => !row.badDate).toList();
    final sessionId = usable
        .map((row) => row.get('session_id'))
        .firstWhere((id) => id.isNotEmpty, orElse: () => '');
    WorkoutLog? target;
    if (sessionId.isNotEmpty) {
      for (final log in workoutHistory) {
        if (log.id == sessionId) {
          target = log;
          break;
        }
      }
    } else {
      final when = usable
          .map((row) => row.when)
          .whereType<DateTime>()
          .firstOrNull;
      if (when == null) {
        skipped += usable.length;
        return;
      }
      final sameDay = workoutHistory.where((log) {
        final id = log.id;
        if (id != null && claimed.contains(id)) return false;
        return _sameSheetDay(log.date, when);
      }).toList();
      final sameMinute = sameDay
          .where((log) => _sameSheetMinute(log.date, when))
          .toList();
      if (sameMinute.length == 1) {
        target = sameMinute.single;
      } else if (sameMinute.isEmpty && sameDay.length == 1) {
        target = sameDay.single;
      } else if (sameDay.isEmpty) {
        target = null;
      } else {
        skipped += usable.length;
        return;
      }
    }
    if (target != null && target.id != null && claimed.contains(target.id)) {
      skipped += usable.length;
      return;
    }
    DateTime? when = usable
        .map((row) => row.when)
        .whereType<DateTime>()
        .firstOrNull;
    when ??= target?.date;
    if (when == null) {
      skipped += usable.length;
      return;
    }
    if (target != null && _sameSheetMinute(target.date, when)) {
      when = target.date;
    }
    var exercises = _exercisesFromRows(usable);
    if (!table.has('exercise_note') && target != null) {
      exercises = _sheetKeepExerciseNotes(target.exercises, exercises);
    }
    if (target == null && exercises.isEmpty) {
      skipped += usable.length;
      return;
    }
    final id =
        target?.id ??
        (sessionId.isNotEmpty && !claimed.contains(sessionId)
            ? sessionId
            : ironVibeNewEntityId());
    final next = WorkoutLog(
      when,
      exercises,
      id: id,
      remindMinutesBefore: target?.remindMinutesBefore,
    );
    if (target != null) {
      claimed.add(target.id ?? id);
      if (_sameSheetMinute(target.date, next.date) &&
          _sameSheetExercises(target.exercises, next.exercises)) {
        return;
      }
      updated++;
      writes.add(_WorkoutWrite(replaceId: target.id, log: next));
    } else {
      claimed.add(id);
      added++;
      writes.add(_WorkoutWrite(replaceId: null, log: next));
    }
  }

  for (final key in idGroups) {
    takeGroup(key);
  }
  for (final key in dayGroups) {
    takeGroup(key);
  }

  return IronVibeSheetImportPlan._(
    sessionsToAdd: added,
    sessionsToUpdate: updated,
    skippedRows: skipped,
    commit: () {
      for (final write in writes) {
        final replaceId = write.replaceId;
        if (replaceId != null && replaceId.isNotEmpty) {
          final index = workoutHistory.indexWhere((log) => log.id == replaceId);
          if (index >= 0) {
            workoutHistory[index] = write.log;
          } else {
            workoutHistory.add(write.log);
          }
        } else {
          workoutHistory.add(write.log);
        }
        for (final exercise in write.log.exercises) {
          ensureExerciseInBank(exercise.name);
        }
      }
      workoutHistory.sort((a, b) => a.date.compareTo(b.date));
      ironVibeEnsurePersistentIds();
    },
  );
}

String ironVibeDecodeSheetBytes(List<int> bytes) {
  if (bytes.length >= 2 && bytes[0] == 0xFF && bytes[1] == 0xFE) {
    return _decodeUtf16(bytes.sublist(2), le: true);
  }
  if (bytes.length >= 2 && bytes[0] == 0xFE && bytes[1] == 0xFF) {
    return _decodeUtf16(bytes.sublist(2), le: false);
  }
  return utf8.decode(bytes);
}

String _decodeUtf16(List<int> bytes, {required bool le}) {
  final even = bytes.length.isEven ? bytes : bytes.sublist(0, bytes.length - 1);
  final units = <int>[];
  for (var i = 0; i < even.length; i += 2) {
    final lo = le ? even[i] : even[i + 1];
    final hi = le ? even[i + 1] : even[i];
    units.add(lo | (hi << 8));
  }
  return String.fromCharCodes(units);
}

Future<void> ironVibeExportSheet(BuildContext context, bool coach) async {
  final l = AppLocalizations.of(context)!;
  if (!ironVibeSheetHasExportableData(coach: coach)) {
    _showImportSnackBar(context, l.historyEmpty);
    return;
  }
  final pal = IronVibePalette.of(context);
  final share = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final dpal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: dpal.dialog,
        shape: ironVibeDialogShape(dpal),
        title: Text(
          l.sheetExportTitle,
          style: TextStyle(
            color: dpal.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            l.sheetExportBody,
            style: TextStyle(color: dpal.textSecondary, height: 1.35),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.cancel, style: TextStyle(color: pal.textMuted)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l.sheetExportShare,
              style: TextStyle(
                color: dpal.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
  if (share != true || !context.mounted) return;

  final messenger = ScaffoldMessenger.of(context);
  String? path;
  try {
    ironVibeEnsurePersistentIds();
    await DataService.saveData();
    if (!context.mounted) return;
    final languageCode = Localizations.localeOf(context).languageCode;
    final csv = ironVibeBuildSheetCsv(coach: coach, languageCode: languageCode);
    final directory = await getTemporaryDirectory();
    final now = DateTime.now();
    final datePart =
        '${now.year}_${now.month.toString().padLeft(2, '0')}_${now.day.toString().padLeft(2, '0')}';
    final baseName = coach ? 'IronVibe_Sheet_Coach' : 'IronVibe_Sheet';
    await _cleanOldExportFiles(directory, 'IronVibe_Sheet*.csv');
    final safeFileName = '${baseName}_$datePart.csv';
    path = '${directory.path}/$safeFileName';
    await File(path).writeAsString(csv, flush: true);
    if (!context.mounted) return;
    Navigator.of(context).pop();
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(path, mimeType: 'text/csv', name: safeFileName)],
        text: l.sheetShareText,
      ),
    );
    await _deleteExportFile(path);
    path = null;
  } catch (e) {
    debugPrint('Sheet export error: $e');
    if (path != null) await _deleteExportFile(path);
    messenger.showSnackBar(
      SnackBar(
        content: Text('${l.exportError} $e'),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

Future<void> ironVibeImportSheet(BuildContext context, bool coach) async {
  final l = AppLocalizations.of(context)!;
  final messenger = ScaffoldMessenger.of(context);
  final csv = await _pickSheetCsv(context);
  if (csv == null || !context.mounted) return;

  final plan = ironVibePlanSheetImport(csv, coach: coach);
  final rejection = plan.rejection;
  if (rejection != null) {
    final invalid = rejection == IronVibeSheetRejection.notASheet;
    _showImportSnackBar(
      context,
      _sheetRejectionText(l, rejection),
      backgroundColor: invalid ? Colors.redAccent : Colors.orange,
    );
    return;
  }
  if (!plan.hasChanges) {
    _showImportSnackBar(
      context,
      l.sheetImportNothing,
      backgroundColor: Colors.orange,
    );
    return;
  }

  final pal = IronVibePalette.of(context);
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final dpal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: dpal.dialog,
        shape: ironVibeDialogShape(dpal),
        title: Text(
          l.sheetExportTitle,
          style: TextStyle(
            color: dpal.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            l.sheetImportPreview(
              plan.sessionsToUpdate,
              plan.sessionsToAdd,
              plan.clientsToAdd,
              plan.clientsToUpdate,
              plan.skippedRows,
            ),
            style: TextStyle(color: dpal.textSecondary, height: 1.35),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.cancel, style: TextStyle(color: pal.textMuted)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l.sheetImportConfirm,
              style: TextStyle(
                color: dpal.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
  if (confirmed != true || !context.mounted) return;

  try {
    plan.commit();
    await DataService.saveData();
  } catch (e, stack) {
    debugPrint('Sheet import error: $e\n$stack');
    if (context.mounted) {
      _showImportSnackBar(context, l.sheetImportInvalid);
    }
    return;
  }
  if (!context.mounted) return;
  Navigator.of(context).pop();
  messenger.showSnackBar(
    SnackBar(
      content: Text(l.sheetImportSuccess),
      backgroundColor: Colors.green[700],
      duration: const Duration(seconds: 2),
    ),
  );
}

String _sheetRejectionText(
  AppLocalizations l,
  IronVibeSheetRejection rejection,
) {
  switch (rejection) {
    case IronVibeSheetRejection.notASheet:
      return l.sheetImportInvalid;
    case IronVibeSheetRejection.empty:
      return l.sheetImportEmpty;
    case IronVibeSheetRejection.personalIntoCoach:
      return l.sheetImportPersonalFile;
    case IronVibeSheetRejection.coachIntoPersonal:
      return l.sheetImportCoachFile;
  }
}

Future<String?> _pickSheetCsv(BuildContext context) async {
  final l = AppLocalizations.of(context)!;
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: true,
    );
    if (result == null || result.files.isEmpty) return null;
    final file = result.files.single;
    final name = file.name.toLowerCase();
    final allowed =
        name.endsWith('.csv') || name.endsWith('.txt') || name.endsWith('.tsv');
    if (!allowed) {
      if (context.mounted) {
        _showImportSnackBar(context, l.sheetImportInvalid);
      }
      return null;
    }
    var bytes = file.bytes;
    if ((bytes == null || bytes.isEmpty) && file.path != null) {
      bytes = await File(file.path!).readAsBytes();
    }
    if (bytes == null || bytes.isEmpty) {
      if (context.mounted) {
        _showImportSnackBar(context, l.sheetImportInvalid);
      }
      return null;
    }
    try {
      return ironVibeDecodeSheetBytes(bytes);
    } catch (_) {
      if (context.mounted) {
        _showImportSnackBar(context, l.sheetImportInvalid);
      }
      return null;
    }
  } catch (e, stack) {
    debugPrint('Sheet pick error: $e\n$stack');
    if (context.mounted) {
      _showImportSnackBar(context, l.sheetImportInvalid);
    }
    return null;
  }
}
