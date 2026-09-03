part of 'package:fitness_app/main.dart';

class _PersonalProgressAgg {
  bool sawOnlyCardioLogs = true;
  bool hasWeightedBest = false;
  double bestEpley = -1;
  double bestW = 0;
  int bestR = 0;
  int maxBodyReps = 0;
  double maxSessionTon = 0;
}

class PersonalProgressRow {
  final String name;
  final bool treatAsCardio;
  final bool hasWeightedBestSet;
  final double bestWeight;
  final int bestReps;
  final int maxBodyReps;
  final double maxSessionTon;
  /// Оценка 1ПМ по лучшему сету (только при отягощении).
  final double? oneRmFromBestSetKg;

  const PersonalProgressRow({
    required this.name,
    required this.treatAsCardio,
    required this.hasWeightedBestSet,
    required this.bestWeight,
    required this.bestReps,
    required this.maxBodyReps,
    required this.maxSessionTon,
    required this.oneRmFromBestSetKg,
  });
}

double _ironVibeStrengthTonForExercise(ExerciseLog ex) {
  if (ex.isCardio) return 0;
  var t = 0.0;
  for (final s in ex.sets) {
    if (s.isCardio) continue;
    final v = ironVibeVolumeKgFromFields(s.weight, s.reps);
    if (v != null) t += v;
  }
  return t;
}

bool _ironVibeExerciseIsCardio(ExerciseLog ex) {
  return ex.isCardio || (ex.sets.isNotEmpty && ex.sets.first.isCardio);
}

void _ironVibePersonalProgressUpdateBest(Map<String, _PersonalProgressAgg> map, ExerciseLog ex) {
  final key = normalizeExerciseName(ex.name);
  if (key.isEmpty) return;
  final agg = map.putIfAbsent(key, () => _PersonalProgressAgg());
  if (ex.isCardio) return;

  agg.sawOnlyCardioLogs = false;
  for (final s in ex.sets) {
    if (s.isCardio) continue;
    final w = ironVibeParseQuantity(s.weight) ?? 0;
    final r = ironVibeParseQuantity(s.reps) ?? 0;
    if (w > 0 && r >= 1) {
      final epley = ironVibeEpleyOneRmKg(w, r);
      if (epley != null &&
          (!agg.hasWeightedBest ||
              epley > agg.bestEpley ||
              (epley == agg.bestEpley &&
                  (w > agg.bestW || (w == agg.bestW && r > agg.bestR))))) {
        agg.hasWeightedBest = true;
        agg.bestEpley = epley;
        agg.bestW = w;
        agg.bestR = r.round();
      }
    } else if (w <= 0 && r >= 1) {
      final ri = r.round();
      if (ri > agg.maxBodyReps) agg.maxBodyReps = ri;
    }
  }
}

List<PersonalProgressRow> ironVibePersonalProgressRows({String? clientName}) {
  final map = <String, _PersonalProgressAgg>{};

  void processSession(List<ExerciseLog> exercises) {
    final sessionTons = <String, double>{};
    for (final ex in exercises) {
      if (_ironVibeExerciseIsCardio(ex)) continue;
      final key = normalizeExerciseName(ex.name);
      if (key.isEmpty) continue;
      sessionTons[key] = (sessionTons[key] ?? 0) + _ironVibeStrengthTonForExercise(ex);
      _ironVibePersonalProgressUpdateBest(map, ex);
    }
    for (final e in sessionTons.entries) {
      final agg = map.putIfAbsent(e.key, () => _PersonalProgressAgg());
      if (e.value > agg.maxSessionTon) agg.maxSessionTon = e.value;
    }
  }

  if (clientName == null) {
    for (final w in workoutHistory) {
      processSession(w.exercises);
    }
  } else {
    for (final s in trainerSchedule.where(
      (x) => ironVibeSessionBelongsToClient(x, clientName: clientName),
    )) {
      if (!ironVibeTrainerSessionCountsAsWork(s)) continue;
      processSession(s.exercises);
    }
  }

  return map.entries
      .map((e) {
        final a = e.value;
        final treatAsCardio =
            a.sawOnlyCardioLogs && !a.hasWeightedBest && a.maxBodyReps == 0;
        return PersonalProgressRow(
          name: e.key,
          treatAsCardio: treatAsCardio,
          hasWeightedBestSet: a.hasWeightedBest,
          bestWeight: a.bestW,
          bestReps: a.bestR,
          maxBodyReps: a.maxBodyReps,
          maxSessionTon: a.maxSessionTon,
          oneRmFromBestSetKg:
              a.hasWeightedBest ? ironVibeEpleyOneRmKg(a.bestW, a.bestR.toDouble()) : null,
        );
      })
      .where((row) => !row.treatAsCardio)
      .where((row) => ironVibeIsExerciseInBank(row.name))
      .toList()
    ..sort((a, b) => _ironVibePersonalProgressRowOrder(a, b, clientName: clientName));
}

