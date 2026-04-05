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
  String get addSet => '+ ДОБАВИТЬ ПОДХОД';

  @override
  String get addExercise => '+ ДОБАВИТЬ УПРАЖНЕНИЕ';

  @override
  String get finishWorkout => 'ЗАВЕРШИТЬ ТРЕНИРОВКУ';

  @override
  String get startWorkout => 'НАЧАТЬ ТРЕНИРОВКУ';

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
  String get exerciseHint => 'Введите название упражнения';

  @override
  String get deleteFromHistory => 'Удалить из истории?';

  @override
  String get deleteExerciseHint => 'больше не будет в подсказках.';

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
  String get addClient => '+ ДОБАВИТЬ КЛИЕНТА';

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
      'В IronVibe намеренно нет готовых списков из тысяч упражнений и зашитых «программ». Приложение не учит тренироваться — для этого есть YouTube и живой тренер — оно помогает вести статистику так, как удобно именно вам. Вы сами вводите названия движений своими словами, а не выбираете из чужого каталога. Чем дольше пользуетесь, тем естественнее становится интерфейс: приложение подстраивается под ваши привычки, а не вы под него.';

  @override
  String get instructionSectionSetControl => 'Управление подходом';

  @override
  String get instructionSetMinusLabel => 'Минус';

  @override
  String get instructionSetMinusDesc =>
      'Удаляет последний подход. Если в строке есть данные, приложение запросит подтверждение.';

  @override
  String get instructionSetPlusLabel => 'Плюс';

  @override
  String get instructionSetPlusDesc =>
      'Добавляет новую строку подхода в текущем упражнении.';

  @override
  String get instructionSetProgressLabel => 'Временная шкала';

  @override
  String get instructionSetProgressDesc =>
      'Открывает график прогресса по этому упражнению.';

  @override
  String get instructionSectionProgressChart => 'График прогресса';

  @override
  String get instructionProgressChartIntro =>
      'Две независимые кривые по датам: красный — максимальный вес в одном подходе за день; голубой — максимум повторений в одном подходе. Слева шкала веса, справа — повторов.';

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
  String get instructionSectionWorkout => 'Тренировка';

  @override
  String get instructionAddExerciseTitle => 'Добавить упражнение';

  @override
  String get instructionAddExerciseBody =>
      'Создаёт новый блок для другого вида занятий.';

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
      'Когда открыт список подсказок под полем названия, нажмите крестик у строки, чтобы удалить это имя из вашей личной «базы» упражнений.';

  @override
  String get instructionSectionInputs => 'Данные';

  @override
  String get instructionWeightTitle => 'Вес';

  @override
  String get instructionWeightBody => 'Вес снаряда или оборудования.';

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
      'Раздел «Личный прогресс» нужен, чтобы отслеживать успехи по каждому упражнению отдельно: в таблице собраны все движения из сохранённой истории, удобно сравнивать показатели. Строка поиска сразу находит нужное название. Открыть можно с главного экрана тренировки (кнопка под календарём) или из профиля клиента.';

  @override
  String get instructionSectionSaving => 'Сохранение';

  @override
  String get instructionFinishTitle => 'Завершить тренировку';

  @override
  String get instructionFinishBody =>
      'Сохраняет всю тренировку в историю. Пока вы не нажали эту кнопку, данные не зафиксированы.';

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
      'Просмотр завершённых тренировок в календаре и сводной статистики по иконке графика в панели приложения.';

  @override
  String get instructionNavImportExportTitle => 'Импорт / экспорт';

  @override
  String get instructionNavImportExportDesc =>
      'Резервная копия и перенос данных через экспорт и импорт JSON в окне статистики.';
}
