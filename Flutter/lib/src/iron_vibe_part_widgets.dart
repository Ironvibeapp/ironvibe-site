part of 'package:fitness_app/main.dart';

ExerciseData ironVibeExerciseDataFromLog(ExerciseLog log) {
  final sets = <SetData>[];
  for (final s in log.sets) {
    if (s.isCardio || log.isCardio) {
      sets.add(SetData(d: s.duration, i: s.intensity));
    } else {
      sets.add(SetData(w: s.weight, r: s.reps, ri: s.rir));
    }
  }
  return ExerciseData(
    name: log.name,
    sets: sets.isEmpty ? null : sets,
    isCardio: log.isCardio,
  );
}

/// Same set count as [log], but weight/reps stay empty and the last session
/// values are shown as grey hints — a target to beat, not a finished set.
ExerciseData ironVibeExerciseDataFromPreviousAsHints(ExerciseLog log) {
  final sets = <SetData>[];
  for (final s in log.sets) {
    if (s.isCardio || log.isCardio) {
      sets.add(SetData(d: s.duration, i: s.intensity));
    } else {
      sets.add(
        SetData(
          hintWeight: s.weight.trim(),
          hintReps: s.reps.trim(),
        ),
      );
    }
  }
  return ExerciseData(
    name: log.name,
    sets: sets.isEmpty ? null : sets,
    isCardio: log.isCardio,
  );
}

/// Planned block: keep the planned set count, show last logged weight/reps as hints.
ExerciseData ironVibeExerciseDataPlannedWithHints({
  required ExerciseLog planned,
  required ExerciseLog lastLogged,
}) {
  if (planned.isCardio) {
    return ironVibeExerciseDataFromLog(planned);
  }
  final plannedEmpty = !ironVibeExerciseLogHasLoggedData(planned);
  var n = math.max(1, planned.sets.length);
  if (plannedEmpty && lastLogged.sets.length > n) {
    n = lastLogged.sets.length;
  }
  final sets = <SetData>[];
  for (var i = 0; i < n; i++) {
    final plannedSet = i < planned.sets.length ? planned.sets[i] : null;
    if (plannedSet != null && ironVibeSetLogHasLoggedData(plannedSet)) {
      sets.add(
        SetData(w: plannedSet.weight, r: plannedSet.reps, ri: plannedSet.rir),
      );
      continue;
    }
    final hint = i < lastLogged.sets.length ? lastLogged.sets[i] : null;
    sets.add(
      SetData(
        hintWeight: hint?.weight.trim() ?? '',
        hintReps: hint?.reps.trim() ?? '',
      ),
    );
  }
  return ExerciseData(name: planned.name, sets: sets, isCardio: false);
}

bool ironVibeApplyClientPreviousSetHints({
  required ExerciseData data,
  required String clientName,
  TrainerSession? excludeSession,
}) {
  if (data.isCardio) return false;
  final name = normalizeExerciseName(data.nameController.text);
  if (name.isEmpty) return false;

  final last = ironVibeLastExerciseLogFor(
    name,
    clientName: clientName,
    excludeSession: excludeSession,
  );
  if (last.isCardio || !ironVibeExerciseLogHasLoggedData(last)) return false;

  final lastSets = last.sets
      .where((s) => !s.isCardio && ironVibeSetLogHasLoggedData(s))
      .toList();
  if (lastSets.isEmpty) return false;

  final anyTyped = data.sets.any(
    (s) => s.weight.text.trim().isNotEmpty || s.reps.text.trim().isNotEmpty,
  );
  final n = anyTyped
      ? data.sets.length
      : math.max(data.sets.length, lastSets.length);

  var changed = data.sets.length != n;
  final next = <SetData>[];
  for (var i = 0; i < n; i++) {
    final existing = i < data.sets.length ? data.sets[i] : null;
    final hint = i < lastSets.length ? lastSets[i] : null;
    final typedW = existing?.weight.text.trim() ?? '';
    final typedR = existing?.reps.text.trim() ?? '';
    final ri = existing?.rir.text ?? '0';
    final hintW = typedW.isEmpty ? (hint?.weight.trim() ?? '') : '';
    final hintR = typedR.isEmpty ? (hint?.reps.trim() ?? '') : '';
    if (existing == null ||
        existing.weight.text != typedW ||
        existing.reps.text != typedR ||
        existing.hintWeight != hintW ||
        existing.hintReps != hintR) {
      changed = true;
    }
    next.add(
      SetData(
        w: typedW,
        r: typedR,
        ri: ri,
        hintWeight: hintW,
        hintReps: hintR,
      ),
    );
  }
  if (!changed) return false;
  data.sets
    ..clear()
    ..addAll(next);
  return true;
}

SetData ironVibeClientHintedSetAt({
  required String exerciseName,
  required String clientName,
  required int index,
  TrainerSession? excludeSession,
}) {
  final last = ironVibeLastExerciseLogFor(
    exerciseName,
    clientName: clientName,
    excludeSession: excludeSession,
  );
  if (last.isCardio || !ironVibeExerciseLogHasLoggedData(last)) {
    return SetData();
  }
  if (index < 0 || index >= last.sets.length) return SetData();
  final s = last.sets[index];
  if (s.isCardio || !ironVibeSetLogHasLoggedData(s)) return SetData();
  return SetData(
    hintWeight: s.weight.trim(),
    hintReps: s.reps.trim(),
  );
}

class ExerciseData {
  final TextEditingController nameController = TextEditingController();
  final List<SetData> sets;
  bool isCardio;

  ExerciseData({String name = '', List<SetData>? sets, this.isCardio = false})
    : sets = sets ?? [SetData()] {
    nameController.text = normalizeExerciseName(name);
  }
}

class SetData {
  final TextEditingController weight = TextEditingController();
  final TextEditingController reps = TextEditingController();
  final TextEditingController rir = TextEditingController();
  final TextEditingController duration = TextEditingController();
  final TextEditingController intensity = TextEditingController();
  final String hintWeight;
  final String hintReps;

  SetData({
    String w = '',
    String r = '',
    String ri = '0',
    String d = '',
    String i = '',
    this.hintWeight = '',
    this.hintReps = '',
  }) {
    weight.text = w;
    reps.text = r;
    rir.text = normalizeRirStored(ri);
    duration.text = d;
    intensity.text = i;
  }
}

bool ironVibeDraftHasOpposingModeInput(
  List<ExerciseData> exercises, {
  required bool switchingToCardio,
}) {
  for (final ex in exercises) {
    for (final s in ex.sets) {
      if (switchingToCardio) {
        if (s.weight.text.trim().isNotEmpty ||
            s.reps.text.trim().isNotEmpty ||
            rirIndicatesMeaningfulUserChoice(s.rir.text)) {
          return true;
        }
      } else if (s.duration.text.trim().isNotEmpty ||
          s.intensity.text.trim().isNotEmpty) {
        return true;
      }
    }
  }
  return false;
}

