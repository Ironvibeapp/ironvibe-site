part of 'package:fitness_app/main.dart';

enum _InstructionBlockKind {
  heading,
  body,
  topics,
  philosophy,
  chartLegend,
  callout,
}

class _InstructionTopic {
  final IconData icon;
  final String label;
  final String description;
  final Color? stripeColor;

  const _InstructionTopic({
    required this.icon,
    required this.label,
    required this.description,
    this.stripeColor,
  });

  bool matches(String query) {
    return label.toLowerCase().contains(query) ||
        description.toLowerCase().contains(query);
  }
}

class _InstructionChartLine {
  final Color color;
  final String description;

  const _InstructionChartLine({
    required this.color,
    required this.description,
  });

  bool matches(String query) => description.toLowerCase().contains(query);
}

class _InstructionBlock {
  final _InstructionBlockKind kind;
  final String? text;
  final List<_InstructionTopic>? topics;
  final List<_InstructionChartLine>? chartLines;

  const _InstructionBlock._({
    required this.kind,
    this.text,
    this.topics,
    this.chartLines,
  });

  factory _InstructionBlock.heading(String title) =>
      _InstructionBlock._(kind: _InstructionBlockKind.heading, text: title);

  factory _InstructionBlock.body(String text) =>
      _InstructionBlock._(kind: _InstructionBlockKind.body, text: text);

  factory _InstructionBlock.topics(List<_InstructionTopic> topics) =>
      _InstructionBlock._(kind: _InstructionBlockKind.topics, topics: topics);

  factory _InstructionBlock.philosophy(String text) =>
      _InstructionBlock._(kind: _InstructionBlockKind.philosophy, text: text);

  factory _InstructionBlock.chartLegend(List<_InstructionChartLine> lines) =>
      _InstructionBlock._(
        kind: _InstructionBlockKind.chartLegend,
        chartLines: lines,
      );

  factory _InstructionBlock.callout(String text) =>
      _InstructionBlock._(kind: _InstructionBlockKind.callout, text: text);

  bool get isHeading => kind == _InstructionBlockKind.heading;

  bool matches(String query) {
    switch (kind) {
      case _InstructionBlockKind.heading:
      case _InstructionBlockKind.body:
      case _InstructionBlockKind.philosophy:
      case _InstructionBlockKind.callout:
        return (text ?? '').toLowerCase().contains(query);
      case _InstructionBlockKind.topics:
        return topics!.any((t) => t.matches(query));
      case _InstructionBlockKind.chartLegend:
        return chartLines!.any((c) => c.matches(query));
    }
  }

  _InstructionBlock filtered(String query) {
    if (kind == _InstructionBlockKind.topics) {
      return _InstructionBlock.topics(
        topics!.where((t) => t.matches(query)).toList(),
      );
    }
    if (kind == _InstructionBlockKind.chartLegend) {
      return _InstructionBlock.chartLegend(
        chartLines!.where((c) => c.matches(query)).toList(),
      );
    }
    return this;
  }
}

class _InstructionChapter {
  final String id;
  final IconData icon;
  final String title;
  final String blurb;
  final List<_InstructionBlock> blocks;

  const _InstructionChapter({
    required this.id,
    required this.icon,
    required this.title,
    required this.blurb,
    required this.blocks,
  });

  bool matchesMeta(String query) {
    return title.toLowerCase().contains(query) ||
        blurb.toLowerCase().contains(query);
  }

  List<_InstructionBlock> blocksForQuery(String query) {
    if (query.isEmpty || matchesMeta(query)) return blocks;

    final out = <_InstructionBlock>[];
    _InstructionBlock? pendingHeading;
    var includeUntilNextHeading = false;

    for (final block in blocks) {
      if (block.isHeading) {
        pendingHeading = block;
        includeUntilNextHeading = block.matches(query);
        if (includeUntilNextHeading) {
          out.add(block);
          pendingHeading = null;
        }
        continue;
      }

      final hit = includeUntilNextHeading || block.matches(query);
      if (!hit) continue;

      if (pendingHeading != null) {
        out.add(pendingHeading);
        pendingHeading = null;
      }
      out.add(includeUntilNextHeading ? block : block.filtered(query));
    }
    return out;
  }
}

