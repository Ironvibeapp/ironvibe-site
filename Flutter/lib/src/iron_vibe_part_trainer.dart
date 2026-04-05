part of 'package:fitness_app/main.dart';

class TrainerScreen extends StatefulWidget {
  const TrainerScreen({super.key});

  @override
  State<TrainerScreen> createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen> {
  DateTime _focusedMonth = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  final ScrollController _trainerScrollController = ScrollController();

  @override
  void dispose() {
    _trainerScrollController.dispose();
    super.dispose();
  }

  void _addSession() {
    if (clients.isEmpty) {
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
            title: Text(AppLocalizations.of(ctx)!.noClientsTitle, style: TextStyle(color: pal.textPrimary)),
            content: Text(AppLocalizations.of(ctx)!.noClientsMsg, style: TextStyle(color: pal.textSecondary)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(AppLocalizations.of(ctx)!.ok, style: TextStyle(color: pal.textPrimary)),
              ),
            ],
          );
        },
      );
      return;
    }

    Client? selectedClient = clients.first;
    TimeOfDay selectedTime = const TimeOfDay(hour: 12, minute: 0);
    String note = '';

    showDialog(
      context: context,
      builder: (dialogCtx) {
        return StatefulBuilder(
          builder: (context, setState) {
            final pal = IronVibePalette.of(context);
            return AlertDialog(
              backgroundColor: pal.dialog,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: pal.borderDefault, width: 0.5),
                borderRadius: BorderRadius.zero,
              ),
              title: Text(
                AppLocalizations.of(context)!.addTraining,
                style: TextStyle(color: pal.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<Client>(
                    initialValue: selectedClient,
                    dropdownColor: pal.dropdown,
                    style: TextStyle(color: pal.textPrimary),
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.clientLabel,
                      labelStyle: TextStyle(color: pal.textMuted),
                    ),
                    items: clients.map((c) {
                      return DropdownMenuItem(
                        value: c,
                        child: Text(c.name, style: TextStyle(color: pal.textPrimary)),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() => selectedClient = val);
                    },
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                        builder: (c2, child) => ironVibeTimePickerTheme(c2, child),
                      );
                      if (time != null) {
                        setState(() => selectedTime = time);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: pal.borderDefault, width: 0.5),
                        color: pal.inputFill,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.time, style: TextStyle(color: pal.textMuted)),
                          Text(
                            '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}',
                            style: TextStyle(color: pal.textPrimary, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    style: TextStyle(color: pal.textPrimary),
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.noteLabel,
                      labelStyle: TextStyle(color: pal.textMuted),
                      filled: true,
                      fillColor: pal.inputFill,
                    ),
                    onChanged: (val) => note = val,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(color: pal.textMuted)),
                ),
                TextButton(
                  onPressed: () {
                    if (selectedClient != null) {
                      final dateTime = DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      this.setState(() {
                        trainerSchedule.add(TrainerSession(dateTime, selectedClient!.name, note));
                      });
                      DataService.saveData();
                      Navigator.pop(context);
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.add, style: TextStyle(color: pal.textPrimary, fontWeight: FontWeight.bold)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  List<TrainerSession> _getSessionsForDate(DateTime date) {
    return trainerSchedule.where((s) =>
      s.dateTime.year == date.year &&
      s.dateTime.month == date.month &&
      s.dateTime.day == date.day
    ).toList()
    ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  bool _hasSession(DateTime date) {
    return trainerSchedule.any((s) =>
      s.dateTime.year == date.year &&
      s.dateTime.month == date.month &&
      s.dateTime.day == date.day
    );
  }

  List<String> _monthNames(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return [l.monthJanuary, l.monthFebruary, l.monthMarch, l.monthApril, l.monthMay, l.monthJune, l.monthJuly, l.monthAugust, l.monthSeptember, l.monthOctober, l.monthNovember, l.monthDecember];
  }

  Future<void> _pickMonthYear() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _focusedMonth,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (c, child) => ironVibeDatePickerTheme(c, child),
    );
    if (picked != null) {
      setState(() {
        _focusedMonth = picked;
      });
    }
  }

  int _daysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  int _firstWeekdayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday;
  }

  @override
  Widget build(BuildContext context) {
    final sessions = _getSessionsForDate(_selectedDate);
    final pal = IronVibePalette.of(context);

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: CustomScrollView(
          controller: _trainerScrollController,
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextButton(
                  onPressed: _pickMonthYear,
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
            SliverToBoxAdapter(child: _buildCalendar()),
            SliverToBoxAdapter(
              child: Divider(color: pal.borderSubtle, height: 1),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SteelButton(
                      text: AppLocalizations.of(context)!.clientsMenu,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ClientListScreen()),
                        );
                      },
                      width: double.infinity,
                      height: 50,
                    ),
                    const SizedBox(height: 15),
                    SteelButton(
                      text: AppLocalizations.of(context)!.addTraining,
                      onPressed: _addSession,
                      width: double.infinity,
                      height: 50,
                      fontSize: 13,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      '${_selectedDate.day} ${_monthNames(context)[_selectedDate.month - 1]} ${_selectedDate.year}',
                      style: TextStyle(
                        color: pal.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    sessions.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.noEntries,
                                style: TextStyle(color: pal.textMuted),
                              ),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              for (int i = 0; i < sessions.length; i++)
                                _buildTrainerSessionAccordion(
                                  context,
                                  sessions[i],
                                  i + 1,
                                  hostScroll: _trainerScrollController,
                                  onChanged: () => setState(() {}),
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

  Widget _buildCalendar() {
    final year = _focusedMonth.year;
    final month = _focusedMonth.month;
    final daysInMonth = _daysInMonth(_focusedMonth);
    final firstWeekday = _firstWeekdayOfMonth(_focusedMonth);
    final emptyCells = firstWeekday - 1;
    final totalCells = emptyCells + daysInMonth;

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
              if (index < emptyCells) return const SizedBox.shrink();

              final day = index - emptyCells + 1;
              final date = DateTime(year, month, day);
              final isSelected = date.year == _selectedDate.year &&
                  date.month == _selectedDate.month &&
                  date.day == _selectedDate.day;
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
          ),
        ),
      ),
    );
  }
}

/// Inline or full-screen editor for a scheduled / past trainer session (same UI everywhere).
class TrainerSessionEditor extends StatefulWidget {
  final TrainerSession session;
  /// When false, [Navigator.pop] after save/delete. When true, use [onSaved] / [onDeleted].
  final bool embedded;
  final ScrollController? hostScrollController;
  final VoidCallback? onSaved;
  final VoidCallback? onDeleted;

  const TrainerSessionEditor({
    super.key,
    required this.session,
    this.embedded = false,
    this.hostScrollController,
    this.onSaved,
    this.onDeleted,
  });

  @override
  State<TrainerSessionEditor> createState() => _TrainerSessionEditorState();
}

class _TrainerSessionEditorState extends State<TrainerSessionEditor> {
  late List<ExerciseData> _exercises;
  late bool _isCardio;

  @override
  void initState() {
    super.initState();
    if (widget.session.exercises.isEmpty) {
      _exercises = [];
      _isCardio = false;
    } else {
      _isCardio = widget.session.exercises.first.isCardio;
      _exercises = widget.session.exercises.map((log) {
        final sets = log.sets.map((s) {
          if (s.isCardio) {
            return SetData(d: s.duration, i: s.intensity);
          }
          return SetData(w: s.weight, r: s.reps, ri: s.rir);
        }).toList();
        return ExerciseData(name: log.name, sets: sets, isCardio: log.isCardio);
      }).toList();
    }
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

  void _addExercise() {
    setState(() {
      _exercises.add(ExerciseData());
    });
    _scrollHostToEnd();
  }

  void _persistLogsToSession() {
    List<ExerciseLog> logs = [];

    for (var ex in _exercises) {
      String name = normalizeExerciseName(ex.nameController.text);
      if (name.isEmpty) continue;
      ex.nameController.text = name;

      ensureExerciseInBank(name);

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

    setState(() {
      widget.session.exercises = logs;
    });
  }

  void _saveSession() {
    _persistLogsToSession();
    DataService.saveData();
    if (widget.embedded) {
      widget.onSaved?.call();
    } else {
      Navigator.pop(context);
    }
  }

  bool _isStrictlyFutureSession() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final sessionDay =
        DateTime(widget.session.dateTime.year, widget.session.dateTime.month, widget.session.dateTime.day);
    return sessionDay.isAfter(today);
  }

  void _deleteSession() {
    final l = AppLocalizations.of(context)!;
    final useScheduleCopy = _isStrictlyFutureSession();
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
            useScheduleCopy ? l.deleteTraining : l.deleteWorkoutTitle,
            style: TextStyle(color: pal.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          content: Text(
            useScheduleCopy ? l.deleteTrainingQuestion : l.deleteWorkoutMsg,
            style: TextStyle(color: pal.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l.cancel, style: TextStyle(color: pal.textMuted)),
            ),
            TextButton(
              onPressed: () {
                trainerSchedule.remove(widget.session);
                DataService.saveData();
                Navigator.pop(ctx);
                if (widget.embedded) {
                  widget.onDeleted?.call();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(l.delete, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final segStrTrainer = ironVibeWorkoutTypeSegmentStyle(pal, isStrengthSegment: true, selected: !_isCardio);
    final segCarTrainer = ironVibeWorkoutTypeSegmentStyle(pal, isStrengthSegment: false, selected: _isCardio);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.session.note.isNotEmpty) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: pal.inputFill,
              border: Border.all(color: pal.borderDefault, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.noteLabel,
                  style: TextStyle(color: pal.textMuted, fontSize: 12, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.session.note,
                  style: TextStyle(color: pal.textPrimary, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _isCardio = false),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: segStrTrainer.backgroundColor,
                    border: Border.all(color: pal.borderDefault, width: 0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.strengthType,
                    textAlign: TextAlign.center,
                    style: segStrTrainer.labelStyle,
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
                    color: segCarTrainer.backgroundColor,
                    border: Border.all(color: pal.borderDefault, width: 0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.cardioType,
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
                data: _exercises[index],
                forceCardioMode: _isCardio,
                clientNameForProgress: widget.session.clientName,
                exerciseIndex: index,
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
        SteelButton(
          text: AppLocalizations.of(context)!.saveWorkout,
          onPressed: _saveSession,
          width: double.infinity,
          height: 70,
          isBig: true,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _deleteSession,
          child: Text(
            AppLocalizations.of(context)!.deleteWorkout,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
        ),
        SizedBox(height: widget.embedded ? 8 : 40),
      ],
    );
  }
}

class TrainerWorkoutSessionScreen extends StatefulWidget {
  final TrainerSession session;
  const TrainerWorkoutSessionScreen({super.key, required this.session});

  @override
  State<TrainerWorkoutSessionScreen> createState() => _TrainerWorkoutSessionScreenState();
}

class _TrainerWorkoutSessionScreenState extends State<TrainerWorkoutSessionScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                sliver: SliverToBoxAdapter(
                  child: TrainerSessionEditor(
                    session: widget.session,
                    embedded: false,
                    hostScrollController: _scrollController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTrainerSessionAccordion(
  BuildContext context,
  TrainerSession session,
  int number, {
  required ScrollController hostScroll,
  required VoidCallback onChanged,
  String? customTitle,
}) {
  final l = AppLocalizations.of(context)!;
  final pal = IronVibePalette.of(context);
  final timeStr =
      '${session.dateTime.hour.toString().padLeft(2, '0')}:${session.dateTime.minute.toString().padLeft(2, '0')}';
  final exerciseCount = session.exercises.length;
  final title = customTitle ??
      '${l.workoutNumberPrefix}$number · $timeStr · $exerciseCount · ${session.clientName}';
  return Container(
    key: ObjectKey(session),
    margin: const EdgeInsets.only(bottom: 12),
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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: pal.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        children: [
          TrainerSessionEditor(
            session: session,
            embedded: true,
            hostScrollController: hostScroll,
            onSaved: onChanged,
            onDeleted: onChanged,
          ),
        ],
      ),
    ),
  );
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
        String goal = '';
        final pal = IronVibePalette.of(ctx);
        return AlertDialog(
          backgroundColor: pal.dialog,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: pal.borderDefault, width: 0.5),
            borderRadius: BorderRadius.zero,
          ),
          title: Text(
            AppLocalizations.of(ctx)!.newClient,
            style: TextStyle(color: pal.textPrimary, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: TextStyle(color: pal.textPrimary),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(ctx)!.clientName,
                  hintStyle: TextStyle(color: pal.textHint),
                  filled: true,
                  fillColor: pal.inputFill,
                ),
                onChanged: (val) => name = val,
              ),
              const SizedBox(height: 10),
              TextField(
                style: TextStyle(color: pal.textPrimary),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(ctx)!.clientGoal,
                  hintStyle: TextStyle(color: pal.textHint),
                  filled: true,
                  fillColor: pal.inputFill,
                ),
                onChanged: (val) => goal = val,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(AppLocalizations.of(ctx)!.cancel, style: TextStyle(color: pal.textMuted)),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty) {
                  setState(() {
                    clients.add(Client(name, goal));
                  });
                  DataService.saveData();
                  Navigator.pop(ctx);
                }
              },
              child: Text(AppLocalizations.of(ctx)!.add, style: TextStyle(color: pal.textPrimary, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

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
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: clients.length,
              itemBuilder: (context, index) {
                final client = clients[index];
                final listPal = IronVibePalette.of(context);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClientProfileScreen(client: client),
                        ),
                      );
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: listPal.card,
                        border: Border.all(color: listPal.borderSubtle, width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            client.name,
                            style: TextStyle(
                              color: listPal.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (client.goal.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              client.goal,
                              style: TextStyle(
                                color: listPal.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                          ],
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
              text: AppLocalizations.of(context)!.addClient,
              onPressed: _addClient,
              width: double.infinity,
              height: 50,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
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
  final ScrollController _profileScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _goalController = TextEditingController(text: widget.client.goal);
    _weightController = TextEditingController(text: widget.client.weight);
    _heightController = TextEditingController(text: widget.client.height);
    _notesController = TextEditingController(text: widget.client.notes);
  }

  @override
  void dispose() {
    _goalController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _notesController.dispose();
    _profileScrollController.dispose();
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
              onPressed: () => Navigator.pop(ctx, _ClientProfileUnsavedAction.stay),
              child: Text(l.clientProfileStay, style: TextStyle(color: dpal.textMuted)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, _ClientProfileUnsavedAction.discard),
              child: Text(
                l.clientProfileDiscard,
                style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, _ClientProfileUnsavedAction.saveAndLeave),
              child: Text(l.clientProfileSaveAndLeave, style: TextStyle(color: dpal.textPrimary, fontWeight: FontWeight.w600)),
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
          shape: RoundedRectangleBorder(
            side: BorderSide(color: pal.borderDefault, width: 0.5),
            borderRadius: BorderRadius.zero,
          ),
          title: Text(
            AppLocalizations.of(ctx)!.deleteClientTitle,
            style: TextStyle(color: pal.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          content: Text(
            AppLocalizations.of(ctx)!.deleteClientMsg,
            style: TextStyle(color: pal.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(AppLocalizations.of(ctx)!.cancel, style: TextStyle(color: pal.textMuted)),
            ),
            TextButton(
              onPressed: () {
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);

                trainerSchedule.removeWhere((s) {
                  final sDate = DateTime(s.dateTime.year, s.dateTime.month, s.dateTime.day);
                  return s.clientName == widget.client.name && !sDate.isBefore(today);
                });

                clients.remove(widget.client);
                DataService.saveData();

                Navigator.pop(ctx);
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(ctx)!.delete, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final history = trainerSchedule
        .where((s) => s.clientName == widget.client.name)
        .toList()
        ..sort((a, b) => b.dateTime.compareTo(a.dateTime));

    Map<String, List<TrainerSession>> groupedHistory = {};
    for (var session in history) {
      final key = _trainerHistoryMonthKey(context, session.dateTime);
      if (!groupedHistory.containsKey(key)) {
        groupedHistory[key] = [];
      }
      groupedHistory[key]!.add(session);
    }

    final pal = IronVibePalette.of(context);
    final dirty = _isDirty;

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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _profileScrollController,
                        child: Column(
                          children: [
                            _buildSectionTitle(context, AppLocalizations.of(context)!.clientProfileSectionGoal),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _goalController,
                      style: TextStyle(color: pal.textPrimary),
                      minLines: 8,
                      maxLines: 16,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.clientGoal,
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(color: pal.textHint),
                        filled: true,
                        fillColor: pal.inputFill,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 30),
                    _buildSectionTitle(context, AppLocalizations.of(context)!.clientProfileSectionAnthropometry),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _weightController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(color: pal.textPrimary),
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.clientWeight,
                              labelStyle: TextStyle(color: pal.textMuted),
                              filled: true,
                              fillColor: pal.inputFill,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                              ),
                            ),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            controller: _heightController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            style: TextStyle(color: pal.textPrimary),
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.clientHeight,
                              labelStyle: TextStyle(color: pal.textMuted),
                              filled: true,
                              fillColor: pal.inputFill,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                              ),
                            ),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    _buildSectionTitle(context, AppLocalizations.of(context)!.clientProfileSectionTrainerNotes),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _notesController,
                      style: TextStyle(color: pal.textPrimary),
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.clientTrainerNotesHint,
                        hintStyle: TextStyle(color: pal.textHint),
                        filled: true,
                        fillColor: pal.inputFill,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: pal.borderDefault, width: 0.5),
                        ),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: SteelButton(
                        text: AppLocalizations.of(context)!.personalProgress,
                        width: 280,
                        height: 50,
                        fontSize: 12,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PersonalProgressScreen(clientName: widget.client.name),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    Center(
                      child: IgnorePointer(
                        ignoring: !dirty,
                        child: Opacity(
                          opacity: dirty ? 1.0 : 0.45,
                          child: SteelButton(
                            text: AppLocalizations.of(context)!.saveClientChanges,
                            width: 280,
                            height: 50,
                            fontSize: 12,
                            onPressed: _saveChanges,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildSectionTitle(context, AppLocalizations.of(context)!.clientProfileSectionWorkoutHistory),
                    const SizedBox(height: 10),
                    if (groupedHistory.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          AppLocalizations.of(context)!.clientWorkoutHistoryEmpty,
                          style: TextStyle(color: pal.textMuted),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: groupedHistory.length,
                        itemBuilder: (context, index) {
                          String monthKey = groupedHistory.keys.elementAt(index);
                          List<TrainerSession> sessions = groupedHistory[monthKey]!;
                          
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  monthKey,
                                  style: TextStyle(color: pal.textMuted, fontWeight: FontWeight.bold),
                                ),
                              ),
                              ...sessions.asMap().entries.map((entry) {
                                final session = entry.value;
                                final idx = entry.key + 1;
                                final timeStr =
                                    '${session.dateTime.hour.toString().padLeft(2, '0')}:${session.dateTime.minute.toString().padLeft(2, '0')}';
                                final exCount = session.exercises.length;
                                final dateStr =
                                    '${session.dateTime.day.toString().padLeft(2, '0')}.${session.dateTime.month.toString().padLeft(2, '0')}.${session.dateTime.year}';
                                final noteShort = session.note.isEmpty
                                    ? AppLocalizations.of(context)!.trainerSessionDefaultTitle
                                    : session.note;
                                final customTitle = '$dateStr · $timeStr · $exCount · $noteShort';
                                return _buildTrainerSessionAccordion(
                                  context,
                                  session,
                                  idx,
                                  hostScroll: _profileScrollController,
                                  customTitle: customTitle,
                                  onChanged: () => setState(() {}),
                                );
                              }),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _deleteClient,
              child: Text(
                AppLocalizations.of(context)!.deleteClientBtn,
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
    ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final pal = IronVibePalette.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: pal.textMuted,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
    );
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
    return '${months[dt.month - 1].toUpperCase()} ${dt.year}';
  }
}