Future<bool> ironVibeConfirmSwitchWorkoutType(BuildContext context) async {
  final l = AppLocalizations.of(context)!;
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final dpal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: dpal.dialog,
        shape: ironVibeDialogShape(dpal),
        title: Text(
          l.switchWorkoutTypeTitle,
          style: TextStyle(
            color: dpal.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          l.switchWorkoutTypeBody,
          style: TextStyle(color: dpal.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l.cancel,
              style: TextStyle(color: dpal.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l.switchWorkoutTypeConfirm,
              style: TextStyle(
                color: dpal.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      );
    },
  );
  return result == true;
}

Map<String, dynamic> ironVibeSetDataToDraftJson(SetData s) => {
  'weight': s.weight.text,
  'reps': s.reps.text,
  'rir': s.rir.text,
  'duration': s.duration.text,
  'intensity': s.intensity.text,
  if (s.hintWeight.isNotEmpty) 'hintWeight': s.hintWeight,
  if (s.hintReps.isNotEmpty) 'hintReps': s.hintReps,
};

SetData ironVibeSetDataFromDraftJson(Map<String, dynamic> json) => SetData(
  w: _jsonString(json['weight']),
  r: _jsonString(json['reps']),
  ri: _jsonString(json['rir']),
  d: _jsonString(json['duration']),
  i: _jsonString(json['intensity']),
  hintWeight: _jsonString(json['hintWeight']),
  hintReps: _jsonString(json['hintReps']),
);

Map<String, dynamic> ironVibeExerciseDataToDraftJson(ExerciseData ex) => {
  'name': ex.nameController.text,
  'isCardio': ex.isCardio,
  'sets': ex.sets.map(ironVibeSetDataToDraftJson).toList(),
};

ExerciseData ironVibeExerciseDataFromDraftJson(Map<String, dynamic> json) {
  final rawSets = json['sets'];
  final sets = <SetData>[];
  if (rawSets is List) {
    for (final item in rawSets) {
      final m = _jsonMap(item);
      if (m != null) sets.add(ironVibeSetDataFromDraftJson(m));
    }
  }
  return ExerciseData(
    name: _jsonString(json['name']),
    sets: sets.isEmpty ? null : sets,
    isCardio: _jsonPickBool(json, ['isCardio', 'is_cardio', 'cardio']),
  );
}

List<Map<String, dynamic>> ironVibeExerciseListToDraftJson(
  List<ExerciseData> exercises,
) => exercises.map(ironVibeExerciseDataToDraftJson).toList();

List<ExerciseData> ironVibeExerciseListFromDraftJson(List<dynamic> raw) {
  final out = <ExerciseData>[];
  for (final item in raw) {
    final m = _jsonMap(item);
    if (m != null) out.add(ironVibeExerciseDataFromDraftJson(m));
  }
  return out;
}

bool ironVibeDraftExercisesHaveMeaningfulInput(List<dynamic> raw) {
  for (final item in raw) {
    final m = _jsonMap(item);
    if (m == null) continue;
    final name = _jsonString(m['name']).trim();
    if (name.isNotEmpty) return true;
    final sets = m['sets'];
    if (sets is! List) continue;
    for (final setItem in sets) {
      final s = _jsonMap(setItem);
      if (s == null) continue;
      if (_jsonString(s['weight']).trim().isNotEmpty ||
          _jsonString(s['reps']).trim().isNotEmpty ||
          rirIndicatesMeaningfulUserChoice(_jsonString(s['rir'])) ||
          _jsonString(s['duration']).trim().isNotEmpty ||
          _jsonString(s['intensity']).trim().isNotEmpty) {
        return true;
      }
    }
  }
  return false;
}

/// Сумма «вес × повторы» (кг) по всем подходам, где оба значения валидны (как в активной тренировке).
double ironVibeTotalVolumeKgFromSetData(Iterable<SetData> sets) {
  var sum = 0.0;
  for (final s in sets) {
    final v = ironVibeVolumeKgFromFields(s.weight.text, s.reps.text);
    if (v != null) sum += v;
  }
  return sum;
}

const double _kSessionPrEpsilon = 1e-9;

double? _parseRepsAtLeastOne(String raw) {
  final v = double.tryParse(raw.trim().replaceAll(',', '.'));
  if (v == null || v < 1) return null;
  return v;
}

double? _parsePositiveWeightText(String raw) {
  final v = double.tryParse(raw.trim().replaceAll(',', '.'));
  if (v == null || v <= 0) return null;
  return v;
}

bool _exerciseLogHasAnyWeightedSet(ExerciseLog ex) {
  if (ex.isCardio) return false;
  for (final set in ex.sets) {
    if (set.isCardio) continue;
    final w = _parsePositiveWeightText(set.weight);
    final r = _parseRepsAtLeastOne(set.reps);
    if (w != null && r != null) return true;
  }
  return false;
}

double _exerciseLogMaxWeightInAnySet(ExerciseLog ex) {
  var m = 0.0;
  if (ex.isCardio) return 0;
  for (final set in ex.sets) {
    if (set.isCardio) continue;
    final w = _parsePositiveWeightText(set.weight);
    final r = _parseRepsAtLeastOne(set.reps);
    if (w != null && r != null && w > m) m = w;
  }
  return m;
}

double _exerciseLogVolumeSum(ExerciseLog ex) {
  if (ex.isCardio) return 0;
  var sum = 0.0;
  for (final set in ex.sets) {
    if (set.isCardio) continue;
    final v = ironVibeVolumeKgFromFields(set.weight, set.reps);
    if (v != null) sum += v;
  }
  return sum;
}

/// Сумма повторов по упражнению без штанги/веса (только если нет ни одного подхода с весом > 0).
double _exerciseLogBodyweightTotalReps(ExerciseLog ex) {
  if (ex.isCardio || _exerciseLogHasAnyWeightedSet(ex)) return 0;
  var sum = 0.0;
  for (final set in ex.sets) {
    if (set.isCardio) continue;
    final r = _parseRepsAtLeastOne(set.reps);
    if (r != null) sum += r;
  }
  return sum;
}

bool _draftHasAnyWeightedSet(List<SetData> sets) {
  for (final s in sets) {
    final w = _parsePositiveWeightText(s.weight.text);
    final r = _parseRepsAtLeastOne(s.reps.text);
    if (w != null && r != null) return true;
  }
  return false;
}

double _draftMaxWeightInAnySet(List<SetData> sets) {
  var m = 0.0;
  for (final s in sets) {
    final w = _parsePositiveWeightText(s.weight.text);
    final r = _parseRepsAtLeastOne(s.reps.text);
    if (w != null && r != null && w > m) m = w;
  }
  return m;
}

double _draftBodyweightTotalReps(List<SetData> sets) {
  if (_draftHasAnyWeightedSet(sets)) return 0;
  var sum = 0.0;
  for (final s in sets) {
    final r = _parseRepsAtLeastOne(s.reps.text);
    if (r != null) sum += r;
  }
  return sum;
}

/// Подсветка блока названия упражнения в активной тренировке (не в истории).
/// Приоритет: макс. вес в подходе (красный) > объём (жёлтый) > сумма повторов без веса (синий).
enum IronVibeSessionPrHighlight { none, maxWeight, volume, bodyweightTotalReps }

IronVibeSessionPrHighlight ironVibeSessionPrHighlightForDraft({
  required String normalizedExerciseName,
  required bool sessionIsCardio,
  required List<SetData> sets,
  List<WorkoutLog>? athleteHistory,
  Iterable<TrainerSession>? clientSessions,
  TrainerSession? excludeTrainerSession,
}) {
  final name = normalizeExerciseName(normalizedExerciseName);
  if (sessionIsCardio || name.isEmpty) return IronVibeSessionPrHighlight.none;

  double? histMaxWeight;
  double? histMaxVolume;
  double? histMaxBwReps;

  void considerLog(ExerciseLog ex) {
    if (ex.isCardio) return;
    if (normalizeExerciseName(ex.name) != name) return;
    final mw = _exerciseLogMaxWeightInAnySet(ex);
    if (mw > 0 && (histMaxWeight == null || mw > histMaxWeight!)) {
      histMaxWeight = mw;
    }
    final vol = _exerciseLogVolumeSum(ex);
    if (vol > 0 && (histMaxVolume == null || vol > histMaxVolume!)) {
      histMaxVolume = vol;
    }
    final bw = _exerciseLogBodyweightTotalReps(ex);
    if (bw > 0 && (histMaxBwReps == null || bw > histMaxBwReps!)) {
      histMaxBwReps = bw;
    }
  }

  if (athleteHistory != null) {
    for (final w in athleteHistory) {
      for (final ex in w.exercises) {
        considerLog(ex);
      }
    }
  } else if (clientSessions != null) {
    for (final session in clientSessions) {
      if (identical(session, excludeTrainerSession)) continue;
      if (excludeTrainerSession?.id != null &&
          excludeTrainerSession!.id == session.id) {
        continue;
      }
      for (final ex in session.exercises) {
        considerLog(ex);
      }
    }
  }

  if (histMaxWeight == null && histMaxVolume == null && histMaxBwReps == null) {
    return IronVibeSessionPrHighlight.none;
  }

  final curW = _draftMaxWeightInAnySet(sets);
  final curVol = ironVibeTotalVolumeKgFromSetData(sets);
  final isBwOnly = !_draftHasAnyWeightedSet(sets);
  final curBw = isBwOnly ? _draftBodyweightTotalReps(sets) : 0.0;

  final beatWeight =
      histMaxWeight != null && curW > histMaxWeight! + _kSessionPrEpsilon;
  final beatVolume =
      histMaxVolume != null && curVol > histMaxVolume! + _kSessionPrEpsilon;
  final beatBw =
      isBwOnly &&
      histMaxBwReps != null &&
      curBw > histMaxBwReps! + _kSessionPrEpsilon;

  if (beatWeight) return IronVibeSessionPrHighlight.maxWeight;
  if (beatVolume) return IronVibeSessionPrHighlight.volume;
  if (beatBw) return IronVibeSessionPrHighlight.bodyweightTotalReps;
  return IronVibeSessionPrHighlight.none;
}

Color? ironVibeSessionPrHighlightFill(
  IronVibeSessionPrHighlight h,
  Brightness brightness, {

  /// Чуть сильнее заливка для компактной кнопки графика (лучше видно при прокрутке).
  bool forProgressButton = false,
}) {
  final boost = forProgressButton ? 0.08 : 0.0;
  final dark = brightness == Brightness.dark;
  switch (h) {
    case IronVibeSessionPrHighlight.none:
      return null;
    case IronVibeSessionPrHighlight.maxWeight:
      return kProgressChartWeightColor.withValues(
        alpha: (dark ? 0.24 : 0.16) + boost,
      );
    case IronVibeSessionPrHighlight.volume:
      return kProgressChartVolumeColor.withValues(
        alpha: (dark ? 0.26 : 0.18) + boost,
      );
    case IronVibeSessionPrHighlight.bodyweightTotalReps:
      return kProgressChartRepsColor.withValues(
        alpha: (dark ? 0.22 : 0.14) + boost,
      );
  }
}

/// Логотип одинаковой высоты на всех экранах (эталон — главный).
Widget _buildAppBarLogo(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return GestureDetector(
    onTap: () {
      Navigator.of(context).maybePop();
    },
    child: SvgPicture.asset(
      isDark ? 'assets/logo_on_dark.svg' : 'assets/logo_on_light.svg',
      height: kIronVibeStandardLogoHeight,
      fit: BoxFit.contain,
      alignment: Alignment.center,
      allowDrawingOutsideViewBox: true,
      clipBehavior: Clip.none,
    ),
  );
}

/// Иконка в хедере: фиксированная область слота, без визуального сдвига логотипа.
Widget _ironVibeHeaderIconButton(
  BuildContext context, {
  required IconData icon,
  required VoidCallback onPressed,
  String? tooltip,
}) {
  final pal = IronVibePalette.of(context);
  final isDark = pal.brightness == Brightness.dark;
  return IconButton(
    padding: EdgeInsets.zero,
    tooltip: tooltip,
    constraints: BoxConstraints.tightFor(
      width: kIronVibeHeaderSideSlotWidth,
      height: kIronVibeStandardLogoHeight,
    ),
    icon: Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ironVibeMetalGradientColors(isDark: isDark),
        ),
        border: Border.all(color: ironVibeMetalBorderColor(isDark: isDark), width: 1),
      ),
      child: Icon(icon, color: pal.iconPrimary, size: 18),
    ),
    onPressed: onPressed,
  );
}