List<_InstructionChapter> _ironVibeInstructionChapters(AppLocalizations l) {
  return [
    _InstructionChapter(
      id: 'start',
      icon: Icons.flag_rounded,
      title: l.instructionChapterStartTitle,
      blurb: l.instructionChapterStartBlurb,
      blocks: [
        _InstructionBlock.philosophy(l.instructionPhilosophy),
        _InstructionBlock.heading(l.instructionSectionHome),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.brightness_6_rounded,
            label: l.instructionThemeTitle,
            description: l.instructionThemeDesc,
          ),
          _InstructionTopic(
            icon: Icons.person_rounded,
            label: l.instructionTrainSelfTitle,
            description: l.instructionTrainSelfDesc,
          ),
          _InstructionTopic(
            icon: Icons.groups_rounded,
            label: l.instructionTrainOthersTitle,
            description: l.instructionTrainOthersDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionAthleteMenu),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.play_arrow_rounded,
            label: l.instructionStartWorkoutTitle,
            description: l.instructionStartWorkoutDesc,
          ),
          _InstructionTopic(
            icon: Icons.flash_on_rounded,
            label: l.instructionQuickWorkoutTitle,
            description: l.instructionQuickWorkoutDesc,
          ),
          _InstructionTopic(
            icon: Icons.calendar_month_rounded,
            label: l.instructionCalendarMenuTitle,
            description: l.instructionCalendarMenuDesc,
          ),
          _InstructionTopic(
            icon: Icons.insights_rounded,
            label: l.instructionSectionPersonalProgress,
            description: l.instructionPersonalProgressMenuDesc,
          ),
          _InstructionTopic(
            icon: Icons.star_rounded,
            label: l.instructionFavoritesMenuTitle,
            description: l.instructionFavoritesMenuDesc,
          ),
        ]),
      ],
    ),
    _InstructionChapter(
      id: 'tools',
      icon: Icons.tune_rounded,
      title: l.instructionChapterToolsTitle,
      blurb: l.instructionChapterToolsBlurb,
      blocks: [
        _InstructionBlock.heading(l.instructionSectionRhythm),
        _InstructionBlock.body(l.instructionRhythmIntro),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.speed_rounded,
            label: l.instructionRhythmGaugeTitle,
            description: l.instructionRhythmGaugeDesc,
          ),
          _InstructionTopic(
            icon: Icons.battery_saver_rounded,
            label: l.instructionRhythmDeloadTitle,
            description: l.instructionRhythmDeloadDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionFavorites),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.star_border_rounded,
            label: l.instructionFavoriteStarTitle,
            description: l.instructionFavoriteStarDesc,
          ),
          _InstructionTopic(
            icon: Icons.playlist_add_check_rounded,
            label: l.instructionBuildFromFavoritesTitle,
            description: l.instructionBuildFromFavoritesDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionMuscleGroups),
        _InstructionBlock.body(l.instructionMuscleGroupsIntro),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.label_outline_rounded,
            label: l.instructionMuscleGroupTagTitle,
            description: l.instructionMuscleGroupTagDesc,
          ),
          _InstructionTopic(
            icon: Icons.swap_horiz_rounded,
            label: l.instructionQuickWorkoutHowTitle,
            description: l.instructionQuickWorkoutHowDesc,
          ),
        ]),
      ],
    ),
    _InstructionChapter(
      id: 'session',
      icon: Icons.fitness_center_rounded,
      title: l.instructionChapterSessionTitle,
      blurb: l.instructionChapterSessionBlurb,
      blocks: [
        _InstructionBlock.heading(l.instructionSectionWorkout),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.swap_horiz_rounded,
            label: l.instructionStrengthCardioTitle,
            description: l.instructionStrengthCardioDesc,
          ),
          _InstructionTopic(
            icon: Icons.visibility_outlined,
            label: l.instructionPreviousHintsTitle,
            description: l.instructionPreviousHintsDesc,
          ),
          _InstructionTopic(
            icon: Icons.fitness_center_rounded,
            label: l.instructionAddExerciseTitle,
            description: l.instructionAddExerciseBody,
          ),
          _InstructionTopic(
            icon: Icons.delete_outline_rounded,
            label: l.instructionRemoveExerciseTitle,
            description: l.instructionRemoveExerciseDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionExerciseNameTools),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.drive_file_rename_outline_rounded,
            label: l.instructionRenameExerciseTitle,
            description: l.instructionRenameExerciseDesc,
          ),
          _InstructionTopic(
            icon: Icons.close_rounded,
            label: l.instructionRemoveFromBankTitle,
            description: l.instructionRemoveFromBankDesc,
          ),
          _InstructionTopic(
            icon: Icons.drive_file_move_outline,
            label: l.instructionReassignExerciseTitle,
            description: l.instructionReassignExerciseDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionSetControl),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.remove_rounded,
            label: l.instructionSetMinusLabel,
            description: l.instructionSetMinusDesc,
          ),
          _InstructionTopic(
            icon: Icons.add_rounded,
            label: l.instructionSetPlusLabel,
            description: l.instructionSetPlusDesc,
          ),
          _InstructionTopic(
            icon: Icons.show_chart_rounded,
            label: l.instructionSetProgressLabel,
            description: l.instructionSetProgressDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionInputs),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.scale_rounded,
            label: l.instructionWeightTitle,
            description: l.instructionWeightBody,
          ),
          _InstructionTopic(
            icon: Icons.repeat_rounded,
            label: l.instructionRepsTitle,
            description: l.instructionRepsBody,
          ),
          _InstructionTopic(
            icon: Icons.flag_outlined,
            label: l.instructionRirTitle,
            description: l.instructionRirBody,
          ),
          _InstructionTopic(
            icon: Icons.trending_up_rounded,
            label: l.instructionOneRmTitle,
            description: l.instructionOneRmDesc,
          ),
          _InstructionTopic(
            icon: Icons.stacked_bar_chart_rounded,
            label: l.instructionExerciseVolumeTitle,
            description: l.instructionExerciseVolumeDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionCardio),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.directions_run_rounded,
            label: l.instructionCardioTitle,
            description: l.instructionCardioBody,
          ),
          _InstructionTopic(
            icon: Icons.speed_rounded,
            label: l.instructionIntensityTitle,
            description: l.instructionIntensityBody,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionSaving),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.check_circle_outline_rounded,
            label: l.instructionFinishTitle,
            description: l.instructionFinishBody,
          ),
          _InstructionTopic(
            icon: Icons.restore_rounded,
            label: l.instructionAutoSaveTitle,
            description: l.instructionAutoSaveDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionStopwatch),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.timer_outlined,
            label: l.instructionStopwatchWhyTitle,
            description: l.instructionStopwatchWhyBody,
          ),
          _InstructionTopic(
            icon: Icons.touch_app_outlined,
            label: l.instructionStopwatchHowTitle,
            description: l.instructionStopwatchHowBody,
          ),
          _InstructionTopic(
            icon: Icons.repeat_rounded,
            label: l.instructionStopwatchIntervalsTitle,
            description: l.instructionStopwatchIntervalsBody,
            stripeColor: kProgressChartWeightColor,
          ),
          _InstructionTopic(
            icon: Icons.add_alarm_rounded,
            label: l.instructionStopwatchRestTitle,
            description: l.instructionStopwatchRestBody,
            stripeColor: kProgressChartRepsColor,
          ),
          _InstructionTopic(
            icon: Icons.horizontal_rule_rounded,
            label: l.instructionStopwatchProgressTitle,
            description: l.instructionStopwatchProgressBody,
          ),
          _InstructionTopic(
            icon: Icons.volume_up_rounded,
            label: l.instructionStopwatchSoundsTitle,
            description: l.instructionStopwatchSoundsBody,
          ),
        ]),
      ],
    ),
    _InstructionChapter(
      id: 'progress',
      icon: Icons.insights_rounded,
      title: l.instructionChapterProgressTitle,
      blurb: l.instructionChapterProgressBlurb,
      blocks: [
        _InstructionBlock.heading(l.instructionSectionPersonalProgress),
        _InstructionBlock.body(l.instructionPersonalProgressIntro),
        _InstructionBlock.heading(l.instructionSectionProgressChart),
        _InstructionBlock.body(l.instructionProgressChartIntro),
        _InstructionBlock.chartLegend([
          _InstructionChartLine(
            color: kProgressChartWeightColor,
            description: l.instructionProgressLineWeightDesc,
          ),
          _InstructionChartLine(
            color: kProgressChartRepsColor,
            description: l.instructionProgressLineRepsDesc,
          ),
          _InstructionChartLine(
            color: kProgressChartVolumeColor,
            description: l.instructionProgressLineVolumeDesc,
          ),
        ]),
        _InstructionBlock.callout(l.instructionProgressChartSessionHighlight),
        _InstructionBlock.heading(l.instructionSectionCalendar),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.event_rounded,
            label: l.instructionCalendarAddTitle,
            description: l.instructionCalendarAddDesc,
          ),
        ]),
        _InstructionBlock.heading(l.instructionSectionNavHistory),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.bar_chart_rounded,
            label: l.instructionNavHistoryTitle,
            description: l.instructionNavHistoryDesc,
          ),
          _InstructionTopic(
            icon: Icons.import_export_rounded,
            label: l.instructionNavImportExportTitle,
            description: l.instructionNavImportExportDesc,
          ),
        ]),
      ],
    ),
    _InstructionChapter(
      id: 'coach',
      icon: Icons.groups_rounded,
      title: l.instructionChapterCoachTitle,
      blurb: l.instructionChapterCoachBlurb,
      blocks: [
        _InstructionBlock.body(l.instructionTrainerIntro),
        _InstructionBlock.topics([
          _InstructionTopic(
            icon: Icons.people_outline_rounded,
            label: l.instructionClientsTitle,
            description: l.instructionClientsDesc,
          ),
          _InstructionTopic(
            icon: Icons.badge_outlined,
            label: l.instructionClientProfileTitle,
            description: l.instructionClientProfileDesc,
          ),
          _InstructionTopic(
            icon: Icons.print_outlined,
            label: l.instructionPrintSessionTitle,
            description: l.instructionPrintSessionDesc,
          ),
          _InstructionTopic(
            icon: Icons.edit_calendar_outlined,
            label: l.instructionTrainerPlanTitle,
            description: l.instructionTrainerPlanDesc,
          ),
          _InstructionTopic(
            icon: Icons.replay_rounded,
            label: l.instructionTrainerRepeatTitle,
            description: l.instructionTrainerRepeatDesc,
          ),
        ]),
      ],
    ),
  ];
}

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _enter;
  final TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    _enter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 760),
    )..forward();
  }

  @override
  void dispose() {
    _enter.dispose();
    _search.dispose();
    super.dispose();
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
    final query = _search.text.trim().toLowerCase();
    final chapters = _ironVibeInstructionChapters(l);
    final searching = query.isNotEmpty;

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
              padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    ironVibeSentenceCase(l.instructionTitle),
                    style: TextStyle(
                      color: pal.textPrimary,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _InstructionSearchField(
                    controller: _search,
                    hint: l.instructionSearchHint,
                    onChanged: () => setState(() {}),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: searching
                  ? _InstructionSearchResults(
                      query: query,
                      chapters: chapters,
                      emptyLabel: l.instructionSearchEmpty,
                    )
                  : _InstructionHubBody(
                      manifest: l.instructionHubManifest,
                      chapters: chapters,
                      stagger: _stagger,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstructionHubBody extends StatelessWidget {
  final String manifest;
  final List<_InstructionChapter> chapters;
  final Animation<double> Function(double begin, double end) stagger;

  const _InstructionHubBody({
    required this.manifest,
    required this.chapters,
    required this.stagger,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(22, 14, 22, 28),
      children: [
        IronVibeEnter(
          animation: stagger(0.0, 0.46),
          child: _InstructionCallout(text: manifest),
        ),
        const SizedBox(height: 14),
        for (int i = 0; i < chapters.length; i++) ...[
          IronVibeEnter(
            animation: stagger(0.10 + i * 0.08, 0.56 + i * 0.08),
            child: Padding(
              padding: EdgeInsets.only(bottom: i == chapters.length - 1 ? 0 : 10),
              child: _InstructionHubCard(chapter: chapters[i]),
            ),
          ),
        ],
      ],
    );
  }
}

class _InstructionSearchResults extends StatelessWidget {
  final String query;
  final List<_InstructionChapter> chapters;
  final String emptyLabel;

  const _InstructionSearchResults({
    required this.query,
    required this.chapters,
    required this.emptyLabel,
  });

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    final groups = <({_InstructionChapter chapter, List<_InstructionBlock> blocks})>[];
    for (final chapter in chapters) {
      final blocks = chapter.blocksForQuery(query);
      if (blocks.isNotEmpty) {
        groups.add((chapter: chapter, blocks: blocks));
      }
    }

    if (groups.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            emptyLabel,
            textAlign: TextAlign.center,
            style: TextStyle(color: pal.textMuted, fontSize: 14),
          ),
        ),
      );
    }

    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.fromLTRB(22, 8, 22, 16),
      children: [
        for (int i = 0; i < groups.length; i++) ...[
          _InstructionBlockHeading(groups[i].chapter.title),
          _InstructionBlocksColumn(blocks: groups[i].blocks),
        ],
      ],
    );
  }
}

