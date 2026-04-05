part of 'package:fitness_app/main.dart';


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

  SetData({String w = '', String r = '', String ri = '0', String d = '', String i = ''}) {
    weight.text = w;
    reps.text = r;
    rir.text = normalizeRirStored(ri);
    duration.text = d;
    intensity.text = i;
  }
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

/// Логотип одинаковой высоты на всех экранах (эталон — главный).
Widget _buildAppBarLogo(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/logo_final.png',
        height: kIronVibeStandardLogoHeight,
        filterQuality: FilterQuality.high,
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ),
    ),
  );
}

/// Иконка в хедере: фиксированная область слота, без визуального сдвига логотипа.
Widget _ironVibeHeaderIconButton(
  BuildContext context, {
  required IconData icon,
  required VoidCallback onPressed,
}) {
  final pal = IronVibePalette.of(context);
  return IconButton(
    padding: EdgeInsets.zero,
    constraints: BoxConstraints.tightFor(
      width: kIronVibeHeaderSideSlotWidth,
      height: kIronVibeStandardLogoHeight,
    ),
    icon: Icon(icon, color: pal.iconPrimary, size: 22),
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
                  SizedBox(width: kIronVibeHeaderSideSlotWidth, child: leading ?? const SizedBox.shrink()),
                  const Spacer(),
                  SizedBox(width: kIronVibeHeaderSideSlotWidth, child: trailing ?? const SizedBox.shrink()),
                ],
              ),
            ],
          ),
        ),
        if (showStopwatch) ...[
          const SizedBox(height: 8),
          SizedBox(
            height: kIronVibeCompactStopwatchSlotHeight,
            child: const Center(
              child: StopwatchPanel(compact: true),
            ),
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
  IronVibePinnedHeaderDelegate({
    required this.extent,
    required this.child,
  });

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
      child: SizedBox(
        height: extent,
        width: double.infinity,
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant IronVibePinnedHeaderDelegate oldDelegate) {
    return oldDelegate.extent != extent || oldDelegate.child != child;
  }
}

class SteelButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final bool isBig;
  final double fontSize;
  final Color? textColor;

  const SteelButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.isBig = false,
    this.fontSize = 14,
    this.textColor,
  });

  @override
  State<SteelButton> createState() => _SteelButtonState();
}

