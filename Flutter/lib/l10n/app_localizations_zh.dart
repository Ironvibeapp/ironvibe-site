// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => '你的训练氛围';

  @override
  String get ok => '确定';

  @override
  String get cancel => '取消';

  @override
  String get renameExerciseTitle => '重命名动作';

  @override
  String get renameExerciseEmpty => '名称不能为空';

  @override
  String get reassignHistoryExerciseTitle => '更换动作';

  @override
  String get reassignHistoryExerciseBody => '仅更改本次训练。组数与数据保留；进度图按新动作名称统计。';

  @override
  String get delete => '删除';

  @override
  String get yesDelete => '是，删除';

  @override
  String get close => '关闭';

  @override
  String get save => '保存';

  @override
  String get add => '添加';

  @override
  String get trainOthers => '我训练他人';

  @override
  String get trainSelf => '自己训练';

  @override
  String get statistics => '统计';

  @override
  String get exportHistory => '导出训练记录';

  @override
  String get historyEmpty => '记录为空，暂无内容可导出。';

  @override
  String get exportError => '导出错误：';

  @override
  String get exportJson => '导出 JSON';

  @override
  String get importData => '导入';

  @override
  String get importSuccess => '数据导入成功';

  @override
  String get importError => '导入错误：';

  @override
  String get importNewerVersion => '文件由更新版本的应用创建';

  @override
  String get importFileAccessError => '文件访问错误';

  @override
  String get importInvalidJson => 'JSON 格式无效';

  @override
  String get importInvalidBackupFile => '错误：选择了无效的备份文件';

  @override
  String get importAthlete => '导入运动员';

  @override
  String importAthleteFound(int count) {
    return '发现 $count 条训练记录，来自名单中没有的运动员。';
  }

  @override
  String get importAthleteBackupOwn => '先保存我的数据';

  @override
  String get importAthleteDecline => '不添加';

  @override
  String get importAthleteSuccess => '已添加运动员';

  @override
  String get importAthleteNotAthleteFile => '此文件不是运动员训练历史。';

  @override
  String get importAthleteEmpty => '此文件中没有训练记录。';

  @override
  String get importAthleteAlreadyImported => '这些训练已在此设备上。';

  @override
  String get importAthleteUseDedicatedButton => '这看起来像运动员历史。请使用「导入运动员」。';

  @override
  String get shareText => 'IronVibe 训练记录';

  @override
  String get monthStats => '本月';

  @override
  String get yearStats => '今年';

  @override
  String get allTimeStats => '全部';

  @override
  String get weight => '重量';

  @override
  String get reps => '次数';

  @override
  String get rir => 'RIR';

  @override
  String get oneRm => '1RM';

  @override
  String get approxOneRm => '≈ 1RM：';

  @override
  String get kg => '公斤';

  @override
  String get volumeShort => '容量';

  @override
  String get addSet => '添加组';

  @override
  String get addExercise => '添加动作';

  @override
  String get finishWorkout => '结束训练';

  @override
  String get finishWorkoutConfirmTitle => '结束训练？';

  @override
  String get finishWorkoutConfirmBody => '训练将会被保存。';

  @override
  String get finishWorkoutConfirmAction => '结束';

  @override
  String get workoutCompleteTitle => '训练已保存';

  @override
  String get planChangesSavedTitle => '更改已保存';

  @override
  String get startWorkout => '开始训练';

  @override
  String get quickWorkout => '快速训练';

  @override
  String get quickWorkoutFullBody => '全身';

  @override
  String get quickWorkoutInsufficientTitle => '数据不足';

  @override
  String get quickWorkoutInsufficientBody =>
      '快速训练需要胸、背、一组腿部（大腿前侧或后侧）以及肩、手臂或核心之一的已标记动作。请在个人进步中标记肌群，或继续记录：输入新动作时应用会询问。';

  @override
  String get quickWorkoutOpenProgress => '打开个人进步';

  @override
  String get quickWorkoutPreviewTitle => '快速训练 · 全身';

  @override
  String get quickWorkoutStart => '开始';

  @override
  String get quickWorkoutSwap => '更换';

  @override
  String get quickWorkoutNoAlternatives => '该肌群没有其他动作';

  @override
  String get muscleGroupPromptTitle => '肌群';

  @override
  String get muscleGroupPromptBody => '用于快速组成全身训练。';

  @override
  String get muscleGroupLater => '稍后';

  @override
  String get muscleGroupClear => '清除';

  @override
  String get muscleGroupSkip => '不用于快速训练';

  @override
  String get muscleGroupChest => '胸';

  @override
  String get muscleGroupBack => '背';

  @override
  String get muscleGroupShoulders => '肩';

  @override
  String get muscleGroupCore => '核心';

  @override
  String get muscleGroupQuads => '大腿前侧';

  @override
  String get muscleGroupHamstrings => '大腿后侧';

  @override
  String get muscleGroupArmFlex => '手臂屈曲';

  @override
  String get muscleGroupArmExt => '手臂伸展';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => '训练日历';

  @override
  String get personalProgress => '个人进步';

  @override
  String get personalProgressSearchHint => '搜索动作';

  @override
  String get personalProgressBestSet => '最佳组';

  @override
  String get personalProgressMaxVolume => '最大容量';

  @override
  String get personalProgressEmpty => '暂无训练动作';

  @override
  String get favoriteExercises => '收藏动作';

  @override
  String get favoriteExercisesEmpty => '暂无收藏动作';

  @override
  String get buildWorkoutFromFavorites => '组装训练';

  @override
  String get exerciseHint => '输入动作名称';

  @override
  String get deleteFromHistory => '从记录中移除？';

  @override
  String get deleteExerciseHint => '将不再出现在建议和个人进步中。';

  @override
  String get exerciseDeleted => '已移除';

  @override
  String get deleteWorkoutTitle => '删除';

  @override
  String get deleteWorkoutMsg => '删除此次训练？进度记录将丢失。';

  @override
  String get removeSetWithDataConfirm => '删除包含数据的组？此操作无法撤销。';

  @override
  String get removeExerciseFromWorkout => '移除动作';

  @override
  String get removeExerciseFromWorkoutConfirm => '从本次训练中移除这个动作？此操作无法撤销。';

  @override
  String get deleteClientTitle => '删除客户';

  @override
  String get deleteClientMsg => '确定要删除该客户？其所有未来训练将被移除。';

  @override
  String get noClientsTitle => '暂无客户';

  @override
  String get noClientsMsg => '请先在「客户」菜单中添加客户。';

  @override
  String get newClient => '新客户';

  @override
  String get editClient => '编辑';

  @override
  String get clientName => '姓名';

  @override
  String get clientNameCannotChange => '姓名之后无法更改。';

  @override
  String get clientNameTaken => '此姓名已被使用。请选择另一个。';

  @override
  String get clientGoal => '目标';

  @override
  String get clientWeight => '体重';

  @override
  String get clientHeight => '身高';

  @override
  String get clientNotes => '备注';

  @override
  String get saveClientChanges => '保存更改';

  @override
  String get clientProfileUnsavedTitle => '未保存的更改';

  @override
  String get clientProfileUnsavedMessage => '有未保存的更改。是否在退出前保存？';

  @override
  String get clientProfileStay => '留下';

  @override
  String get clientProfileDiscard => '不保存退出';

  @override
  String get clientProfileSaveAndLeave => '保存并退出';

  @override
  String get workoutRecoveryTitle => '训练已中断';

  @override
  String get workoutRecoveryMessage => '您上一次训练意外结束。可从已保存的数据继续，或删除未保存的内容。';

  @override
  String get workoutRecoveryContinue => '继续训练';

  @override
  String get workoutRecoveryDelete => '删除训练';

  @override
  String get workoutRecoverySessionMissing => '已删除预约的客户训练。未保存的草稿已清除。';

  @override
  String get fillCurrentExerciseBeforeAdd => '请先完成当前动作，再添加下一个。';

  @override
  String get switchWorkoutTypeTitle => '切换训练类型？';

  @override
  String get switchWorkoutTypeBody => '另一种类型已填写的组不会保存在这次训练中。';

  @override
  String get switchWorkoutTypeConfirm => '切换';

  @override
  String get saveWorkoutNothingToSave => '还没有可保存的内容。请填写重量和次数，或有氧时长。';

  @override
  String get importedHistoryBadge => '已导入';

  @override
  String get clientWorkoutHistoryEmpty => '暂无训练记录';

  @override
  String exerciseNumberedTitle(int n) {
    return '动作 $n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return '动作 $n：$exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return '$n';
  }

  @override
  String get clientProfileSectionGoal => '目标';

  @override
  String get clientProfileSectionAnthropometry => '身体测量';

  @override
  String get clientProfileSectionTrainerNotes => '教练备注';

  @override
  String get clientProfileSectionWorkoutHistory => '训练历史';

  @override
  String get clientTrainerNotesHint => '损伤、说明、计划…';

  @override
  String get trainerSessionDefaultTitle => '训练';

  @override
  String get durationMinutesShort => '分';

  @override
  String get addTraining => '添加训练';

  @override
  String get repeatLastWorkout => '重复上次训练';

  @override
  String get repeatLastUnavailable => '该客户还没有可重复的训练。';

  @override
  String get editPlan => '编辑计划';

  @override
  String get trainerSessionEmpty => '尚未安排动作';

  @override
  String trainerSessionPlanned(int n) {
    return '已安排 $n 项';
  }

  @override
  String get trainerClientsEmpty => '还没有客户。先添加一位再开始排课。';

  @override
  String get clientNeverTrained => '暂无训练';

  @override
  String get clientNoUpcoming => '没有即将到来的课次';

  @override
  String clientLastSession(String when) {
    return '上次：$when';
  }

  @override
  String clientNextSession(String when) {
    return '下次：$when';
  }

  @override
  String get clientSessionToday => '今天';

  @override
  String get clientSessionYesterday => '昨天';

  @override
  String get clientSessionTomorrow => '明天';

  @override
  String clientSessionDaysAgo(int n) {
    return '$n 天前';
  }

  @override
  String clientSessionInDays(int n) {
    return '$n 天后';
  }

  @override
  String get clientProfileDetails => '资料';

  @override
  String get addSessionPickClient => '选择客户';

  @override
  String get clientLabel => '客户';

  @override
  String get deleteClientBtn => '删除客户';

  @override
  String get clientsMenu => '客户';

  @override
  String get dateHeader => '日期';

  @override
  String get clientHeader => '客户';

  @override
  String get exerciseHeader => '动作';

  @override
  String get typeHeader => '类型';

  @override
  String get strengthType => '力量';

  @override
  String get cardioType => '有氧';

  @override
  String get weightHeader => '重量';

  @override
  String get weightUnitsChoiceShort => '公斤 / lb';

  @override
  String get progressChartWeightLegend => '重量 — 公斤 / lb（单位自选）';

  @override
  String get progressChartVolumeLegend => '训练量（吨位）';

  @override
  String get repsHeader => '次数';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => '时间（分钟）';

  @override
  String get intensityHeader => '强度';

  @override
  String get setHeader => '组';

  @override
  String get strength => '力量';

  @override
  String get cardio => '有氧';

  @override
  String get timeMin => '时间（分钟）';

  @override
  String get intensity => '强度';

  @override
  String get reserve => '储备';

  @override
  String get sets => '组数';

  @override
  String get time => '时间';

  @override
  String get rest => '休息';

  @override
  String get settings => '设置';

  @override
  String get max => '最大';

  @override
  String get totalVolume => '总容量';

  @override
  String get chart => '图表';

  @override
  String get progress => '进度';

  @override
  String get dayMonday => '星期一';

  @override
  String get dayTuesday => '星期二';

  @override
  String get dayWednesday => '星期三';

  @override
  String get dayThursday => '星期四';

  @override
  String get dayFriday => '星期五';

  @override
  String get daySaturday => '星期六';

  @override
  String get daySunday => '星期日';

  @override
  String get greetingHi => '你好';

  @override
  String get greetingMorning => '早上好';

  @override
  String get greetingAfternoon => '下午好';

  @override
  String get greetingEvening => '晚上好';

  @override
  String get monthJanuary => '一月';

  @override
  String get monthFebruary => '二月';

  @override
  String get monthMarch => '三月';

  @override
  String get monthApril => '四月';

  @override
  String get monthMay => '五月';

  @override
  String get monthJune => '六月';

  @override
  String get monthJuly => '七月';

  @override
  String get monthAugust => '八月';

  @override
  String get monthSeptember => '九月';

  @override
  String get monthOctober => '十月';

  @override
  String get monthNovember => '十一月';

  @override
  String get monthDecember => '十二月';

  @override
  String get exerciseBenchPress => '卧推';

  @override
  String get exerciseSquat => '深蹲';

  @override
  String get exerciseRow => '划船';

  @override
  String get exerciseDeadlift => '硬拉';

  @override
  String get exerciseOverheadPress => '推举';

  @override
  String get exercisePullUp => '引体向上';

  @override
  String get exerciseLunges => '弓步蹲';

  @override
  String get exercisePlank => '平板支撑';

  @override
  String get saveWorkout => '保存训练';

  @override
  String get deleteWorkout => '删除训练';

  @override
  String get deleteTraining => '删除训练';

  @override
  String get deleteTrainingQuestion => '从日程中删除此次训练？';

  @override
  String get addSetButton => '添加组';

  @override
  String get progressButton => '进度';

  @override
  String get filterMonth => '月';

  @override
  String get filterYear => '年';

  @override
  String get filterAllTime => '全部';

  @override
  String get noteLabel => '备注';

  @override
  String get addClient => '添加客户';

  @override
  String get workoutsToday => '今日训练';

  @override
  String get workoutNumberPrefix => '训练 #';

  @override
  String get noEntries => '无记录';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => '隐私政策';

  @override
  String get instructionButton => '说明';

  @override
  String get instructionTitle => '一切如何运作';

  @override
  String get instructionHubManifest => '没有动作库，也没有现成计划。动作名称由你用自己的话说 — 应用据此记录数据。';

  @override
  String get instructionSearchHint => '搜索说明';

  @override
  String get instructionSearchEmpty => '没有找到内容。';

  @override
  String get instructionChapterStartTitle => '从哪里开始';

  @override
  String get instructionChapterStartBlurb => '主屏幕、两种模式，以及应用的思路。';

  @override
  String get instructionChapterSessionTitle => '训练当中';

  @override
  String get instructionChapterSessionBlurb => '组数、重量、次数、RIR、有氧，以及结束本次训练。';

  @override
  String get instructionChapterTimerTitle => '秒表';

  @override
  String get instructionChapterTimerBlurb => '间歇、组间休息和提示音。';

  @override
  String get instructionChapterExercisesTitle => '动作与肌群';

  @override
  String get instructionChapterExercisesBlurb => '自己的动作列表、肌群、收藏和快速训练。';

  @override
  String get instructionChapterProgressTitle => '进步与纪录';

  @override
  String get instructionChapterProgressBlurb => '个人进步、1RM、容量和动作曲线。';

  @override
  String get instructionChapterRhythmTitle => '节奏与恢复';

  @override
  String get instructionChapterRhythmBlurb => '每周节奏量表和减载周。';

  @override
  String get instructionChapterDataTitle => '历史与数据';

  @override
  String get instructionChapterDataBlurb => '日历、修改记录、统计和备份。';

  @override
  String get instructionChapterCoachTitle => '教练模式';

  @override
  String get instructionChapterCoachBlurb => '客户、日程、课表和打印。';

  @override
  String get instructionPhilosophy =>
      'IronVibe 不教你怎么练，也不给出现成计划 — 那是教练和你自己经验的事。这里没有上千条动作库：名称由你用自己的话输入，应用只负责把数字算清楚。全部留在本机：没有账号，没有订阅，没有广告。';

  @override
  String get instructionSectionHome => '主屏幕';

  @override
  String get instructionThemeTitle => '主题';

  @override
  String get instructionThemeDesc => '太阳—月亮开关切换浅色与深色。选择会被记住。';

  @override
  String get instructionTrainSelfTitle => '自己训练';

  @override
  String get instructionTrainSelfDesc => '你的空间：训练、日历、个人进步、收藏和节奏量表。';

  @override
  String get instructionTrainOthersTitle => '训练他人';

  @override
  String get instructionTrainOthersDesc =>
      '教练模式：客户、日程，以及每人一份独立历史。不会和你自己的训练混在一起。';

  @override
  String get instructionLanguageTitle => '语言';

  @override
  String get instructionLanguageDesc => '应用跟随系统语言 — 没有单独设置。支持十种语言。';

  @override
  String get instructionHomeLinksTitle => '版本与联系';

  @override
  String get instructionHomeLinksDesc => '主屏幕底部是版本号、网站、Telegram、支持邮箱和隐私政策。';

  @override
  String get instructionSectionAthleteMenu => '你的训练';

  @override
  String get instructionStartWorkoutTitle => '开始训练';

  @override
  String get instructionStartWorkoutDesc =>
      '打开一次空白训练 — 不会复制上次。添加动作、记下组数，结束后保存。';

  @override
  String get instructionQuickWorkoutTitle => '快速训练';

  @override
  String get instructionQuickWorkoutDesc => '按你标好的肌群，从四个动作拼出一次全身训练。';

  @override
  String get instructionCalendarMenuTitle => '训练日历';

  @override
  String get instructionCalendarMenuDesc => '你练过的日子。从这里打开已保存的训练，或补上漏记的一次。';

  @override
  String get instructionSectionPersonalProgress => '个人进步';

  @override
  String get instructionPersonalProgressMenuDesc => '每个动作的最佳组、估算 1RM 和最大容量表。';

  @override
  String get instructionFavoritesMenuTitle => '收藏动作';

  @override
  String get instructionFavoritesMenuDesc => '标了星的动作。点几下就能用它们拼出一次训练。';

  @override
  String get instructionSectionWorkout => '本次训练';

  @override
  String get instructionStrengthCardioTitle => '力量或有氧';

  @override
  String get instructionStrengthCardioDesc =>
      '训练顶部的开关决定类型。力量：重量、次数和 RIR；有氧：时间和强度。若已填入另一种类型的数据，应用会先确认。';

  @override
  String get instructionAddExerciseTitle => '添加动作';

  @override
  String get instructionAddExerciseBody => '当前动作有了名称、并且至少填好一组之后，才会加上新的一块。';

  @override
  String get instructionPreviousHintsTitle => '灰色提示';

  @override
  String get instructionPreviousHintsDesc =>
      '上次的重量和次数显示为灰色 — 那是要超越的参照，不是已经记下的一组。只有你亲手输入的数字会进入历史。';

  @override
  String get instructionRemoveExerciseTitle => '去掉动作';

  @override
  String get instructionRemoveExerciseDesc => '红色叉号只从当前训练去掉这一块。已保存的历史不会改。';

  @override
  String get instructionSectionSetControl => '一组那一行';

  @override
  String get instructionSetPlusLabel => '加';

  @override
  String get instructionSetPlusDesc => '为下一组加上空行。';

  @override
  String get instructionSetMinusLabel => '减';

  @override
  String get instructionSetMinusDesc => '去掉最后一组。空行立刻删，填过的要确认。如果只剩一组，字段会直接清空。';

  @override
  String get instructionSetProgressLabel => '动作曲线';

  @override
  String get instructionSetProgressDesc => '打开这个动作按月、按年或全部时间的走势。';

  @override
  String get instructionExerciseVolumeTitle => '动作容量';

  @override
  String get instructionExerciseVolumeDesc =>
      '曲线按钮右侧：所有已填组的「重量 × 次数」之和。输入时即时重算。';

  @override
  String get instructionSectionInputs => '字段是什么意思';

  @override
  String get instructionWeightTitle => '重量';

  @override
  String get instructionWeightBody => '器械上的工作重量。用公斤或磅都可以 — 应用不换算，也不强迫你选单位。';

  @override
  String get instructionRepsTitle => '次数';

  @override
  String get instructionRepsBody => '这一组做了多少次。';

  @override
  String get instructionRirTitle => 'RIR — 剩余次数';

  @override
  String get instructionRirBody => '做完之后还能再做几下。0 是做到力竭，∞ 是热身组。用来给强度定量，很简单。';

  @override
  String get instructionOneRmTitle => '1RM — 一次最大力量';

  @override
  String get instructionOneRmDesc =>
      '按埃普利公式、用该组重量和次数估出的单次最大重量。显示在行下方 — 力量的关键参照。';

  @override
  String get instructionSectionCardio => '有氧';

  @override
  String get instructionCardioTitle => '时间';

  @override
  String get instructionCardioBody => '这一块持续多少分钟。没有距离，也没有心率：应用不连接任何手环。';

  @override
  String get instructionIntensityTitle => '强度';

  @override
  String get instructionIntensityBody =>
      '用力程度 1 到 5 — 简化版 RPE。有氧训练里，每个动作只保存一行。';

  @override
  String get instructionSectionSaving => '结束';

  @override
  String get instructionFinishTitle => '结束训练';

  @override
  String get instructionFinishBody => '训练底部的按钮：应用会再确认一次，然后写入历史。至少要有一组填好的数据。';

  @override
  String get instructionLeaveWorkoutTitle => '提前离开';

  @override
  String get instructionLeaveWorkoutDesc => '关掉已经有数据的训练时，可以留下、保存已记的内容，或删除草稿。';

  @override
  String get instructionAutoSaveTitle => '中断的训练';

  @override
  String get instructionAutoSaveDesc =>
      '草稿会自己保存 — 每分钟一次，切到后台时也会。下次打开可从原处继续，或删掉它。';

  @override
  String get instructionScreenAwakeTitle => '屏幕不休眠';

  @override
  String get instructionScreenAwakeDesc => '进行中的训练会保持亮屏，这样就不必每做完一组都解锁手机。';

  @override
  String get instructionStopwatchWhyTitle => '为什么要计休息';

  @override
  String get instructionStopwatchWhyBody =>
      '组间停顿和工作重量、次数一样，是训练参数：休息短，密度高；休息长，才有力气冲击大重量。';

  @override
  String get instructionStopwatchHowTitle => '开始、暂停、复位';

  @override
  String get instructionStopwatchHowBody =>
      '计时器钉在训练顶栏，滑动页面时仍看得见。中间是时间和控制；普通模式向上计时，带百分之一秒。';

  @override
  String get instructionStopwatchIntervalsTitle => '左侧：间歇';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 一分钟做、一分钟歇。4/4 — 各四分钟。20/10 — Tabata。阶段循环到你暂停或复位：偏红是做，偏蓝是歇。';

  @override
  String get instructionStopwatchRestTitle => '右侧：休息';

  @override
  String get instructionStopwatchRestBody =>
      '+1m、+2m 和 +5m 启动组间倒计时。若倒计时已在走，分钟会加到剩余时间上；间歇循环会切到休息。';

  @override
  String get instructionStopwatchProgressTitle => '阶段条';

  @override
  String get instructionStopwatchProgressBody => '倒计时和间歇模式下，数字下方能看出当前阶段还剩多少。';

  @override
  String get instructionStopwatchSoundsTitle => '声音与振动';

  @override
  String get instructionStopwatchSoundsBody =>
      '阶段结束前三、二、一秒 — 短促一声加轻微振动，换阶段时更明显。声音做在应用里：不需要麦克风，也不需要通知权限，音量跟手机设置走。';

  @override
  String get instructionExerciseBankIntro =>
      '动作列表自己会长：完成训练里的每个新名称都会进入联想。名称存成大写，同一个动作就不会被拆成两条。';

  @override
  String get instructionSectionExerciseNameTools => '名称';

  @override
  String get instructionRenameExerciseTitle => '处处改名';

  @override
  String get instructionRenameExerciseDesc =>
      '长按名称 — 在训练里、联想列表里，或已保存的训练里。历史和曲线上的名字会一起更新。';

  @override
  String get instructionRemoveFromBankTitle => '移出联想';

  @override
  String get instructionRemoveFromBankDesc =>
      '打开的联想列表里的叉号，或个人进步里的红叉，会把名称从联想和表格里拿掉。已保存的训练不动。';

  @override
  String get instructionReassignExerciseTitle => '在记录里替换';

  @override
  String get instructionReassignExerciseDesc =>
      '已保存的训练里，可以把这一块改指到另一个动作。组数照旧，但会算进新名称的统计 — 只改这一次。';

  @override
  String get instructionSectionMuscleGroups => '肌群';

  @override
  String get instructionMuscleGroupsIntro =>
      '肌群是名称上的可选标签。只给快速训练用来拼一次均衡的全身课。八个组：胸、背、肩、核心、大腿前侧、大腿后侧、手臂屈曲、手臂伸展。';

  @override
  String get instructionMuscleGroupTagTitle => '怎么打标签';

  @override
  String get instructionMuscleGroupTagDesc =>
      '第一次输入新名称时，应用会问肌群。可以选「稍后」，或「不用于快速训练」如果这个动作不该进拼盘。个人进步和收藏里名称下方的标签，改或去掉都很方便。';

  @override
  String get instructionSectionFavorites => '收藏';

  @override
  String get instructionFavoriteStarTitle => '星星';

  @override
  String get instructionFavoriteStarDesc => '训练里的动作卡片上有星，个人进步表里也有。收藏会排在列表最上面。';

  @override
  String get instructionBuildFromFavoritesTitle => '组装训练';

  @override
  String get instructionBuildFromFavoritesDesc =>
      '在收藏页勾上要的动作 — 按钮马上出现。训练按这个顺序打开，并带上次的灰色提示。对客户，同一操作打开的是他的训练。';

  @override
  String get instructionSectionQuickWorkout => '快速训练';

  @override
  String get instructionQuickWorkoutHowTitle => '四个位置';

  @override
  String get instructionQuickWorkoutHowDesc =>
      '胸、背、腿的一半（大腿前侧或后侧 — 同一天不会两个都上），再加一个肩、手臂或核心。每个位置应用会选最久没练的那一组，并优先用收藏。';

  @override
  String get instructionQuickWorkoutPreviewTitle => '预览和更换';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      '开始前能看到全部阵容：任一位置都可以换成同肌群的另一个动作。标过的动作不够时，应用会说明，并打开个人进步让你补标签。';

  @override
  String get instructionPersonalProgressIntro =>
      '已保存训练里所有动作的一张表。收藏在上，其余按字母排；搜索按名称找。从训练菜单或客户资料打开。';

  @override
  String get instructionProgressBestSetTitle => '最佳组';

  @override
  String get instructionProgressBestSetDesc =>
      '全部历史里估算 1RM 最高的那一组。没有重量的动作，则取次数最多的一组。';

  @override
  String get instructionProgressMaxVolumeTitle => '最大容量';

  @override
  String get instructionProgressMaxVolumeDesc =>
      '这个动作单次训练里的最大容量 — 安排工作量时很好用的锚点。';

  @override
  String get instructionSectionProgressChart => '动作曲线';

  @override
  String get instructionProgressChartIntro =>
      '三条彼此独立、按日期画的线。左边是重量刻度，右边是次数；黄线做过归一，方便按走势比较。时段可切月、年或全部，点一下能看到当天数字。有氧不进这张图。';

  @override
  String get instructionProgressLineWeightDesc => '红 — 当天单组最大重量。';

  @override
  String get instructionProgressLineRepsDesc => '青 — 单组最多次数，不一定配最大重量。';

  @override
  String get instructionProgressLineVolumeDesc =>
      '黄 — 当日容量：两个字段都填了的组，「重量 × 次数」之和。';

  @override
  String get instructionProgressChartSessionHighlight =>
      '正在练的时候，打破纪录会点亮曲线按钮：红是组重量，黄是动作容量，青是无重量动作的次数合计。同时满足时优先红，然后黄，再青。已保存的历史没有高亮。';

  @override
  String get instructionRhythmIntro =>
      '过去四周里只要凑够三个力量日，训练屏幕顶部就会出现节奏量表。这不是目标，也不是打分 — 只是你现在去健身房的频率。';

  @override
  String get instructionRhythmGaugeTitle => '每周几天';

  @override
  String get instructionRhythmGaugeDesc =>
      '弧从一天填到六天 — 四周平均值。有力量训练的日子算，只有有氧的日子不算。节奏越密，颜色越从钢色经过金色走向锈色。';

  @override
  String get instructionRhythmInsightTitle => '节奏解读';

  @override
  String get instructionRhythmInsightDesc =>
      '点量表：应用会叫出你的状态 — 节奏轻松、平稳、偏密，或几乎没有休息日 — 并说明这对恢复意味着什么。教练客户的量表打开同样的解读。';

  @override
  String get instructionRhythmDeloadTitle => '减载周';

  @override
  String get instructionRhythmDeloadDesc =>
      '减载不是停训，而是半力一周：工作重量和组数下调 30–50%，或只做有氧。肌肉恢复得比韧带、肌腱和关节快 — 这一周是让它们跟上。';

  @override
  String get instructionRhythmNudgeTitle => '提醒';

  @override
  String get instructionRhythmNudgeDesc =>
      '如果你每周保持两次半以上、又很久没减载，应用会建议安排这样一周。节奏越密，提示来得越早。最多每周一次，而且只在个人模式 — 这是建议，不是医嘱。';

  @override
  String get instructionSectionCalendar => '日历与历史';

  @override
  String get instructionCalendarBrowseTitle => '怎么翻';

  @override
  String get instructionCalendarBrowseDesc =>
      '左右滑切换月份，点月份名称可快速选日期。数字下的点表示那天有训练。';

  @override
  String get instructionCalendarAddTitle => '补记过去';

  @override
  String get instructionCalendarAddDesc =>
      '选一天、定时间，再添加训练 — 包括已经过去的日期。忘了记的时候很方便。';

  @override
  String get instructionNavHistoryTitle => '训练容量';

  @override
  String get instructionNavHistoryDesc =>
      '每次已保存的训练都标有总容量。容量是肥大最稳的参照之一：重要的不是某一天的纪录，而是它一周周能不能站住。';

  @override
  String get instructionHistoryEditTitle => '修改记录';

  @override
  String get instructionHistoryEditDesc =>
      '已保存的训练可以展开再改：加动作或加组、改数字、整次删掉。改完立刻保存。';

  @override
  String get instructionSectionStats => '统计';

  @override
  String get instructionStatsTitle => '训练汇总';

  @override
  String get instructionStatsDesc =>
      '训练或教练屏幕顶栏的图表图标：本月、本年和全部时间有多少次。教练模式还会按客户拆开。';

  @override
  String get instructionSectionBackup => '备份';

  @override
  String get instructionNavImportExportTitle => '导出与导入';

  @override
  String get instructionNavImportExportDesc =>
      '导出把历史、动作列表、收藏、肌群标签、客户和日程打进一个 JSON 文件。导入会并进现有数据并跳过重复 — 不会覆盖。教练备份和个人备份是分开的。';

  @override
  String get instructionBackupNudgeTitle => '备份提醒';

  @override
  String get instructionBackupNudgeDesc =>
      '数据只活在这台设备上：没有账号，也没有云。每四周应用会请你存一份副本 — 手机丢了，历史只能从那个文件回来。';

  @override
  String get instructionTrainerIntro =>
      '「训练他人」是带人的独立空间：客户、日程、每人一份历史。自己的训练和教练数据互不交叉。';

  @override
  String get instructionClientsTitle => '客户';

  @override
  String get instructionClientsDesc =>
      '列表里有目标、上次和下次课。卡片上是目标、体重、身高和教练私密备注。姓名在创建时定下，之后不能改。';

  @override
  String get instructionClientProfileTitle => '客户资料';

  @override
  String get instructionClientProfileDesc =>
      '今天的训练从这里开始，进步、收藏和按月历史也在这里。力量日够多时，节奏量表也在。删除客户会拿掉未来的课，过去的训练仍留着做记录。';

  @override
  String get instructionTrainerScheduleTitle => '日程';

  @override
  String get instructionTrainerScheduleDesc =>
      '教练日历显示所有客户的课：播放图标是已计划，勾是已完成，沙漏是今天进行中。过去日期的空计划会自己清掉。';

  @override
  String get instructionTrainerPlanTitle => '课表';

  @override
  String get instructionTrainerPlanDesc =>
      '未来日期可以先排好动作和备注并保存，不必结束训练。上次的重量和次数会以灰色提示出现。只有完成的课才进历史。';

  @override
  String get instructionTrainerRepeatTitle => '重复上次';

  @override
  String get instructionTrainerRepeatDesc =>
      '从客户资料，或在日历里添加课时用开关。复制的是动作名单；重量和次数是灰色提示，不是现成的组。';

  @override
  String get instructionPrintSessionTitle => '打印本次';

  @override
  String get instructionPrintSessionDesc =>
      '已完成的训练里，顶栏打印图标会做成一张当天动作和数字的 A4。然后是系统窗口：打印机、PDF 或发给客户。';

  @override
  String get instructionImportAthleteTitle => '导入运动员历史';

  @override
  String get instructionImportAthleteDesc =>
      '教练统计里的单独按钮：个人模式导出的文件会建成新客户，连同收藏和肌群标签。转过来的训练标成已导入，动作名称不和你的混在一起。';

  @override
  String get printSession => '打印';

  @override
  String get printSessionEmpty => '还没有可打印的内容。至少记下一组。';

  @override
  String get printSessionShareText => 'IronVibe 课次';

  @override
  String get rhythmPerWeek => '每周';

  @override
  String get deloadNudgeTitle => '主动恢复周？';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return '你大约每周训练 $rate 天，已持续约 $weeks 周。适合安排主动恢复周：工作重量和组数下调 30–50%，或只做有氧。这是建议，不是医嘱。';
  }

  @override
  String get deloadNudgeLater => '暂不';

  @override
  String get deloadNudgeOk => '知道了';

  @override
  String get backupNudgeTitle => '保存备份？';

  @override
  String get backupNudgeBody =>
      '数据只存在这台设备上。如果丢失或存储损坏，训练记录就没了。现在分享一份副本，或推迟 28 天。';

  @override
  String get backupNudgeShare => '分享';

  @override
  String get backupNudgeLater => '以后再说';

  @override
  String get rhythmInsightTitle => '训练节奏';

  @override
  String rhythmInsightRateYou(String rate) {
    return '你平均每周大约训练 $rate 次。';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name 平均每周大约训练 $rate 次。';
  }

  @override
  String get rhythmInsightBandLight => '节奏轻松';

  @override
  String get rhythmInsightBandSteady => '节奏平稳';

  @override
  String get rhythmInsightBandDense => '节奏偏密';

  @override
  String get rhythmInsightBandVeryDense => '几乎没有休息日';

  @override
  String get rhythmInsightHowTitle => '这个数字怎么来的';

  @override
  String get rhythmInsightWindow =>
      '过去四周的平均值。有力量训练的日子计入；纯有氧日不计。这不是目标，也不是评分——只是你眼下的节奏。';

  @override
  String get rhythmInsightWhatTitle => '主动恢复周';

  @override
  String get rhythmInsightWhatBody =>
      '不是停训，而是半力一周：工作重量和组数下调 30–50%。也可以完全放下力量，只做有氧或其他活动。肌肉恢复得比关节、韧带和肌腱快——这一周是让它们跟上。';

  @override
  String get rhythmInsightPaceTitle => '这意味着什么';

  @override
  String get rhythmInsightAdviceLight =>
      '课次之间空档够多，疲劳堆不起来。暂时不必特意安排主动恢复——按这个节奏，身体自己就能缓过来。';

  @override
  String get rhythmInsightAdviceSteady =>
      '平稳的节奏，可以练上好几年。如果课很重，隔几个月安排一个主动恢复周——最好赶在重量停住之前。';

  @override
  String get rhythmInsightAdviceDense =>
      '课排得很密，疲劳会悄悄堆积。每两到三个月一个主动恢复周，通常比不停硬扛更能保住进步。';

  @override
  String get rhythmInsightAdviceVeryDense =>
      '几乎天天都有负荷。睡眠和饮食跟得上的话也可以。按这个节奏，大约每月一个主动恢复周是关节和韧带的日常保养，不是偷懒。';

  @override
  String get rhythmInsightPraiseSteady => '能坚持好几年的，往往就是这种节奏。';

  @override
  String get rhythmInsightPraiseDense => '练得够勤——这种日程不会自己长出来。';

  @override
  String get rhythmInsightPraiseVeryDense => '看来你摸到了身体的秘密档位。';

  @override
  String get rhythmInsightRecentLighter => '最近负荷已经比平时低——主动恢复可以算过了。把节奏拉回来吧。';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: '这个节奏已经保持了 $weeks 周。',
      one: '这个节奏已经保持了 $weeks 周。',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer => '这是建议，不是医嘱。如果自我感觉正常，不必改任何东西。';
}
