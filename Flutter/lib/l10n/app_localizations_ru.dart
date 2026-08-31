// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'ВАЙБ ТВОИХ ТРЕНИРОВОК';

  @override
  String get ok => 'ОК';

  @override
  String get cancel => 'Отмена';

  @override
  String get renameExerciseTitle => 'Переименовать упражнение';

  @override
  String get renameExerciseEmpty => 'Название не может быть пустым';

  @override
  String get reassignHistoryExerciseTitle => 'Сменить упражнение';

  @override
  String get reassignHistoryExerciseBody =>
      'Меняется только эта тренировка. Подходы сохраняются; график прогресса учитывает новое название упражнения.';

  @override
  String get delete => 'Удалить';

  @override
  String get yesDelete => 'Да, удалить';

  @override
  String get close => 'Закрыть';

  @override
  String get save => 'Сохранить';

  @override
  String get add => 'Добавить';

  @override
  String get trainOthers => 'ТРЕНИРУЮ ДРУГИХ';

  @override
  String get trainSelf => 'ТРЕНИРУЮСЬ САМ';

  @override
  String get statistics => 'СТАТИСТИКА';

  @override
  String get exportHistory => 'ЭКСПОРТ ИСТОРИИ ТРЕНИРОВОК';

  @override
  String get historyEmpty => 'История пуста, экспортировать пока нечего.';

  @override
  String get exportError => 'Ошибка экспорта:';

  @override
  String get exportJson => 'ЭКСПОРТ JSON';

  @override
  String get importData => 'ИМПОРТ';

  @override
  String get importSuccess => 'Данные успешно импортированы';

  @override
  String get importError => 'Ошибка импорта:';

  @override
  String get importNewerVersion => 'Файл создан новой версией приложения';

  @override
  String get importFileAccessError => 'Ошибка доступа к файлу';

  @override
  String get importInvalidJson => 'Некорректный формат JSON';

  @override
  String get importInvalidBackupFile =>
      'Ошибка: выбран некорректный файл резервной копии';

  @override
  String get shareText => 'История тренировок IronVibe';

  @override
  String get monthStats => 'ЗА МЕСЯЦ';

  @override
  String get yearStats => 'ЗА ГОД';

  @override
  String get allTimeStats => 'ЗА ВСЕ ВРЕМЯ';

  @override
  String get weight => 'Вес';

  @override
  String get reps => 'Повторени⁠я';

  @override
  String get rir => 'RIR';

  @override
  String get oneRm => '1ПМ';

  @override
  String get approxOneRm => '≈ 1ПМ:';

  @override
  String get kg => 'кг';

  @override
  String get volumeShort => 'ОБЪЁМ';

  @override
  String get addSet => 'ДОБАВИТЬ ПОДХОД';

  @override
  String get addExercise => 'ДОБАВИТЬ УПРАЖНЕНИЕ';

  @override
  String get finishWorkout => 'ЗАВЕРШИТЬ ТРЕНИРОВКУ';

  @override
  String get finishWorkoutConfirmTitle => 'Завершить тренировку?';

  @override
  String get finishWorkoutConfirmBody => 'Тренировка будет сохранена.';

  @override
  String get finishWorkoutConfirmAction => 'Завершить';

  @override
  String get workoutCompleteTitle => 'Тренировка сохранена';

  @override
  String get startWorkout => 'НАЧАТЬ ТРЕНИРОВКУ';

  @override
  String get quickWorkout => 'БЫСТРАЯ ТРЕНИРОВКА';

  @override
  String get quickWorkoutFullBody => 'ВСЁ ТЕЛО';

  @override
  String get quickWorkoutInsufficientTitle => 'Недостаточно данных';

  @override
  String get quickWorkoutInsufficientBody =>
      'Для быстрой тренировки нужны упражнения на грудь, спину, одну группу ног (перед или зад бедра) и одно на плечи, руки или кор. Отметьте группы в личном прогрессе — или просто логируйте: приложение спросит при вводе нового упражнения.';

  @override
  String get quickWorkoutOpenProgress => 'ОТКРЫТЬ ЛИЧНЫЙ ПРОГРЕСС';

  @override
  String get quickWorkoutPreviewTitle => 'БЫСТРАЯ ТРЕНИРОВКА · ВСЁ ТЕЛО';

  @override
  String get quickWorkoutStart => 'НАЧАТЬ';

  @override
  String get quickWorkoutSwap => 'Заменить';

  @override
  String get quickWorkoutNoAlternatives =>
      'Других упражнений в этой группе нет';

  @override
  String get muscleGroupPromptTitle => 'Группа мышц';

  @override
  String get muscleGroupPromptBody =>
      'Нужно для быстрой тренировки на всё тело.';

  @override
  String get muscleGroupLater => 'Позже';

  @override
  String get muscleGroupClear => 'Сбросить';

  @override
  String get muscleGroupSkip => 'Не для быстрой тренировки';

  @override
  String get muscleGroupChest => 'Грудь';

  @override
  String get muscleGroupBack => 'Спина';

  @override
  String get muscleGroupShoulders => 'Плечи';

  @override
  String get muscleGroupCore => 'Кор';

  @override
  String get muscleGroupQuads => 'Переднее бедро';

  @override
  String get muscleGroupHamstrings => 'Заднее бедро';

  @override
  String get muscleGroupArmFlex => 'Сгибание рук';

  @override
  String get muscleGroupArmExt => 'Разгибание рук';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'КАЛЕНДАРЬ ТРЕНИРОВОК';

  @override
  String get personalProgress => 'ЛИЧНЫЙ ПРОГРЕСС';

  @override
  String get personalProgressSearchHint => 'Поиск упражнений';

  @override
  String get personalProgressBestSet => 'Лучший сет';

  @override
  String get personalProgressMaxVolume => 'Макс. объём';

  @override
  String get personalProgressEmpty => 'В тренировках пока нет упражнений';

  @override
  String get favoriteExercises => 'ЛЮБИМЫЕ УПРАЖНЕНИЯ';

  @override
  String get favoriteExercisesEmpty => 'Пока нет любимых упражнений';

  @override
  String get buildWorkoutFromFavorites => 'СОБРАТЬ ТРЕНИРОВКУ';

  @override
  String get exerciseHint => 'Введите название упражнения';

  @override
  String get deleteFromHistory => 'Удалить из истории?';

  @override
  String get deleteExerciseHint =>
      'больше не будет в подсказках и в личном прогрессе.';

  @override
  String get exerciseDeleted => 'удалено';

  @override
  String get deleteWorkoutTitle => 'УДАЛИТЬ';

  @override
  String get deleteWorkoutMsg =>
      'Удалить эту тренировку? История прогресса будет утеряна.';

  @override
  String get removeSetWithDataConfirm =>
      'Удалить подход с данными? Это действие нельзя отменить.';

  @override
  String get removeExerciseFromWorkout => 'Удалить упражнение';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'Удалить это упражнение из тренировки? Это действие нельзя отменить.';

  @override
  String get deleteClientTitle => 'УДАЛИТЬ КЛИЕНТА';

  @override
  String get deleteClientMsg =>
      'Удалить этого клиента? Все его будущие тренировки будут удалены.';

  @override
  String get noClientsTitle => 'НЕТ КЛИЕНТОВ';

  @override
  String get noClientsMsg => 'Сначала добавьте клиентов в меню «Клиенты».';

  @override
  String get newClient => 'НОВЫЙ КЛИЕНТ';

  @override
  String get editClient => 'РЕДАКТИРОВАТЬ';

  @override
  String get clientName => 'Имя';

  @override
  String get clientGoal => 'Цель';

  @override
  String get clientWeight => 'Вес';

  @override
  String get clientHeight => 'Рост';

  @override
  String get clientNotes => 'Заметки';

  @override
  String get saveClientChanges => 'СОХРАНИТЬ ИЗМЕНЕНИЯ';

  @override
  String get clientProfileUnsavedTitle => 'Несохранённые изменения';

  @override
  String get clientProfileUnsavedMessage =>
      'Есть несохранённые изменения. Сохранить перед выходом?';

  @override
  String get clientProfileStay => 'Остаться';

  @override
  String get clientProfileDiscard => 'Выйти без сохранения';

  @override
  String get clientProfileSaveAndLeave => 'Сохранить и выйти';

  @override
  String get workoutRecoveryTitle => 'Тренировка прервана';

  @override
  String get workoutRecoveryMessage =>
      'Предыдущая тренировка завершилась некорректно. Продолжить с сохранённых данных или удалить черновик.';

  @override
  String get workoutRecoveryContinue => 'Продолжить тренировку';

  @override
  String get workoutRecoveryDelete => 'Удалить тренировку';

  @override
  String get workoutRecoverySessionMissing =>
      'Запланированная тренировка клиента была удалена. Черновик очищен.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Сначала заполните текущее упражнение.';

  @override
  String get clientWorkoutHistoryEmpty => 'История пуста';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Упражнение №$n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Упражнение №$n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return '№$n';
  }

  @override
  String get clientProfileSectionGoal => 'ЦЕЛЬ';

  @override
  String get clientProfileSectionAnthropometry => 'АНТРОПОМЕТРИЯ';

  @override
  String get clientProfileSectionTrainerNotes => 'ЗАМЕТКИ ТРЕНЕРА';

  @override
  String get clientProfileSectionWorkoutHistory => 'ИСТОРИЯ ТРЕНИРОВОК';

  @override
  String get clientTrainerNotesHint => 'Травмы, особенности, план…';

  @override
  String get trainerSessionDefaultTitle => 'Тренировка';

  @override
  String get durationMinutesShort => 'мин';

  @override
  String get addTraining => 'ДОБАВИТЬ ТРЕНИРОВКУ';

  @override
  String get repeatLastWorkout => 'Повторить прошлую тренировку';

  @override
  String get repeatLastUnavailable =>
      'У этого клиента ещё нет тренировки, которую можно повторить.';

  @override
  String get editPlan => 'Изменить план';

  @override
  String get trainerSessionEmpty => 'Ещё не запланирована';

  @override
  String trainerSessionPlanned(int n) {
    return 'План: $n';
  }

  @override
  String get trainerClientsEmpty =>
      'Пока нет клиентов. Добавьте кого-нибудь, чтобы ставить тренировки.';

  @override
  String get clientNeverTrained => 'Тренировок пока нет';

  @override
  String get clientNoUpcoming => 'Нет ближайшей сессии';

  @override
  String clientLastSession(String when) {
    return 'Прошлая: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Следующая: $when';
  }

  @override
  String get clientSessionToday => 'сегодня';

  @override
  String get clientSessionYesterday => 'вчера';

  @override
  String get clientSessionTomorrow => 'завтра';

  @override
  String clientSessionDaysAgo(int n) {
    return '$n дн. назад';
  }

  @override
  String clientSessionInDays(int n) {
    return 'через $n дн.';
  }

  @override
  String get clientProfileDetails => 'Профиль';

  @override
  String get addSessionPickClient => 'Выберите клиента';

  @override
  String get clientLabel => 'Клиент';

  @override
  String get deleteClientBtn => 'УДАЛИТЬ КЛИЕНТА';

  @override
  String get clientsMenu => 'КЛИЕНТЫ';

  @override
  String get dateHeader => 'Дата';

  @override
  String get clientHeader => 'Клиент';

  @override
  String get exerciseHeader => 'Упражнение';

  @override
  String get typeHeader => 'Тип';

  @override
  String get strengthType => 'Силовая';

  @override
  String get cardioType => 'Кардио';

  @override
  String get weightHeader => 'Вес';

  @override
  String get weightUnitsChoiceShort => 'кг / lb';

  @override
  String get progressChartWeightLegend => 'Вес — кг / lb (как вносите)';

  @override
  String get progressChartVolumeLegend => 'Объём (тоннаж)';

  @override
  String get repsHeader => 'Повторени⁠я';

  @override
  String get rirHeader => 'Запас';

  @override
  String get durationHeader => 'Время (мин)';

  @override
  String get intensityHeader => 'Интенсивность';

  @override
  String get setHeader => 'Подход';

  @override
  String get strength => 'Силовая';

  @override
  String get cardio => 'Кардио';

  @override
  String get timeMin => 'Время (мин)';

  @override
  String get intensity => 'Интенсивность';

  @override
  String get reserve => 'Запас';

  @override
  String get sets => 'Подходы';

  @override
  String get time => 'Время';

  @override
  String get rest => 'Отдых';

  @override
  String get settings => 'Настройки';

  @override
  String get max => 'Максимум';

  @override
  String get totalVolume => 'Общий объём';

  @override
  String get chart => 'График';

  @override
  String get progress => 'Прогресс';

  @override
  String get dayMonday => 'Понедельник';

  @override
  String get dayTuesday => 'Вторник';

  @override
  String get dayWednesday => 'Среда';

  @override
  String get dayThursday => 'Четверг';

  @override
  String get dayFriday => 'Пятница';

  @override
  String get daySaturday => 'Суббота';

  @override
  String get daySunday => 'Воскресенье';

  @override
  String get greetingHi => 'Привет';

  @override
  String get greetingMorning => 'Доброе утро';

  @override
  String get greetingAfternoon => 'Добрый день';

  @override
  String get greetingEvening => 'Добрый вечер';

  @override
  String get monthJanuary => 'Январь';

  @override
  String get monthFebruary => 'Февраль';

  @override
  String get monthMarch => 'Март';

  @override
  String get monthApril => 'Апрель';

  @override
  String get monthMay => 'Май';

  @override
  String get monthJune => 'Июнь';

  @override
  String get monthJuly => 'Июль';

  @override
  String get monthAugust => 'Август';

  @override
  String get monthSeptember => 'Сентябрь';

  @override
  String get monthOctober => 'Октябрь';

  @override
  String get monthNovember => 'Ноябрь';

  @override
  String get monthDecember => 'Декабрь';

  @override
  String get exerciseBenchPress => 'Жим лёжа';

  @override
  String get exerciseSquat => 'Приседания';

  @override
  String get exerciseRow => 'Тяга';

  @override
  String get exerciseDeadlift => 'Становая тяга';

  @override
  String get exerciseOverheadPress => 'Жим стоя';

  @override
  String get exercisePullUp => 'Подтягивания';

  @override
  String get exerciseLunges => 'Выпады';

  @override
  String get exercisePlank => 'Планка';

  @override
  String get saveWorkout => 'СОХРАНИТЬ ТРЕНИРОВКУ';

  @override
  String get deleteWorkout => 'УДАЛИТЬ ТРЕНИРОВКУ';

  @override
  String get deleteTraining => 'Удалить тренировку';

  @override
  String get deleteTrainingQuestion => 'Удалить эту тренировку из расписания?';

  @override
  String get addSetButton => 'Добавить подход';

  @override
  String get progressButton => 'Прогресс';

  @override
  String get filterMonth => 'Месяц';

  @override
  String get filterYear => 'Год';

  @override
  String get filterAllTime => 'Всё время';

  @override
  String get noteLabel => 'Заметка';

  @override
  String get addClient => 'ДОБАВИТЬ КЛИЕНТА';

  @override
  String get workoutsToday => 'ТРЕНИРОВКИ СЕГОДНЯ';

  @override
  String get workoutNumberPrefix => 'Тренировка №';

  @override
  String get noEntries => 'Нет записей';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Политика конфиденциальности';

  @override
  String get instructionButton => 'ИНСТРУКЦИЯ';

  @override
  String get instructionTitle => 'Как всё устроено';

  @override
  String get instructionPhilosophy =>
      'В IronVibe намеренно нет готовых списков из тысяч упражнений и зашитых «программ». Приложение не учит тренироваться — для этого есть YouTube и живой тренер — оно помогает вести статистику так, как удобно именно вам. Вы сами вводите названия движений своими словами. При желании можно пометить мышечную группу — тогда приложение соберёт быструю тренировку на всё тело из ваших же упражнений. Чем дольше пользуетесь, тем естественнее становится интерфейс: приложение подстраивается под ваши привычки, а не вы под него.';

  @override
  String get instructionSectionSetControl => 'Управление подходом';

  @override
  String get instructionSetMinusLabel => 'Минус';

  @override
  String get instructionSetMinusDesc =>
      'Удаляет последний подход. Если в строке уже есть вес, повторы или запас — сначала спросит подтверждение. Пустую строку убирает сразу. Если подход остался один: в текущей тренировке строка очищается, в сохранённой истории удаляется всё упражнение.';

  @override
  String get instructionSetPlusLabel => 'Плюс';

  @override
  String get instructionSetPlusDesc =>
      'Добавляет пустую строку нового подхода в текущем упражнении.';

  @override
  String get instructionSetProgressLabel => 'Временная шкала';

  @override
  String get instructionSetProgressDesc =>
      'Открывает график прогресса по этому упражнению.';

  @override
  String get instructionSectionProgressChart => 'График прогресса';

  @override
  String get instructionProgressChartIntro =>
      'Три независимые кривые по датам: красный — максимальный вес в одном подходе за день; голубой — максимум повторений в одном подходе; жёлтый — объём упражнения (сумма «вес × повторы» за день). Слева шкала веса, справа — повторов; жёлтая линия нормализована для сравнения тренда.';

  @override
  String get instructionProgressLineWeightLabel => 'Вес';

  @override
  String get instructionProgressLineWeightDesc =>
      'Красная линия — наибольший вес в одном подходе за каждый календарный день.';

  @override
  String get instructionProgressLineRepsLabel => 'Повторы';

  @override
  String get instructionProgressLineRepsDesc =>
      'Голубая линия — больше всего повторений за один подход в этот день (не обязательно с макс. весом).';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Жёлтая линия — дневной объём (тоннаж): сумма «вес × повторы» по подходам, где заполнены оба поля.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Во время активной тренировки кнопка графика под подходами может подсвечиваться теми же цветами, что и линии: красный — если вы превысили прежний рекорд по весу в одном подходе; жёлтый — если суммарный объём упражнения выше лучшего за прошлые тренировки; голубой — если упражнение без веса и сумма повторов по всем подходам выше прошлого максимума. Если выполняется несколько условий, приоритет: красный, затем жёлтый, затем голубой. Подсветка только в текущей тренировке, в сохранённой истории её нет.';

  @override
  String get instructionSectionWorkout => 'Тренировка';

  @override
  String get instructionAddExerciseTitle => 'Добавить упражнение';

  @override
  String get instructionAddExerciseBody =>
      'Добавляет новый блок. Сначала укажите название текущего упражнения — если поле пустое, приложение напомнит.';

  @override
  String get instructionSectionExerciseNameTools => 'Название упражнения';

  @override
  String get instructionRenameExerciseTitle => 'Долгое нажатие — переименовать';

  @override
  String get instructionRenameExerciseDesc =>
      'Долго нажмите на название упражнения при вводе тренировки, на подсказку в выпадающем списке или на заголовок в сохранённой тренировке в истории — имя обновится везде.';

  @override
  String get instructionRemoveFromBankTitle => 'Убрать из списка';

  @override
  String get instructionRemoveFromBankDesc =>
      'Когда открыт список подсказок под полем названия, нажмите крестик у строки — или красный крестик в личном прогрессе, — чтобы убрать это имя из подсказок и из таблицы прогресса. Сохранённые тренировки не меняются.';

  @override
  String get instructionSectionInputs => 'Данные';

  @override
  String get instructionWeightTitle => 'Вес';

  @override
  String get instructionWeightBody =>
      'Вес снаряда или оборудования. Вводите число в кг или lb — как вам удобно. Приложение единицы не пересчитывает.';

  @override
  String get instructionRepsTitle => 'Повторы';

  @override
  String get instructionRepsBody =>
      'Сколько раз вы выполнили движение за один подход.';

  @override
  String get instructionRirTitle => 'Запас (RIR)';

  @override
  String get instructionRirBody =>
      'Сколько повторений вы могли бы ещё сделать до полного отказа. Помогает отслеживать интенсивность.';

  @override
  String get instructionOneRmTitle => '1ПМ (одно повторение, 1RM)';

  @override
  String get instructionOneRmDesc =>
      'Расчётный максимум на одно повторение по текущему весу и числу повторов. Ключевой показатель силы для прогресса и подбора рабочих весов.';

  @override
  String get instructionExerciseVolumeTitle => 'Объём упражнения (сумма)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Под строками подходов, справа от кнопки прогресса (график): суммарный тоннаж по упражнению — сумма «вес × повторы» по всем подходам, где заданы оба значения. Пересчитывается при вводе и правках.';

  @override
  String get instructionSectionPersonalProgress => 'Личный прогресс';

  @override
  String get instructionPersonalProgressIntro =>
      'Одна таблица по всем движениям из сохранённых тренировок: лучший подход, оценка 1ПМ и максимальный объём. Поиск сразу находит название. Звезда добавляет упражнение в избранное; маленькая метка под именем задаёт мышечную группу; красный крестик убирает имя из подсказок и из этой таблицы (сохранённые тренировки не меняются). Открыть можно из меню тренировок или из профиля клиента.';

  @override
  String get instructionSectionSaving => 'Сохранение';

  @override
  String get instructionFinishTitle => 'Завершить тренировку';

  @override
  String get instructionFinishBody =>
      'Подтверждает и записывает тренировку в историю. Если выйти раньше, можно сохранить, удалить черновик или остаться. Если приложение прервалось, черновик сохраняется сам.';

  @override
  String get instructionSectionCardio => 'Кардио и интенсивность';

  @override
  String get instructionCardioTitle => 'Кардио';

  @override
  String get instructionCardioBody =>
      'Отслеживает время и интенсивность кардио-блока; расстояние в приложении не вводится. Помогает держать ритм и контролировать усилие.';

  @override
  String get instructionIntensityTitle => 'Интенсивность';

  @override
  String get instructionIntensityBody =>
      'Используйте шкалу усилий (RPE), чтобы понимать, насколько тяжело далась тренировка. Это ключ к прогрессу без перетренированности.';

  @override
  String get instructionSectionStopwatch => 'Секундомер (ваш помощник)';

  @override
  String get instructionStopwatchWhyTitle => 'Зачем он нужен?';

  @override
  String get instructionStopwatchWhyBody =>
      'Чтобы контролировать отдых между подходами. Короткий отдых - выше плотность, длинный - больше сил на тяжелый вес.';

  @override
  String get instructionStopwatchHowTitle => 'Как он работает?';

  @override
  String get instructionStopwatchHowBody =>
      'По центру — время и кнопки «Пуск/Пауза» и «Сброс». Слева и справа — быстрые пресеты (описаны ниже). В обычном режиме секундомера время идёт вверх с сотыми долями секунды. Таймер закреплён в шапке при прокрутке экрана.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Слева: интервалы';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 секунд работы и 60 секунд отдыха. 4/4 — по 4 минуты работы и 4 минуты отдыха за цикл. 20/10 — табата: 20 секунд нагрузки, 10 секунд отдыха. После выбора таймер по кругу чередует фазы, пока не поставите на паузу или не сбросите. Красный оттенок — работа, синий — отдых.';

  @override
  String get instructionStopwatchRestTitle => 'Справа: отдых';

  @override
  String get instructionStopwatchRestBody =>
      'Кнопки +1m, +2m и +5m задают или удлиняют обратный отсчёт в минутах. Если шёл интервальный цикл, он переключается на такой отсчёт. Если отсчёт уже идёт — минуты добавляются к оставшемуся времени. Удобно для отдыха между подходами.';

  @override
  String get instructionStopwatchProgressTitle => 'Полоска прогресса';

  @override
  String get instructionStopwatchProgressBody =>
      'В режимах отсчёта и интервалов под временем отображается полоска: сколько текущей фазы осталось.';

  @override
  String get instructionStopwatchSoundsTitle => 'Звук и вибрация';

  @override
  String get instructionStopwatchSoundsBody =>
      'За 3, 2 и 1 секунду до конца фазы — короткий звук из приложения и лёгкая вибрация. При смене фазы или обнулении отсчёта — более заметный сигнал и отклик. Звуки — минимальные файлы в составе приложения; микрофон и разрешение на уведомления не нужны; громкость зависит от настроек устройства.';

  @override
  String get instructionSectionNavHistory => 'История и данные';

  @override
  String get instructionNavHistoryTitle => 'История / статистика';

  @override
  String get instructionNavHistoryDesc =>
      'В календаре/истории у каждой тренировки показан тоннаж. Объём тренировки — один из лучших индикаторов гипертрофии: чем больше качественного объёма, тем больше мышц вы строите.';

  @override
  String get instructionNavImportExportTitle => 'Импорт / экспорт';

  @override
  String get instructionNavImportExportDesc =>
      'Резервная копия и перенос данных через экспорт и импорт JSON в окне статистики. В копию входят история, список упражнений, избранное и метки мышечных групп. Тренерская копия отдельна от личной истории.';

  @override
  String get instructionSectionHome => 'Главный экран';

  @override
  String get instructionThemeTitle => 'Тема';

  @override
  String get instructionThemeDesc =>
      'Переключатель солнце / луна на главном экране меняет светлую и тёмную тему. Выбор запоминается.';

  @override
  String get instructionTrainSelfTitle => 'Тренирую себя';

  @override
  String get instructionTrainSelfDesc =>
      'Свои тренировки, календарь, личный прогресс, избранное, шкала ритма (как часто вы тренируетесь) и быстрая тренировка на всё тело из упражнений с метками групп.';

  @override
  String get instructionTrainOthersTitle => 'Тренирую других';

  @override
  String get instructionTrainOthersDesc =>
      'Режим тренера: клиенты, расписание и отдельная история на каждого. У каждого клиента свои таблица прогресса и избранное.';

  @override
  String get instructionSectionAthleteMenu => 'Ваши тренировки';

  @override
  String get instructionStartWorkoutTitle => 'Начать тренировку';

  @override
  String get instructionStartWorkoutDesc =>
      'Открывает пустую сессию — прошлую тренировку не копирует. Добавляйте упражнения, записывайте подходы и завершите, чтобы сохранить.';

  @override
  String get instructionQuickWorkoutTitle => 'Быстрая тренировка';

  @override
  String get instructionQuickWorkoutDesc =>
      'Собирает тренировку на всё тело из 4 упражнений: грудь, спина, одна половина ног (перед или зад бедра — не оба в один день) и одно на плечи, руки или кор — какая группа дольше не тренировалась. Сначала избранные. Прошлые вес и повторы показаны серым как минимум, который нужно преодолеть — каждый подход вы вводите сами.';

  @override
  String get instructionCalendarMenuTitle => 'Календарь тренировок';

  @override
  String get instructionCalendarMenuDesc =>
      'Видно, в какие дни вы тренировались; можно открыть сохранённую сессию или добавить тренировку на выбранную дату и время — в том числе в прошлые дни.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Таблица лучших подходов, оценки 1ПМ и максимального объёма. Здесь же звезда избранного и метка мышечной группы.';

  @override
  String get instructionFavoritesMenuTitle => 'Избранные упражнения';

  @override
  String get instructionFavoritesMenuDesc =>
      'Список отмеченных звёздочкой. Отметьте нужные и нажмите «Собрать тренировку» — сессия начнётся в этом порядке. Прошлые вес и повторы показаны серым как минимум, который нужно преодолеть.';

  @override
  String get instructionSectionRhythm => 'Ритм тренировок';

  @override
  String get instructionRhythmIntro =>
      'После нескольких силовых тренировок вверху экрана тренировок появляется шкала. Она показывает, сколько дней в неделю вы тренировались в среднем за последние четыре недели. Дни только с кардио не считаются. Это снимок плотности, а не цель, которую приложение требует достичь.';

  @override
  String get instructionRhythmGaugeTitle => 'Дней в неделю';

  @override
  String get instructionRhythmGaugeDesc =>
      'Дуга заполняется от 1 до 6 дней в неделю. Холодный стальной оттенок — более спокойный ритм, тёплые тона — выше плотность. Шкала появляется, когда в этом четырёхнедельном окне есть хотя бы три силовых дня.';

  @override
  String get instructionRhythmDeloadTitle => 'Напоминание о лёгкой неделе';

  @override
  String get instructionRhythmDeloadDesc =>
      'Если вы тренируетесь примерно два с половиной дня в неделю или чаще несколько недель подряд без более лёгкой недели, приложение может предложить снизить тоннаж и повторения примерно на 30% на одну неделю. Чем больше дней в неделю, тем раньше появится напоминание. Это напоминание, не предписание. Не чаще одного раза в неделю.';

  @override
  String get instructionSectionFavorites => 'Избранное';

  @override
  String get instructionFavoriteStarTitle => 'Звезда';

  @override
  String get instructionFavoriteStarDesc =>
      'В «Личном прогрессе» нажмите звезду рядом с упражнением, чтобы добавить или убрать его из избранного. Избранные остаются вверху таблицы.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Собрать тренировку';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'На экране избранного отметьте упражнения. Кнопка появляется, когда выбрано хотя бы одно. Прошлые вес и повторы показаны серым как минимум, который нужно преодолеть — каждый подход вы вводите сами. Для клиента то же действие открывает сессию этого человека.';

  @override
  String get instructionSectionMuscleGroups =>
      'Мышечные группы и быстрая тренировка';

  @override
  String get instructionMuscleGroupsIntro =>
      'Группы — необязательные метки к вашим названиям упражнений. Это не каталог: они нужны только быстрой тренировке, чтобы собрать сбалансированный микс на всё тело. Восемь групп: грудь, спина, плечи, корпус, передняя поверхность бедра, задняя поверхность бедра, сгибание рук, разгибание рук.';

  @override
  String get instructionMuscleGroupTagTitle => 'Как пометить';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Когда вы впервые вводите новое название, приложение спрашивает группу. Можно нажать «Позже» или «Не для быстрой тренировки», если движение не должно попадать в микс на всё тело. Метку под именем в «Личном прогрессе» или избранном можно сменить или снять.';

  @override
  String get instructionQuickWorkoutHowTitle => 'Как собирается быстрая сессия';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Четыре слота: грудь, спина, одна половина ног, затем плечи/руки/кор по давности. В предпросмотре слот можно заменить другим упражнением той же группы. Если мало — добавьте упражнения сами.';

  @override
  String get instructionStrengthCardioTitle => 'Сила / кардио';

  @override
  String get instructionStrengthCardioDesc =>
      'Переключатель вверху сессии. Сила: вес, повторы, запас (RIR). Кардио: только время и интенсивность — поле дистанции нет.';

  @override
  String get instructionPreviousHintsTitle => 'Серые цифры прошлой сессии';

  @override
  String get instructionPreviousHintsDesc =>
      'Когда тренер выбирает упражнение в сессии клиента, быстрой тренировке или сборке из избранного, прошлые вес и повторы показаны серым — это минимум, который нужно преодолеть, а не уже записанный подход. В историю попадают только числа, которые вы ввели сами.';

  @override
  String get instructionRemoveExerciseTitle => 'Убрать из этой тренировки';

  @override
  String get instructionRemoveExerciseDesc =>
      'Удаляет блок только из текущей сессии. Сохранённая история не меняется, пока вы не завершите тренировку.';

  @override
  String get instructionReassignExerciseTitle => 'Сменить упражнение в истории';

  @override
  String get instructionReassignExerciseDesc =>
      'В сохранённой тренировке блок можно переназначить на другое имя. Меняется только эта сессия; графики пойдут по новому имени. Подходы остаются как были.';

  @override
  String get instructionAutoSaveTitle => 'Прерванная тренировка';

  @override
  String get instructionAutoSaveDesc =>
      'Если приложение закрылось посреди сессии, оно предложит продолжить с того же места или удалить несохранённый черновик.';

  @override
  String get instructionSectionCalendar => 'Календарь';

  @override
  String get instructionCalendarAddTitle => 'Добавить на дату';

  @override
  String get instructionCalendarAddDesc =>
      'Выберите день и добавьте тренировку на выбранное время. Удобно, если нужно внести пропущенную сессию.';

  @override
  String get instructionSectionTrainer => 'Режим тренера';

  @override
  String get instructionTrainerIntro =>
      '«Тренирую других» — для тренеров. Добавляйте клиентов, ставьте сессии, планируйте упражнения заранее и ведите тренировки отдельно по каждому человеку. Повтор прошлой сессии — по желанию. Экспорт и импорт тренерских данных отделены от личной истории. Удаление клиента снимает будущие сессии, но прошлые тренировки остаются для отчётности.';

  @override
  String get instructionClientsTitle => 'Клиенты';

  @override
  String get instructionClientsDesc =>
      'Добавление, правка и удаление клиентов. В списке видны прошлая и следующая сессии. В профиле: цель, вес, рост и закрытые заметки тренера.';

  @override
  String get instructionClientProfileTitle => 'Профиль клиента';

  @override
  String get instructionClientProfileDesc =>
      'Из профиля начинается сегодняшняя пустая живая сессия. Серые цифры прошлого раза появляются только после выбора упражнения. В истории — только завершённые тренировки. Планируйте на другие даты в календаре. Прогресс и избранное — на том же экране. Несохранённые правки профиля спрашивают подтверждение перед выходом.';

  @override
  String get instructionTrainerPlanTitle => 'Спланировать сессию';

  @override
  String get instructionTrainerPlanDesc =>
      'План только из календаря тренера: выберите клиента и дату, затем упражнения. Прошлые вес и повторы — серые подсказки. Запланированная сессия со значком «плей»: нажмите, чтобы начать (сегодня) или удалить. В историю попадают только завершённые. План с прошедшей датой удаляется.';

  @override
  String get instructionTrainerRepeatTitle => 'Повторить прошлую тренировку';

  @override
  String get instructionTrainerRepeatDesc =>
      'По желанию. Из профиля клиента или переключателем при добавлении сессии в календаре. Копирует упражнения прошлой сессии в сегодняшнюю живую тренировку или в новый план; прошлые вес и повторы — серые подсказки, а не готовые подходы.';

  @override
  String get rhythmPerWeek => 'в неделю';

  @override
  String get deloadNudgeTitle => 'Неделя полегче?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Вы тренируетесь около $rate дней в неделю уже примерно $weeks нед. Это напоминание, не предписание. При таком ритме часто стоит снизить тоннаж и повторения примерно на 30% на неделю.';
  }

  @override
  String get deloadNudgeLater => 'Не сейчас';

  @override
  String get deloadNudgeOk => 'Понятно';

  @override
  String get instructionHubManifest =>
      'Без встроенного каталога и готовых программ. Вы сами называете упражнения — приложение ведёт статистику так, как вам удобно.';

  @override
  String get instructionChapterStartTitle => 'С чего начать';

  @override
  String get instructionChapterStartBlurb =>
      'Главный экран, как вы тренируетесь, и почему приложение не учит вас тренироваться.';

  @override
  String get instructionChapterToolsTitle => 'Инструменты';

  @override
  String get instructionChapterToolsBlurb =>
      'Ритм, избранное, группы мышц и быстрая тренировка.';

  @override
  String get instructionChapterSessionTitle => 'На тренировке';

  @override
  String get instructionChapterSessionBlurb =>
      'Подходы, поля, кардио, сохранение и секундомер.';

  @override
  String get instructionChapterProgressTitle => 'Прогресс и данные';

  @override
  String get instructionChapterProgressBlurb =>
      'Личные рекорды, график, календарь, история и резервная копия.';

  @override
  String get instructionChapterCoachTitle => 'Режим тренера';

  @override
  String get instructionChapterCoachBlurb =>
      'Клиенты, профили, план сессии и повтор тренировки.';

  @override
  String get instructionSearchHint => 'Поиск по инструкции';

  @override
  String get instructionSearchEmpty => 'Ничего не найдено.';
}
