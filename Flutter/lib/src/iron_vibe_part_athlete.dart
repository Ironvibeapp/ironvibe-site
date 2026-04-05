part of 'package:fitness_app/main.dart';

class AthleteScreen extends StatelessWidget {
  const AthleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SteelButton(
                      text: AppLocalizations.of(context)!.startWorkout,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WorkoutSessionScreen(),
                          ),
                        );
                      },
                      width: 280,
                      height: 70,
                      isBig: true,
                    ),
                    const SizedBox(height: 30),
                    SteelButton(
                      text: AppLocalizations.of(context)!.calendarWorkouts,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CalendarScreen()),
                        );
                      },
                      width: 280,
                      height: 50,
                    ),
                    const SizedBox(height: 30),
                    SteelButton(
                      text: AppLocalizations.of(context)!.personalProgress,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PersonalProgressScreen(),
                          ),
                        );
                      },
                      width: 280,
                      height: 50,
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

enum _WorkoutSessionExitAction { stay, discard, saveAndLeave }

class WorkoutSessionScreen extends StatefulWidget {
  const WorkoutSessionScreen({super.key});

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  final List<ExerciseData> _exercises = [];
  bool _isCardio = false;
  final ScrollController _scrollController = ScrollController();

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
            content: Text(AppLocalizations.of(context)!.fillCurrentExerciseBeforeAdd),
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

