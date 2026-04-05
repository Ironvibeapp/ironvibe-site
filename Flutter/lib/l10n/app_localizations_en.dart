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
  String get addSet => '+ ADD SET';

  @override
  String get addExercise => '+ ADD EXERCISE';

  @override
  String get finishWorkout => 'FINISH WORKOUT';

  @override
  String get startWorkout => 'START WORKOUT';

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
  String get exerciseHint => 'Enter exercise name';

  @override
  String get deleteFromHistory => 'Remove from history?';

  @override
  String get deleteExerciseHint => 'will no longer appear in suggestions.';

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
  String get fillCurrentExerciseBeforeAdd =>
      'Finish the current exercise before adding another one.';

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
  String get addClient => '+ ADD CLIENT';

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
      'IronVibe deliberately ships without a built-in exercise catalog or preset \"programs.\" It is not here to teach you how to train—YouTube and real coaches already do that—but to help you keep stats exactly the way you like. You type exercise names yourself, in your own words, instead of hunting through a massive list. The longer you use it, the more it feels like home: the app learns your habits and adapts to you, not the other way around.';

  @override
  String get instructionSectionSetControl => 'Set controls';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Removes the last set. If it contains logged data, the app asks for confirmation.';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Adds a new set row to the current exercise.';

  @override
  String get instructionSetProgressLabel => 'Timeline';

  @override
  String get instructionSetProgressDesc =>
      'Opens the progress timeline for this exercise.';

  @override
  String get instructionSectionProgressChart => 'Progress chart';

  @override
  String get instructionProgressChartIntro =>
      'Two independent trends by date: red — heaviest single set that day; cyan — most reps in any single set that day. Left axis: weight; right axis: reps.';

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
  String get instructionSectionWorkout => 'Workout';

  @override
  String get instructionAddExerciseTitle => 'Add exercise';

  @override
  String get instructionAddExerciseBody =>
      'Creates a new block for another movement.';

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
      'When the suggestions list is open under the name field, tap the X on a row to remove that name from your personal exercise list (the bank).';

  @override
  String get instructionSectionInputs => 'Data fields';

  @override
  String get instructionWeightTitle => 'Weight';

  @override
  String get instructionWeightBody =>
      'Load on the bar or equipment you train with.';

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
      'Personal Progress is for tracking strength gains exercise by exercise. Everything you have logged in saved workouts appears in one table, so you can compare at a glance; use the search field to find a movement right away. Open it from your home flow (the button under the workout calendar) or from a client profile when you train other people.';

  @override
  String get instructionSectionSaving => 'Saving';

  @override
  String get instructionFinishTitle => 'Finish workout';

  @override
  String get instructionFinishBody =>
      'Saves the entire session to history. Until you tap it, nothing is recorded.';

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
      'View completed workouts on the calendar and open aggregated statistics from the chart icon in the app bars.';

  @override
  String get instructionNavImportExportTitle => 'Import / export';

  @override
  String get instructionNavImportExportDesc =>
      'Back up or transfer your data using JSON export and import in the statistics dialog.';
}