class _InstructionChapterScreen extends StatelessWidget {
  final _InstructionChapter chapter;

  const _InstructionChapterScreen({required this.chapter});

  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 28),
                children: [
                  Text(
                    ironVibeSentenceCase(chapter.title),
                    style: TextStyle(
                      color: pal.textPrimary,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Text(
                      chapter.blurb,
                      style: TextStyle(
                        color: pal.textSecondary,
                        fontSize: 13,
                        height: 1.42,
                      ),
                    ),
                  ),
                  _InstructionBlocksColumn(blocks: chapter.blocks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InstructionBlocksColumn extends StatelessWidget {
  final List<_InstructionBlock> blocks;

  const _InstructionBlocksColumn({required this.blocks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final block in blocks) ...[
          switch (block.kind) {
            _InstructionBlockKind.heading =>
              _InstructionBlockHeading(block.text!),
            _InstructionBlockKind.body => _InstructionBodyText(block.text!),
            _InstructionBlockKind.topics => _InstructionTopicList(
                topics: block.topics!,
              ),
            _InstructionBlockKind.philosophy => Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 6),
                child: _InstructionCallout(text: block.text!),
              ),
            _InstructionBlockKind.chartLegend => _InstructionChartLegend(
                lines: block.chartLines!,
              ),
            _InstructionBlockKind.callout => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _InstructionCallout(text: block.text!),
              ),
          },
        ],
      ],
    );
  }
}