/// Закреплённый вертикальный хедер: логотип по центру экрана (Stack); при [showStopwatch] — компактный секундомер.
Widget _ironVibePinnedHeaderContent(
  BuildContext context, {
  Widget? leading,
  Widget? trailing,
  bool showStopwatch = false,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: kIronVibeStandardLogoHeight,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Center(child: _buildAppBarLogo(context)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: kIronVibeHeaderSideSlotWidth,
                    child: leading ?? const SizedBox.shrink(),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: kIronVibeHeaderSideSlotWidth,
                    child: trailing ?? const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (showStopwatch) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: kIronVibeCompactStopwatchSlotHeight,
            child: const Center(child: StopwatchPanel(compact: true)),
          ),
        ],
      ],
    ),
  );
}

/// Верхняя панель под [SafeArea] — тот же вертикальный отступ, что у экрана тренировки (без [AppBar]).
Widget _ironVibeTopBarMaterial(
  BuildContext context, {
  Widget? leading,
  Widget? trailing,
  bool showStopwatch = false,
}) {
  final pal = IronVibePalette.of(context);
  return Material(
    color: pal.topBar,
    elevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    child: _ironVibePinnedHeaderContent(
      context,
      leading: leading,
      trailing: trailing,
      showStopwatch: showStopwatch,
    ),
  );
}

class IronVibePinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  IronVibePinnedHeaderDelegate({required this.extent, required this.child});

  final double extent;
  final Widget child;

  @override
  double get maxExtent => extent;

  @override
  double get minExtent => extent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final pal = IronVibePalette.of(context);
    final isDark = pal.brightness == Brightness.dark;
    return Material(
      color: pal.topBar,
      elevation: overlapsContent && isDark ? 4 : 0,
      shadowColor: isDark ? Colors.black54 : Colors.transparent,
      child: SizedBox(height: extent, width: double.infinity, child: child),
    );
  }

  @override
  bool shouldRebuild(covariant IronVibePinnedHeaderDelegate oldDelegate) {
    return oldDelegate.extent != extent || oldDelegate.child != child;
  }
}

class IronVibePressScale extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool mediumHaptic;

  const IronVibePressScale({
    super.key,
    required this.child,
    required this.onPressed,
    this.mediumHaptic = false,
  });

  @override
  State<IronVibePressScale> createState() => _IronVibePressScaleState();
}

class _IronVibePressScaleState extends State<IronVibePressScale>
    with SingleTickerProviderStateMixin {
  late final AnimationController _press;

  @override
  void initState() {
    super.initState();
    _press = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 90),
    );
  }

  @override
  void dispose() {
    _press.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _press.forward(),
      onTapUp: (_) => _press.reverse(),
      onTapCancel: () => _press.reverse(),
      onTap: () {
        if (widget.mediumHaptic) {
          HapticFeedback.mediumImpact();
        } else {
          HapticFeedback.lightImpact();
        }
        widget.onPressed();
      },
      child: AnimatedBuilder(
        animation: _press,
        builder: (context, child) {
          final s = 1.0 - (_press.value * 0.035);
          return Transform.scale(scale: s, child: child);
        },
        child: widget.child,
      ),
    );
  }
}

class IronVibeEnter extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const IronVibeEnter({super.key, required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final t = animation.value;
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, 16 * (1 - t)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

Widget _ironVibeCtaLabelRow({
  required String label,
  required TextStyle style,
  IconData? icon,
  required Color iconColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: kIronVibeCtaIconSize, color: iconColor),
            const SizedBox(width: 8),
          ],
          Text(label, maxLines: 1, style: style),
        ],
      ),
    ),
  );
}

