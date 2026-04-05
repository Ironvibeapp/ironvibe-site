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
  String get addSet => '+ ДОДАТИ ПІДХІД';

  @override
  String get addExercise => '+ ДОДАТИ ВПРАВУ';

  @override
  String get finishWorkout => 'ЗАВЕРШИТИ ТРЕНУВАННЯ';

  @override
  String get startWorkout => 'ПОЧАТИ ТРЕНУВАННЯ';

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
  String get exerciseHint => 'Введіть назву вправи';

  @override
  String get deleteFromHistory => 'Видалити з історії?';

  @override
  String get deleteExerciseHint => 'більше не з\'являтиметься у підказках.';

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
  String get addClient => '+ ДОДАТИ КЛІЄНТА';

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
      'У IronVibe навмисно немає готових списків на тисячі вправ і зашитих «програм». Це не застосунок, що вчить тренуватися — для цього є YouTube та живий тренер — він допомагає вести статистику так, як зручно саме вам. Ви самі вводите назви рухів своїми словами, а не обираєте з чужого каталогу. Чим довше користуєтесь, тим природніший інтерфейс: застосунок підлаштовується під вас, а не ви під нього.';

  @override
  String get instructionSectionSetControl => 'Керування підходами';

  @override
  String get instructionSetMinusLabel => 'Мінус';

  @override
  String get instructionSetMinusDesc =>
      'Видаляє останній підхід. Якщо є дані, застосунок запросить підтвердження.';

  @override
  String get instructionSetPlusLabel => 'Плюс';

  @override
  String get instructionSetPlusDesc =>
      'Додає новий ряд підходу в поточній вправі.';

  @override
  String get instructionSetProgressLabel => 'Часова шкала';

  @override
  String get instructionSetProgressDesc =>
      'Відкриває графік прогресу для цієї вправи.';

  @override
  String get instructionSectionProgressChart => 'Графік прогресу';

  @override
  String get instructionProgressChartIntro =>
      'Дві незалежні динаміки за датами: червоний — максимальна вага в одному підході за день; блакитний — максимум повторень в одному підході. Ліворуч вага, праворуч — повтори.';

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
  String get instructionSectionWorkout => 'Тренування';

  @override
  String get instructionAddExerciseTitle => 'Додати вправу';

  @override
  String get instructionAddExerciseBody =>
      'Створює новий блок для іншої вправи.';

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
      'Коли відкрито список підказок під полем назви, натисніть хрестик у рядку, щоб прибрати цю назву з вашої особистої бази.';

  @override
  String get instructionSectionInputs => 'Дані';

  @override
  String get instructionWeightTitle => 'Вага';

  @override
  String get instructionWeightBody => 'Вага снаряда або обладнання.';

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
      'Розділ «Особистий прогрес» допомагає стежити за успіхами в кожній вправі окремо: у таблиці зібрані всі рухи з збереженої історії, зручно порівнювати показники. Рядок пошуку швидко знаходить потрібну назву. Відкрити можна з головного екрана тренування (кнопка під календарем) або з профілю клієнта.';

  @override
  String get instructionSectionSaving => 'Збереження';

  @override
  String get instructionFinishTitle => 'Завершити тренування';

  @override
  String get instructionFinishBody =>
      'Зберігає всю сесію в історію. Поки ви не натиснули цю кнопку, дані не фіксуються.';

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
      'Завершені тренування в календарі та зведена статистика через іконку графіка на панелях застосунку.';

  @override
  String get instructionNavImportExportTitle => 'Імпорт / експорт';

  @override
  String get instructionNavImportExportDesc =>
      'Резервна копія чи перенесення через експорт і імпорт JSON у вікні статистики.';
}