int _ironVibePersonalProgressFavoriteIndex(String name, {String? clientName}) {
  final key = normalizeExerciseName(name);
  final favorites = ironVibeFavoriteExerciseNames(clientName: clientName);
  for (var i = 0; i < favorites.length; i++) {
    if (normalizeExerciseName(favorites[i]) == key) return i;
  }
  return favorites.length;
}

int _ironVibePersonalProgressRowOrder(
  PersonalProgressRow a,
  PersonalProgressRow b, {
  String? clientName,
}) {
  final aFavorite = _ironVibePersonalProgressFavoriteIndex(
    a.name,
    clientName: clientName,
  );
  final bFavorite = _ironVibePersonalProgressFavoriteIndex(
    b.name,
    clientName: clientName,
  );
  if (aFavorite != bFavorite) return aFavorite.compareTo(bFavorite);
  return a.name.compareTo(b.name);
}

String _ironVibeFmtWeightForUi(double w) {
  if (w <= 0) return '';
  if ((w - w.round()).abs() < 1e-6) return w.round().toString();
  return w.toStringAsFixed(1);
}

String _personalProgressBestSetText(PersonalProgressRow r) {
  if (r.treatAsCardio) return '—';
  if (r.hasWeightedBestSet) {
    return '${_ironVibeFmtWeightForUi(r.bestWeight)}×${r.bestReps}';
  }
  if (r.maxBodyReps > 0) return '×${r.maxBodyReps}';
  return '—';
}

String _personalProgressMaxVolumeText(PersonalProgressRow r) {
  if (r.treatAsCardio || r.maxSessionTon <= 0) return '—';
  return ironVibeFormatKgTon(r.maxSessionTon);
}

String _personalProgressOneRmText(PersonalProgressRow r) {
  final v = r.oneRmFromBestSetKg;
  if (r.treatAsCardio || v == null) return '—';
  return _ironVibeFmtWeightForUi(v);
}

Widget _personalProgressNameWithGroupCell(
  String name,
  IronVibePalette pal, {
  required VoidCallback onGroupChanged,
  VoidCallback? onRemove,
}) {
  final nameText = Text(
    name,
    textAlign: TextAlign.left,
    softWrap: true,
    style: TextStyle(
      color: pal.textPrimary,
      fontSize: 11.5,
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.08,
    ),
    maxLines: 4,
    overflow: TextOverflow.ellipsis,
  );
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 7, 4, 7),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (onRemove == null)
          nameText
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: nameText),
              GestureDetector(
                onTap: onRemove,
                behavior: HitTestBehavior.opaque,
                child: const Padding(
                  padding: EdgeInsets.only(left: 4, top: 1, bottom: 2),
                  child: Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ironVibeMuscleGroupChip(
          exerciseName: name,
          onChanged: onGroupChanged,
        ),
      ],
    ),
  );
}

Widget _personalProgressHeaderCell(String text, IronVibePalette pal, {required TextAlign align}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      alignment: align == TextAlign.right
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        text,
        textAlign: align,
        maxLines: 1,
        softWrap: false,
        style: TextStyle(
          color: pal.textSecondary,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.12,
          height: 1.1,
        ),
      ),
    ),
  );
}

Widget _personalProgressDataCell(
  String text,
  IronVibePalette pal, {
  required TextAlign align,
  required bool nameColumn,
}) {
  if (nameColumn) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 9),
      child: Text(
        text,
        textAlign: align,
        softWrap: true,
        style: TextStyle(
          color: pal.textPrimary,
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0.08,
        ),
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      alignment: align == TextAlign.right
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        text,
        textAlign: align,
        maxLines: 1,
        softWrap: false,
        style: TextStyle(
          color: pal.textSecondary,
          fontSize: 10.5,
          fontWeight: FontWeight.w500,
          height: 1.1,
        ),
      ),
    ),
  );
}