  List<ExerciseLog> _logsFromCurrentDraft() {
    final logs = <ExerciseLog>[];

    for (var ex in _exercises) {
      String name = normalizeExerciseName(ex.nameController.text);
      if (name.isEmpty) continue;

      List<SetLog> setLogs = [];
      final setsToProcess = _isCardio && ex.sets.isNotEmpty ? [ex.sets.first] : ex.sets;
      for (var s in setsToProcess) {
        if (_isCardio) {
          if (s.duration.text.trim().isNotEmpty || s.intensity.text.trim().isNotEmpty) {
            setLogs.add(SetLog('', '', '', isCardio: true, duration: s.duration.text.trim(), intensity: s.intensity.text.trim()));
          }
        } else {
          if (s.weight.text.trim().isNotEmpty ||
              s.reps.text.trim().isNotEmpty ||
              rirIndicatesMeaningfulUserChoice(s.rir.text)) {
            setLogs.add(SetLog(
              s.weight.text.trim(),
              s.reps.text.trim(),
              normalizeRirStored(s.rir.text),
            ));
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

  void _finishWorkout() {
    final logs = _logsFromCurrentDraft();
    for (var ex in _exercises) {
      final name = normalizeExerciseName(ex.nameController.text);
      if (name.isNotEmpty) {
        ex.nameController.text = name;
        ensureExerciseInBank(name);
      }
    }

    if (logs.isNotEmpty) {
      workoutHistory.add(WorkoutLog(DateTime.now(), logs));
    }

    DataService.saveData();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final hasData = _hasDraftWorkout;
    final canFinish = _canFinishWorkout;
    final pal = IronVibePalette.of(context);
    final segStrAthlete = ironVibeWorkoutTypeSegmentStyle(pal, isStrengthSegment: true, selected: !_isCardio);
    final segCarAthlete = ironVibeWorkoutTypeSegmentStyle(pal, isStrengthSegment: false, selected: _isCardio);
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
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: dpal.borderDefault, width: 0.5),
                    borderRadius: BorderRadius.zero,
                  ),
                  title: Text(
                    l.clientProfileUnsavedTitle,
                    style: TextStyle(color: dpal.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    l.clientProfileUnsavedMessage,
                    style: TextStyle(color: dpal.textSecondary),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, _WorkoutSessionExitAction.stay),
                      child: Text(l.clientProfileStay, style: TextStyle(color: dpal.textMuted)),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, _WorkoutSessionExitAction.discard),
                      child: Text(
                        l.clientProfileDiscard,
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, _WorkoutSessionExitAction.saveAndLeave),
                      child: Text(l.clientProfileSaveAndLeave, style: TextStyle(color: dpal.textPrimary, fontWeight: FontWeight.w600)),
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
            _exercises.clear();
            Navigator.of(context).pop();
            break;
          case _WorkoutSessionExitAction.saveAndLeave:
            _finishWorkout();
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
                          onTap: () => setState(() => _isCardio = false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: segStrAthlete.backgroundColor,
                              border: Border.all(color: pal.borderDefault, width: 0.5),
                              borderRadius: BorderRadius.circular(4),
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
                          onTap: () => setState(() => _isCardio = true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: segCarAthlete.backgroundColor,
                              border: Border.all(color: pal.borderDefault, width: 0.5),
                              borderRadius: BorderRadius.circular(4),
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
                          data: _exercises[index],
                          forceCardioMode: _isCardio,
                          exerciseIndex: index,
                          onDraftChanged: () => setState(() {}),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  SteelButton(
                    text: AppLocalizations.of(context)!.addExercise,
                    onPressed: _addExercise,
                    width: double.infinity,
                    height: 50,
                    fontSize: 14,
                  ),
                  const SizedBox(height: 20),
                  IgnorePointer(
                    ignoring: !canFinish,
                    child: Opacity(
                      opacity: canFinish ? 1.0 : 0.45,
                      child: SteelButton(
                        text: AppLocalizations.of(context)!.finishWorkout,
                        onPressed: _finishWorkout,
                        width: double.infinity,
                        height: 70,
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
    return [l.monthJanuary, l.monthFebruary, l.monthMarch, l.monthApril, l.monthMay, l.monthJune, l.monthJuly, l.monthAugust, l.monthSeptember, l.monthOctober, l.monthNovember, l.monthDecember];
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

  int _daysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  int _firstWeekdayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday;
  }

  List<WorkoutLog> _getWorkoutsForDate(DateTime date) {
    final list = workoutHistory.where((w) =>
        w.date.year == date.year &&
        w.date.month == date.month &&
        w.date.day == date.day).toList();
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextButton(
                  onPressed: _openDatePicker,
                  style: TextButton.styleFrom(
                    foregroundColor: pal.textPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  ),
                  child: Text(
                    '${_monthNames(context)[_focusedMonth.month - 1]} ${_focusedMonth.year}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: pal.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildCalendarGrid(),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              sliver: SliverToBoxAdapter(
                child: workouts.isEmpty
                    ? const SizedBox.shrink()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (int i = 0; i < workouts.length; i++) ...[
                            if (i > 0) const SizedBox(height: 12),
                            _buildWorkoutAccordion(context, workouts[i], i + 1),
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
    final year = _focusedMonth.year;
    final month = _focusedMonth.month;
    final daysCount = _daysInMonth(_focusedMonth);
    final firstWeekday = _firstWeekdayOfMonth(_focusedMonth);
    final emptyCells = firstWeekday - 1;
    final totalCells = emptyCells + daysCount;

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Center(
        child: SizedBox(
          width: kIronVibeCalendarGridWidth,
          height: kIronVibeCalendarGridHeight,
          child: GridView.builder(
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
              final date = DateTime(year, month, day);
              final hasWorkout = _getWorkoutsForDate(date).isNotEmpty;
              final isSelected = date.year == _selectedDate.year &&
                  date.month == _selectedDate.month &&
                  date.day == _selectedDate.day;

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
          ),
        ),
      ),
    );
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
              workout: workout,
              exerciseIndex: exIndex,
              onDataChanged: () => setState(() {}),
            ),
          );
        }),
        const SizedBox(height: 20),
        SteelButton(
          text: AppLocalizations.of(context)!.deleteWorkout,
          textColor: Colors.redAccent,
          onPressed: () {
            showDialog(
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
                    AppLocalizations.of(ctx)!.deleteWorkoutTitle,
                    style: TextStyle(color: pal.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    AppLocalizations.of(ctx)!.deleteWorkoutMsg,
                    style: TextStyle(color: pal.textSecondary),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: Text(AppLocalizations.of(ctx)!.cancel, style: TextStyle(color: pal.textMuted)),
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
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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

  Widget _buildWorkoutAccordion(BuildContext context, WorkoutLog workout, int number) {
    final locale = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final timeStr = '${workout.date.hour.toString().padLeft(2, '0')}:${workout.date.minute.toString().padLeft(2, '0')}';
    final exerciseCount = workout.exercises.length;
    final title = '${locale.workoutNumberPrefix}$number · $timeStr · $exerciseCount';
    return Container(
      decoration: BoxDecoration(
        color: pal.card,
        border: Border.all(color: pal.borderSubtle, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: false,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
          children: [
            _buildWorkoutCardContent(workout),
          ],
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
    required this.workout,
    required this.exerciseIndex,
    required this.onDataChanged,
  });

  @override
  State<_EditableHistoryExerciseBlock> createState() => _EditableHistoryExerciseBlockState();
}

class _EditableHistoryExerciseBlockState extends State<_EditableHistoryExerciseBlock> {
  late List<SetData> _setDataList;
  late ExerciseLog _exercise;
  /// Те же подходы, что в UI; для подсчёта объёма как в активной тренировке ([_ExerciseVolumeSummary]).
  late ExerciseData _volumeMirror;

  @override
  void initState() {
    super.initState();
    _exercise = widget.workout.exercises[widget.exerciseIndex];
    _setDataList = _exercise.sets.map((s) => SetData(w: s.weight, r: s.reps, ri: s.rir, d: s.duration, i: s.intensity)).toList();
    for (int i = 0; i < _setDataList.length; i++) {
      final d = _setDataList[i];
      final idx = i;
      d.weight.addListener(() => _persistSet(idx, d));
      d.reps.addListener(() => _persistSet(idx, d));
      d.rir.addListener(() => _persistSet(idx, d));
      d.duration.addListener(() => _persistSet(idx, d));
      d.intensity.addListener(() => _persistSet(idx, d));
    }
    _volumeMirror = ExerciseData(name: _exercise.name, sets: _setDataList, isCardio: false);
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
    final hasData = lastData.weight.text.trim().isNotEmpty ||
        lastData.reps.text.trim().isNotEmpty ||
        rirIndicatesMeaningfulUserChoice(lastData.rir.text) ||
        lastData.duration.text.trim().isNotEmpty ||
        lastData.intensity.text.trim().isNotEmpty;

    if (hasData) {
      final locale = AppLocalizations.of(context)!;
      final confirm = await showDialog<bool>(
            context: context,
            builder: (ctx) {
              final dpal = IronVibePalette.of(ctx);
              return AlertDialog(
                backgroundColor: dpal.dialog,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: dpal.borderDefault, width: 0.5),
                  borderRadius: BorderRadius.zero,
                ),
                title: Text(
                  locale.deleteWorkoutTitle,
                  style: TextStyle(color: dpal.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                content: Text(
                  locale.removeSetWithDataConfirm,
                  style: TextStyle(color: dpal.textSecondary),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(locale.cancel, style: TextStyle(color: dpal.textMuted)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(
                      locale.yesDelete,
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
    DataService.saveData();
    widget.onDataChanged();
  }

  void _persistSet(int setIndex, SetData d) {
    if (widget.exerciseIndex >= widget.workout.exercises.length) return;
    final sets = widget.workout.exercises[widget.exerciseIndex].sets;
    if (setIndex >= sets.length) return;
    final isCardio = _exercise.isCardio || (sets.isNotEmpty && sets.first.isCardio);
    if (isCardio) {
      sets[setIndex] = SetLog('', '', '', isCardio: true, duration: d.duration.text, intensity: d.intensity.text);
    } else {
      sets[setIndex] = SetLog(d.weight.text, d.reps.text, normalizeRirStored(d.rir.text));
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
    final isCardio = ex.isCardio || (ex.sets.isNotEmpty && ex.sets.first.isCardio);
    final locale = AppLocalizations.of(context)!;
    final pal = IronVibePalette.of(context);
    final headerStyle = TextStyle(
      color: pal.textMuted,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onLongPress: () async {
            if (ex.name.trim().isEmpty) return;
            await showRenameExerciseDialog(context, ex.name, (_) => widget.onDataChanged());
          },
          child: Text(
            ex.name.trim().isEmpty
                ? locale.exerciseNumberedTitle(widget.exerciseIndex + 1)
                : locale.exerciseNumberedTitleWithName(widget.exerciseIndex + 1, ex.name.trim()),
            style: TextStyle(
              color: pal.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
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
            child: SetRow(data: _setDataList.isNotEmpty ? _setDataList.first : SetData(d: '', i: ''), isCardio: true),
          ),
        ] else ...[
          Row(
            children: [
              Expanded(
                  child: Text(
                      ironVibeWeightColumnTitle(locale),
                      textAlign: TextAlign.center,
                      locale: Localizations.localeOf(context),
                      style: headerStyle.copyWith(fontSize: 9, letterSpacing: 0.15, height: 1.15),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)),
              const SizedBox(width: 8),
              Expanded(child: Text(locale.repsHeader, textAlign: TextAlign.center, locale: Localizations.localeOf(context), style: headerStyle)),
              const SizedBox(width: 8),
              Expanded(child: Text(locale.rirHeader, textAlign: TextAlign.center, locale: Localizations.localeOf(context), style: headerStyle.copyWith(letterSpacing: 1.0))),
              const SizedBox(width: 8),
              const SizedBox(width: 80),
            ],
          ),
          ..._setDataList.map((setData) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SetRow(data: setData, isCardio: false),
              )),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: _SetIconButton(
                    icon: Icons.remove,
                    onTap: () => _removeHistorySet(context),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Center(
                  child: _SetIconButton(
                    icon: Icons.add,
                    onTap: _addHistorySet,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ProgressButton(
                  onTap: () {
                    final name = normalizeExerciseName(ex.name);
                    if (name.isEmpty) return;
                    final pal = IronVibePalette.of(context);
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: pal.sheetModal,
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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
              ),
              const SizedBox(width: 8),
              _ExerciseVolumeSummary(data: _volumeMirror),
            ],
          ),
        ],
      ],
    );
  }
}
