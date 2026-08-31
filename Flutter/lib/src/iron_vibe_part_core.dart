part of 'package:fitness_app/main.dart';

/// Keep at 1 so older app builds can still import backups. Muscle-group tags are
/// an additive JSON field (`exerciseMuscleGroups`) and a separate prefs key —
/// workout history schema is unchanged.
const int _kExportDataVersion = 1;

String _jsonString(dynamic value) {
  if (value == null) return '';
  if (value is String) return value;
  return value.toString();
}

/// Вложенные объекты из [jsonDecode] иногда приходят как [Map] с динамическим ключом;
/// строгий [whereType] отбрасывал бы такие элементы и обнулял подходы/упражнения.
Map<String, dynamic>? _jsonMap(dynamic value) {
  if (value == null) return null;
  if (value is Map<String, dynamic>) return value;
  if (value is Map) {
    return Map<String, dynamic>.from(
      value.map((k, v) => MapEntry(k.toString(), v)),
    );
  }
  return null;
}

/// Первое значение по списку логических имён ключей; сравнение без учёта регистра (старые бэкапы / ручное редактирование JSON).
String _jsonPickString(Map<String, dynamic> json, List<String> preferredKeys) {
  for (final want in preferredKeys) {
    final wl = want.toLowerCase();
    for (final e in json.entries) {
      if (e.key.toString().toLowerCase() == wl) {
        return _jsonString(e.value);
      }
    }
  }
  return '';
}

dynamic _jsonValueForKeys(
  Map<String, dynamic> json,
  List<String> preferredKeys,
) {
  for (final want in preferredKeys) {
    final wl = want.toLowerCase();
    for (final e in json.entries) {
      if (e.key.toString().toLowerCase() == wl) {
        return e.value;
      }
    }
  }
  return null;
}

bool _jsonTruthy(dynamic v) {
  if (v == true) return true;
  if (v is String) {
    final t = v.trim().toLowerCase();
    return t == 'true' || t == '1' || t == 'yes';
  }
  if (v is num) return v != 0;
  return false;
}

bool _jsonPickBool(Map<String, dynamic> json, List<String> preferredKeys) {
  for (final want in preferredKeys) {
    final wl = want.toLowerCase();
    for (final e in json.entries) {
      if (e.key.toString().toLowerCase() == wl) {
        return _jsonTruthy(e.value);
      }
    }
  }
  return false;
}

SetLog? _setLogFromDecoded(
  dynamic item, {
  required bool parentExerciseIsCardio,
}) {
  if (item is List) {
    if (item.isEmpty) return null;
    if (parentExerciseIsCardio && item.length >= 2) {
      return SetLog(
        '',
        '',
        '',
        isCardio: true,
        duration: _jsonString(item[0]),
        intensity: _jsonString(item[1]),
      );
    }
    final w = item.isNotEmpty ? _jsonString(item[0]) : '';
    final r = item.length > 1 ? _jsonString(item[1]) : '';
    final ri = item.length > 2 ? normalizeRirStored(_jsonString(item[2])) : '0';
    return SetLog(w, r, ri);
  }
  final m = _jsonMap(item);
  if (m == null) return null;
  return SetLog.fromJson(m);
}

/// Единый формат названий упражнений в хранилище и UI (без путаницы регистра).
String normalizeExerciseName(String raw) => raw.trim().toUpperCase();

/// Объём подхода, кг (вес × повторы), если оба значения валидны.
double? ironVibeVolumeKgFromFields(String weightText, String repsText) {
  final w = double.tryParse(weightText.trim().replaceAll(',', '.'));
  final r = double.tryParse(repsText.trim().replaceAll(',', '.'));
  if (w == null || r == null || w <= 0 || r < 1) return null;
  return w * r;
}

/// Оценка 1ПМ по формуле Epley (кг).
double? ironVibeEpleyOneRmKg(double weight, double reps) {
  if (weight <= 0 || reps < 1) return null;
  return weight * (1 + reps / 30);
}

String ironVibeFormatKgTon(double kg) {
  if (kg <= 0) return '';
  if (kg >= 100) return kg.round().toString();
  final s = kg.toStringAsFixed(1);
  if (s.endsWith('.0')) return kg.round().toString();
  return s;
}