Widget _personalProgressRankCell({
  required IronVibePalette pal,
  required AppLocalizations l,
  required int number,
  required bool isFavorite,
  required VoidCallback onToggleFavorite,
}) {
  const gold = kIronVibeAccent;
  return Padding(
    padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onToggleFavorite,
          behavior: HitTestBehavior.opaque,
          child: Icon(
            isFavorite ? Icons.star : Icons.star_border,
            size: 15,
            color: gold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          l.exerciseNumberLabel(number),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: pal.textMuted,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            height: 1.05,
          ),
        ),
      ],
    ),
  );
}

Widget _personalProgressTable({
  required IronVibePalette pal,
  required AppLocalizations l,
  required List<PersonalProgressRow> filtered,
  String? clientName,
  required Future<void> Function(String exerciseName) onToggleFavorite,
  required Future<void> Function(String exerciseName) onRemove,
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
      _personalProgressHeaderCell(l.personalProgressBestSet, pal, align: TextAlign.right),
      _personalProgressHeaderCell(l.oneRm, pal, align: TextAlign.right),
      _personalProgressHeaderCell(l.personalProgressMaxVolume, pal, align: TextAlign.right),
    ],
  );

  final body = <TableRow>[
    header,
    for (var i = 0; i < filtered.length; i++)
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
            isFavorite: ironVibeIsFavoriteExercise(
              filtered[i].name,
              clientName: clientName,
            ),
            onToggleFavorite: () => onToggleFavorite(filtered[i].name),
          ),
          _personalProgressNameWithGroupCell(
            filtered[i].name,
            pal,
            onGroupChanged: onMuscleGroupChanged,
            onRemove: () => onRemove(filtered[i].name),
          ),
          _personalProgressDataCell(
            _personalProgressBestSetText(filtered[i]),
            pal,
            align: TextAlign.right,
            nameColumn: false,
          ),
          _personalProgressDataCell(
            _personalProgressOneRmText(filtered[i]),
            pal,
            align: TextAlign.right,
            nameColumn: false,
          ),
          _personalProgressDataCell(
            _personalProgressMaxVolumeText(filtered[i]),
            pal,
            align: TextAlign.right,
            nameColumn: false,
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
      1: FlexColumnWidth(2.5),
      2: FlexColumnWidth(1.2),
      3: FlexColumnWidth(1.05),
      4: FlexColumnWidth(1.15),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: body,
  ),
  );
}

class PersonalProgressScreen extends StatefulWidget {
  final String? clientName;

  const PersonalProgressScreen({super.key, this.clientName});

  @override
  State<PersonalProgressScreen> createState() => _PersonalProgressScreenState();
}

class _PersonalProgressScreenState extends State<PersonalProgressScreen> {
  final TextEditingController _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _toggleFavorite(String exerciseName) async {
    await ironVibeToggleFavoriteExercise(
      exerciseName,
      clientName: widget.clientName,
    );
    if (mounted) setState(() {});
  }

  Future<void> _removeFromProgress(String exerciseName) async {
    final removed = await showRemoveExerciseFromBankDialog(
      context,
      exerciseName,
    );
    if (removed && mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final rows = ironVibePersonalProgressRows(clientName: widget.clientName);
    final q = _search.text.trim().toLowerCase();
    final filtered =
        q.isEmpty ? rows : rows.where((r) => r.name.toLowerCase().contains(q)).toList();

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
                ironVibeSentenceCase(l.personalProgress),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _search,
                onChanged: (_) => setState(() {}),
                style: TextStyle(color: pal.textPrimary, fontSize: 14),
                decoration: InputDecoration(
                  hintText: l.personalProgressSearchHint,
                  hintStyle: TextStyle(color: pal.textHint),
                  filled: true,
                  fillColor: pal.inputFill,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: pal.borderSubtle, width: 0.5),
                    borderRadius: BorderRadius.circular(kIronVibeRadiusField),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kIronVibeAccent, width: 1.6),
                    borderRadius: BorderRadius.all(Radius.circular(kIronVibeRadiusField)),
                  ),
                  prefixIcon: Icon(Icons.search, color: pal.textMuted, size: 22),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          rows.isEmpty ? l.personalProgressEmpty : l.noEntries,
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
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
                            child: SizedBox(
                              width: w,
                              child: _personalProgressTable(
                                pal: pal,
                                l: l,
                                filtered: filtered,
                                clientName: widget.clientName,
                                onToggleFavorite: _toggleFavorite,
                                onRemove: _removeFromProgress,
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
