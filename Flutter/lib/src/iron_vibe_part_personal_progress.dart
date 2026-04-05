part of 'package:fitness_app/main.dart';

class _PersonalProgressAgg {
  bool sawOnlyCardioLogs = true;
  bool hasWeightedBest = false;
  double bestVol = -1;
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
    final w = double.tryParse(s.weight.replaceAll(',', '.')) ?? 0;
    final r = int.tryParse(s.reps) ?? 0;
    if (w > 0 && r > 0) t += w * r;
  }
  return t;
}

void _ironVibePersonalProgressUpdateBest(Map<String, _PersonalProgressAgg> map, ExerciseLog ex) {
  final key = normalizeExerciseName(ex.name);
  if (key.isEmpty) return;
  final agg = map.putIfAbsent(key, () => _PersonalProgressAgg());
  if (ex.isCardio) return;

  agg.sawOnlyCardioLogs = false;
  for (final s in ex.sets) {
    if (s.isCardio) continue;
    final w = double.tryParse(s.weight.replaceAll(',', '.')) ?? 0;
    final r = int.tryParse(s.reps) ?? 0;
    if (w > 0 && r > 0) {
      final vol = w * r;
      if (!agg.hasWeightedBest ||
          vol > agg.bestVol ||
          (vol == agg.bestVol && (w > agg.bestW || (w == agg.bestW && r > agg.bestR)))) {
        agg.hasWeightedBest = true;
        agg.bestVol = vol;
        agg.bestW = w;
        agg.bestR = r;
      }
    } else if (w <= 0 && r > 0) {
      if (r > agg.maxBodyReps) agg.maxBodyReps = r;
    }
  }
}

List<PersonalProgressRow> ironVibePersonalProgressRows({String? clientName}) {
  final map = <String, _PersonalProgressAgg>{};

  void processSession(List<ExerciseLog> exercises) {
    final sessionTons = <String, double>{};
    for (final ex in exercises) {
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
    for (final s in trainerSchedule.where((x) => x.clientName == clientName)) {
      processSession(s.exercises);
    }
  }

  return map.entries.map((e) {
    final a = e.value;
    final treatAsCardio = a.sawOnlyCardioLogs && !a.hasWeightedBest && a.maxBodyReps == 0;
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
  }).toList()
    ..sort((a, b) => a.name.compareTo(b.name));
}

String _ironVibeFmtWeightForUi(double w) {
  if (w <= 0) return '';
  if ((w - w.round()).abs() < 1e-6) return w.round().toString();
  return w.toStringAsFixed(1);
}

String _personalProgressBestSetText(PersonalProgressRow r) {
  if (r.treatAsCardio) return '—';
  if (r.hasWeightedBestSet) {
    return '${_ironVibeFmtWeightForUi(r.bestWeight)} × ${r.bestReps}';
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
  return '≈ ${v.toStringAsFixed(1)}';
}

Widget _personalProgressHeaderCell(String text, IronVibePalette pal, {required TextAlign align}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
    child: Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: pal.textSecondary,
        fontSize: 9.5,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.35,
        height: 1.15,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget _personalProgressDataCell(
  String text,
  IronVibePalette pal, {
  required TextAlign align,
  required bool nameColumn,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
    child: Text(
      text,
      textAlign: align,
      softWrap: true,
      style: TextStyle(
        color: nameColumn ? pal.textPrimary : pal.textSecondary,
        fontSize: nameColumn ? 12 : 10.5,
        fontWeight: nameColumn ? FontWeight.w600 : FontWeight.w500,
        height: 1.2,
        letterSpacing: nameColumn ? 0.12 : 0,
      ),
      maxLines: nameColumn ? 4 : 2,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget _personalProgressTable({
  required IronVibePalette pal,
  required AppLocalizations l,
  required List<PersonalProgressRow> filtered,
}) {
  const edge = 1.0;
  const inner = 0.5;
  final outer = pal.borderDefault;
  final grid = pal.borderSubtle;

  final header = TableRow(
    decoration: BoxDecoration(
      color: pal.field,
      border: Border(bottom: BorderSide(color: outer, width: edge)),
    ),
    children: [
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
          _personalProgressDataCell(
            filtered[i].name,
            pal,
            align: TextAlign.left,
            nameColumn: true,
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

  return Table(
    border: TableBorder(
      top: BorderSide(color: outer, width: edge),
      bottom: BorderSide(color: outer, width: edge),
      left: BorderSide(color: outer, width: edge),
      right: BorderSide(color: outer, width: edge),
      horizontalInside: BorderSide(color: grid, width: inner),
      verticalInside: BorderSide(color: grid, width: inner),
    ),
    columnWidths: const <int, TableColumnWidth>{
      0: FlexColumnWidth(2.55),
      1: FlexColumnWidth(1.0),
      2: FlexColumnWidth(0.92),
      3: FlexColumnWidth(1.0),
    },
    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    children: body,
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
                l.personalProgress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.05,
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
                    borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
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
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                            child: SizedBox(
                              width: w,
                              child: _personalProgressTable(
                                pal: pal,
                                l: l,
                                filtered: filtered,
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
