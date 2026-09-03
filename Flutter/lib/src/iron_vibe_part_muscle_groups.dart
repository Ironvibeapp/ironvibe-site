part of 'package:fitness_app/main.dart';

/// Primary muscle group for an exercise name. Stored separately from workout
/// logs so existing history JSON stays valid across app updates.
enum IronVibeMuscleGroup {
  chest('chest'),
  back('back'),
  shoulders('shoulders'),
  core('core'),
  quad('quad'),
  hamstring('hamstring'),
  armFlex('armFlex'),
  armExt('armExt'),
  skip('skip');

  const IronVibeMuscleGroup(this.id);
  final String id;

  bool get countsForQuickWorkout => this != IronVibeMuscleGroup.skip;
}

const List<IronVibeMuscleGroup> _kMuscleGroupsForPicker = [
  IronVibeMuscleGroup.chest,
  IronVibeMuscleGroup.back,
  IronVibeMuscleGroup.shoulders,
  IronVibeMuscleGroup.core,
  IronVibeMuscleGroup.quad,
  IronVibeMuscleGroup.hamstring,
  IronVibeMuscleGroup.armFlex,
  IronVibeMuscleGroup.armExt,
];

/// One leg slot: front or rear thigh, never both in the same quick session.
const List<IronVibeMuscleGroup> _kQuickWorkoutLegGroups = [
  IronVibeMuscleGroup.quad,
  IronVibeMuscleGroup.hamstring,
];

/// Fourth slot: shoulders, arms, or core — whichever was trained longest ago.
const List<IronVibeMuscleGroup> _kQuickWorkoutAccessoryGroups = [
  IronVibeMuscleGroup.shoulders,
  IronVibeMuscleGroup.armFlex,
  IronVibeMuscleGroup.armExt,
  IronVibeMuscleGroup.core,
];

const int _kQuickWorkoutExerciseCount = 4;

/// Normalized exercise name → group. Never written into [WorkoutLog] JSON.
Map<String, IronVibeMuscleGroup> ironVibeExerciseMuscleGroups = {};

final Set<String> _ironVibeMuscleGroupPromptDeferred = {};

IronVibeMuscleGroup? ironVibeMuscleGroupFromId(String raw) {
  final id = raw.trim();
  if (id.isEmpty) return null;
  for (final g in IronVibeMuscleGroup.values) {
    if (g.id == id) return g;
  }
  return null;
}

IronVibeMuscleGroup? ironVibeMuscleGroupForName(String rawName) {
  final name = normalizeExerciseName(rawName);
  if (name.isEmpty) return null;
  return ironVibeExerciseMuscleGroups[name];
}

bool ironVibeHasMuscleGroup(String rawName) {
  return ironVibeMuscleGroupForName(rawName) != null;
}

Map<String, IronVibeMuscleGroup> ironVibeParseExerciseMuscleGroups(
  dynamic decoded,
) {
  final out = <String, IronVibeMuscleGroup>{};
  if (decoded is! Map) return out;
  decoded.forEach((key, value) {
    final name = normalizeExerciseName(key.toString());
    if (name.isEmpty) return;
    final group = ironVibeMuscleGroupFromId(_jsonString(value));
    if (group == null) return;
    out[name] = group;
  });
  return out;
}

Map<String, String> ironVibeExerciseMuscleGroupsToJsonMap() {
  return ironVibeExerciseMuscleGroups.map((k, v) => MapEntry(k, v.id));
}

Future<void> ironVibeSetMuscleGroup(
  String rawName,
  IronVibeMuscleGroup? group,
) async {
  final name = normalizeExerciseName(rawName);
  if (name.isEmpty) return;
  if (group == null) {
    ironVibeExerciseMuscleGroups.remove(name);
  } else {
    ironVibeExerciseMuscleGroups[name] = group;
  }
  _ironVibeMuscleGroupPromptDeferred.remove(name);
  await DataService.saveData();
}

