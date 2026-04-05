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
  String get addSet => '+ 添加组';

  @override
  String get addExercise => '+ 添加动作';

  @override
  String get finishWorkout => '结束训练';

  @override
  String get startWorkout => '开始训练';

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
  String get exerciseHint => '输入动作名称';

  @override
  String get deleteFromHistory => '从记录中移除？';

  @override
  String get deleteExerciseHint => '将不再出现在建议中。';

  @override
  String get exerciseDeleted => '已移除';

  @override
  String get deleteWorkoutTitle => '删除';

  @override
  String get deleteWorkoutMsg => '删除此次训练？进度记录将丢失。';

  @override
  String get removeSetWithDataConfirm => '删除包含数据的组？此操作无法撤销。';

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
  String get addClient => '+ 添加客户';

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
      'IronVibe 刻意不做内置动作库或固定「计划」。它不是教你怎样练——那些事交给视频和教练——只帮你按自己的习惯记数据。动作名称由你亲自输入、用你的叫法，而不是在几千个条目里翻找。用得越久，界面越顺手：是应用迁就你，而不是你迁就应用。';

  @override
  String get instructionSectionSetControl => '组次控制';

  @override
  String get instructionSetMinusLabel => '减组';

  @override
  String get instructionSetMinusDesc => '删除最后一组；若该组有数据，应用会先确认。';

  @override
  String get instructionSetPlusLabel => '加组';

  @override
  String get instructionSetPlusDesc => '为当前动作新增一组。';

  @override
  String get instructionSetProgressLabel => '时间线';

  @override
  String get instructionSetProgressDesc => '打开该动作的进度时间线。';

  @override
  String get instructionSectionProgressChart => '进度图';

  @override
  String get instructionProgressChartIntro =>
      '按日期的两条独立曲线：红色 — 当天单次最大重量（千克/磅）；青色 — 单次最多次数（任意重量）。左侧重量轴，右侧次数轴。';

  @override
  String get instructionProgressLineWeightLabel => '重量';

  @override
  String get instructionProgressLineWeightDesc => '红线：每个日历日中单次举起的最大重量。';

  @override
  String get instructionProgressLineRepsLabel => '次数';

  @override
  String get instructionProgressLineRepsDesc => '青线：当天单次组中的最大重复次数（不必是最大重量那一组）。';

  @override
  String get instructionSectionWorkout => '训练';

  @override
  String get instructionAddExerciseTitle => '添加动作';

  @override
  String get instructionAddExerciseBody => '为新的训练动作创建一个新模块。';

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
      '名称下方建议列表打开时，点某一行的叉号可将该名称从个人词库中移除。';

  @override
  String get instructionSectionInputs => '数据字段';

  @override
  String get instructionWeightTitle => '重量';

  @override
  String get instructionWeightBody => '负重重量（公斤 / lb）。';

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
      '「个人进步」用于按动作跟踪力量进展：所有已保存记录中的动作集中在一张表里，便于对照。搜索可立即定位动作名称。入口：训练首页（日历下方的按钮）或客户资料页面。';

  @override
  String get instructionSectionSaving => '保存';

  @override
  String get instructionFinishTitle => '结束训练';

  @override
  String get instructionFinishBody => '将整次训练保存到历史记录。点击之前，数据不会被固定保存。';

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
  String get instructionNavHistoryDesc => '在日历查看已完成训练，并通过应用栏中的图表按钮打开汇总统计。';

  @override
  String get instructionNavImportExportTitle => '导入 / 导出';

  @override
  String get instructionNavImportExportDesc => '在统计弹窗中通过 JSON 导出与导入备份或迁移数据。';
}
