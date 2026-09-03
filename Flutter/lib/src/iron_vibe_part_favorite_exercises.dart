part of 'package:fitness_app/main.dart';

List<String> _ironVibeFavoriteListFor({String? clientName}) {
  final scopedClient = clientName?.trim();
  if (scopedClient == null || scopedClient.isEmpty) {
    return ironVibeAthleteFavoriteExercises;
  }
  for (final client in clients) {
    if (ironVibeClientNameKey(client.name) == ironVibeClientNameKey(scopedClient)) {
      return client.favoriteExercises;
    }
  }
  return const <String>[];
}

List<String> ironVibeNormalizedNamesFromJsonList(dynamic raw) {
  if (raw is! List) return const [];
  final out = <String>[];
  for (final item in raw) {
    if (item == null) continue;
    final s = normalizeExerciseName(item is String ? item : item.toString());
    if (s.isNotEmpty) out.add(s);
  }
  return _dedupeNormalizedExerciseBank(out);
}

void ironVibeMergeFavoriteNames(List<String> target, Iterable<String> incoming) {
  for (final raw in incoming) {
    final s = normalizeExerciseName(raw);
    if (s.isEmpty) continue;
    if (target.any((e) => normalizeExerciseName(e) == s)) continue;
    target.add(s);
  }
}

List<String> ironVibeFavoriteExerciseNames({String? clientName}) {
  return List<String>.from(_ironVibeFavoriteListFor(clientName: clientName));
}

bool ironVibeIsFavoriteExercise(String rawName, {String? clientName}) {
  final name = normalizeExerciseName(rawName);
  if (name.isEmpty) return false;
  final list = _ironVibeFavoriteListFor(clientName: clientName);
  return list.any((e) => normalizeExerciseName(e) == name);
}

Future<void> ironVibeToggleFavoriteExercise(
  String rawName, {
  String? clientName,
}) async {
  final name = normalizeExerciseName(rawName);
  if (name.isEmpty) return;
  final scoped = clientName?.trim();
  if (scoped != null && scoped.isNotEmpty) {
    final client = ironVibeFindClient(name: scoped);
    if (client == null) return;
  }
  final list = _ironVibeFavoriteListFor(clientName: clientName);
  if (identical(list, const <String>[])) return;
  final idx = list.indexWhere((e) => normalizeExerciseName(e) == name);
  if (idx >= 0) {
    list.removeAt(idx);
  } else {
    list.add(name);
  }
  await DataService.saveData();
}

void ironVibeRemoveFavoriteExerciseEverywhere(String rawName) {
  final n = normalizeExerciseName(rawName);
  if (n.isEmpty) return;
  ironVibeAthleteFavoriteExercises.removeWhere(
    (e) => normalizeExerciseName(e) == n,
  );
  for (final client in clients) {
    client.favoriteExercises.removeWhere((e) => normalizeExerciseName(e) == n);
  }
}

void ironVibeRenameFavoriteExercise(String oldName, String newName) {
  final o = normalizeExerciseName(oldName);
  final n = normalizeExerciseName(newName);
  if (o.isEmpty || n.isEmpty || o == n) return;

  void renameIn(List<String> list) {
    final idx = list.indexWhere((e) => normalizeExerciseName(e) == o);
    if (idx < 0) return;
    list[idx] = n;
    final deduped = _dedupeNormalizedExerciseBank(list);
    list
      ..clear()
      ..addAll(deduped);
  }

  renameIn(ironVibeAthleteFavoriteExercises);
  for (final client in clients) {
    renameIn(client.favoriteExercises);
  }
}

List<ExerciseLog> ironVibeExerciseLogsFromFavoriteNames(List<String> names) {
  return names
      .map(normalizeExerciseName)
      .where((name) => name.isNotEmpty)
      .map((name) => ExerciseLog(name, [SetLog('', '', '0')]))
      .toList();
}

List<ExerciseLog> ironVibeLastExerciseLogsForNames(
  List<String> names, {
  String? clientName,
}) {
  return names
      .map(normalizeExerciseName)
      .where((name) => name.isNotEmpty)
      .map((name) => ironVibeLastExerciseLogFor(name, clientName: clientName))
      .toList();
}

Widget _favoriteExercisesSelectCell({
  required IronVibePalette pal,
  required bool selected,
  required ValueChanged<bool?> onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(4, 4, 6, 4),
    child: Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 28,
        height: 28,
        child: Checkbox(
          value: selected,
          onChanged: onChanged,
          activeColor: pal.textPrimary,
          checkColor: pal.card,
          side: BorderSide(color: pal.borderDefault, width: 1.2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
      ),
    ),
  );
}

