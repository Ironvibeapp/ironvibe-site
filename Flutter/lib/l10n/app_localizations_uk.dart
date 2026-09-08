// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'ТВІЙ ВАЙБ ТРЕНУВАНЬ';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Скасувати';

  @override
  String get renameExerciseTitle => 'Перейменувати вправу';

  @override
  String get renameExerciseEmpty => 'Назва не може бути порожньою';

  @override
  String get reassignHistoryExerciseTitle => 'Змінити вправу';

  @override
  String get reassignHistoryExerciseBody =>
      'Змінюється лише це тренування. Підходи зберігаються; графік прогресу враховує нову назву вправи.';

  @override
  String get delete => 'Видалити';

  @override
  String get yesDelete => 'Так, видалити';

  @override
  String get close => 'Закрити';

  @override
  String get save => 'Зберегти';

  @override
  String get add => 'Додати';

  @override
  String get trainOthers => 'Я ТРЕНУЮ ІНШИХ';

  @override
  String get trainSelf => 'Я ТРЕНУЮСЯ САМ';

  @override
  String get statistics => 'СТАТИСТИКА';

  @override
  String get exportHistory => 'ЕКСПОРТ ІСТОРІЇ ТРЕНУВАНЬ';

  @override
  String get historyEmpty => 'Історія порожня, експортувати поки нічого';

  @override
  String get exportError => 'Помилка експорту:';

  @override
  String get exportJson => 'ЕКСПОРТ JSON';

  @override
  String get importData => 'ІМПОРТ';

  @override
  String get importSuccess => 'Дані успішно імпортовано';

  @override
  String get importError => 'Помилка імпорту:';

  @override
  String get importNewerVersion => 'Файл створено новішою версією застосунку';

  @override
  String get importFileAccessError => 'Помилка доступу до файлу';

  @override
  String get importInvalidJson => 'Невірний формат JSON';

  @override
  String get importInvalidBackupFile =>
      'Помилка: обрано некоректний файл резервної копії';

  @override
  String get importAthlete => 'ІМПОРТ АТЛЕТА';

  @override
  String importAthleteFound(int count) {
    return 'Знайдено записи про $count тренувань атлета, якого немає в списку.';
  }

  @override
  String get importAthleteBackupOwn => 'СПОЧАТКУ ЗБЕРЕГТИ СВОЇ ДАНІ';

  @override
  String get importAthleteDecline => 'Відмовитися';

  @override
  String get importAthleteSuccess => 'Атлета додано';

  @override
  String get importAthleteNotAthleteFile =>
      'Цей файл не є історією тренувань атлета.';

  @override
  String get importAthleteEmpty => 'У цьому файлі немає тренувань.';

  @override
  String get importAthleteAlreadyImported => 'Ці тренування вже є на пристрої.';

  @override
  String get importAthleteUseDedicatedButton =>
      'Це схоже на історію атлета. Скористайтеся «Імпорт атлета».';

  @override
  String get shareText => 'Історія тренувань IronVibe';

  @override
  String get monthStats => 'ЦЕЙ МІСЯЦЬ';

  @override
  String get yearStats => 'ЦЕЙ РІК';

  @override
  String get allTimeStats => 'ЗАВЕСЬ ЧАС';

  @override
  String get weight => 'Вага';

  @override
  String get reps => 'Повторен⁠ня';

  @override
  String get rir => 'RIR';

  @override
  String get oneRm => '1RM';

  @override
  String get approxOneRm => '≈ 1RM:';

  @override
  String get kg => 'кг';

  @override
  String get volumeShort => 'ОБ\'ЄМ';

  @override
  String get addSet => 'ДОДАТИ ПІДХІД';

  @override
  String get addExercise => 'ДОДАТИ ВПРАВУ';

  @override
  String get finishWorkout => 'ЗАВЕРШИТИ ТРЕНУВАННЯ';

  @override
  String get finishWorkoutConfirmTitle => 'Завершити тренування?';

  @override
  String get finishWorkoutConfirmBody => 'Тренування буде збережено.';

  @override
  String get finishWorkoutConfirmAction => 'Завершити';

  @override
  String get workoutCompleteTitle => 'Тренування збережено';

  @override
  String get planChangesSavedTitle => 'Зміни збережено';

  @override
  String get startWorkout => 'ПОЧАТИ ТРЕНУВАННЯ';

  @override
  String get quickWorkout => 'ШВИДКЕ ТРЕНУВАННЯ';

  @override
  String get quickWorkoutFullBody => 'ВСЕ ТІЛО';

  @override
  String get quickWorkoutInsufficientTitle => 'Недостатньо даних';

  @override
  String get quickWorkoutInsufficientBody =>
      'Для швидкого тренування потрібно щонайменше 4 вправи з різних груп м\'язів. Позначте групи в особистому прогресі — або просто логуйте: застосунок запитає при введенні нової вправи.';

  @override
  String get quickWorkoutOpenProgress => 'ВІДКРИТИ ОСОБИСТИЙ ПРОГРЕС';

  @override
  String get quickWorkoutPreviewTitle => 'ШВИДКЕ ТРЕНУВАННЯ · ВСЕ ТІЛО';

  @override
  String get quickWorkoutStart => 'ПОЧАТИ';

  @override
  String get quickWorkoutSwap => 'Замінити';

  @override
  String get quickWorkoutNoAlternatives => 'Інших вправ у цій групі немає';

  @override
  String get muscleGroupPromptTitle => 'Група м\'язів';

  @override
  String get muscleGroupPromptBody =>
      'Потрібно для швидкого тренування на все тіло.';

  @override
  String get muscleGroupLater => 'Пізніше';

  @override
  String get muscleGroupClear => 'Скинути';

  @override
  String get muscleGroupSkip => 'Не для швидкого тренування';

  @override
  String get muscleGroupChest => 'Груди';

  @override
  String get muscleGroupBack => 'Спина';

  @override
  String get muscleGroupShoulders => 'Плечі';

  @override
  String get muscleGroupCore => 'Кор';

  @override
  String get muscleGroupQuads => 'Переднє стегно';

  @override
  String get muscleGroupHamstrings => 'Заднє стегно';

  @override
  String get muscleGroupArmFlex => 'Згинання рук';

  @override
  String get muscleGroupArmExt => 'Розгинання рук';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'КАЛЕНДАР ТРЕНУВАНЬ';

  @override
  String get personalProgress => 'ОСОБИСТИЙ ПРОГРЕС';

  @override
  String get personalProgressSearchHint => 'Пошук вправ';

  @override
  String get personalProgressBestSet => 'Найкращий підхід';

  @override
  String get personalProgressMaxVolume => 'Макс. об\'єм';

  @override
  String get personalProgressEmpty => 'У тренуваннях ще немає вправ';

  @override
  String get favoriteExercises => 'УЛЮБЛЕНІ ВПРАВИ';

  @override
  String get favoriteExercisesEmpty => 'Поки немає улюблених вправ';

  @override
  String get buildWorkoutFromFavorites => 'ЗІБРАТИ ТРЕНУВАННЯ';

  @override
  String get exerciseHint => 'Введіть назву вправи';

  @override
  String get deleteFromHistory => 'Видалити з історії?';

  @override
  String get deleteExerciseHint =>
      'більше не з\'являтиметься у підказках і в особистому прогресі.';

  @override
  String get exerciseDeleted => 'видалено';

  @override
  String get deleteWorkoutTitle => 'ВИДАЛИТИ';

  @override
  String get deleteWorkoutMsg =>
      'Видалити це тренування? Історія прогресу буде втрачена.';

  @override
  String get removeSetWithDataConfirm =>
      'Видалити підхід з даними? Цю дію не можна скасувати.';

  @override
  String get removeExerciseFromWorkout => 'Видалити вправу';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'Видалити цю вправу з тренування? Цю дію не можна скасувати.';

  @override
  String get deleteClientTitle => 'ВИДАЛИТИ КЛІЄНТА';

  @override
  String get deleteClientMsg =>
      'Ви впевнені, що хочете видалити цього клієнта? Усі його майбутні тренування буде видалено.';

  @override
  String get noClientsTitle => 'НЕМАЄ КЛІЄНТІВ';

  @override
  String get noClientsMsg => 'Спочатку додайте клієнтів у меню Клієнти.';

  @override
  String get newClient => 'НОВИЙ КЛІЄНТ';

  @override
  String get editClient => 'РЕДАГУВАТИ';

  @override
  String get clientName => 'Ім\'я';

  @override
  String get clientNameCannotChange => 'Ім\'я потім змінити не можна.';

  @override
  String get clientNameTaken => 'Це ім\'я вже зайняте. Оберіть інше.';

  @override
  String get clientGoal => 'Ціль';

  @override
  String get clientWeight => 'Вага';

  @override
  String get clientHeight => 'Зріст';

  @override
  String get clientNotes => 'Нотатки';

  @override
  String get saveClientChanges => 'ЗБЕРЕГТИ ЗМІНИ';

  @override
  String get clientProfileUnsavedTitle => 'Незбережені зміни';

  @override
  String get clientProfileUnsavedMessage =>
      'Є незбережені зміни. Зберегти перед виходом?';

  @override
  String get clientProfileStay => 'Залишитись';

  @override
  String get clientProfileDiscard => 'Вийти без збереження';

  @override
  String get clientProfileSaveAndLeave => 'Зберегти й вийти';

  @override
  String get workoutRecoveryTitle => 'Тренування перервано';

  @override
  String get workoutRecoveryMessage =>
      'Попереднє тренування завершилось некоректно. Продовжити зі збережених даних або видалити чернетку.';

  @override
  String get workoutRecoveryContinue => 'Продовжити тренування';

  @override
  String get workoutRecoveryDelete => 'Видалити тренування';

  @override
  String get workoutRecoverySessionMissing =>
      'Заплановане тренування клієнта було видалено. Чернетку очищено.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Спочатку заповніть поточну вправу, перш ніж додавати наступну.';

  @override
  String get switchWorkoutTypeTitle => 'Змінити тип тренування?';

  @override
  String get switchWorkoutTypeBody =>
      'Підходи іншого типу не збережуться в цьому тренуванні.';

  @override
  String get switchWorkoutTypeConfirm => 'Змінити';

  @override
  String get saveWorkoutNothingToSave =>
      'Поки немає що зберігати. Вкажіть вагу й повтори або тривалість кардіо.';

  @override
  String get importedHistoryBadge => 'Імпорт';

  @override
  String get clientWorkoutHistoryEmpty => 'Історія порожня';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Вправа №$n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Вправа №$n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return '№$n';
  }

  @override
  String get clientProfileSectionGoal => 'ЦІЛЬ';

  @override
  String get clientProfileSectionAnthropometry => 'АНТРОПОМЕТРІЯ';

  @override
  String get clientProfileSectionTrainerNotes => 'НОТАТКИ ТРЕНЕРА';

  @override
  String get clientProfileSectionWorkoutHistory => 'ІСТОРІЯ ТРЕНУВАНЬ';

  @override
  String get clientTrainerNotesHint => 'Травми, особливості, план…';

  @override
  String get trainerSessionDefaultTitle => 'Тренування';

  @override
  String get durationMinutesShort => 'хв';

  @override
  String get addTraining => 'ДОДАТИ ТРЕНУВАННЯ';

  @override
  String get repeatLastWorkout => 'Повторити минуле тренування';

  @override
  String get repeatLastUnavailable =>
      'У цього клієнта ще немає тренування, яке можна повторити.';

  @override
  String get editPlan => 'Змінити план';

  @override
  String get trainerSessionEmpty => 'Ще не заплановано';

  @override
  String trainerSessionPlanned(int n) {
    return 'План: $n';
  }

  @override
  String get trainerClientsEmpty =>
      'Поки немає клієнтів. Додайте когось, щоб ставити тренування.';

  @override
  String get clientNeverTrained => 'Тренувань поки немає';

  @override
  String get clientNoUpcoming => 'Немає найближчої сесії';

  @override
  String clientLastSession(String when) {
    return 'Минула: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Наступна: $when';
  }

  @override
  String get clientSessionToday => 'сьогодні';

  @override
  String get clientSessionYesterday => 'вчора';

  @override
  String get clientSessionTomorrow => 'завтра';

  @override
  String clientSessionDaysAgo(int n) {
    return '$n дн. тому';
  }

  @override
  String clientSessionInDays(int n) {
    return 'за $n дн.';
  }

  @override
  String get clientProfileDetails => 'Профіль';

  @override
  String get addSessionPickClient => 'Оберіть клієнта';

  @override
  String get clientLabel => 'Клієнт';

  @override
  String get deleteClientBtn => 'ВИДАЛИТИ КЛІЄНТА';

  @override
  String get clientsMenu => 'КЛІЄНТИ';

  @override
  String get dateHeader => 'Дата';

  @override
  String get clientHeader => 'Клієнт';

  @override
  String get exerciseHeader => 'Вправа';

  @override
  String get typeHeader => 'Тип';

  @override
  String get strengthType => 'Силове';

  @override
  String get cardioType => 'Кардіо';

  @override
  String get weightHeader => 'Вага';

  @override
  String get weightUnitsChoiceShort => 'кг / lb';

  @override
  String get progressChartWeightLegend => 'Вага — кг / lb (як зручно вносите)';

  @override
  String get progressChartVolumeLegend => 'Обсяг (тоннаж)';

  @override
  String get repsHeader => 'Повт.';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'Час (хв)';

  @override
  String get intensityHeader => 'Інтенсивність';

  @override
  String get setHeader => 'Підхід';

  @override
  String get strength => 'Силове';

  @override
  String get cardio => 'Кардіо';

  @override
  String get timeMin => 'Час (хв)';

  @override
  String get intensity => 'Інтенсивність';

  @override
  String get reserve => 'Запас';

  @override
  String get sets => 'Підходи';

  @override
  String get time => 'Час';

  @override
  String get rest => 'Відпочинок';

  @override
  String get settings => 'Налаштування';

  @override
  String get max => 'Макс';

  @override
  String get totalVolume => 'Загальний обсяг';

  @override
  String get chart => 'Графік';

  @override
  String get progress => 'Прогрес';

  @override
  String get dayMonday => 'Понеділок';

  @override
  String get dayTuesday => 'Вівторок';

  @override
  String get dayWednesday => 'Середа';

  @override
  String get dayThursday => 'Четвер';

  @override
  String get dayFriday => 'П\'ятниця';

  @override
  String get daySaturday => 'Субота';

  @override
  String get daySunday => 'Неділя';

  @override
  String get greetingHi => 'Привіт';

  @override
  String get greetingMorning => 'Доброго ранку';

  @override
  String get greetingAfternoon => 'Доброго дня';

  @override
  String get greetingEvening => 'Доброго вечора';

  @override
  String get monthJanuary => 'Січень';

  @override
  String get monthFebruary => 'Лютий';

  @override
  String get monthMarch => 'Березень';

  @override
  String get monthApril => 'Квітень';

  @override
  String get monthMay => 'Травень';

  @override
  String get monthJune => 'Червень';

  @override
  String get monthJuly => 'Липень';

  @override
  String get monthAugust => 'Серпень';

  @override
  String get monthSeptember => 'Вересень';

  @override
  String get monthOctober => 'Жовтень';

  @override
  String get monthNovember => 'Листопад';

  @override
  String get monthDecember => 'Грудень';

  @override
  String get exerciseBenchPress => 'Жим лежачи';

  @override
  String get exerciseSquat => 'Присідання';

  @override
  String get exerciseRow => 'Тяга в нахилі';

  @override
  String get exerciseDeadlift => 'Станова тяга';

  @override
  String get exerciseOverheadPress => 'Жим над головою';

  @override
  String get exercisePullUp => 'Підтягування';

  @override
  String get exerciseLunges => 'Випади';

  @override
  String get exercisePlank => 'Планка';

  @override
  String get saveWorkout => 'ЗБЕРЕГТИ ТРЕНУВАННЯ';

  @override
  String get deleteWorkout => 'ВИДАЛИТИ ТРЕНУВАННЯ';

  @override
  String get deleteTraining => 'Видалити тренування';

  @override
  String get deleteTrainingQuestion => 'Видалити це тренування з розкладу?';

  @override
  String get addSetButton => 'Додати підхід';

  @override
  String get progressButton => 'Прогрес';

  @override
  String get filterMonth => 'Місяць';

  @override
  String get filterYear => 'Рік';

  @override
  String get filterAllTime => 'Увесь час';

  @override
  String get noteLabel => 'Нотатка';

  @override
  String get addClient => 'ДОДАТИ КЛІЄНТА';

  @override
  String get workoutsToday => 'ТРЕНУВАННЯ НА СЬОГОДНІ';

  @override
  String get workoutNumberPrefix => 'Тренування #';

  @override
  String get noEntries => 'Немає записів';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Політика конфіденційності';

  @override
  String get instructionButton => 'ІНСТРУКЦІЯ';

  @override
  String get instructionTitle => 'Як усе влаштовано';

  @override
  String get instructionHubManifest =>
      'Без каталогу вправ і готових програм. Ви називаєте рухи своїми словами — застосунок веде за ними статистику.';

  @override
  String get instructionSearchHint => 'Пошук в інструкції';

  @override
  String get instructionSearchEmpty => 'Нічого не знайдено.';

  @override
  String get instructionChapterStartTitle => 'З чого почати';

  @override
  String get instructionChapterStartBlurb =>
      'Головний екран, два режими й логіка застосунку.';

  @override
  String get instructionChapterSessionTitle => 'На тренуванні';

  @override
  String get instructionChapterSessionBlurb =>
      'Підходи, вага, повторення, RIR, кардіо й завершення сесії.';

  @override
  String get instructionChapterTimerTitle => 'Секундомір';

  @override
  String get instructionChapterTimerBlurb =>
      'Інтервали, відпочинок між підходами й сигнали.';

  @override
  String get instructionChapterExercisesTitle => 'Вправи й групи';

  @override
  String get instructionChapterExercisesBlurb =>
      'Свій список рухів, м\'язові групи, обране й швидке тренування.';

  @override
  String get instructionChapterProgressTitle => 'Прогрес і рекорди';

  @override
  String get instructionChapterProgressBlurb =>
      'Особистий прогрес, 1RM, тоннаж і графік вправи.';

  @override
  String get instructionChapterRhythmTitle => 'Ритм і відновлення';

  @override
  String get instructionChapterRhythmBlurb =>
      'Шкала тижневого ритму й тиждень розвантаження.';

  @override
  String get instructionChapterDataTitle => 'Історія й дані';

  @override
  String get instructionChapterDataBlurb =>
      'Календар, правки записів, статистика й резервна копія.';

  @override
  String get instructionChapterCoachTitle => 'Режим тренера';

  @override
  String get instructionChapterCoachBlurb =>
      'Клієнти, розклад, план сесії й друк.';

  @override
  String get instructionPhilosophy =>
      'IronVibe не вчить тренуватися й не видає готових програм — для цього є тренер і власний досвід. Тут немає каталогу з тисяч вправ: назви рухів ви вводите своїми словами, а застосунок акуратно рахує за ними цифри. Усе зберігається на пристрої: ні акаунтів, ні підписок, ні реклами.';

  @override
  String get instructionSectionHome => 'Головний екран';

  @override
  String get instructionThemeTitle => 'Тема';

  @override
  String get instructionThemeDesc =>
      'Перемикач сонце — місяць змінює світле й темне оформлення. Вибір запам\'ятовується.';

  @override
  String get instructionTrainSelfTitle => 'Я тренуюся сам';

  @override
  String get instructionTrainSelfDesc =>
      'Ваш контур: тренування, календар, особистий прогрес, обране й шкала ритму.';

  @override
  String get instructionTrainOthersTitle => 'Я треную інших';

  @override
  String get instructionTrainOthersDesc =>
      'Режим тренера: клієнти, розклад і окрема історія на кожну людину. З особистими тренуваннями не змішується.';

  @override
  String get instructionLanguageTitle => 'Мова';

  @override
  String get instructionLanguageDesc =>
      'Застосунок іде за мовою системи — окремого налаштування немає. Підтримується десять мов.';

  @override
  String get instructionHomeLinksTitle => 'Версія й зв\'язок';

  @override
  String get instructionHomeLinksDesc =>
      'Внизу головного екрана — номер версії, сайт, Telegram, пошта підтримки й політика конфіденційності.';

  @override
  String get instructionSectionAthleteMenu => 'Ваші тренування';

  @override
  String get instructionStartWorkoutTitle => 'Почати тренування';

  @override
  String get instructionStartWorkoutDesc =>
      'Відкриває порожню сесію — минуле не копіюється. Додавайте вправи, записуйте підходи й завершіть, щоб зберегти.';

  @override
  String get instructionQuickWorkoutTitle => 'Швидке тренування';

  @override
  String get instructionQuickWorkoutDesc =>
      'Збирає тренування на все тіло з чотирьох вправ за вашими мітками м\'язових груп.';

  @override
  String get instructionCalendarMenuTitle => 'Календар тренувань';

  @override
  String get instructionCalendarMenuDesc =>
      'Дні, в які ви тренувались. Звідси відкриваються збережені сесії й додаються пропущені.';

  @override
  String get instructionSectionPersonalProgress => 'Особистий прогрес';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Таблиця найкращих підходів, розрахункового 1RM і максимального обсягу по кожному руху.';

  @override
  String get instructionFavoritesMenuTitle => 'Улюблені вправи';

  @override
  String get instructionFavoritesMenuDesc =>
      'Рухи, позначені зіркою. З них збирається тренування за пару дотиків.';

  @override
  String get instructionSectionWorkout => 'Сесія';

  @override
  String get instructionStrengthCardioTitle => 'Силове чи кардіо';

  @override
  String get instructionStrengthCardioDesc =>
      'Перемикач угорі сесії задає тип тренування. Силове — вага, повторення й RIR; кардіо — час та інтенсивність. Якщо дані іншого типу вже введені, застосунок перепитає.';

  @override
  String get instructionAddExerciseTitle => 'Додати вправу';

  @override
  String get instructionAddExerciseBody =>
      'Новий блок з\'явиться, коли в поточної вправи є назва й хоча б один заповнений підхід.';

  @override
  String get instructionPreviousHintsTitle => 'Сірі підказки';

  @override
  String get instructionPreviousHintsDesc =>
      'Вага й повторення минулого разу показані сірим — це орієнтир, який треба побити, а не записаний підхід. В історію потрапить лише те, що ви введете самі.';

  @override
  String get instructionRemoveExerciseTitle => 'Прибрати вправу';

  @override
  String get instructionRemoveExerciseDesc =>
      'Червоний хрестик видаляє блок із поточної сесії. Збережена історія при цьому не змінюється.';

  @override
  String get instructionSectionSetControl => 'Рядок підходу';

  @override
  String get instructionSetPlusLabel => 'Плюс';

  @override
  String get instructionSetPlusDesc =>
      'Додає порожній рядок наступного підходу.';

  @override
  String get instructionSetMinusLabel => 'Мінус';

  @override
  String get instructionSetMinusDesc =>
      'Прибирає останній підхід. Порожній рядок видаляє одразу, заповнений — після підтвердження. Якщо підхід лишився один, поля просто очистяться.';

  @override
  String get instructionSetProgressLabel => 'Графік вправи';

  @override
  String get instructionSetProgressDesc =>
      'Відкриває динаміку цього руху за місяць, рік або весь час.';

  @override
  String get instructionExerciseVolumeTitle => 'Тоннаж вправи';

  @override
  String get instructionExerciseVolumeDesc =>
      'Праворуч від кнопки графіка — сума «вага × повторення» по всіх заповнених підходах. Перераховується на льоту.';

  @override
  String get instructionSectionInputs => 'Що означають поля';

  @override
  String get instructionWeightTitle => 'Вага';

  @override
  String get instructionWeightBody =>
      'Робоча вага снаряда. Вводьте в кілограмах або фунтах — застосунок одиниці не перераховує й нічого не нав\'язує.';

  @override
  String get instructionRepsTitle => 'Повторення';

  @override
  String get instructionRepsBody => 'Скільки разів ви виконали рух у підході.';

  @override
  String get instructionRirTitle => 'RIR — запас повторень';

  @override
  String get instructionRirBody =>
      'Скільки повторень ви ще могли б зробити понад виконане. 0 — робота до відмови, ∞ — розминочний підхід. Простий спосіб дозувати інтенсивність.';

  @override
  String get instructionOneRmTitle => '1RM — разовий максимум';

  @override
  String get instructionOneRmDesc =>
      'Розрахункова оцінка ваги на одне повторення за формулою Еплі. Рахується з ваги й повторень підходу й показується просто під рядком — ключовий орієнтир сили.';

  @override
  String get instructionSectionCardio => 'Кардіо';

  @override
  String get instructionCardioTitle => 'Час';

  @override
  String get instructionCardioBody =>
      'Тривалість блоку в хвилинах. Дистанції й пульсу тут немає: застосунок не пов\'язаний із трекерами.';

  @override
  String get instructionIntensityTitle => 'Інтенсивність';

  @override
  String get instructionIntensityBody =>
      'Оцінка зусилля від 1 до 5 — спрощена шкала RPE. У кардіо-сесії на вправу зберігається один рядок.';

  @override
  String get instructionSectionSaving => 'Завершення';

  @override
  String get instructionFinishTitle => 'Завершити тренування';

  @override
  String get instructionFinishBody =>
      'Кнопка внизу сесії: застосунок перепитає й запише тренування в історію. Потрібен хоча б один заповнений підхід.';

  @override
  String get instructionLeaveWorkoutTitle => 'Вихід раніше часу';

  @override
  String get instructionLeaveWorkoutDesc =>
      'Якщо закрити сесію з даними, можна лишитися, зберегти зроблене або видалити чернетку.';

  @override
  String get instructionAutoSaveTitle => 'Перерване тренування';

  @override
  String get instructionAutoSaveDesc =>
      'Чернетка зберігається сама — раз на хвилину й коли згортаєте застосунок. Наступного запуску вам запропонують продовжити з того ж місця або видалити її.';

  @override
  String get instructionScreenAwakeTitle => 'Екран не гасне';

  @override
  String get instructionScreenAwakeDesc =>
      'Поки йде жива сесія, екран лишається увімкненим, щоб не розблоковувати телефон після кожного підходу.';

  @override
  String get instructionStopwatchWhyTitle => 'Навіщо рахувати відпочинок';

  @override
  String get instructionStopwatchWhyBody =>
      'Пауза між підходами — такий самий робочий параметр, як вага й повторення: короткий відпочинок піднімає щільність роботи, довгий дає викластися у важкому підході.';

  @override
  String get instructionStopwatchHowTitle => 'Пуск, пауза, скидання';

  @override
  String get instructionStopwatchHowBody =>
      'Таймер закріплений у шапці сесії й лишається на виду під час прокрутки. У центрі — час і керування; у звичайному режимі відлік іде вгору, із сотими частками секунди.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Ліворуч: інтервали';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — хвилина роботи й хвилина відпочинку. 4/4 — по чотири хвилини. 20/10 — табата. Фази чергуються по колу до паузи чи скидання: червоний відтінок — робота, синій — відпочинок.';

  @override
  String get instructionStopwatchRestTitle => 'Праворуч: відпочинок';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m і +5m запускають зворотний відлік між підходами. Якщо відлік уже йде, хвилини додаються до залишку; інтервальний цикл перемкнеться на відпочинок.';

  @override
  String get instructionStopwatchProgressTitle => 'Смуга фази';

  @override
  String get instructionStopwatchProgressBody =>
      'У зворотному відліку й інтервалах під цифрами видно, скільки поточної фази лишилось.';

  @override
  String get instructionStopwatchSoundsTitle => 'Звук і вібрація';

  @override
  String get instructionStopwatchSoundsBody =>
      'За три, дві й одну секунду до кінця фази — короткий клац і легка вібрація, на зміні фази сигнал помітніший. Звуки вбудовані в застосунок: ні мікрофон, ні дозвіл на сповіщення не потрібні, гучність береться з налаштувань телефону.';

  @override
  String get instructionExerciseBankIntro =>
      'Список вправ росте сам: кожна нова назва із завершеного тренування потрапляє в підказки. Імена зберігаються у верхньому регістрі, щоб один рух не роздвоювався.';

  @override
  String get instructionSectionExerciseNameTools => 'Назви';

  @override
  String get instructionRenameExerciseTitle => 'Перейменувати скрізь';

  @override
  String get instructionRenameExerciseDesc =>
      'Довге натискання на назву — у сесії, в списку підказок або в збереженому тренуванні. Ім\'я оновиться в усій історії й на графіках.';

  @override
  String get instructionRemoveFromBankTitle => 'Прибрати з підказок';

  @override
  String get instructionRemoveFromBankDesc =>
      'Хрестик у відкритому списку підказок або червоний хрестик в особистому прогресі прибирає назву з підказок і з таблиці. Збережені тренування лишаються недоторканими.';

  @override
  String get instructionReassignExerciseTitle => 'Замінити в записі';

  @override
  String get instructionReassignExerciseDesc =>
      'У збереженому тренуванні блок можна перепризначити на інший рух. Підходи лишаться як є, але підуть у статистику нової назви — змінюється лише ця сесія.';

  @override
  String get instructionSectionMuscleGroups => 'М\'язові групи';

  @override
  String get instructionMuscleGroupsIntro =>
      'Група — необов\'язкова мітка до вашої назви. Вона потрібна лише швидкому тренуванню, щоб зібрати збалансоване тренування на все тіло. Вісім груп: груди, спина, плечі, кор, переднє стегно, заднє стегно, згинання рук, розгинання рук.';

  @override
  String get instructionMuscleGroupTagTitle => 'Як поставити мітку';

  @override
  String get instructionMuscleGroupTagDesc =>
      'При першому введенні нової назви застосунок запитає групу. Можна відповісти «Пізніше» або «Не для швидкого тренування», якщо рух не має потрапляти в мікс. Мітку під іменем в особистому прогресі й обраному легко змінити або зняти.';

  @override
  String get instructionSectionFavorites => 'Обране';

  @override
  String get instructionFavoriteStarTitle => 'Зірка';

  @override
  String get instructionFavoriteStarDesc =>
      'Зірка є і на картці вправи в сесії, і в таблиці особистого прогресу. Обрані тримаються вгорі списку.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Зібрати тренування';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'На екрані обраного позначте потрібні рухи — кнопка з\'явиться одразу. Сесія відкриється в тому ж порядку, із сірими підказками минулого разу. Для клієнта та сама дія відкриває його тренування.';

  @override
  String get instructionSectionQuickWorkout => 'Швидке тренування';

  @override
  String get instructionQuickWorkoutHowTitle => 'Чотири слоти';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Груди, спина, одна половина ніг (переднє або заднє стегно — не обидві в один день) і один рух на плечі, руки чи кор. У кожному слоті застосунок бере групу, яка довше не працювала, і віддає пріоритет обраному.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Перегляд і заміна';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'Перед стартом видно весь склад: будь-який слот можна замінити іншою вправою тієї ж групи. Якщо позначених рухів бракує, застосунок скаже про це й відкриє особистий прогрес, щоб розставити мітки.';

  @override
  String get instructionPersonalProgressIntro =>
      'Одна таблиця по всіх рухах зі збережених тренувань. Обрані вгорі, решта за абеткою; пошук знаходить за назвою. Відкривається з меню тренувань або з профілю клієнта.';

  @override
  String get instructionProgressBestSetTitle => 'Найкращий підхід';

  @override
  String get instructionProgressBestSetDesc =>
      'Підхід із найвищим розрахунковим 1RM за всю історію. Для рухів без ваги береться підхід із найбільшою кількістю повторень.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Максимальний обсяг';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'Найбільший тоннаж цієї вправи за одне тренування — орієнтир, від якого зручно планувати робочий обсяг.';

  @override
  String get instructionSectionProgressChart => 'Графік вправи';

  @override
  String get instructionProgressChartIntro =>
      'Три незалежні криві за датами. Ліворуч шкала ваги, праворуч — повторень; жовта лінія нормалізована, щоб тренди порівнювались за формою. Період перемикається — місяць, рік, увесь час, — а дотик до точки показує цифри цього дня. Кардіо в графік не потрапляє.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Червона — найбільша вага в одному підході за день.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Блакитна — найбільша кількість повторень у підході, не обов\'язково з максимальною вагою.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Жовта — денний тоннаж: сума «вага × повторення» по підходах, де заповнені обидва поля.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'На живому тренуванні кнопка графіка підсвічується, коли ви б\'єте рекорд: червоним — за вагою в підході, жовтим — за тоннажем вправи, блакитним — за сумою повторень у рухах без ваги. Якщо збіглося кілька, пріоритет у червоного, потім жовтий і блакитний. У збереженій історії підсвітки немає.';

  @override
  String get instructionRhythmIntro =>
      'Коли за останні чотири тижні набирається хоча б три силових дні, угорі екрана тренувань з\'являється шкала ритму. Це не мета й не оцінка — просто те, як ви зараз ходите в зал.';

  @override
  String get instructionRhythmGaugeTitle => 'Днів на тиждень';

  @override
  String get instructionRhythmGaugeDesc =>
      'Дуга заповнюється від одного до шести днів — це середнє за чотири тижні. Рахуються дні із силовою роботою, дні лише з кардіо — ні. Що щільніший ритм, то далі колір іде від сталі через золото до іржі.';

  @override
  String get instructionRhythmInsightTitle => 'Розбір ритму';

  @override
  String get instructionRhythmInsightDesc =>
      'Натисніть на шкалу: застосунок назве ваш режим — спокійний, рівний, щільний або майже без вихідних — і пояснить, що він означає для відновлення. У клієнта тренера відкривається такий самий розбір.';

  @override
  String get instructionRhythmDeloadTitle => 'Тиждень розвантаження';

  @override
  String get instructionRhythmDeloadDesc =>
      'Розвантаження — не пауза, а тиждень напівсили: робочі ваги й число підходів нижчі на 30–50%, або лише кардіо. М\'язи відновлюються швидше за зв\'язки, сухожилля й суглоби — такий тиждень дає їм наздогнати.';

  @override
  String get instructionRhythmNudgeTitle => 'Нагадування';

  @override
  String get instructionRhythmNudgeDesc =>
      'Якщо ви тримаєте від двох з половиною тренувань на тиждень і давно не розвантажувались, застосунок запропонує взяти такий тиждень. Що щільніший ритм, то раніше з\'явиться підказка. Вона спливає не частіше разу на тиждень і лише в особистому режимі — і лишається рекомендацією, а не медичною порадою.';

  @override
  String get instructionSectionCalendar => 'Календар і історія';

  @override
  String get instructionCalendarBrowseTitle => 'Як гортати';

  @override
  String get instructionCalendarBrowseDesc =>
      'Місяці гортаються свайпом, а натискання на назву місяця відкриває швидкий вибір дати. Крапка під числом означає, що цього дня було тренування.';

  @override
  String get instructionCalendarAddTitle => 'Запис заднім числом';

  @override
  String get instructionCalendarAddDesc =>
      'Оберіть день, вкажіть час і додайте тренування — зокрема за минулу дату. Зручно, якщо сесію забули записати.';

  @override
  String get instructionNavHistoryTitle => 'Тоннаж тренування';

  @override
  String get instructionNavHistoryDesc =>
      'У кожної збереженої сесії вказано сумарний тоннаж. Обсяг — один із найнадійніших орієнтирів для гіпертрофії: важливий не рекорд в окремий день, а те, як він тримається з тижня в тиждень.';

  @override
  String get instructionHistoryEditTitle => 'Правка записів';

  @override
  String get instructionHistoryEditDesc =>
      'Збережене тренування можна розкрити й поправити: додати вправу чи підхід, змінити цифри, видалити сесію цілком. Зміни зберігаються одразу.';

  @override
  String get instructionSectionStats => 'Статистика';

  @override
  String get instructionStatsTitle => 'Зведення тренувань';

  @override
  String get instructionStatsDesc =>
      'Іконка графіка в шапці екрана тренувань або тренера: скільки сесій було за місяць, за рік і за весь час. У режимі тренера — ще й розбивка по клієнтах.';

  @override
  String get instructionSectionBackup => 'Резервна копія';

  @override
  String get instructionNavImportExportTitle => 'Експорт і імпорт';

  @override
  String get instructionNavImportExportDesc =>
      'Експорт складає в один файл JSON історію, список вправ, обране, мітки груп, клієнтів і розклад. Імпорт підмішує файл до поточних даних і пропускає дублі — нічого не затирається. Тренерська копія відділена від особистої.';

  @override
  String get instructionBackupNudgeTitle => 'Нагадування про копію';

  @override
  String get instructionBackupNudgeDesc =>
      'Дані живуть лише на цьому пристрої: акаунтів і хмари немає. Раз на чотири тижні застосунок запропонує зберегти копію — якщо телефон загубиться, історія відновиться лише з файлу.';

  @override
  String get instructionTrainerIntro =>
      '«Я треную інших» — окремий контур для роботи з людьми: клієнти, розклад і своя історія на кожного. Особисті тренування й тренерські дані не перетинаються.';

  @override
  String get instructionClientsTitle => 'Клієнти';

  @override
  String get instructionClientsDesc =>
      'Список із метою, минулою й наступною сесією. У картці — мета, вага, зріст і закриті нотатки тренера. Ім\'я задається при створенні й потім не змінюється.';

  @override
  String get instructionClientProfileTitle => 'Профіль клієнта';

  @override
  String get instructionClientProfileDesc =>
      'Звідси починається сьогоднішня сесія й відкриваються прогрес, обране й історія за місяцями. Якщо силових днів достатньо, тут же шкала ритму. Видалення клієнта знімає майбутні сесії, але минулі тренування лишаються для звітності.';

  @override
  String get instructionTrainerScheduleTitle => 'Розклад';

  @override
  String get instructionTrainerScheduleDesc =>
      'Календар тренера показує сесії всіх клієнтів: значок «плей» — запланована, галочка — завершена, пісочний годинник — сьогоднішня в роботі. Порожні плани минулих днів прибираються самі.';

  @override
  String get instructionTrainerPlanTitle => 'План сесії';

  @override
  String get instructionTrainerPlanDesc =>
      'На майбутню дату вправи й нотатку можна розставити заздалегідь і зберегти, не завершуючи тренування. Минулі вага й повторення прийдуть сірими підказками. В історію потрапляють лише завершені сесії.';

  @override
  String get instructionTrainerRepeatTitle => 'Повторити минулу';

  @override
  String get instructionTrainerRepeatDesc =>
      'З профілю клієнта або перемикачем при додаванні сесії в календарі. Копіюється склад вправ; вага й повторення приходять сірими підказками, а не готовими підходами.';

  @override
  String get instructionPrintSessionTitle => 'Друк сесії';

  @override
  String get instructionPrintSessionDesc =>
      'У завершеному тренуванні іконка друку в шапці збирає аркуш A4 зі складом і цифрами дня. Далі системне вікно: принтер, PDF або надсилання клієнту.';

  @override
  String get instructionImportAthleteTitle => 'Імпорт історії атлета';

  @override
  String get instructionImportAthleteDesc =>
      'Окрема кнопка в статистиці тренера: файл з особистого режиму заводиться як новий клієнт разом з обраним і мітками груп. Перенесені тренування позначаються як імпортовані, а назви вправ не змішуються з вашими.';

  @override
  String get printSession => 'Друк';

  @override
  String get printSessionEmpty =>
      'Друкувати поки нічого. Запишіть хоча б один підхід.';

  @override
  String get printSessionShareText => 'Тренування IronVibe';

  @override
  String get rhythmPerWeek => 'на тиждень';

  @override
  String get deloadNudgeTitle => 'Тиждень активного відпочинку?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Ви тренуєтесь близько $rate днів на тиждень уже приблизно $weeks тиж. Гарний момент для тижня активного відпочинку: робочі ваги й підходи нижчі на 30–50% або лише кардіо. Це рекомендація, а не медична порада.';
  }

  @override
  String get deloadNudgeLater => 'Не зараз';

  @override
  String get deloadNudgeOk => 'Зрозуміло';

  @override
  String get backupNudgeTitle => 'Зберегти копію?';

  @override
  String get backupNudgeBody =>
      'Дані зберігаються лише на цьому пристрої. Якщо телефон загубиться або станеться збій накопичувача — історія зникне. Поділіться копією зараз або відкладіть на 28 днів.';

  @override
  String get backupNudgeShare => 'Поділитися';

  @override
  String get backupNudgeLater => 'Відкласти';

  @override
  String get rhythmInsightTitle => 'Ритм тренувань';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'Ви тренуєтесь у середньому $rate раза на тиждень.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name тренується в середньому $rate раза на тиждень.';
  }

  @override
  String get rhythmInsightBandLight => 'Спокійний ритм';

  @override
  String get rhythmInsightBandSteady => 'Рівний ритм';

  @override
  String get rhythmInsightBandDense => 'Щільний ритм';

  @override
  String get rhythmInsightBandVeryDense => 'Майже без вихідних';

  @override
  String get rhythmInsightHowTitle => 'Звідки ця цифра';

  @override
  String get rhythmInsightWindow =>
      'Середнє за останні чотири тижні. Рахуються дні з силовими вправами; дні лише з кардіо — ні. Це не ціль і не оцінка, а просто ваш нинішній ритм.';

  @override
  String get rhythmInsightWhatTitle => 'Тиждень активного відпочинку';

  @override
  String get rhythmInsightWhatBody =>
      'Це не пауза, а тиждень напівсили: робочі ваги й число підходів нижчі на 30–50%. Можна й зовсім відкласти силові, залишивши кардіо чи будь-яку іншу активність. М’язи відновлюються швидше, ніж суглоби, зв’язки й сухожилля, — такий тиждень дає їм час наздогнати.';

  @override
  String get rhythmInsightPaceTitle => 'Що це означає';

  @override
  String get rhythmInsightAdviceLight =>
      'Між тренуваннями досить вільних днів, втома не копиться. Спеціально планувати активний відпочинок поки не варто — за такого ритму тіло встигає відновлюватися само.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Рівний ритм, на якому можна працювати роками. Якщо тренування важкі, раз на кілька місяців беріть тиждень активного відпочинку — краще заздалегідь, ніж коли ваги стануть.';

  @override
  String get rhythmInsightAdviceDense =>
      'Тренування йдуть щільно, і втома копиться непомітно. Тиждень активного відпочинку раз на два–три місяці зазвичай тримає прогрес краще, ніж робота без перепочинку.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Майже кожен день під навантаженням. Так можна, якщо сон і харчування встигають. За такого ритму тиждень активного відпочинку приблизно раз на місяць — звичайна профілактика для суглобів і зв’язок, а не слабкість.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Саме на такому ритмі люди тримаються роками.';

  @override
  String get rhythmInsightPraiseDense =>
      'Тренуєтесь часто — такий графік сам собою не складається.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Схоже, ви намацали в організму секретний режим.';

  @override
  String get rhythmInsightRecentLighter =>
      'Нещодавно навантаження вже було нижчим за звичайне — активний відпочинок можна вважати пройденим. Набирайте хід.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Такий ритм тримається вже $weeks тижня.',
      many: 'Такий ритм тримається вже $weeks тижнів.',
      few: 'Такий ритм тримається вже $weeks тижні.',
      one: 'Такий ритм тримається вже $weeks тиждень.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'Це рекомендація, а не медична порада. Якщо почуваєтесь добре — нічого змінювати не потрібно.';
}
