part of 'package:fitness_app/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IronVibeTimerSounds.initialize();
  await DataService.loadData();
  await ironVibeLoadThemePreference();
  SystemChrome.setSystemUIOverlayStyle(ironVibeSystemOverlayFor(ironVibeThemeMode.value));
  runApp(const IronVibeApp());
}

class IronVibeApp extends StatelessWidget {
  const IronVibeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ironVibeThemeMode,
      builder: (context, mode, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          SystemChrome.setSystemUIOverlayStyle(ironVibeSystemOverlayFor(mode));
        });
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeAnimationDuration: const Duration(milliseconds: 220),
          title: 'IronVibe',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [
            Locale('en'),
            Locale('ru'),
            Locale('es'),
            Locale('de'),
            Locale('fr'),
            Locale('it'),
            Locale('pt'),
            Locale('zh'),
            Locale('pl'),
            Locale('uk'),
          ],
          localeListResolutionCallback: (List<Locale>? preferred, Iterable<Locale> supported) {
            return basicLocaleListResolution(preferred ?? <Locale>[], supported);
          },
          theme: ironVibeBuildTheme(Brightness.light),
          darkTheme: ironVibeBuildTheme(Brightness.dark),
          themeMode: mode,
          home: const HomeScreen(),
        );
      },
    );
  }
}

/// Солнце слева (светлая тема), луна справа (тёмная). Компактный переключатель в стиле приложения.
class _IronVibeThemeToggle extends StatelessWidget {
  const _IronVibeThemeToggle();

  static const double _w = 118;
  static const double _h = 32;
  static const double _pad = 3;

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final thumbW = (_w - _pad * 3) / 2;

