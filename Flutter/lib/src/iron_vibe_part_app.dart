part of 'package:fitness_app/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Не блокируем первый кадр: нативный AudioPlayer; при первом бипе всё равно await initialize().
  unawaited(IronVibeTimerSounds.initialize());
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _enter;
  bool _backupNudgeChecked = false;

  @override
  void initState() {
    super.initState();
    _enter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 760),
    )..forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(_maybeShowWorkoutRecoveryDialog());
    });
  }

  @override
  void dispose() {
    _enter.dispose();
    super.dispose();
  }

  Animation<double> _stagger(double begin, double end) {
    return CurvedAnimation(
      parent: _enter,
      curve: Interval(begin, end, curve: Curves.easeOutCubic),
    );
  }

  Future<void> _maybeShowWorkoutRecoveryDialog() async {
    final draft = activeWorkoutDraft;
    if (draft == null || !draft.hasRecoverableContent) {
      if (mounted) unawaited(_maybeShowBackupNudge());
      return;
    }

    final l = AppLocalizations.of(context)!;
    final action = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        final dpal = IronVibePalette.of(ctx);
        return AlertDialog(
          backgroundColor: dpal.dialog,
          shape: ironVibeDialogShape(dpal),
          title: Text(
            l.workoutRecoveryTitle,
            style: TextStyle(
              color: dpal.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            l.workoutRecoveryMessage,
            style: TextStyle(color: dpal.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(
                l.workoutRecoveryDelete,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(
                l.workoutRecoveryContinue,
                style: TextStyle(
                  color: dpal.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
    if (!mounted) return;

    if (action == true) {
      _resumeWorkoutFromDraft(draft);
      return;
    } else if (action == false) {
      await DataService.clearActiveWorkoutDraft();
    }
    if (mounted) unawaited(_maybeShowBackupNudge());
  }

  Future<void> _maybeShowBackupNudge() async {
    if (_backupNudgeChecked || !mounted) return;
    _backupNudgeChecked = true;
    await ironVibeMaybeShowBackupNudge(context);
  }

  void _resumeWorkoutFromDraft(ActiveWorkoutDraft draft) {
    switch (draft.kind) {
      case ActiveWorkoutDraftKind.personal:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutSessionScreen(
              targetDate: draft.targetDate,
              restoredDraft: draft,
            ),
          ),
        );
        break;
      case ActiveWorkoutDraftKind.trainer:
        final session = ironVibeFindTrainerSessionForDraft(draft);
        if (session == null) {
          unawaited(DataService.clearActiveWorkoutDraft());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context)!.workoutRecoverySessionMissing),
              duration: const Duration(seconds: 3),
            ),
          );
          return;
        }
        if (ironVibeTrainerSessionIsCompleted(session)) {
          unawaited(DataService.clearActiveWorkoutDraft());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TrainerWorkoutSessionScreen(
                session: session,
                mode: TrainerSessionUiMode.history,
              ),
            ),
          );
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrainerWorkoutSessionScreen(
              session: session,
              restoredDraft: draft,
              mode: TrainerSessionUiMode.live,
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final pal = IronVibePalette.of(context);
    final l = AppLocalizations.of(context)!;
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(22, 8, 22, 16),
                        child: Align(
                          alignment: Alignment.center,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                IronVibeEnter(
                                  animation: _stagger(0.0, 0.46),
                                  child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) => LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: isDark
                                          ? const [
                                              Color(0xFFFFFFFF),
                                              kIronVibeAccent,
                                            ]
                                          : const [
                                              Color(0xFF1B1F26),
                                              Color(0xFF8A7048),
                                            ],
                                    ).createShader(bounds),
                                    child: Text(
                                      l.appName.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: (theme.displayMedium ??
                                              const TextStyle(fontSize: 48))
                                          .copyWith(
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 4.0,
                                        height: 1.1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                IronVibeEnter(
                                  animation: _stagger(0.06, 0.50),
                                  child: Text(
                                    l.slogan,
                                    textAlign: TextAlign.center,
                                    style: (theme.headlineSmall ??
                                            const TextStyle(fontSize: 24))
                                        .copyWith(
                                      color: pal.textSecondary,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 3.0,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 36),
                                IronVibeEnter(
                                  animation: _stagger(0.10, 0.58),
                                  child: IronVibePrimaryCta(
                                    label: ironVibeSentenceCase(l.trainSelf),
                                    icon: Icons.person_rounded,
                                    sheen: _stagger(0.38, 0.92),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AthleteScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 14),
                                IronVibeEnter(
                                  animation: _stagger(0.16, 0.62),
                                  child: IronVibeSecondaryCta(
                                    label: ironVibeSentenceCase(l.trainOthers),
                                    icon: Icons.groups_rounded,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TrainerScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 28,
                                    horizontal: 12,
                                  ),
                                  child: IronVibeEnter(
                                    animation: _stagger(0.22, 0.68),
                                    child: ironVibeFadeRule(pal),
                                  ),
                                ),
                                IronVibeEnter(
                                  animation: _stagger(0.28, 0.78),
                                  child: IronVibeNavTile(
                                    icon: Icons.menu_book_rounded,
                                    label: ironVibeSentenceCase(
                                      l.instructionButton,
                                    ),
                                    horizontal: true,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const InstructionScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 22),
                                IronVibeEnter(
                                  animation: _stagger(0.36, 0.86),
                                  child: const Center(
                                    child: _IronVibeThemeToggle(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
          const _HomeFooter(),
        ],
      ),
      ),
    );
  }
}

class _HomeFooter extends StatelessWidget {
  const _HomeFooter();

  static final _website = Uri.parse('https://ironvibe.app');
  static final _telegram = Uri.parse('https://t.me/IronVibeapp');
  static final _email = Uri.parse('mailto:support@ironvibe.app');
  static final _privacy = Uri.parse('https://ironvibe.app/privacy/');

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final l = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 22),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _footerPair(
                pal,
                _FooterLink(label: l.footerWebsite, uri: _website),
                _FooterLink(label: 't.me/IronVibeapp', uri: _telegram),
              ),
              const SizedBox(height: 8),
              _footerPair(
                pal,
                _FooterLink(
                  label: 'support@ironvibe.app',
                  uri: _email,
                ),
                _FooterLink(label: l.footerPrivacyPolicy, uri: _privacy),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _footerPair(IronVibePalette pal, Widget left, Widget right) {
    return Row(
      children: [
        Expanded(child: left),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '·',
            style: TextStyle(
              color: pal.textMuted.withValues(alpha: 0.38),
              fontSize: 11,
              height: 1,
            ),
          ),
        ),
        Expanded(child: right),
      ],
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: linkColor,
              fontSize: 11,
              height: 1.25,
              letterSpacing: 0.15,
              decoration: TextDecoration.underline,
              decorationColor: linkColor.withValues(alpha: 0.55),
              decorationThickness: 1,
            ),
          ),
        ),
      ),
    );
  }
}
