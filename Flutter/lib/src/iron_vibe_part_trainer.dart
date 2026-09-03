part of 'package:fitness_app/main.dart';

String ironVibeRelativeSessionWhen(BuildContext context, DateTime dt) {
  final l = AppLocalizations.of(context)!;
  final today = ironVibeDateOnly(DateTime.now());
  final day = ironVibeDateOnly(dt);
  final diff = day.difference(today).inDays;
  if (diff == 0) return l.clientSessionToday;
  if (diff == -1) return l.clientSessionYesterday;
  if (diff == 1) return l.clientSessionTomorrow;
  if (diff < 0) return l.clientSessionDaysAgo(-diff);
  return l.clientSessionInDays(diff);
}

String ironVibeTrainerSessionSubtitle(
  BuildContext context,
  TrainerSession session,
) {
  final l = AppLocalizations.of(context)!;
  if (session.isImportedHistory) {
    final vol = ironVibeWorkoutVolumeLabel(l, session.exercises);
    return '${l.importedHistoryBadge} · $vol';
  }
  if (!ironVibeTrainerSessionIsCompleted(session)) return '';
  return ironVibeWorkoutVolumeLabel(l, session.exercises);
}

IconData ironVibeTrainerSessionStatusIcon(TrainerSession session) {
  final today = ironVibeDateOnly(DateTime.now());
  final day = ironVibeDateOnly(session.dateTime);
  if (day.isAfter(today)) return Icons.hourglass_empty_rounded;
  if (ironVibeTrainerSessionIsCompleted(session)) {
    return Icons.check_rounded;
  }
  if (session.isLiveCurrent) return Icons.play_arrow_rounded;
  return Icons.hourglass_empty_rounded;
}

Future<void> ironVibeOpenTrainerSession(
  BuildContext context,
  TrainerSession session, {
  TrainerSessionUiMode? mode,
}) {
  final resolved = mode ?? ironVibeTrainerSessionUiMode(session);
  return Navigator.push<void>(
    context,
    MaterialPageRoute(
      builder: (_) => TrainerWorkoutSessionScreen(
        session: session,
        mode: resolved,
        previousSetsAsHints: resolved != TrainerSessionUiMode.history,
      ),
    ),
  );
}