    return Semantics(
      button: true,
      toggled: isDark,
      label: isDark ? 'Dark theme' : 'Light theme',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => ironVibeSetThemeMode(isDark ? ThemeMode.light : ThemeMode.dark),
          borderRadius: BorderRadius.circular(_h / 2),
          child: SizedBox(
            width: _w,
            height: _h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: pal.toggleTrack,
                    borderRadius: BorderRadius.circular(_h / 2),
                    border: Border.all(color: pal.toggleBorder, width: 1),
                  ),
                  child: const SizedBox.expand(),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  left: isDark ? _w - _pad - thumbW : _pad,
                  top: _pad,
                  width: thumbW,
                  height: _h - _pad * 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: pal.toggleThumb,
                      borderRadius: BorderRadius.circular((_h - _pad * 2) / 2),
                      border: Border.all(color: pal.borderSubtle, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF000000).withValues(alpha: 0.12),
                          blurRadius: 5,
                          offset: const Offset(0, 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Icon(
                          Icons.wb_sunny_rounded,
                          size: 17,
                          color: isDark ? pal.textMuted : const Color(0xFFBF360C),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Icon(
                          Icons.nightlight_round,
                          size: 16,
                          color: isDark ? const Color(0xFF64B5F6) : pal.textMuted,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final pal = IronVibePalette.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ironVibeTopBarMaterial(context),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: isDark
                            ? const [Color(0xFFFFFFFF), Color(0xFFA0A0A0)]
                            : const [Color(0xFF1B1F26), Color(0xFF5C6475)],
                      ).createShader(bounds),
                      child: Text(
                        AppLocalizations.of(context)!.appName.toUpperCase(),
                        style: GoogleFonts.roboto(
                          fontSize: theme.displayMedium?.fontSize ?? 48,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 4.0,
                          height: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppLocalizations.of(context)!.slogan,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: pal.textSecondary,
                        fontSize: theme.headlineSmall?.fontSize ?? 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3.0,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 50),
                    SteelButton(
                    text: AppLocalizations.of(context)!.trainOthers,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TrainerScreen()),
                      );
                    },
                    width: 260,
                    isBig: true,
                  ),
                  const SizedBox(height: 30),
                  SteelButton(
                    text: AppLocalizations.of(context)!.trainSelf,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AthleteScreen()),
                      );
                    },
                    width: 260,
                    isBig: true,
                  ),
                  const SizedBox(height: 30),
                  SteelButton(
                    text: AppLocalizations.of(context)!.instructionButton,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InstructionScreen()),
                      );
                    },
                    width: 260,
                    isBig: true,
                  ),
                  const SizedBox(height: 22),
                  const _IronVibeThemeToggle(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Center(
              child: Text(
                'v $kAppVersion ($kAppBuildNumber)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pal.textMuted.withValues(alpha: 0.65),
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _FooterLink(
                      label: AppLocalizations.of(context)!.footerWebsite,
                      uri: Uri.parse('https://ironvibe.app'),
                    ),
                    Text(
                      ' · ',
                      style: TextStyle(
                        color: pal.textMuted.withValues(alpha: 0.5),
                        fontSize: 11,
                      ),
                    ),
                    _FooterLink(
                      label: 'support@ironvibe.app',
                      uri: Uri.parse('mailto:support@ironvibe.app'),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                _FooterLink(
                  label: AppLocalizations.of(context)!.footerPrivacyPolicy,
                  uri: Uri.parse('https://ironvibe.app/privacy/'),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class InstructionScreen extends StatelessWidget {
  const InstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l.instructionTitle,
                      style: TextStyle(
                        color: pal.textPrimary,
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Text(
                        l.instructionPhilosophy,
                        style: TextStyle(
                          color: pal.textSecondary,
                          fontSize: 13,
                          height: 1.42,
                        ),
                      ),
                    ),
                    _InstructionBlockHeading(l.instructionSectionPersonalProgress),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Text(
                        l.instructionPersonalProgressIntro,
                        style: TextStyle(
                          color: pal.textSecondary,
                          fontSize: 13,
                          height: 1.42,
                        ),
                      ),
                    ),
                    _InstructionBlockHeading(l.instructionSectionProgressChart),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        l.instructionProgressChartIntro,
                        style: TextStyle(
                          color: pal.textSecondary,
                          fontSize: 13,
                          height: 1.42,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 4,
                            height: 18,
                            margin: const EdgeInsets.only(top: 2, right: 10),
                            decoration: BoxDecoration(
                              color: kProgressChartWeightColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              l.instructionProgressLineWeightDesc,
                              style: TextStyle(
                                color: pal.textSecondary,
                                fontSize: 13,
                                height: 1.42,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 4,
                            height: 18,
                            margin: const EdgeInsets.only(top: 2, right: 10),
                            decoration: BoxDecoration(
                              color: kProgressChartRepsColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              l.instructionProgressLineRepsDesc,
                              style: TextStyle(
                                color: pal.textSecondary,
                                fontSize: 13,
                                height: 1.42,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _InstructionBlockHeading(l.instructionSectionSetControl),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.remove,
                          label: l.instructionSetMinusLabel,
                          description: l.instructionSetMinusDesc,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.add,
                          label: l.instructionSetPlusLabel,
                          description: l.instructionSetPlusDesc,
                        ),
                      ],
                    ),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.show_chart,
                          label: l.instructionSetProgressLabel,
                          description: l.instructionSetProgressDesc,
                        ),
                      ],
                    ),
                    _InstructionBlockHeading(l.instructionSectionWorkout),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.fitness_center,
                          label: l.instructionAddExerciseTitle,
                          description: l.instructionAddExerciseBody,
                        ),
                      ],
                    ),
                    _InstructionBlockHeading(l.instructionSectionExerciseNameTools),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.drive_file_rename_outline,
                          label: l.instructionRenameExerciseTitle,
                          description: l.instructionRenameExerciseDesc,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.close,
                          label: l.instructionRemoveFromBankTitle,
                          description: l.instructionRemoveFromBankDesc,
                        ),
                      ],
                    ),
                    _InstructionBlockHeading(l.instructionSectionInputs),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.scale,
                          label: l.instructionWeightTitle,
                          description: l.instructionWeightBody,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.repeat,
                          label: l.instructionRepsTitle,
                          description: l.instructionRepsBody,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.flag_outlined,
                          label: l.instructionRirTitle,
                          description: l.instructionRirBody,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.trending_up,
                          label: l.instructionOneRmTitle,
                          description: l.instructionOneRmDesc,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.stacked_bar_chart,
                          label: l.instructionExerciseVolumeTitle,
                          description: l.instructionExerciseVolumeDesc,
                        ),
                      ],
                    ),
                    _InstructionBlockHeading(l.instructionSectionSaving),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.check_circle_outline,
                          label: l.instructionFinishTitle,
                          description: l.instructionFinishBody,
                        ),
                      ],
                    ),
                    _InstructionBlockHeading(l.instructionSectionCardio),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.directions_run,
                          label: l.instructionCardioTitle,
                          description: l.instructionCardioBody,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.speed,
                          label: l.instructionIntensityTitle,
                          description: l.instructionIntensityBody,
                        ),
                      ],
                    ),
                    _InstructionBlockHeading(l.instructionSectionStopwatch),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.timer_outlined,
                          label: l.instructionStopwatchWhyTitle,
                          description: l.instructionStopwatchWhyBody,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.touch_app_outlined,
                          label: l.instructionStopwatchHowTitle,
                          description: l.instructionStopwatchHowBody,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.repeat,
                          label: l.instructionStopwatchIntervalsTitle,
                          description: l.instructionStopwatchIntervalsBody,
                          labelStripeColor: kProgressChartWeightColor,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.add_alarm,
                          label: l.instructionStopwatchRestTitle,
                          description: l.instructionStopwatchRestBody,
                          labelStripeColor: kProgressChartRepsColor,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.horizontal_rule,
                          label: l.instructionStopwatchProgressTitle,
                          description: l.instructionStopwatchProgressBody,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.volume_up,
                          label: l.instructionStopwatchSoundsTitle,
                          description: l.instructionStopwatchSoundsBody,
                        ),
                      ],
                    ),
                    _InstructionBlockHeading(l.instructionSectionNavHistory),
                    _InstructionLegendTable(
                      rows: [
                        _InstructionTableRowData(
                          icon: Icons.bar_chart,
                          label: l.instructionNavHistoryTitle,
                          description: l.instructionNavHistoryDesc,
                        ),
                        _InstructionTableRowData(
                          icon: Icons.import_export,
                          label: l.instructionNavImportExportTitle,
                          description: l.instructionNavImportExportDesc,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstructionBlockHeading extends StatelessWidget {
  final String title;

  const _InstructionBlockHeading(this.title);

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: pal.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.45,
        ),
      ),
    );
  }
}