class _InstructionHubCard extends StatelessWidget {
  final _InstructionChapter chapter;

  const _InstructionHubCard({required this.chapter});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return IronVibePressScale(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => _InstructionChapterScreen(chapter: chapter),
          ),
        );
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 72),
        padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
        decoration: ironVibeElevatedCardDecoration(pal),
        child: Row(
          children: [
            _instructionMetalBadge(context, chapter.icon, size: 44, iconSize: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ironVibeSentenceCase(chapter.title),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: pal.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      letterSpacing: 0.05,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chapter.blurb,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: pal.textMuted,
                      fontSize: 12,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right_rounded, color: pal.textMuted),
          ],
        ),
      ),
    );
  }
}

class _InstructionSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onChanged;

  const _InstructionSearchField({
    required this.controller,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return TextField(
      controller: controller,
      onChanged: (_) => onChanged(),
      style: TextStyle(color: pal.textPrimary, fontSize: 14),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: pal.textHint),
        filled: true,
        fillColor: pal.inputFill,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: pal.borderSubtle, width: 0.5),
          borderRadius: BorderRadius.circular(kIronVibeRadiusField),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kIronVibeAccent, width: 1.6),
          borderRadius: BorderRadius.all(Radius.circular(kIronVibeRadiusField)),
        ),
        prefixIcon: Icon(Icons.search, color: pal.textMuted, size: 22),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                icon: Icon(Icons.close_rounded, color: pal.textMuted, size: 20),
                onPressed: () {
                  controller.clear();
                  onChanged();
                },
              ),
      ),
    );
  }
}