Widget _favoriteExercisesTable({
  required IronVibePalette pal,
  required AppLocalizations l,
  required List<String> names,
  required Set<String> selectedKeys,
  String? clientName,
  required Future<void> Function(String exerciseName) onToggleFavorite,
  required ValueChanged<String> onToggleSelection,
  required VoidCallback onMuscleGroupChanged,
}) {
  const edge = 0.5;
  const inner = 0.5;
  final outer = pal.borderSubtle;
  final grid = pal.borderSubtle;

  final header = TableRow(
    decoration: BoxDecoration(
      color: pal.field,
      border: Border(bottom: BorderSide(color: outer, width: edge)),
    ),
    children: [
      _personalProgressHeaderCell('', pal, align: TextAlign.right),
      _personalProgressHeaderCell(l.exerciseHeader, pal, align: TextAlign.left),
      _personalProgressHeaderCell('', pal, align: TextAlign.right),
    ],
  );

  final body = <TableRow>[
    header,
    for (var i = 0; i < names.length; i++)
      TableRow(
        decoration: BoxDecoration(
          color: i.isOdd
              ? (pal.brightness == Brightness.dark
                  ? pal.card.withValues(alpha: 0.55)
                  : pal.card.withValues(alpha: 0.65))
              : null,
        ),
        children: [
          _personalProgressRankCell(
            pal: pal,
            l: l,
            number: i + 1,
            isFavorite: true,
            onToggleFavorite: () => onToggleFavorite(names[i]),
          ),
          _personalProgressNameWithGroupCell(
            names[i],
            pal,
            onGroupChanged: onMuscleGroupChanged,
          ),
          _favoriteExercisesSelectCell(
            pal: pal,
            selected: selectedKeys.contains(normalizeExerciseName(names[i])),
            onChanged: (_) => onToggleSelection(names[i]),
          ),
        ],
      ),
  ];

  return ClipRRect(
    borderRadius: BorderRadius.circular(kIronVibeRadiusCard),
    child: Table(
    border: TableBorder(
      top: BorderSide(color: outer, width: edge),
      bottom: BorderSide(color: outer, width: edge),
      left: BorderSide(color: outer, width: edge),
      right: BorderSide(color: outer, width: edge),
      horizontalInside: BorderSide(color: grid, width: inner),
      verticalInside: BorderSide(color: grid, width: inner),
    ),
    columnWidths: const <int, TableColumnWidth>{
      0: IntrinsicColumnWidth(),
      1: FlexColumnWidth(2.85),
      2: FlexColumnWidth(0.42),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: body,
  ),
  );
}

class FavoriteExercisesScreen extends StatefulWidget {
  final String? clientName;

  const FavoriteExercisesScreen({super.key, this.clientName});

  @override
  State<FavoriteExercisesScreen> createState() => _FavoriteExercisesScreenState();
}

class _FavoriteExercisesScreenState extends State<FavoriteExercisesScreen> {
  final Set<String> _selectedKeys = {};

  List<String> get _names =>
      ironVibeFavoriteExerciseNames(clientName: widget.clientName);

  List<String> _selectedNamesInListOrder() {
    return _names
        .where((name) => _selectedKeys.contains(normalizeExerciseName(name)))
        .toList();
  }

  Future<void> _toggleFavorite(String exerciseName) async {
    final key = normalizeExerciseName(exerciseName);
    await ironVibeToggleFavoriteExercise(
      exerciseName,
      clientName: widget.clientName,
    );
    if (!mounted) return;
    setState(() {
      _selectedKeys.remove(key);
    });
  }

  void _toggleSelection(String exerciseName) {
    final key = normalizeExerciseName(exerciseName);
    setState(() {
      if (_selectedKeys.contains(key)) {
        _selectedKeys.remove(key);
      } else {
        _selectedKeys.add(key);
      }
    });
  }

  Future<void> _buildWorkout() async {
    final selected = _selectedNamesInListOrder();
    if (selected.isEmpty) return;

    final clientName = widget.clientName?.trim();
    if (clientName != null && clientName.isNotEmpty) {
      final session = ironVibeNewTrainerSession(
        dateTime: DateTime.now(),
        clientName: clientName,
        exercises: ironVibeExerciseLogsFromFavoriteNames(selected),
      );
      trainerSchedule.add(session);
      ironVibeMarkTrainerSessionLiveCurrent(session);
      await DataService.saveData();
      if (!mounted) return;
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

    if (!mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutSessionScreen(
          initialExercises: ironVibeLastExerciseLogsForNames(selected),
          previousSetsAsHints: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final names = _names;
    final hasSelection = _selectedKeys.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ironVibeTopBarMaterial(
              context,
              leading: _ironVibeHeaderIconButton(
                context,
                icon: Icons.arrow_back,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: Text(
                ironVibeSentenceCase(l.favoriteExercises),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            if (hasSelection)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: SteelButton(
                  text: l.buildWorkoutFromFavorites,
                  icon: Icons.playlist_add_check_rounded,
                  onPressed: _buildWorkout,
                  width: double.infinity,
                  isBig: true,
                ),
              ),
            Expanded(
              child: names.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          l.favoriteExercisesEmpty,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: pal.textMuted, fontSize: 14),
                        ),
                      ),
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        final w = constraints.maxWidth;
                        return Scrollbar(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            child: SizedBox(
                              width: w,
                              child: _favoriteExercisesTable(
                                pal: pal,
                                l: l,
                                names: names,
                                selectedKeys: _selectedKeys,
                                clientName: widget.clientName,
                                onToggleFavorite: _toggleFavorite,
                                onToggleSelection: _toggleSelection,
                                onMuscleGroupChanged: () {
                                  if (mounted) setState(() {});
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
