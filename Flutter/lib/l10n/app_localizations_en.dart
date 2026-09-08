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
  String get instructionHubManifest =>
      'No exercise catalog and no ready-made programs. You name movements in your own words — the app keeps stats on them.';

  @override
  String get instructionSearchHint => 'Search the guide';

  @override
  String get instructionSearchEmpty => 'Nothing found.';

  @override
  String get instructionChapterStartTitle => 'Getting started';

  @override
  String get instructionChapterStartBlurb =>
      'Home screen, the two modes, and how the app thinks.';

  @override
  String get instructionChapterSessionTitle => 'During a workout';

  @override
  String get instructionChapterSessionBlurb =>
      'Sets, weight, reps, RIR, cardio, and finishing a session.';

  @override
  String get instructionChapterTimerTitle => 'Stopwatch';

  @override
  String get instructionChapterTimerBlurb =>
      'Intervals, rest between sets, and cues.';

  @override
  String get instructionChapterExercisesTitle => 'Exercises and groups';

  @override
  String get instructionChapterExercisesBlurb =>
      'Your movement list, muscle groups, favorites, and the quick workout.';

  @override
  String get instructionChapterProgressTitle => 'Progress and records';

  @override
  String get instructionChapterProgressBlurb =>
      'Personal progress, 1RM, tonnage, and the exercise chart.';

  @override
  String get instructionChapterRhythmTitle => 'Rhythm and recovery';

  @override
  String get instructionChapterRhythmBlurb =>
      'The weekly rhythm gauge and the deload week.';

  @override
  String get instructionChapterDataTitle => 'History and data';

  @override
  String get instructionChapterDataBlurb =>
      'Calendar, editing records, statistics, and backup.';

  @override
  String get instructionChapterCoachTitle => 'Coach mode';

  @override
  String get instructionChapterCoachBlurb =>
      'Clients, schedule, session plan, and print.';

  @override
  String get instructionPhilosophy =>
      'IronVibe does not teach you how to train and does not hand you ready-made programs — that is what a coach and your own experience are for. There is no catalog of thousands of exercises: you type movement names in your own words, and the app quietly does the counting. Everything stays on the device: no accounts, no subscriptions, no ads.';

  @override
  String get instructionSectionHome => 'Home';

  @override
  String get instructionThemeTitle => 'Theme';

  @override
  String get instructionThemeDesc =>
      'The sun–moon switch changes light and dark. Your choice is remembered.';

  @override
  String get instructionTrainSelfTitle => 'I train myself';

  @override
  String get instructionTrainSelfDesc =>
      'Your space: workouts, calendar, personal progress, favorites, and the rhythm gauge.';

  @override
  String get instructionTrainOthersTitle => 'I train others';

  @override
  String get instructionTrainOthersDesc =>
      'Coach mode: clients, a schedule, and a separate history for each person. It never mixes with your own training.';

  @override
  String get instructionLanguageTitle => 'Language';

  @override
  String get instructionLanguageDesc =>
      'The app follows the system language — there is no separate setting. Ten languages are supported.';

  @override
  String get instructionHomeLinksTitle => 'Version and contact';

  @override
  String get instructionHomeLinksDesc =>
      'At the bottom of the home screen: version number, website, Telegram, support email, and the privacy policy.';

  @override
  String get instructionSectionAthleteMenu => 'Your training';

  @override
  String get instructionStartWorkoutTitle => 'Start workout';

  @override
  String get instructionStartWorkoutDesc =>
      'Opens an empty session — the last workout is not copied. Add exercises, log sets, then finish to save.';

  @override
  String get instructionQuickWorkoutTitle => 'Quick workout';

  @override
  String get instructionQuickWorkoutDesc =>
      'Builds a full-body session from four exercises using your muscle-group tags.';

  @override
  String get instructionCalendarMenuTitle => 'Workout calendar';

  @override
  String get instructionCalendarMenuDesc =>
      'The days you trained. Open saved sessions here, or add one you missed.';

  @override
  String get instructionSectionPersonalProgress => 'Personal progress';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'A table of best sets, estimated 1RM, and max volume for every movement.';

  @override
  String get instructionFavoritesMenuTitle => 'Favorite exercises';

  @override
  String get instructionFavoritesMenuDesc =>
      'Movements marked with a star. Build a workout from them in a couple of taps.';

  @override
  String get instructionSectionWorkout => 'Session';

  @override
  String get instructionStrengthCardioTitle => 'Strength or cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'The switch at the top of the session sets the workout type. Strength: weight, reps, and RIR. Cardio: time and intensity. If the other type is already logged, the app asks before switching.';

  @override
  String get instructionAddExerciseTitle => 'Add exercise';

  @override
  String get instructionAddExerciseBody =>
      'A new block is added once the current exercise has a name and at least one completed set.';

  @override
  String get instructionPreviousHintsTitle => 'Grey hints';

  @override
  String get instructionPreviousHintsDesc =>
      'Last time\'s weight and reps show in grey — a target to beat, not a logged set. Only numbers you type yourself go into history.';

  @override
  String get instructionRemoveExerciseTitle => 'Remove exercise';

  @override
  String get instructionRemoveExerciseDesc =>
      'The red X removes the block from the current session. Saved history is not changed.';

  @override
  String get instructionSectionSetControl => 'Set row';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc => 'Adds an empty row for the next set.';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Removes the last set. An empty row is deleted at once; a filled one after confirmation. If only one set remains, the fields are simply cleared.';

  @override
  String get instructionSetProgressLabel => 'Exercise chart';

  @override
  String get instructionSetProgressDesc =>
      'Opens the trend for this movement over a month, a year, or all time.';

  @override
  String get instructionExerciseVolumeTitle => 'Exercise tonnage';

  @override
  String get instructionExerciseVolumeDesc =>
      'To the right of the chart button: the sum of weight × reps across every completed set. Updates as you type.';

  @override
  String get instructionSectionInputs => 'What the fields mean';

  @override
  String get instructionWeightTitle => 'Weight';

  @override
  String get instructionWeightBody =>
      'Working load on the bar or machine. Enter kilograms or pounds — the app does not convert units and does not force a choice.';

  @override
  String get instructionRepsTitle => 'Reps';

  @override
  String get instructionRepsBody => 'How many repetitions you did in the set.';

  @override
  String get instructionRirTitle => 'RIR — reps in reserve';

  @override
  String get instructionRirBody =>
      'How many more reps you could have done. 0 is work to failure, ∞ is a warm-up set. A simple way to dose intensity.';

  @override
  String get instructionOneRmTitle => '1RM — one-rep max';

  @override
  String get instructionOneRmDesc =>
      'An estimated max for a single repetition, using the Epley formula from that set\'s weight and reps. Shown under the row — a key strength landmark.';

  @override
  String get instructionSectionCardio => 'Cardio';

  @override
  String get instructionCardioTitle => 'Time';

  @override
  String get instructionCardioBody =>
      'Block duration in minutes. No distance and no heart rate: the app is not tied to trackers.';

  @override
  String get instructionIntensityTitle => 'Intensity';

  @override
  String get instructionIntensityBody =>
      'Effort from 1 to 5 — a simplified RPE scale. In a cardio session, one row is saved per exercise.';

  @override
  String get instructionSectionSaving => 'Finishing';

  @override
  String get instructionFinishTitle => 'Finish workout';

  @override
  String get instructionFinishBody =>
      'The button at the bottom of the session: the app confirms, then writes the workout to history. You need at least one completed set.';

  @override
  String get instructionLeaveWorkoutTitle => 'Leaving early';

  @override
  String get instructionLeaveWorkoutDesc =>
      'If you close a session that already has data, you can stay, save what you logged, or delete the draft.';

  @override
  String get instructionAutoSaveTitle => 'Interrupted workout';

  @override
  String get instructionAutoSaveDesc =>
      'A draft is saved on its own — every minute and when you background the app. Next launch, you can continue from the same place or delete it.';

  @override
  String get instructionScreenAwakeTitle => 'Screen stays on';

  @override
  String get instructionScreenAwakeDesc =>
      'During a live session the screen stays awake, so you do not unlock the phone after every set.';

  @override
  String get instructionStopwatchWhyTitle => 'Why time rest';

  @override
  String get instructionStopwatchWhyBody =>
      'The pause between sets is a working parameter, same as weight and reps: short rest raises density, long rest lets you hit a heavy set.';

  @override
  String get instructionStopwatchHowTitle => 'Start, pause, reset';

  @override
  String get instructionStopwatchHowBody =>
      'The timer is pinned in the session header and stays visible as you scroll. Time and controls sit in the center; in normal mode it counts up, including hundredths of a second.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Left: intervals';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — a minute of work and a minute of rest. 4/4 — four minutes each. 20/10 — Tabata. Phases loop until you pause or reset: red tint is work, blue is rest.';

  @override
  String get instructionStopwatchRestTitle => 'Right: rest';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m, and +5m start a countdown between sets. If a countdown is already running, minutes are added to the remaining time; an interval loop switches to rest.';

  @override
  String get instructionStopwatchProgressTitle => 'Phase bar';

  @override
  String get instructionStopwatchProgressBody =>
      'In countdown and interval modes, a bar under the digits shows how much of the current phase is left.';

  @override
  String get instructionStopwatchSoundsTitle => 'Sound and haptics';

  @override
  String get instructionStopwatchSoundsBody =>
      'Three, two, and one seconds before a phase ends — a short click and a light vibration; the phase change is louder. Sounds are built into the app: no microphone, no notification permission. Volume follows the phone settings.';

  @override
  String get instructionExerciseBankIntro =>
      'The exercise list grows on its own: every new name from a finished workout joins the suggestions. Names are stored in uppercase so the same movement never splits in two.';

  @override
  String get instructionSectionExerciseNameTools => 'Names';

  @override
  String get instructionRenameExerciseTitle => 'Rename everywhere';

  @override
  String get instructionRenameExerciseDesc =>
      'Long-press the name — in a session, in the suggestion list, or in a saved workout. It updates across history and on the charts.';

  @override
  String get instructionRemoveFromBankTitle => 'Remove from suggestions';

  @override
  String get instructionRemoveFromBankDesc =>
      'The X in the open suggestion list, or the red X in personal progress, drops the name from suggestions and from the table. Saved workouts stay untouched.';

  @override
  String get instructionReassignExerciseTitle => 'Reassign in a record';

  @override
  String get instructionReassignExerciseDesc =>
      'In a saved workout you can point a block at a different movement. The sets stay as they were, but they move into the new name\'s stats — only this session changes.';

  @override
  String get instructionSectionMuscleGroups => 'Muscle groups';

  @override
  String get instructionMuscleGroupsIntro =>
      'A group is an optional tag on your name. It is used only by the quick workout, to build a balanced full-body session. Eight groups: chest, back, shoulders, core, front thigh, rear thigh, arm curl, arm extension.';

  @override
  String get instructionMuscleGroupTagTitle => 'How to tag';

  @override
  String get instructionMuscleGroupTagDesc =>
      'The first time you enter a new name, the app asks for a group. You can answer Later, or Not for quick workout if the movement should stay out of the mix. The chip under the name in personal progress and favorites is easy to change or clear.';

  @override
  String get instructionSectionFavorites => 'Favorites';

  @override
  String get instructionFavoriteStarTitle => 'Star';

  @override
  String get instructionFavoriteStarDesc =>
      'The star is on the exercise card in a session and in the personal progress table. Favorites stay at the top of the list.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Build workout';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'On the favorites screen, tick the movements you want — the button appears at once. The session opens in that order, with grey hints from last time. For a client, the same action opens their workout.';

  @override
  String get instructionSectionQuickWorkout => 'Quick workout';

  @override
  String get instructionQuickWorkoutHowTitle => 'Four slots';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Chest, back, one half of the legs (front or rear thigh — never both on the same day), and one movement for shoulders, arms, or core. In each slot the app picks the group that has gone longest without work, and prefers a favorite.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Preview and swap';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'You see the full line-up before you start: any slot can be swapped for another exercise from the same group. If there are not enough tagged movements, the app says so and opens personal progress so you can add tags.';

  @override
  String get instructionPersonalProgressIntro =>
      'One table of every movement from saved workouts. Favorites on top, the rest alphabetically; search finds a name. Open it from the training menu or from a client profile.';

  @override
  String get instructionProgressBestSetTitle => 'Best set';

  @override
  String get instructionProgressBestSetDesc =>
      'The set with the highest estimated 1RM across your history. For movements without weight, it is the set with the most reps.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Max volume';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'The largest tonnage for this exercise in a single workout — a useful anchor when you plan working volume.';

  @override
  String get instructionSectionProgressChart => 'Exercise chart';

  @override
  String get instructionProgressChartIntro =>
      'Three independent curves by date. Left axis is weight, right axis is reps; the yellow line is normalized so the trends can be compared by shape. Switch the window — month, year, all time — and tap a point for that day\'s numbers. Cardio does not appear on the chart.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Red — heaviest weight in one set that day.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Cyan — most reps in a set, not necessarily with the heaviest weight.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Yellow — daily tonnage: the sum of weight × reps for sets where both fields are filled.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'In a live workout the chart button lights up when you beat a record: red for set weight, yellow for exercise tonnage, cyan for total reps on movements without weight. If more than one applies, red wins, then yellow, then cyan. Saved history has no highlight.';

  @override
  String get instructionRhythmIntro =>
      'Once you have at least three strength days in the last four weeks, a rhythm gauge appears at the top of the training screen. It is not a goal and not a grade — just how often you currently get to the gym.';

  @override
  String get instructionRhythmGaugeTitle => 'Days per week';

  @override
  String get instructionRhythmGaugeDesc =>
      'The arc fills from one to six days — a four-week average. Days with strength work count; cardio-only days do not. The denser the rhythm, the further the color moves from steel through gold toward rust.';

  @override
  String get instructionRhythmInsightTitle => 'Rhythm breakdown';

  @override
  String get instructionRhythmInsightDesc =>
      'Tap the gauge: the app names your mode — an easy rhythm, a steady rhythm, a dense rhythm, or almost no days off — and explains what that means for recovery. A client\'s gauge opens the same breakdown.';

  @override
  String get instructionRhythmDeloadTitle => 'Deload week';

  @override
  String get instructionRhythmDeloadDesc =>
      'A deload is not a pause — it is a week at half power: working weights and set counts down 30–50%, or cardio only. Muscle recovers faster than ligaments, tendons, and joints — this week lets them catch up.';

  @override
  String get instructionRhythmNudgeTitle => 'Reminder';

  @override
  String get instructionRhythmNudgeDesc =>
      'If you hold two and a half sessions a week or more and have not deloaded in a while, the app suggests taking such a week. The denser the rhythm, the sooner the hint appears. It shows at most once a week, in personal mode only — and it stays a recommendation, not medical advice.';

  @override
  String get instructionSectionCalendar => 'Calendar and history';

  @override
  String get instructionCalendarBrowseTitle => 'How to browse';

  @override
  String get instructionCalendarBrowseDesc =>
      'Swipe to change months; tap the month name for a quick date picker. A dot under a day means there was a workout.';

  @override
  String get instructionCalendarAddTitle => 'Backdated entry';

  @override
  String get instructionCalendarAddDesc =>
      'Pick a day, set a time, and add a workout — including a date already past. Handy if you forgot to log the session.';

  @override
  String get instructionNavHistoryTitle => 'Workout tonnage';

  @override
  String get instructionNavHistoryDesc =>
      'Every saved session shows total tonnage. Volume is one of the most reliable hypertrophy landmarks: what matters is not a single-day record, but how it holds from week to week.';

  @override
  String get instructionHistoryEditTitle => 'Editing records';

  @override
  String get instructionHistoryEditDesc =>
      'A saved workout can be expanded and edited: add an exercise or a set, change the numbers, or delete the session. Changes save immediately.';

  @override
  String get instructionSectionStats => 'Statistics';

  @override
  String get instructionStatsTitle => 'Workout summary';

  @override
  String get instructionStatsDesc =>
      'The chart icon in the header of the training or coach screen: how many sessions this month, this year, and all time. In coach mode it also breaks the count down per client.';

  @override
  String get instructionSectionBackup => 'Backup';

  @override
  String get instructionNavImportExportTitle => 'Export and import';

  @override
  String get instructionNavImportExportDesc =>
      'Export packs history, the exercise list, favorites, group tags, clients, and the schedule into one JSON file. Import merges the file into current data and skips duplicates — nothing is wiped. A coach backup is separate from a personal one.';

  @override
  String get instructionBackupNudgeTitle => 'Backup reminder';

  @override
  String get instructionBackupNudgeDesc =>
      'Data lives on this device only: no accounts, no cloud. Every four weeks the app offers to save a copy — if the phone is lost, history comes back only from that file.';

  @override
  String get instructionTrainerIntro =>
      'I train others is a separate space for working with people: clients, a schedule, and a history per person. Personal workouts and coach data never cross.';

  @override
  String get instructionClientsTitle => 'Clients';

  @override
  String get instructionClientsDesc =>
      'A list with the goal, last session, and next session. The card holds goal, weight, height, and private coach notes. The name is set at creation and cannot be changed later.';

  @override
  String get instructionClientProfileTitle => 'Client profile';

  @override
  String get instructionClientProfileDesc =>
      'Today\'s session starts here, along with progress, favorites, and history by month. If there are enough strength days, the rhythm gauge is here too. Deleting a client removes future sessions; past workouts stay for reporting.';

  @override
  String get instructionTrainerScheduleTitle => 'Schedule';

  @override
  String get instructionTrainerScheduleDesc =>
      'The coach calendar shows sessions for every client: a play icon means planned, a check means finished, an hourglass means today is in progress. Empty plans from past days are cleared on their own.';

  @override
  String get instructionTrainerPlanTitle => 'Session plan';

  @override
  String get instructionTrainerPlanDesc =>
      'For a future date you can lay out exercises and a note in advance and save without finishing the workout. Last weights and reps arrive as grey hints. Only finished sessions go into history.';

  @override
  String get instructionTrainerRepeatTitle => 'Repeat last';

  @override
  String get instructionTrainerRepeatDesc =>
      'From the client profile, or as a switch when adding a session on the calendar. The exercise list is copied; weights and reps come as grey hints, not as finished sets.';

  @override
  String get instructionPrintSessionTitle => 'Print a session';

  @override
  String get instructionPrintSessionDesc =>
      'On a finished workout, the print icon in the header builds an A4 sheet with that day\'s line-up and numbers. Then the system sheet: printer, PDF, or send to the client.';

  @override
  String get instructionImportAthleteTitle => 'Import an athlete\'s history';

  @override
  String get instructionImportAthleteDesc =>
      'A dedicated button in coach statistics: a file from personal mode becomes a new client, including favorites and group tags. Transferred workouts are marked as imported, and exercise names stay separate from yours.';

  @override
  String get printSession => 'Print';

  @override
  String get printSessionEmpty => 'Nothing to print yet. Log at least one set.';

  @override
  String get printSessionShareText => 'IronVibe session';

  @override
  String get rhythmPerWeek => 'per week';

  @override
  String get deloadNudgeTitle => 'An active recovery week?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'You\'ve been training about $rate days a week for roughly $weeks weeks. A good moment for an active recovery week: working weights and sets down 30–50%, or cardio only. This is a recommendation, not medical advice.';
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
    return 'You train about $rate times a week on average.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name trains about $rate times a week on average.';
  }

  @override
  String get rhythmInsightBandLight => 'An easy rhythm';

  @override
  String get rhythmInsightBandSteady => 'A steady rhythm';

  @override
  String get rhythmInsightBandDense => 'A dense rhythm';

  @override
  String get rhythmInsightBandVeryDense => 'Almost no days off';

  @override
  String get rhythmInsightHowTitle => 'Where this number comes from';

  @override
  String get rhythmInsightWindow =>
      'Average over the last four weeks. Days with strength work count; cardio-only days do not. This is not a goal and not a grade — just your current rhythm.';

  @override
  String get rhythmInsightWhatTitle => 'Active recovery week';

  @override
  String get rhythmInsightWhatBody =>
      'Not a pause — a week at half power: working weights and set counts down 30–50%. You can skip strength entirely and keep cardio or any other activity. Muscle recovers faster than joints, ligaments, and tendons — this week gives them time to catch up.';

  @override
  String get rhythmInsightPaceTitle => 'What this means';

  @override
  String get rhythmInsightAdviceLight =>
      'There are enough rest days between sessions that fatigue does not stack. No need to plan active recovery yet — at this rhythm the body recovers on its own.';

  @override
  String get rhythmInsightAdviceSteady =>
      'A steady rhythm you can live on for years. If the sessions are hard, take an active recovery week every few months — better early than after the weights stall.';

  @override
  String get rhythmInsightAdviceDense =>
      'Sessions sit close together, and fatigue builds quietly. An active recovery week every two or three months usually keeps progress better than grinding without a break.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Almost every day under load. That can work if sleep and food keep up. At this rhythm an active recovery week about once a month is ordinary care for joints and ligaments, not a cop-out.';

  @override
  String get rhythmInsightPraiseSteady =>
      'This is the rhythm people keep for years.';

  @override
  String get rhythmInsightPraiseDense =>
      'You train often — a schedule like that does not happen by itself.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Looks like you found the body\'s secret mode.';

  @override
  String get rhythmInsightRecentLighter =>
      'Load already dropped recently — active recovery can count as done. Pick the pace back up.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'This rhythm has held for $weeks weeks.',
      one: 'This rhythm has held for $weeks week.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'This is a recommendation, not medical advice. If you feel fine, nothing has to change.';
}