Future<bool> ironVibeConfirmDeleteTrainerSessionDialog(
  BuildContext context, {
  required bool scheduledNotLogged,
}) async {
  final l = AppLocalizations.of(context)!;
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final pal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: pal.dialog,
        shape: ironVibeDialogShape(pal),
        title: Text(
          scheduledNotLogged ? l.deleteTraining : l.deleteWorkoutTitle,
          style: TextStyle(
            color: pal.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          scheduledNotLogged ? l.deleteTrainingQuestion : l.deleteWorkoutMsg,
          style: TextStyle(color: pal.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.cancel, style: TextStyle(color: pal.textMuted)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l.delete,
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
  return result == true;
}

Widget _ironVibeTrainerSectionTitle(BuildContext context, String title) {
  final pal = IronVibePalette.of(context);
  return Align(
    alignment: Alignment.centerLeft,
    child: Row(
      children: [
        Container(
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: kIronVibeAccent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            ironVibeSentenceCase(title),
            style: TextStyle(
              color: pal.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.15,
            ),
          ),
        ),
      ],
    ),
  );
}

class TrainerScreen extends StatefulWidget {
  const TrainerScreen({super.key});

  @override
  State<TrainerScreen> createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen> {
  DateTime _focusedMonth = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ironVibePurgeExpiredUnloggedTrainerSessionsAndSave();
      if (mounted) setState(() {});
    });
  }

  Future<void> _addSession() async {
    if (clients.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) {
          final pal = IronVibePalette.of(ctx);
          return AlertDialog(
            backgroundColor: pal.dialog,
            shape: ironVibeDialogShape(pal),
            title: Text(
              AppLocalizations.of(ctx)!.noClientsTitle,
              style: TextStyle(color: pal.textPrimary),
            ),
            content: Text(
              AppLocalizations.of(ctx)!.noClientsMsg,
              style: TextStyle(color: pal.textSecondary),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(
                  AppLocalizations.of(ctx)!.ok,
                  style: TextStyle(color: pal.textPrimary),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    Client? selectedClient;
    final now = DateTime.now();
    final isToday = ironVibeIsSameCalendarDay(_selectedDate, now);
    TimeOfDay selectedTime = isToday
        ? TimeOfDay(hour: now.hour, minute: now.minute)
        : const TimeOfDay(hour: 12, minute: 0);
    String note = '';
    var repeatLast = false;

    final created = await showDialog<TrainerSession>(
      context: context,
      builder: (dialogCtx) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final pal = IronVibePalette.of(context);
            final l = AppLocalizations.of(context)!;
            final canRepeat =
                selectedClient != null &&
                ironVibeLastRepeatableTrainerSession(selectedClient!.name) !=
                    null;
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
                    DropdownButtonFormField<Client>(
                      key: ValueKey(selectedClient?.name ?? 'none'),
                      initialValue: selectedClient,
                      dropdownColor: pal.dropdown,
                      style: TextStyle(color: pal.textPrimary),
                      decoration: InputDecoration(
                        labelText: l.clientLabel,
                        labelStyle: TextStyle(color: pal.textMuted),
                        hintText: l.addSessionPickClient,
                        hintStyle: TextStyle(color: pal.textHint),
                      ),
                      items: clients.map((c) {
                        return DropdownMenuItem(
                          value: c,
                          child: Text(
                            c.name,
                            style: TextStyle(color: pal.textPrimary),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setDialogState(() {
                          selectedClient = val;
                          if (val == null ||
                              ironVibeLastRepeatableTrainerSession(val.name) ==
                                  null) {
                            repeatLast = false;
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 15),
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
                          border: Border.all(
                            color: pal.borderSubtle,
                            width: 0.5,
                          ),
                          color: pal.inputFill,
                          borderRadius: BorderRadius.circular(
                            kIronVibeRadiusField,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l.time,
                              style: TextStyle(color: pal.textMuted),
                            ),
                            Text(
                              '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                color: pal.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      style: TextStyle(color: pal.textPrimary),
                      decoration: InputDecoration(
                        labelText: l.noteLabel,
                        labelStyle: TextStyle(color: pal.textMuted),
                        filled: true,
                        fillColor: pal.inputFill,
                      ),
                      onChanged: (val) => note = val,
                    ),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        l.repeatLastWorkout,
                        style: TextStyle(
                          color: canRepeat ? pal.textPrimary : pal.textMuted,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      value: repeatLast && canRepeat,
                      activeThumbColor: kIronVibeAccent,
                      onChanged: canRepeat
                          ? (val) => setDialogState(() => repeatLast = val)
                          : null,
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
                  onPressed: selectedClient == null
                      ? null
                      : () {
                          final client = selectedClient!;
                          List<ExerciseLog>? plan;
                          if (repeatLast) {
                            final last = ironVibeLastRepeatableTrainerSession(
                              client.name,
                            );
                            if (last == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l.repeatLastUnavailable),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                              return;
                            }
                            plan = ironVibeTrainerPlanLogsFrom(last);
                          }
                          final dateTime = DateTime(
                            _selectedDate.year,
                            _selectedDate.month,
                            _selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                          final session = ironVibeNewTrainerSession(
                            dateTime: dateTime,
                            clientName: client.name,
                            clientId: client.id,
                            note: note.trim(),
                            exercises: plan,
                            isScheduledPlan: true,
                          );
                          setState(() {
                            trainerSchedule.add(session);
                          });
                          DataService.saveData();
                          Navigator.pop(context, session);
                        },
                  child: Text(
                    l.add,
                    style: TextStyle(
                      color: selectedClient == null
                          ? pal.textMuted
                          : pal.textPrimary,
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
    if (mounted && created != null) setState(() {});
  }

  List<TrainerSession> _getSessionsForDate(DateTime date) {
    return trainerSchedule
        .where((s) => ironVibeIsSameCalendarDay(s.dateTime, date))
        .toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  bool _hasSession(DateTime date) {
    return trainerSchedule.any(
      (s) => ironVibeIsSameCalendarDay(s.dateTime, date),
    );
  }

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

  Future<void> _pickMonthYear() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
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

  int _daysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  int _firstWeekdayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday;
  }

  Future<void> _openClients() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ClientListScreen()),
    );
    if (mounted) setState(() {});
  }

  Future<void> _openSession(TrainerSession session) async {
    final today = ironVibeDateOnly(DateTime.now());
    final day = ironVibeDateOnly(session.dateTime);

    if (ironVibeTrainerSessionIsCompleted(session)) {
      await ironVibeOpenTrainerSession(
        context,
        session,
        mode: TrainerSessionUiMode.history,
      );
      if (mounted) setState(() {});
      return;
    }

    if (day.isAfter(today)) {
      await ironVibeOpenTrainerSession(
        context,
        session,
        mode: TrainerSessionUiMode.plan,
      );
    } else {
      ironVibeMarkTrainerSessionLiveCurrent(session);
      await DataService.saveData();
      if (!mounted) return;
      await ironVibeOpenTrainerSession(
        context,
        session,
        mode: TrainerSessionUiMode.live,
      );
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sessions = _getSessionsForDate(_selectedDate);
    final pal = IronVibePalette.of(context);
    final l = AppLocalizations.of(context)!;

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
                  trailing: _ironVibeHeaderIconButton(
                    context,
                    icon: Icons.bar_chart,
                    onPressed: () => _showStatistics(context, true),
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
                  onPressed: _pickMonthYear,
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
            SliverToBoxAdapter(child: _buildCalendar()),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IronVibeNavTile(
                      icon: Icons.groups_rounded,
                      label: ironVibeSentenceCase(l.clientsMenu),
                      horizontal: true,
                      onPressed: _openClients,
                    ),
                    const SizedBox(height: 14),
                    IronVibePrimaryCta(
                      label: ironVibeSentenceCase(l.addTraining),
                      icon: Icons.add_rounded,
                      onPressed: _addSession,
                    ),
                    const SizedBox(height: 28),
                    Text(
                      '${_selectedDate.day} ${_monthNames(context)[_selectedDate.month - 1]} ${_selectedDate.year}',
                      style: TextStyle(
                        color: pal.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (sessions.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            l.noEntries,
                            style: TextStyle(color: pal.textMuted),
                          ),
                        ),
                      )
                    else
                      for (final session in sessions)
                        _TrainerSessionCard(
                          session: session,
                          showClientName: true,
                          onTap: () => _openSession(session),
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

  Widget _buildCalendar() {
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
    final daysInMonth = _daysInMonth(month);
    final firstWeekday = _firstWeekdayOfMonth(month);
    final emptyCells = firstWeekday - 1;
    final totalCells = emptyCells + daysInMonth;

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
        if (index < emptyCells) return const SizedBox.shrink();

        final day = index - emptyCells + 1;
        final date = DateTime(year, monthNumber, day);
        final isSelected = ironVibeIsSameCalendarDay(date, _selectedDate);
        final hasSession = _hasSession(date);

        return _ironVibeCalendarDayCell(
          context,
          day: day,
          isSelected: isSelected,
          hasMark: hasSession,
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
        );
      },
    );
  }
}

class _TrainerSessionCard extends StatelessWidget {
  final TrainerSession session;
  final bool showClientName;
  final VoidCallback onTap;
  final String? customTitle;

  const _TrainerSessionCard({
    required this.session,
    required this.onTap,
    this.showClientName = false,
    this.customTitle,
  });

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final timeStr =
        '${session.dateTime.hour.toString().padLeft(2, '0')}:${session.dateTime.minute.toString().padLeft(2, '0')}';
    final subtitle = ironVibeTrainerSessionSubtitle(context, session);
    final title =
        customTitle ?? (showClientName ? session.clientName : timeStr);
    final String detail;
    if (customTitle != null) {
      detail = subtitle;
    } else if (showClientName) {
      detail = subtitle.isEmpty ? timeStr : '$timeStr · $subtitle';
    } else {
      detail = subtitle;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IronVibePressScale(
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
          decoration: ironVibeElevatedCardDecoration(pal),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: pal.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (detail.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        detail,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: pal.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                    if (session.note.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        session.note,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: pal.textMuted, fontSize: 12),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                ironVibeTrainerSessionStatusIcon(session),
                size: 24,
                color: pal.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainerSessionEditor extends StatefulWidget {
  final TrainerSession session;
  final TrainerSessionUiMode mode;
  final ScrollController? hostScrollController;
  final ActiveWorkoutDraft? restoredDraft;
  final bool previousSetsAsHints;
  final VoidCallback? onChanged;

  const TrainerSessionEditor({
    super.key,
    required this.session,
    required this.mode,
    this.hostScrollController,
    this.restoredDraft,
    this.previousSetsAsHints = false,
    this.onChanged,
  });

  @override
  State<TrainerSessionEditor> createState() => _TrainerSessionEditorState();
}

class _TrainerSessionEditorState extends State<TrainerSessionEditor>
    with WidgetsBindingObserver, IronVibeWorkoutAutoSave {
  late List<ExerciseData> _exercises;
  late bool _isCardio;
  late final TextEditingController _noteController;
  bool _suppressPersist = false;
  bool _planDirty = false;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.session.note);
    _noteController.addListener(_markPlanDirty);
    if (widget.restoredDraft != null) {
      _isCardio = widget.restoredDraft!.isCardio;
      _exercises = ironVibeExerciseListFromDraftJson(
        widget.restoredDraft!.exercisesJson,
      );
    } else if (widget.session.exercises.isEmpty) {
      _exercises = [];
      _isCardio = false;
    } else {
      _isCardio = widget.session.exercises.first.isCardio;
      _exercises = widget.session.exercises.map(_dataForLog).toList();
    }
    if (widget.mode == TrainerSessionUiMode.live) {
      ironVibeStartWorkoutAutoSave(flushDraft: _flushAutoSaveDraft);
    }
  }

  @override
  void dispose() {
    if (!_suppressPersist) {
      if (widget.mode == TrainerSessionUiMode.plan) {
        widget.session.isLiveCurrent = false;
        widget.session.isCompleted = false;
        persistToSession(keepPlanPlaceholders: true);
        unawaited(DataService.saveData());
      } else if (widget.mode == TrainerSessionUiMode.history) {
        persistToSession(keepPlanPlaceholders: false);
        unawaited(DataService.saveData());
      }
    }
    _noteController.dispose();
    super.dispose();
  }

  ExerciseData _dataForLog(ExerciseLog log) {
    if (widget.mode == TrainerSessionUiMode.history || log.isCardio) {
      return ironVibeExerciseDataFromLog(log);
    }
    if (ironVibeExerciseLogHasLoggedData(log) || !widget.previousSetsAsHints) {
      return ironVibeExerciseDataFromLog(log);
    }
    final last = ironVibeLastExerciseLogFor(
      log.name,
      clientName: widget.session.clientName,
      excludeSession: widget.session,
    );
    return ironVibeExerciseDataPlannedWithHints(planned: log, lastLogged: last);
  }

  void _flushAutoSaveDraft() {
    if (!hasDraftWorkout) return;
    _draftWrite = DataService.saveActiveWorkoutDraft(
      ActiveWorkoutDraft(
        kind: ActiveWorkoutDraftKind.trainer,
        sessionId: widget.session.id,
        clientName: widget.session.clientName,
        clientId: widget.session.clientId,
        sessionDateTime: widget.session.dateTime,
        sessionNote: _noteController.text.trim(),
        isCardio: _isCardio,
        exercisesJson: ironVibeExerciseListToDraftJson(_exercises),
        savedAt: DateTime.now(),
      ),
    );
  }

  Future<void>? _draftWrite;

  Future<void> _clearAutoSaveDraft() async {
    ironVibeStopWorkoutAutoSave();
    await _draftWrite;
    await DataService.clearActiveWorkoutDraft();
  }

  void _markPlanDirty() {
    if (widget.mode != TrainerSessionUiMode.plan) return;
    if (_planDirty) return;
    _planDirty = true;
    if (mounted) setState(() {});
  }

  void _notifyChanged() {
    _markPlanDirty();
    setState(() {});
    widget.onChanged?.call();
  }

  void _scrollHostToEnd() {
    final c = widget.hostScrollController;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (c != null && c.hasClients) {
        c.animateTo(
          c.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  bool get hasDraftWorkout => _exercises.isNotEmpty || _hasAnyInput;

  bool get canSaveWorkout => _logsFromCurrentDraft().isNotEmpty;

  bool get _hasAnyInput {
    if (_noteController.text.trim() != widget.session.note) return true;
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

  IronVibeSessionPrHighlight _sessionPrHighlightForExercise(int index) {
    if (index < 0 || index >= _exercises.length) {
      return IronVibeSessionPrHighlight.none;
    }
    if (widget.mode == TrainerSessionUiMode.history) {
      return IronVibeSessionPrHighlight.none;
    }
    final ex = _exercises[index];
    final clientSessions = trainerSchedule.where(
      (s) =>
          ironVibeSessionBelongsToClient(
            s,
            clientName: widget.session.clientName,
            clientId: widget.session.clientId,
          ) &&
          ironVibeTrainerSessionCountsAsWork(s),
    );
    return ironVibeSessionPrHighlightForDraft(
      normalizedExerciseName: ex.nameController.text,
      sessionIsCardio: _isCardio,
      sets: ex.sets,
      athleteHistory: null,
      clientSessions: clientSessions,
      excludeTrainerSession: widget.session,
    );
  }

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
    _markPlanDirty();
    widget.onChanged?.call();
    _scrollHostToEnd();
  }

  void _removeExercise(int index) {
    if (index < 0 || index >= _exercises.length) return;
    setState(() {
      _exercises.removeAt(index);
    });
    _markPlanDirty();
    widget.onChanged?.call();
  }

  List<ExerciseLog> _logsFromCurrentDraft({bool keepPlanPlaceholders = false}) {
    final logs = <ExerciseLog>[];

    for (final ex in _exercises) {
      final name = normalizeExerciseName(ex.nameController.text);
      if (name.isEmpty) continue;
      ex.nameController.text = name;

      final setsToProcess = _isCardio && ex.sets.isNotEmpty
          ? [ex.sets.first]
          : ex.sets;

      if (keepPlanPlaceholders) {
        if (_isCardio) {
          final s = setsToProcess.isNotEmpty ? setsToProcess.first : null;
          logs.add(
            ExerciseLog(name, [
              SetLog(
                '',
                '',
                '',
                isCardio: true,
                duration: s?.duration.text.trim() ?? '',
                intensity: s?.intensity.text.trim() ?? '',
              ),
            ], isCardio: true),
          );
        } else {
          final n = math.max(1, setsToProcess.length);
          logs.add(
            ExerciseLog(
              name,
              List<SetLog>.generate(n, (i) {
                if (i >= setsToProcess.length) return SetLog('', '', '0');
                final s = setsToProcess[i];
                return SetLog(
                  s.weight.text.trim(),
                  s.reps.text.trim(),
                  normalizeRirStored(s.rir.text),
                );
              }),
            ),
          );
        }
        continue;
      }

      final setLogs = <SetLog>[];
      for (final s in setsToProcess) {
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

  List<SetLog> _setLogsFromExerciseData(ExerciseData ex) {
    final setLogs = <SetLog>[];
    final setsToProcess = _isCardio && ex.sets.isNotEmpty
        ? [ex.sets.first]
        : ex.sets;
    for (final s in setsToProcess) {
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
    return setLogs;
  }

  Future<void> _reassignExerciseNameAt(int index) async {
    if (index < 0 || index >= _exercises.length) return;
    final picked = await showExerciseReassignPickerDialog(
      context,
      initialName: _exercises[index].nameController.text,
    );
    if (!mounted) return;
    if (picked == null) return;
    final n = normalizeExerciseName(picked);
    if (n.isEmpty) return;

    final draft = _exercises[index];
    final setLogs = _setLogsFromExerciseData(draft);

    setState(() {
      draft.nameController.text = n;
      if (ironVibeTrainerSessionIsCompleted(widget.session) &&
          !widget.session.isImportedHistory) {
        ensureExerciseInBank(n);
      }
      if (widget.previousSetsAsHints && !_isCardio) {
        ironVibeApplyClientPreviousSetHints(
          data: draft,
          clientName: widget.session.clientName,
          excludeSession: widget.session,
        );
      }
      if (index < widget.session.exercises.length) {
        final old = widget.session.exercises[index];
        widget.session.exercises[index] = ExerciseLog(
          n,
          setLogs.isNotEmpty ? setLogs : old.sets,
          isCardio: _isCardio,
        );
      }
    });
    await DataService.saveData();
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
    widget.onChanged?.call();
  }

  void persistToSession({required bool keepPlanPlaceholders}) {
    widget.session.note = _noteController.text.trim();
    widget.session.exercises = _logsFromCurrentDraft(
      keepPlanPlaceholders: keepPlanPlaceholders,
    );
    ironVibeSyncTrainerSessionInSchedule(widget.session);
  }

  Future<void> _saveSession({bool celebrate = false}) async {
    final hasLogged = _logsFromCurrentDraft().isNotEmpty;
    persistToSession(keepPlanPlaceholders: false);
    await _clearAutoSaveDraft();
    if (hasLogged && !_isStrictlyFutureSession()) {
      widget.session.isLiveCurrent = false;
      widget.session.isCompleted = true;
      widget.session.isScheduledPlan = false;
      ironVibeSyncTrainerSessionInSchedule(widget.session);
      for (final log in widget.session.exercises) {
        if (ironVibeExerciseLogHasLoggedData(log) &&
            !widget.session.isImportedHistory) {
          ensureExerciseInBank(log.name);
        }
      }
    }
    if (ironVibeTrainerSessionIsAbandonedStub(widget.session)) {
      _suppressPersist = true;
      ironVibeRemoveTrainerSession(widget.session);
    }
    DataService.saveData();
    final didSave = widget.session.isCompleted;
    if (celebrate && didSave && mounted) {
      await ironVibeShowWorkoutComplete(context);
    }
    if (!mounted) return;
    Navigator.pop(context);
  }

  Future<void> _requestSaveSession() async {
    if (!canSaveWorkout) return;
    final ok = await ironVibeConfirmFinishWorkout(context);
    if (!ok || !mounted) return;
    await _saveSession(celebrate: true);
  }

  Future<void> saveAndExit() async {
    if (widget.mode == TrainerSessionUiMode.live) {
      if (!canSaveWorkout) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.saveWorkoutNothingToSave,
            ),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }
      await _saveSession(celebrate: true);
      return;
    }
    persistToSession(keepPlanPlaceholders: true);
    widget.session.isLiveCurrent = false;
    widget.session.isCompleted = false;
    widget.session.isScheduledPlan = true;
    ironVibeSyncTrainerSessionInSchedule(widget.session);
    await _clearAutoSaveDraft();
    if (ironVibeTrainerSessionIsAbandonedStub(widget.session)) {
      _suppressPersist = true;
      ironVibeRemoveTrainerSession(widget.session);
    }
    DataService.saveData();
    if (!mounted) return;
    Navigator.pop(context);
  }

  void persistPlanAndStay() {
    widget.session.isLiveCurrent = false;
    widget.session.isCompleted = false;
    persistToSession(keepPlanPlaceholders: true);
    DataService.saveData();
    _planDirty = false;
  }

  Future<void> persistPlanAndLeave() async {
    persistPlanAndStay();
    if (!mounted) return;
    _suppressPersist = true;
    await ironVibeShowWorkoutComplete(
      context,
      title: AppLocalizations.of(context)!.planChangesSavedTitle,
    );
    if (!mounted) return;
    Navigator.pop(context);
  }

  void persistHistoryAndStay() {
    persistToSession(keepPlanPlaceholders: false);
    DataService.saveData();
  }

  void discardAutoSavedDraft() {
    unawaited(_clearAutoSaveDraft());
  }

  bool _isStrictlyFutureSession() {
    final today = ironVibeDateOnly(DateTime.now());
    final sessionDay = ironVibeDateOnly(widget.session.dateTime);
    return sessionDay.isAfter(today);
  }

  Future<void> _deleteSession() async {
    final scheduledNotLogged =
        !ironVibeTrainerSessionIsCompleted(widget.session) ||
        _isStrictlyFutureSession();
    final confirmed = await ironVibeConfirmDeleteTrainerSessionDialog(
      context,
      scheduledNotLogged: scheduledNotLogged,
    );
    if (!confirmed || !mounted) return;
    _suppressPersist = true;
    ironVibeRemoveTrainerSession(widget.session);
    unawaited(_clearAutoSaveDraft());
    DataService.saveData();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final l = AppLocalizations.of(context)!;
    final segStrTrainer = ironVibeWorkoutTypeSegmentStyle(
      pal,
      isStrengthSegment: true,
      selected: !_isCardio,
    );
    final segCarTrainer = ironVibeWorkoutTypeSegmentStyle(
      pal,
      isStrengthSegment: false,
      selected: _isCardio,
    );
    final date = widget.session.dateTime;
    final timeStr =
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    final dateStr =
        '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.session.clientName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: pal.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$dateStr · $timeStr',
          textAlign: TextAlign.center,
          style: TextStyle(color: pal.textMuted, fontSize: 13),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _noteController,
          style: TextStyle(color: pal.textPrimary),
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: l.noteLabel,
            labelStyle: TextStyle(color: pal.textMuted),
            filled: true,
            fillColor: pal.inputFill,
          ),
          onChanged: (_) => widget.onChanged?.call(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _setSessionCardio(false),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: segStrTrainer.backgroundColor,
                    border: Border.all(color: pal.borderSubtle, width: 0.5),
                    borderRadius: BorderRadius.circular(kIronVibeRadiusSegment),
                  ),
                  child: Text(
                    l.strengthType,
                    textAlign: TextAlign.center,
                    style: segStrTrainer.labelStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () => _setSessionCardio(true),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: segCarTrainer.backgroundColor,
                    border: Border.all(color: pal.borderSubtle, width: 0.5),
                    borderRadius: BorderRadius.circular(kIronVibeRadiusSegment),
                  ),
                  child: Text(
                    l.cardioType,
                    textAlign: TextAlign.center,
                    style: segCarTrainer.labelStyle,
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
                clientNameForProgress: widget.session.clientName,
                exerciseIndex: index,
                onDraftChanged: _notifyChanged,
                sessionPrHighlight: _sessionPrHighlightForExercise(index),
                onLongPressReassignExercise: () =>
                    _reassignExerciseNameAt(index),
                onRemove: () => _removeExercise(index),
                previousSetsAsHints: widget.previousSetsAsHints,
                excludeTrainerSession: widget.session,
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        SteelButton(
          text: l.addExercise,
          icon: Icons.add_rounded,
          onPressed: _addExercise,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        if (widget.mode == TrainerSessionUiMode.live)
          IgnorePointer(
            ignoring: !canSaveWorkout,
            child: Opacity(
              opacity: canSaveWorkout ? 1.0 : 0.45,
              child: SteelButton(
                text: l.finishWorkout,
                icon: Icons.check_rounded,
                onPressed: _requestSaveSession,
                width: double.infinity,
                isBig: true,
              ),
            ),
          )
        else if (widget.mode == TrainerSessionUiMode.plan)
          IgnorePointer(
            ignoring: !_planDirty,
            child: Opacity(
              opacity: _planDirty ? 1.0 : 0.45,
              child: SteelButton(
                text: l.saveClientChanges,
                icon: Icons.check_rounded,
                onPressed: persistPlanAndLeave,
                width: double.infinity,
                isBig: true,
              ),
            ),
          ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _deleteSession,
          child: Text(
            l.deleteWorkout,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class TrainerWorkoutSessionScreen extends StatefulWidget {
  final TrainerSession session;
  final ActiveWorkoutDraft? restoredDraft;
  final bool previousSetsAsHints;
  final TrainerSessionUiMode mode;

  const TrainerWorkoutSessionScreen({
    super.key,
    required this.session,
    this.restoredDraft,
    this.previousSetsAsHints = false,
    this.mode = TrainerSessionUiMode.live,
  });

  @override
  State<TrainerWorkoutSessionScreen> createState() =>
      _TrainerWorkoutSessionScreenState();
}

enum _TrainerWorkoutSessionExitAction { stay, discard, saveAndLeave }

class _TrainerWorkoutSessionScreenState
    extends State<TrainerWorkoutSessionScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<_TrainerSessionEditorState> _editorKey =
      GlobalKey<_TrainerSessionEditorState>();

  bool get _isLive => widget.mode == TrainerSessionUiMode.live;
  bool get _isHistory => widget.mode == TrainerSessionUiMode.history;
  bool _printBusy = false;

  @override
  void initState() {
    super.initState();
    if (_isLive) ironVibeSetKeepScreenOn(true);
  }

  @override
  void dispose() {
    ironVibeSetKeepScreenOn(false);
    _scrollController.dispose();
    super.dispose();
  }

  void _persistQuietly() {
    final editor = _editorKey.currentState;
    if (editor == null) return;
    final stillScheduled = trainerSchedule.any(
      (s) => _ironVibeSameTrainerSession(s, widget.session),
    );
    if (!stillScheduled) return;
    if (widget.mode == TrainerSessionUiMode.plan) {
      editor.persistPlanAndStay();
    } else if (widget.mode == TrainerSessionUiMode.history) {
      editor.persistHistoryAndStay();
    }
  }

  Future<void> _printHistorySession() async {
    if (_printBusy) return;
    _printBusy = true;
    try {
      _editorKey.currentState?.persistHistoryAndStay();
      if (!mounted) return;
      final l = AppLocalizations.of(context)!;
      if (ironVibeSessionPrintRows(widget.session).isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.printSessionEmpty),
            duration: const Duration(seconds: 3),
          ),
        );
        return;
      }
      await ironVibeShareSessionPdf(context, widget.session);
    } finally {
      _printBusy = false;
    }
  }

  void _leaveLiveWithoutSaving() {
    _editorKey.currentState?.discardAutoSavedDraft();
    unawaited(ironVibeRevertOrDiscardLiveTrainerSession(widget.session));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final editorState = _editorKey.currentState;
    final hasData =
        editorState?.hasDraftWorkout ?? widget.session.exercises.isNotEmpty;
    return Scaffold(
      body: PopScope(
        canPop: !_isLive || !hasData,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            if (!_isLive) {
              _persistQuietly();
            } else {
              _editorKey.currentState?.discardAutoSavedDraft();
              unawaited(ironVibeDiscardAbandonedTrainerSession(widget.session));
            }
            return;
          }
          if (!_isLive) {
            _persistQuietly();
            Navigator.of(context).pop();
            return;
          }
          if (!hasData) {
            _leaveLiveWithoutSaving();
            return;
          }
          final l = AppLocalizations.of(context)!;
          final action = await showDialog<_TrainerWorkoutSessionExitAction>(
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
                    onPressed: () => Navigator.pop(
                      ctx,
                      _TrainerWorkoutSessionExitAction.stay,
                    ),
                    child: Text(
                      l.clientProfileStay,
                      style: TextStyle(color: dpal.textMuted),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(
                      ctx,
                      _TrainerWorkoutSessionExitAction.discard,
                    ),
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
                      _TrainerWorkoutSessionExitAction.saveAndLeave,
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
            case _TrainerWorkoutSessionExitAction.stay:
            case null:
              break;
            case _TrainerWorkoutSessionExitAction.discard:
              _leaveLiveWithoutSaving();
              break;
            case _TrainerWorkoutSessionExitAction.saveAndLeave:
              await _editorKey.currentState?.saveAndExit();
              break;
          }
        },
        child: SafeArea(
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
                    extent: _isLive
                        ? kIronVibePinnedHeaderExtent
                        : kIronVibePinnedHeaderExtentLogoOnly,
                    child: _ironVibeTopBarMaterial(
                      context,
                      showStopwatch: _isLive,
                      leading: _ironVibeHeaderIconButton(
                        context,
                        icon: Icons.arrow_back,
                        onPressed: () => Navigator.maybePop(context),
                      ),
                      trailing: _isHistory
                          ? _ironVibeHeaderIconButton(
                              context,
                              icon: Icons.print_outlined,
                              tooltip: AppLocalizations.of(context)!.printSession,
                              onPressed: _printHistorySession,
                            )
                          : null,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                  sliver: SliverToBoxAdapter(
                    child: TrainerSessionEditor(
                      key: _editorKey,
                      session: widget.session,
                      mode: widget.mode,
                      hostScrollController: _scrollController,
                      restoredDraft: widget.restoredDraft,
                      previousSetsAsHints: widget.previousSetsAsHints,
                      onChanged: () {
                        if (mounted) setState(() {});
                      },
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

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  State<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  void _addClient() {
    showDialog(
      context: context,
      builder: (ctx) {
        String name = '';
        String? error;
        final pal = IronVibePalette.of(ctx);
        return StatefulBuilder(
          builder: (ctx, setLocal) {
            final l = AppLocalizations.of(ctx)!;
            return AlertDialog(
              backgroundColor: pal.dialog,
              shape: ironVibeDialogShape(pal),
              title: Text(
                l.newClient,
                style: TextStyle(
                  color: pal.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    style: TextStyle(color: pal.textPrimary),
                    decoration: InputDecoration(
                      hintText: l.clientName,
                      hintStyle: TextStyle(color: pal.textHint),
                      filled: true,
                      fillColor: pal.inputFill,
                    ),
                    onChanged: (val) {
                      name = val;
                      if (error != null) setLocal(() => error = null);
                    },
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l.clientNameCannotChange,
                      style: TextStyle(
                        color: pal.textMuted,
                        fontSize: 12,
                        height: 1.35,
                      ),
                    ),
                  ),
                  if (error != null) ...[
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        error!,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 12,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(
                    l.cancel,
                    style: TextStyle(color: pal.textMuted),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final trimmed = name.trim();
                    if (trimmed.isEmpty) return;
                    if (ironVibeClientNameTaken(trimmed)) {
                      setLocal(() => error = l.clientNameTaken);
                      return;
                    }
                    setState(() {
                      clients.add(Client(trimmed, '', id: ironVibeNewEntityId()));
                    });
                    DataService.saveData();
                    Navigator.pop(ctx);
                  },
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
  }

  String _clientMeta(BuildContext context, Client client) {
    final l = AppLocalizations.of(context)!;
    final last = ironVibeLastLoggedTrainerSessionForClient(
      client.name,
      clientId: client.id,
    );
    final next = ironVibeNextTrainerSessionForClient(
      client.name,
      clientId: client.id,
    );
    final lastText = last == null
        ? l.clientNeverTrained
        : l.clientLastSession(
            ironVibeRelativeSessionWhen(context, last.dateTime),
          );
    final nextText = next == null
        ? l.clientNoUpcoming
        : l.clientNextSession(
            ironVibeRelativeSessionWhen(context, next.dateTime),
          );
    return '$lastText · $nextText';
  }

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final l = AppLocalizations.of(context)!;
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
              child: clients.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          l.trainerClientsEmpty,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: pal.textMuted, fontSize: 14),
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: clients.length,
                      itemBuilder: (context, index) {
                        final client = clients[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: IronVibePressScale(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ClientProfileScreen(client: client),
                                ),
                              );
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: ironVibeElevatedCardDecoration(pal),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    client.name,
                                    style: TextStyle(
                                      color: pal.textPrimary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (client.goal.isNotEmpty) ...[
                                    const SizedBox(height: 4),
                                    Text(
                                      client.goal,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: pal.textSecondary,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                  const SizedBox(height: 6),
                                  Text(
                                    _clientMeta(context, client),
                                    style: TextStyle(
                                      color: pal.textMuted,
                                      fontSize: 12,
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SteelButton(
                text: l.addClient,
                icon: Icons.person_add_rounded,
                onPressed: _addClient,
                width: double.infinity,
                isBig: true,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

enum _ClientProfileUnsavedAction { stay, discard, saveAndLeave }

class ClientProfileScreen extends StatefulWidget {
  final Client client;
  const ClientProfileScreen({super.key, required this.client});

  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  late TextEditingController _goalController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _goalController = TextEditingController(text: widget.client.goal);
    _weightController = TextEditingController(text: widget.client.weight);
    _heightController = TextEditingController(text: widget.client.height);
    _notesController = TextEditingController(text: widget.client.notes);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ironVibePurgeExpiredUnloggedTrainerSessionsAndSave();
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _goalController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  bool get _isDirty {
    return _goalController.text != widget.client.goal ||
        _weightController.text != widget.client.weight ||
        _heightController.text != widget.client.height ||
        _notesController.text != widget.client.notes;
  }

  void _saveChanges() {
    setState(() {
      widget.client.goal = _goalController.text;
      widget.client.weight = _weightController.text;
      widget.client.height = _heightController.text;
      widget.client.notes = _notesController.text;
    });
    DataService.saveData();
  }

  Future<_ClientProfileUnsavedAction?> _showUnsavedDialog() {
    final l = AppLocalizations.of(context)!;
    return showDialog<_ClientProfileUnsavedAction>(
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
                  Navigator.pop(ctx, _ClientProfileUnsavedAction.stay),
              child: Text(
                l.clientProfileStay,
                style: TextStyle(color: dpal.textMuted),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(ctx, _ClientProfileUnsavedAction.discard),
              child: Text(
                l.clientProfileDiscard,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pop(ctx, _ClientProfileUnsavedAction.saveAndLeave),
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
  }

  void _deleteClient() {
    showDialog(
      context: context,
      builder: (ctx) {
        final pal = IronVibePalette.of(ctx);
        return AlertDialog(
          backgroundColor: pal.dialog,
          shape: ironVibeDialogShape(pal),
          title: Text(
            AppLocalizations.of(ctx)!.deleteClientTitle,
            style: TextStyle(
              color: pal.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            AppLocalizations.of(ctx)!.deleteClientMsg,
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
                trainerSchedule.removeWhere(
                  (s) => ironVibeSessionBelongsToClientRecord(s, widget.client),
                );
                clients.remove(widget.client);
                DataService.saveData();
                Navigator.pop(ctx);
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(ctx)!.delete,
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
  }

  InputDecoration _fieldDecoration(
    IronVibePalette pal, {
    String? hint,
    String? label,
  }) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      alignLabelWithHint: hint != null,
      hintStyle: TextStyle(color: pal.textHint),
      labelStyle: TextStyle(color: pal.textMuted),
      filled: true,
      fillColor: pal.inputFill,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: pal.borderSubtle, width: 0.5),
        borderRadius: BorderRadius.circular(kIronVibeRadiusField),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kIronVibeAccent, width: 1.6),
        borderRadius: BorderRadius.circular(kIronVibeRadiusField),
      ),
    );
  }

  TrainerSession? _abandonedTodayStub() {
    final now = DateTime.now();
    for (final s in trainerSchedule) {
      if (!ironVibeSessionBelongsToClientRecord(s, widget.client)) continue;
      if (!ironVibeIsSameCalendarDay(s.dateTime, now)) continue;
      if (ironVibeTrainerSessionIsAbandonedStub(s)) return s;
    }
    return null;
  }

  Future<void> _openTodaySession({required bool repeatLast}) async {
    final l = AppLocalizations.of(context)!;
    final name = widget.client.name;
    final clientId = widget.client.id;
    TrainerSession? target =
        ironVibeLiveCurrentTrainerSessionForClient(name, clientId: clientId) ??
        ironVibeTodaysIncompleteTrainerSessionForClient(
          name,
          clientId: clientId,
        ) ??
        _abandonedTodayStub();

    if (repeatLast) {
      final last = ironVibeLastRepeatableTrainerSession(
        name,
        clientId: clientId,
      );
      if (last == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.repeatLastUnavailable),
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }
      if (target != null) {
        if (!ironVibeTrainerSessionHasLoggedData(target)) {
          target.exercises = ironVibeTrainerPlanLogsFrom(last);
        }
      } else {
        target = ironVibeNewTrainerSession(
          dateTime: DateTime.now(),
          clientName: name,
          clientId: clientId,
          exercises: ironVibeTrainerPlanLogsFrom(last),
        );
        trainerSchedule.add(target);
      }
    } else if (target == null) {
      target = ironVibeNewTrainerSession(
        dateTime: DateTime.now(),
        clientName: name,
        clientId: clientId,
      );
      trainerSchedule.add(target);
    }

    ironVibeMarkTrainerSessionLiveCurrent(target);
    await DataService.saveData();
    if (!mounted) return;
    await ironVibeOpenTrainerSession(
      context,
      target,
      mode: TrainerSessionUiMode.live,
    );
    if (mounted) setState(() {});
  }

  String _trainerHistoryMonthKey(BuildContext context, DateTime dt) {
    final l = AppLocalizations.of(context)!;
    final months = [
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
    return '${ironVibeSentenceCase(months[dt.month - 1])} ${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    final history =
        trainerSchedule
            .where((s) => ironVibeSessionBelongsToClientRecord(s, widget.client))
            .where(ironVibeTrainerSessionInClientHistory)
            .toList()
          ..sort((a, b) => b.dateTime.compareTo(a.dateTime));

    final groupedHistory = <String, List<TrainerSession>>{};
    for (final session in history) {
      final key = _trainerHistoryMonthKey(context, session.dateTime);
      groupedHistory.putIfAbsent(key, () => []).add(session);
    }

    final pal = IronVibePalette.of(context);
    final l = AppLocalizations.of(context)!;
    final dirty = _isDirty;
    final last = ironVibeLastLoggedTrainerSessionForClient(
      widget.client.name,
      clientId: widget.client.id,
    );
    final next = ironVibeNextTrainerSessionForClient(
      widget.client.name,
      clientId: widget.client.id,
    );
    final canRepeat =
        ironVibeLastRepeatableTrainerSession(
          widget.client.name,
          clientId: widget.client.id,
        ) !=
        null;
    final rhythm = ironVibeComputeRhythmFor(clientName: widget.client.name);

    return PopScope(
      canPop: !dirty,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final action = await _showUnsavedDialog();
        if (!context.mounted) return;
        final nav = Navigator.of(context);
        switch (action) {
          case _ClientProfileUnsavedAction.stay:
          case null:
            break;
          case _ClientProfileUnsavedAction.discard:
            nav.pop();
            break;
          case _ClientProfileUnsavedAction.saveAndLeave:
            if (!context.mounted) return;
            _saveChanges();
            if (!context.mounted) return;
            nav.pop();
            break;
        }
      },
      child: Scaffold(
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
                  onPressed: () => Navigator.maybePop(context),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  children: [
                    Text(
                      widget.client.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: pal.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      last == null
                          ? l.clientNeverTrained
                          : l.clientLastSession(
                              ironVibeRelativeSessionWhen(
                                context,
                                last.dateTime,
                              ),
                            ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: pal.textSecondary, fontSize: 13),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      next == null
                          ? l.clientNoUpcoming
                          : l.clientNextSession(
                              ironVibeRelativeSessionWhen(
                                context,
                                next.dateTime,
                              ),
                            ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: pal.textMuted, fontSize: 13),
                    ),
                    const SizedBox(height: 20),
                    if (rhythm.hasGauge) ...[
                      IronVibeRhythmCard(
                        snapshot: rhythm,
                        onTap: () => ironVibeOpenRhythmInsight(
                          context,
                          clientName: widget.client.name,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    IronVibePrimaryCta(
                      label: ironVibeSentenceCase(l.startWorkout),
                      icon: Icons.play_arrow_rounded,
                      onPressed: () => _openTodaySession(repeatLast: false),
                    ),
                    if (canRepeat) ...[
                      const SizedBox(height: 12),
                      IronVibeSecondaryCta(
                        label: ironVibeSentenceCase(l.repeatLastWorkout),
                        icon: Icons.replay_rounded,
                        onPressed: () => _openTodaySession(repeatLast: true),
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 12,
                      ),
                      child: ironVibeFadeRule(pal),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: IronVibeNavTile(
                              icon: Icons.show_chart_rounded,
                              label: ironVibeSentenceCase(l.personalProgress),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PersonalProgressScreen(
                                          clientName: widget.client.name,
                                        ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: IronVibeNavTile(
                              icon: Icons.star_rounded,
                              label: ironVibeSentenceCase(l.favoriteExercises),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FavoriteExercisesScreen(
                                          clientName: widget.client.name,
                                        ),
                                  ),
                                );
                                if (mounted) setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    _ironVibeTrainerSectionTitle(
                      context,
                      l.clientProfileDetails,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _goalController,
                      style: TextStyle(color: pal.textPrimary),
                      minLines: 3,
                      maxLines: 8,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: _fieldDecoration(pal, hint: l.clientGoal),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _weightController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            style: TextStyle(color: pal.textPrimary),
                            decoration: _fieldDecoration(
                              pal,
                              label: l.clientWeight,
                            ),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            controller: _heightController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            style: TextStyle(color: pal.textPrimary),
                            decoration: _fieldDecoration(
                              pal,
                              label: l.clientHeight,
                            ),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _notesController,
                      style: TextStyle(color: pal.textPrimary),
                      minLines: 2,
                      maxLines: 5,
                      decoration: _fieldDecoration(
                        pal,
                        hint: l.clientTrainerNotesHint,
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 16),
                    IgnorePointer(
                      ignoring: !dirty,
                      child: Opacity(
                        opacity: dirty ? 1.0 : 0.45,
                        child: SteelButton(
                          text: l.saveClientChanges,
                          icon: Icons.check_rounded,
                          width: double.infinity,
                          isBig: true,
                          onPressed: _saveChanges,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    _ironVibeTrainerSectionTitle(
                      context,
                      l.clientProfileSectionWorkoutHistory,
                    ),
                    const SizedBox(height: 10),
                    if (groupedHistory.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          l.clientWorkoutHistoryEmpty,
                          style: TextStyle(color: pal.textMuted),
                        ),
                      )
                    else
                      for (final monthKey in groupedHistory.keys) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            monthKey,
                            style: TextStyle(
                              color: pal.textMuted,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        for (final session in groupedHistory[monthKey]!)
                          _TrainerSessionCard(
                            session: session,
                            customTitle:
                                '${session.dateTime.day.toString().padLeft(2, '0')}.${session.dateTime.month.toString().padLeft(2, '0')}.${session.dateTime.year} · ${session.dateTime.hour.toString().padLeft(2, '0')}:${session.dateTime.minute.toString().padLeft(2, '0')}',
                            onTap: () async {
                              await ironVibeOpenTrainerSession(
                                context,
                                session,
                                mode: TrainerSessionUiMode.history,
                              );
                              if (mounted) setState(() {});
                            },
                          ),
                      ],
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _deleteClient,
                      child: Text(
                        l.deleteClientBtn,
                        style: TextStyle(
                          color: pal.textMuted,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