class _InstructionTableRowData {
  final IconData? icon;
  final String label;
  final String description;
  /// Цветная полоска слева (линии на графике прогресса).
  final Color? labelStripeColor;

  const _InstructionTableRowData({
    this.icon,
    required this.label,
    required this.description,
    this.labelStripeColor,
  });
}

class _InstructionLegendTable extends StatelessWidget {
  final List<_InstructionTableRowData> rows;

  const _InstructionLegendTable({required this.rows});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Container(
      decoration: BoxDecoration(
        color: pal.card,
        border: Border.all(color: pal.borderDefault, width: 1.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < rows.length; i++) ...[
            if (i > 0) Divider(height: 1, thickness: 1, color: pal.borderSubtle),
            _InstructionLegendRow(data: rows[i]),
          ],
        ],
      ),
    );
  }
}

class _InstructionLegendRow extends StatelessWidget {
  final _InstructionTableRowData data;

  const _InstructionLegendRow({required this.data});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 11,
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: pal.borderDefault, width: 1.0)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data.labelStripeColor != null) ...[
                    Container(
                      width: 4,
                      height: 22,
                      margin: const EdgeInsets.only(top: 1),
                      decoration: BoxDecoration(
                        color: data.labelStripeColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (data.icon != null) ...[
                    Icon(data.icon, color: pal.iconPrimary, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      data.label,
                      style: TextStyle(
                        color: pal.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        height: 1.25,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 14,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Text(
                data.description,
                style: TextStyle(
                  color: pal.textSecondary,
                  fontSize: 13,
                  height: 1.42,
                ),
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final Uri uri;

  const _FooterLink({required this.label, required this.uri});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final linkColor = pal.textMuted;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Text(
        label,
        style: TextStyle(
          color: linkColor,
          fontSize: 11,
          decoration: TextDecoration.underline,
          decorationColor: linkColor.withValues(alpha: 0.75),
        ),
      ),
    );
  }
}
