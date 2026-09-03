part of 'package:fitness_app/main.dart';

/// One row per calendar day.
/// [maxWeight] = highest weight in a single set that day.
/// [reps] = highest rep count in a single set that day (independent of max weight set).
/// [volumeKg] = sum of weight × reps for sets where both fields are valid.
/// [clientName] null = my workouts; non-null = trainer view for that client only.
List<({DateTime date, double maxWeight, int reps, double volumeKg})>
_getProgressDataForExercise(String exerciseName, {String? clientName}) {
  final name = normalizeExerciseName(exerciseName);
  if (name.isEmpty) return [];
  final Map<DateTime, List<({double w, int r})>> byDate = {};

  void addSetsForDay(DateTime d, Iterable<SetLog> sets) {
    final key = DateTime(d.year, d.month, d.day);
    for (final s in sets) {
      if (s.isCardio) continue;
      final weight = ironVibeParseQuantity(s.weight) ?? 0;
      final repsRaw = ironVibeParseQuantity(s.reps) ?? 0;
      if (weight <= 0 && repsRaw < 1) continue;
      final reps = repsRaw < 1 ? 0 : repsRaw.round();
      byDate.putIfAbsent(key, () => []).add((w: weight, r: reps));
    }
  }

  if (clientName == null) {
    for (final w in workoutHistory) {
      final d = DateTime(w.date.year, w.date.month, w.date.day);
      for (final ex in w.exercises) {
        if (normalizeExerciseName(ex.name) != name || ex.isCardio) continue;
        addSetsForDay(d, ex.sets);
      }
    }
  } else {
    final sessions = trainerSchedule.where(
      (s) =>
          ironVibeSessionBelongsToClient(s, clientName: clientName) &&
          ironVibeTrainerSessionCountsAsWork(s),
    );
    for (final session in sessions) {
      final d = DateTime(
        session.dateTime.year,
        session.dateTime.month,
        session.dateTime.day,
      );
      for (final ex in session.exercises) {
        if (normalizeExerciseName(ex.name) != name || ex.isCardio) continue;
        addSetsForDay(d, ex.sets);
      }
    }
  }

  final out =
      <({DateTime date, double maxWeight, int reps, double volumeKg})>[];
  for (final e in byDate.entries) {
    final sets = e.value;
    if (sets.isEmpty) continue;
    var maxW = 0.0;
    var repBest = 0;
    var dayVolume = 0.0;
    for (final t in sets) {
      if (t.w > maxW) maxW = t.w;
      if (t.r > repBest) repBest = t.r;
      final v = (t.w > 0 && t.r > 0) ? (t.w * t.r) : 0.0;
      dayVolume += v;
    }

    out.add((date: e.key, maxWeight: maxW, reps: repBest, volumeKg: dayVolume));
  }
  out.sort((a, b) => a.date.compareTo(b.date));
  return out;
}

enum _ProgressFilter { month, year, all }

class _ProgressBottomSheet extends StatefulWidget {
  final String exerciseName;
  final double height;
  final String? clientName;

  const _ProgressBottomSheet({
    required this.exerciseName,
    required this.height,
    this.clientName,
  });

  @override
  State<_ProgressBottomSheet> createState() => _ProgressBottomSheetState();
}

class _ProgressBottomSheetState extends State<_ProgressBottomSheet> {
  _ProgressFilter _filter = _ProgressFilter.all;

  List<({DateTime date, double maxWeight, int reps, double volumeKg})>
  get _allData => _getProgressDataForExercise(
    widget.exerciseName,
    clientName: widget.clientName,
  );

