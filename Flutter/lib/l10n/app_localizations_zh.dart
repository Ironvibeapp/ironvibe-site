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
  String get instructionTitle => '使用说明';

  @override
  String get instructionPhilosophy =>
      'IronVibe 刻意不做内置动作库或固定「计划」。它不是教你怎样练——那些事交给视频和教练——只帮你按自己的习惯记数据。动作名称由你亲自输入。也可以给动作标上肌群，应用就会用你自己的列表拼出一次快速全身训练。用得越久，界面越顺手：是应用迁就你，而不是你迁就应用。';

  @override
  String get instructionSectionSetControl => '组次控制';

  @override
  String get instructionSetMinusLabel => '减组';

  @override
  String get instructionSetMinusDesc =>
      '删除最后一组。若该行已有重量、次数或 RIR，会先确认。空行会立即删除。若只剩一组：当前训练中清空该行；在已保存的历史中会删除整个动作。';

  @override
  String get instructionSetPlusLabel => '加组';

  @override
  String get instructionSetPlusDesc => '为当前动作新增一组空行。';

  @override
  String get instructionSetProgressLabel => '时间线';

  @override
  String get instructionSetProgressDesc => '打开该动作的进度时间线。';

  @override
  String get instructionSectionProgressChart => '进度图';

  @override
  String get instructionProgressChartIntro =>
      '按日期的三条独立曲线：红色 — 当天单组最大重量；青色 — 当天单组最多次数；黄色 — 动作训练量（当天重量×次数之和）。左轴是重量，右轴是次数；黄色线为归一化趋势线。';

  @override
  String get instructionProgressLineWeightLabel => '重量';

  @override
  String get instructionProgressLineWeightDesc => '红线：每个日历日中单次举起的最大重量。';

  @override
  String get instructionProgressLineRepsLabel => '次数';

  @override
  String get instructionProgressLineRepsDesc => '青线：当天单次组中的最大重复次数（不必是最大重量那一组）。';

  @override
  String get instructionProgressLineVolumeDesc =>
      '黄线：当日训练量（吨位），按已填写重量和次数的组，累计重量×次数计算。';

  @override
  String get instructionProgressChartSessionHighlight =>
      '进行中的训练里，组下方的图表按钮可能会与曲线使用相同色系：红色表示单组重量超过以往最佳；黄色表示该动作总训练量超过历史最佳；青色表示无负重且所有组的重复次数总和超过以往。若同时满足多项，优先级为红、黄、青。仅在当前正在记录的训练中显示，已保存的历史中不会出现。';

  @override
  String get instructionSectionWorkout => '训练';

  @override
  String get instructionAddExerciseTitle => '添加动作';

  @override
  String get instructionAddExerciseBody => '添加新模块。请先填写当前动作名称——字段为空时应用会提醒你。';

  @override
  String get instructionSectionExerciseNameTools => '动作名称';

  @override
  String get instructionRenameExerciseTitle => '长按可重命名';

  @override
  String get instructionRenameExerciseDesc =>
      '在输入时、列表建议上或历史记录中已保存训练的标题上长按名称，即可在各处同步更新名称。';

  @override
  String get instructionRemoveFromBankTitle => '从列表移除';

  @override
  String get instructionRemoveFromBankDesc =>
      '名称下方建议列表打开时，点某一行的叉号，或在「个人进步」中点红色叉号，即可从建议和进步表中移除该名称。已保存的训练记录不变。';

  @override
  String get instructionSectionInputs => '数据字段';

  @override
  String get instructionWeightTitle => '重量';

  @override
  String get instructionWeightBody => '器械或杠铃上的重量。按你习惯输入公斤或磅数值。应用不做单位换算。';

  @override
  String get instructionRepsTitle => '次数';

  @override
  String get instructionRepsBody => '单组完成的重复次数。';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody => '距离力竭前你还能完成的次数，用于跟踪强度。';

  @override
  String get instructionOneRmTitle => '1RM（单次最大重量）';

  @override
  String get instructionOneRmDesc =>
      '根据当前重量与次数估算的标准一次最大重量（1RM）。衡量力量的重要指标，便于跟踪进步与选择训练重量。';

  @override
  String get instructionExerciseVolumeTitle => '动作总容量';

  @override
  String get instructionExerciseVolumeDesc =>
      '组下方、进度按钮旁：所有同时填写了重量与次数的组，按 重量×次数 累加；实时随输入更新。';

  @override
  String get instructionSectionPersonalProgress => '个人进步';

  @override
  String get instructionPersonalProgressIntro =>
      '一张表汇总已保存训练中的所有动作：最佳组、估算 1RM、最大容量。搜索可立即定位名称。星星加入收藏；名称下的小标签指定肌群；红色叉号从建议和本表中移除该名称（已保存训练不变）。入口：训练菜单或客户资料。';

  @override
  String get instructionSectionSaving => '保存';

  @override
  String get instructionFinishTitle => '结束训练';

  @override
  String get instructionFinishBody =>
      '确认并把本次训练写入历史。若提前退出，可选择保存、丢弃草稿或留下。应用中途被打断时会自动保留草稿。';

  @override
  String get instructionSectionCardio => '有氧与强度';

  @override
  String get instructionCardioTitle => '有氧';

  @override
  String get instructionCardioBody => '记录有氧时长和强度（不含距离录入）。有助于把握节奏与主观用力。';

  @override
  String get instructionIntensityTitle => '强度';

  @override
  String get instructionIntensityBody =>
      '使用主观用力等级（RPE）判断训练有多吃力，这是在避免过度训练前提下持续进步的关键。';

  @override
  String get instructionSectionStopwatch => '秒表（你的助手）';

  @override
  String get instructionStopwatchWhyTitle => '为什么要用？';

  @override
  String get instructionStopwatchWhyBody => '用于控制组间休息。短休息提高训练密度，长休息有助于冲击大重量。';

  @override
  String get instructionStopwatchHowTitle => '如何工作？';

  @override
  String get instructionStopwatchHowBody =>
      '中间显示时间与开始/暂停、重置。左右两列是快捷预设（见下文）。纯秒表模式向上累加时间并显示到百分秒。滚动页面时计时仍固定在顶部栏。';

  @override
  String get instructionStopwatchIntervalsTitle => '左侧：间歇';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 工作 60 秒、休息 60 秒。4/4 — 每轮工作与休息各 4 分钟。20/10 — 经典 Tabata：运动 20 秒、休息 10 秒。选择后计时器循环切换工作与休息，直到暂停或重置。偏红表示工作阶段，偏蓝表示休息。';

  @override
  String get instructionStopwatchRestTitle => '右侧：休息倒计时';

  @override
  String get instructionStopwatchRestBody =>
      '+1m、+2m、+5m 以分钟为单位开始或延长倒计时。若正在跑间歇循环，会切换为这种倒计时；若倒计时已在进行，会把分钟数加到剩余时间。适合组间休息。';

  @override
  String get instructionStopwatchProgressTitle => '进度条';

  @override
  String get instructionStopwatchProgressBody =>
      '在倒计时与间歇模式下，时间下方会显示进度条，表示当前阶段还剩多少。';

  @override
  String get instructionStopwatchSoundsTitle => '提示音与振动';

  @override
  String get instructionStopwatchSoundsBody =>
      '每个阶段结束前 3、2、1 秒有应用内短促提示音与轻振动；阶段切换或倒计时归零时更明显。使用内置极简音频；无需麦克风与通知权限；音量仍受系统/媒体音量影响。';

  @override
  String get instructionSectionNavHistory => '历史与数据';

  @override
  String get instructionNavHistoryTitle => '历史 / 统计';

  @override
  String get instructionNavHistoryDesc =>
      '在日历/历史中，每次训练都会显示总吨位。训练量是评估肌肥大的最佳指标之一：高质量训练量越多，增肌潜力越大。';

  @override
  String get instructionNavImportExportTitle => '导入 / 导出';

  @override
  String get instructionNavImportExportDesc =>
      '在统计弹窗中通过 JSON 导出与导入备份或迁移数据。备份包含训练历史、动作列表、收藏和肌群标签。教练备份与个人历史分开。';

  @override
  String get instructionSectionHome => '主屏幕';

  @override
  String get instructionThemeTitle => '主题';

  @override
  String get instructionThemeDesc => '主屏幕上的太阳 / 月亮开关可切换浅色与深色。选择会被记住。';

  @override
  String get instructionTrainSelfTitle => '自己训练';

  @override
  String get instructionTrainSelfDesc =>
      '你的训练、日历、个人进步、收藏、训练节奏量表，以及根据已标记肌群拼出的快速全身训练。';

  @override
  String get instructionTrainOthersTitle => '训练他人';

  @override
  String get instructionTrainOthersDesc =>
      '教练模式：客户、日程，以及每人一份独立历史。每位客户都有自己的进步表和收藏。';

  @override
  String get instructionSectionAthleteMenu => '你的训练';

  @override
  String get instructionStartWorkoutTitle => '开始训练';

  @override
  String get instructionStartWorkoutDesc =>
      '打开空白训练——不会复制上次训练。添加动作、记录组次，然后结束以保存。';

  @override
  String get instructionQuickWorkoutTitle => '快速训练';

  @override
  String get instructionQuickWorkoutDesc =>
      '拼出 4 个动作的全身训练：胸、背、一条腿（大腿前侧或后侧——不同时练两边），再加肩、手臂或核心中最久没练的一组。优先收藏。上次的重量和次数以灰色显示为需要超越的目标——每组由你自己填写。';

  @override
  String get instructionCalendarMenuTitle => '训练日历';

  @override
  String get instructionCalendarMenuDesc =>
      '查看哪些天练过，打开已保存训练，或在选定日期和时间添加一次——包括过去的日期。';

  @override
  String get instructionPersonalProgressMenuDesc =>
      '最佳组、估算 1RM 和最大容量的表格。在这里收藏动作并标记肌群。';

  @override
  String get instructionFavoritesMenuTitle => '收藏动作';

  @override
  String get instructionFavoritesMenuDesc =>
      '标了星星的列表。勾选想练的，点「组建训练」按该顺序开始。上次的重量和次数以灰色显示为需要超越的目标。';

  @override
  String get instructionSectionRhythm => '训练节奏';

  @override
  String get instructionRhythmIntro =>
      '几次力量训练后，训练页顶部会出现量表。它显示过去四周平均每周练几天。纯有氧日不计。这是密度快照，不是应用要求你达到的目标。';

  @override
  String get instructionRhythmGaugeTitle => '每周天数';

  @override
  String get instructionRhythmGaugeDesc =>
      '弧线从每周 1 天填到 6 天。偏冷的钢色表示较轻松的节奏，偏暖的色调表示密度更高。该四周窗口内至少有三个力量日时才会出现量表。';

  @override
  String get instructionRhythmDeloadTitle => '轻松周提醒';

  @override
  String get instructionRhythmDeloadDesc =>
      '若你大约每周练两天半或更多、连续数周没有轻松周，应用可能建议把吨位和次数各减约 30%，休息一周。每周练得越密，提醒来得越早。这只是提醒，不是医嘱。每周最多出现一次。';

  @override
  String get instructionSectionFavorites => '收藏';

  @override
  String get instructionFavoriteStarTitle => '星星';

  @override
  String get instructionFavoriteStarDesc =>
      '在「个人进步」中点动作旁的星星即可加入或移出收藏。收藏会排在表格顶部。';

  @override
  String get instructionBuildFromFavoritesTitle => '组建训练';

  @override
  String get instructionBuildFromFavoritesDesc =>
      '在收藏页勾选动作。至少选一项后按钮才会出现。上次的重量和次数以灰色显示为需要超越的目标——每组由你自己填写。对客户执行同样操作会为该人开启训练。';

  @override
  String get instructionSectionMuscleGroups => '肌群与快速训练';

  @override
  String get instructionMuscleGroupsIntro =>
      '肌群是你给自己动作名贴的可选标签。不是动作库：只帮快速训练拼出均衡的全身组合。八个分组：胸、背、肩、核心、大腿前侧、大腿后侧、手臂屈曲、手臂伸展。';

  @override
  String get instructionMuscleGroupTagTitle => '如何标记';

  @override
  String get instructionMuscleGroupTagDesc =>
      '第一次输入新动作名时，应用会询问肌群。可点「稍后」，或标「不用于快速训练」以免进入全身组合。在个人进步或收藏里点名称下的小标签即可更改或清除。';

  @override
  String get instructionQuickWorkoutHowTitle => '快速训练如何组成';

  @override
  String get instructionQuickWorkoutHowDesc =>
      '四个槽位：胸、背、一条腿，然后按间隔最久选择肩/手臂/核心。预览中可把任意槽位换成同肌群的另一动作。如果不够，自己再加动作。';

  @override
  String get instructionStrengthCardioTitle => '力量 / 有氧';

  @override
  String get instructionStrengthCardioDesc =>
      '训练顶部切换。力量：重量、次数、RIR。有氧：仅时间和强度——没有距离字段。';

  @override
  String get instructionPreviousHintsTitle => '上次训练的灰色数字';

  @override
  String get instructionPreviousHintsDesc =>
      '在客户课次、快速训练或从收藏组建的训练中选择动作后，上次的重量和次数会以灰色显示——那是需要超越的最低目标，不是已经记完的一组。只有你亲手填写的数字会进入历史。';

  @override
  String get instructionRemoveExerciseTitle => '从本次训练移除';

  @override
  String get instructionRemoveExerciseDesc => '只从当前训练中移除该模块。在结束保存之前，历史记录不会改动。';

  @override
  String get instructionReassignExerciseTitle => '在历史中更换动作';

  @override
  String get instructionReassignExerciseDesc =>
      '在已保存的训练里可以把某模块改成另一个名称。只改这一次；图表按新名称统计。组次数据保留。';

  @override
  String get instructionAutoSaveTitle => '训练被打断';

  @override
  String get instructionAutoSaveDesc => '若应用在训练中途关闭，会询问是从中断处继续还是删除未保存草稿。';

  @override
  String get instructionSectionCalendar => '日历';

  @override
  String get instructionCalendarAddTitle => '按日期添加';

  @override
  String get instructionCalendarAddDesc => '选一天，再按选定时间添加训练。适合补记漏记的一次。';

  @override
  String get instructionSectionTrainer => '教练模式';

  @override
  String get instructionTrainerIntro =>
      '「训练他人」给教练用。添加客户、安排课次、提前排好动作，并按人记录训练。重复上次训练是可选项。教练数据的导入导出与个人历史分开。删除客户会取消未来课次，但过往训练会保留以便汇报。';

  @override
  String get instructionClientsTitle => '客户';

  @override
  String get instructionClientsDesc =>
      '添加、编辑或删除客户。列表显示上次和下次课次。资料字段：目标、体重、身高和教练私密备注。';

  @override
  String get instructionClientProfileTitle => '客户资料';

  @override
  String get instructionClientProfileDesc =>
      '从资料页开始今天的空白课次。上次的灰色数字只在选定动作后出现。历史只列出已完成的训练。未来课次在日历中安排。进步和收藏在同一页。未保存的资料修改在离开前会询问。';

  @override
  String get instructionTrainerPlanTitle => '预先排课';

  @override
  String get instructionTrainerPlanDesc =>
      '只在教练日历中安排：选择客户和日期，再填写动作。上次的重量和次数以灰色作为提示。已安排的课次带播放图标：点按可开始（当天）或删除。只有完成的训练进入历史。日期已过的计划会被删除。';

  @override
  String get instructionTrainerRepeatTitle => '重复上次训练';

  @override
  String get instructionTrainerRepeatDesc =>
      '可选。从客户资料，或在日历里添加课次时用开关。把上次课次的动作复制到今天的进行中训练或新计划；上次的重量和次数是灰色提示，不是已经完成的组。';

  @override
  String get rhythmPerWeek => '每周';

  @override
  String get deloadNudgeTitle => '轻松一周？';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return '你大约每周训练 $rate 天，已持续约 $weeks 周。这只是提醒，不是医嘱。按这个密度，通常值得把吨位和次数各减约 30%，休息一周。';
  }

  @override
  String get deloadNudgeLater => '暂不';

  @override
  String get deloadNudgeOk => '知道了';

  @override
  String get instructionHubManifest => '没有内置动作库或现成计划。动作名称由你自己写；应用按你的方式记录数据。';

  @override
  String get instructionChapterStartTitle => '开始使用';

  @override
  String get instructionChapterStartBlurb => '主屏幕、训练方式，以及应用为何不教你怎么练。';

  @override
  String get instructionChapterToolsTitle => '训练工具';

  @override
  String get instructionChapterToolsBlurb => '节奏、收藏、肌群标签和快速训练。';

  @override
  String get instructionChapterSessionTitle => '训练中';

  @override
  String get instructionChapterSessionBlurb => '组数、字段、有氧、保存和秒表。';

  @override
  String get instructionChapterProgressTitle => '进度与数据';

  @override
  String get instructionChapterProgressBlurb => '个人纪录、图表、日历、历史和备份。';

  @override
  String get instructionChapterCoachTitle => '教练模式';

  @override
  String get instructionChapterCoachBlurb => '学员、资料、计划课程和重复训练。';

  @override
  String get instructionSearchHint => '搜索指南';

  @override
  String get instructionSearchEmpty => '没有匹配的内容。';
}
