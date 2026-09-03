// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'YOUR WORKOUTS\' VIBE';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get renameExerciseTitle => 'Rename exercise';

  @override
  String get renameExerciseEmpty => 'Name cannot be empty';

  @override
  String get reassignHistoryExerciseTitle => 'Change exercise';

  @override
  String get reassignHistoryExerciseBody =>
      'Only this workout changes. Your sets stay the same; progress charts follow the new exercise name.';

  @override
  String get delete => 'Delete';

  @override
  String get yesDelete => 'Yes, delete';

  @override
  String get close => 'Close';

  @override
  String get save => 'Save';

  @override
  String get add => 'Add';

  @override
  String get trainOthers => 'I TRAIN OTHERS';

  @override
  String get trainSelf => 'I TRAIN MYSELF';

  @override
  String get statistics => 'STATISTICS';

  @override
  String get exportHistory => 'EXPORT WORKOUT HISTORY';

  @override
  String get historyEmpty => 'History is empty, nothing to export yet';

  @override
  String get exportError => 'Export error:';

  @override
  String get exportJson => 'EXPORT JSON';

  @override
  String get importData => 'IMPORT';

  @override
  String get importSuccess => 'Data imported successfully';

  @override
  String get importError => 'Import error:';

  @override
  String get importNewerVersion => 'File was created by a newer app version';

  @override
  String get importFileAccessError => 'File access error';

  @override
  String get importInvalidJson => 'Invalid JSON format';

  @override
  String get importInvalidBackupFile => 'Error: invalid backup file selected';

  @override
  String get importAthlete => 'IMPORT ATHLETE';

  @override
  String importAthleteFound(int count) {
    return 'Found records of $count workouts from an athlete who is not on your list.';
  }

  @override
  String get importAthleteBackupOwn => 'SAVE MY DATA FIRST';

  @override
  String get importAthleteDecline => 'Don\'t add';

  @override
  String get importAthleteSuccess => 'Athlete added';

  @override
  String get importAthleteNotAthleteFile =>
      'This file is not an athlete workout history.';

  @override
  String get importAthleteEmpty => 'No workouts found in this file.';

  @override
  String get importAthleteAlreadyImported =>
      'These workouts are already on this device.';

  @override
  String get importAthleteUseDedicatedButton =>
      'This looks like an athlete history file. Use Import athlete instead.';

  @override
  String get shareText => 'IronVibe workout history';

  @override
  String get monthStats => 'THIS MONTH';

  @override
  String get yearStats => 'THIS YEAR';

  @override
  String get allTimeStats => 'ALL TIME';

  @override
  String get weight => 'Weight';

  @override
  String get reps => 'Reps';

  @override
  String get rir => 'RIR';

  @override
  String get oneRm => '1RM';

  @override
  String get approxOneRm => '≈ 1RM:';

  @override
  String get kg => 'kg';

  @override
  String get volumeShort => 'VOL.';

  @override
  String get addSet => 'ADD SET';

  @override
  String get addExercise => 'ADD EXERCISE';

  @override
  String get finishWorkout => 'FINISH WORKOUT';

  @override
  String get finishWorkoutConfirmTitle => 'Finish workout?';

  @override
  String get finishWorkoutConfirmBody => 'The workout will be saved.';

  @override
  String get finishWorkoutConfirmAction => 'Finish';

  @override
  String get workoutCompleteTitle => 'Workout saved';

  @override
  String get planChangesSavedTitle => 'Changes saved';

  @override
  String get startWorkout => 'START WORKOUT';

  @override
  String get quickWorkout => 'QUICK WORKOUT';

  @override
  String get quickWorkoutFullBody => 'FULL BODY';

  @override
  String get quickWorkoutInsufficientTitle => 'Not enough data';

  @override
  String get quickWorkoutInsufficientBody =>
      'A quick workout needs tagged exercises for chest, back, one leg group (front or rear thigh), and one of shoulders, arms, or core. Mark groups in Personal Progress — or keep logging: the app will ask when you enter a new exercise.';

  @override
  String get quickWorkoutOpenProgress => 'OPEN PERSONAL PROGRESS';

  @override
  String get quickWorkoutPreviewTitle => 'QUICK WORKOUT · FULL BODY';

  @override
  String get quickWorkoutStart => 'START';

  @override
  String get quickWorkoutSwap => 'Swap';

  @override
  String get quickWorkoutNoAlternatives => 'No other exercise in this group';

  @override
  String get muscleGroupPromptTitle => 'Muscle group';

  @override
  String get muscleGroupPromptBody =>
      'Used to build a quick full-body workout.';

  @override
  String get muscleGroupLater => 'Later';

  @override
  String get muscleGroupClear => 'Clear';

  @override
  String get muscleGroupSkip => 'Not for quick workout';

  @override
  String get muscleGroupChest => 'Chest';

  @override
  String get muscleGroupBack => 'Back';

  @override
  String get muscleGroupShoulders => 'Shoulders';

  @override
  String get muscleGroupCore => 'Core';

  @override
  String get muscleGroupQuads => 'Front thigh';

  @override
  String get muscleGroupHamstrings => 'Rear thigh';

  @override
  String get muscleGroupArmFlex => 'Arm curl';

  @override
  String get muscleGroupArmExt => 'Arm extension';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'WORKOUT CALENDAR';

  @override
  String get personalProgress => 'PERSONAL PROGRESS';

  @override
  String get personalProgressSearchHint => 'Search exercises';

  @override
  String get personalProgressBestSet => 'Best set';

  @override
  String get personalProgressMaxVolume => 'Max volume';

  @override
  String get personalProgressEmpty => 'No exercises in workouts yet';

  @override
  String get favoriteExercises => 'FAVORITE EXERCISES';

  @override
  String get favoriteExercisesEmpty => 'No favorite exercises yet';

  @override
  String get buildWorkoutFromFavorites => 'BUILD WORKOUT';

  @override
  String get exerciseHint => 'Enter exercise name';

  @override
  String get deleteFromHistory => 'Remove from history?';

  @override
  String get deleteExerciseHint =>
      'will no longer appear in suggestions or Personal Progress.';

  @override
  String get exerciseDeleted => 'removed';

  @override
  String get deleteWorkoutTitle => 'DELETE';

  @override
  String get deleteWorkoutMsg =>
      'Delete this workout? Progress history will be lost.';

  @override
  String get removeSetWithDataConfirm =>
      'Delete set with data? This action cannot be undone.';

  @override
  String get removeExerciseFromWorkout => 'Remove exercise';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'Remove this exercise from the workout? This cannot be undone.';

  @override
  String get deleteClientTitle => 'DELETE CLIENT';

  @override
  String get deleteClientMsg =>
      'Are you sure you want to delete this client? All their future workouts will be removed.';

  @override
  String get noClientsTitle => 'NO CLIENTS';

  @override
  String get noClientsMsg => 'Add clients first in the Clients menu.';

  @override
  String get newClient => 'NEW CLIENT';

  @override
  String get editClient => 'EDIT';

  @override
  String get clientName => 'Name';

  @override
  String get clientNameCannotChange => 'The name cannot be changed later.';

  @override
  String get clientNameTaken => 'This name is already in use. Choose another.';

  @override
  String get clientGoal => 'Goal';

  @override
  String get clientWeight => 'Weight';

  @override
  String get clientHeight => 'Height';

  @override
  String get clientNotes => 'Notes';

  @override
  String get saveClientChanges => 'SAVE CHANGES';

  @override
  String get clientProfileUnsavedTitle => 'Unsaved changes';

  @override
  String get clientProfileUnsavedMessage =>
      'You have unsaved changes. Save before leaving?';

  @override
  String get clientProfileStay => 'Stay';

  @override
  String get clientProfileDiscard => 'Leave without saving';

  @override
  String get clientProfileSaveAndLeave => 'Save and leave';

  @override
  String get workoutRecoveryTitle => 'Workout interrupted';

  @override
  String get workoutRecoveryMessage =>
      'Your previous workout ended unexpectedly. Continue where you left off or delete the unsaved data.';

  @override
  String get workoutRecoveryContinue => 'Continue workout';

  @override
  String get workoutRecoveryDelete => 'Delete workout';

  @override
  String get workoutRecoverySessionMissing =>
      'The scheduled client workout was removed. The unsaved draft has been cleared.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Finish the current exercise before adding another one.';

  @override
  String get switchWorkoutTypeTitle => 'Switch workout type?';

  @override
  String get switchWorkoutTypeBody =>
      'Sets already entered for the other type will not be saved with this workout.';

  @override
  String get switchWorkoutTypeConfirm => 'Switch';

  @override
  String get saveWorkoutNothingToSave =>
      'Nothing to save yet. Add weight and reps, or duration for cardio.';

  @override
  String get importedHistoryBadge => 'Imported';

  @override
  String get clientWorkoutHistoryEmpty => 'No workouts yet';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Exercise #$n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Exercise #$n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return '#$n';
  }

  @override
  String get clientProfileSectionGoal => 'GOAL';

  @override
  String get clientProfileSectionAnthropometry => 'ANTHROPOMETRY';

  @override
  String get clientProfileSectionTrainerNotes => 'COACH NOTES';

  @override
  String get clientProfileSectionWorkoutHistory => 'WORKOUT HISTORY';

  @override
  String get clientTrainerNotesHint => 'Injuries, specifics, plan…';

  @override
  String get trainerSessionDefaultTitle => 'Workout';

  @override
  String get durationMinutesShort => 'min';

  @override
  String get addTraining => 'ADD WORKOUT';

  @override
  String get repeatLastWorkout => 'Repeat last workout';

  @override
  String get repeatLastUnavailable =>
      'This client has no previous workout to repeat.';

  @override
  String get editPlan => 'Edit plan';

  @override
  String get trainerSessionEmpty => 'Not planned yet';

  @override
  String trainerSessionPlanned(int n) {
    return '$n planned';
  }

  @override
  String get trainerClientsEmpty =>
      'No clients yet. Add someone to start scheduling.';

  @override
  String get clientNeverTrained => 'No workouts yet';

  @override
  String get clientNoUpcoming => 'No upcoming session';

  @override
  String clientLastSession(String when) {
    return 'Last: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Next: $when';
  }

  @override
  String get clientSessionToday => 'today';

  @override
  String get clientSessionYesterday => 'yesterday';

  @override
  String get clientSessionTomorrow => 'tomorrow';

  @override
  String clientSessionDaysAgo(int n) {
    return '$n days ago';
  }

  @override
  String clientSessionInDays(int n) {
    return 'in $n days';
  }

  @override
  String get clientProfileDetails => 'Profile';

  @override
  String get addSessionPickClient => 'Select a client';

  @override
  String get clientLabel => 'Client';

  @override
  String get deleteClientBtn => 'DELETE CLIENT';

  @override
  String get clientsMenu => 'CLIENTS';

  @override
  String get dateHeader => 'Date';

  @override
  String get clientHeader => 'Client';

  @override
  String get exerciseHeader => 'Exercise';

  @override
  String get typeHeader => 'Type';

  @override
  String get strengthType => 'Strength';

  @override
  String get cardioType => 'Cardio';

  @override
  String get weightHeader => 'Weight';

  @override
  String get weightUnitsChoiceShort => 'kg / lb';

  @override
  String get progressChartWeightLegend => 'Weight — kg / lb (your choice)';

  @override
  String get progressChartVolumeLegend => 'Volume (tonnage)';

  @override
  String get repsHeader => 'Reps';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'Time (min)';

  @override
  String get intensityHeader => 'Intensity';

  @override
  String get setHeader => 'Set';

  @override
  String get strength => 'Strength';

  @override
  String get cardio => 'Cardio';

  @override
  String get timeMin => 'Time (min)';

  @override
  String get intensity => 'Intensity';

  @override
  String get reserve => 'Reserve';

  @override
  String get sets => 'Sets';

  @override
  String get time => 'Time';

  @override
  String get rest => 'Rest';

  @override
  String get settings => 'Settings';

  @override
  String get max => 'Max';

  @override
  String get totalVolume => 'Total volume';

  @override
  String get chart => 'Chart';

  @override
  String get progress => 'Progress';

  @override
  String get dayMonday => 'Monday';

  @override
  String get dayTuesday => 'Tuesday';

  @override
  String get dayWednesday => 'Wednesday';

  @override
  String get dayThursday => 'Thursday';

  @override
  String get dayFriday => 'Friday';

  @override
  String get daySaturday => 'Saturday';

  @override
  String get daySunday => 'Sunday';

  @override
  String get greetingHi => 'Hi';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String get monthJanuary => 'January';

  @override
  String get monthFebruary => 'February';

  @override
  String get monthMarch => 'March';

  @override
  String get monthApril => 'April';

  @override
  String get monthMay => 'May';

  @override
  String get monthJune => 'June';

  @override
  String get monthJuly => 'July';

  @override
  String get monthAugust => 'August';

  @override
  String get monthSeptember => 'September';

  @override
  String get monthOctober => 'October';

  @override
  String get monthNovember => 'November';

  @override
  String get monthDecember => 'December';

  @override
  String get exerciseBenchPress => 'Bench press';

  @override
  String get exerciseSquat => 'Squat';

  @override
  String get exerciseRow => 'Row';

  @override
  String get exerciseDeadlift => 'Deadlift';

  @override
  String get exerciseOverheadPress => 'Overhead press';

  @override
  String get exercisePullUp => 'Pull-up';

  @override
  String get exerciseLunges => 'Lunges';

  @override
  String get exercisePlank => 'Plank';

  @override
  String get saveWorkout => 'SAVE WORKOUT';

  @override
  String get deleteWorkout => 'DELETE WORKOUT';

  @override
  String get deleteTraining => 'Delete workout';

  @override
  String get deleteTrainingQuestion => 'Delete this workout from schedule?';

  @override
  String get addSetButton => 'Add set';

  @override
  String get progressButton => 'Progress';

  @override
  String get filterMonth => 'Month';

  @override
  String get filterYear => 'Year';

  @override
  String get filterAllTime => 'All time';

  @override
  String get noteLabel => 'NOTE:';

  @override
  String get addClient => 'ADD CLIENT';

  @override
  String get workoutsToday => 'TODAY\'S WORKOUTS';

  @override
  String get workoutNumberPrefix => 'Workout #';

  @override
  String get noEntries => 'No entries';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Privacy policy';

  @override
  String get instructionButton => 'GUIDE';

  @override
  String get instructionTitle => 'How it works';

  @override
  String get instructionPhilosophy =>
      'IronVibe deliberately ships without a built-in exercise catalog or preset \"programs.\" It is not here to teach you how to train—YouTube and real coaches already do that—but to help you keep stats exactly the way you like. You type exercise names yourself, in your own words. Optionally tag a muscle group so the app can assemble a quick full-body session from your own list. The longer you use it, the more it feels like home: the app learns your habits and adapts to you, not the other way around.';

  @override
  String get instructionSectionSetControl => 'Set controls';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Removes the last set. If that row already has weight, reps, or RIR, the app asks for confirmation. An empty row is removed right away. If only one set remains: in the current workout the row is cleared; in saved history the whole exercise is deleted.';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Adds a new empty set row to this exercise.';

  @override
  String get instructionSetProgressLabel => 'Timeline';

  @override
  String get instructionSetProgressDesc =>
      'Opens the progress timeline for this exercise.';

  @override
  String get instructionSectionProgressChart => 'Progress chart';

  @override
  String get instructionProgressChartIntro =>
      'Three independent trends by date: red — heaviest single set that day; cyan — most reps in any single set that day; yellow — exercise volume (sum of weight × reps for that day). Left axis: weight; right axis: reps; yellow is shown as a normalized trend.';

  @override
  String get instructionProgressLineWeightLabel => 'Weight';

  @override
  String get instructionProgressLineWeightDesc =>
      'Red line: maximum weight in one set on each calendar day.';

  @override
  String get instructionProgressLineRepsLabel => 'Reps';

  @override
  String get instructionProgressLineRepsDesc =>
      'Cyan line: maximum reps in one set that day (not tied to the heaviest weight).';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Yellow line: daily exercise volume (tonnage), calculated as the sum of weight × reps for sets where both values are logged.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'During an active workout, the chart button under the sets may tint in the same colors as the graph: red if you beat your previous best weight in a single set; yellow if total exercise volume beats your past best for that movement; cyan if the exercise is bodyweight-only and your total reps (sum across all sets) beat your past best. If several apply, priority is red, then yellow, then cyan. The tint appears only while you are logging the current workout—not in saved history.';

  @override
  String get instructionSectionWorkout => 'Workout';

  @override
  String get instructionAddExerciseTitle => 'Add exercise';

  @override
  String get instructionAddExerciseBody =>
      'Adds a new block. Name the current exercise first — the app will remind you if that field is still empty.';

  @override
  String get instructionSectionExerciseNameTools => 'Exercise name';

  @override
  String get instructionRenameExerciseTitle => 'Long press to rename';

  @override
  String get instructionRenameExerciseDesc =>
      'Long-press the exercise name while logging a workout, on a suggestion in the dropdown, or on the title in a saved workout in history to rename that exercise everywhere.';

  @override
  String get instructionRemoveFromBankTitle => 'Remove from your list';

  @override
  String get instructionRemoveFromBankDesc =>
      'When the suggestions list is open under the name field, tap the X on a row — or the red X in Personal Progress — to remove that name from suggestions and the progress table. Saved workouts stay unchanged.';

  @override
  String get instructionSectionInputs => 'Data fields';

  @override
  String get instructionWeightTitle => 'Weight';

  @override
  String get instructionWeightBody =>
      'Load on the bar or equipment. Type the number in kg or lb — whichever you use. The app does not convert units.';

  @override
  String get instructionRepsTitle => 'Reps';

  @override
  String get instructionRepsBody =>
      'How many times you completed the movement in one set.';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody =>
      'How many more reps you could still do before failure. Helps track intensity.';

  @override
  String get instructionOneRmTitle => '1RM (one-rep max)';

  @override
  String get instructionOneRmDesc =>
      'Estimated maximum weight for one full repetition from your current weight and reps. A key strength benchmark for tracking progress and picking working weights.';

  @override
  String get instructionExerciseVolumeTitle => 'Exercise volume (total)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Next to the progress (chart) button under the sets: total tonnage for this exercise—the sum of weight × reps for every set that has both values. Updates live as you add or edit sets.';

  @override
  String get instructionSectionPersonalProgress => 'Personal progress';

  @override
  String get instructionPersonalProgressIntro =>
      'One table of every movement from saved workouts: best set, estimated 1RM, and max volume. Search to find a name. Star favorites; tap the small chip under the name to tag a muscle group; the red X removes the name from suggestions and this table (saved workouts stay). Open it from your training menu or a client profile.';

  @override
  String get instructionSectionSaving => 'Saving';

  @override
  String get instructionFinishTitle => 'Finish workout';

  @override
  String get instructionFinishBody =>
      'Confirms and writes the session to history. If you leave earlier, you can save, discard, or stay. A draft is also kept automatically if the app is interrupted.';

  @override
  String get instructionSectionCardio => 'Cardio & intensity';

  @override
  String get instructionCardioTitle => 'Cardio';

  @override
  String get instructionCardioBody =>
      'Tracks time and intensity for cardio (distance is not entered). Helps you keep pace and monitor effort.';

  @override
  String get instructionIntensityTitle => 'Intensity';

  @override
  String get instructionIntensityBody =>
      'Use the effort scale to gauge how hard the workout felt. That is the key to progress without overtraining.';

  @override
  String get instructionSectionStopwatch => 'Stopwatch (your assistant)';

  @override
  String get instructionStopwatchWhyTitle => 'Why use it?';

  @override
  String get instructionStopwatchWhyBody =>
      'To control rest between sets. Short rest — higher density; long rest — more strength for heavy weight.';

  @override
  String get instructionStopwatchHowTitle => 'How does it work?';

  @override
  String get instructionStopwatchHowBody =>
      'Center: time, Play/Pause, and Reset. Left and right: quick presets (below). In plain stopwatch mode time runs up with centiseconds. The timer stays pinned in the header while you scroll.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Left: intervals';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 s work, 60 s rest. 4/4 — 4 minutes work and 4 minutes rest each round. 20/10 — Tabata-style: 20 s on, 10 s off. After you pick one, the timer loops work and rest until you pause or reset. Red tint means work; blue means rest.';

  @override
  String get instructionStopwatchRestTitle => 'Right: rest countdown';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m, and +5m start or extend a normal minute countdown. If an interval loop was running, it switches to this countdown. If a countdown is already running, the minutes are added to the time left. Handy for rest between sets.';

  @override
  String get instructionStopwatchProgressTitle => 'Progress bar';

  @override
  String get instructionStopwatchProgressBody =>
      'During countdown and interval modes, a bar under the time shows how much of the current phase remains.';

  @override
  String get instructionStopwatchSoundsTitle => 'Sound & haptics';

  @override
  String get instructionStopwatchSoundsBody =>
      'At 3, 2, and 1 seconds left in a phase, a short in-app sound and light haptic play. When the phase ends or work/rest switches, a stronger cue and haptic follow. Sounds are minimal bundled clips—no microphone, no notification permission; media/system volume still affects loudness.';

  @override
  String get instructionSectionNavHistory => 'History & data';

  @override
  String get instructionNavHistoryTitle => 'History / statistics';

  @override
  String get instructionNavHistoryDesc =>
      'In calendar/history each workout shows total tonnage. Workout volume is one of the best indicators of hypertrophy: the more quality volume you accumulate, the more muscle you can build.';

  @override
  String get instructionNavImportExportTitle => 'Import / export';

  @override
  String get instructionNavImportExportDesc =>
      'Back up or transfer your data using JSON export and import in the statistics dialog. Backups include workout history, your exercise list, favorites, and muscle-group tags. Coach backups are separate from personal history. A coach can also import an athlete\'s history as a new client without mixing exercise names.';

  @override
  String get instructionSectionHome => 'Home';

  @override
  String get instructionThemeTitle => 'Theme';

  @override
  String get instructionThemeDesc =>
      'The sun / moon switch on the home screen toggles light and dark. Your choice is remembered.';

  @override
  String get instructionTrainSelfTitle => 'I train myself';

  @override
  String get instructionTrainSelfDesc =>
      'Your own workouts, calendar, personal progress, favorites, a rhythm gauge of how often you train, and a full-body quick workout built from your tagged exercises.';

  @override
  String get instructionTrainOthersTitle => 'I train others';

  @override
  String get instructionTrainOthersDesc =>
      'Coach mode: clients, a schedule, and a separate history per person. Each client has their own progress table and favorites.';

  @override
  String get instructionSectionAthleteMenu => 'Your training';

  @override
  String get instructionStartWorkoutTitle => 'Start workout';

  @override
  String get instructionStartWorkoutDesc =>
      'Opens an empty session — it does not copy the last workout. Add exercises, log sets, then finish to save.';

  @override
  String get instructionQuickWorkoutTitle => 'Quick workout';

  @override
  String get instructionQuickWorkoutDesc =>
      'Assembles a 4-exercise full-body session: chest, back, one leg movement (front or rear thigh — never both), and one accessory for shoulders, arms, or core, whichever you have trained least recently. Prefers favorites. Last weights and reps appear greyed as a target to beat — you log each set yourself.';

  @override
  String get instructionCalendarMenuTitle => 'Workout calendar';

  @override
  String get instructionCalendarMenuDesc =>
      'See which days you trained, open a saved session, or add a workout on a chosen date and time — including past days.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'A table of your best sets, estimated 1RM, and max volume. Star favorites and tag muscle groups here.';

  @override
  String get instructionFavoritesMenuTitle => 'Favorite exercises';

  @override
  String get instructionFavoritesMenuDesc =>
      'Your starred list. Tick the ones you want and tap Build workout to start a session in that order. Last weights and reps appear greyed as a target to beat.';

  @override
  String get instructionSectionRhythm => 'Training rhythm';

  @override
  String get instructionRhythmIntro =>
      'After a few strength sessions, a gauge appears at the top of your training screen. It shows how many days per week you have trained on average over the last four weeks. Cardio-only days are not counted. The number is a snapshot of your density — not a target the app expects you to hit. Tap it for a note about your pace and what an active recovery week can look like.';

  @override
  String get instructionRhythmGaugeTitle => 'Days per week';

  @override
  String get instructionRhythmGaugeDesc =>
      'The arc fills from 1 to 6 days per week. Color moves from steel through gold toward rust as density rises. The gauge appears once you have at least three strength days in that four-week window.';

  @override
  String get instructionRhythmDeloadTitle => 'Active recovery week reminder';

  @override
  String get instructionRhythmDeloadDesc =>
      'If you have been training about two and a half days a week or more for several weeks without an active recovery week, the app may remind you that a short active recovery week is sometimes useful — about 30% less tonnage and reps. The more days per week, the sooner that reminder. It is a reminder, not a prescription. You will see it at most once per week, and only in your own training mode — not automatically for clients. Tap a client\'s gauge for the same note.';

  @override
  String get instructionSectionFavorites => 'Favorites';

  @override
  String get instructionFavoriteStarTitle => 'Star';

  @override
  String get instructionFavoriteStarDesc =>
      'In Personal Progress, tap the star next to an exercise to add or remove it from favorites. Favorites stay at the top of the table.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Build workout';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'On the favorites screen, tick the exercises you want. The button appears when at least one is selected. Last weights and reps appear greyed as a target to beat — you log each set yourself. For a client, the same action starts a session for that person.';

  @override
  String get instructionSectionMuscleGroups => 'Muscle groups & quick workout';

  @override
  String get instructionMuscleGroupsIntro =>
      'Groups are optional labels you attach to your own exercise names. They are not a catalog: they only help Quick workout pick a balanced full-body mix. Eight groups: chest, back, shoulders, core, front thigh, rear thigh, arm curl, arm extension.';

  @override
  String get instructionMuscleGroupTagTitle => 'How to tag';

  @override
  String get instructionMuscleGroupTagDesc =>
      'When you first enter a new exercise name, the app asks for a group. You can skip with Later, or mark Not for quick workout if you do not want that movement in a full-body mix. Tap the small chip under the name in Personal Progress or Favorites to change or clear it.';

  @override
  String get instructionQuickWorkoutHowTitle => 'How a quick session is built';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Four slots: chest, back, one half of the legs, then shoulders/arms/core by recency. A preview lets you swap any slot for another exercise in the same group. Add more yourself if you want a longer session.';

  @override
  String get instructionStrengthCardioTitle => 'Strength / Cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Switch at the top of the session. Strength: weight, reps, RIR. Cardio: time and intensity only — no distance field.';

  @override
  String get instructionPreviousHintsTitle => 'Grey last-session numbers';

  @override
  String get instructionPreviousHintsDesc =>
      'When you pick an exercise in a client session, a quick workout, or a session built from favorites, last logged weights and reps show as grey placeholders — a minimum to beat, not a finished set. Only numbers you type are saved to history.';

  @override
  String get instructionRemoveExerciseTitle => 'Remove from this workout';

  @override
  String get instructionRemoveExerciseDesc =>
      'Removes that block from the current session only. Saved history is not affected until you finish.';

  @override
  String get instructionReassignExerciseTitle => 'Change exercise in history';

  @override
  String get instructionReassignExerciseDesc =>
      'In a saved workout you can reassign a block to a different name. Only that session changes; charts follow the new name. Sets stay as they were.';

  @override
  String get instructionAutoSaveTitle => 'Interrupted workout';

  @override
  String get instructionAutoSaveDesc =>
      'If the app closes mid-session, it offers to continue where you left off or delete the unsaved draft.';

  @override
  String get instructionSectionCalendar => 'Calendar';

  @override
  String get instructionCalendarAddTitle => 'Add on a date';

  @override
  String get instructionCalendarAddDesc =>
      'Pick a day, then add a workout at a chosen time. Useful for logging a missed session.';

  @override
  String get instructionSectionTrainer => 'Coach mode';

  @override
  String get instructionTrainerIntro =>
      'I train others is for coaches. Add clients, schedule sessions, plan exercises ahead of time, and log workouts per person. Repeating the last session is optional. Export and import for coach data is separate from your personal history. Deleting a client removes future sessions but keeps past workouts for reporting.';

  @override
  String get instructionClientsTitle => 'Clients';

  @override
  String get instructionClientsDesc =>
      'Add, edit, or delete clients. The list shows the last and next session. Profile fields: goal, weight, height, and private coach notes.';

  @override
  String get instructionClientProfileTitle => 'Client profile';

  @override
  String get instructionClientProfileDesc =>
      'Start today\'s session from the profile: an empty live workout. Grey last-session numbers appear only after you pick an exercise. History lists completed workouts only. Plan future sessions on the calendar. Progress and favorites are on the same screen. When there is enough recent strength work, a rhythm gauge shows how often they train; tap it for a note about pace and rest. Unsaved profile edits ask before you leave.';

  @override
  String get instructionTrainerPlanTitle => 'Plan a session';

  @override
  String get instructionTrainerPlanDesc =>
      'Plan only from the coach calendar: pick a client and date, then name exercises. Previous weights and reps appear grey as a hint. A planned session shows a play icon. Tap it to start (today) or delete. Only finished workouts go to history. A plan whose date has already passed is removed.';

  @override
  String get instructionTrainerRepeatTitle => 'Repeat last workout';

  @override
  String get instructionTrainerRepeatDesc =>
      'Optional. From the client profile, or as a switch when adding a session on the calendar. Copies the last session\'s exercises into today\'s live workout or a new plan; previous weights and reps show as grey hints, not as finished sets.';

  @override
  String get printSession => 'Print';

  @override
  String get printSessionEmpty => 'Nothing to print yet. Log at least one set.';

  @override
  String get printSessionShareText => 'IronVibe session';

  @override
  String get instructionPrintSessionTitle => 'Print a session';

  @override
  String get instructionPrintSessionDesc =>
      'On a finished client workout, the print icon in the header makes an A4 sheet of that day as logged. Share, save, or print from the system sheet.';

  @override
  String get rhythmPerWeek => 'per week';

  @override
  String get deloadNudgeTitle => 'An active recovery week?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'You\'ve been training about $rate days a week for roughly $weeks weeks. This is a reminder that a short active recovery week is sometimes useful — about 30% less tonnage and reps. Not a prescription.';
  }

  @override
  String get deloadNudgeLater => 'Not now';

  @override
  String get deloadNudgeOk => 'Got it';

  @override
  String get backupNudgeTitle => 'Save a backup?';

  @override
  String get backupNudgeBody =>
      'Your data lives only on this device. If it is lost or storage fails, that history is gone. Share a copy now, or postpone for 28 days.';

  @override
  String get backupNudgeShare => 'Share';

  @override
  String get backupNudgeLater => 'Later';

  @override
  String get rhythmInsightTitle => 'Training rhythm';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'You\'ve trained about $rate days a week over the last four weeks.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name has trained about $rate days a week over the last four weeks.';
  }

  @override
  String get rhythmInsightWindow =>
      'Only strength days count. Cardio-only days are ignored. This is a snapshot of density, not a target.';

  @override
  String get rhythmInsightWhatTitle => 'Active recovery week';

  @override
  String get rhythmInsightWhatBody =>
      'A week of deliberately lighter work so you recover without losing fitness: same sessions, about 30–50% less volume. Or skip strength days and stay moving.';

  @override
  String get rhythmInsightAdviceLight =>
      'Right now the rhythm is easy. If sessions are not extremely hard, you can go a long time without a planned active recovery week.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Right now this is a steady rhythm. If the work is hard, an active recovery week every few months is often enough.';

  @override
  String get rhythmInsightAdviceDense =>
      'Right now this is a dense schedule. If sessions are intense, an active recovery week every two to three months is often worth keeping in mind.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Right now this is nearly every day. If the load is high, an active recovery week about once a month is a common way to stay durable.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Well done. This is the kind of rhythm long progress is built on.';

  @override
  String get rhythmInsightPraiseDense => 'Truly dedicated. Keep it up.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Looks like you\'re trying to unlock the secret capabilities of your body.';

  @override
  String get rhythmInsightRecentLighter =>
      'An active recovery week already shows up in the recent data.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    return 'About $weeks weeks at this density without an active recovery week.';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'This is a reference note, not a prescription. It only flags that a short active recovery week can help. If you feel fine, you can leave things as they are.';

  @override
  String get instructionHubManifest =>
      'No built-in catalog or preset programs. You name exercises yourself; the app keeps stats your way.';

  @override
  String get instructionChapterStartTitle => 'Getting started';

  @override
  String get instructionChapterStartBlurb =>
      'Home screen, how you train, and why the app stays out of your way.';

  @override
  String get instructionChapterToolsTitle => 'Training tools';

  @override
  String get instructionChapterToolsBlurb =>
      'Rhythm gauge, favorites, muscle tags, and quick workout.';

  @override
  String get instructionChapterSessionTitle => 'In session';

  @override
  String get instructionChapterSessionBlurb =>
      'Logging sets, fields, cardio, saving, and the stopwatch.';

  @override
  String get instructionChapterProgressTitle => 'Progress and data';

  @override
  String get instructionChapterProgressBlurb =>
      'Personal records, the chart, calendar, history, and backup.';

  @override
  String get instructionChapterCoachTitle => 'Coach mode';

  @override
  String get instructionChapterCoachBlurb =>
      'Clients, profiles, planned sessions, and repeating a workout.';

  @override
  String get instructionSearchHint => 'Search the guide';

  @override
  String get instructionSearchEmpty => 'Nothing matches that search.';
}