class _InstructionTopicList extends StatelessWidget {
  final List<_InstructionTopic> topics;

  const _InstructionTopicList({required this.topics});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        children: [
          for (int i = 0; i < topics.length; i++)
            Padding(
              padding: EdgeInsets.only(bottom: i == topics.length - 1 ? 0 : 10),
              child: _InstructionTopicCard(topic: topics[i]),
            ),
        ],
      ),
    );
  }
}

class _InstructionTopicCard extends StatelessWidget {
  final _InstructionTopic topic;

  const _InstructionTopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Container(
      decoration: ironVibeElevatedCardDecoration(pal),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (topic.stripeColor != null)
              Container(width: 4, color: topic.stripeColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 14, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _instructionMetalBadge(
                      context,
                      topic.icon,
                      size: 36,
                      iconSize: 18,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topic.label,
                            style: TextStyle(
                              color: pal.textPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            topic.description,
                            style: TextStyle(
                              color: pal.textSecondary,
                              fontSize: 13,
                              height: 1.42,
                            ),
                          ),
                        ],
                      ),
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

class _InstructionChartLegend extends StatelessWidget {
  final List<_InstructionChartLine> lines;

  const _InstructionChartLegend({required this.lines});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: ironVibeElevatedCardDecoration(pal),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
              child: Row(
                children: [
                  for (int i = 0; i < lines.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          color: lines[i].color,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            for (int i = 0; i < lines.length; i++) ...[
              if (i > 0)
                Divider(height: 1, thickness: 1, color: pal.borderSubtle),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 18,
                      margin: const EdgeInsets.only(top: 2, right: 10),
                      decoration: BoxDecoration(
                        color: lines[i].color,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        lines[i].description,
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
            ],
          ],
        ),
      ),
    );
  }
}

class _InstructionCallout extends StatelessWidget {
  final String text;

  const _InstructionCallout({required this.text});

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Container(
      decoration: ironVibeElevatedCardDecoration(pal),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 3,
            height: 16,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: kIronVibeAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: pal.textSecondary,
                fontSize: 13,
                height: 1.42,
              ),
            ),
          ),
        ],
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 3,
            height: 16,
            decoration: BoxDecoration(
              color: kIronVibeAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              ironVibeSentenceCase(title),
              style: TextStyle(
                color: pal.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InstructionBodyText extends StatelessWidget {
  final String text;

  const _InstructionBodyText(this.text);

  @override
  Widget build(BuildContext context) {
    final pal = IronVibePalette.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        text,
        style: TextStyle(
          color: pal.textSecondary,
          fontSize: 13,
          height: 1.42,
        ),
      ),
    );
  }
}

Widget _instructionMetalBadge(
  BuildContext context,
  IconData icon, {
  double size = 36,
  double iconSize = 18,
}) {
  final pal = IronVibePalette.of(context);
  final isDark = pal.brightness == Brightness.dark;
  return Container(
    width: size,
    height: size,
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
    child: Icon(icon, size: iconSize, color: pal.iconPrimary),
  );
}