/// Total workout tonnage (kg): sum of weight × reps for all valid strength sets.
double ironVibeWorkoutVolumeKgFromExercises(Iterable<ExerciseLog> exercises) {
  var sum = 0.0;
  for (final ex in exercises) {
    if (ex.isCardio) continue;
    for (final set in ex.sets) {
      if (set.isCardio) continue;
      final v = ironVibeVolumeKgFromFields(set.weight, set.reps);
      if (v != null) sum += v;
    }
  }
  return sum;
}

/// Compact localized label used in history/calendar titles.
String ironVibeWorkoutVolumeLabel(
  AppLocalizations l,
  Iterable<ExerciseLog> exercises,
) {
  final kg = ironVibeWorkoutVolumeKgFromExercises(exercises);
  if (kg <= 0) return '${l.volumeShort}: —';
  return '${l.volumeShort}: ${ironVibeFormatKgTon(kg)} ${l.kg}';
}

/// Заголовок колонки «Вес» в строке вес / повторы / RIR: единицы на выбор пользователя.
String ironVibeWeightColumnTitle(AppLocalizations l) =>
    '${l.weightHeader} (${l.weightUnitsChoiceShort})';

/// Пустой RIR в данных = «до отказа» → храним и показываем как 0.
String normalizeRirStored(String raw) {
  final t = raw.trim();
  return t.isEmpty ? '0' : t;
}

bool rirIndicatesMeaningfulUserChoice(String raw) {
  final t = raw.trim();
  return t.isNotEmpty && t != '0';
}

void ensureExerciseInBank(String rawName) {
  final n = normalizeExerciseName(rawName);
  if (n.isEmpty) return;
  if (exerciseBank.any((e) => normalizeExerciseName(e) == n)) return;
  exerciseBank.add(n);
}

bool ironVibeIsExerciseInBank(String rawName) {
  final n = normalizeExerciseName(rawName);
  if (n.isEmpty) return false;
  return exerciseBank.any((e) => normalizeExerciseName(e) == n);
}

/// Убирает имя из подсказок, избранного и таблицы личного прогресса.
/// Записи в сохранённых тренировках не трогаем.
void ironVibeRemoveExerciseFromBank(String rawName) {
  final n = normalizeExerciseName(rawName);
  if (n.isEmpty) return;
  exerciseBank.removeWhere((e) => normalizeExerciseName(e) == n);
  ironVibeRemoveFavoriteExerciseEverywhere(n);
}

class _UpperCaseExerciseNameInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final t = newValue.text.toUpperCase();
    return TextEditingValue(
      text: t,
      selection: newValue.selection,
      composing: TextRange.empty,
    );
  }
}

List<String> _dedupeNormalizedExerciseBank(Iterable<String> raw) {
  final out = <String>[];
  final seen = <String>{};
  for (final e in raw) {
    final n = normalizeExerciseName(e);
    if (n.isEmpty) continue;
    if (seen.add(n)) out.add(n);
  }
  return out;
}

WorkoutLog _normalizeWorkoutLogExerciseNames(WorkoutLog w) {
  final exs = w.exercises
      .map(
        (ex) => ExerciseLog(
          normalizeExerciseName(ex.name),
          ex.sets,
          isCardio: ex.isCardio,
        ),
      )
      .toList();
  return WorkoutLog(w.date, exs, id: w.id);
}

TrainerSession _normalizeTrainerSessionExerciseNames(TrainerSession s) {
  final exs = s.exercises
      .map(
        (ex) => ExerciseLog(
          normalizeExerciseName(ex.name),
          ex.sets,
          isCardio: ex.isCardio,
        ),
      )
      .toList();
  return TrainerSession(
    s.dateTime,
    s.clientName,
    s.note,
    exercises: exs,
    id: s.id,
  );
}

/// Top-level for [compute]: encode payload to JSON string (runs off main thread).
String _encodeJsonPayload(Map<String, dynamic> payload) {
  return const JsonEncoder.withIndent('  ').convert(payload);
}

