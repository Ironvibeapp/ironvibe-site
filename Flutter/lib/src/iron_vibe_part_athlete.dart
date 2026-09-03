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
  final ActiveWorkoutDraft? restoredDraft;
  final List<String>? initialExerciseNames;
  final List<ExerciseLog>? initialExercises;

  /// When true, last-session weight/reps are shown as grey hints, not filled in.
  final bool previousSetsAsHints;

  const WorkoutSessionScreen({
    super.key,
    this.targetDate,
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
        logs.add(ExerciseLog(name, setLogs, isCardio: _isCardio));
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
        ironVibeNewWorkoutLog(widget.targetDate ?? DateTime.now(), logs),
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
    final isToday =
        _selectedDate.year == now.year &&
        _selectedDate.month == now.month &&
        _selectedDate.day == now.day;
    final initialTime = isToday
        ? TimeOfDay(hour: now.hour, minute: now.minute)
        : const TimeOfDay(hour: 12, minute: 0);

    final time = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (c, child) => ironVibeTimePickerTheme(c, child),
    );
    if (time == null) return;
    if (!mounted) return;

    final targetDate = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      time.hour,
      time.minute,
    );

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WorkoutSessionScreen(targetDate: targetDate),
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

  bool _workoutIsCardio(WorkoutLog workout) {
    if (workout.exercises.isEmpty) return false;
    final first = workout.exercises.first;
    return first.isCardio ||
        (first.sets.isNotEmpty && first.sets.first.isCardio);
  }

  void _addHistoryExercise(WorkoutLog workout) {
    if (workout.exercises.isNotEmpty) {
      final last = workout.exercises.last;
      if (last.name.trim().isEmpty || last.sets.isEmpty) {
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

    final isCardio = _workoutIsCardio(workout);
    setState(() {
      if (isCardio) {
        workout.exercises.add(
          ExerciseLog('', [
            SetLog('', '', '', isCardio: true, duration: '', intensity: ''),
          ], isCardio: true),
        );
      } else {
        workout.exercises.add(ExerciseLog('', [SetLog('', '', '0')]));
      }
    });
    DataService.saveData();
  }

  Widget _buildWorkoutCardContent(WorkoutLog workout) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...workout.exercises.asMap().entries.map((entry) {
          final exIndex = entry.key;
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: _EditableHistoryExerciseBlock(
              key: ObjectKey(entry.value),
              workout: workout,
              exerciseIndex: exIndex,
              onDataChanged: () => setState(() {}),
            ),
          );
        }),
        const SizedBox(height: 20),
        SteelButton(
          text: AppLocalizations.of(context)!.addExercise,
          icon: Icons.add_rounded,
          onPressed: () => _addHistoryExercise(workout),
          width: double.infinity,
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
      decoration: ironVibeElevatedCardDecoration(pal),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
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

class _EditableHistoryExerciseBlock extends StatefulWidget {
  final WorkoutLog workout;
  final int exerciseIndex;
  final VoidCallback onDataChanged;

  const _EditableHistoryExerciseBlock({
    super.key,
    required this.workout,
    required this.exerciseIndex,
    required this.onDataChanged,
  });

  @override
  State<_EditableHistoryExerciseBlock> createState() =>
      _EditableHistoryExerciseBlockState();
}

class _EditableHistoryExerciseBlockState
    extends State<_EditableHistoryExerciseBlock> {
  late List<SetData> _setDataList;
  late ExerciseLog _exercise;

  /// Те же подходы, что в UI; для подсчёта объёма как в активной тренировке ([_ExerciseVolumeSummary]).
  late ExerciseData _volumeMirror;

  @override
  void initState() {
    super.initState();
    _exercise = widget.workout.exercises[widget.exerciseIndex];
    _setDataList = _exercise.sets
        .map(
          (s) => SetData(
            w: s.weight,
            r: s.reps,
            ri: s.rir,
            d: s.duration,
            i: s.intensity,
          ),
        )
        .toList();
    for (int i = 0; i < _setDataList.length; i++) {
      final d = _setDataList[i];
      final idx = i;
      d.weight.addListener(() => _persistSet(idx, d));
      d.reps.addListener(() => _persistSet(idx, d));
      d.rir.addListener(() => _persistSet(idx, d));
      d.duration.addListener(() => _persistSet(idx, d));
      d.intensity.addListener(() => _persistSet(idx, d));
    }
    _volumeMirror = ExerciseData(
      name: _exercise.name,
      sets: _setDataList,
      isCardio: false,
    );
  }

  @override
  void didUpdateWidget(covariant _EditableHistoryExerciseBlock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.exerciseIndex >= widget.workout.exercises.length) return;
    final next = widget.workout.exercises[widget.exerciseIndex];
    if (identical(next, _exercise)) return;
    _exercise = next;
  }

  Future<void> _pickExerciseName() async {
    final picked = await showExerciseReassignPickerDialog(
      context,
      initialName: widget.workout.exercises[widget.exerciseIndex].name,
    );
    if (!context.mounted) return;
    if (picked == null) return;
    reassignExerciseInExerciseList(
      widget.workout.exercises,
      widget.exerciseIndex,
      picked,
    );
    _exercise = widget.workout.exercises[widget.exerciseIndex];
    _volumeMirror.nameController.text = normalizeExerciseName(_exercise.name);
    setState(() {});
    widget.onDataChanged();
  }

  void _addHistorySet() {
    final exList = widget.workout.exercises;
    if (widget.exerciseIndex >= exList.length) return;
    final sets = exList[widget.exerciseIndex].sets;
    setState(() {
      sets.add(SetLog('', '', '0'));
      final newData = SetData();
      final idx = _setDataList.length;
      newData.weight.addListener(() => _persistSet(idx, newData));
      newData.reps.addListener(() => _persistSet(idx, newData));
      newData.rir.addListener(() => _persistSet(idx, newData));
      newData.duration.addListener(() => _persistSet(idx, newData));
      newData.intensity.addListener(() => _persistSet(idx, newData));
      _setDataList.add(newData);
    });
    DataService.saveData();
    widget.onDataChanged();
  }

  Future<void> _removeHistorySet(BuildContext context) async {
    final exList = widget.workout.exercises;
    if (widget.exerciseIndex >= exList.length) return;
    final sets = exList[widget.exerciseIndex].sets;
    if (_setDataList.isEmpty || sets.isEmpty) return;

    final lastData = _setDataList.last;
    final hasData =
        lastData.weight.text.trim().isNotEmpty ||
        lastData.reps.text.trim().isNotEmpty ||
        rirIndicatesMeaningfulUserChoice(lastData.rir.text) ||
        lastData.duration.text.trim().isNotEmpty ||
        lastData.intensity.text.trim().isNotEmpty;

    if (hasData) {
      final locale = AppLocalizations.of(context)!;
      final confirm =
          await showDialog<bool>(
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
                  locale.deleteWorkoutTitle,
                  style: TextStyle(
                    color: dpal.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  locale.removeSetWithDataConfirm,
                  style: TextStyle(color: dpal.textSecondary),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(
                      locale.cancel,
                      style: TextStyle(color: dpal.textMuted),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(
                      locale.yesDelete,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          ) ??
          false;
      if (!confirm) return;
    }

    if (_setDataList.length > 1) {
      setState(() {
        _setDataList.removeLast();
        sets.removeLast();
      });
      DataService.saveData();
      widget.onDataChanged();
      return;
    }

    setState(() {
      exList.removeAt(widget.exerciseIndex);
      _setDataList.clear();
    });
    if (exList.isEmpty) {
      workoutHistory.remove(widget.workout);
    }
    DataService.saveData();
    widget.onDataChanged();
  }

  void _persistSet(int setIndex, SetData d) {
    if (widget.exerciseIndex >= widget.workout.exercises.length) return;
    final sets = widget.workout.exercises[widget.exerciseIndex].sets;
    if (setIndex >= sets.length) return;
    final isCardio =
        _exercise.isCardio || (sets.isNotEmpty && sets.first.isCardio);
    if (isCardio) {
      sets[setIndex] = SetLog(
        '',
        '',
        '',
        isCardio: true,
        duration: d.duration.text,
        intensity: d.intensity.text,
      );
    } else {
      sets[setIndex] = SetLog(
        d.weight.text,
        d.reps.text,
        normalizeRirStored(d.rir.text),
      );
    }
    DataService.saveData();
    widget.onDataChanged();
  }

  @override
  void dispose() {
    _volumeMirror.nameController.dispose();
    for (final d in _setDataList) {
      d.weight.dispose();
      d.reps.dispose();
      d.rir.dispose();
      d.duration.dispose();
      d.intensity.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ex = widget.workout.exercises[widget.exerciseIndex];
    final isCardio =
        ex.isCardio || (ex.sets.isNotEmpty && ex.sets.first.isCardio);
    final locale = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final headerStyle = TextStyle(
      color: pal.textMuted,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    );

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: ironVibeElevatedCardDecoration(
        pal,
        color: pal.exerciseCardBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ex.name.trim().isEmpty ? _pickExerciseName : null,
            onLongPress: _pickExerciseName,
            child: Text(
              ex.name.trim().isEmpty
                  ? locale.exerciseNumberedTitle(widget.exerciseIndex + 1)
                  : locale.exerciseNumberedTitleWithName(
                      widget.exerciseIndex + 1,
                      ex.name.trim(),
                    ),
              style: TextStyle(
                color: ex.name.trim().isEmpty ? pal.textMuted : pal.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (!isCardio)
            ironVibeMuscleGroupChip(
              exerciseName: ex.name,
              onChanged: () {
                if (mounted) setState(() {});
                widget.onDataChanged();
              },
            ),
          const SizedBox(height: 12),
          if (isCardio) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      locale.timeMin,
                      textAlign: TextAlign.center,
                      style: headerStyle.copyWith(letterSpacing: 1.0),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      locale.intensityHeader,
                      textAlign: TextAlign.center,
                      style: headerStyle.copyWith(letterSpacing: 1.0),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SetRow(
                data: _setDataList.isNotEmpty
                    ? _setDataList.first
                    : SetData(d: '', i: ''),
                isCardio: true,
              ),
            ),
          ] else ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    ironVibeWeightColumnTitle(locale),
                    textAlign: TextAlign.center,
                    locale: Localizations.localeOf(context),
                    style: headerStyle.copyWith(
                      fontSize: 9,
                      letterSpacing: 0.15,
                      height: 1.15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    locale.repsHeader,
                    textAlign: TextAlign.center,
                    locale: Localizations.localeOf(context),
                    style: headerStyle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    locale.rirHeader,
                    textAlign: TextAlign.center,
                    locale: Localizations.localeOf(context),
                    style: headerStyle.copyWith(letterSpacing: 1.0),
                  ),
                ),
                const SizedBox(width: 8),
                const SizedBox(width: _kExerciseVolumeColumnWidth),
              ],
            ),
            ..._setDataList.map(
              (setData) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SetRow(data: setData, isCardio: false),
              ),
            ),
            const SizedBox(height: 12),
            _exerciseSetActionsRow(
              context: context,
              volumeData: _volumeMirror,
              onRemove: () => _removeHistorySet(context),
              onAdd: _addHistorySet,
              onProgress: () {
                final name = normalizeExerciseName(ex.name);
                if (name.isEmpty) return;
                final pal = IronVibePalette.of(context);
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: pal.sheetModal,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    side: BorderSide(color: pal.borderSubtle, width: 0.5),
                  ),
                  isScrollControlled: true,
                  builder: (ctx) => _ProgressBottomSheet(
                    exerciseName: name,
                    height: MediaQuery.of(context).size.height * 0.55,
                    clientName: null,
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
