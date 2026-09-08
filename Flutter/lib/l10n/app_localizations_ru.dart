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
  String get importAthlete => 'ИМПОРТ АТЛЕТА';

  @override
  String importAthleteFound(int count) {
    return 'Найдены записи о $count тренировках атлета, которого нет в списке.';
  }

  @override
  String get importAthleteBackupOwn => 'СНАЧАЛА СОХРАНИТЬ СВОИ ДАННЫЕ';

  @override
  String get importAthleteDecline => 'Отказаться';

  @override
  String get importAthleteSuccess => 'Атлет добавлен';

  @override
  String get importAthleteNotAthleteFile =>
      'Этот файл не является историей тренировок атлета.';

  @override
  String get importAthleteEmpty => 'В этом файле нет тренировок.';

  @override
  String get importAthleteAlreadyImported =>
      'Эти тренировки уже есть на устройстве.';

  @override
  String get importAthleteUseDedicatedButton =>
      'Это похоже на историю атлета. Используйте «Импорт атлета».';

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
  String get planChangesSavedTitle => 'Изменения сохранены';

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
  String get clientNameCannotChange => 'Имя потом изменить нельзя.';

  @override
  String get clientNameTaken => 'Это имя уже занято. Выберите другое.';

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
  String get switchWorkoutTypeTitle => 'Сменить тип тренировки?';

  @override
  String get switchWorkoutTypeBody =>
      'Подходы другого типа не сохранятся в этой тренировке.';

  @override
  String get switchWorkoutTypeConfirm => 'Сменить';

  @override
  String get saveWorkoutNothingToSave =>
      'Пока нечего сохранять. Укажите вес и повторы или длительность кардио.';

  @override
  String get importedHistoryBadge => 'Импорт';

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
  String get instructionHubManifest =>
      'Без каталога упражнений и готовых программ. Вы называете движения своими словами — приложение ведёт по ним статистику.';

  @override
  String get instructionSearchHint => 'Поиск по инструкции';

  @override
  String get instructionSearchEmpty => 'Ничего не найдено.';

  @override
  String get instructionChapterStartTitle => 'С чего начать';

  @override
  String get instructionChapterStartBlurb =>
      'Главный экран, два режима и логика приложения.';

  @override
  String get instructionChapterSessionTitle => 'На тренировке';

  @override
  String get instructionChapterSessionBlurb =>
      'Подходы, вес, повторы, RIR, кардио и завершение сессии.';

  @override
  String get instructionChapterTimerTitle => 'Секундомер';

  @override
  String get instructionChapterTimerBlurb =>
      'Интервалы, отдых между подходами и сигналы.';

  @override
  String get instructionChapterExercisesTitle => 'Упражнения и группы';

  @override
  String get instructionChapterExercisesBlurb =>
      'Свой список движений, мышечные группы, избранное и быстрая тренировка.';

  @override
  String get instructionChapterProgressTitle => 'Прогресс и рекорды';

  @override
  String get instructionChapterProgressBlurb =>
      'Личный прогресс, 1ПМ, тоннаж и график по упражнению.';

  @override
  String get instructionChapterRhythmTitle => 'Ритм и восстановление';

  @override
  String get instructionChapterRhythmBlurb =>
      'Шкала недельного ритма и неделя разгрузки.';

  @override
  String get instructionChapterDataTitle => 'История и данные';

  @override
  String get instructionChapterDataBlurb =>
      'Календарь, правка записей, статистика и резервная копия.';

  @override
  String get instructionChapterCoachTitle => 'Режим тренера';

  @override
  String get instructionChapterCoachBlurb =>
      'Клиенты, расписание, план сессии и печать.';

  @override
  String get instructionPhilosophy =>
      'IronVibe не учит тренироваться и не выдаёт готовых программ — для этого есть тренер и собственный опыт. Здесь нет каталога из тысяч упражнений: названия движений вы вводите своими словами, а приложение аккуратно считает по ним цифры. Всё хранится на устройстве: ни аккаунтов, ни подписок, ни рекламы.';

  @override
  String get instructionSectionHome => 'Главный экран';

  @override
  String get instructionThemeTitle => 'Тема';

  @override
  String get instructionThemeDesc =>
      'Переключатель солнце — луна меняет светлое и тёмное оформление. Выбор запоминается.';

  @override
  String get instructionTrainSelfTitle => 'Тренирую себя';

  @override
  String get instructionTrainSelfDesc =>
      'Ваш контур: тренировки, календарь, личный прогресс, избранное и шкала ритма.';

  @override
  String get instructionTrainOthersTitle => 'Тренирую других';

  @override
  String get instructionTrainOthersDesc =>
      'Режим тренера: клиенты, расписание и отдельная история по каждому человеку. С личными тренировками не смешивается.';

  @override
  String get instructionLanguageTitle => 'Язык';

  @override
  String get instructionLanguageDesc =>
      'Приложение следует языку системы — отдельной настройки нет. Поддерживается десять языков.';

  @override
  String get instructionHomeLinksTitle => 'Версия и связь';

  @override
  String get instructionHomeLinksDesc =>
      'Внизу главного экрана — номер версии, сайт, Telegram, почта поддержки и политика конфиденциальности.';

  @override
  String get instructionSectionAthleteMenu => 'Ваши тренировки';

  @override
  String get instructionStartWorkoutTitle => 'Начать тренировку';

  @override
  String get instructionStartWorkoutDesc =>
      'Открывает пустую сессию — прошлая не копируется. Добавляйте упражнения, записывайте подходы и завершите, чтобы сохранить.';

  @override
  String get instructionQuickWorkoutTitle => 'Быстрая тренировка';

  @override
  String get instructionQuickWorkoutDesc =>
      'Собирает фулбади из четырёх упражнений по вашим меткам мышечных групп.';

  @override
  String get instructionCalendarMenuTitle => 'Календарь тренировок';

  @override
  String get instructionCalendarMenuDesc =>
      'Дни, в которые вы тренировались. Отсюда открываются сохранённые сессии и добавляются пропущенные.';

  @override
  String get instructionSectionPersonalProgress => 'Личный прогресс';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Таблица лучших подходов, расчётного 1ПМ и максимального объёма по каждому движению.';

  @override
  String get instructionFavoritesMenuTitle => 'Избранные упражнения';

  @override
  String get instructionFavoritesMenuDesc =>
      'Движения, отмеченные звездой. Из них собирается тренировка в пару касаний.';

  @override
  String get instructionSectionWorkout => 'Сессия';

  @override
  String get instructionStrengthCardioTitle => 'Сила или кардио';

  @override
  String get instructionStrengthCardioDesc =>
      'Переключатель вверху сессии задаёт тип тренировки. Силовая — вес, повторы и RIR; кардио — время и интенсивность. Если данные другого типа уже введены, приложение переспросит.';

  @override
  String get instructionAddExerciseTitle => 'Добавить упражнение';

  @override
  String get instructionAddExerciseBody =>
      'Новый блок добавится, когда у текущего упражнения есть название и хотя бы один заполненный подход.';

  @override
  String get instructionPreviousHintsTitle => 'Серые подсказки';

  @override
  String get instructionPreviousHintsDesc =>
      'Вес и повторы прошлого раза показаны серым — это ориентир, который нужно побить, а не записанный подход. В историю попадёт только то, что вы введёте сами.';

  @override
  String get instructionRemoveExerciseTitle => 'Убрать упражнение';

  @override
  String get instructionRemoveExerciseDesc =>
      'Красный крестик удаляет блок из текущей сессии. Сохранённая история при этом не меняется.';

  @override
  String get instructionSectionSetControl => 'Строка подхода';

  @override
  String get instructionSetPlusLabel => 'Плюс';

  @override
  String get instructionSetPlusDesc =>
      'Добавляет пустую строку следующего подхода.';

  @override
  String get instructionSetMinusLabel => 'Минус';

  @override
  String get instructionSetMinusDesc =>
      'Убирает последний подход. Пустую строку удаляет сразу, заполненную — после подтверждения. Если подход остался один, поля просто очистятся.';

  @override
  String get instructionSetProgressLabel => 'График упражнения';

  @override
  String get instructionSetProgressDesc =>
      'Открывает динамику по этому движению за месяц, год или всё время.';

  @override
  String get instructionExerciseVolumeTitle => 'Тоннаж упражнения';

  @override
  String get instructionExerciseVolumeDesc =>
      'Справа от кнопки графика — сумма «вес × повторы» по всем заполненным подходам. Пересчитывается на лету.';

  @override
  String get instructionSectionInputs => 'Что означают поля';

  @override
  String get instructionWeightTitle => 'Вес';

  @override
  String get instructionWeightBody =>
      'Рабочий вес снаряда. Вводите в килограммах или фунтах — приложение единицы не пересчитывает и ничего не навязывает.';

  @override
  String get instructionRepsTitle => 'Повторы';

  @override
  String get instructionRepsBody => 'Количество повторений в подходе.';

  @override
  String get instructionRirTitle => 'RIR — запас повторений';

  @override
  String get instructionRirBody =>
      'Сколько повторений вы могли бы сделать сверх выполненного. 0 — работа до отказа, ∞ — разминочный подход. Простой способ дозировать интенсивность.';

  @override
  String get instructionOneRmTitle => '1ПМ — разовый максимум';

  @override
  String get instructionOneRmDesc =>
      'Расчётная оценка веса на одно повторение по формуле Эпли. Считается из веса и повторов подхода и показывается прямо под строкой — ключевой ориентир силы.';

  @override
  String get instructionSectionCardio => 'Кардио';

  @override
  String get instructionCardioTitle => 'Время';

  @override
  String get instructionCardioBody =>
      'Длительность блока в минутах. Дистанции и пульса здесь нет: приложение не связано с трекерами.';

  @override
  String get instructionIntensityTitle => 'Интенсивность';

  @override
  String get instructionIntensityBody =>
      'Оценка усилия от 1 до 5 — упрощённая шкала RPE. В кардио-сессии на упражнение сохраняется одна строка.';

  @override
  String get instructionSectionSaving => 'Завершение';

  @override
  String get instructionFinishTitle => 'Завершить тренировку';

  @override
  String get instructionFinishBody =>
      'Кнопка внизу сессии: приложение переспросит и запишет тренировку в историю. Нужен хотя бы один заполненный подход.';

  @override
  String get instructionLeaveWorkoutTitle => 'Выход раньше времени';

  @override
  String get instructionLeaveWorkoutDesc =>
      'Если закрыть сессию с данными, можно остаться, сохранить сделанное или удалить черновик.';

  @override
  String get instructionAutoSaveTitle => 'Прерванная тренировка';

  @override
  String get instructionAutoSaveDesc =>
      'Черновик сохраняется сам — раз в минуту и при сворачивании приложения. При следующем запуске вам предложат продолжить с того же места или удалить его.';

  @override
  String get instructionScreenAwakeTitle => 'Экран не гаснет';

  @override
  String get instructionScreenAwakeDesc =>
      'Пока идёт живая сессия, экран остаётся включённым, чтобы не разблокировать телефон после каждого подхода.';

  @override
  String get instructionStopwatchWhyTitle => 'Зачем считать отдых';

  @override
  String get instructionStopwatchWhyBody =>
      'Пауза между подходами — такой же рабочий параметр, как вес и повторы: короткий отдых поднимает плотность работы, длинный даёт выложиться в тяжёлом подходе.';

  @override
  String get instructionStopwatchHowTitle => 'Пуск, пауза, сброс';

  @override
  String get instructionStopwatchHowBody =>
      'Таймер закреплён в шапке сессии и остаётся на виду при прокрутке. По центру — время и управление; в обычном режиме отсчёт идёт вверх, с сотыми долями секунды.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Слева: интервалы';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — минута работы и минута отдыха. 4/4 — по четыре минуты. 20/10 — табата. Фазы чередуются по кругу до паузы или сброса: красный оттенок — работа, синий — отдых.';

  @override
  String get instructionStopwatchRestTitle => 'Справа: отдых';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m и +5m запускают обратный отсчёт между подходами. Если отсчёт уже идёт, минуты прибавляются к остатку; интервальный цикл переключится на отдых.';

  @override
  String get instructionStopwatchProgressTitle => 'Полоса фазы';

  @override
  String get instructionStopwatchProgressBody =>
      'В обратном отсчёте и интервалах под цифрами видно, сколько текущей фазы осталось.';

  @override
  String get instructionStopwatchSoundsTitle => 'Звук и вибрация';

  @override
  String get instructionStopwatchSoundsBody =>
      'За три, две и одну секунду до конца фазы — короткий щелчок и лёгкая вибрация, на смене фазы сигнал заметнее. Звуки встроены в приложение: ни микрофон, ни разрешение на уведомления не нужны, громкость берётся из настроек телефона.';

  @override
  String get instructionExerciseBankIntro =>
      'Список упражнений растёт сам: каждое новое название из завершённой тренировки попадает в подсказки. Имена хранятся в верхнем регистре, чтобы одно движение не раздваивалось.';

  @override
  String get instructionSectionExerciseNameTools => 'Названия';

  @override
  String get instructionRenameExerciseTitle => 'Переименовать везде';

  @override
  String get instructionRenameExerciseDesc =>
      'Долгое нажатие на название — в сессии, в списке подсказок или в сохранённой тренировке. Имя обновится во всей истории и на графиках.';

  @override
  String get instructionRemoveFromBankTitle => 'Убрать из подсказок';

  @override
  String get instructionRemoveFromBankDesc =>
      'Крестик в открытом списке подсказок или красный крестик в личном прогрессе убирает название из подсказок и из таблицы. Сохранённые тренировки остаются нетронутыми.';

  @override
  String get instructionReassignExerciseTitle => 'Заменить в записи';

  @override
  String get instructionReassignExerciseDesc =>
      'В сохранённой тренировке блок можно переназначить на другое движение. Подходы останутся как есть, но уйдут в статистику нового названия — меняется только эта сессия.';

  @override
  String get instructionSectionMuscleGroups => 'Мышечные группы';

  @override
  String get instructionMuscleGroupsIntro =>
      'Группа — необязательная метка к вашему названию. Она нужна только быстрой тренировке, чтобы собрать сбалансированный фулбади. Восемь групп: грудь, спина, плечи, корпус, квадрицепс, бицепс бедра, сгибатели рук, разгибатели рук.';

  @override
  String get instructionMuscleGroupTagTitle => 'Как поставить метку';

  @override
  String get instructionMuscleGroupTagDesc =>
      'При первом вводе нового названия приложение спросит группу. Можно ответить «Позже» или «Не для быстрой тренировки», если движение не должно попадать в микс. Метку под именем в личном прогрессе и избранном легко сменить или снять.';

  @override
  String get instructionSectionFavorites => 'Избранное';

  @override
  String get instructionFavoriteStarTitle => 'Звезда';

  @override
  String get instructionFavoriteStarDesc =>
      'Звезда есть и на карточке упражнения в сессии, и в таблице личного прогресса. Избранные держатся вверху списка.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Собрать тренировку';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'На экране избранного отметьте нужные движения — кнопка появится сразу. Сессия откроется в том же порядке, с серыми подсказками прошлого раза. Для клиента то же действие открывает его тренировку.';

  @override
  String get instructionSectionQuickWorkout => 'Быстрая тренировка';

  @override
  String get instructionQuickWorkoutHowTitle => 'Четыре слота';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Грудь, спина, одна половина ног (квадрицепс или бицепс бедра — не обе в один день) и одно движение на плечи, руки или корпус. В каждом слоте приложение берёт группу, которая дольше не работала, и отдаёт приоритет избранному.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Предпросмотр и замена';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'Перед стартом виден весь состав: любой слот можно заменить другим упражнением той же группы. Если помеченных движений не хватает, приложение скажет об этом и откроет личный прогресс, чтобы расставить метки.';

  @override
  String get instructionPersonalProgressIntro =>
      'Одна таблица по всем движениям из сохранённых тренировок. Избранные наверху, остальные по алфавиту; поиск находит по названию. Открывается из меню тренировок или из профиля клиента.';

  @override
  String get instructionProgressBestSetTitle => 'Лучший подход';

  @override
  String get instructionProgressBestSetDesc =>
      'Подход с наивысшим расчётным 1ПМ за всю историю. Для движений без веса берётся подход с наибольшим числом повторений.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Максимальный объём';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'Наибольший тоннаж этого упражнения за одну тренировку — ориентир, от которого удобно планировать рабочий объём.';

  @override
  String get instructionSectionProgressChart => 'График упражнения';

  @override
  String get instructionProgressChartIntro =>
      'Три независимые кривые по датам. Слева шкала веса, справа — повторов; жёлтая линия нормализована, чтобы тренды сравнивались по форме. Период переключается — месяц, год, всё время, — а касание точки показывает цифры этого дня. Кардио в график не попадает.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Красная — наибольший вес в одном подходе за день.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Голубая — наибольшее число повторений в подходе, не обязательно с максимальным весом.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Жёлтая — дневной тоннаж: сумма «вес × повторы» по подходам, где заполнены оба поля.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'На живой тренировке кнопка графика подсвечивается, когда вы бьёте рекорд: красным — по весу в подходе, жёлтым — по тоннажу упражнения, голубым — по сумме повторов в движениях без веса. Если совпало несколько, приоритет у красного, затем жёлтый и голубой. В сохранённой истории подсветки нет.';

  @override
  String get instructionRhythmIntro =>
      'Когда за последние четыре недели набирается хотя бы три силовых дня, вверху экрана тренировок появляется шкала ритма. Это не цель и не оценка — просто то, как вы сейчас ходите в зал.';

  @override
  String get instructionRhythmGaugeTitle => 'Дней в неделю';

  @override
  String get instructionRhythmGaugeDesc =>
      'Дуга заполняется от одного до шести дней — это среднее за четыре недели. Считаются дни с силовой работой, дни только с кардио — нет. Чем плотнее ритм, тем дальше цвет уходит от стали через золото к ржавчине.';

  @override
  String get instructionRhythmInsightTitle => 'Разбор ритма';

  @override
  String get instructionRhythmInsightDesc =>
      'Нажмите на шкалу: приложение назовёт ваш режим — спокойный, ровный, плотный или почти без выходных — и объяснит, что он значит для восстановления. У клиента тренера открывается такой же разбор.';

  @override
  String get instructionRhythmDeloadTitle => 'Неделя разгрузки';

  @override
  String get instructionRhythmDeloadDesc =>
      'Разгрузка — не пауза, а неделя вполсилы: рабочие веса и число подходов ниже на 30–50%, либо только кардио. Мышцы восстанавливаются быстрее связок, сухожилий и суставов — такая неделя даёт им догнать.';

  @override
  String get instructionRhythmNudgeTitle => 'Напоминание';

  @override
  String get instructionRhythmNudgeDesc =>
      'Если вы держите от двух с половиной тренировок в неделю и давно не разгружались, приложение предложит взять такую неделю. Чем плотнее ритм, тем раньше появится подсказка. Она всплывает не чаще раза в неделю и только в личном режиме — и остаётся рекомендацией, а не медицинским советом.';

  @override
  String get instructionSectionCalendar => 'Календарь и история';

  @override
  String get instructionCalendarBrowseTitle => 'Как листать';

  @override
  String get instructionCalendarBrowseDesc =>
      'Месяцы перелистываются свайпом, а нажатие на название месяца открывает быстрый выбор даты. Точка под числом означает, что в этот день была тренировка.';

  @override
  String get instructionCalendarAddTitle => 'Запись задним числом';

  @override
  String get instructionCalendarAddDesc =>
      'Выберите день, укажите время и добавьте тренировку — в том числе за прошедшую дату. Удобно, если сессию забыли записать.';

  @override
  String get instructionNavHistoryTitle => 'Тоннаж тренировки';

  @override
  String get instructionNavHistoryDesc =>
      'У каждой сохранённой сессии указан суммарный тоннаж. Объём — один из самых надёжных ориентиров для гипертрофии: важен не рекорд в отдельный день, а то, как он держится из недели в неделю.';

  @override
  String get instructionHistoryEditTitle => 'Правка записей';

  @override
  String get instructionHistoryEditDesc =>
      'Сохранённую тренировку можно раскрыть и поправить: добавить упражнение или подход, изменить цифры, удалить сессию целиком. Изменения сохраняются сразу.';

  @override
  String get instructionSectionStats => 'Статистика';

  @override
  String get instructionStatsTitle => 'Сводка тренировок';

  @override
  String get instructionStatsDesc =>
      'Иконка графика в шапке экрана тренировок или тренера: сколько сессий было за месяц, за год и за всё время. В режиме тренера — ещё и разбивка по клиентам.';

  @override
  String get instructionSectionBackup => 'Резервная копия';

  @override
  String get instructionNavImportExportTitle => 'Экспорт и импорт';

  @override
  String get instructionNavImportExportDesc =>
      'Экспорт складывает в один файл JSON историю, список упражнений, избранное, метки групп, клиентов и расписание. Импорт подмешивает файл к текущим данным и пропускает дубли — ничего не затирается. Тренерская копия отделена от личной.';

  @override
  String get instructionBackupNudgeTitle => 'Напоминание о копии';

  @override
  String get instructionBackupNudgeDesc =>
      'Данные живут только на этом устройстве: аккаунтов и облака нет. Раз в четыре недели приложение предложит сохранить копию — если телефон потеряется, история восстановится только из файла.';

  @override
  String get instructionTrainerIntro =>
      '«Тренирую других» — отдельный контур для работы с людьми: клиенты, расписание и своя история на каждого. Личные тренировки и тренерские данные не пересекаются.';

  @override
  String get instructionClientsTitle => 'Клиенты';

  @override
  String get instructionClientsDesc =>
      'Список с целью, прошлой и следующей сессией. В карточке — цель, вес, рост и закрытые заметки тренера. Имя задаётся при создании и потом не меняется.';

  @override
  String get instructionClientProfileTitle => 'Профиль клиента';

  @override
  String get instructionClientProfileDesc =>
      'Отсюда начинается сегодняшняя сессия и открываются прогресс, избранное и история по месяцам. Если силовых дней достаточно, здесь же шкала ритма. Удаление клиента снимает будущие сессии, но прошлые тренировки остаются для отчётности.';

  @override
  String get instructionTrainerScheduleTitle => 'Расписание';

  @override
  String get instructionTrainerScheduleDesc =>
      'Календарь тренера показывает сессии всех клиентов: значок «плей» — запланированная, галочка — завершённая, песочные часы — сегодняшняя в работе. Пустые планы прошедших дней убираются сами.';

  @override
  String get instructionTrainerPlanTitle => 'План сессии';

  @override
  String get instructionTrainerPlanDesc =>
      'На будущую дату упражнения и заметку можно расставить заранее и сохранить, не завершая тренировку. Прошлые вес и повторы придут серыми подсказками. В историю попадают только завершённые сессии.';

  @override
  String get instructionTrainerRepeatTitle => 'Повторить прошлую';

  @override
  String get instructionTrainerRepeatDesc =>
      'Из профиля клиента или переключателем при добавлении сессии в календаре. Копируется состав упражнений; вес и повторы приходят серыми подсказками, а не готовыми подходами.';

  @override
  String get instructionPrintSessionTitle => 'Печать сессии';

  @override
  String get instructionPrintSessionDesc =>
      'В завершённой тренировке иконка печати в шапке собирает лист A4 с составом и цифрами дня. Дальше системное окно: принтер, PDF или отправка клиенту.';

  @override
  String get instructionImportAthleteTitle => 'Импорт истории атлета';

  @override
  String get instructionImportAthleteDesc =>
      'Отдельная кнопка в статистике тренера: файл из личного режима заводится как новый клиент вместе с избранным и метками групп. Перенесённые тренировки помечаются как импортированные, а названия упражнений не смешиваются с вашими.';

  @override
  String get printSession => 'Печать';

  @override
  String get printSessionEmpty =>
      'Печатать пока нечего. Запишите хотя бы один подход.';

  @override
  String get printSessionShareText => 'Тренировка IronVibe';

  @override
  String get rhythmPerWeek => 'в неделю';

  @override
  String get deloadNudgeTitle => 'Неделя активного отдыха?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Вы тренируетесь около $rate дней в неделю уже примерно $weeks нед. Хороший момент для недели активного отдыха: рабочие веса и подходы ниже на 30–50% или только кардио. Это рекомендация, а не медицинский совет.';
  }

  @override
  String get deloadNudgeLater => 'Не сейчас';

  @override
  String get deloadNudgeOk => 'Понятно';

  @override
  String get backupNudgeTitle => 'Сохранить копию?';

  @override
  String get backupNudgeBody =>
      'Данные хранятся только на этом устройстве. Если телефон потеряется или сбой накопителя — история пропадёт. Поделитесь копией сейчас или отложите на 28 дней.';

  @override
  String get backupNudgeShare => 'Поделиться';

  @override
  String get backupNudgeLater => 'Отложить';

  @override
  String get rhythmInsightTitle => 'Ритм тренировок';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'Вы тренируетесь в среднем $rate раза в неделю.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name тренируется в среднем $rate раза в неделю.';
  }

  @override
  String get rhythmInsightBandLight => 'Спокойный ритм';

  @override
  String get rhythmInsightBandSteady => 'Ровный ритм';

  @override
  String get rhythmInsightBandDense => 'Плотный ритм';

  @override
  String get rhythmInsightBandVeryDense => 'Почти без выходных';

  @override
  String get rhythmInsightHowTitle => 'Откуда эта цифра';

  @override
  String get rhythmInsightWindow =>
      'Среднее за последние четыре недели. Считаются дни с силовыми упражнениями; дни только с кардио — нет. Это не цель и не оценка, а просто ваш нынешний ритм.';

  @override
  String get rhythmInsightWhatTitle => 'Неделя активного отдыха';

  @override
  String get rhythmInsightWhatBody =>
      'Это не пауза, а неделя вполсилы: рабочие веса и число подходов ниже на 30–50%. Можно и вовсе отложить силовые, оставив кардио или любую другую активность. Мышцы восстанавливаются быстрее, чем суставы, связки и сухожилия, — такая неделя даёт им время догнать.';

  @override
  String get rhythmInsightPaceTitle => 'Что это значит';

  @override
  String get rhythmInsightAdviceLight =>
      'Между тренировками достаточно свободных дней, усталость не копится. Специально планировать активный отдых пока незачем — при таком ритме тело успевает восстанавливаться само.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Ровный ритм, на котором можно работать годами. Если тренировки тяжёлые, раз в несколько месяцев берите неделю активного отдыха — лучше заранее, чем когда веса встанут.';

  @override
  String get rhythmInsightAdviceDense =>
      'Тренировки идут плотно, и усталость копится незаметно. Неделя активного отдыха раз в два–три месяца обычно держит прогресс лучше, чем работа без передышек.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Почти каждый день под нагрузкой. Так можно, если сон и питание успевают. При таком ритме неделя активного отдыха примерно раз в месяц — обычная профилактика для суставов и связок, а не слабость.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Именно на таком ритме люди держатся годами.';

  @override
  String get rhythmInsightPraiseDense =>
      'Тренируетесь часто — такой график сам собой не складывается.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Похоже, вы нащупали у организма секретный режим.';

  @override
  String get rhythmInsightRecentLighter =>
      'Недавно нагрузка уже была ниже обычной — активный отдых можно считать пройденным. Набирайте ход.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Такой ритм держится уже $weeks недель.',
      many: 'Такой ритм держится уже $weeks недель.',
      few: 'Такой ритм держится уже $weeks недели.',
      one: 'Такой ритм держится уже $weeks неделю.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'Это рекомендация, а не медицинский совет. Если чувствуете себя хорошо — менять ничего не нужно.';
}