  List<({DateTime date, double maxWeight, int reps, double volumeKg})>
  get _filteredData {
    final data = _allData;
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month, 1);
    final monthEndExclusive = DateTime(now.year, now.month + 1, 1);
    final yearStart = DateTime(now.year, 1, 1);
    final yearEndExclusive = DateTime(now.year + 1, 1, 1);
    switch (_filter) {
      case _ProgressFilter.month:
        return data
            .where(
              (e) =>
                  !e.date.isBefore(monthStart) &&
                  e.date.isBefore(monthEndExclusive),
            )
            .toList();
      case _ProgressFilter.year:
        return data
            .where(
              (e) =>
                  !e.date.isBefore(yearStart) &&
                  e.date.isBefore(yearEndExclusive),
            )
            .toList();
      case _ProgressFilter.all:
        return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _filteredData;
    final locale = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    return Container(
      height: widget.height,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.exerciseName,
            style: TextStyle(
              color: pal.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _FilterChip(
                label: locale.filterMonth,
                selected: _filter == _ProgressFilter.month,
                onTap: () => setState(() => _filter = _ProgressFilter.month),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: locale.filterYear,
                selected: _filter == _ProgressFilter.year,
                onTap: () => setState(() => _filter = _ProgressFilter.year),
              ),
              const SizedBox(width: 8),
              _FilterChip(
                label: locale.filterAllTime,
                selected: _filter == _ProgressFilter.all,
                onTap: () => setState(() => _filter = _ProgressFilter.all),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: data.isEmpty
                ? Center(
                    child: Text(
                      locale.noEntries,
                      style: TextStyle(color: pal.textMuted, fontSize: 14),
                    ),
                  )
                : _ProgressChart(data: data, locale: locale),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: selected ? pal.chipSelected : Colors.transparent,
            border: Border.all(
              color: selected ? kIronVibeAccent.withValues(alpha: 0.75) : pal.borderSubtle,
              width: selected ? 1.1 : 0.5,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? pal.textPrimary : pal.textSecondary,
              fontSize: 13,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

const double _kProgressChartLeftAxisReserve = 44;
const double _kProgressChartRightAxisReserve = 38;

/// Интервал подписей по оси X (время / дни от первой точки).
double _progressChartBottomXInterval(double maxX) {
  if (maxX <= 1) return 1;
  if (maxX <= 14) return 2;
  if (maxX <= 45) return 7;
  if (maxX <= 120) return 14;
  return 30;
}

class _ProgressChart extends StatelessWidget {
  final List<({DateTime date, double maxWeight, int reps, double volumeKg})>
  data;
  final AppLocalizations locale;

  const _ProgressChart({required this.data, required this.locale});

  static DateTime _dayOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  static const double _eps = 0.02;

  static String _formatWeightTick(double w) {
    if (w <= _eps) return '0';
    if ((w - w.round()).abs() < 0.06) return w.round().toString();
    return w.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox.shrink();
    final pal = IronVibePalette.of(context);
    final maxW = data
        .map((e) => e.maxWeight)
        .fold<double>(0, (double a, double b) => a > b ? a : b);
    final maxR = data.map((e) => e.reps).fold<int>(0, (a, b) => a > b ? a : b);
    final maxV = data
        .map((e) => e.volumeKg)
        .fold<double>(0, (double a, double b) => a > b ? a : b);

    /// Две независимые серии: одна ось X (время), Y нормализован; слева подписи — вес, справа — повторы.
    const norm = 100.0;
    final denomW = maxW > _eps ? maxW : 1.0;
    final denomR = maxR > 0 ? maxR.toDouble() : 1.0;
    final denomV = maxV > _eps ? maxV : 1.0;

    final baseDay = _dayOnly(data.first.date);
    double xForIndex(int i) {
      final d = _dayOnly(data[i].date);
      return d.difference(baseDay).inDays.toDouble();
    }

    int nearestIndexForX(double x) {
      var bestI = 0;
      var bestDx = double.infinity;
      for (var i = 0; i < data.length; i++) {
        final dx = (xForIndex(i) - x).abs();
        if (dx < bestDx) {
          bestDx = dx;
          bestI = i;
        }
      }
      return bestI;
    }

    final lastX = xForIndex(data.length - 1);
    final maxX = lastX <= 0 ? 1.0 : lastX;

    final weightSpots = List<FlSpot>.generate(
      data.length,
      (i) => FlSpot(xForIndex(i), (data[i].maxWeight / denomW) * norm),
    );
    final repsSpots = List<FlSpot>.generate(
      data.length,
      (i) => FlSpot(xForIndex(i), (data[i].reps / denomR) * norm),
    );
    final volumeSpots = List<FlSpot>.generate(
      data.length,
      (i) => FlSpot(xForIndex(i), (data[i].volumeKg / denomV) * norm),
    );

    final dateFormat = DateFormat.yMMMMd(locale.localeName);

    List<LineTooltipItem?> tooltipFor(List<LineBarSpot> touchedSpots) {
      if (touchedSpots.isEmpty) return [];
      final xi = nearestIndexForX(touchedSpots.first.x);
      final pt = data[xi];
      final wStr = _formatWeightTick(pt.maxWeight);
      final base = TextStyle(color: pal.textPrimary, fontSize: 12);
      final emphasisW = base.copyWith(
        color: kProgressChartWeightColor,
        fontWeight: FontWeight.w800,
      );
      final emphasisR = base.copyWith(
        color: kProgressChartRepsColor,
        fontWeight: FontWeight.w800,
      );
      final emphasisV = base.copyWith(
        color: kProgressChartVolumeColor,
        fontWeight: FontWeight.w800,
      );
      final item = LineTooltipItem(
        '',
        base,
        children: [
          TextSpan(text: '${dateFormat.format(pt.date)}\n', style: base),
          TextSpan(text: wStr, style: emphasisW),
          TextSpan(text: '  ·  ', style: base),
          TextSpan(text: '${pt.reps}', style: emphasisR),
          TextSpan(text: ' ${locale.reps}', style: base),
          TextSpan(text: '\n', style: base),
          TextSpan(text: locale.totalVolume, style: base),
          TextSpan(text: ': ', style: base),
          TextSpan(text: ironVibeFormatKgTon(pt.volumeKg), style: emphasisV),
          TextSpan(text: ' ${locale.kg}', style: base),
        ],
      );
      return List<LineTooltipItem?>.generate(
        touchedSpots.length,
        (i) => i == 0 ? item : null,
      );
    }

    final grid = FlGridData(
      show: true,
      drawVerticalLine: true,
      drawHorizontalLine: true,
      getDrawingHorizontalLine: (value) =>
          FlLine(color: pal.borderSubtle, strokeWidth: 0.5),
      getDrawingVerticalLine: (value) =>
          FlLine(color: pal.borderSubtle, strokeWidth: 0.5),
    );

    final hiddenTop = const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    );

    final touch = LineTouchData(
      touchSpotThreshold: 28,
      touchTooltipData: LineTouchTooltipData(
        maxContentWidth: 300,
        fitInsideHorizontally: true,
        fitInsideVertically: true,
        getTooltipItems: tooltipFor,
      ),
    );

    LineChartBarData weightBar(Color c, double r) => LineChartBarData(
      spots: weightSpots,
      isCurved: false,
      color: c,
      barWidth: 2.5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, xPercentage, bar, index) => FlDotCirclePainter(
          radius: r,
          color: c,
          strokeWidth: 1,
          strokeColor: pal.borderDefault,
        ),
      ),
      belowBarData: BarAreaData(show: false),
    );

    LineChartBarData repsBar(Color c, double r) => LineChartBarData(
      spots: repsSpots,
      isCurved: false,
      color: c,
      barWidth: 2.5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, xPercentage, bar, index) => FlDotCirclePainter(
          radius: r,
          color: c,
          strokeWidth: 1.25,
          strokeColor: pal.borderDefault,
        ),
      ),
      belowBarData: BarAreaData(show: false),
    );

    LineChartBarData volumeBar(Color c, double r) => LineChartBarData(
      spots: volumeSpots,
      isCurved: false,
      color: c,
      barWidth: 2.25,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, xPercentage, bar, index) => FlDotCirclePainter(
          radius: r,
          color: c,
          strokeWidth: 1,
          strokeColor: pal.borderDefault,
        ),
      ),
      belowBarData: BarAreaData(show: false),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: maxX,
              minY: 0,
              maxY: norm,
              gridData: grid,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  axisNameWidget: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      locale.weightHeader,
                      locale: Localizations.localeOf(context),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kProgressChartWeightColor,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: maxW > _eps,
                    reservedSize: maxW > _eps
                        ? _kProgressChartLeftAxisReserve
                        : 8,
                    interval: 25,
                    getTitlesWidget: (value, meta) {
                      final w = (value / norm) * denomW;
                      return Text(
                        _formatWeightTick(w),
                        style: TextStyle(
                          color: pal.textSecondary,
                          fontSize: 10,
                        ),
                      );
                    },
                  ),
                ),
                rightTitles: AxisTitles(
                  axisNameWidget: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      locale.repsHeader,
                      locale: Localizations.localeOf(context),
                      style: TextStyle(
                        color: kProgressChartRepsColor.withValues(alpha: 0.95),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                  axisNameSize: 22,
                  sideTitles: SideTitles(
                    showTitles: maxR > 0,
                    reservedSize: maxR > 0
                        ? _kProgressChartRightAxisReserve
                        : 8,
                    interval: 25,
                    getTitlesWidget: (value, meta) {
                      final r = (value / norm) * denomR;
                      return Text(
                        '${r.round()}',
                        style: TextStyle(
                          color: kProgressChartRepsColor.withValues(
                            alpha: 0.92,
                          ),
                          fontSize: 10,
                        ),
                      );
                    },
                  ),
                ),
                topTitles: hiddenTop,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: _progressChartBottomXInterval(maxX),
                    getTitlesWidget: (value, meta) {
                      final x = value;
                      int? bestI;
                      var bestDx = double.infinity;
                      for (var i = 0; i < data.length; i++) {
                        final dx = (xForIndex(i) - x).abs();
                        if (dx < bestDx) {
                          bestDx = dx;
                          bestI = i;
                        }
                      }
                      if (bestI == null || bestDx > 0.55) {
                        return const SizedBox.shrink();
                      }
                      final d = data[bestI].date;
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '${d.day}.${d.month}',
                          style: TextStyle(color: pal.textMuted, fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                weightBar(kProgressChartWeightColor, 5),
                repsBar(kProgressChartRepsColor, 4),
                volumeBar(kProgressChartVolumeColor, 3.6),
              ],
              lineTouchData: touch,
            ),
            duration: const Duration(milliseconds: 200),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          runSpacing: 6,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: kProgressChartWeightColor,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: pal.chartLegendBorder),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              locale.progressChartWeightLegend,
              locale: Localizations.localeOf(context),
              style: TextStyle(
                color: pal.textSecondary,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.12,
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: kProgressChartRepsColor,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: pal.chartLegendBorder),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              locale.repsHeader,
              locale: Localizations.localeOf(context),
              style: TextStyle(
                color: pal.textSecondary,
                fontSize: 11,
                letterSpacing: 0.2,
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: kProgressChartVolumeColor,
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: pal.chartLegendBorder),
              ),
            ),
            Text(
              locale.progressChartVolumeLegend,
              locale: Localizations.localeOf(context),
              style: TextStyle(
                color: pal.textSecondary,
                fontSize: 11,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
