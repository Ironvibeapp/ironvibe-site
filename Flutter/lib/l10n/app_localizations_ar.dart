// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'أجواء تدريباتك';

  @override
  String get ok => 'حسنًا';

  @override
  String get cancel => 'إلغاء';

  @override
  String get renameExerciseTitle => 'إعادة تسمية التمرين';

  @override
  String get renameExerciseEmpty => 'لا يمكن أن يكون الاسم فارغًا';

  @override
  String get reassignHistoryExerciseTitle => 'تغيير التمرين';

  @override
  String get reassignHistoryExerciseBody =>
      'يتغيّر هذا التدريب فقط. المجموعات تبقى كما هي، ومخططات التقدم تتبع الاسم الجديد.';

  @override
  String get delete => 'حذف';

  @override
  String get yesDelete => 'نعم، احذف';

  @override
  String get close => 'إغلاق';

  @override
  String get save => 'حفظ';

  @override
  String get add => 'إضافة';

  @override
  String get trainOthers => 'أدرّب آخرين';

  @override
  String get trainSelf => 'أدرّب نفسي';

  @override
  String get statistics => 'إحصاءات';

  @override
  String get exportHistory => 'تصدير سجل التدريبات';

  @override
  String get historyEmpty => 'السجل فارغ، لا شيء للتصدير بعد';

  @override
  String get exportError => 'خطأ في التصدير:';

  @override
  String get exportJson => 'تصدير JSON';

  @override
  String get importData => 'استيراد';

  @override
  String get importSuccess => 'تم استيراد البيانات';

  @override
  String get importError => 'خطأ في الاستيراد:';

  @override
  String get importNewerVersion => 'أُنشئ الملف بإصدار أحدث من التطبيق';

  @override
  String get importFileAccessError => 'خطأ في الوصول إلى الملف';

  @override
  String get importInvalidJson => 'تنسيق JSON غير صالح';

  @override
  String get importInvalidBackupFile => 'خطأ: ملف النسخة المحدد غير صالح';

  @override
  String get importAthlete => 'استيراد رياضي';

  @override
  String importAthleteFound(int count) {
    return 'وُجدت سجلات $count تدريبات لرياضي غير موجود في قائمتك.';
  }

  @override
  String get importAthleteBackupOwn => 'احفظ بياناتي أولًا';

  @override
  String get importAthleteDecline => 'لا تُضف';

  @override
  String get importAthleteSuccess => 'تمت إضافة الرياضي';

  @override
  String get importAthleteNotAthleteFile => 'هذا الملف ليس سجل تدريبات رياضي.';

  @override
  String get importAthleteEmpty => 'لا توجد تدريبات في هذا الملف.';

  @override
  String get importAthleteAlreadyImported =>
      'هذه التدريبات موجودة أصلًا على هذا الجهاز.';

  @override
  String get importAthleteUseDedicatedButton =>
      'يبدو أن هذا سجل رياضي. استخدم استيراد رياضي بدلًا من ذلك.';

  @override
  String get shareText => 'سجل تدريبات IronVibe';

  @override
  String get monthStats => 'هذا الشهر';

  @override
  String get yearStats => 'هذه السنة';

  @override
  String get allTimeStats => 'كل الوقت';

  @override
  String get weight => 'الوزن';

  @override
  String get reps => 'التكرارات';

  @override
  String get rir => 'RIR';

  @override
  String get oneRm => '1RM';

  @override
  String get approxOneRm => '≈ 1RM:';

  @override
  String get kg => 'كغ';

  @override
  String get volumeShort => 'الحجم';

  @override
  String get addSet => 'إضافة مجموعة';

  @override
  String get addExercise => 'إضافة تمرين';

  @override
  String get finishWorkout => 'إنهاء التدريب';

  @override
  String get finishWorkoutConfirmTitle => 'إنهاء التدريب؟';

  @override
  String get finishWorkoutConfirmBody => 'سيُحفظ التدريب.';

  @override
  String get finishWorkoutConfirmAction => 'إنهاء';

  @override
  String get workoutCompleteTitle => 'تم حفظ التدريب';

  @override
  String get planChangesSavedTitle => 'تم حفظ التغييرات';

  @override
  String get startWorkout => 'بدء التدريب';

  @override
  String get quickWorkout => 'تدريب سريع';

  @override
  String get quickWorkoutFullBody => 'كامل الجسم';

  @override
  String get quickWorkoutInsufficientTitle => 'البيانات غير كافية';

  @override
  String get quickWorkoutInsufficientBody =>
      'التدريب السريع يحتاج تمارين موسومة للصدر والظهر وإحدى مجموعتي الساق (أمام الفخذ أو خلفه) وواحدة من الكتف أو الذراعين أو الجذع. ضع الوسوم في التقدم الشخصي — أو واصل التسجيل: سيطلب التطبيق ذلك عند إدخال تمرين جديد.';

  @override
  String get quickWorkoutOpenProgress => 'فتح التقدم الشخصي';

  @override
  String get quickWorkoutPreviewTitle => 'تدريب سريع · كامل الجسم';

  @override
  String get quickWorkoutStart => 'ابدأ';

  @override
  String get quickWorkoutSwap => 'تبديل';

  @override
  String get quickWorkoutNoAlternatives => 'لا يوجد تمرين آخر في هذه المجموعة';

  @override
  String get muscleGroupPromptTitle => 'مجموعة عضلية';

  @override
  String get muscleGroupPromptBody => 'تُستخدم لبناء تدريب سريع لكامل الجسم.';

  @override
  String get muscleGroupLater => 'لاحقًا';

  @override
  String get muscleGroupClear => 'مسح';

  @override
  String get muscleGroupSkip => 'ليس للتدريب السريع';

  @override
  String get muscleGroupChest => 'الصدر';

  @override
  String get muscleGroupBack => 'الظهر';

  @override
  String get muscleGroupShoulders => 'الكتفان';

  @override
  String get muscleGroupCore => 'الجذع';

  @override
  String get muscleGroupQuads => 'أمام الفخذ';

  @override
  String get muscleGroupHamstrings => 'خلف الفخذ';

  @override
  String get muscleGroupArmFlex => 'العضلة ذات الرأسين';

  @override
  String get muscleGroupArmExt => 'العضلة ثلاثية الرؤوس';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'تقويم التدريبات';

  @override
  String get personalProgress => 'التقدم الشخصي';

  @override
  String get personalProgressSearchHint => 'ابحث عن تمرين';

  @override
  String get personalProgressBestSet => 'أفضل مجموعة';

  @override
  String get personalProgressMaxVolume => 'أقصى حجم';

  @override
  String get personalProgressEmpty => 'لا تمارين في التدريبات بعد';

  @override
  String get favoriteExercises => 'التمارين المفضلة';

  @override
  String get favoriteExercisesEmpty => 'لا تمارين مفضلة بعد';

  @override
  String get buildWorkoutFromFavorites => 'بناء تدريب';

  @override
  String get exerciseHint => 'أدخل اسم التمرين';

  @override
  String get deleteFromHistory => 'إزالة من السجل؟';

  @override
  String get deleteExerciseHint =>
      'لن يظهر بعد الآن في الاقتراحات أو التقدم الشخصي.';

  @override
  String get exerciseDeleted => 'أُزيل';

  @override
  String get deleteWorkoutTitle => 'حذف';

  @override
  String get deleteWorkoutMsg => 'حذف هذا التدريب؟ سيضيع سجل التقدم.';

  @override
  String get removeSetWithDataConfirm =>
      'حذف مجموعة فيها بيانات؟ لا يمكن التراجع.';

  @override
  String get removeExerciseFromWorkout => 'إزالة التمرين';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'إزالة هذا التمرين من التدريب؟ لا يمكن التراجع.';

  @override
  String get deleteClientTitle => 'حذف العميل';

  @override
  String get deleteClientMsg =>
      'هل تريد حذف هذا العميل؟ ستُزال كل تدريباته القادمة.';

  @override
  String get noClientsTitle => 'لا عملاء';

  @override
  String get noClientsMsg => 'أضف العملاء أولًا من قائمة العملاء.';

  @override
  String get newClient => 'عميل جديد';

  @override
  String get editClient => 'تعديل';

  @override
  String get clientName => 'الاسم';

  @override
  String get clientLastName => 'اسم العائلة';

  @override
  String get clientLastNameRequired => 'أدخل اسم العائلة.';

  @override
  String get clientNameCannotChange =>
      'لا يمكن تغيير الاسم لاحقًا. يمكن إضافة اسم العائلة أو تصحيحه من بطاقة العميل.';

  @override
  String get clientNameTaken => 'يوجد عميل بهذا الاسم واسم العائلة.';

  @override
  String get clientGoal => 'الهدف';

  @override
  String get clientWeight => 'الوزن';

  @override
  String get clientHeight => 'الطول';

  @override
  String get clientNotes => 'ملاحظات';

  @override
  String get saveClientChanges => 'حفظ التغييرات';

  @override
  String get clientProfileUnsavedTitle => 'تغييرات غير محفوظة';

  @override
  String get clientProfileUnsavedMessage =>
      'لديك تغييرات غير محفوظة. هل تحفظ قبل المغادرة؟';

  @override
  String get clientProfileStay => 'البقاء';

  @override
  String get clientProfileDiscard => 'مغادرة دون حفظ';

  @override
  String get clientProfileSaveAndLeave => 'حفظ ومغادرة';

  @override
  String get workoutRecoveryTitle => 'انقطع التدريب';

  @override
  String get workoutRecoveryMessage =>
      'انتهى تدريبك السابق بشكل غير متوقع. تابع من حيث توقفت أو احذف البيانات غير المحفوظة.';

  @override
  String get workoutRecoveryContinue => 'متابعة التدريب';

  @override
  String get workoutRecoveryDelete => 'حذف التدريب';

  @override
  String get workoutRecoverySessionMissing =>
      'أُزيل تدريب العميل المجدول. مُسح المسودة غير المحفوظة.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'أنهِ التمرين الحالي قبل إضافة تمرين آخر.';

  @override
  String get switchWorkoutTypeTitle => 'تغيير نوع التدريب؟';

  @override
  String get switchWorkoutTypeBody =>
      'المجموعات المدخلة للنوع الآخر لن تُحفظ مع هذا التدريب.';

  @override
  String get switchWorkoutTypeConfirm => 'تغيير';

  @override
  String get saveWorkoutNothingToSave =>
      'لا شيء للحفظ بعد. أضف الوزن والتكرارات، أو المدة للكارديو.';

  @override
  String get importedHistoryBadge => 'مستورد';

  @override
  String get clientWorkoutHistoryEmpty => 'لا تدريبات بعد';

  @override
  String exerciseNumberedTitle(int n) {
    return 'تمرين #$n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'تمرين #$n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return '#$n';
  }

  @override
  String get clientProfileSectionGoal => 'الهدف';

  @override
  String get clientProfileSectionAnthropometry => 'القياسات';

  @override
  String get clientProfileSectionTrainerNotes => 'ملاحظات المدرب';

  @override
  String get clientProfileSectionWorkoutHistory => 'سجل التدريبات';

  @override
  String get clientTrainerNotesHint => 'إصابات، تفاصيل، خطة…';

  @override
  String get trainerSessionDefaultTitle => 'تدريب';

  @override
  String get durationMinutesShort => 'د';

  @override
  String get addTraining => 'إضافة تدريب';

  @override
  String get repeatLastWorkout => 'تكرار آخر تدريب';

  @override
  String get repeatLastUnavailable => 'لا يوجد لهذا العميل تدريب سابق لتكراره.';

  @override
  String get editPlan => 'تعديل الخطة';

  @override
  String get trainerSessionEmpty => 'لم يُخطط بعد';

  @override
  String trainerSessionPlanned(int n) {
    return 'مخطط: $n';
  }

  @override
  String get trainerClientsEmpty => 'لا عملاء بعد. أضف شخصًا لبدء الجدولة.';

  @override
  String get clientNeverTrained => 'لا تدريبات بعد';

  @override
  String get clientNoUpcoming => 'لا حصة قادمة';

  @override
  String clientLastSession(String when) {
    return 'آخر: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'التالي: $when';
  }

  @override
  String get clientSessionToday => 'اليوم';

  @override
  String get clientSessionYesterday => 'أمس';

  @override
  String get clientSessionTomorrow => 'غدًا';

  @override
  String clientSessionDaysAgo(int n) {
    return 'قبل $n يوم';
  }

  @override
  String clientSessionInDays(int n) {
    return 'بعد $n يوم';
  }

  @override
  String get clientProfileDetails => 'الملف';

  @override
  String get addSessionPickClient => 'اختر عميلًا';

  @override
  String get clientLabel => 'العميل';

  @override
  String get deleteClientBtn => 'حذف العميل';

  @override
  String get clientsMenu => 'العملاء';

  @override
  String get dateHeader => 'التاريخ';

  @override
  String get clientHeader => 'العميل';

  @override
  String get exerciseHeader => 'التمرين';

  @override
  String get typeHeader => 'النوع';

  @override
  String get strengthType => 'قوة';

  @override
  String get cardioType => 'كارديو';

  @override
  String get weightHeader => 'الوزن';

  @override
  String get weightUnitsChoiceShort => 'كغ / رطل';

  @override
  String get progressChartWeightLegend => 'الوزن — كغ / رطل (اختيارك)';

  @override
  String get progressChartVolumeLegend => 'الحجم (الحمولة)';

  @override
  String get repsHeader => 'التكرارات';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'الوقت (د)';

  @override
  String get intensityHeader => 'الشدة';

  @override
  String get setHeader => 'مجموعة';

  @override
  String get strength => 'قوة';

  @override
  String get cardio => 'كارديو';

  @override
  String get timeMin => 'الوقت (د)';

  @override
  String get intensity => 'الشدة';

  @override
  String get reserve => 'الاحتياط';

  @override
  String get sets => 'المجموعات';

  @override
  String get time => 'الوقت';

  @override
  String get rest => 'راحة';

  @override
  String get settings => 'الإعدادات';

  @override
  String get max => 'الأقصى';

  @override
  String get totalVolume => 'الحجم الكلي';

  @override
  String get chart => 'مخطط';

  @override
  String get progress => 'التقدم';

  @override
  String get dayMonday => 'الاثنين';

  @override
  String get dayTuesday => 'الثلاثاء';

  @override
  String get dayWednesday => 'الأربعاء';

  @override
  String get dayThursday => 'الخميس';

  @override
  String get dayFriday => 'الجمعة';

  @override
  String get daySaturday => 'السبت';

  @override
  String get daySunday => 'الأحد';

  @override
  String get greetingHi => 'مرحبًا';

  @override
  String get greetingMorning => 'صباح الخير';

  @override
  String get greetingAfternoon => 'طاب يومك';

  @override
  String get greetingEvening => 'مساء الخير';

  @override
  String get monthJanuary => 'يناير';

  @override
  String get monthFebruary => 'فبراير';

  @override
  String get monthMarch => 'مارس';

  @override
  String get monthApril => 'أبريل';

  @override
  String get monthMay => 'مايو';

  @override
  String get monthJune => 'يونيو';

  @override
  String get monthJuly => 'يوليو';

  @override
  String get monthAugust => 'أغسطس';

  @override
  String get monthSeptember => 'سبتمبر';

  @override
  String get monthOctober => 'أكتوبر';

  @override
  String get monthNovember => 'نوفمبر';

  @override
  String get monthDecember => 'ديسمبر';

  @override
  String get exerciseBenchPress => 'ضغط البنش';

  @override
  String get exerciseSquat => 'سكوات';

  @override
  String get exerciseRow => 'تجديف';

  @override
  String get exerciseDeadlift => 'رفعة ميتة';

  @override
  String get exerciseOverheadPress => 'ضغط فوق الرأس';

  @override
  String get exercisePullUp => 'شد لأعلى';

  @override
  String get exerciseLunges => 'طعنات';

  @override
  String get exercisePlank => 'بلانك';

  @override
  String get saveWorkout => 'حفظ التدريب';

  @override
  String get deleteWorkout => 'حذف التدريب';

  @override
  String get deleteTraining => 'حذف التدريب';

  @override
  String get deleteTrainingQuestion => 'حذف هذا التدريب من الجدول؟';

  @override
  String get addSetButton => 'إضافة مجموعة';

  @override
  String get progressButton => 'التقدم';

  @override
  String get filterMonth => 'شهر';

  @override
  String get filterYear => 'سنة';

  @override
  String get filterAllTime => 'كل الوقت';

  @override
  String get noteLabel => 'ملاحظة:';

  @override
  String get addClient => 'إضافة عميل';

  @override
  String get workoutsToday => 'تدريبات اليوم';

  @override
  String get workoutNumberPrefix => 'تدريب #';

  @override
  String get noEntries => 'لا إدخالات';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'سياسة الخصوصية';

  @override
  String get instructionButton => 'الدليل';

  @override
  String get instructionTitle => 'كيف يعمل';

  @override
  String get instructionHubManifest =>
      'لا كتالوج تمارين ولا برامج جاهزة. تسمّي الحركات بكلماتك — والتطبيق يحتفظ بإحصاءاتها.';

  @override
  String get instructionSearchHint => 'ابحث في الدليل';

  @override
  String get instructionSearchEmpty => 'لم يُعثر على شيء.';

  @override
  String get instructionChapterStartTitle => 'من أين تبدأ';

  @override
  String get instructionChapterStartBlurb =>
      'الشاشة الرئيسية والوضعان ومنطق التطبيق.';

  @override
  String get instructionChapterSessionTitle => 'أثناء التدريب';

  @override
  String get instructionChapterSessionBlurb =>
      'المجموعات والوزن والتكرارات وRIR والكارديو وإنهاء الحصة.';

  @override
  String get instructionChapterTimerTitle => 'المؤقت';

  @override
  String get instructionChapterTimerBlurb =>
      'الفواصل والراحة بين المجموعات والإشارات.';

  @override
  String get instructionChapterExercisesTitle => 'التمارين والمجموعات';

  @override
  String get instructionChapterExercisesBlurb =>
      'قائمة حركاتك ومجموعات العضلات والمفضلة والتدريب السريع.';

  @override
  String get instructionChapterProgressTitle => 'التقدم والأرقام';

  @override
  String get instructionChapterProgressBlurb =>
      'التقدم الشخصي و1RM والحمولة ومخطط التمرين.';

  @override
  String get instructionChapterRhythmTitle => 'الإيقاع والتعافي';

  @override
  String get instructionChapterRhythmBlurb =>
      'مؤشر الإيقاع الأسبوعي وأسبوع التخفيف.';

  @override
  String get instructionChapterDataTitle => 'السجل والبيانات';

  @override
  String get instructionChapterDataBlurb =>
      'التقويم وتعديل السجلات والإحصاءات والنسخة الاحتياطية.';

  @override
  String get instructionChapterCoachTitle => 'وضع المدرب';

  @override
  String get instructionChapterCoachBlurb =>
      'العملاء والجدول وخطة الحصة والطباعة.';

  @override
  String get instructionPhilosophy =>
      'IronVibe لا يعلّمك كيف تتدرب ولا يعطيك برامج جاهزة — لذلك يوجد المدرب وخبرتك. لا يوجد كتالوج بآلاف التمارين: تكتب أسماء الحركات بكلماتك، والتطبيق يعدّ الأرقام بهدوء. كل شيء يبقى على الجهاز: بلا حسابات ولا اشتراكات ولا إعلانات.';

  @override
  String get instructionSectionHome => 'الرئيسية';

  @override
  String get instructionThemeTitle => 'المظهر';

  @override
  String get instructionThemeDesc =>
      'مفتاح الشمس والقمر يبدّل الفاتح والداكن. يُحفظ اختيارك.';

  @override
  String get instructionTrainSelfTitle => 'أدرّب نفسي';

  @override
  String get instructionTrainSelfDesc =>
      'مساحتك: التدريبات والتقويم والتقدم الشخصي والمفضلة ومؤشر الإيقاع.';

  @override
  String get instructionTrainOthersTitle => 'أدرّب آخرين';

  @override
  String get instructionTrainOthersDesc =>
      'وضع المدرب: عملاء وجدول وسجل منفصل لكل شخص. لا يختلط بتدريبك.';

  @override
  String get instructionLanguageTitle => 'اللغة';

  @override
  String get instructionLanguageDesc =>
      'يتبع التطبيق لغة النظام — لا يوجد إعداد منفصل. تُدعم اثنتا عشرة لغة.';

  @override
  String get instructionHomeLinksTitle => 'الإصدار والتواصل';

  @override
  String get instructionHomeLinksDesc =>
      'أسفل الشاشة الرئيسية: رقم الإصدار والموقع وTelegram وبريد الدعم وسياسة الخصوصية.';

  @override
  String get instructionSectionAthleteMenu => 'تدريبك';

  @override
  String get instructionStartWorkoutTitle => 'بدء التدريب';

  @override
  String get instructionStartWorkoutDesc =>
      'يفتح حصة فارغة — لا يُنسخ آخر تدريب. تضيف التمارين وتسجّل المجموعات ثم تنهي للحفظ.';

  @override
  String get instructionQuickWorkoutTitle => 'تدريب سريع';

  @override
  String get instructionQuickWorkoutDesc =>
      'يبني حصة لكامل الجسم من أربعة تمارين حسب وسوم مجموعات العضلات.';

  @override
  String get instructionCalendarMenuTitle => 'تقويم التدريبات';

  @override
  String get instructionCalendarMenuDesc =>
      'الأيام التي تدربت فيها. افتح الحصص المحفوظة من هنا، أو أضف حصة فاتتك.';

  @override
  String get instructionSectionPersonalProgress => 'التقدم الشخصي';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'جدول بأفضل المجموعات و1RM التقديري وأقصى حجم لكل حركة.';

  @override
  String get instructionFavoritesMenuTitle => 'التمارين المفضلة';

  @override
  String get instructionFavoritesMenuDesc =>
      'حركات عليها نجمة. ابنِ منها تدريبًا بلمستين.';

  @override
  String get instructionSectionWorkout => 'الحصة';

  @override
  String get instructionStrengthCardioTitle => 'قوة أو كارديو';

  @override
  String get instructionStrengthCardioDesc =>
      'المفتاح أعلى الحصة يحدد النوع. القوة: وزن وتكرارات وRIR. الكارديو: وقت وشدة. إذا كان النوع الآخر مسجّلًا، يسأل التطبيق قبل التبديل.';

  @override
  String get instructionAddExerciseTitle => 'إضافة تمرين';

  @override
  String get instructionAddExerciseBody =>
      'تُضاف كتلة جديدة عندما يكون للتمرين الحالي اسم ومجموعة مكتملة واحدة على الأقل.';

  @override
  String get instructionPreviousHintsTitle => 'تلميحات رمادية';

  @override
  String get instructionPreviousHintsDesc =>
      'وزن المرة السابقة وتكراراتها تظهر بالرمادي — هدف تتجاوزه، لا مجموعة مسجّلة. لا يدخل السجل إلا الأرقام التي تكتبها بنفسك.';

  @override
  String get instructionRemoveExerciseTitle => 'إزالة التمرين';

  @override
  String get instructionRemoveExerciseDesc =>
      'علامة X الحمراء تزيل الكتلة من الحصة الحالية. السجل المحفوظ لا يتغيّر.';

  @override
  String get instructionSectionSetControl => 'صف المجموعة';

  @override
  String get instructionSetPlusLabel => 'زائد';

  @override
  String get instructionSetPlusDesc => 'يضيف صفًا فارغًا للمجموعة التالية.';

  @override
  String get instructionSetMinusLabel => 'ناقص';

  @override
  String get instructionSetMinusDesc =>
      'يزيل آخر مجموعة. الصف الفارغ يُحذف فورًا، والمكتمل بعد تأكيد. إذا بقيت مجموعة واحدة تُفرَّغ الحقول فقط.';

  @override
  String get instructionSetProgressLabel => 'مخطط التمرين';

  @override
  String get instructionSetProgressDesc =>
      'يفتح اتجاه هذه الحركة لشهر أو سنة أو كل الوقت.';

  @override
  String get instructionExerciseVolumeTitle => 'حمولة التمرين';

  @override
  String get instructionExerciseVolumeDesc =>
      'يسار زر المخطط: مجموع الوزن × التكرارات لكل المجموعات المكتملة. يتحدّث أثناء الكتابة.';

  @override
  String get instructionSectionInputs => 'معنى الحقول';

  @override
  String get instructionWeightTitle => 'الوزن';

  @override
  String get instructionWeightBody =>
      'الحمل على البار أو الجهاز. أدخل كيلوغرامات أو أرطالًا — التطبيق لا يحوّل الوحدات ولا يفرض اختيارًا.';

  @override
  String get instructionRepsTitle => 'التكرارات';

  @override
  String get instructionRepsBody => 'كم تكرارًا أنجزت في المجموعة.';

  @override
  String get instructionRirTitle => 'RIR — تكرارات في الاحتياط';

  @override
  String get instructionRirBody =>
      'كم تكرارًا كان يمكنك إضافته. 0 يعني حتى الفشل، و∞ مجموعة إحماء. طريقة بسيطة لضبط الشدة.';

  @override
  String get instructionOneRmTitle => '1RM — أقصى تكرار واحد';

  @override
  String get instructionOneRmDesc =>
      'تقدير للحد الأقصى لتكرار واحد بمعادلة إبلي من وزن تلك المجموعة وتكراراتها. يظهر تحت الصف — علامة قوة أساسية.';

  @override
  String get instructionSectionCardio => 'كارديو';

  @override
  String get instructionCardioTitle => 'الوقت';

  @override
  String get instructionCardioBody =>
      'مدة الكتلة بالدقائق. بلا مسافة وبلا نبض: التطبيق غير مربوط بأجهزة التتبع.';

  @override
  String get instructionIntensityTitle => 'الشدة';

  @override
  String get instructionIntensityBody =>
      'الجهد من 1 إلى 5 — مقياس RPE مبسّط. في حصة الكارديو يُحفظ صف واحد لكل تمرين.';

  @override
  String get instructionSectionSaving => 'الإنهاء';

  @override
  String get instructionFinishTitle => 'إنهاء التدريب';

  @override
  String get instructionFinishBody =>
      'الزر أسفل الحصة: يطلب التطبيق التأكيد ثم يكتب التدريب في السجل. يلزم مجموعة مكتملة واحدة على الأقل.';

  @override
  String get instructionLeaveWorkoutTitle => 'المغادرة مبكرًا';

  @override
  String get instructionLeaveWorkoutDesc =>
      'إذا أغلقت حصة فيها بيانات، يمكنك البقاء أو حفظ ما سجّلت أو حذف المسودة.';

  @override
  String get instructionAutoSaveTitle => 'تدريب انقطع';

  @override
  String get instructionAutoSaveDesc =>
      'تُحفظ المسودة وحدها — كل دقيقة وعند انتقال التطبيق إلى الخلفية. في التشغيل التالي تتابع من المكان نفسه أو تحذفها.';

  @override
  String get instructionScreenAwakeTitle => 'الشاشة تبقى مضاءة';

  @override
  String get instructionScreenAwakeDesc =>
      'أثناء الحصة الجارية تبقى الشاشة مستيقظة، فلا تفتح قفل الهاتف بعد كل مجموعة.';

  @override
  String get instructionStopwatchWhyTitle => 'لماذا توقيت الراحة';

  @override
  String get instructionStopwatchWhyBody =>
      'الوقفة بين المجموعات معامل عمل مثل الوزن والتكرارات: الراحة القصيرة ترفع الكثافة، والطويلة تتيح مجموعة ثقيلة.';

  @override
  String get instructionStopwatchHowTitle => 'بدء وإيقاف وإعادة ضبط';

  @override
  String get instructionStopwatchHowBody =>
      'المؤقت مثبّت في رأس الحصة ويبقى ظاهرًا أثناء التمرير. الوقت والأزرار في الوسط؛ في الوضع العادي يعدّ صعودًا، بما فيه أجزاء الثانية.';

  @override
  String get instructionStopwatchIntervalsTitle => 'اليمين: فواصل';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — دقيقة عمل ودقيقة راحة. 4/4 — أربع دقائق لكل منهما. 20/10 — تاباتا. تتكرر المراحل حتى الإيقاف أو إعادة الضبط: اللون الأحمر للعمل والأزرق للراحة.';

  @override
  String get instructionStopwatchRestTitle => 'اليسار: راحة';

  @override
  String get instructionStopwatchRestBody =>
      '+1د و+2د و+5د تبدأ عدًا تنازليًا بين المجموعات. إذا كان العدّ يعمل، تُضاف الدقائق إلى المتبقي؛ وحلقة الفواصل تتحول إلى راحة.';

  @override
  String get instructionStopwatchProgressTitle => 'شريط المرحلة';

  @override
  String get instructionStopwatchProgressBody =>
      'في العد التنازلي والفواصل، شريط تحت الأرقام يبيّن ما تبقى من المرحلة الحالية.';

  @override
  String get instructionStopwatchSoundsTitle => 'الصوت والاهتزاز';

  @override
  String get instructionStopwatchSoundsBody =>
      'ثلاث وثانيتان وثانية قبل نهاية المرحلة — نقرة قصيرة واهتزاز خفيف؛ وتغيّر المرحلة أعلى. الأصوات مدمجة في التطبيق: بلا ميكروفون وبلا إذن إشعارات. مستوى الصوت يتبع إعدادات الهاتف.';

  @override
  String get instructionExerciseBankIntro =>
      'قائمة التمارين تنمو وحدها: كل اسم جديد من تدريب منتهٍ ينضم إلى الاقتراحات. تُخزَّن الأسماء بأحرف كبيرة حتى لا تنقسم الحركة نفسها إلى اثنتين.';

  @override
  String get instructionSectionExerciseNameTools => 'الأسماء';

  @override
  String get instructionRenameExerciseTitle => 'إعادة التسمية في كل مكان';

  @override
  String get instructionRenameExerciseDesc =>
      'اضغط مطولًا على الاسم — في الحصة أو قائمة الاقتراحات أو تدريب محفوظ. يتحدّث في السجل وعلى المخططات.';

  @override
  String get instructionRemoveFromBankTitle => 'إزالة من الاقتراحات';

  @override
  String get instructionRemoveFromBankDesc =>
      'علامة X في قائمة الاقتراحات المفتوحة، أو X الحمراء في التقدم الشخصي، تسقط الاسم من الاقتراحات والجدول. التدريبات المحفوظة تبقى.';

  @override
  String get instructionReassignExerciseTitle => 'إعادة التعيين في سجل';

  @override
  String get instructionReassignExerciseDesc =>
      'في تدريب محفوظ يمكنك توجيه كتلة إلى حركة أخرى. المجموعات تبقى كما هي لكنها تنتقل إلى إحصاءات الاسم الجديد — وهذه الحصة فقط تتغيّر.';

  @override
  String get instructionSectionMuscleGroups => 'مجموعات العضلات';

  @override
  String get instructionMuscleGroupsIntro =>
      'المجموعة وسم اختياري على اسمك. يستخدمها التدريب السريع فقط لبناء حصة متوازنة لكامل الجسم. ثماني مجموعات: الصدر والظهر والكتفان والجذع وأمام الفخذ وخلف الفخذ والعضلة ذات الرأسين وثلاثية الرؤوس.';

  @override
  String get instructionMuscleGroupTagTitle => 'كيف توسِم';

  @override
  String get instructionMuscleGroupTagDesc =>
      'في أول مرة تدخل اسمًا جديدًا يسأل التطبيق عن المجموعة. يمكنك اختيار لاحقًا، أو ليس للتدريب السريع إذا أردت إبقاء الحركة خارج المزيج. الشارة تحت الاسم في التقدم الشخصي والمفضلة سهلة التغيير أو المسح.';

  @override
  String get instructionSectionFavorites => 'المفضلة';

  @override
  String get instructionFavoriteStarTitle => 'نجمة';

  @override
  String get instructionFavoriteStarDesc =>
      'النجمة على بطاقة التمرين في الحصة وفي جدول التقدم الشخصي. المفضلة تبقى أعلى القائمة.';

  @override
  String get instructionBuildFromFavoritesTitle => 'بناء تدريب';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'في شاشة المفضلة علّم الحركات التي تريدها — يظهر الزر فورًا. تفتح الحصة بهذا الترتيب مع تلميحات رمادية من المرة السابقة. وللعميل يفتح الإجراء نفسه تدريبه.';

  @override
  String get instructionSectionQuickWorkout => 'تدريب سريع';

  @override
  String get instructionQuickWorkoutHowTitle => 'أربعة مواضع';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'صدر وظهر ونصف الساقين (أمام الفخذ أو خلفه — لا الاثنان في اليوم نفسه) وحركة واحدة للكتف أو الذراعين أو الجذع. في كل موضع يختار التطبيق المجموعة التي مضى عليها أطول وقت، ويفضّل المفضلة.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'معاينة وتبديل';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'ترى التشكيلة كاملة قبل البدء: أي موضع يمكن تبديله بتمرين آخر من المجموعة نفسها. إذا لم تكفِ الحركات الموسومة، يقول التطبيق ذلك ويفتح التقدم الشخصي لإضافة الوسوم.';

  @override
  String get instructionPersonalProgressIntro =>
      'جدول واحد بكل الحركات من التدريبات المحفوظة. المفضلة في الأعلى والباقي أبجديًا، والبحث يجد الاسم. افتحه من قائمة التدريب أو من ملف العميل.';

  @override
  String get instructionProgressBestSetTitle => 'أفضل مجموعة';

  @override
  String get instructionProgressBestSetDesc =>
      'المجموعة ذات أعلى 1RM تقديري في كل السجل. للحركات بلا وزن هي المجموعة ذات أكثر التكرارات.';

  @override
  String get instructionProgressMaxVolumeTitle => 'أقصى حجم';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'أكبر حمولة لهذا التمرين في تدريب واحد — مرساة مفيدة عند تخطيط حجم العمل.';

  @override
  String get instructionSectionProgressChart => 'مخطط التمرين';

  @override
  String get instructionProgressChartIntro =>
      'ثلاثة منحنيات مستقلة حسب التاريخ. المحور الأيسر للوزن والأيمن للتكرارات؛ الخط الأصفر مُعايَر ليُقارن شكل الاتجاهات. بدّل النافذة — شهر أو سنة أو كل الوقت — والمس نقطة لأرقام ذلك اليوم. الكارديو لا يظهر في المخطط.';

  @override
  String get instructionProgressLineWeightDesc =>
      'أحمر — أثقل وزن في مجموعة واحدة ذلك اليوم.';

  @override
  String get instructionProgressLineRepsDesc =>
      'سماوي — أكثر التكرارات في مجموعة، وليس بالضرورة مع أثقل وزن.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'أصفر — حمولة اليوم: مجموع الوزن × التكرارات للمجموعات التي مُلئ فيها الحقلان.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'في التدريب الجاري يضيء زر المخطط عند كسر رقم: أحمر لوزن المجموعة، وأصفر لحمولة التمرين، وسماوي لمجموع التكرارات في الحركات بلا وزن. إذا انطبق أكثر من واحد يفوز الأحمر ثم الأصفر ثم السماوي. السجل المحفوظ بلا تمييز.';

  @override
  String get instructionRhythmIntro =>
      'عندما تجتمع ثلاثة أيام قوة على الأقل في الأسابيع الأربعة الأخيرة، يظهر مؤشر الإيقاع أعلى شاشة التدريب. ليس هدفًا ولا درجة — فقط كم مرة تصل إلى النادي الآن.';

  @override
  String get instructionRhythmGaugeTitle => 'أيام في الأسبوع';

  @override
  String get instructionRhythmGaugeDesc =>
      'القوس يمتلئ من يوم إلى ستة — متوسط أربعة أسابيع. تُحسب أيام عمل القوة، ولا تُحسب أيام الكارديو وحدها. كلما زاد الإيقاع انتقل اللون من الفولاذ عبر الذهبي نحو الصدأ.';

  @override
  String get instructionRhythmInsightTitle => 'تفصيل الإيقاع';

  @override
  String get instructionRhythmInsightDesc =>
      'المس المؤشر: يسمّي التطبيق وضعك — إيقاع خفيف أو ثابت أو كثيف أو بلا أيام راحة تقريبًا — ويشرح معنى ذلك للتعافي. مؤشر العميل يفتح التفصيل نفسه.';

  @override
  String get instructionRhythmDeloadTitle => 'أسبوع تخفيف';

  @override
  String get instructionRhythmDeloadDesc =>
      'التخفيف ليس توقفًا — إنه أسبوع بنصف القوة: أوزان العمل وعدد المجموعات أقل بنسبة 30–50٪، أو كارديو فقط. العضلة تتعافى أسرع من الأربطة والأوتار والمفاصل — هذا الأسبوع يمنحها وقتًا للحاق.';

  @override
  String get instructionRhythmNudgeTitle => 'تذكير';

  @override
  String get instructionRhythmNudgeDesc =>
      'إذا حافظت على حصتين ونصف أسبوعيًا أو أكثر ولم تخفّف منذ مدة، يقترح التطبيق أخذ مثل هذا الأسبوع. كلما زاد الإيقاع ظهر التلميح أبكر. يظهر مرة في الأسبوع على الأكثر، وفي الوضع الشخصي فقط — ويبقى توصية لا نصيحة طبية.';

  @override
  String get instructionSectionCalendar => 'التقويم والسجل';

  @override
  String get instructionCalendarBrowseTitle => 'كيف تتصفح';

  @override
  String get instructionCalendarBrowseDesc =>
      'اسحب لتغيير الشهر؛ المس اسم الشهر لمنتقي تاريخ سريع. نقطة تحت اليوم تعني أنه كان هناك تدريب.';

  @override
  String get instructionCalendarAddTitle => 'إدخال بتاريخ سابق';

  @override
  String get instructionCalendarAddDesc =>
      'اختر يومًا واضبط وقتًا وأضف تدريبًا — حتى لتاريخ مضى. مفيد إذا نسيت تسجيل الحصة.';

  @override
  String get instructionNavHistoryTitle => 'حمولة التدريب';

  @override
  String get instructionNavHistoryDesc =>
      'كل حصة محفوظة تعرض الحمولة الكلية. الحجم من أوثق علامات التضخم: المهم ليس رقم يوم واحد، بل كيف يثبت من أسبوع إلى أسبوع.';

  @override
  String get instructionHistoryEditTitle => 'تعديل السجلات';

  @override
  String get instructionHistoryEditDesc =>
      'يمكن توسيع تدريب محفوظ وتعديله: إضافة تمرين أو مجموعة أو تغيير الأرقام أو حذف الحصة. تُحفظ التغييرات فورًا.';

  @override
  String get instructionSectionStats => 'الإحصاءات';

  @override
  String get instructionStatsTitle => 'ملخص التدريبات';

  @override
  String get instructionStatsDesc =>
      'أيقونة المخطط في رأس شاشة التدريب أو المدرب: كم حصة هذا الشهر وهذه السنة وكل الوقت. في وضع المدرب يُفصَّل العدد أيضًا لكل عميل.';

  @override
  String get instructionSectionBackup => 'نسخة احتياطية';

  @override
  String get instructionNavImportExportTitle => 'تصدير واستيراد';

  @override
  String get instructionNavImportExportDesc =>
      'التصدير يجمع السجل وقائمة التمارين والمفضلة ووسوم المجموعات والعملاء والجدول في ملف JSON واحد. الاستيراد يدمج الملف في البيانات الحالية ويتخطى المكررات — لا شيء يُمسح. نسخة المدرب منفصلة عن النسخة الشخصية.';

  @override
  String get instructionBackupNudgeTitle => 'تذكير بالنسخة';

  @override
  String get instructionBackupNudgeDesc =>
      'البيانات تعيش على هذا الجهاز فقط: بلا حسابات وبلا سحابة. كل أربعة أسابيع يعرض التطبيق حفظ نسخة — إذا ضاع الهاتف لا يعود السجل إلا من ذلك الملف.';

  @override
  String get instructionTrainerIntro =>
      'أدرّب آخرين مساحة منفصلة للعمل مع الناس: عملاء وجدول وسجل لكل شخص. التدريبات الشخصية وبيانات المدرب لا تتقاطع.';

  @override
  String get instructionClientsTitle => 'العملاء';

  @override
  String get instructionClientsDesc =>
      'قائمة بالهدف وآخر حصة والحصة التالية. البطاقة فيها الهدف والوزن والطول وملاحظات المدرب الخاصة. يُضبط الاسم عند الإنشاء ولا يمكن تغييره لاحقًا.';

  @override
  String get instructionClientProfileTitle => 'ملف العميل';

  @override
  String get instructionClientProfileDesc =>
      'حصة اليوم تبدأ من هنا، ومعها التقدم والمفضلة والسجل حسب الشهر. إذا كفت أيام القوة يظهر مؤشر الإيقاع أيضًا. حذف العميل يزيل الحصص القادمة؛ التدريبات الماضية تبقى للتقارير.';

  @override
  String get instructionTrainerScheduleTitle => 'الجدول';

  @override
  String get instructionTrainerScheduleDesc =>
      'تقويم المدرب يعرض حصص كل العملاء: أيقونة التشغيل تعني مخططًا، والعلامة تعني منتهيًا، والساعة الرملية تعني أن اليوم قيد التنفيذ. الخطط الفارغة من الأيام الماضية تُمسح وحدها.';

  @override
  String get instructionTrainerPlanTitle => 'خطة الحصة';

  @override
  String get instructionTrainerPlanDesc =>
      'لتاريخ قادم يمكنك ترتيب التمارين وملاحظة مسبقًا والحفظ دون إنهاء التدريب. آخر الأوزان والتكرارات تصل تلميحات رمادية. الحصص المنتهية فقط تدخل السجل.';

  @override
  String get instructionTrainerRepeatTitle => 'تكرار الأخير';

  @override
  String get instructionTrainerRepeatDesc =>
      'من ملف العميل، أو كمفتاح عند إضافة حصة في التقويم. تُنسخ قائمة التمارين؛ الأوزان والتكرارات تأتي تلميحات رمادية لا مجموعات منتهية.';

  @override
  String get instructionPrintSessionTitle => 'طباعة حصة';

  @override
  String get instructionPrintSessionDesc =>
      'في تدريب منتهٍ، أيقونة الطباعة في الرأس تبني ورقة A4 بتشكيلة ذلك اليوم والأرقام. ثم ورقة النظام: طابعة أو PDF أو إرسال إلى العميل.';

  @override
  String get instructionImportAthleteTitle => 'استيراد سجل رياضي';

  @override
  String get instructionImportAthleteDesc =>
      'زر مخصص في إحصاءات المدرب: ملف من الوضع الشخصي يصبح عميلًا جديدًا، مع المفضلة ووسوم المجموعات. التدريبات المنقولة تُعلَّم كمستوردة، وأسماء التمارين تبقى منفصلة عن أسمائك.';

  @override
  String get printSession => 'طباعة';

  @override
  String get printSessionEmpty =>
      'لا شيء للطباعة بعد. سجّل مجموعة واحدة على الأقل.';

  @override
  String get printSessionShareText => 'حصة IronVibe';

  @override
  String get rhythmPerWeek => 'في الأسبوع';

  @override
  String get deloadNudgeTitle => 'أسبوع تعافٍ نشط؟';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'تتدرب نحو $rate أيام في الأسبوع منذ حوالي $weeks أسبوعًا. وقت مناسب لأسبوع تعافٍ نشط: أوزان العمل والمجموعات أقل بنسبة 30–50٪، أو كارديو فقط. هذه توصية لا نصيحة طبية.';
  }

  @override
  String get deloadNudgeLater => 'ليس الآن';

  @override
  String get deloadNudgeOk => 'فهمت';

  @override
  String get backupNudgeTitle => 'حفظ نسخة؟';

  @override
  String get backupNudgeBody =>
      'بياناتك تعيش على هذا الجهاز فقط. إذا ضاع أو تعطل التخزين يختفي السجل. شارك نسخة الآن، أو أجّل 28 يومًا.';

  @override
  String get backupNudgeShare => 'مشاركة';

  @override
  String get backupNudgeLater => 'لاحقًا';

  @override
  String get rhythmInsightTitle => 'إيقاع التدريب';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'تتدرب نحو $rate مرات في الأسبوع في المتوسط.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return 'يتدرب $name نحو $rate مرات في الأسبوع في المتوسط.';
  }

  @override
  String get rhythmInsightBandLight => 'إيقاع خفيف';

  @override
  String get rhythmInsightBandSteady => 'إيقاع ثابت';

  @override
  String get rhythmInsightBandDense => 'إيقاع كثيف';

  @override
  String get rhythmInsightBandVeryDense => 'بلا أيام راحة تقريبًا';

  @override
  String get rhythmInsightHowTitle => 'من أين يأتي هذا الرقم';

  @override
  String get rhythmInsightWindow =>
      'متوسط الأسابيع الأربعة الأخيرة. تُحسب أيام عمل القوة؛ ولا تُحسب أيام الكارديو وحدها. ليس هدفًا ولا درجة — فقط إيقاعك الحالي.';

  @override
  String get rhythmInsightWhatTitle => 'أسبوع تعافٍ نشط';

  @override
  String get rhythmInsightWhatBody =>
      'ليس توقفًا — أسبوع بنصف القوة: أوزان العمل وعدد المجموعات أقل بنسبة 30–50٪. يمكن تخطي القوة تمامًا والإبقاء على الكارديو أو أي نشاط آخر. العضلة تتعافى أسرع من المفاصل والأربطة والأوتار — هذا الأسبوع يمنحها وقتًا للحاق.';

  @override
  String get rhythmInsightPaceTitle => 'ماذا يعني هذا';

  @override
  String get rhythmInsightAdviceLight =>
      'بين الحصص أيام راحة كافية، والتعب لا يتراكم. لا حاجة لتخطيط تعافٍ نشط بعد — بهذا الإيقاع يتعافى الجسم وحده.';

  @override
  String get rhythmInsightAdviceSteady =>
      'إيقاع ثابت يمكن العيش عليه لسنوات. إذا كانت الحصص شاقة، خذ أسبوع تعافٍ نشط كل بضعة أشهر — أفضل مبكرًا من بعد توقف الأوزان.';

  @override
  String get rhythmInsightAdviceDense =>
      'الحصص متقاربة، والتعب يتراكم بهدوء. أسبوع تعافٍ نشط كل شهرين أو ثلاثة يبقي التقدم عادة أفضل من الاستمرار بلا انقطاع.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'تقريبًا كل يوم تحت حمل. قد ينجح ذلك إذا واكب النوم والطعام. بهذا الإيقاع يكون أسبوع التعافي النشط مرة في الشهر عناية عادية بالمفاصل والأربطة، لا تراجعًا.';

  @override
  String get rhythmInsightPraiseSteady =>
      'هذا هو الإيقاع الذي يبقيه الناس لسنوات.';

  @override
  String get rhythmInsightPraiseDense =>
      'تتدرب كثيرًا — جدول كهذا لا يحدث وحده.';

  @override
  String get rhythmInsightPraiseVeryDense => 'يبدو أنك وجدت الوضع السري للجسم.';

  @override
  String get rhythmInsightRecentLighter =>
      'انخفض الحمل أصلًا مؤخرًا — يمكن اعتبار التعافي النشط تم. عُد إلى وتيرتك.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'هذا الإيقاع قائم منذ $weeks أسبوع.',
      many: 'هذا الإيقاع قائم منذ $weeks أسبوعًا.',
      few: 'هذا الإيقاع قائم منذ $weeks أسابيع.',
      two: 'هذا الإيقاع قائم منذ أسبوعين.',
      one: 'هذا الإيقاع قائم منذ أسبوع واحد.',
      zero: 'هذا الإيقاع قائم منذ $weeks أسبوع.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'هذه توصية لا نصيحة طبية. إذا كنت بخير، لا شيء يجب أن يتغيّر.';
}