class IronVibePrimaryCta extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final Animation<double>? sheen;
  final double height;
  final double? width;
  final double fontSize;

  const IronVibePrimaryCta({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.sheen,
    this.height = kIronVibeCtaHeight,
    this.width,
    this.fontSize = kIronVibeCtaFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final labelColor = isDark
        ? const Color(0xFF1A1E24)
        : const Color(0xFFF4F6FA);
    return IronVibePressScale(
      mediumHaptic: true,
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.40 : 0.22),
              offset: const Offset(0, 8),
              blurRadius: 18,
            ),
          ],
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ironVibePrimaryCtaGradientColors(isDark: isDark),
            ),
            border: Border.all(
              color: kIronVibeAccent.withValues(alpha: isDark ? 0.42 : 0.55),
              width: 1.1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (sheen != null)
                  AnimatedBuilder(
                    animation: sheen!,
                    builder: (context, _) {
                      return LayoutBuilder(
                        builder: (context, c) {
                          final t = sheen!.value;
                          return Stack(
                            children: [
                              Positioned(
                                left: -80 + (c.maxWidth + 160) * t,
                                top: 0,
                                bottom: 0,
                                width: 72,
                                child: Transform(
                                  transform: Matrix4.skewX(-0.45),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withValues(alpha: 0),
                                          Colors.white.withValues(
                                            alpha: isDark ? 0.28 : 0.16,
                                          ),
                                          Colors.white.withValues(alpha: 0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                _ironVibeCtaLabelRow(
                  label: label,
                  icon: icon,
                  iconColor: kIronVibeAccent,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                    height: 1.05,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IronVibeSecondaryCta extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final double height;
  final double? width;
  final double fontSize;
  final Color? textColor;

  const IronVibeSecondaryCta({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.height = kIronVibeCtaHeight,
    this.width,
    this.fontSize = kIronVibeCtaFontSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final isDark = pal.brightness == Brightness.dark;
    return IronVibePressScale(
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: ironVibeMetalGradientColors(isDark: isDark),
          ),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: ironVibeMetalBorderColor(isDark: isDark),
            width: 1,
          ),
          boxShadow: isDark
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.45),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
        ),
        child: _ironVibeCtaLabelRow(
          label: label,
          icon: icon,
          iconColor: textColor ?? pal.iconPrimary,
          style: TextStyle(
            color: textColor ?? pal.textPrimary,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
            height: 1.05,
          ),
        ),
      ),
    );
  }
}

class IronVibeNavTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool horizontal;

  const IronVibeNavTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.horizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final isDark = pal.brightness == Brightness.dark;
    final badge = Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: ironVibeMetalGradientColors(isDark: isDark),
        ),
        border: Border.all(
          color: ironVibeMetalBorderColor(isDark: isDark),
          width: 1,
        ),
      ),
      child: Icon(icon, size: 22, color: pal.iconPrimary),
    );
    final text = Text(
      label,
      textAlign: horizontal ? TextAlign.left : TextAlign.center,
      maxLines: horizontal ? 1 : 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: pal.textPrimary,
        fontSize: horizontal ? 14 : 12,
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: 0.05,
      ),
    );
    return IronVibePressScale(
      onPressed: onPressed,
      child: Container(
        constraints: horizontal
            ? const BoxConstraints(minHeight: 64)
            : const BoxConstraints(minHeight: 108),
        padding: horizontal
            ? const EdgeInsets.fromLTRB(14, 12, 16, 12)
            : const EdgeInsets.fromLTRB(8, 16, 8, 14),
        decoration: ironVibeElevatedCardDecoration(pal),
        child: horizontal
            ? Row(
                children: [
                  badge,
                  const SizedBox(width: 14),
                  Expanded(child: text),
                  Icon(Icons.chevron_right_rounded, color: pal.textMuted),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  badge,
                  const SizedBox(height: 10),
                  text,
                ],
              ),
      ),
    );
  }
}

class SteelButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isBig;
  final double fontSize;
  final Color? textColor;
  final IconData? icon;

  const SteelButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.isBig = false,
    this.fontSize = kIronVibeCtaFontSize,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final label = ironVibeSentenceCase(text);
    if (isBig) {
      return IronVibePrimaryCta(
        label: label,
        onPressed: onPressed,
        icon: icon,
        height: height ?? kIronVibeCtaHeight,
        width: width,
        fontSize: fontSize,
      );
    }
    return IronVibeSecondaryCta(
      label: label,
      onPressed: onPressed,
      icon: icon,
      height: height ?? kIronVibeCtaHeight,
      width: width,
      fontSize: fontSize,
      textColor: textColor,
    );
  }
}

class StopwatchPanel extends StatefulWidget {
  /// Компактный режим для «липкой» полоски и меньшего размера (~35% меньше).
  final bool compact;

  const StopwatchPanel({super.key, this.compact = false});

  @override
  State<StopwatchPanel> createState() => _StopwatchPanelState();
}

class _StopwatchPanelState extends State<StopwatchPanel> {
  late final WorkoutTimerController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = WorkoutTimerController();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  String _formatStopwatchMs(int milliseconds) {
    final int hundreds = (milliseconds / 10).truncate() % 100;
    final int seconds = (milliseconds / 1000).truncate() % 60;
    final int minutes = (milliseconds / (1000 * 60)).truncate();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${hundreds.toString().padLeft(2, '0')}';
  }

  String _formatPhaseMs(int milliseconds) {
    final int totalSec = (milliseconds / 1000).floor().clamp(0, 86400);
    final int minutes = totalSec ~/ 60;
    final int seconds = totalSec % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _sideChipButton({
    required IronVibePalette pal,
    required String label,
    required VoidCallback onTap,
    required double height,
    required double fontSize,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Material(
        color: pal.field,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: pal.borderSubtle, width: 0.5),
          borderRadius: BorderRadius.circular(kIronVibeRadiusChip),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: height,
            width: double.infinity,
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final isDark = pal.brightness == Brightness.dark;
    final c = widget.compact;
    final vPad = c ? 4.0 : 15.0;
    final hPad = c ? 4.0 : 20.0;
    final timeSize = c ? 17.0 : 32.0;
    final letterSp = c ? 1.2 : 3.0;
    final gapAfterTime = c ? 3.0 : 15.0;
    final btnSize = c ? 30.0 : 50.0;
    final iconSz = c ? 18.0 : 28.0;
    final btnGap = c ? 10.0 : 20.0;
    final sideW = c ? 48.0 : 58.0;
    final sideBtnH = c ? 25.0 : 30.0;
    final sideFs = c ? 8.5 : 10.0;

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        final intervalTint = _ctrl.mode == WorkoutTimerMode.interval
            ? (_ctrl.intervalIsWork
                  ? kProgressChartWeightColor.withValues(
                      alpha: isDark ? 0.22 : 0.14,
                    )
                  : kProgressChartRepsColor.withValues(
                      alpha: isDark ? 0.22 : 0.16,
                    ))
            : Colors.transparent;

        final timeText = _ctrl.mode == WorkoutTimerMode.stopwatch
            ? _formatStopwatchMs(_ctrl.displayMs)
            : _formatPhaseMs(_ctrl.displayMs);

        final p = _ctrl.phaseProgress;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: vPad, horizontal: hPad),
          margin: EdgeInsets.only(bottom: c ? 0 : 20),
          decoration: BoxDecoration(
            color: c ? Colors.transparent : pal.stopwatchBg,
            borderRadius: BorderRadius.circular(c ? 8 : 12),
            border: Border.all(
              color: c ? Colors.transparent : pal.borderDefault,
              width: c ? 0 : 1.0,
            ),
            boxShadow: c
                ? const []
                : [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: isDark ? 0.35 : 0.08,
                      ),
                      offset: const Offset(0, 3),
                      blurRadius: isDark ? 8 : 6,
                    ),
                  ],
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: intervalTint,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: sideW,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _sideChipButton(
                          pal: pal,
                          label: '1/1',
                          height: sideBtnH,
                          fontSize: sideFs,
                          onTap: () => _ctrl.startIntervalPreset(
                            workSec: 60,
                            restSec: 60,
                          ),
                        ),
                        _sideChipButton(
                          pal: pal,
                          label: '4/4',
                          height: sideBtnH,
                          fontSize: sideFs,
                          onTap: () => _ctrl.startIntervalPreset(
                            workSec: 240,
                            restSec: 240,
                          ),
                        ),
                        _sideChipButton(
                          pal: pal,
                          label: '20/10',
                          height: sideBtnH,
                          fontSize: sideFs,
                          onTap: () => _ctrl.startIntervalPreset(
                            workSec: 20,
                            restSec: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            timeText,
                            style: TextStyle(
                              color: pal.textPrimary,
                              fontSize: timeSize,
                              fontFamily: 'Courier',
                              fontWeight: FontWeight.bold,
                              letterSpacing: letterSp,
                              height: c ? 1.05 : null,
                            ),
                          ),
                        ),
                        if (p != null) ...[
                          SizedBox(height: gapAfterTime * 0.5),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: LinearProgressIndicator(
                              value: p.clamp(0.0, 1.0),
                              minHeight: 3,
                              backgroundColor: pal.borderSubtle.withValues(
                                alpha: 0.5,
                              ),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _ctrl.mode == WorkoutTimerMode.interval
                                    ? (_ctrl.intervalIsWork
                                          ? kProgressChartWeightColor
                                          : kProgressChartRepsColor)
                                    : pal.iconPrimary,
                              ),
                            ),
                          ),
                        ],
                        SizedBox(height: gapAfterTime),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildControlButton(
                              icon: _ctrl.running
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              onPressed: () => _ctrl.toggleRunning(),
                              color: _ctrl.running
                                  ? Colors.amber
                                  : Colors.green,
                              size: btnSize,
                              iconSize: iconSz,
                            ),
                            SizedBox(width: btnGap),
                            _buildControlButton(
                              icon: Icons.refresh,
                              onPressed: () => _ctrl.resetAll(),
                              color: Colors.redAccent,
                              size: btnSize,
                              iconSize: iconSz,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: sideW,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _sideChipButton(
                          pal: pal,
                          label: '+1m',
                          height: sideBtnH,
                          fontSize: sideFs,
                          onTap: () => _ctrl.addRestMinutes(1),
                        ),
                        _sideChipButton(
                          pal: pal,
                          label: '+2m',
                          height: sideBtnH,
                          fontSize: sideFs,
                          onTap: () => _ctrl.addRestMinutes(2),
                        ),
                        _sideChipButton(
                          pal: pal,
                          label: '+5m',
                          height: sideBtnH,
                          fontSize: sideFs,
                          onTap: () => _ctrl.addRestMinutes(5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
    required double size,
    required double iconSize,
  }) {
    return Builder(
      builder: (context) {
        final pal = IronVibePalette.of(context);
        final isDark = pal.brightness == Brightness.dark;
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: pal.field,
              shape: BoxShape.circle,
              border: Border.all(color: pal.borderDefault, width: 1.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.12),
                  offset: const Offset(0, 1),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Icon(icon, color: color, size: iconSize),
          ),
        );
      },
    );
  }
}

