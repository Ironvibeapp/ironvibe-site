part of 'package:fitness_app/main.dart';

class AthleteScreen extends StatefulWidget {
  const AthleteScreen({super.key});

  @override
  State<AthleteScreen> createState() => _AthleteScreenState();
}

class _AthleteScreenState extends State<AthleteScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _enter;
  bool _deloadNudgeChecked = false;

  @override
  void initState() {
    super.initState();
    _enter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 760),
    )..forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_maybeShowDeloadNudge());
    });
  }

  @override
  void dispose() {
    _enter.dispose();
    super.dispose();
  }

  Future<void> _maybeShowDeloadNudge() async {
    if (_deloadNudgeChecked || !mounted) return;
    _deloadNudgeChecked = true;
    final snap = ironVibeComputeRhythm(workoutHistory);
    if (!snap.suggestsDeloadNudge) return;
    final last = await ironVibeLoadDeloadNudgeAt();
    if (!mounted) return;
    if (last != null && ironVibeSameMondayWeek(last, DateTime.now())) return;

    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final locale = Localizations.localeOf(context).toString();
    final rate = NumberFormat('#0.0', locale).format(snap.daysPerWeek);
    final weeks = math.max(1, snap.accumulationWeeks.round());

    await showDialog<void>(
      context: context,
      builder: (ctx) {
        final dpal = IronVibePalette.of(ctx);
        return AlertDialog(
          backgroundColor: dpal.dialog,
          shape: ironVibeDialogShape(dpal),
          title: Text(
            l.deloadNudgeTitle,
            style: TextStyle(
              color: dpal.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(
            l.deloadNudgeBody(rate, weeks),
            style: TextStyle(color: dpal.textSecondary, height: 1.35),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                l.deloadNudgeLater,
                style: TextStyle(color: pal.textMuted),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                l.deloadNudgeOk,
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
    await ironVibeMarkDeloadNudgeShown(DateTime.now());
  }

  Animation<double> _stagger(double begin, double end) {
    return CurvedAnimation(
      parent: _enter,
      curve: Interval(begin, end, curve: Curves.easeOutCubic),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final rhythm = ironVibeComputeRhythm(workoutHistory);
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
              trailing: _ironVibeHeaderIconButton(
                context,
                icon: Icons.bar_chart,
                onPressed: () => _showStatistics(context, false),
              ),
            ),
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
                        padding: const EdgeInsets.fromLTRB(22, 8, 22, 28),
                        child: Align(
                          alignment: Alignment.center,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (rhythm.hasGauge) ...[
                                  IronVibeEnter(
                                    animation: _stagger(0.0, 0.46),
                                    child: IronVibeRhythmCard(
                                      snapshot: rhythm,
                                      onTap: () =>
                                          ironVibeOpenRhythmInsight(context),
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                ],
                                IronVibeEnter(
                                  animation: _stagger(
                                    rhythm.hasGauge ? 0.08 : 0.0,
                                    rhythm.hasGauge ? 0.55 : 0.48,
                                  ),
                                  child: IronVibePrimaryCta(
                                    label: ironVibeSentenceCase(l.startWorkout),
                                    icon: Icons.play_arrow_rounded,
                                    sheen: _stagger(0.38, 0.92),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WorkoutSessionScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 14),
                                IronVibeEnter(
                                  animation: _stagger(0.10, 0.58),
                                  child: IronVibeSecondaryCta(
                                    label: ironVibeSentenceCase(l.quickWorkout),
                                    icon: Icons.bolt_rounded,
                                    onPressed: () =>
                                        ironVibeStartQuickWorkout(context),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 28,
                                    horizontal: 12,
                                  ),
                                  child: IronVibeEnter(
                                    animation: _stagger(0.18, 0.62),
                                    child: ironVibeFadeRule(pal),
                                  ),
                                ),
                                IronVibeEnter(
                                  animation: _stagger(0.24, 0.78),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: IronVibeNavTile(
                                            icon: Icons.calendar_month_rounded,
                                            label: ironVibeSentenceCase(
                                              l.calendarWorkouts,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CalendarScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: IronVibeNavTile(
                                            icon: Icons.show_chart_rounded,
                                            label: ironVibeSentenceCase(
                                              l.personalProgress,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PersonalProgressScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: IronVibeNavTile(
                                            icon: Icons.star_rounded,
                                            label: ironVibeSentenceCase(
                                              l.favoriteExercises,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const FavoriteExercisesScreen(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
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
          ],
        ),
      ),
    );
  }
}

enum _WorkoutSessionExitAction { stay, discard, saveAndLeave }

class WorkoutSessionScreen extends StatefulWidget {
  /// Optional target date/time for the workout being logged.
  /// When null, the workout is timestamped with `DateTime.now()` at save time
  /// (default flow from the home "Start Workout" button).
  /// When provided, the workout is saved with this exact timestamp,
  /// enabling logging into a specific calendar day.
  final DateTime? targetDate;
  final int? remindMinutesBefore;
  final ActiveWorkoutDraft? restoredDraft;
  final List<String>? initialExerciseNames;
  final List<ExerciseLog>? initialExercises;

  /// When true, last-session weight/reps are shown as grey hints, not filled in.
  final bool previousSetsAsHints;

  const WorkoutSessionScreen({
    super.key,
    this.targetDate,
    this.remindMinutesBefore,
    this.restoredDraft,
    this.initialExerciseNames,
    this.initialExercises,
    this.previousSetsAsHints = false,
  });

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen>
    with WidgetsBindingObserver, IronVibeWorkoutAutoSave {
  final List<ExerciseData> _exercises = [];
  bool _isCardio = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ironVibeSetKeepScreenOn(true);
    _restoreDraftIfNeeded();
    _applyInitialExercisesIfNeeded();
    ironVibeStartWorkoutAutoSave(flushDraft: _flushAutoSaveDraft);
  }

  void _restoreDraftIfNeeded() {
    final draft = widget.restoredDraft;
    if (draft == null) return;
    _isCardio = draft.isCardio;
    _exercises.addAll(ironVibeExerciseListFromDraftJson(draft.exercisesJson));
  }

  void _applyInitialExercisesIfNeeded() {
    if (widget.restoredDraft != null) return;
    final logs = widget.initialExercises;
    if (logs != null && logs.isNotEmpty) {
      for (final log in logs) {
        final normalized = normalizeExerciseName(log.name);
        if (normalized.isEmpty) continue;
        final source = ExerciseLog(
          normalized,
          log.sets,
          isCardio: log.isCardio,
          note: log.note,
        );
        _exercises.add(
          widget.previousSetsAsHints
              ? ironVibeExerciseDataFromPreviousAsHints(source)
              : ironVibeExerciseDataFromLog(source),
        );
      }
      return;
    }
    final names = widget.initialExerciseNames;
    if (names == null || names.isEmpty) return;
    for (final name in names) {
      final normalized = normalizeExerciseName(name);
      if (normalized.isEmpty) continue;
      _exercises.add(ExerciseData(name: normalized));
    }
  }

  Future<void> _clearAutoSaveDraft() async {
    ironVibeStopWorkoutAutoSave();
    await _draftWrite;
    await DataService.clearActiveWorkoutDraft();
  }

  Future<void>? _draftWrite;

  void _flushAutoSaveDraft() {
    if (!_hasDraftWorkout) return;
    _draftWrite = DataService.saveActiveWorkoutDraft(
      ActiveWorkoutDraft(
        kind: ActiveWorkoutDraftKind.personal,
        targetDate: widget.targetDate ?? widget.restoredDraft?.targetDate,
        isCardio: _isCardio,
        exercisesJson: ironVibeExerciseListToDraftJson(_exercises),
        savedAt: DateTime.now(),
      ),
    );
  }

  @override
  void dispose() {
    ironVibeSetKeepScreenOn(false);
    _scrollController.dispose();
    super.dispose();
  }

  bool get _hasAnyInput {
    for (final ex in _exercises) {
      if (ex.nameController.text.trim().isNotEmpty) return true;
      for (final s in ex.sets) {
        if (s.weight.text.trim().isNotEmpty ||
            s.reps.text.trim().isNotEmpty ||
            rirIndicatesMeaningfulUserChoice(s.rir.text) ||
            s.duration.text.trim().isNotEmpty ||
            s.intensity.text.trim().isNotEmpty) {
          return true;
        }
      }
    }
    return false;
  }

  bool get _hasDraftWorkout => _exercises.isNotEmpty || _hasAnyInput;

  void _addExercise() {
    if (_exercises.isNotEmpty) {
      final last = _exercises.last;
      final hasName = last.nameController.text.trim().isNotEmpty;
      final hasSets = last.sets.isNotEmpty;
      if (!hasName || !hasSets) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.fillCurrentExerciseBeforeAdd,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }
    }

    setState(() {
      _exercises.add(ExerciseData());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _removeExercise(int index) {
    if (index < 0 || index >= _exercises.length) return;
    setState(() {
      _exercises.removeAt(index);
    });
  }

  List<ExerciseLog> _logsFromCurrentDraft() {
    final logs = <ExerciseLog>[];

    for (var ex in _exercises) {
      String name = normalizeExerciseName(ex.nameController.text);
      if (name.isEmpty) continue;

      List<SetLog> setLogs = [];
      final setsToProcess = _isCardio && ex.sets.isNotEmpty
          ? [ex.sets.first]
          : ex.sets;
      for (var s in setsToProcess) {
        if (_isCardio) {
          if (s.duration.text.trim().isNotEmpty ||
              s.intensity.text.trim().isNotEmpty) {
            setLogs.add(
              SetLog(
                '',
                '',
                '',
                isCardio: true,
                duration: s.duration.text.trim(),
                intensity: s.intensity.text.trim(),
              ),
            );
          }
        } else {
          if (s.weight.text.trim().isNotEmpty ||
              s.reps.text.trim().isNotEmpty ||
              rirIndicatesMeaningfulUserChoice(s.rir.text)) {
            setLogs.add(
              SetLog(
                s.weight.text.trim(),
                s.reps.text.trim(),
                normalizeRirStored(s.rir.text),
              ),
            );
          }
        }
      }

      if (setLogs.isNotEmpty) {
        logs.add(
          ExerciseLog(name, setLogs, isCardio: _isCardio, note: ex.note.trim()),
        );
      }
    }

    return logs;
  }

  bool get _canFinishWorkout => _logsFromCurrentDraft().isNotEmpty;

  IronVibeSessionPrHighlight _sessionPrHighlightForExercise(int index) {
    if (index < 0 || index >= _exercises.length) {
      return IronVibeSessionPrHighlight.none;
    }
    final ex = _exercises[index];
    return ironVibeSessionPrHighlightForDraft(
      normalizedExerciseName: ex.nameController.text,
      sessionIsCardio: _isCardio,
      sets: ex.sets,
      athleteHistory: workoutHistory,
      clientSessions: null,
      excludeTrainerSession: null,
    );
  }

  Future<void> _setSessionCardio(bool cardio) async {
    if (_isCardio == cardio) return;
    if (ironVibeDraftHasOpposingModeInput(
      _exercises,
      switchingToCardio: cardio,
    )) {
      final ok = await ironVibeConfirmSwitchWorkoutType(context);
      if (!ok || !mounted) return;
    }
    setState(() => _isCardio = cardio);
  }

  Future<void> _finishWorkout({bool celebrate = false}) async {
    final logs = _logsFromCurrentDraft();
    for (final log in logs) {
      ensureExerciseInBank(log.name);
    }

    if (logs.isNotEmpty) {
      workoutHistory.add(
        ironVibeNewWorkoutLog(
          widget.targetDate ?? DateTime.now(),
          logs,
          remindMinutesBefore: widget.remindMinutesBefore,
        ),
      );
    }

    await _clearAutoSaveDraft();
    await DataService.saveData();

    if (celebrate && logs.isNotEmpty && mounted) {
      await ironVibeShowWorkoutComplete(context);
    }

    if (mounted) Navigator.pop(context);
  }

  Future<void> _requestFinishWorkout() async {
    if (!_canFinishWorkout) return;
    final ok = await ironVibeConfirmFinishWorkout(context);
    if (!ok || !mounted) return;
    await _finishWorkout(celebrate: true);
  }

  @override
  Widget build(BuildContext context) {
    final hasData = _hasDraftWorkout;
    final canFinish = _canFinishWorkout;
    final pal = IronVibePalette.of(context);
    final segStrAthlete = ironVibeWorkoutTypeSegmentStyle(
      pal,
      isStrengthSegment: true,
      selected: !_isCardio,
    );
    final segCarAthlete = ironVibeWorkoutTypeSegmentStyle(
      pal,
      isStrengthSegment: false,
      selected: _isCardio,
    );
    return PopScope(
      canPop: !hasData,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (!hasData) {
          Navigator.of(context).pop();
          return;
        }
        final l = AppLocalizations.of(context)!;
        final action = await showDialog<_WorkoutSessionExitAction>(
          context: context,
          builder: (ctx) {
            final dpal = IronVibePalette.of(ctx);
            return AlertDialog(
              backgroundColor: dpal.dialog,
              shape: ironVibeDialogShape(dpal),
              title: Text(
                l.clientProfileUnsavedTitle,
                style: TextStyle(
                  color: dpal.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Text(
                l.clientProfileUnsavedMessage,
                style: TextStyle(color: dpal.textSecondary),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(ctx, _WorkoutSessionExitAction.stay),
                  child: Text(
                    l.clientProfileStay,
                    style: TextStyle(color: dpal.textMuted),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pop(ctx, _WorkoutSessionExitAction.discard),
                  child: Text(
                    l.clientProfileDiscard,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(
                    ctx,
                    _WorkoutSessionExitAction.saveAndLeave,
                  ),
                  child: Text(
                    l.clientProfileSaveAndLeave,
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
        if (!context.mounted) return;
        switch (action) {
          case _WorkoutSessionExitAction.stay:
          case null:
            break;
          case _WorkoutSessionExitAction.discard:
            await _clearAutoSaveDraft();
            if (!context.mounted) return;
            _exercises.clear();
            Navigator.of(context).pop();
            break;
          case _WorkoutSessionExitAction.saveAndLeave:
            if (!_canFinishWorkout) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)!.saveWorkoutNothingToSave,
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
              break;
            }
            await _finishWorkout(celebrate: true);
            break;
        }
      },
      child: Scaffold(
        body: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.translucent,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: IronVibePinnedHeaderDelegate(
                    extent: kIronVibePinnedHeaderExtent,
                    child: _ironVibeTopBarMaterial(
                      context,
                      showStopwatch: true,
                      leading: _ironVibeHeaderIconButton(
                        context,
                        icon: Icons.arrow_back,
                        onPressed: () => Navigator.maybePop(context),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _setSessionCardio(false),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: segStrAthlete.backgroundColor,
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
                                    style: segStrAthlete.labelStyle,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => _setSessionCardio(true),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: segCarAthlete.backgroundColor,
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
                                    style: segCarAthlete.labelStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _exercises.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: ExerciseCard(
                                key: ObjectKey(_exercises[index]),
                                data: _exercises[index],
                                forceCardioMode: _isCardio,
                                exerciseIndex: index,
                                onDraftChanged: () => setState(() {}),
                                sessionPrHighlight:
                                    _sessionPrHighlightForExercise(index),
                                onRemove: () => _removeExercise(index),
                                noteSessionDate: widget.targetDate,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        SteelButton(
                          text: AppLocalizations.of(context)!.addExercise,
                          icon: Icons.add_rounded,
                          onPressed: _addExercise,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 20),
                        IgnorePointer(
                          ignoring: !canFinish,
                          child: Opacity(
                            opacity: canFinish ? 1.0 : 0.45,
                            child: SteelButton(
                              text: AppLocalizations.of(context)!.finishWorkout,
                              icon: Icons.check_rounded,
                              onPressed: _requestFinishWorkout,
                              width: double.infinity,
                              isBig: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
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

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedMonth = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  List<String> _monthNames(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return [
      l.monthJanuary,
      l.monthFebruary,
      l.monthMarch,
      l.monthApril,
      l.monthMay,
      l.monthJune,
      l.monthJuly,
      l.monthAugust,
      l.monthSeptember,
      l.monthOctober,
      l.monthNovember,
      l.monthDecember,
    ];
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _focusedMonth = DateTime(_selectedDate.year, _selectedDate.month);
  }

  Future<void> _openDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      builder: (c, child) => ironVibeDatePickerTheme(c, child),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _focusedMonth = DateTime(picked.year, picked.month);
      });
    }
  }

  void _onCalendarMonthChanged(DateTime month) {
    final focused = DateTime(month.year, month.month);
    if (focused.year == _focusedMonth.year &&
        focused.month == _focusedMonth.month) {
      return;
    }
    setState(() {
      _focusedMonth = focused;
      _selectedDate = ironVibeAlignSelectedDateToMonth(_selectedDate, focused);
    });
  }

  Future<void> _addWorkoutOnSelectedDate() async {
    final now = DateTime.now();
    final isToday = ironVibeIsSameCalendarDay(_selectedDate, now);
    var selectedTime = isToday
        ? TimeOfDay(hour: now.hour, minute: now.minute)
        : const TimeOfDay(hour: 12, minute: 0);
    var remind = false;
    var remindMinutes = kIronVibeDefaultRemindMinutes;
    var reminderDenied = false;
    final hostContext = context;

    final picked = await showDialog<({TimeOfDay time, int? minutes})>(
      context: context,
      builder: (dialogCtx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final pal = IronVibePalette.of(context);
            final l = AppLocalizations.of(context)!;
            final clock =
                '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
            return AlertDialog(
              backgroundColor: pal.dialog,
              shape: ironVibeDialogShape(pal),
              title: Text(
                l.addTraining,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          builder: (c2, child) =>
                              ironVibeTimePickerTheme(c2, child),
                        );
                        if (time != null) {
                          setDialogState(() => selectedTime = time);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: pal.borderSubtle, width: 0.5),
                          color: pal.inputFill,
                          borderRadius: BorderRadius.circular(
                            kIronVibeRadiusField,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(l.time, style: TextStyle(color: pal.textMuted)),
                            Text(
                              clock,
                              style: TextStyle(
                                color: pal.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ironVibeRemindBeforeControl(
                      enabled: remind,
                      minutes: remindMinutes,
                      onEnabled: (value) async {
                        if (value) {
                          final allowed = await ironVibeEnsureReminderPermission(
                            exact: true,
                          );
                          reminderDenied = !allowed;
                        } else {
                          reminderDenied = false;
                        }
                        setDialogState(() => remind = value);
                      },
                      onMinutes: (value) {
                        setDialogState(() => remindMinutes = value);
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l.cancel, style: TextStyle(color: pal.textMuted)),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, (
                    time: selectedTime,
                    minutes: remind ? remindMinutes : null,
                  )),
                  child: Text(
                    l.add,
                    style: TextStyle(
                      color: pal.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
    if (picked == null || !mounted) return;
    if (reminderDenied && hostContext.mounted) {
      ScaffoldMessenger.of(hostContext).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(hostContext)!.remindPermissionDenied),
        ),
      );
    }
    final targetDate = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      picked.time.hour,
      picked.time.minute,
    );
    if (targetDate.isAfter(DateTime.now())) {
      await ironVibeEnsureReminderPermission(exact: picked.minutes != null);
    }
    if (!mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WorkoutSessionScreen(
          targetDate: targetDate,
          remindMinutesBefore: picked.minutes,
        ),
      ),
    );
    if (!mounted) return;
    setState(() {});
  }

  int _daysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  int _firstWeekdayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday;
  }

  List<WorkoutLog> _getWorkoutsForDate(DateTime date) {
    final list = workoutHistory
        .where(
          (w) =>
              w.date.year == date.year &&
              w.date.month == date.month &&
              w.date.day == date.day,
        )
        .toList();
    list.sort((a, b) => a.date.compareTo(b.date));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final workouts = _getWorkoutsForDate(_selectedDate);
    final pal = IronVibePalette.of(context);

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: IronVibePinnedHeaderDelegate(
                extent: kIronVibePinnedHeaderExtentLogoOnly,
                child: _ironVibeTopBarMaterial(
                  context,
                  leading: _ironVibeHeaderIconButton(
                    context,
                    icon: Icons.arrow_back,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: TextButton(
                  onPressed: _openDatePicker,
                  style: TextButton.styleFrom(
                    foregroundColor: pal.textPrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                  ),
                  child: Text(
                    '${_monthNames(context)[_focusedMonth.month - 1]} ${_focusedMonth.year}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                      color: pal.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: _buildCalendarGrid()),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SteelButton(
                      text: AppLocalizations.of(context)!.addTraining,
                      icon: Icons.add_rounded,
                      onPressed: _addWorkoutOnSelectedDate,
                      width: double.infinity,
                      isBig: true,
                    ),
                    if (workouts.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      for (int i = 0; i < workouts.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        _buildWorkoutAccordion(context, workouts[i], i + 1),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final pal = IronVibePalette.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Center(
        child: Container(
          width: kIronVibeCalendarGridWidth,
          clipBehavior: Clip.antiAlias,
          decoration: ironVibeElevatedCardDecoration(pal),
          child: SizedBox(
            height: kIronVibeCalendarGridHeight,
            child: _IronVibeMonthPageView(
              month: _focusedMonth,
              onMonthChanged: _onCalendarMonthChanged,
              monthBuilder: (context, month) => _calendarGridForMonth(month),
            ),
          ),
        ),
      ),
    );
  }

  Widget _calendarGridForMonth(DateTime month) {
    final year = month.year;
    final monthNumber = month.month;
    final daysCount = _daysInMonth(month);
    final firstWeekday = _firstWeekdayOfMonth(month);
    final emptyCells = firstWeekday - 1;
    final totalCells = emptyCells + daysCount;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: kIronVibeCalendarGridPadding,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: kIronVibeCalendarCellSpacing,
        crossAxisSpacing: kIronVibeCalendarCellSpacing,
        childAspectRatio: 1.0,
      ),
      itemCount: totalCells,
      itemBuilder: (context, index) {
        if (index < emptyCells) {
          return const SizedBox.shrink();
        }
        final day = index - emptyCells + 1;
        final date = DateTime(year, monthNumber, day);
        final hasWorkout = _getWorkoutsForDate(date).isNotEmpty;
        final isSelected = ironVibeIsSameCalendarDay(date, _selectedDate);

        return _ironVibeCalendarDayCell(
          context,
          day: day,
          isSelected: isSelected,
          hasMark: hasWorkout,
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
        );
      },
    );
  }

  Widget _buildWorkoutCardContent(WorkoutLog workout) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HistoryWorkoutEditor(
          key: ObjectKey(workout),
          workout: workout,
          onChanged: () {
            if (mounted) setState(() {});
          },
        ),
        const SizedBox(height: 20),
        SteelButton(
          text: AppLocalizations.of(context)!.deleteWorkout,
          icon: Icons.delete_outline_rounded,
          textColor: Colors.redAccent,
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) {
                final pal = IronVibePalette.of(ctx);
                return AlertDialog(
                  backgroundColor: pal.dialog,
                  shape: ironVibeDialogShape(pal),
                  title: Text(
                    AppLocalizations.of(ctx)!.deleteWorkoutTitle,
                    style: TextStyle(
                      color: pal.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Text(
                    AppLocalizations.of(ctx)!.deleteWorkoutMsg,
                    style: TextStyle(color: pal.textSecondary),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(
                        AppLocalizations.of(ctx)!.cancel,
                        style: TextStyle(color: pal.textMuted),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          workoutHistory.remove(workout);
                        });
                        DataService.saveData();
                        Navigator.pop(ctx);
                      },
                      child: Text(
                        AppLocalizations.of(ctx)!.yesDelete,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          width: double.infinity,
          height: 50,
        ),
      ],
    );
  }

  Widget _buildWorkoutAccordion(
    BuildContext context,
    WorkoutLog workout,
    int number,
  ) {
    final locale = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final timeStr =
        '${workout.date.hour.toString().padLeft(2, '0')}:${workout.date.minute.toString().padLeft(2, '0')}';
    final volumeLabel = ironVibeWorkoutVolumeLabel(locale, workout.exercises);
    final title =
        '${locale.workoutNumberPrefix}$number · $timeStr · $volumeLabel';
    return Container(
      key: ObjectKey(workout),
      decoration: ironVibeElevatedCardDecoration(pal),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          maintainState: true,
          initiallyExpanded: false,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          shape: const Border(),
          collapsedShape: const Border(),
          iconColor: pal.textMuted,
          collapsedIconColor: pal.textMuted,
          title: Text(
            title,
            style: TextStyle(
              color: pal.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          children: [_buildWorkoutCardContent(workout)],
        ),
      ),
    );
  }
}

class _HistoryWorkoutEditor extends StatefulWidget {
  final WorkoutLog workout;
  final VoidCallback onChanged;

  const _HistoryWorkoutEditor({
    super.key,
    required this.workout,
    required this.onChanged,
  });

  @override
  State<_HistoryWorkoutEditor> createState() => _HistoryWorkoutEditorState();
}

class _HistoryWorkoutEditorState extends State<_HistoryWorkoutEditor> {
  late List<ExerciseData> _exercises;
  late List<String> _savedNames;
  late bool _sessionCardio;
  final Map<ExerciseData, GlobalKey> _keys = {};
  final List<ExerciseData> _discarded = [];
  ExerciseData? _justAdded;
  bool _removed = false;

  @override
  void initState() {
    super.initState();
    _sessionCardio = _detectCardio(widget.workout);
    _exercises = [for (final log in widget.workout.exercises) _dataFor(log)];
    _savedNames = [
      for (final log in widget.workout.exercises) normalizeExerciseName(log.name),
    ];
  }

  bool _detectCardio(WorkoutLog workout) {
    if (workout.exercises.isEmpty) return false;
    final first = workout.exercises.first;
    return first.isCardio ||
        (first.sets.isNotEmpty && first.sets.first.isCardio);
  }

  ExerciseData _dataFor(ExerciseLog log) {
    final data = ironVibeExerciseDataFromLog(log);
    if (log.isCardio || (log.sets.isNotEmpty && log.sets.first.isCardio)) {
      data.isCardio = true;
    }
    return data;
  }

  GlobalKey _keyFor(ExerciseData ex) => _keys.putIfAbsent(ex, GlobalKey.new);

  void _disposeExercise(ExerciseData ex) {
    ex.nameController.dispose();
    for (final set in ex.sets) {
      set.weight.dispose();
      set.reps.dispose();
      set.rir.dispose();
      set.duration.dispose();
      set.intensity.dispose();
    }
  }

  List<SetLog> _loggedSets(ExerciseData ex) {
    final cardio = ex.isCardio;
    final source = cardio && ex.sets.isNotEmpty ? [ex.sets.first] : ex.sets;
    final out = <SetLog>[];
    for (final set in source) {
      if (cardio) {
        final duration = set.duration.text.trim();
        final intensity = set.intensity.text.trim();
        if (duration.isEmpty && intensity.isEmpty) continue;
        out.add(
          SetLog(
            '',
            '',
            '',
            isCardio: true,
            duration: duration,
            intensity: intensity,
          ),
        );
      } else {
        final weight = set.weight.text.trim();
        final reps = set.reps.text.trim();
        if (weight.isEmpty &&
            reps.isEmpty &&
            !rirIndicatesMeaningfulUserChoice(set.rir.text)) {
          continue;
        }
        out.add(SetLog(weight, reps, normalizeRirStored(set.rir.text)));
      }
    }
    return out;
  }

  void _writeWorkout() {
    final logs = <ExerciseLog>[];
    for (var i = 0; i < _exercises.length; i++) {
      final ex = _exercises[i];
      final typed = normalizeExerciseName(ex.nameController.text);
      if (typed.isNotEmpty) _savedNames[i] = typed;
      final name = _savedNames[i];
      if (name.isEmpty) continue;
      final sets = _loggedSets(ex);
      final cardio = ex.isCardio;
      logs.add(
        ExerciseLog(
          name,
          sets.isEmpty
              ? [
                  cardio
                      ? SetLog('', '', '', isCardio: true, duration: '', intensity: '')
                      : SetLog('', '', ''),
                ]
              : sets,
          isCardio: cardio,
          note: ex.note.trim(),
        ),
      );
    }
    widget.workout.exercises
      ..clear()
      ..addAll(logs);
    unawaited(DataService.saveData());
  }

  void _sync() {
    _writeWorkout();
    widget.onChanged();
  }

  void _addExercise() {
    if (_exercises.isNotEmpty) {
      final last = _exercises.last;
      if (last.nameController.text.trim().isEmpty || last.sets.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.fillCurrentExerciseBeforeAdd,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }
    }
    final created = ExerciseData(isCardio: _sessionCardio);
    setState(() {
      _justAdded = created;
      _exercises.add(created);
      _savedNames.add('');
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final target = _keys[created]?.currentContext;
      if (target != null) {
        Scrollable.ensureVisible(
          target,
          duration: const Duration(milliseconds: 250),
          alignment: 0.15,
        );
      }
      _justAdded = null;
    });
  }

  Future<void> _reassign(int index) async {
    if (index < 0 || index >= _exercises.length) return;
    final picked = await showExerciseReassignPickerDialog(
      context,
      initialName: _exercises[index].nameController.text,
    );
    if (!mounted || picked == null) return;
    final name = normalizeExerciseName(picked);
    if (name.isEmpty) return;
    _exercises[index].nameController.text = name;
    _savedNames[index] = name;
    ensureExerciseInBank(name);
    setState(() {});
    _sync();
  }

  void _removeExercise(int index) {
    if (index < 0 || index >= _exercises.length) return;
    final removed = _exercises[index];
    setState(() {
      _exercises.removeAt(index);
      _savedNames.removeAt(index);
    });
    _discarded.add(removed);
    _keys.remove(removed);
    if (_exercises.isEmpty) {
      _removed = true;
      workoutHistory.remove(widget.workout);
      unawaited(DataService.saveData());
      widget.onChanged();
      return;
    }
    _sync();
  }

  @override
  void dispose() {
    if (!_removed) _writeWorkout();
    for (final ex in [..._exercises, ..._discarded]) {
      _disposeExercise(ex);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < _exercises.length; i++) ...[
          Padding(
            key: _keyFor(_exercises[i]),
            padding: const EdgeInsets.only(bottom: 30),
            child: ExerciseCard(
              key: ObjectKey(_exercises[i]),
              data: _exercises[i],
              forceCardioMode: _exercises[i].isCardio,
              exerciseIndex: i,
              autofocusName: identical(_exercises[i], _justAdded),
              onDraftChanged: _sync,
              onExerciseNameCommitted: () {
                final name = normalizeExerciseName(
                  _exercises[i].nameController.text,
                );
                if (name.isEmpty || !mounted) return;
                ensureExerciseInBank(name);
                unawaited(DataService.saveData());
              },
              onLongPressReassignExercise: () => _reassign(i),
              onRemove: () => _removeExercise(i),
              noteSessionDate: widget.workout.date,
              excludeWorkoutForNotes: widget.workout,
            ),
          ),
        ],
        SteelButton(
          text: AppLocalizations.of(context)!.addExercise,
          icon: Icons.add_rounded,
          onPressed: _addExercise,
          width: double.infinity,
        ),
      ],
    );
  }
}