void ironVibeRenameMuscleGroup(String oldName, String newName) {
  final o = normalizeExerciseName(oldName);
  final n = normalizeExerciseName(newName);
  if (o.isEmpty || n.isEmpty || o == n) return;
  final group = ironVibeExerciseMuscleGroups.remove(o);
  if (group == null) return;
  ironVibeExerciseMuscleGroups.putIfAbsent(n, () => group);
}

void ironVibeMergeMuscleGroupsFromBackup(
  dynamic decoded, {
  Iterable<String>? onlyNames,
}) {
  final incoming = ironVibeParseExerciseMuscleGroups(decoded);
  Set<String>? allow;
  if (onlyNames != null) {
    allow = <String>{};
    for (final raw in onlyNames) {
      final name = normalizeExerciseName(raw);
      if (name.isNotEmpty) allow.add(name);
    }
  }
  incoming.forEach((name, group) {
    if (allow != null && !allow.contains(name)) return;
    ironVibeExerciseMuscleGroups.putIfAbsent(name, () => group);
  });
}

String ironVibeMuscleGroupLabel(
  AppLocalizations l,
  IronVibeMuscleGroup group,
) {
  switch (group) {
    case IronVibeMuscleGroup.chest:
      return l.muscleGroupChest;
    case IronVibeMuscleGroup.back:
      return l.muscleGroupBack;
    case IronVibeMuscleGroup.shoulders:
      return l.muscleGroupShoulders;
    case IronVibeMuscleGroup.core:
      return l.muscleGroupCore;
    case IronVibeMuscleGroup.quad:
      return l.muscleGroupQuads;
    case IronVibeMuscleGroup.hamstring:
      return l.muscleGroupHamstrings;
    case IronVibeMuscleGroup.armFlex:
      return l.muscleGroupArmFlex;
    case IronVibeMuscleGroup.armExt:
      return l.muscleGroupArmExt;
    case IronVibeMuscleGroup.skip:
      return l.muscleGroupSkip;
  }
}

class _MuscleGroupDialogResult {
  final IronVibeMuscleGroup? group;
  final bool deferred;
  final bool cleared;
  final bool suppressed;
  const _MuscleGroupDialogResult.group(this.group)
    : deferred = false,
      cleared = false,
      suppressed = false;
  const _MuscleGroupDialogResult.later()
    : group = null,
      deferred = true,
      cleared = false,
      suppressed = false;
  const _MuscleGroupDialogResult.clear()
    : group = null,
      deferred = false,
      cleared = true,
      suppressed = false;
  const _MuscleGroupDialogResult.suppressed()
    : group = null,
      deferred = false,
      cleared = false,
      suppressed = true;
}

Future<_MuscleGroupDialogResult?> _ironVibeShowMuscleGroupPicker({
  required BuildContext context,
  required String exerciseName,
  IronVibeMuscleGroup? selected,
  required bool allowLater,
  required bool allowClear,
}) async {
  if (!context.mounted) return const _MuscleGroupDialogResult.suppressed();
  final existingRoute = ModalRoute.of(context);
  if (existingRoute == null || !existingRoute.isCurrent) {
    return const _MuscleGroupDialogResult.suppressed();
  }

  FocusManager.instance.primaryFocus?.unfocus();
  await Future<void>.delayed(const Duration(milliseconds: 80));
  if (!context.mounted) return const _MuscleGroupDialogResult.suppressed();
  final route = ModalRoute.of(context);
  if (route == null || !route.isCurrent) {
    return const _MuscleGroupDialogResult.suppressed();
  }

  final pal = IronVibePalette.of(context);
  final compact = MediaQuery.sizeOf(context).shortestSide < 600;

  if (compact) {
    return showModalBottomSheet<_MuscleGroupDialogResult>(
      context: context,
      backgroundColor: pal.sheetModal,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      showDragHandle: true,
      barrierColor: Colors.black.withValues(alpha: 0.45),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        side: BorderSide(color: pal.borderSubtle, width: 0.5),
      ),
      builder: (ctx) => _MuscleGroupPickerPanel(
        exerciseName: exerciseName,
        selected: selected,
        allowLater: allowLater,
        allowClear: allowClear,
        sheetStyle: true,
      ),
    );
  }

  return showDialog<_MuscleGroupDialogResult>(
    context: context,
    barrierDismissible: true,
    builder: (ctx) {
      return Dialog(
        backgroundColor: pal.dialog,
        insetPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: pal.borderDefault, width: 0.5),
          borderRadius: BorderRadius.circular(kIronVibeRadiusDialog),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: _MuscleGroupPickerPanel(
            exerciseName: exerciseName,
            selected: selected,
            allowLater: allowLater,
            allowClear: allowClear,
            sheetStyle: false,
          ),
        ),
      );
    },
  );
}