class SetRow extends StatefulWidget {
  final SetData data;
  final bool isCardio;

  /// Сообщить родителю (экран тренировки), что черновик изменился — для кнопки «Завершить» и т.п.
  final VoidCallback? onDraftChanged;

  const SetRow({
    super.key,
    required this.data,
    this.isCardio = false,
    this.onDraftChanged,
  });

  @override
  State<SetRow> createState() => _SetRowState();
}

class _SetRowState extends State<SetRow> {
  double? _oneRmKg;

  void _notifyDraft() => widget.onDraftChanged?.call();

  @override
  void initState() {
    super.initState();
    if (!widget.isCardio) {
      widget.data.weight.addListener(_onWeightRepsChanged);
      widget.data.reps.addListener(_onWeightRepsChanged);
      _recalcOneRm();
    }
  }

  @override
  void didUpdateWidget(SetRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(oldWidget.data, widget.data) &&
        oldWidget.isCardio == widget.isCardio) {
      return;
    }
    if (!oldWidget.isCardio) {
      oldWidget.data.weight.removeListener(_onWeightRepsChanged);
      oldWidget.data.reps.removeListener(_onWeightRepsChanged);
    }
    if (!widget.isCardio) {
      widget.data.weight.addListener(_onWeightRepsChanged);
      widget.data.reps.addListener(_onWeightRepsChanged);
      _recalcOneRm();
    } else if (_oneRmKg != null) {
      _oneRmKg = null;
    }
  }

  @override
  void dispose() {
    if (!widget.isCardio) {
      widget.data.weight.removeListener(_onWeightRepsChanged);
      widget.data.reps.removeListener(_onWeightRepsChanged);
    }
    super.dispose();
  }

  void _onWeightRepsChanged() {
    _recalcOneRm();
    _notifyDraft();
  }

  void _recalcOneRm() {
    if (widget.isCardio) return;
    final weightText = widget.data.weight.text.trim();
    final repsText = widget.data.reps.text.trim();
    final weight = double.tryParse(weightText.replaceAll(',', '.'));
    final reps = double.tryParse(repsText.replaceAll(',', '.'));
    final oneRm = weight != null && reps != null && reps >= 1
        ? ironVibeEpleyOneRmKg(weight, reps)
        : null;
    if (mounted) setState(() => _oneRmKg = oneRm);
  }

  static const List<String> _rirValues = ['0', '1', '2', '3', '4', '5', '∞'];
  static const List<String> _intensityValues = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    if (widget.isCardio) {
      return Row(
        children: [
          Expanded(child: _buildDurationField(pal)),
          const SizedBox(width: 8),
          Expanded(child: _buildIntensityDropdown(pal)),
        ],
      );
    }
    final l = AppLocalizations.of(context)!;
    final oneRmWidget = _oneRmKg == null
        ? const SizedBox.shrink()
        : Text(
            '${l.approxOneRm} ${_oneRmKg!.toStringAsFixed(1)}',
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: pal.textMuted,
              fontSize: 9.5,
              fontWeight: FontWeight.w500,
              height: 1.15,
            ),
          );

    return Row(
      children: [
        Expanded(
          child: _buildTextField(
            pal,
            widget.data.weight,
            hint: widget.data.hintWeight,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildTextField(
            pal,
            widget.data.reps,
            hint: widget.data.hintReps,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: _buildRirDropdown(pal)),
        const SizedBox(width: 8),
        SizedBox(width: _kExerciseVolumeColumnWidth, child: oneRmWidget),
      ],
    );
  }

  Widget _buildDurationField(IronVibePalette pal) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: widget.data.duration,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        style: TextStyle(color: pal.textPrimary, fontSize: 14),
        onChanged: (_) => _notifyDraft(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: AppLocalizations.of(context)!.durationMinutesShort,
          hintStyle: TextStyle(color: pal.textHint, fontSize: 12),
          filled: true,
          fillColor: pal.field,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: pal.borderSubtle, width: 0.5),
            borderRadius: BorderRadius.circular(kIronVibeRadiusField),
          ),
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
    );
  }

  Widget _buildIntensityDropdown(IronVibePalette pal) {
    final value = widget.data.intensity.text.trim();
    final selected = _intensityValues.contains(value) ? value : null;
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: pal.field,
        border: Border.all(color: pal.borderSubtle, width: 0.5),
        borderRadius: BorderRadius.circular(kIronVibeRadiusField),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          hint: Text(
            '1-5',
            style: TextStyle(color: pal.textHint, fontSize: 12),
          ),
          dropdownColor: pal.dropdown,
          style: TextStyle(color: pal.textPrimary, fontSize: 14),
          icon: Icon(Icons.arrow_drop_down, color: pal.textSecondary),
          items: _intensityValues.map((String v) {
            return DropdownMenuItem<String>(
              value: v,
              child: Text(v, textAlign: TextAlign.center),
            );
          }).toList(),
          onChanged: (String? v) {
            if (v != null) {
              widget.data.intensity.text = v;
              setState(() {});
              _notifyDraft();
            }
          },
        ),
      ),
    );
  }

  Widget _buildRirDropdown(IronVibePalette pal) {
    final effective = normalizeRirStored(widget.data.rir.text);
    final itemValues = List<String>.from(_rirValues);
    if (effective.isNotEmpty && !itemValues.contains(effective)) {
      itemValues.insert(0, effective);
    }
    final selected = itemValues.contains(effective) ? effective : null;
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: pal.field,
        border: Border.all(color: pal.borderSubtle, width: 0.5),
        borderRadius: BorderRadius.circular(kIronVibeRadiusField),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          hint: Text('0', style: TextStyle(color: pal.textHint, fontSize: 12)),
          dropdownColor: pal.dropdown,
          style: TextStyle(color: pal.textPrimary, fontSize: 14),
          icon: Icon(Icons.arrow_drop_down, color: pal.textSecondary),
          items: itemValues.map((String v) {
            return DropdownMenuItem<String>(
              value: v,
              child: Text(v, textAlign: TextAlign.center),
            );
          }).toList(),
          onChanged: (String? v) {
            if (v != null) {
              widget.data.rir.text = v;
              setState(() {});
              _notifyDraft();
            }
          },
        ),
      ),
    );
  }

  Widget _buildTextField(
    IronVibePalette pal,
    TextEditingController controller, {
    String? hint,
  }) {
    final hintText = hint?.trim();
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        style: TextStyle(color: pal.textPrimary, fontSize: 14),
        onChanged: (_) => _notifyDraft(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: (hintText == null || hintText.isEmpty) ? null : hintText,
          hintStyle: TextStyle(
            color: pal.textHint,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ExerciseCard extends StatefulWidget {
  final ExerciseData data;
  final bool? forceCardioMode;

  /// When set (trainer viewing a client session), progress chart uses only this client's data.
  final String? clientNameForProgress;

  /// Optional index for numbering ([AppLocalizations.exerciseNumberedTitle]).
  final int? exerciseIndex;

  /// Экран активной тренировки сообщает об изменениях (имя, подходы) для UI вроде «Завершить».
  final VoidCallback? onDraftChanged;

  /// Подсветка поля названия при рекорде относительно прошлых тренировок (только активная сессия).
  final IronVibeSessionPrHighlight sessionPrHighlight;

  /// Когда задано, долгое нажатие на поле имени — смена упражнения только для этой сессии (тренер), без глобального переименования.
  final Future<void> Function()? onLongPressReassignExercise;

  /// Удаление карточки из текущей тренировки (тренер и клиент).
  final VoidCallback? onRemove;

  /// Client live/plan: last logged weight/reps as grey hints. Off in personal mode and history.
  final bool previousSetsAsHints;

  /// Current trainer session, excluded when looking up the client's previous log.
  final TrainerSession? excludeTrainerSession;

  const ExerciseCard({
    super.key,
    required this.data,
    this.forceCardioMode,
    this.clientNameForProgress,
    this.exerciseIndex,
    this.onDraftChanged,
    this.sessionPrHighlight = IronVibeSessionPrHighlight.none,
    this.onLongPressReassignExercise,
    this.onRemove,
    this.previousSetsAsHints = false,
    this.excludeTrainerSession,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  /// Фокус поля названия из [Autocomplete] — после выбора из списка снимаем, чтобы оверлей подсказок стабильно закрывался.
  FocusNode? _exerciseNameFieldFocus;

  static const Color _favoriteStarGold = kIronVibeAccent;

  bool _muscleGroupPromptBusy = false;

  bool get _skipMuscleGroupUi =>
      widget.forceCardioMode == true ||
      (widget.forceCardioMode == null && widget.data.isCardio);

  void _refreshClientPreviousHints() {
    if (!widget.previousSetsAsHints || _effectiveIsCardio) return;
    final client = widget.clientNameForProgress?.trim();
    if (client == null || client.isEmpty) return;
    final applied = ironVibeApplyClientPreviousSetHints(
      data: widget.data,
      clientName: client,
      excludeSession: widget.excludeTrainerSession,
    );
    if (applied && mounted) setState(() {});
    if (applied) widget.onDraftChanged?.call();
  }

  @override
  void initState() {
    super.initState();
    widget.data.nameController.addListener(_onExerciseNameChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _refreshClientPreviousHints();
    });
  }

  @override
  void dispose() {
    widget.data.nameController.removeListener(_onExerciseNameChanged);
    _exerciseNameFieldFocus?.removeListener(_onNameFocusChange);
    super.dispose();
  }

  void _bindNameFocus(FocusNode node) {
    if (identical(_exerciseNameFieldFocus, node)) return;
    _exerciseNameFieldFocus?.removeListener(_onNameFocusChange);
    _exerciseNameFieldFocus = node;
    node.addListener(_onNameFocusChange);
  }

  void _onNameFocusChange() {
    final node = _exerciseNameFieldFocus;
    if (node == null || node.hasFocus) return;
    _refreshClientPreviousHints();
    unawaited(_maybePromptMuscleGroup());
  }

  Future<void> _maybePromptMuscleGroup() async {
    if (_muscleGroupPromptBusy || _skipMuscleGroupUi) return;
    if (!mounted) return;
    _muscleGroupPromptBusy = true;
    try {
      await ironVibeMaybePromptMuscleGroup(
        context,
        rawName: widget.data.nameController.text,
        isCardio: _skipMuscleGroupUi,
      );
    } finally {
      _muscleGroupPromptBusy = false;
      if (mounted) setState(() {});
    }
  }

  void _onExerciseNameChanged() {
    if (mounted) setState(() {});
  }

  Future<void> _toggleFavorite() async {
    final name = widget.data.nameController.text;
    if (normalizeExerciseName(name).isEmpty) return;
    await ironVibeToggleFavoriteExercise(
      name,
      clientName: widget.clientNameForProgress,
    );
    if (mounted) setState(() {});
  }

  void _addSet() {
    setState(() {
      widget.data.sets.add(_newSetWithOptionalClientHint());
    });
    widget.onDraftChanged?.call();
  }

  SetData _newSetWithOptionalClientHint() {
    if (!widget.previousSetsAsHints || _effectiveIsCardio) return SetData();
    final client = widget.clientNameForProgress?.trim();
    if (client == null || client.isEmpty) return SetData();
    final name = normalizeExerciseName(widget.data.nameController.text);
    if (name.isEmpty) return SetData();
    return ironVibeClientHintedSetAt(
      exerciseName: name,
      clientName: client,
      index: widget.data.sets.length,
      excludeSession: widget.excludeTrainerSession,
    );
  }

  Future<void> _removeLastSet() async {
    if (widget.data.sets.isEmpty) return;
    final last = widget.data.sets.last;
    final hasData =
        last.weight.text.trim().isNotEmpty ||
        last.reps.text.trim().isNotEmpty ||
        rirIndicatesMeaningfulUserChoice(last.rir.text) ||
        last.duration.text.trim().isNotEmpty ||
        last.intensity.text.trim().isNotEmpty;

    if (hasData) {
      final locale = AppLocalizations.of(context)!;
      final confirm =
          await showDialog<bool>(
            context: context,
            builder: (ctx) {
              final pal = IronVibePalette.of(ctx);
              return AlertDialog(
                backgroundColor: pal.dialog,
                shape: ironVibeDialogShape(pal),
                title: Text(
                  locale.deleteWorkoutTitle,
                  style: TextStyle(
                    color: pal.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  locale.removeSetWithDataConfirm,
                  style: TextStyle(color: pal.textSecondary),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(
                      locale.cancel,
                      style: TextStyle(color: pal.textMuted),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(
                      locale.yesDelete,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ) ??
          false;
      if (!confirm) return;
    }

    if (widget.data.sets.length > 1) {
      setState(() {
        widget.data.sets.removeLast();
      });
      widget.onDraftChanged?.call();
      return;
    }

    setState(() {
      widget.data.sets
        ..clear()
        ..add(SetData());
    });
    widget.onDraftChanged?.call();
  }

  bool get _effectiveIsCardio => widget.forceCardioMode ?? widget.data.isCardio;

  bool get _exerciseHasInput {
    if (widget.data.nameController.text.trim().isNotEmpty) return true;
    for (final s in widget.data.sets) {
      if (s.weight.text.trim().isNotEmpty ||
          s.reps.text.trim().isNotEmpty ||
          rirIndicatesMeaningfulUserChoice(s.rir.text) ||
          s.duration.text.trim().isNotEmpty ||
          s.intensity.text.trim().isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  Future<void> _requestRemove() async {
    if (widget.onRemove == null) return;
    if (_exerciseHasInput) {
      final locale = AppLocalizations.of(context)!;
      final confirm =
          await showDialog<bool>(
            context: context,
            builder: (ctx) {
              final pal = IronVibePalette.of(ctx);
              return AlertDialog(
                backgroundColor: pal.dialog,
                shape: ironVibeDialogShape(pal),
                title: Text(
                  locale.deleteWorkoutTitle,
                  style: TextStyle(
                    color: pal.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  locale.removeExerciseFromWorkoutConfirm,
                  style: TextStyle(color: pal.textSecondary),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(
                      locale.cancel,
                      style: TextStyle(color: pal.textMuted),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(
                      locale.yesDelete,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ) ??
          false;
      if (!confirm || !mounted) return;
    }
    widget.onRemove!();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final segStrength = ironVibeWorkoutTypeSegmentStyle(
      pal,
      isStrengthSegment: true,
      selected: !widget.data.isCardio,
    );
    final segCardioType = ironVibeWorkoutTypeSegmentStyle(
      pal,
      isStrengthSegment: false,
      selected: widget.data.isCardio,
    );
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: ironVibeElevatedCardDecoration(
        pal,
        color: pal.exerciseCardBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.exerciseIndex != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: _toggleFavorite,
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(
                      ironVibeIsFavoriteExercise(
                        widget.data.nameController.text,
                        clientName: widget.clientNameForProgress,
                      )
                          ? Icons.star
                          : Icons.star_border,
                      size: 16,
                      color: _favoriteStarGold,
                    ),
                  ),
                ),
                Text(
                  l.exerciseHeader,
                  style: TextStyle(
                    color: pal.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  l.exerciseNumberLabel(widget.exerciseIndex! + 1),
                  style: TextStyle(
                    color: pal.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (widget.onRemove != null)
                  Tooltip(
                    message: l.removeExerciseFromWorkout,
                    child: GestureDetector(
                      onTap: _requestRemove,
                      behavior: HitTestBehavior.opaque,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 6, top: 2, bottom: 2),
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
          ],
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return ironVibeExerciseNameSuggestions(
                query: textEditingValue.text,
                clientName: widget.clientNameForProgress,
              );
            },
            onSelected: (String selection) {
              widget.data.nameController.text = normalizeExerciseName(
                selection,
              );
              _refreshClientPreviousHints();
              setState(() {});
              widget.onDraftChanged?.call();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _exerciseNameFieldFocus?.unfocus();
                unawaited(_maybePromptMuscleGroup());
              });
            },
            fieldViewBuilder:
                (context, controller, focusNode, onEditingComplete) {
                  _bindNameFocus(focusNode);
                  _exerciseNameFieldFocus = focusNode;
                  if (controller.text != widget.data.nameController.text) {
                    controller.text = widget.data.nameController.text;
                    controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: controller.text.length),
                    );
                  }

                  return GestureDetector(
                    onLongPress: () async {
                      if (widget.onLongPressReassignExercise != null) {
                        await widget.onLongPressReassignExercise!();
                        if (mounted) {
                          _refreshClientPreviousHints();
                          setState(() {});
                          widget.onDraftChanged?.call();
                          unawaited(_maybePromptMuscleGroup());
                        }
                        return;
                      }
                      final current = widget.data.nameController.text;
                      if (current.trim().isEmpty) return;
                      await showRenameExerciseDialog(context, current, (
                        newName,
                      ) {
                        widget.data.nameController.text = newName;
                        controller.text = newName;
                        _refreshClientPreviousHints();
                        setState(() {});
                        widget.onDraftChanged?.call();
                        unawaited(_maybePromptMuscleGroup());
                      });
                    },
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      onEditingComplete: () {
                        onEditingComplete();
                        _refreshClientPreviousHints();
                        unawaited(_maybePromptMuscleGroup());
                      },
                      inputFormatters: [_UpperCaseExerciseNameInputFormatter()],
                      onChanged: (text) {
                        widget.data.nameController.text = text;
                        widget.onDraftChanged?.call();
                      },
                      style: TextStyle(
                        color: pal.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.exerciseHint,
                      ),
                    ),
                  );
                },
            optionsViewBuilder: (autoContext, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  color: pal.autocompleteBg,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: pal.borderSubtle, width: 0.5),
                    borderRadius: BorderRadius.circular(kIronVibeRadiusField),
                  ),
                  child: SizedBox(
                    width: 300,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext itemContext, int index) {
                        final String option = options.elementAt(index);
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: pal.borderSubtle,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onLongPress: () async {
                                    if (option.trim().isEmpty) return;
                                    await showRenameExerciseDialog(
                                      context,
                                      option,
                                      (_) => setState(() {}),
                                    );
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        option,
                                        style: TextStyle(
                                          color: pal.textPrimary,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: pal.textMuted,
                                  size: 16,
                                ),
                                onPressed: () async {
                                  final messenger = ScaffoldMessenger.of(
                                    context,
                                  );
                                  final deletedMsg = AppLocalizations.of(
                                    context,
                                  )!.exerciseDeleted;
                                  final snackBg =
                                      pal.brightness == Brightness.dark
                                      ? Colors.grey[900]
                                      : pal.field;
                                  final removed =
                                      await showRemoveExerciseFromBankDialog(
                                        context,
                                        option,
                                      );
                                  if (!removed || !mounted) return;
                                  setState(() {});
                                  messenger.showSnackBar(
                                    SnackBar(
                                      content: Text('"$option" $deletedMsg'),
                                      backgroundColor: snackBg,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                  final text = widget.data.nameController.text;
                                  final selection =
                                      widget.data.nameController.selection;
                                  widget.data.nameController.text = text;
                                  widget.data.nameController.selection =
                                      selection;
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          if (!_skipMuscleGroupUi)
            ironVibeMuscleGroupChip(
              exerciseName: widget.data.nameController.text,
              onChanged: () {
                if (mounted) setState(() {});
              },
            ),

          const SizedBox(height: 12),
          if (widget.forceCardioMode == null)
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => widget.data.isCardio = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: segStrength.backgroundColor,
                        border: Border.all(
                          color: pal.borderSubtle,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(
                          kIronVibeRadiusSegment,
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.strengthType,
                        textAlign: TextAlign.center,
                        style: segStrength.labelStyle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => widget.data.isCardio = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: segCardioType.backgroundColor,
                        border: Border.all(
                          color: pal.borderSubtle,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(
                          kIronVibeRadiusSegment,
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.cardioType,
                        textAlign: TextAlign.center,
                        style: segCardioType.labelStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          if (widget.forceCardioMode == null) const SizedBox(height: 15),

          if (widget.data.sets.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _effectiveIsCardio
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.timeMin,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: pal.textMuted,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.intensityHeader,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: pal.textMuted,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Text(
                            ironVibeWeightColumnTitle(
                              AppLocalizations.of(context)!,
                            ),
                            textAlign: TextAlign.center,
                            locale: Localizations.localeOf(context),
                            style: TextStyle(
                              color: pal.textMuted,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.15,
                              height: 1.15,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.repsHeader,
                            textAlign: TextAlign.center,
                            locale: Localizations.localeOf(context),
                            style: TextStyle(
                              color: pal.textMuted,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.rirHeader,
                            textAlign: TextAlign.center,
                            locale: Localizations.localeOf(context),
                            style: TextStyle(
                              color: pal.textMuted,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(width: _kExerciseVolumeColumnWidth),
                      ],
                    ),
            ),

          Column(
            children: _effectiveIsCardio
                ? [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SetRow(
                        data: widget.data.sets.first,
                        isCardio: true,
                        onDraftChanged: widget.onDraftChanged,
                      ),
                    ),
                  ]
                : widget.data.sets
                      .map(
                        (setData) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: SetRow(
                            key: ObjectKey(setData),
                            data: setData,
                            isCardio: false,
                            onDraftChanged: widget.onDraftChanged,
                          ),
                        ),
                      )
                      .toList(),
          ),
          if (!_effectiveIsCardio) ...[
            const SizedBox(height: 12),
            _exerciseSetActionsRow(
              context: context,
              volumeData: widget.data,
              onRemove: _removeLastSet,
              onAdd: _addSet,
              onProgress: () => _showProgressBottomSheet(context),
              progressHighlight: ironVibeSessionPrHighlightFill(
                widget.sessionPrHighlight,
                pal.brightness,
                forProgressButton: true,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showProgressBottomSheet(BuildContext context) {
    final exerciseName = normalizeExerciseName(widget.data.nameController.text);
    if (exerciseName.isEmpty) return;
    final pal = IronVibePalette.of(context);
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: pal.sheetModal,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        side: BorderSide(color: pal.borderSubtle, width: 0.5),
      ),
      isScrollControlled: true,
      builder: (context) => _ProgressBottomSheet(
        exerciseName: exerciseName,
        height: MediaQuery.of(context).size.height * 0.55,
        clientName: widget.clientNameForProgress,
      ),
    );
  }
}

const double _kExerciseActionButtonHeight = 48;
const double _kExerciseActionLabelGap = 4;
const double _kExerciseActionLabelHeight = 14;
const double _kExerciseActionRowHeight = _kExerciseActionButtonHeight +
    _kExerciseActionLabelGap +
    _kExerciseActionLabelHeight;
const double _kExerciseVolumeColumnWidth = 80;

TextStyle _exerciseActionCaptionStyle(IronVibePalette pal) {
  return TextStyle(
    color: pal.textMuted,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    height: 1.1,
  );
}

/// Кнопки − / + / график в одной сетке с колонками вес / повторы / RIR.
Widget _exerciseSetActionsRow({
  required BuildContext context,
  required ExerciseData volumeData,
  required VoidCallback onRemove,
  required VoidCallback onAdd,
  required VoidCallback onProgress,
  Color? progressHighlight,
}) {
  final l = AppLocalizations.of(context)!;
  return SizedBox(
    height: _kExerciseActionRowHeight,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: _ExerciseActionIconButton(
            icon: Icons.remove,
            label: l.setHeader,
            semanticLabel: l.instructionSetMinusLabel,
            onTap: onRemove,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ExerciseActionIconButton(
            icon: Icons.add,
            label: l.setHeader,
            semanticLabel: l.instructionSetPlusLabel,
            onTap: onAdd,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ExerciseActionIconButton(
            icon: Icons.show_chart,
            label: l.chart,
            semanticLabel: l.instructionSetProgressLabel,
            onTap: onProgress,
            highlightBackground: progressHighlight,
          ),
        ),
        const SizedBox(width: 8),
        _ExerciseVolumeSummary(data: volumeData),
      ],
    ),
  );
}

class _ExerciseVolumeSummary extends StatefulWidget {
  final ExerciseData data;

  const _ExerciseVolumeSummary({required this.data});

  @override
  State<_ExerciseVolumeSummary> createState() => _ExerciseVolumeSummaryState();
}

class _ExerciseVolumeSummaryState extends State<_ExerciseVolumeSummary> {
  void _onFieldChanged() {
    if (mounted) setState(() {});
  }

  void _attachTo(ExerciseData d) {
    for (final s in d.sets) {
      s.weight.addListener(_onFieldChanged);
      s.reps.addListener(_onFieldChanged);
    }
  }

  void _detachFrom(ExerciseData d) {
    for (final s in d.sets) {
      s.weight.removeListener(_onFieldChanged);
      s.reps.removeListener(_onFieldChanged);
    }
  }

  @override
  void initState() {
    super.initState();
    _attachTo(widget.data);
  }

  @override
  void didUpdateWidget(covariant _ExerciseVolumeSummary oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data ||
        oldWidget.data.sets.length != widget.data.sets.length) {
      _detachFrom(oldWidget.data);
      _attachTo(widget.data);
    }
  }

  @override
  void dispose() {
    _detachFrom(widget.data);
    super.dispose();
  }

  double _totalVolumeKg() {
    var sum = 0.0;
    for (final s in widget.data.sets) {
      final v = ironVibeVolumeKgFromFields(s.weight.text, s.reps.text);
      if (v != null) sum += v;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final total = _totalVolumeKg();
    final volumeWidget = total <= 0
        ? Text(
            '—',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: pal.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          )
        : Text(
            ironVibeFormatKgTon(total),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: pal.textMuted,
              fontSize: 9.5,
              fontWeight: FontWeight.w500,
              height: 1.12,
            ),
          );

    return SizedBox(
      width: _kExerciseVolumeColumnWidth,
      height: _kExerciseActionRowHeight,
      child: Column(
        children: [
          SizedBox(
            height: _kExerciseActionButtonHeight,
            width: double.infinity,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: volumeWidget,
              ),
            ),
          ),
          const SizedBox(height: _kExerciseActionLabelGap),
          SizedBox(
            height: _kExerciseActionLabelHeight,
            width: double.infinity,
            child: Text(
              l.volumeShort,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: _exerciseActionCaptionStyle(pal),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExerciseActionIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String label;
  final String semanticLabel;
  final Color? highlightBackground;

  const _ExerciseActionIconButton({
    required this.icon,
    required this.onTap,
    required this.label,
    required this.semanticLabel,
    this.highlightBackground,
  });

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final radius = BorderRadius.circular(kIronVibeRadiusField);
    return Semantics(
      button: true,
      label: semanticLabel,
      child: Column(
        children: [
          SizedBox(
            height: _kExerciseActionButtonHeight,
            width: double.infinity,
            child: Material(
              color: highlightBackground ?? Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: radius,
                side: BorderSide(color: pal.borderDefault, width: 1.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                customBorder: RoundedRectangleBorder(borderRadius: radius),
                child: Center(
                  child: Icon(icon, color: pal.iconPrimary, size: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: _kExerciseActionLabelGap),
          SizedBox(
            height: _kExerciseActionLabelHeight,
            width: double.infinity,
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: _exerciseActionCaptionStyle(pal),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> ironVibeConfirmFinishWorkout(BuildContext context) async {
  final l = AppLocalizations.of(context)!;
  final pal = IronVibePalette.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final dpal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: dpal.dialog,
        shape: ironVibeDialogShape(dpal),
        title: Text(
          l.finishWorkoutConfirmTitle,
          style: TextStyle(
            color: dpal.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          l.finishWorkoutConfirmBody,
          style: TextStyle(color: dpal.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l.cancel,
              style: TextStyle(color: dpal.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l.finishWorkoutConfirmAction,
              style: TextStyle(
                color: pal.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      );
    },
  );
  return result == true;
}

Future<void> ironVibeShowWorkoutComplete(
  BuildContext context, {
  String? title,
}) {
  final resolved = title ?? AppLocalizations.of(context)!.workoutCompleteTitle;
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierLabel: resolved,
    barrierColor: Colors.black.withValues(alpha: 0.45),
    transitionDuration: const Duration(milliseconds: 280),
    pageBuilder: (ctx, animation, secondaryAnimation) {
      return _IronVibeWorkoutCompleteOverlay(title: resolved);
    },
    transitionBuilder: (ctx, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

class _IronVibeWorkoutCompleteOverlay extends StatefulWidget {
  final String title;

  const _IronVibeWorkoutCompleteOverlay({required this.title});

  @override
  State<_IronVibeWorkoutCompleteOverlay> createState() =>
      _IronVibeWorkoutCompleteOverlayState();
}

class _IronVibeWorkoutCompleteOverlayState
    extends State<_IronVibeWorkoutCompleteOverlay>
    with TickerProviderStateMixin {
  static const Color _checkGreen = Color(0xFF22C55E);
  static const Color _cardWhite = Color(0xFFFBFCFE);

  late final AnimationController _cardCtrl;
  late final AnimationController _checkCtrl;
  late final Animation<double> _cardScale;
  late final Animation<double> _cardOpacity;
  bool _closed = false;

  @override
  void initState() {
    super.initState();
    _cardCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );
    _checkCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 720),
    );
    _cardScale = CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOutBack);
    _cardOpacity = CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOut);
    unawaited(_play());
  }

  Future<void> _play() async {
    await _cardCtrl.forward();
    if (!mounted) return;
    await _checkCtrl.forward();
    if (!mounted) return;
    HapticFeedback.mediumImpact();
    await Future<void>.delayed(const Duration(milliseconds: 950));
    _close();
  }

  void _close() {
    if (_closed || !mounted) return;
    _closed = true;
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _cardCtrl.dispose();
    _checkCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _close,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: FadeTransition(
            opacity: _cardOpacity,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.86, end: 1).animate(_cardScale),
              child: Container(
                width: 260,
                padding: const EdgeInsets.fromLTRB(28, 32, 28, 28),
                decoration: BoxDecoration(
                  color: _cardWhite,
                  borderRadius: BorderRadius.circular(kIronVibeRadiusDialog + 6),
                  boxShadow: ironVibeCardShadow(isDark: false),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 88,
                      height: 88,
                      child: AnimatedBuilder(
                        animation: _checkCtrl,
                        builder: (context, _) {
                          return CustomPaint(
                            painter: _IronVibeCheckPainter(
                              progress: _checkCtrl.value,
                              color: _checkGreen,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF2A3140),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IronVibeCheckPainter extends CustomPainter {
  final double progress;
  final Color color;

  _IronVibeCheckPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 2;
    final circleT = (progress / 0.42).clamp(0.0, 1.0);
    final checkT = ((progress - 0.42) / 0.58).clamp(0.0, 1.0);

    final circlePaint = Paint()
      ..color = color.withValues(alpha: 0.14 + 0.10 * circleT)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * (0.82 + 0.18 * circleT), circlePaint);

    final ring = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.2
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.2,
      6.28318530718 * circleT,
      false,
      ring,
    );

    if (checkT <= 0) return;
    final checkPath = Path()
      ..moveTo(size.width * 0.28, size.height * 0.52)
      ..lineTo(size.width * 0.44, size.height * 0.68)
      ..lineTo(size.width * 0.74, size.height * 0.34);
    final metrics = checkPath.computeMetrics().toList();
    if (metrics.isEmpty) return;
    final metric = metrics.first;
    final extract = metric.extractPath(0, metric.length * checkT);
    final checkPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(extract, checkPaint);
  }

  @override
  bool shouldRepaint(covariant _IronVibeCheckPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
