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
  String get instructionPhilosophy =>
      'У IronVibe навмисно немає готових списків на тисячі вправ і зашитих «програм». Це не застосунок, що вчить тренуватися — для цього є YouTube та живий тренер — він допомагає вести статистику так, як зручно саме вам. Ви самі вводите назви рухів. За бажанням можна позначити м’язову групу — тоді застосунок збере швидке тренування на все тіло з ваших же вправ. Чим довше користуєтесь, тим природніший інтерфейс: застосунок підлаштовується під вас, а не ви під нього.';

  @override
  String get instructionSectionSetControl => 'Керування підходами';

  @override
  String get instructionSetMinusLabel => 'Мінус';

  @override
  String get instructionSetMinusDesc =>
      'Видаляє останній підхід. Якщо в рядку вже є вага, повтори або запас — спершу запитає підтвердження. Порожній рядок прибирає одразу. Якщо підхід лишився один: у поточному тренуванні рядок очищається, у збереженій історії видаляється вся вправа.';

  @override
  String get instructionSetPlusLabel => 'Плюс';

  @override
  String get instructionSetPlusDesc =>
      'Додає порожній рядок нового підходу в поточній вправі.';

  @override
  String get instructionSetProgressLabel => 'Часова шкала';

  @override
  String get instructionSetProgressDesc =>
      'Відкриває графік прогресу для цієї вправи.';

  @override
  String get instructionSectionProgressChart => 'Графік прогресу';

  @override
  String get instructionProgressChartIntro =>
      'Три незалежні динаміки за датами: червоний — максимальна вага в одному підході за день; блакитний — максимум повторень в одному підході; жовтий — обсяг вправи (сума «вага × повторення» за день). Ліворуч вага, праворуч — повтори; жовта лінія нормалізована для тренду.';

  @override
  String get instructionProgressLineWeightLabel => 'Вага';

  @override
  String get instructionProgressLineWeightDesc =>
      'Червона лінія — найбільша вага в одному підході за кожен календарний день.';

  @override
  String get instructionProgressLineRepsLabel => 'Повторення';

  @override
  String get instructionProgressLineRepsDesc =>
      'Блакитна лінія — найбільше повторень за один підхід у цей день (не обов’язково з макс. вагою).';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Жовта лінія — денний обсяг (тоннаж): сума «вага × повторення» для підходів, де заповнені обидва значення.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Під час активного тренування кнопка графіка під підходами може підсвічуватися тими ж кольорами, що й лінії: червоний — якщо ви перевершили попередній рекорд ваги в одному підході; жовтий — якщо сумарний обсяг вправи більший за найкращий за минулі тренування; блакитний — якщо вправа без ваги й сума повторень за всіма підходами більша за попередній максимум. Якщо виконується кілька умов, пріоритет: червоний, потім жовтий, потім блакитний. Лише під час поточного введення тренування, у збереженій історії не показується.';

  @override
  String get instructionSectionWorkout => 'Тренування';

  @override
  String get instructionAddExerciseTitle => 'Додати вправу';

  @override
  String get instructionAddExerciseBody =>
      'Додає новий блок. Спочатку вкажіть назву поточної вправи — якщо поле порожнє, застосунок нагадає.';

  @override
  String get instructionSectionExerciseNameTools => 'Назва вправи';

  @override
  String get instructionRenameExerciseTitle =>
      'Довге натискання — перейменувати';

  @override
  String get instructionRenameExerciseDesc =>
      'Утримуйте назву під час введення, на підказці зі списку або на заголовку збереженого тренування в історії — назва оновиться скрізь.';

  @override
  String get instructionRemoveFromBankTitle => 'Прибрати зі списку';

  @override
  String get instructionRemoveFromBankDesc =>
      'Коли відкрито список підказок під полем назви, натисніть хрестик у рядку — або червоний хрестик в особистому прогресі, — щоб прибрати цю назву з підказок і з таблиці прогресу. Збережені тренування не змінюються.';

  @override
  String get instructionSectionInputs => 'Дані';

  @override
  String get instructionWeightTitle => 'Вага';

  @override
  String get instructionWeightBody =>
      'Вага снаряда або обладнання. Вводьте число в кг або lb — як вам зручно. Застосунок одиниці не перераховує.';

  @override
  String get instructionRepsTitle => 'Повторення';

  @override
  String get instructionRepsBody =>
      'Скільки разів ви виконали рух за один підхід.';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody =>
      'Скільки повторень ви ще могли б зробити до відмови. Допомагає відстежувати інтенсивність.';

  @override
  String get instructionOneRmTitle => '1ПМ (одне повторення, 1RM)';

  @override
  String get instructionOneRmDesc =>
      'Розрахунковий максимум на одне повторення за поточною вагою та кількістю повторень. Ключовий показник сили для прогресу та підбору робочих ваг.';

  @override
  String get instructionExerciseVolumeTitle => 'Об\'єм вправи (сума)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Під рядками підходів біля кнопки прогресу: сума вага × повторення по всіх підходах з обома значеннями. Оновлюється під час введення.';

  @override
  String get instructionSectionPersonalProgress => 'Особистий прогрес';

  @override
  String get instructionPersonalProgressIntro =>
      'Одна таблиця з усіх рухів зі збережених тренувань: найкращий підхід, оцінка 1ПМ і максимальний обсяг. Пошук одразу знаходить назву. Зірка додає вправу в обране; маленька мітка під іменем задає м’язову групу; червоний хрестик прибирає ім’я з підказок і з цієї таблиці (збережені тренування не змінюються). Відкрити можна з меню тренувань або з профілю клієнта.';

  @override
  String get instructionSectionSaving => 'Збереження';

  @override
  String get instructionFinishTitle => 'Завершити тренування';

  @override
  String get instructionFinishBody =>
      'Підтверджує й записує тренування в історію. Якщо вийти раніше, можна зберегти, видалити чернетку або лишитися. Якщо застосунок перервався, чернетка зберігається сама.';

  @override
  String get instructionSectionCardio => 'Кардіо та інтенсивність';

  @override
  String get instructionCardioTitle => 'Кардіо';

  @override
  String get instructionCardioBody =>
      'Відстежує час і інтенсивність кардіо-блоку; відстань у застосунку не вводиться. Допомагає тримати темп і контролювати зусилля.';

  @override
  String get instructionIntensityTitle => 'Інтенсивність';

  @override
  String get instructionIntensityBody =>
      'Використовуйте шкалу зусилля (RPE), щоб оцінити, наскільки важким було тренування. Це ключ до прогресу без перетренованості.';

  @override
  String get instructionSectionStopwatch => 'Секундомір (ваш помічник)';

  @override
  String get instructionStopwatchWhyTitle => 'Навіщо він потрібен?';

  @override
  String get instructionStopwatchWhyBody =>
      'Щоб контролювати відпочинок між підходами. Короткий відпочинок - вища щільність, довгий - більше сил на важку вагу.';

  @override
  String get instructionStopwatchHowTitle => 'Як він працює?';

  @override
  String get instructionStopwatchHowBody =>
      'По центру — час і кнопки «Пуск/Пауза» та «Скидання». Зліва й справа — швидкі пресети (описані нижче). У звичайному режимі секундомера час накопичується з сотими долями секунди. Таймер закріплений у шапці під час прокрутки.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Зліва: інтервали';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 секунд роботи й 60 секунд відпочинку. 4/4 — по 4 хвилини роботи й відпочинку за цикл. 20/10 — табата: 20 секунд навантаження, 10 секунд паузи. Після вибору таймер циклічно чергує фази, доки не поставите на паузу чи не скинете. Червонуватий відтінок — робота, блакитний — відпочинок.';

  @override
  String get instructionStopwatchRestTitle => 'Справа: відпочинок';

  @override
  String get instructionStopwatchRestBody =>
      'Кнопки +1m, +2m і +5m задають або подовжують зворотний відлік у хвилинах. Якщо йшов інтервальний цикл, він переключається на такий відлік. Якщо відлік уже триває — хвилини додаються до залишку. Зручно між підходами.';

  @override
  String get instructionStopwatchProgressTitle => 'Смужка прогресу';

  @override
  String get instructionStopwatchProgressBody =>
      'У режимах відліку та інтервалів під часом показується смужка: скільки залишилось від поточної фази.';

  @override
  String get instructionStopwatchSoundsTitle => 'Звук і вібрація';

  @override
  String get instructionStopwatchSoundsBody =>
      'За 3, 2 і 1 секунду до кінця фази — короткий звук у застосунку й легка вібрація. Зміна фази або нуль на лічильнику — помітніший сигнал. Мінімальні файли в застосунку; без мікрофона й дозволу на сповіщення; гучність залежить від пристрою.';

  @override
  String get instructionSectionNavHistory => 'Історія та дані';

  @override
  String get instructionNavHistoryTitle => 'Історія / статистика';

  @override
  String get instructionNavHistoryDesc =>
      'У календарі/історії кожне тренування показує загальний тоннаж. Обсяг тренування — один з найкращих індикаторів гіпертрофії: чим більше якісного обсягу, тим більше м’язів ви будуєте.';

  @override
  String get instructionNavImportExportTitle => 'Імпорт / експорт';

  @override
  String get instructionNavImportExportDesc =>
      'Резервна копія чи перенесення через експорт і імпорт JSON у вікні статистики. До копії входять історія, список вправ, обране та мітки м’язових груп. Тренерська копія окрема від особистої історії.';

  @override
  String get instructionSectionHome => 'Головний екран';

  @override
  String get instructionThemeTitle => 'Тема';

  @override
  String get instructionThemeDesc =>
      'Перемикач сонце / місяць на головному екрані змінює світлу й темну тему. Вибір запам’ятовується.';

  @override
  String get instructionTrainSelfTitle => 'Треную себе';

  @override
  String get instructionTrainSelfDesc =>
      'Ваші тренування, календар, особистий прогрес, обране, шкала ритму (як часто ви тренуєтесь) та швидке тренування на все тіло з вправ із мітками груп.';

  @override
  String get instructionTrainOthersTitle => 'Треную інших';

  @override
  String get instructionTrainOthersDesc =>
      'Режим тренера: клієнти, розклад і окрема історія на кожну людину. У кожного клієнта свої таблиця прогресу й обране.';

  @override
  String get instructionSectionAthleteMenu => 'Ваші тренування';

  @override
  String get instructionStartWorkoutTitle => 'Почати тренування';

  @override
  String get instructionStartWorkoutDesc =>
      'Відкриває порожню сесію — минуле тренування не копіює. Додавайте вправи, записуйте підходи й завершіть, щоб зберегти.';

  @override
  String get instructionQuickWorkoutTitle => 'Швидке тренування';

  @override
  String get instructionQuickWorkoutDesc =>
      'Збирає тренування на все тіло з 4 вправ: груди, спина, одна половина ніг (перед або зад стегна — не обидві в один день) і одна на плечі, руки або кор — яка група довше не тренувалась. Спочатку обрані. Минулі вага і повтори показані сірим як мінімум, який треба подолати — кожен підхід ви вводите самі.';

  @override
  String get instructionCalendarMenuTitle => 'Календар тренувань';

  @override
  String get instructionCalendarMenuDesc =>
      'Видно, в які дні ви тренувались; можна відкрити збережену сесію або додати тренування на вибрану дату й час — зокрема в минулі дні.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Таблиця найкращих підходів, оцінки 1ПМ і максимального обсягу. Тут зірка обраного та мітка м’язової групи.';

  @override
  String get instructionFavoritesMenuTitle => 'Обрані вправи';

  @override
  String get instructionFavoritesMenuDesc =>
      'Список, позначений зіркою. Позначте потрібні й натисніть «Зібрати тренування» — сесія почнеться в цьому порядку. Минулі вага й повторення показані сірим як мінімум, який треба подолати.';

  @override
  String get instructionSectionRhythm => 'Ритм тренувань';

  @override
  String get instructionRhythmIntro =>
      'Після кількох силових тренувань угорі екрана тренувань з’являється шкала. Вона показує, скільки днів на тиждень ви тренувались у середньому за останні чотири тижні. Дні лише з кардіо не рахуються. Це знімок щільності, а не ціль, яку додаток вимагає досягти.';

  @override
  String get instructionRhythmGaugeTitle => 'Днів на тиждень';

  @override
  String get instructionRhythmGaugeDesc =>
      'Дуга заповнюється від 1 до 6 днів на тиждень. Холодний сталевий відтінок — спокійніший ритм, теплі тони — вища щільність. Шкала з’являється, коли в цьому чотиритижневому вікні є щонайменше три силові дні.';

  @override
  String get instructionRhythmDeloadTitle => 'Нагадування про легший тиждень';

  @override
  String get instructionRhythmDeloadDesc =>
      'Якщо ви тренуєтесь приблизно два з половиною дні на тиждень або частіше кілька тижнів поспіль без легшого тижня, додаток може запропонувати знизити тоннаж і повторення приблизно на 30% на один тиждень. Що більше днів на тиждень, то раніше з’явиться нагадування. Це нагадування, не припис. Не частіше одного разу на тиждень.';

  @override
  String get instructionSectionFavorites => 'Обране';

  @override
  String get instructionFavoriteStarTitle => 'Зірка';

  @override
  String get instructionFavoriteStarDesc =>
      'В «Особистому прогресі» натисніть зірку біля вправи, щоб додати або прибрати її з обраного. Обрані лишаються вгорі таблиці.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Зібрати тренування';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'На екрані обраного позначте вправи. Кнопка з’являється, коли вибрано хоча б одну. Минулі вага й повторення показані сірим як мінімум, який треба подолати — кожен підхід ви вводите самі. Для клієнта та сама дія відкриває сесію цієї людини.';

  @override
  String get instructionSectionMuscleGroups =>
      'М’язові групи та швидке тренування';

  @override
  String get instructionMuscleGroupsIntro =>
      'Групи — необов’язкові мітки до ваших назв вправ. Це не каталог: вони потрібні лише швидкому тренуванню, щоб зібрати збалансований мікс на все тіло. Вісім груп: груди, спина, плечі, корпус, передня поверхня стегна, задня поверхня стегна, згинання рук, розгинання рук.';

  @override
  String get instructionMuscleGroupTagTitle => 'Як позначити';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Коли ви вперше вводите нову назву, застосунок питає групу. Можна натиснути «Пізніше» або «Не для швидкого тренування», якщо рух не має потрапляти в мікс на все тіло. Мітку під іменем в прогресі чи обраному можна змінити або зняти.';

  @override
  String get instructionQuickWorkoutHowTitle => 'Як збирається швидка сесія';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Чотири слоти: груди, спина, одна половина ніг, потім плечі/руки/кор за давністю. У попередньому перегляді слот можна замінити іншою вправою тієї ж групи. Якщо мало — додайте вправи самі.';

  @override
  String get instructionStrengthCardioTitle => 'Сила / кардіо';

  @override
  String get instructionStrengthCardioDesc =>
      'Перемикач угорі сесії. Сила: вага, повторення, запас (RIR). Кардіо: лише час і інтенсивність — поля дистанції немає.';

  @override
  String get instructionPreviousHintsTitle => 'Сірі цифри минулої сесії';

  @override
  String get instructionPreviousHintsDesc =>
      'Коли тренер обирає вправу в сесії клієнта, швидкому тренуванні чи збірці з обраного, минулі вага й повторення показані сірим — це мінімум, який треба подолати, а не вже записаний підхід. В історію потрапляють лише числа, які ви ввели самі.';

  @override
  String get instructionRemoveExerciseTitle => 'Прибрати з цього тренування';

  @override
  String get instructionRemoveExerciseDesc =>
      'Видаляє блок лише з поточної сесії. Збережена історія не змінюється, поки ви не завершите тренування.';

  @override
  String get instructionReassignExerciseTitle => 'Змінити вправу в історії';

  @override
  String get instructionReassignExerciseDesc =>
      'У збереженому тренуванні блок можна перепризначити на іншу назву. Змінюється лише ця сесія; графіки підуть за новою назвою. Підходи лишаються як були.';

  @override
  String get instructionAutoSaveTitle => 'Перерване тренування';

  @override
  String get instructionAutoSaveDesc =>
      'Якщо застосунок закрився посеред сесії, він запропонує продовжити з того ж місця або видалити незбережену чернетку.';

  @override
  String get instructionSectionCalendar => 'Календар';

  @override
  String get instructionCalendarAddTitle => 'Додати на дату';

  @override
  String get instructionCalendarAddDesc =>
      'Виберіть день і додайте тренування на вибраний час. Зручно, якщо треба внести пропущену сесію.';

  @override
  String get instructionSectionTrainer => 'Режим тренера';

  @override
  String get instructionTrainerIntro =>
      '«Треную інших» — для тренерів. Додавайте клієнтів, ставте сесії, плануйте вправи заздалегідь і ведіть тренування окремо по кожній людині. Повтор минулої сесії — за бажанням. Експорт та імпорт тренерських даних відокремлені від особистої історії. Видалення клієнта знімає майбутні сесії, але минулі тренування лишаються для звітності.';

  @override
  String get instructionClientsTitle => 'Клієнти';

  @override
  String get instructionClientsDesc =>
      'Додавання, редагування й видалення клієнтів. У списку видно минулу й наступну сесії. У профілі: ціль, вага, зріст і закриті нотатки тренера.';

  @override
  String get instructionClientProfileTitle => 'Профіль клієнта';

  @override
  String get instructionClientProfileDesc =>
      'З профілю починається сьогоднішня порожня жива сесія. Сірі цифри минулого разу з’являються лише після вибору вправи. В історії — лише завершені тренування. Плануйте інші дати в календарі. Прогрес і обране — на тому ж екрані. Незбережені правки профілю запитують підтвердження перед виходом.';

  @override
  String get instructionTrainerPlanTitle => 'Запланувати сесію';

  @override
  String get instructionTrainerPlanDesc =>
      'План лише з календаря тренера: оберіть клієнта й дату, потім вправи. Минулі вага й повторення — сірі підказки. Запланована сесія зі значком «плей»: натисніть, щоб почати (сьогодні) або видалити. В історію потрапляють лише завершені. План із минулою датою видаляється.';

  @override
  String get instructionTrainerRepeatTitle => 'Повторити минуле тренування';

  @override
  String get instructionTrainerRepeatDesc =>
      'За бажанням. З профілю клієнта або перемикачем під час додавання сесії в календарі. Копіює вправи минулої сесії в сьогоднішнє живе тренування або в новий план; минулі вага й повторення — сірі підказки, а не готові підходи.';

  @override
  String get rhythmPerWeek => 'на тиждень';

  @override
  String get deloadNudgeTitle => 'Легший тиждень?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Ви тренуєтесь близько $rate днів на тиждень уже приблизно $weeks тиж. Це нагадування, не припис. За такого ритму часто варто зменшити тоннаж і повторення приблизно на 30% на тиждень.';
  }

  @override
  String get deloadNudgeLater => 'Не зараз';

  @override
  String get deloadNudgeOk => 'Зрозуміло';

  @override
  String get instructionHubManifest =>
      'Без вбудованого каталогу й готових програм. Ви самі називаєте вправи — застосунок веде статистику так, як вам зручно.';

  @override
  String get instructionChapterStartTitle => 'З чого почати';

  @override
  String get instructionChapterStartBlurb =>
      'Головний екран, як ви тренуєтесь і чому застосунок не вчить вас тренуватися.';

  @override
  String get instructionChapterToolsTitle => 'Інструменти';

  @override
  String get instructionChapterToolsBlurb =>
      'Ритм, обране, групи м\'язів і швидке тренування.';

  @override
  String get instructionChapterSessionTitle => 'На тренуванні';

  @override
  String get instructionChapterSessionBlurb =>
      'Підходи, поля, кардіо, збереження й секундомір.';

  @override
  String get instructionChapterProgressTitle => 'Прогрес і дані';

  @override
  String get instructionChapterProgressBlurb =>
      'Особисті рекорди, графік, календар, історія й резервна копія.';

  @override
  String get instructionChapterCoachTitle => 'Режим тренера';

  @override
  String get instructionChapterCoachBlurb =>
      'Клієнти, профілі, план сесії та повтор тренування.';

  @override
  String get instructionSearchHint => 'Пошук в інструкції';

  @override
  String get instructionSearchEmpty => 'Нічого не знайдено.';
}
