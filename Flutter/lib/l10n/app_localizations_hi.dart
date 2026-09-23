// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'तुम्हारे वर्कआउट का VIBE';

  @override
  String get ok => 'ठीक है';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get renameExerciseTitle => 'एक्सरसाइज़ का नाम बदलें';

  @override
  String get renameExerciseEmpty => 'नाम खाली नहीं हो सकता';

  @override
  String get reassignHistoryExerciseTitle => 'एक्सरसाइज़ बदलें';

  @override
  String get reassignHistoryExerciseBody =>
      'सिर्फ़ यही वर्कआउट बदलता है। सेट वैसे ही रहते हैं; प्रगति के चार्ट नए नाम पर जाते हैं।';

  @override
  String get delete => 'हटाएँ';

  @override
  String get yesDelete => 'हाँ, हटाएँ';

  @override
  String get close => 'बंद करें';

  @override
  String get save => 'सेव करें';

  @override
  String get add => 'जोड़ें';

  @override
  String get trainOthers => 'दूसरों की ट्रेनिंग';

  @override
  String get trainSelf => 'खुद की ट्रेनिंग';

  @override
  String get statistics => 'आँकड़े';

  @override
  String get exportHistory => 'वर्कआउट इतिहास एक्सपोर्ट करें';

  @override
  String get historyEmpty => 'इतिहास खाली है, अभी एक्सपोर्ट करने को कुछ नहीं';

  @override
  String get exportError => 'एक्सपोर्ट त्रुटि:';

  @override
  String get exportJson => 'JSON एक्सपोर्ट करें';

  @override
  String get importData => 'इंपोर्ट';

  @override
  String get importSuccess => 'डेटा इंपोर्ट हो गया';

  @override
  String get importError => 'इंपोर्ट त्रुटि:';

  @override
  String get importNewerVersion => 'फ़ाइल ऐप के नए वर्शन से बनी है';

  @override
  String get importFileAccessError => 'फ़ाइल खोलने में त्रुटि';

  @override
  String get importInvalidJson => 'JSON फ़ॉर्मैट मान्य नहीं है';

  @override
  String get importInvalidBackupFile =>
      'त्रुटि: चुनी हुई बैकअप फ़ाइल मान्य नहीं है';

  @override
  String get importAthlete => 'एथलीट इंपोर्ट करें';

  @override
  String importAthleteFound(int count) {
    return 'ऐसे एथलीट के $count वर्कआउट मिले जो आपकी सूची में नहीं है।';
  }

  @override
  String get importAthleteBackupOwn => 'पहले अपना डेटा सेव करें';

  @override
  String get importAthleteDecline => 'न जोड़ें';

  @override
  String get importAthleteSuccess => 'एथलीट जुड़ गया';

  @override
  String get importAthleteNotAthleteFile =>
      'यह फ़ाइल किसी एथलीट का वर्कआउट इतिहास नहीं है।';

  @override
  String get importAthleteEmpty => 'इस फ़ाइल में कोई वर्कआउट नहीं मिला।';

  @override
  String get importAthleteAlreadyImported =>
      'ये वर्कआउट इस डिवाइस पर पहले से हैं।';

  @override
  String get importAthleteUseDedicatedButton =>
      'यह एथलीट के इतिहास जैसी फ़ाइल है। इसके बजाय एथलीट इंपोर्ट करें।';

  @override
  String get shareText => 'IronVibe वर्कआउट इतिहास';

  @override
  String get monthStats => 'इस महीने';

  @override
  String get yearStats => 'इस साल';

  @override
  String get allTimeStats => 'पूरा समय';

  @override
  String get weight => 'वज़न';

  @override
  String get reps => 'रेप्स';

  @override
  String get rir => 'RIR';

  @override
  String get oneRm => '1RM';

  @override
  String get approxOneRm => '≈ 1RM:';

  @override
  String get kg => 'किग्रा';

  @override
  String get volumeShort => 'वॉल्यूम';

  @override
  String get addSet => 'सेट जोड़ें';

  @override
  String get addExercise => 'एक्सरसाइज़ जोड़ें';

  @override
  String get finishWorkout => 'वर्कआउट खत्म करें';

  @override
  String get finishWorkoutConfirmTitle => 'वर्कआउट खत्म करें?';

  @override
  String get finishWorkoutConfirmBody => 'वर्कआउट सेव हो जाएगा।';

  @override
  String get finishWorkoutConfirmAction => 'खत्म करें';

  @override
  String get workoutCompleteTitle => 'वर्कआउट सेव हो गया';

  @override
  String get planChangesSavedTitle => 'बदलाव सेव हो गए';

  @override
  String get startWorkout => 'वर्कआउट शुरू करें';

  @override
  String get quickWorkout => 'क्विक वर्कआउट';

  @override
  String get quickWorkoutFullBody => 'फुल बॉडी';

  @override
  String get quickWorkoutInsufficientTitle => 'डेटा काफ़ी नहीं';

  @override
  String get quickWorkoutInsufficientBody =>
      'क्विक वर्कआउट के लिए चेस्ट, बैक, एक लेग ग्रुप (आगे या पीछे की जाँघ) और शोल्डर, आर्म्स या कोर में से एक — टैग किए एक्सरसाइज़ चाहिए। व्यक्तिगत प्रगति में ग्रुप लगाएँ — या लॉग करते रहें: नई एक्सरसाइज़ पर ऐप खुद पूछेगा।';

  @override
  String get quickWorkoutOpenProgress => 'व्यक्तिगत प्रगति खोलें';

  @override
  String get quickWorkoutPreviewTitle => 'क्विक वर्कआउट · फुल बॉडी';

  @override
  String get quickWorkoutStart => 'शुरू';

  @override
  String get quickWorkoutSwap => 'बदलें';

  @override
  String get quickWorkoutNoAlternatives =>
      'इस ग्रुप में कोई और एक्सरसाइज़ नहीं';

  @override
  String get muscleGroupPromptTitle => 'मसल ग्रुप';

  @override
  String get muscleGroupPromptBody => 'क्विक फुल-बॉडी वर्कआउट बनाने के लिए।';

  @override
  String get muscleGroupLater => 'बाद में';

  @override
  String get muscleGroupClear => 'हटाएँ';

  @override
  String get muscleGroupSkip => 'क्विक वर्कआउट के लिए नहीं';

  @override
  String get muscleGroupChest => 'चेस्ट';

  @override
  String get muscleGroupBack => 'बैक';

  @override
  String get muscleGroupShoulders => 'शोल्डर';

  @override
  String get muscleGroupCore => 'कोर';

  @override
  String get muscleGroupQuads => 'आगे की जाँघ';

  @override
  String get muscleGroupHamstrings => 'पीछे की जाँघ';

  @override
  String get muscleGroupArmFlex => 'बाइसेप्स';

  @override
  String get muscleGroupArmExt => 'ट्राइसेप्स';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'वर्कआउट कैलेंडर';

  @override
  String get personalProgress => 'व्यक्तिगत प्रगति';

  @override
  String get personalProgressSearchHint => 'एक्सरसाइज़ खोजें';

  @override
  String get personalProgressBestSet => 'बेस्ट सेट';

  @override
  String get personalProgressMaxVolume => 'अधिकतम वॉल्यूम';

  @override
  String get personalProgressEmpty => 'वर्कआउट में अभी कोई एक्सरसाइज़ नहीं';

  @override
  String get favoriteExercises => 'पसंदीदा एक्सरसाइज़';

  @override
  String get favoriteExercisesEmpty => 'अभी कोई पसंदीदा एक्सरसाइज़ नहीं';

  @override
  String get buildWorkoutFromFavorites => 'वर्कआउट बनाएँ';

  @override
  String get exerciseHint => 'एक्सरसाइज़ का नाम लिखें';

  @override
  String get deleteFromHistory => 'इतिहास से हटाएँ?';

  @override
  String get deleteExerciseHint =>
      'सुझावों और व्यक्तिगत प्रगति में अब नहीं दिखेगा।';

  @override
  String get exerciseDeleted => 'हटा दिया गया';

  @override
  String get deleteWorkoutTitle => 'हटाएँ';

  @override
  String get deleteWorkoutMsg =>
      'यह वर्कआउट हटाएँ? प्रगति का इतिहास मिट जाएगा।';

  @override
  String get removeSetWithDataConfirm =>
      'डेटा वाला सेट हटाएँ? यह वापस नहीं होगा।';

  @override
  String get removeExerciseFromWorkout => 'एक्सरसाइज़ हटाएँ';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'इस एक्सरसाइज़ को वर्कआउट से हटाएँ? यह वापस नहीं होगा।';

  @override
  String get deleteClientTitle => 'क्लाइंट हटाएँ';

  @override
  String get deleteClientMsg =>
      'क्या इस क्लाइंट को हटाना है? उसके आने वाले सभी वर्कआउट हट जाएँगे।';

  @override
  String get noClientsTitle => 'कोई क्लाइंट नहीं';

  @override
  String get noClientsMsg => 'पहले क्लाइंट मेनू में क्लाइंट जोड़ें।';

  @override
  String get newClient => 'नया क्लाइंट';

  @override
  String get editClient => 'संपादित करें';

  @override
  String get clientName => 'नाम';

  @override
  String get clientLastName => 'उपनाम';

  @override
  String get clientLastNameRequired => 'उपनाम लिखें।';

  @override
  String get clientNameCannotChange =>
      'नाम बाद में नहीं बदला जा सकता। उपनाम क्लाइंट कार्ड पर जोड़ा या सुधारा जा सकता है।';

  @override
  String get clientNameTaken => 'इस नाम और उपनाम वाला क्लाइंट पहले से है।';

  @override
  String get clientGoal => 'लक्ष्य';

  @override
  String get clientWeight => 'वज़न';

  @override
  String get clientHeight => 'कद';

  @override
  String get clientNotes => 'नोट्स';

  @override
  String get saveClientChanges => 'बदलाव सेव करें';

  @override
  String get clientProfileUnsavedTitle => 'बिना सेव बदलाव';

  @override
  String get clientProfileUnsavedMessage =>
      'बिना सेव बदलाव हैं। जाने से पहले सेव करें?';

  @override
  String get clientProfileStay => 'रुकें';

  @override
  String get clientProfileDiscard => 'बिना सेव जाएँ';

  @override
  String get clientProfileSaveAndLeave => 'सेव करके जाएँ';

  @override
  String get workoutRecoveryTitle => 'वर्कआउट बीच में रुका';

  @override
  String get workoutRecoveryMessage =>
      'पिछला वर्कआउट अचानक बंद हो गया। जहाँ छोड़ा था वहाँ से जारी रखें, या बिना सेव डेटा हटाएँ।';

  @override
  String get workoutRecoveryContinue => 'वर्कआउट जारी रखें';

  @override
  String get workoutRecoveryDelete => 'वर्कआउट हटाएँ';

  @override
  String get workoutRecoverySessionMissing =>
      'शेड्यूल किया क्लाइंट वर्कआउट हट चुका है। बिना सेव ड्राफ़्ट साफ़ कर दिया गया।';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'दूसरी एक्सरसाइज़ जोड़ने से पहले मौजूदा पूरी करें।';

  @override
  String get switchWorkoutTypeTitle => 'वर्कआउट का प्रकार बदलें?';

  @override
  String get switchWorkoutTypeBody =>
      'दूसरे प्रकार के भरे सेट इस वर्कआउट के साथ सेव नहीं होंगे।';

  @override
  String get switchWorkoutTypeConfirm => 'बदलें';

  @override
  String get saveWorkoutNothingToSave =>
      'अभी सेव करने को कुछ नहीं। वज़न और रेप्स जोड़ें, या कार्डियो के लिए समय।';

  @override
  String get importedHistoryBadge => 'इंपोर्टेड';

  @override
  String get clientWorkoutHistoryEmpty => 'अभी कोई वर्कआउट नहीं';

  @override
  String exerciseNumberedTitle(int n) {
    return 'एक्सरसाइज़ #$n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'एक्सरसाइज़ #$n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return '#$n';
  }

  @override
  String get clientProfileSectionGoal => 'लक्ष्य';

  @override
  String get clientProfileSectionAnthropometry => 'माप';

  @override
  String get clientProfileSectionTrainerNotes => 'ट्रेनर नोट्स';

  @override
  String get clientProfileSectionWorkoutHistory => 'वर्कआउट इतिहास';

  @override
  String get clientTrainerNotesHint => 'चोट, ख़ास बातें, योजना…';

  @override
  String get trainerSessionDefaultTitle => 'वर्कआउट';

  @override
  String get durationMinutesShort => 'मि';

  @override
  String get addTraining => 'वर्कआउट जोड़ें';

  @override
  String get repeatLastWorkout => 'पिछला वर्कआउट दोहराएँ';

  @override
  String get repeatLastUnavailable =>
      'इस क्लाइंट का दोहराने लायक पिछला वर्कआउट नहीं है।';

  @override
  String get editPlan => 'योजना संपादित करें';

  @override
  String get trainerSessionEmpty => 'अभी योजना नहीं';

  @override
  String trainerSessionPlanned(int n) {
    return 'योजना: $n';
  }

  @override
  String get trainerClientsEmpty =>
      'अभी कोई क्लाइंट नहीं। शेड्यूल शुरू करने के लिए किसी को जोड़ें।';

  @override
  String get clientNeverTrained => 'अभी कोई वर्कआउट नहीं';

  @override
  String get clientNoUpcoming => 'कोई आने वाला सेशन नहीं';

  @override
  String clientLastSession(String when) {
    return 'पिछला: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'अगला: $when';
  }

  @override
  String get clientSessionToday => 'आज';

  @override
  String get clientSessionYesterday => 'बीता कल';

  @override
  String get clientSessionTomorrow => 'आने वाला कल';

  @override
  String clientSessionDaysAgo(int n) {
    return '$n दिन पहले';
  }

  @override
  String clientSessionInDays(int n) {
    return '$n दिन में';
  }

  @override
  String get clientProfileDetails => 'प्रोफ़ाइल';

  @override
  String get addSessionPickClient => 'क्लाइंट चुनें';

  @override
  String get clientLabel => 'क्लाइंट';

  @override
  String get deleteClientBtn => 'क्लाइंट हटाएँ';

  @override
  String get clientsMenu => 'क्लाइंट';

  @override
  String get dateHeader => 'तारीख';

  @override
  String get clientHeader => 'क्लाइंट';

  @override
  String get exerciseHeader => 'एक्सरसाइज़';

  @override
  String get typeHeader => 'प्रकार';

  @override
  String get strengthType => 'स्ट्रेंथ';

  @override
  String get cardioType => 'कार्डियो';

  @override
  String get weightHeader => 'वज़न';

  @override
  String get weightUnitsChoiceShort => 'किग्रा / पाउंड';

  @override
  String get progressChartWeightLegend => 'वज़न — किग्रा / पाउंड (आपकी पसंद)';

  @override
  String get progressChartVolumeLegend => 'वॉल्यूम (टनाज)';

  @override
  String get repsHeader => 'रेप्स';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'समय (मि)';

  @override
  String get intensityHeader => 'तीव्रता';

  @override
  String get setHeader => 'सेट';

  @override
  String get strength => 'स्ट्रेंथ';

  @override
  String get cardio => 'कार्डियो';

  @override
  String get timeMin => 'समय (मि)';

  @override
  String get intensity => 'तीव्रता';

  @override
  String get reserve => 'रिज़र्व';

  @override
  String get sets => 'सेट';

  @override
  String get time => 'समय';

  @override
  String get rest => 'आराम';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get max => 'अधिकतम';

  @override
  String get totalVolume => 'कुल वॉल्यूम';

  @override
  String get chart => 'चार्ट';

  @override
  String get progress => 'प्रगति';

  @override
  String get dayMonday => 'सोमवार';

  @override
  String get dayTuesday => 'मंगलवार';

  @override
  String get dayWednesday => 'बुधवार';

  @override
  String get dayThursday => 'गुरुवार';

  @override
  String get dayFriday => 'शुक्रवार';

  @override
  String get daySaturday => 'शनिवार';

  @override
  String get daySunday => 'रविवार';

  @override
  String get greetingHi => 'नमस्ते';

  @override
  String get greetingMorning => 'सुप्रभात';

  @override
  String get greetingAfternoon => 'नमस्कार';

  @override
  String get greetingEvening => 'शुभ संध्या';

  @override
  String get monthJanuary => 'जनवरी';

  @override
  String get monthFebruary => 'फ़रवरी';

  @override
  String get monthMarch => 'मार्च';

  @override
  String get monthApril => 'अप्रैल';

  @override
  String get monthMay => 'मई';

  @override
  String get monthJune => 'जून';

  @override
  String get monthJuly => 'जुलाई';

  @override
  String get monthAugust => 'अगस्त';

  @override
  String get monthSeptember => 'सितंबर';

  @override
  String get monthOctober => 'अक्टूबर';

  @override
  String get monthNovember => 'नवंबर';

  @override
  String get monthDecember => 'दिसंबर';

  @override
  String get exerciseBenchPress => 'बेंच प्रेस';

  @override
  String get exerciseSquat => 'स्क्वाट';

  @override
  String get exerciseRow => 'रो';

  @override
  String get exerciseDeadlift => 'डेडलिफ़्ट';

  @override
  String get exerciseOverheadPress => 'ओवरहेड प्रेस';

  @override
  String get exercisePullUp => 'पुल-अप';

  @override
  String get exerciseLunges => 'लंज';

  @override
  String get exercisePlank => 'प्लैंक';

  @override
  String get saveWorkout => 'वर्कआउट सेव करें';

  @override
  String get deleteWorkout => 'वर्कआउट हटाएँ';

  @override
  String get deleteTraining => 'वर्कआउट हटाएँ';

  @override
  String get deleteTrainingQuestion => 'इस वर्कआउट को शेड्यूल से हटाएँ?';

  @override
  String get addSetButton => 'सेट जोड़ें';

  @override
  String get progressButton => 'प्रगति';

  @override
  String get filterMonth => 'महीना';

  @override
  String get filterYear => 'साल';

  @override
  String get filterAllTime => 'पूरा समय';

  @override
  String get noteLabel => 'नोट:';

  @override
  String get addClient => 'क्लाइंट जोड़ें';

  @override
  String get workoutsToday => 'आज के वर्कआउट';

  @override
  String get workoutNumberPrefix => 'वर्कआउट #';

  @override
  String get noEntries => 'कोई एंट्री नहीं';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'प्राइवेसी पॉलिसी';

  @override
  String get instructionButton => 'गाइड';

  @override
  String get instructionTitle => 'यह कैसे बना है';

  @override
  String get instructionHubManifest =>
      'कोई एक्सरसाइज़ कैटलॉग नहीं, कोई तैयार प्रोग्राम नहीं। मूवमेंट के नाम आप रखते हैं — ऐप उनके आँकड़े रखती है।';

  @override
  String get instructionSearchHint => 'गाइड में खोजें';

  @override
  String get instructionSearchEmpty => 'कुछ नहीं मिला।';

  @override
  String get instructionChapterStartTitle => 'शुरुआत';

  @override
  String get instructionChapterStartBlurb =>
      'होम स्क्रीन, दो मोड, और ऐप का तरीक़ा।';

  @override
  String get instructionChapterSessionTitle => 'वर्कआउट के दौरान';

  @override
  String get instructionChapterSessionBlurb =>
      'सेट, वज़न, रेप्स, RIR, कार्डियो, और सेशन खत्म करना।';

  @override
  String get instructionChapterTimerTitle => 'स्टॉपवॉच';

  @override
  String get instructionChapterTimerBlurb =>
      'इंटरवल, सेट के बीच आराम, और संकेत।';

  @override
  String get instructionChapterExercisesTitle => 'एक्सरसाइज़ और ग्रुप';

  @override
  String get instructionChapterExercisesBlurb =>
      'आपकी मूवमेंट सूची, मसल ग्रुप, पसंदीदा, और क्विक वर्कआउट।';

  @override
  String get instructionChapterProgressTitle => 'प्रगति और रिकॉर्ड';

  @override
  String get instructionChapterProgressBlurb =>
      'व्यक्तिगत प्रगति, 1RM, टनाज, और एक्सरसाइज़ चार्ट।';

  @override
  String get instructionChapterRhythmTitle => 'रिदम और रिकवरी';

  @override
  String get instructionChapterRhythmBlurb =>
      'साप्ताहिक रिदम गेज और डीलोड हफ़्ता।';

  @override
  String get instructionChapterDataTitle => 'इतिहास और डेटा';

  @override
  String get instructionChapterDataBlurb =>
      'कैलेंडर, रिकॉर्ड संपादन, आँकड़े, और बैकअप।';

  @override
  String get instructionChapterCoachTitle => 'ट्रेनर मोड';

  @override
  String get instructionChapterCoachBlurb =>
      'क्लाइंट, शेड्यूल, सेशन प्लान, और प्रिंट।';

  @override
  String get instructionPhilosophy =>
      'IronVibe आपको ट्रेन करना नहीं सिखाता और तैयार प्रोग्राम नहीं देता — उसके लिए ट्रेनर और आपका अनुभव है। हज़ारों एक्सरसाइज़ का कैटलॉग नहीं: मूवमेंट के नाम आप अपने शब्दों में लिखते हैं, और ऐप चुपचाप गिनती करती है। सब डिवाइस पर रहता है: कोई अकाउंट नहीं, सब्सक्रिप्शन नहीं, विज्ञापन नहीं।';

  @override
  String get instructionSectionHome => 'होम';

  @override
  String get instructionThemeTitle => 'थीम';

  @override
  String get instructionThemeDesc =>
      'सूरज–चाँद स्विच हल्की और गहरी थीम बदलता है। चुनाव याद रहता है।';

  @override
  String get instructionTrainSelfTitle => 'खुद की ट्रेनिंग';

  @override
  String get instructionTrainSelfDesc =>
      'आपकी जगह: वर्कआउट, कैलेंडर, व्यक्तिगत प्रगति, पसंदीदा, और रिदम गेज।';

  @override
  String get instructionTrainOthersTitle => 'दूसरों की ट्रेनिंग';

  @override
  String get instructionTrainOthersDesc =>
      'ट्रेनर मोड: क्लाइंट, शेड्यूल, और हर व्यक्ति का अलग इतिहास। आपकी ट्रेनिंग से नहीं मिलता।';

  @override
  String get instructionLanguageTitle => 'भाषा';

  @override
  String get instructionLanguageDesc =>
      'ऐप सिस्टम की भाषा पर चलती है — अलग सेटिंग नहीं है। बारह भाषाएँ समर्थित हैं।';

  @override
  String get instructionHomeLinksTitle => 'वर्शन और संपर्क';

  @override
  String get instructionHomeLinksDesc =>
      'होम स्क्रीन के नीचे: वर्शन नंबर, वेबसाइट, Telegram, सपोर्ट ईमेल, और प्राइवेसी पॉलिसी।';

  @override
  String get instructionSectionAthleteMenu => 'आपकी ट्रेनिंग';

  @override
  String get instructionStartWorkoutTitle => 'वर्कआउट शुरू करें';

  @override
  String get instructionStartWorkoutDesc =>
      'खाली सेशन खोलता है — पिछला वर्कआउट कॉपी नहीं होता। एक्सरसाइज़ जोड़ें, सेट लिखें, फिर सेव करने के लिए खत्म करें।';

  @override
  String get instructionQuickWorkoutTitle => 'क्विक वर्कआउट';

  @override
  String get instructionQuickWorkoutDesc =>
      'आपके मसल-ग्रुप टैग से चार एक्सरसाइज़ का फुल-बॉडी सेशन बनाता है।';

  @override
  String get instructionCalendarMenuTitle => 'वर्कआउट कैलेंडर';

  @override
  String get instructionCalendarMenuDesc =>
      'जिन दिनों आपने ट्रेन किया। यहाँ से सेव सेशन खोलें, या छूटा हुआ जोड़ें।';

  @override
  String get instructionSectionPersonalProgress => 'व्यक्तिगत प्रगति';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'हर मूवमेंट के बेस्ट सेट, अनुमानित 1RM और अधिकतम वॉल्यूम की टेबल।';

  @override
  String get instructionFavoritesMenuTitle => 'पसंदीदा एक्सरसाइज़';

  @override
  String get instructionFavoritesMenuDesc =>
      'स्टार लगे मूवमेंट। उनमें से वर्कआउट दो टैप में बनता है।';

  @override
  String get instructionSectionWorkout => 'सेशन';

  @override
  String get instructionStrengthCardioTitle => 'स्ट्रेंथ या कार्डियो';

  @override
  String get instructionStrengthCardioDesc =>
      'सेशन के ऊपर का स्विच प्रकार तय करता है। स्ट्रेंथ: वज़न, रेप्स और RIR। कार्डियो: समय और तीव्रता। अगर दूसरा प्रकार पहले से भरा है, ऐप बदलने से पहले पूछती है।';

  @override
  String get instructionAddExerciseTitle => 'एक्सरसाइज़ जोड़ें';

  @override
  String get instructionAddExerciseBody =>
      'नया ब्लॉक तब जुड़ता है जब मौजूदा एक्सरसाइज़ का नाम हो और कम से कम एक पूरा सेट हो।';

  @override
  String get instructionPreviousHintsTitle => 'धूसर संकेत';

  @override
  String get instructionPreviousHintsDesc =>
      'पिछली बार का वज़न और रेप्स धूसर दिखते हैं — हराने का लक्ष्य, भरा सेट नहीं। इतिहास में सिर्फ़ वही अंक जाते हैं जो आप खुद लिखते हैं।';

  @override
  String get instructionRemoveExerciseTitle => 'एक्सरसाइज़ हटाएँ';

  @override
  String get instructionRemoveExerciseDesc =>
      'लाल X मौजूदा सेशन से ब्लॉक हटाता है। सेव इतिहास नहीं बदलता।';

  @override
  String get instructionSectionSetControl => 'सेट की पंक्ति';

  @override
  String get instructionSetPlusLabel => 'प्लस';

  @override
  String get instructionSetPlusDesc => 'अगले सेट के लिए खाली पंक्ति जोड़ता है।';

  @override
  String get instructionSetMinusLabel => 'माइनस';

  @override
  String get instructionSetMinusDesc =>
      'आखिरी सेट हटाता है। खाली पंक्ति तुरंत मिटती है, भरी हुई पुष्टि के बाद। अगर एक ही सेट बचे, फ़ील्ड बस खाली हो जाते हैं।';

  @override
  String get instructionSetProgressLabel => 'एक्सरसाइज़ चार्ट';

  @override
  String get instructionSetProgressDesc =>
      'इस मूवमेंट का रुझान महीने, साल या पूरे समय का खोलता है।';

  @override
  String get instructionExerciseVolumeTitle => 'एक्सरसाइज़ टनाज';

  @override
  String get instructionExerciseVolumeDesc =>
      'चार्ट बटन के दाएँ: हर पूरे सेट का वज़न × रेप्स का योग। लिखते समय अपडेट होता है।';

  @override
  String get instructionSectionInputs => 'फ़ील्ड का मतलब';

  @override
  String get instructionWeightTitle => 'वज़न';

  @override
  String get instructionWeightBody =>
      'बार या मशीन पर काम का भार। किलोग्राम या पाउंड लिखें — ऐप इकाई नहीं बदलती और चुनाव नहीं थोपती।';

  @override
  String get instructionRepsTitle => 'रेप्स';

  @override
  String get instructionRepsBody => 'सेट में कितने रेप किए।';

  @override
  String get instructionRirTitle => 'RIR — बचे हुए रेप';

  @override
  String get instructionRirBody =>
      'और कितने रेप हो सकते थे। 0 का मतलब फेलियर तक, ∞ वॉर्म-अप सेट। तीव्रता नापने का सरल तरीक़ा।';

  @override
  String get instructionOneRmTitle => '1RM — एक रेप का अधिकतम';

  @override
  String get instructionOneRmDesc =>
      'उस सेट के वज़न और रेप से एपली फ़ॉर्मूले पर एक रेप का अनुमानित अधिकतम। पंक्ति के नीचे दिखता है — ताक़त का मुख्य निशान।';

  @override
  String get instructionSectionCardio => 'कार्डियो';

  @override
  String get instructionCardioTitle => 'समय';

  @override
  String get instructionCardioBody =>
      'ब्लॉक की अवधि मिनटों में। न दूरी, न धड़कन: ऐप ट्रैकर से बँधी नहीं है।';

  @override
  String get instructionIntensityTitle => 'तीव्रता';

  @override
  String get instructionIntensityBody =>
      'मेहनत 1 से 5 — सरल RPE स्केल। कार्डियो सेशन में हर एक्सरसाइज़ की एक पंक्ति सेव होती है।';

  @override
  String get instructionSectionSaving => 'समापन';

  @override
  String get instructionFinishTitle => 'वर्कआउट खत्म करें';

  @override
  String get instructionFinishBody =>
      'सेशन के नीचे का बटन: ऐप पुष्टि माँगती है, फिर वर्कआउट इतिहास में लिखती है। कम से कम एक पूरा सेट चाहिए।';

  @override
  String get instructionLeaveWorkoutTitle => 'जल्दी निकलना';

  @override
  String get instructionLeaveWorkoutDesc =>
      'अगर डेटा वाले सेशन को बंद करें, तो रुक सकते हैं, जो लिखा है उसे सेव कर सकते हैं, या ड्राफ़्ट हटा सकते हैं।';

  @override
  String get instructionAutoSaveTitle => 'बीच में रुका वर्कआउट';

  @override
  String get instructionAutoSaveDesc =>
      'ड्राफ़्ट अपने आप सेव होता है — हर मिनट और जब ऐप बैकग्राउंड में जाती है। अगली बार उसी जगह से जारी रखें या हटाएँ।';

  @override
  String get instructionScreenAwakeTitle => 'स्क्रीन जगी रहती है';

  @override
  String get instructionScreenAwakeDesc =>
      'चलते सेशन में स्क्रीन सोती नहीं, इसलिए हर सेट के बाद फ़ोन अनलॉक नहीं करना पड़ता।';

  @override
  String get instructionStopwatchWhyTitle => 'आराम क्यों नापें';

  @override
  String get instructionStopwatchWhyBody =>
      'सेटों के बीच का पॉज़ भी वज़न और रेप जैसा काम का पैरामीटर है: छोटा आराम घनत्व बढ़ाता है, लंबा आराम भारी सेट तक पहुँचने देता है।';

  @override
  String get instructionStopwatchHowTitle => 'शुरू, रोक, रीसेट';

  @override
  String get instructionStopwatchHowBody =>
      'टाइमर सेशन के हेडर में टिका है और स्क्रॉल करते हुए दिखता रहता है। समय और बटन बीच में हैं; सामान्य मोड में यह ऊपर की ओर गिनता है, सेकंड के सौवें हिस्से सहित।';

  @override
  String get instructionStopwatchIntervalsTitle => 'बाएँ: इंटरवल';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — एक मिनट काम और एक मिनट आराम। 4/4 — चार-चार मिनट। 20/10 — ताबाता। चरण तब तक दोहराते हैं जब तक रोकें या रीसेट करें: लाल रंग काम है, नीला आराम।';

  @override
  String get instructionStopwatchRestTitle => 'दाएँ: आराम';

  @override
  String get instructionStopwatchRestBody =>
      '+1मि, +2मि और +5मि सेटों के बीच उलटी गिनती शुरू करते हैं। अगर गिनती चल रही हो, मिनट बचे समय में जुड़ते हैं; इंटरवल लूप आराम पर चला जाता है।';

  @override
  String get instructionStopwatchProgressTitle => 'चरण की पट्टी';

  @override
  String get instructionStopwatchProgressBody =>
      'उलटी गिनती और इंटरवल में अंकों के नीचे पट्टी बताती है कि मौजूदा चरण का कितना हिस्सा बचा है।';

  @override
  String get instructionStopwatchSoundsTitle => 'आवाज़ और कंपन';

  @override
  String get instructionStopwatchSoundsBody =>
      'चरण खत्म होने से तीन, दो और एक सेकंड पहले — छोटी क्लिक और हल्का कंपन; चरण बदलना ज़्यादा ऊँचा। आवाज़ें ऐप में बनी हैं: न माइक्रोफ़ोन, न नोटिफ़िकेशन की अनुमति। वॉल्यूम फ़ोन की सेटिंग पर चलता है।';

  @override
  String get instructionExerciseBankIntro =>
      'एक्सरसाइज़ सूची अपने आप बढ़ती है: खत्म हुए वर्कआउट का हर नया नाम सुझावों में आ जाता है। नाम बड़े अक्षरों में रखे जाते हैं ताकि वही मूवमेंट दो न बन जाए।';

  @override
  String get instructionSectionExerciseNameTools => 'नाम';

  @override
  String get instructionRenameExerciseTitle => 'हर जगह नाम बदलें';

  @override
  String get instructionRenameExerciseDesc =>
      'नाम पर देर तक दबाएँ — सेशन में, सुझाव सूची में, या सेव वर्कआउट में। इतिहास और चार्ट पर अपडेट हो जाता है।';

  @override
  String get instructionRemoveFromBankTitle => 'सुझावों से हटाएँ';

  @override
  String get instructionRemoveFromBankDesc =>
      'खुली सुझाव सूची का X, या व्यक्तिगत प्रगति का लाल X, नाम को सुझावों और टेबल से हटाता है। सेव वर्कआउट ज्यों के त्यों रहते हैं।';

  @override
  String get instructionReassignExerciseTitle => 'रिकॉर्ड में दोबारा बाँधें';

  @override
  String get instructionReassignExerciseDesc =>
      'सेव वर्कआउट में ब्लॉक को दूसरी मूवमेंट पर ले जा सकते हैं। सेट वैसे ही रहते हैं, पर नए नाम के आँकड़ों में चले जाते हैं — सिर्फ़ यही सेशन बदलता है।';

  @override
  String get instructionSectionMuscleGroups => 'मसल ग्रुप';

  @override
  String get instructionMuscleGroupsIntro =>
      'ग्रुप आपके नाम पर वैकल्पिक टैग है। सिर्फ़ क्विक वर्कआउट इसका इस्तेमाल संतुलित फुल-बॉडी सेशन के लिए करता है। आठ ग्रुप: चेस्ट, बैक, शोल्डर, कोर, आगे की जाँघ, पीछे की जाँघ, बाइसेप्स, ट्राइसेप्स।';

  @override
  String get instructionMuscleGroupTagTitle => 'टैग कैसे करें';

  @override
  String get instructionMuscleGroupTagDesc =>
      'पहली बार नया नाम लिखने पर ऐप ग्रुप पूछती है। बाद में चुन सकते हैं, या क्विक वर्कआउट के लिए नहीं — अगर मूवमेंट मिश्रण से बाहर रखना हो। व्यक्तिगत प्रगति और पसंदीदा में नाम के नीचे चिप बदलना या हटाना आसान है।';

  @override
  String get instructionSectionFavorites => 'पसंदीदा';

  @override
  String get instructionFavoriteStarTitle => 'स्टार';

  @override
  String get instructionFavoriteStarDesc =>
      'स्टार सेशन की एक्सरसाइज़ कार्ड पर और व्यक्तिगत प्रगति की टेबल में है। पसंदीदा सूची में ऊपर रहते हैं।';

  @override
  String get instructionBuildFromFavoritesTitle => 'वर्कआउट बनाएँ';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'पसंदीदा स्क्रीन पर जो मूवमेंट चाहिए उन्हें चुनें — बटन तुरंत आ जाता है। सेशन उसी क्रम में खुलता है, पिछली बार के धूसर संकेतों के साथ। क्लाइंट के लिए वही काम उसका वर्कआउट खोलता है।';

  @override
  String get instructionSectionQuickWorkout => 'क्विक वर्कआउट';

  @override
  String get instructionQuickWorkoutHowTitle => 'चार जगहें';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'चेस्ट, बैक, पैरों का एक आधा हिस्सा (आगे या पीछे की जाँघ — एक दिन में दोनों नहीं), और शोल्डर, आर्म्स या कोर की एक मूवमेंट। हर जगह ऐप वह ग्रुप चुनती है जिस पर सबसे लंबे समय से काम नहीं हुआ, और पसंदीदा को तरजीह देती है।';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'झलक और बदलाव';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'शुरू करने से पहले पूरी लाइन दिखती है: किसी भी जगह को उसी ग्रुप की दूसरी एक्सरसाइज़ से बदला जा सकता है। अगर टैग किए मूवमेंट काफ़ी न हों, ऐप बताती है और टैग जोड़ने के लिए व्यक्तिगत प्रगति खोलती है।';

  @override
  String get instructionPersonalProgressIntro =>
      'सेव वर्कआउट की हर मूवमेंट की एक टेबल। पसंदीदा ऊपर, बाक़ी वर्णमाला से; खोज नाम ढूँढती है। ट्रेनिंग मेनू या क्लाइंट प्रोफ़ाइल से खोलें।';

  @override
  String get instructionProgressBestSetTitle => 'बेस्ट सेट';

  @override
  String get instructionProgressBestSetDesc =>
      'पूरे इतिहास में सबसे ऊँचे अनुमानित 1RM वाला सेट। बिना वज़न की मूवमेंट में सबसे ज़्यादा रेप वाला सेट।';

  @override
  String get instructionProgressMaxVolumeTitle => 'अधिकतम वॉल्यूम';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'एक वर्कआउट में इस एक्सरसाइज़ का सबसे बड़ा टनाज — काम का वॉल्यूम तय करते समय उपयोगी निशान।';

  @override
  String get instructionSectionProgressChart => 'एक्सरसाइज़ चार्ट';

  @override
  String get instructionProgressChartIntro =>
      'तारीख के हिसाब से तीन अलग रेखाएँ। बायाँ अक्ष वज़न है, दायाँ रेप; पीली रेखा सामान्यीकृत है ताकि आकार से रुझान तुलना हो सके। विंडो बदलें — महीना, साल, पूरा समय — और उस दिन के अंकों के लिए बिंदु छुएँ। कार्डियो चार्ट पर नहीं आता।';

  @override
  String get instructionProgressLineWeightDesc =>
      'लाल — उस दिन एक सेट में सबसे भारी वज़न।';

  @override
  String get instructionProgressLineRepsDesc =>
      'सियान — एक सेट में सबसे ज़्यादा रेप, ज़रूरी नहीं कि सबसे भारी वज़न के साथ।';

  @override
  String get instructionProgressLineVolumeDesc =>
      'पीला — दिन का टनाज: उन सेटों का वज़न × रेप का योग जिनमें दोनों फ़ील्ड भरे हों।';

  @override
  String get instructionProgressChartSessionHighlight =>
      'चलते वर्कआउट में चार्ट बटन तब जलता है जब आप रिकॉर्ड तोड़ें: सेट वज़न पर लाल, एक्सरसाइज़ टनाज पर पीला, बिना वज़न की मूवमेंट के कुल रेप पर सियान। एक से ज़्यादा लागू हों तो लाल जीतता है, फिर पीला, फिर सियान। सेव इतिहास में हाइलाइट नहीं होता।';

  @override
  String get instructionRhythmIntro =>
      'पिछले चार हफ़्तों में कम से कम तीन स्ट्रेंथ दिन हो जाएँ, तो ट्रेनिंग स्क्रीन के ऊपर रिदम गेज आता है। यह लक्ष्य नहीं और अंक नहीं — बस आप अभी जिम कितनी बार पहुँचते हैं।';

  @override
  String get instructionRhythmGaugeTitle => 'हफ़्ते में दिन';

  @override
  String get instructionRhythmGaugeDesc =>
      'चाप एक से छह दिन तक भरता है — चार हफ़्तों का औसत। स्ट्रेंथ वाले दिन गिने जाते हैं; सिर्फ़ कार्डियो वाले नहीं। रिदम जितना घना, रंग स्टील से सोने होते हुए जंग की ओर बढ़ता है।';

  @override
  String get instructionRhythmInsightTitle => 'रिदम का विवरण';

  @override
  String get instructionRhythmInsightDesc =>
      'गेज छुएँ: ऐप आपका मोड बताती है — हल्की लय, स्थिर लय, घनी लय, या लगभग बिना छुट्टी — और रिकवरी के लिए उसका मतलब समझाती है। क्लाइंट का गेज वही विवरण खोलता है।';

  @override
  String get instructionRhythmDeloadTitle => 'डीलोड हफ़्ता';

  @override
  String get instructionRhythmDeloadDesc =>
      'डीलोड रुकावट नहीं — आधी ताक़त का हफ़्ता है: काम का वज़न और सेट 30–50% कम, या सिर्फ़ कार्डियो। मांसपेशी लिगामेंट, टेंडन और जोड़ों से तेज़ ठीक होती है — यह हफ़्ता उन्हें पकड़ने का समय देता है।';

  @override
  String get instructionRhythmNudgeTitle => 'याद दिलाना';

  @override
  String get instructionRhythmNudgeDesc =>
      'अगर आप हफ़्ते में ढाई सेशन या उससे ज़्यादा रखते हैं और काफ़ी समय से डीलोड नहीं किया, ऐप ऐसा हफ़्ता लेने का सुझाव देती है। रिदम जितना घना, संकेत उतना जल्दी। यह हफ़्ते में ज़्यादा से ज़्यादा एक बार, सिर्फ़ व्यक्तिगत मोड में दिखता है — और सलाह रहता है, चिकित्सा सलाह नहीं।';

  @override
  String get instructionSectionCalendar => 'कैलेंडर और इतिहास';

  @override
  String get instructionCalendarBrowseTitle => 'कैसे देखें';

  @override
  String get instructionCalendarBrowseDesc =>
      'महीना बदलने के लिए स्वाइप करें; तारीख चुनने के लिए महीने के नाम पर टैप करें। दिन के नीचे बिंदु का मतलब है कि वर्कआउट था।';

  @override
  String get instructionCalendarAddTitle => 'पुरानी तारीख की एंट्री';

  @override
  String get instructionCalendarAddDesc =>
      'दिन चुनें, समय लगाएँ, और वर्कआउट जोड़ें — बीती तारीख भी। अगर सेशन लिखना भूल गए हों तो काम आता है।';

  @override
  String get instructionNavHistoryTitle => 'वर्कआउट टनाज';

  @override
  String get instructionNavHistoryDesc =>
      'हर सेव सेशन कुल टनाज दिखाता है। वॉल्यूम हाइपरट्रॉफ़ी के सबसे भरोसेमंद निशानों में है: मायने एक दिन का रिकॉर्ड नहीं, बल्कि हफ़्ते-दर-हफ़्ते उसका टिके रहना रखता है।';

  @override
  String get instructionHistoryEditTitle => 'रिकॉर्ड संपादित करना';

  @override
  String get instructionHistoryEditDesc =>
      'सेव वर्कआउट खोला और बदला जा सकता है: एक्सरसाइज़ या सेट जोड़ें, अंक बदलें, या सेशन हटाएँ। बदलाव तुरंत सेव होते हैं।';

  @override
  String get instructionSectionStats => 'आँकड़े';

  @override
  String get instructionStatsTitle => 'वर्कआउट सारांश';

  @override
  String get instructionStatsDesc =>
      'ट्रेनिंग या ट्रेनर स्क्रीन के हेडर में चार्ट आइकन: इस महीने, इस साल और पूरे समय कितने सेशन। ट्रेनर मोड में गिनती क्लाइंट के हिसाब से भी बँटती है।';

  @override
  String get instructionSectionBackup => 'बैकअप';

  @override
  String get instructionNavImportExportTitle => 'एक्सपोर्ट और इंपोर्ट';

  @override
  String get instructionNavImportExportDesc =>
      'एक्सपोर्ट इतिहास, एक्सरसाइज़ सूची, पसंदीदा, ग्रुप टैग, क्लाइंट और शेड्यूल को एक JSON फ़ाइल में समेटता है। इंपोर्ट फ़ाइल को मौजूदा डेटा में मिलाता है और डुप्लिकेट छोड़ता है — कुछ मिटता नहीं। ट्रेनर बैकअप व्यक्तिगत से अलग है।';

  @override
  String get instructionBackupNudgeTitle => 'बैकअप की याद';

  @override
  String get instructionBackupNudgeDesc =>
      'डेटा सिर्फ़ इस डिवाइस पर रहता है: कोई अकाउंट नहीं, कोई क्लाउड नहीं। हर चार हफ़्ते ऐप कॉपी सेव करने को कहती है — फ़ोन खो जाए तो इतिहास सिर्फ़ उसी फ़ाइल से वापस आता है।';

  @override
  String get instructionTrainerIntro =>
      'दूसरों की ट्रेनिंग लोगों के साथ काम की अलग जगह है: क्लाइंट, शेड्यूल, और हर व्यक्ति का इतिहास। व्यक्तिगत वर्कआउट और ट्रेनर डेटा कभी नहीं मिलते।';

  @override
  String get instructionClientsTitle => 'क्लाइंट';

  @override
  String get instructionClientsDesc =>
      'लक्ष्य, पिछला सेशन और अगला सेशन वाली सूची। कार्ड में लक्ष्य, वज़न, कद और ट्रेनर के निजी नोट्स हैं। नाम बनाते समय तय होता है और बाद में नहीं बदलता।';

  @override
  String get instructionClientProfileTitle => 'क्लाइंट प्रोफ़ाइल';

  @override
  String get instructionClientProfileDesc =>
      'आज का सेशन यहीं से शुरू होता है, साथ में प्रगति, पसंदीदा और महीने के हिसाब से इतिहास। स्ट्रेंथ के दिन काफ़ी हों तो रिदम गेज भी यहाँ है। क्लाइंट हटाने से आने वाले सेशन मिटते हैं; पुराने वर्कआउट रिपोर्ट के लिए रहते हैं।';

  @override
  String get instructionTrainerScheduleTitle => 'शेड्यूल';

  @override
  String get instructionTrainerScheduleDesc =>
      'ट्रेनर कैलेंडर हर क्लाइंट के सेशन दिखाता है: प्ले आइकन का मतलब योजना, चेक का मतलब पूरा, घंटाघर का मतलब आज चल रहा है। बीते दिनों की खाली योजनाएँ अपने आप हट जाती हैं।';

  @override
  String get instructionTrainerPlanTitle => 'सेशन प्लान';

  @override
  String get instructionTrainerPlanDesc =>
      'आने वाली तारीख के लिए एक्सरसाइज़ और नोट पहले से रख सकते हैं और वर्कआउट खत्म किए बिना सेव कर सकते हैं। पिछले वज़न और रेप धूसर संकेत बनकर आते हैं। इतिहास में सिर्फ़ पूरे सेशन जाते हैं।';

  @override
  String get instructionTrainerRepeatTitle => 'पिछला दोहराएँ';

  @override
  String get instructionTrainerRepeatDesc =>
      'क्लाइंट प्रोफ़ाइल से, या कैलेंडर पर सेशन जोड़ते समय स्विच के रूप में। एक्सरसाइज़ सूची कॉपी होती है; वज़न और रेप धूसर संकेत बनते हैं, पूरे सेट नहीं।';

  @override
  String get instructionPrintSessionTitle => 'सेशन प्रिंट करें';

  @override
  String get instructionPrintSessionDesc =>
      'पूरे वर्कआउट पर हेडर का प्रिंट आइकन उस दिन की लाइन और अंकों की A4 शीट बनाता है। फिर सिस्टम शीट: प्रिंटर, PDF, या क्लाइंट को भेजना।';

  @override
  String get instructionImportAthleteTitle => 'एथलीट का इतिहास इंपोर्ट करें';

  @override
  String get instructionImportAthleteDesc =>
      'ट्रेनर आँकड़ों में अलग बटन: व्यक्तिगत मोड की फ़ाइल नया क्लाइंट बनती है, पसंदीदा और ग्रुप टैग सहित। लाए गए वर्कआउट इंपोर्टेड चिह्नित होते हैं, और एक्सरसाइज़ के नाम आपके नामों से अलग रहते हैं।';

  @override
  String get printSession => 'प्रिंट';

  @override
  String get printSessionEmpty =>
      'अभी प्रिंट करने को कुछ नहीं। कम से कम एक सेट लिखें।';

  @override
  String get printSessionShareText => 'IronVibe सेशन';

  @override
  String get rhythmPerWeek => 'प्रति हफ़्ता';

  @override
  String get deloadNudgeTitle => 'सक्रिय रिकवरी का हफ़्ता?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'आप लगभग $weeks हफ़्तों से हफ़्ते में करीब $rate दिन ट्रेन कर रहे हैं। सक्रिय रिकवरी के हफ़्ते का अच्छा समय: काम का वज़न और सेट 30–50% कम, या सिर्फ़ कार्डियो। यह सलाह है, चिकित्सा सलाह नहीं।';
  }

  @override
  String get deloadNudgeLater => 'अभी नहीं';

  @override
  String get deloadNudgeOk => 'समझ लिया';

  @override
  String get backupNudgeTitle => 'बैकअप सेव करें?';

  @override
  String get backupNudgeBody =>
      'आपका डेटा सिर्फ़ इस डिवाइस पर है। खो जाए या स्टोरेज फ़ेल हो, तो इतिहास चला जाता है। अभी कॉपी शेयर करें, या 28 दिन टालें।';

  @override
  String get backupNudgeShare => 'शेयर';

  @override
  String get backupNudgeLater => 'बाद में';

  @override
  String get rhythmInsightTitle => 'ट्रेनिंग रिदम';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'आप औसतन हफ़्ते में करीब $rate बार ट्रेन करते हैं।';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name औसतन हफ़्ते में करीब $rate बार ट्रेन करता है।';
  }

  @override
  String get rhythmInsightBandLight => 'हल्की लय';

  @override
  String get rhythmInsightBandSteady => 'स्थिर लय';

  @override
  String get rhythmInsightBandDense => 'घनी लय';

  @override
  String get rhythmInsightBandVeryDense => 'लगभग बिना छुट्टी';

  @override
  String get rhythmInsightHowTitle => 'यह संख्या कहाँ से आती है';

  @override
  String get rhythmInsightWindow =>
      'पिछले चार हफ़्तों का औसत। स्ट्रेंथ वाले दिन गिने जाते हैं; सिर्फ़ कार्डियो वाले नहीं। यह लक्ष्य नहीं और अंक नहीं — बस आपकी मौजूदा लय।';

  @override
  String get rhythmInsightWhatTitle => 'सक्रिय रिकवरी का हफ़्ता';

  @override
  String get rhythmInsightWhatBody =>
      'रुकावट नहीं — आधी ताक़त का हफ़्ता: काम का वज़न और सेट की संख्या 30–50% कम। स्ट्रेंथ पूरी तरह छोड़कर कार्डियो या कोई और गतिविधि रख सकते हैं। मांसपेशी जोड़ों, लिगामेंट और टेंडन से तेज़ ठीक होती है — यह हफ़्ता उन्हें पकड़ने का समय देता है।';

  @override
  String get rhythmInsightPaceTitle => 'इसका मतलब';

  @override
  String get rhythmInsightAdviceLight =>
      'सेशनों के बीच आराम के दिन काफ़ी हैं, थकान नहीं जमती। सक्रिय रिकवरी की योजना अभी ज़रूरी नहीं — इस लय में शरीर खुद ठीक हो जाता है।';

  @override
  String get rhythmInsightAdviceSteady =>
      'स्थिर लय, जिस पर सालों चला जा सकता है। सेशन भारी हों तो हर कुछ महीनों में सक्रिय रिकवरी का हफ़्ता लें — वज़न रुकने के बाद से बेहतर, पहले।';

  @override
  String get rhythmInsightAdviceDense =>
      'सेशन पास-पास हैं, और थकान चुपचाप बढ़ती है। हर दो-तीन महीने सक्रिय रिकवरी का हफ़्ता आमतौर पर बिना ब्रेक पीसते रहने से प्रगति बेहतर रखता है।';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'लगभग हर दिन भार पर। नींद और खाना साथ दें तो चल सकता है। इस लय में महीने में लगभग एक बार सक्रिय रिकवरी का हफ़्ता जोड़ों और लिगामेंट की सामान्य देखभाल है, पीछे हटना नहीं।';

  @override
  String get rhythmInsightPraiseSteady =>
      'यही वह लय है जिसे लोग सालों रखते हैं।';

  @override
  String get rhythmInsightPraiseDense =>
      'आप अक्सर ट्रेन करते हैं — ऐसा शेड्यूल अपने आप नहीं बनता।';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'लगता है आपने शरीर का गुप्त मोड ढूँढ लिया।';

  @override
  String get rhythmInsightRecentLighter =>
      'भार हाल में पहले ही गिर चुका है — सक्रिय रिकवरी हो चुकी मानी जा सकती है। गति फिर पकड़ें।';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'यह लय $weeks हफ़्तों से बनी हुई है।',
      one: 'यह लय $weeks हफ़्ते से बनी हुई है।',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'यह सलाह है, चिकित्सा सलाह नहीं। अगर आप ठीक महसूस करते हैं, कुछ बदलना ज़रूरी नहीं।';
}