class _MuscleGroupPickerPanel extends StatelessWidget {
  final String exerciseName;
  final IronVibeMuscleGroup? selected;
  final bool allowLater;
  final bool allowClear;
  final bool sheetStyle;

  const _MuscleGroupPickerPanel({
    required this.exerciseName,
    required this.selected,
    required this.allowLater,
    required this.allowClear,
    required this.sheetStyle,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final name = normalizeExerciseName(exerciseName);
    final media = MediaQuery.of(context);
    final available = media.size.height
        - media.viewInsets.bottom
        - media.padding.top
        - media.padding.bottom;

    Widget groupChip(IronVibeMuscleGroup group) {
      final isOn = selected == group;
      return Material(
        color: isOn ? pal.chipSelected : pal.field,
        borderRadius: BorderRadius.circular(kIronVibeRadiusChip),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.pop(
            context,
            _MuscleGroupDialogResult.group(group),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kIronVibeRadiusChip),
              border: Border.all(
                color: isOn ? pal.borderDefault : pal.borderSubtle,
                width: isOn ? 1 : 0.5,
              ),
            ),
            child: Text(
              ironVibeMuscleGroupLabel(l, group),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: pal.textPrimary,
                fontSize: 13,
                fontWeight: isOn ? FontWeight.w800 : FontWeight.w600,
                height: 1.15,
              ),
            ),
          ),
        ),
      );
    }

    final skipOn = selected == IronVibeMuscleGroup.skip;
    final chromeReserve = (sheetStyle ? 36.0 : 24.0) + 188.0;
    final gridMaxHeight = (available - chromeReserve).clamp(140.0, 280.0);

    return Padding(
      padding: EdgeInsets.only(bottom: media.viewInsets.bottom),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, sheetStyle ? 0 : 12, 16, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l.muscleGroupPromptTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: pal.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (allowLater)
                  TextButton(
                    onPressed: () => Navigator.pop(
                      context,
                      const _MuscleGroupDialogResult.later(),
                    ),
                    child: Text(
                      l.muscleGroupLater,
                      style: TextStyle(
                        color: pal.textSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                if (allowClear)
                  TextButton(
                    onPressed: () => Navigator.pop(
                      context,
                      const _MuscleGroupDialogResult.clear(),
                    ),
                    child: Text(
                      l.muscleGroupClear,
                      style: TextStyle(
                        color: pal.textSecondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
            if (name.isNotEmpty)
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            const SizedBox(height: 4),
            Text(
              l.muscleGroupPromptBody,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: pal.textMuted,
                fontSize: 11.5,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: gridMaxHeight),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  const cols = 2;
                  const spacing = 8.0;
                  const tileH = 52.0;
                  final tileW =
                      (constraints.maxWidth - spacing * (cols - 1)) / cols;
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    crossAxisCount: cols,
                    mainAxisSpacing: spacing,
                    crossAxisSpacing: spacing,
                    childAspectRatio: tileW / tileH,
                    padding: EdgeInsets.zero,
                    children: [
                      for (final g in _kMuscleGroupsForPicker) groupChip(g),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Material(
              color: skipOn ? pal.chipSelected : Colors.transparent,
              borderRadius: BorderRadius.circular(kIronVibeRadiusChip),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.pop(
                  context,
                  const _MuscleGroupDialogResult.group(
                    IronVibeMuscleGroup.skip,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kIronVibeRadiusChip),
                    border: Border.all(
                      color: skipOn ? pal.borderDefault : pal.borderSubtle,
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    l.muscleGroupSkip,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: skipOn ? pal.textPrimary : pal.textSecondary,
                      fontSize: 12.5,
                      fontWeight: skipOn ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> ironVibeMaybePromptMuscleGroup(
  BuildContext context, {
  required String rawName,
  required bool isCardio,
}) async {
  if (isCardio) return;
  final name = normalizeExerciseName(rawName);
  if (name.isEmpty) return;
  if (ironVibeExerciseMuscleGroups.containsKey(name)) return;
  if (_ironVibeMuscleGroupPromptDeferred.contains(name)) return;
  if (!context.mounted) return;

  final result = await _ironVibeShowMuscleGroupPicker(
    context: context,
    exerciseName: name,
    selected: null,
    allowLater: true,
    allowClear: false,
  );
  if (result == null || result.deferred) {
    _ironVibeMuscleGroupPromptDeferred.add(name);
    return;
  }
  if (result.suppressed) return;
  if (result.cleared || result.group == null) return;
  await ironVibeSetMuscleGroup(name, result.group);
}

Future<void> ironVibeEditMuscleGroup(
  BuildContext context, {
  required String rawName,
}) async {
  final name = normalizeExerciseName(rawName);
  if (name.isEmpty) return;
  if (!context.mounted) return;
  final current = ironVibeExerciseMuscleGroups[name];
  final result = await _ironVibeShowMuscleGroupPicker(
    context: context,
    exerciseName: name,
    selected: current,
    allowLater: false,
    allowClear: current != null,
  );
  if (result == null || result.deferred) return;
  if (result.cleared) {
    await ironVibeSetMuscleGroup(name, null);
    return;
  }
  if (result.group != null) {
    await ironVibeSetMuscleGroup(name, result.group);
  }
}

Widget ironVibeMuscleGroupChip({
  required String exerciseName,
  required VoidCallback onChanged,
}) {
  final name = normalizeExerciseName(exerciseName);
  return Builder(
    builder: (context) {
      final l = AppLocalizations.of(context)!;
      final pal = IronVibePalette.of(context);
      final group = ironVibeMuscleGroupForName(name);
      final label = group == null
          ? l.muscleGroupUntagged
          : ironVibeMuscleGroupLabel(l, group);
      return Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: name.isEmpty
              ? null
              : () async {
                  await ironVibeEditMuscleGroup(
                    context,
                    rawName: name,
                  );
                  onChanged();
                },
          behavior: HitTestBehavior.opaque,
          child: Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: group == null ? Colors.transparent : pal.chipSelected,
              borderRadius: BorderRadius.circular(kIronVibeRadiusChip),
              border: Border.all(
                color: group == null ? pal.borderSubtle : pal.borderDefault,
                width: 0.5,
              ),
            ),
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: group == null ? pal.textMuted : pal.textPrimary,
                fontSize: 9.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ),
      );
    },
  );
}

bool _quickWorkoutGroupHasExercises(IronVibeMuscleGroup group) =>
    ironVibeNamesForMuscleGroup(group).isNotEmpty;

bool ironVibeQuickWorkoutHasEnoughData() {
  if (!_quickWorkoutGroupHasExercises(IronVibeMuscleGroup.chest)) return false;
  if (!_quickWorkoutGroupHasExercises(IronVibeMuscleGroup.back)) return false;
  final hasLeg = _kQuickWorkoutLegGroups.any(_quickWorkoutGroupHasExercises);
  if (!hasLeg) return false;
  return _kQuickWorkoutAccessoryGroups.any(_quickWorkoutGroupHasExercises);
}

List<String> ironVibeNamesForMuscleGroup(IronVibeMuscleGroup group) {
  final out = <String>[];
  ironVibeExerciseMuscleGroups.forEach((name, g) {
    if (g == group && ironVibeIsExerciseInBank(name)) out.add(name);
  });
  out.sort();
  return out;
}

DateTime? ironVibeLastTrainedAt(String rawName, {String? clientName}) {
  final name = normalizeExerciseName(rawName);
  if (name.isEmpty) return null;
  DateTime? last;

  void consider(DateTime date, List<ExerciseLog> exercises) {
    for (final ex in exercises) {
      if (ex.isCardio) continue;
      if (normalizeExerciseName(ex.name) != name) continue;
      if (!ironVibeExerciseLogHasLoggedData(ex)) continue;
      if (last == null || date.isAfter(last!)) last = date;
    }
  }

  final scoped = clientName?.trim();
  if (scoped == null || scoped.isEmpty) {
    for (final w in workoutHistory) {
      consider(w.date, w.exercises);
    }
  } else {
    for (final s in trainerSchedule) {
      if (!ironVibeSessionBelongsToClient(s, clientName: scoped)) continue;
      if (!ironVibeTrainerSessionCountsAsWork(s)) continue;
      consider(s.dateTime, s.exercises);
    }
  }
  return last;
}

ExerciseLog ironVibeLastExerciseLogFor(
  String rawName, {
  String? clientName,
  TrainerSession? excludeSession,
}) {
  final name = normalizeExerciseName(rawName);
  ExerciseLog? found;
  DateTime? foundDate;

  void consider(DateTime date, List<ExerciseLog> exercises) {
    for (final ex in exercises) {
      if (ex.isCardio) continue;
      if (normalizeExerciseName(ex.name) != name) continue;
      if (!ironVibeExerciseLogHasLoggedData(ex)) continue;
      if (foundDate == null || date.isAfter(foundDate!)) {
        foundDate = date;
        found = ex;
      }
    }
  }

  final scoped = clientName?.trim();
  if (scoped == null || scoped.isEmpty) {
    for (final w in workoutHistory) {
      consider(w.date, w.exercises);
    }
  } else {
    for (final s in trainerSchedule) {
      if (!ironVibeSessionBelongsToClient(s, clientName: scoped)) continue;
      if (!ironVibeTrainerSessionCountsAsWork(s)) continue;
      if (excludeSession != null &&
          _ironVibeSameTrainerSession(s, excludeSession)) {
        continue;
      }
      consider(s.dateTime, s.exercises);
    }
  }

  final sets = found?.sets;
  if (sets == null || sets.isEmpty) {
    return ExerciseLog(name, [SetLog('', '', '0')]);
  }
  return ExerciseLog(name, List<SetLog>.from(sets));
}

int _quickWorkoutExerciseRecencyScore(String name, {String? clientName}) {
  final last = ironVibeLastTrainedAt(name, clientName: clientName);
  if (last == null) return 0;
  return last.millisecondsSinceEpoch;
}

int _quickWorkoutGroupRecencyScore(
  IronVibeMuscleGroup group, {
  String? clientName,
}) {
  DateTime? last;
  for (final name in ironVibeNamesForMuscleGroup(group)) {
    final trained = ironVibeLastTrainedAt(name, clientName: clientName);
    if (trained == null) continue;
    if (last == null || trained.isAfter(last)) last = trained;
  }
  if (last == null) return 0;
  return last.millisecondsSinceEpoch;
}

IronVibeMuscleGroup? _pickStaleQuickWorkoutGroup(
  List<IronVibeMuscleGroup> groups, {
  String? clientName,
}) {
  IronVibeMuscleGroup? best;
  var bestScore = 0;
  for (final group in groups) {
    if (!_quickWorkoutGroupHasExercises(group)) continue;
    final score = _quickWorkoutGroupRecencyScore(
      group,
      clientName: clientName,
    );
    if (best == null ||
        score < bestScore ||
        (score == bestScore && group.index < best.index)) {
      best = group;
      bestScore = score;
    }
  }
  return best;
}

String? _pickQuickWorkoutNameForGroup(
  IronVibeMuscleGroup group, {
  String? clientName,
  Set<String> exclude = const {},
}) {
  final candidates = ironVibeNamesForMuscleGroup(group)
      .where((n) => !exclude.contains(n))
      .toList();
  if (candidates.isEmpty) return null;

  final favorites = candidates
      .where((n) => ironVibeIsFavoriteExercise(n, clientName: clientName))
      .toList();
  final pool = favorites.isNotEmpty ? favorites : candidates;
  pool.sort((a, b) {
    final rec = _quickWorkoutExerciseRecencyScore(
      a,
      clientName: clientName,
    ).compareTo(_quickWorkoutExerciseRecencyScore(b, clientName: clientName));
    if (rec != 0) return rec;
    return a.compareTo(b);
  });
  return pool.first;
}

class IronVibeQuickWorkoutPick {
  final String name;
  final IronVibeMuscleGroup group;
  IronVibeQuickWorkoutPick({required this.name, required this.group});
}

List<IronVibeQuickWorkoutPick> ironVibeBuildFullBodyQuickWorkout({
  String? clientName,
}) {
  final picks = <IronVibeQuickWorkoutPick>[];
  final used = <String>{};

  void addSlot(IronVibeMuscleGroup? group) {
    if (group == null) return;
    if (picks.length >= _kQuickWorkoutExerciseCount) return;
    final name = _pickQuickWorkoutNameForGroup(
      group,
      clientName: clientName,
      exclude: used,
    );
    if (name == null) return;
    used.add(name);
    picks.add(IronVibeQuickWorkoutPick(name: name, group: group));
  }

  addSlot(IronVibeMuscleGroup.chest);
  addSlot(IronVibeMuscleGroup.back);
  addSlot(
    _pickStaleQuickWorkoutGroup(
      _kQuickWorkoutLegGroups,
      clientName: clientName,
    ),
  );
  addSlot(
    _pickStaleQuickWorkoutGroup(
      _kQuickWorkoutAccessoryGroups,
      clientName: clientName,
    ),
  );
  return picks;
}

Future<void> _ironVibeShowQuickWorkoutInsufficient(
  BuildContext context, {
  String? clientName,
}) async {
  final l = AppLocalizations.of(context)!;
  final openProgress = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final dpal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: dpal.dialog,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: dpal.borderDefault, width: 0.5),
          borderRadius: BorderRadius.circular(kIronVibeRadiusDialog),
        ),
        title: Text(
          l.quickWorkoutInsufficientTitle,
          style: TextStyle(
            color: dpal.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          l.quickWorkoutInsufficientBody,
          style: TextStyle(color: dpal.textSecondary, height: 1.35),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l.close,
              style: TextStyle(color: dpal.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l.quickWorkoutOpenProgress,
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
  if (openProgress == true && context.mounted) {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PersonalProgressScreen(clientName: clientName),
      ),
    );
  }
}

Future<void> ironVibeStartQuickWorkout(
  BuildContext context, {
  String? clientName,
}) async {
  if (!ironVibeQuickWorkoutHasEnoughData()) {
    await _ironVibeShowQuickWorkoutInsufficient(
      context,
      clientName: clientName,
    );
    return;
  }

  if (!context.mounted) return;
  final picks = ironVibeBuildFullBodyQuickWorkout(clientName: clientName);
  if (picks.length < _kQuickWorkoutExerciseCount) {
    await _ironVibeShowQuickWorkoutInsufficient(
      context,
      clientName: clientName,
    );
    return;
  }

  final confirmed = await showDialog<List<IronVibeQuickWorkoutPick>>(
    context: context,
    builder: (ctx) => _QuickWorkoutPreviewDialog(initialPicks: picks),
  );
  if (confirmed == null || confirmed.isEmpty || !context.mounted) return;

  final scopedClient = clientName?.trim();
  if (scopedClient != null && scopedClient.isNotEmpty) {
    final session = ironVibeNewTrainerSession(
      dateTime: DateTime.now(),
      clientName: scopedClient,
      exercises: confirmed
          .map((p) => ExerciseLog(p.name, [SetLog('', '', '0')]))
          .toList(),
    );
    trainerSchedule.add(session);
    ironVibeMarkTrainerSessionLiveCurrent(session);
    await DataService.saveData();
    if (!context.mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainerWorkoutSessionScreen(
          session: session,
          mode: TrainerSessionUiMode.live,
          previousSetsAsHints: true,
        ),
      ),
    );
    return;
  }

  final logs = confirmed
      .map(
        (p) => ironVibeLastExerciseLogFor(p.name, clientName: clientName),
      )
      .toList();

  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => WorkoutSessionScreen(
        initialExercises: logs,
        previousSetsAsHints: true,
      ),
    ),
  );
}

class _QuickWorkoutPreviewDialog extends StatefulWidget {
  final List<IronVibeQuickWorkoutPick> initialPicks;

  const _QuickWorkoutPreviewDialog({
    required this.initialPicks,
  });

  @override
  State<_QuickWorkoutPreviewDialog> createState() =>
      _QuickWorkoutPreviewDialogState();
}

class _QuickWorkoutPreviewDialogState extends State<_QuickWorkoutPreviewDialog> {
  late List<IronVibeQuickWorkoutPick> _picks;

  @override
  void initState() {
    super.initState();
    _picks = List<IronVibeQuickWorkoutPick>.from(widget.initialPicks);
  }

  Future<void> _swapAt(int index) async {
    final current = _picks[index];
    final used = _picks.map((p) => p.name).toSet();
    final alternatives = ironVibeNamesForMuscleGroup(current.group)
        .where((n) => n != current.name && !used.contains(n))
        .toList();
    if (alternatives.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.quickWorkoutNoAlternatives),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    final pal = IronVibePalette.of(context);
    final picked = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: pal.sheetModal,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        side: BorderSide(color: pal.borderSubtle, width: 0.5),
      ),
      builder: (ctx) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (final name in alternatives)
                ListTile(
                  title: Text(
                    name,
                    style: TextStyle(
                      color: pal.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () => Navigator.pop(ctx, name),
                ),
            ],
          ),
        );
      },
    );
    if (picked == null || !mounted) return;
    setState(() {
      _picks[index] = IronVibeQuickWorkoutPick(
        name: picked,
        group: current.group,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    return AlertDialog(
      backgroundColor: pal.dialog,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: pal.borderDefault, width: 0.5),
        borderRadius: BorderRadius.circular(kIronVibeRadiusDialog),
      ),
      title: Text(
        l.quickWorkoutPreviewTitle,
        style: TextStyle(
          color: pal.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            for (var i = 0; i < _picks.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _picks[i].name,
                            style: TextStyle(
                              color: pal.textPrimary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            ironVibeMuscleGroupLabel(l, _picks[i].group),
                            style: TextStyle(
                              color: pal.textMuted,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => _swapAt(i),
                      child: Text(
                        l.quickWorkoutSwap,
                        style: TextStyle(
                          color: pal.textSecondary,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
            ),
          ),
        ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l.cancel, style: TextStyle(color: pal.textMuted)),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _picks),
          child: Text(
            l.quickWorkoutStart,
            style: TextStyle(
              color: pal.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