Future<void> _cleanOldExportFiles(
  Directory directory,
  String globPattern,
) async {
  try {
    final prefix = globPattern.replaceAll('*', '').split('.').first;
    final suffix = globPattern.contains('.')
        ? '.${globPattern.split('.').last}'
        : '';
    final files = directory.listSync();
    for (final e in files) {
      if (e is File) {
        final name = e.path.split(Platform.pathSeparator).last;
        if (name.startsWith(prefix) &&
            (suffix.isEmpty || name.endsWith(suffix))) {
          try {
            await e.delete();
          } catch (_) {}
        }
      }
    }
  } catch (_) {}
}

Future<void> _deleteExportFile(String path) async {
  try {
    final f = File(path);
    if (await f.exists()) await f.delete();
  } catch (_) {}
}

/// Семейное правило версий: … 1.6.4+64, 1.6.5+65, 1.6.6+66 …
const String kAppVersion = '1.6.6';
const int kAppBuildNumber = 66;

/// График прогресса: вес (красный) и повторы (как цвет фокуса полей).
const Color kProgressChartWeightColor = Color(0xFFFF1744);
const Color kProgressChartRepsColor = Color(0xFF00E5FF);
const Color kProgressChartVolumeColor = Color(0xFFFFD54F);

const String _kPrefsKeyLightTheme = 'ironvibe_light_theme';

final ValueNotifier<ThemeMode> ironVibeThemeMode = ValueNotifier<ThemeMode>(
  ThemeMode.light,
);

Future<void> ironVibeLoadThemePreference() async {
  final prefs = await SharedPreferences.getInstance();
  final useLight = prefs.getBool(_kPrefsKeyLightTheme) ?? true;
  ironVibeThemeMode.value = useLight ? ThemeMode.light : ThemeMode.dark;
}

Future<void> ironVibeSetThemeMode(ThemeMode mode) async {
  ironVibeThemeMode.value = mode;
  SystemChrome.setSystemUIOverlayStyle(ironVibeSystemOverlayFor(mode));
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(_kPrefsKeyLightTheme, mode == ThemeMode.light);
}

SystemUiOverlayStyle ironVibeSystemOverlayFor(ThemeMode mode) {
  final dark = mode == ThemeMode.dark;
  return SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
    systemNavigationBarIconBrightness: dark
        ? Brightness.light
        : Brightness.dark,
  );
}

const MethodChannel _kIronVibeAndroidScreenChannel = MethodChannel(
  'com.ironvibe.app/screen',
);

/// [FLAG_KEEP_SCREEN_ON] через окно Activity; без `WAKE_LOCK` и без новых разрешений.
Future<void> ironVibeSetKeepScreenOn(bool on) async {
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) return;
  try {
    await _kIronVibeAndroidScreenChannel.invokeMethod<void>(
      'setKeepScreenOn',
      on,
    );
  } catch (_) {}
}

/// Периодическое автосохранение черновика активной тренировки (раз в минуту + при сворачивании).
mixin IronVibeWorkoutAutoSave<T extends StatefulWidget> on State<T>, WidgetsBindingObserver {
  Timer? _ironVibeAutoSaveTimer;
  VoidCallback? _ironVibeAutoSaveFlush;
  bool _ironVibeAutoSaveActive = false;

  void ironVibeStartWorkoutAutoSave({required VoidCallback flushDraft}) {
    _ironVibeAutoSaveFlush = flushDraft;
    _ironVibeAutoSaveActive = true;
    WidgetsBinding.instance.addObserver(this);
    _ironVibeAutoSaveTimer?.cancel();
    _ironVibeAutoSaveTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (_ironVibeAutoSaveActive) _ironVibeAutoSaveFlush?.call();
    });
  }

  void ironVibeStopWorkoutAutoSave({bool removeObserver = true}) {
    _ironVibeAutoSaveActive = false;
    _ironVibeAutoSaveTimer?.cancel();
    _ironVibeAutoSaveTimer = null;
    if (removeObserver) {
      WidgetsBinding.instance.removeObserver(this);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_ironVibeAutoSaveActive) return;
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _ironVibeAutoSaveFlush?.call();
    }
  }

  @override
  void dispose() {
    ironVibeStopWorkoutAutoSave();
    super.dispose();
  }
}
