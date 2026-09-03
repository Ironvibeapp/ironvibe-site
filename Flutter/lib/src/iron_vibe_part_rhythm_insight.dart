part of 'package:fitness_app/main.dart';

void ironVibeOpenRhythmInsight(BuildContext context, {String? clientName}) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => RhythmInsightScreen(clientName: clientName),
    ),
  );
}

class IronVibeRhythmCard extends StatelessWidget {
  final IronVibeRhythmSnapshot snapshot;
  final VoidCallback? onTap;
  final double height;

  const IronVibeRhythmCard({
    super.key,
    required this.snapshot,
    this.onTap,
    this.height = 128,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final locale = Localizations.localeOf(context).toString();
    final rate = NumberFormat('#0.0', locale).format(snapshot.daysPerWeek);
    final zone = ironVibeRhythmZoneColor(snapshot.daysPerWeek);
    final gauge = Container(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 8),
      decoration: ironVibeElevatedCardDecoration(pal),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 1.0, end: snapshot.daysPerWeek.clamp(1.0, 6.0)),
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeOutCubic,
          builder: (context, value, _) {
            return CustomPaint(
              painter: _IronVibeRhythmGaugePainter(
                needleAt: value,
                trackColor: pal.borderSubtle,
                tickColor: pal.textMuted,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        rate,
                        style: TextStyle(
                          color: zone,
                          fontSize: height >= 160 ? 36 : 32,
                          fontWeight: FontWeight.w800,
                          height: 1.0,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l.rhythmPerWeek,
                        style: TextStyle(
                          color: pal.textSecondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    if (onTap == null) return gauge;
    return Semantics(
      button: true,
      label: l.rhythmInsightTitle,
      child: IronVibePressScale(onPressed: onTap!, child: gauge),
    );
  }
}

class _IronVibeRhythmGaugePainter extends CustomPainter {
  final double needleAt;
  final Color trackColor;
  final Color tickColor;

  _IronVibeRhythmGaugePainter({
    required this.needleAt,
    required this.trackColor,
    required this.tickColor,
  });

  static const _start = math.pi;
  static const _sweep = math.pi;

  double _t(double v) => ((v.clamp(1.0, 6.0) - 1.0) / 5.0);

  @override
  void paint(Canvas canvas, Size size) {
    final c = Offset(size.width / 2, size.height - 10);
    final radius = math.min(size.width * 0.40, size.height * 0.68);
    final rect = Rect.fromCircle(center: c, radius: radius);

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 11
      ..strokeCap = StrokeCap.round
      ..color = trackColor;
    canvas.drawArc(rect, _start, _sweep, false, track);

    final fillSweep = _sweep * _t(needleAt);
    if (fillSweep > 0) {
      final fill = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          startAngle: _start,
          endAngle: _start + _sweep,
          colors: [
            ironVibeRhythmZoneColor(1.0),
            ironVibeRhythmZoneColor(2.0),
            ironVibeRhythmZoneColor(3.0),
            ironVibeRhythmZoneColor(4.0),
            ironVibeRhythmZoneColor(5.0),
            ironVibeRhythmZoneColor(6.0),
          ],
        ).createShader(rect);
      canvas.drawArc(rect, _start, fillSweep, false, fill);
    }

    final tickPaint = Paint()
      ..color = tickColor
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;
    for (var v = 1; v <= 6; v++) {
      final a = _start + _sweep * _t(v.toDouble());
      final dir = Offset(math.cos(a), math.sin(a));
      canvas.drawLine(
        c + dir * (radius - 16),
        c + dir * (radius + 3),
        tickPaint,
      );
    }

    final needleA = _start + _sweep * _t(needleAt);
    final dir = Offset(math.cos(needleA), math.sin(needleA));
    final needleColor = ironVibeRhythmZoneColor(needleAt);
    canvas.drawLine(
      c - dir * 8,
      c + dir * (radius - 18),
      Paint()
        ..color = needleColor
        ..strokeWidth = 2.4
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawCircle(c, 5.5, Paint()..color = needleColor);
    canvas.drawCircle(c, 2.2, Paint()..color = const Color(0xFFF4F6FA));
  }

  @override
  bool shouldRepaint(covariant _IronVibeRhythmGaugePainter old) {
    return old.needleAt != needleAt ||
        old.trackColor != trackColor ||
        old.tickColor != tickColor;
  }
}

class RhythmInsightScreen extends StatelessWidget {
  final String? clientName;

  const RhythmInsightScreen({super.key, this.clientName});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final snap = ironVibeComputeRhythmFor(clientName: clientName);
    final locale = Localizations.localeOf(context).toString();
    final rate = NumberFormat('#0.0', locale).format(snap.daysPerWeek);
    final scoped = clientName?.trim();
    final forClient = scoped != null && scoped.isNotEmpty;
    final rateLine = forClient
        ? l.rhythmInsightRateClient(scoped, rate)
        : l.rhythmInsightRateYou(rate);
    final band = ironVibeRhythmAdviceBand(snap);
    final advice = switch (band) {
      IronVibeRhythmAdviceBand.light => l.rhythmInsightAdviceLight,
      IronVibeRhythmAdviceBand.steady => l.rhythmInsightAdviceSteady,
      IronVibeRhythmAdviceBand.dense => l.rhythmInsightAdviceDense,
      IronVibeRhythmAdviceBand.veryDense => l.rhythmInsightAdviceVeryDense,
    };
    final praise = !forClient
        ? switch (band) {
            IronVibeRhythmAdviceBand.steady => l.rhythmInsightPraiseSteady,
            IronVibeRhythmAdviceBand.dense => l.rhythmInsightPraiseDense,
            IronVibeRhythmAdviceBand.veryDense =>
              l.rhythmInsightPraiseVeryDense,
            IronVibeRhythmAdviceBand.light => null,
          }
        : null;
    final showRecent = snap.recentDeload;
    final showAccumulation =
        !showRecent && snap.deloadIndicated && snap.accumulationWeeks >= 1;
    final weeks = math.max(1, snap.accumulationWeeks.round());

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
                ironVibeSentenceCase(l.rhythmInsightTitle),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 28),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        IronVibeRhythmCard(snapshot: snap, height: 160),
                        const SizedBox(height: 22),
                        Text(
                          rateLine,
                          style: TextStyle(
                            color: pal.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                          ),
                        ),
                        if (praise != null) ...[
                          const SizedBox(height: 12),
                          _RhythmInsightPraise(band: band, text: praise),
                        ],
                        const SizedBox(height: 10),
                        Text(
                          l.rhythmInsightWindow,
                          style: TextStyle(
                            color: pal.textSecondary,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          l.rhythmInsightWhatTitle,
                          style: TextStyle(
                            color: pal.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l.rhythmInsightWhatBody,
                          style: TextStyle(
                            color: pal.textSecondary,
                            fontSize: 14,
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          advice,
                          style: TextStyle(
                            color: pal.textPrimary,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        if (showRecent) ...[
                          const SizedBox(height: 14),
                          Text(
                            l.rhythmInsightRecentLighter,
                            style: TextStyle(
                              color: pal.textSecondary,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ] else if (showAccumulation) ...[
                          const SizedBox(height: 14),
                          Text(
                            l.rhythmInsightAccumulation(weeks),
                            style: TextStyle(
                              color: pal.textSecondary,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ],
                        const SizedBox(height: 22),
                        Text(
                          l.rhythmInsightDisclaimer,
                          style: TextStyle(
                            color: pal.textMuted,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ],
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

class _RhythmInsightPraise extends StatelessWidget {
  final IronVibeRhythmAdviceBand band;
  final String text;

  const _RhythmInsightPraise({required this.band, required this.text});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final style = TextStyle(
      color: pal.textPrimary,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.35,
    );
    final leading = switch (band) {
      IronVibeRhythmAdviceBand.steady => _metalThumb(pal),
      IronVibeRhythmAdviceBand.veryDense => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/rhythm_smirk.png',
          width: 36,
          height: 36,
          fit: BoxFit.cover,
        ),
      ),
      IronVibeRhythmAdviceBand.dense || IronVibeRhythmAdviceBand.light => null,
    };
    if (leading == null) return Text(text, style: style);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        leading,
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }

  Widget _metalThumb(IronVibePalette pal) {
    final isDark = pal.brightness == Brightness.dark;
    return Container(
      width: 36,
      height: 36,
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
      child: const Icon(
        Icons.thumb_up_rounded,
        size: 18,
        color: kIronVibeAccent,
      ),
    );
  }
}