class _SteelButtonState extends State<SteelButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
      lowerBound: 0.0,
      upperBound: 2.0, // 2 pixels down
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final gradientColors = isDark
        ? const <Color>[Color(0xFF454D59), Color(0xFF262A30)]
        : const <Color>[Color(0xFFC9D0DC), Color(0xFF98A4B4)];
    final borderColor = isDark ? const Color(0x4DFFFFFF) : const Color(0x55000000);
    final defaultLabel = isDark ? const Color(0xFFE8EAEE) : const Color(0xFF283040);
    final shadow = isDark
        ? <BoxShadow>[
            BoxShadow(color: Colors.black.withValues(alpha: 0.45), offset: const Offset(0, 4), blurRadius: 6),
          ]
        : <BoxShadow>[
            BoxShadow(color: Colors.black.withValues(alpha: 0.10), offset: const Offset(0, 2), blurRadius: 5),
          ];
    final textShadows = isDark
        ? const <Shadow>[Shadow(color: Colors.black45, offset: Offset(1, 1), blurRadius: 1)]
        : const <Shadow>[Shadow(color: Color(0x18000000), offset: Offset(0, 0.5), blurRadius: 0)];

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _controller.value),
            child: child,
          );
        },
        child: Container(
          width: widget.width,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: borderColor, width: 1.0),
            boxShadow: shadow,
          ),
          child: Text(
            widget.text.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.textColor ?? defaultLabel,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
              shadows: textShadows,
            ),
          ),
        ),
      ),
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
          side: BorderSide(color: pal.borderDefault, width: 0.5),
          borderRadius: BorderRadius.circular(4),
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
                ? kProgressChartWeightColor.withValues(alpha: isDark ? 0.22 : 0.14)
                : kProgressChartRepsColor.withValues(alpha: isDark ? 0.22 : 0.16))
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
            border: Border.all(color: c ? Colors.transparent : pal.borderDefault, width: c ? 0 : 1.0),
            boxShadow: c
                ? const []
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.35 : 0.08),
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
                          onTap: () => _ctrl.startIntervalPreset(workSec: 60, restSec: 60),
                        ),
                        _sideChipButton(
                          pal: pal,
                          label: '4/4',
                          height: sideBtnH,
                          fontSize: sideFs,
                          onTap: () => _ctrl.startIntervalPreset(workSec: 240, restSec: 240),
                        ),
                        _sideChipButton(
                          pal: pal,
                          label: '20/10',
                          height: sideBtnH,
                          fontSize: sideFs,
                          onTap: () => _ctrl.startIntervalPreset(workSec: 20, restSec: 10),
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
                              backgroundColor: pal.borderSubtle.withValues(alpha: 0.5),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _ctrl.mode == WorkoutTimerMode.interval
                                    ? (_ctrl.intervalIsWork ? kProgressChartWeightColor : kProgressChartRepsColor)
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
                              icon: _ctrl.running ? Icons.pause : Icons.play_arrow,
                              onPressed: () => _ctrl.toggleRunning(),
                              color: _ctrl.running ? Colors.amber : Colors.green,
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

  const SetRow({super.key, required this.data, this.isCardio = false, this.onDraftChanged});

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
    final oneRm =
        weight != null && reps != null && reps >= 1 ? ironVibeEpleyOneRmKg(weight, reps) : null;
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
          Expanded(
            child: _buildDurationField(pal),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildIntensityDropdown(pal),
          ),
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
        Expanded(child: _buildTextField(pal, widget.data.weight)),
        const SizedBox(width: 8),
        Expanded(child: _buildTextField(pal, widget.data.reps)),
        const SizedBox(width: 8),
        Expanded(child: _buildRirDropdown(pal)),
        const SizedBox(width: 8),
        SizedBox(width: 80, child: oneRmWidget),
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
            borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
            borderRadius: BorderRadius.circular(4),
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
        border: Border.all(color: pal.borderDefault, width: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          isExpanded: true,
          hint: Text('1-5', style: TextStyle(color: pal.textHint, fontSize: 12)),
          dropdownColor: pal.dropdown,
          style: TextStyle(color: pal.textPrimary, fontSize: 14),
          icon: Icon(Icons.arrow_drop_down, color: pal.textSecondary),
          items: _intensityValues.map((String v) {
            return DropdownMenuItem<String>(value: v, child: Text(v, textAlign: TextAlign.center));
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
        border: Border.all(color: pal.borderDefault, width: 0.5),
        borderRadius: BorderRadius.circular(4),
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
            return DropdownMenuItem<String>(value: v, child: Text(v, textAlign: TextAlign.center));
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

  Widget _buildTextField(IronVibePalette pal, TextEditingController controller, {String? hint}) {
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
          hintText: hint,
          hintStyle: TextStyle(color: pal.textHint, fontSize: 12),
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

  const ExerciseCard({
    super.key,
    required this.data,
    this.forceCardioMode,
    this.clientNameForProgress,
    this.exerciseIndex,
    this.onDraftChanged,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  /// Фокус поля названия из [Autocomplete] — после выбора из списка снимаем, чтобы оверлей подсказок стабильно закрывался.
  FocusNode? _exerciseNameFieldFocus;

  void _addSet() {
    setState(() {
      widget.data.sets.add(SetData());
    });
    widget.onDraftChanged?.call();
  }

  Future<void> _removeLastSet() async {
    if (widget.data.sets.isEmpty) return;
    final last = widget.data.sets.last;
    final hasData = last.weight.text.trim().isNotEmpty ||
        last.reps.text.trim().isNotEmpty ||
        rirIndicatesMeaningfulUserChoice(last.rir.text) ||
        last.duration.text.trim().isNotEmpty ||
        last.intensity.text.trim().isNotEmpty;

    if (hasData) {
      final locale = AppLocalizations.of(context)!;
      final confirm = await showDialog<bool>(
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
                  locale.deleteWorkoutTitle,
                  style: TextStyle(
                      color: pal.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                content: Text(
                  locale.removeSetWithDataConfirm,
                  style: TextStyle(color: pal.textSecondary),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(locale.cancel,
                        style: TextStyle(color: pal.textMuted)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(
                      locale.yesDelete,
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
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
      decoration: BoxDecoration(
        color: pal.exerciseCardBg,
        border: Border.all(color: pal.borderDefault, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.exerciseIndex != null) ...[
            Text(
              widget.data.nameController.text.trim().isEmpty
                  ? l.exerciseNumberedTitle(widget.exerciseIndex! + 1)
                  : widget.data.nameController.text.trim(),
              style: TextStyle(
                color: pal.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
          ],
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return exerciseBank.where((String option) {
                final o = normalizeExerciseName(option);
                final q = normalizeExerciseName(textEditingValue.text);
                return o.contains(q);
              });
            },
            onSelected: (String selection) {
              widget.data.nameController.text = normalizeExerciseName(selection);
              setState(() {});
              widget.onDraftChanged?.call();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _exerciseNameFieldFocus?.unfocus();
              });
            },
            fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
              _exerciseNameFieldFocus = focusNode;
              if (controller.text != widget.data.nameController.text) {
                 controller.text = widget.data.nameController.text;
                 controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));
              }

              return GestureDetector(
                onLongPress: () async {
                  final current = widget.data.nameController.text;
                  if (current.trim().isEmpty) return;
                  await showRenameExerciseDialog(context, current, (newName) {
                    widget.data.nameController.text = newName;
                    controller.text = newName;
                    setState(() {});
                    widget.onDraftChanged?.call();
                  });
                },
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  onEditingComplete: onEditingComplete,
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
                    side: BorderSide(color: pal.borderDefault, width: 0.5),
                    borderRadius: BorderRadius.zero,
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
                              bottom: BorderSide(color: pal.borderSubtle, width: 0.5),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onLongPress: () async {
                                    if (option.trim().isEmpty) return;
                                    await showRenameExerciseDialog(context, option, (_) => setState(() {}));
                                  },
                                  child: InkWell(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        option,
                                        style: TextStyle(color: pal.textPrimary, fontSize: 13),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.close, color: pal.textMuted, size: 16),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      final dpal = IronVibePalette.of(dialogContext);
                                      return AlertDialog(
                                        backgroundColor: dpal.dialog,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: dpal.borderDefault, width: 0.5),
                                          borderRadius: BorderRadius.zero,
                                        ),
                                        title: Text(AppLocalizations.of(context)!.deleteFromHistory,
                                            style: TextStyle(color: dpal.textPrimary)),
                                        content: Text(
                                          '"$option" ${AppLocalizations.of(context)!.deleteExerciseHint}',
                                          style: TextStyle(color: dpal.textSecondary),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(dialogContext),
                                            child: Text(AppLocalizations.of(context)!.cancel,
                                                style: TextStyle(color: dpal.textMuted)),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              Navigator.pop(dialogContext);
                                              final messenger = ScaffoldMessenger.of(context);
                                              final deletedMsg = AppLocalizations.of(context)!.exerciseDeleted;

                                              setState(() {
                                                exerciseBank.removeWhere(
                                                  (e) => normalizeExerciseName(e) == normalizeExerciseName(option),
                                                );
                                              });
                                              await DataService.saveData();

                                              if (mounted) {
                                                messenger.showSnackBar(
                                                  SnackBar(
                                                    content: Text('"$option" $deletedMsg'),
                                                    backgroundColor: dpal.brightness == Brightness.dark
                                                        ? Colors.grey[900]
                                                        : dpal.field,
                                                    duration: const Duration(seconds: 2),
                                                  ),
                                                );

                                                final text = widget.data.nameController.text;
                                                final selection = widget.data.nameController.selection;
                                                widget.data.nameController.text = text;
                                                widget.data.nameController.selection = selection;
                                              }
                                            },
                                            child: Text(AppLocalizations.of(context)!.delete,
                                                style: const TextStyle(color: Colors.redAccent)),
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
                        border: Border.all(color: pal.borderDefault, width: 0.5),
                        borderRadius: BorderRadius.circular(4),
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
                        border: Border.all(color: pal.borderDefault, width: 0.5),
                        borderRadius: BorderRadius.circular(4),
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
                                    letterSpacing: 1.0))),
                        const SizedBox(width: 8),
                        Expanded(
                            child: Text(
                                AppLocalizations.of(context)!.intensityHeader,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: pal.textMuted,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.0))),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                            child: Text(
                                ironVibeWeightColumnTitle(AppLocalizations.of(context)!),
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
                                overflow: TextOverflow.ellipsis)),
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
                                    letterSpacing: 0.2))),
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
                                    letterSpacing: 1.0))),
                        const SizedBox(width: 8),
                        const SizedBox(width: 80),
                      ],
                    ),
            ),
          
          Column(
            children: _effectiveIsCardio
                ? [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SetRow(data: widget.data.sets.first, isCardio: true, onDraftChanged: widget.onDraftChanged),
                    ),
                  ]
                : widget.data.sets.map((setData) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SetRow(data: setData, isCardio: false, onDraftChanged: widget.onDraftChanged),
                    )).toList(),
          ),
          if (!_effectiveIsCardio) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: _SetIconButton(
                      icon: Icons.remove,
                      onTap: _removeLastSet,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Center(
                    child: _SetIconButton(
                      icon: Icons.add,
                      onTap: _addSet,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _ProgressButton(
                    onTap: () => _showProgressBottomSheet(context),
                  ),
                ),
                const SizedBox(width: 8),
                _ExerciseVolumeSummary(data: widget.data),
              ],
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
    if (oldWidget.data != widget.data || oldWidget.data.sets.length != widget.data.sets.length) {
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
      width: 80,
      height: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l.volumeShort,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: pal.textMuted,
              fontSize: 8,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          volumeWidget,
        ],
      ),
    );
  }
}

class _ProgressButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ProgressButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: pal.borderDefault, width: 1.0),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.show_chart, color: pal.iconPrimary, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SetIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SetIconButton({required this.icon, required this.onTap});

  static const double _minTouchSize = 48;

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_minTouchSize / 2),
        child: Container(
          width: _minTouchSize,
          height: _minTouchSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_minTouchSize / 2),
            border: Border.all(color: pal.borderDefault, width: 1.0),
          ),
          child: Icon(icon, size: 22, color: pal.iconPrimary),
        ),
      ),
    );
  }
}
