import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('uk'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'IronVibe'**
  String get appName;

  /// No description provided for @slogan.
  ///
  /// In en, this message translates to:
  /// **'YOUR WORKOUTS\' VIBE'**
  String get slogan;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @renameExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Rename exercise'**
  String get renameExerciseTitle;

  /// No description provided for @renameExerciseEmpty.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get renameExerciseEmpty;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @yesDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes, delete'**
  String get yesDelete;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @trainOthers.
  ///
  /// In en, this message translates to:
  /// **'I TRAIN OTHERS'**
  String get trainOthers;

  /// No description provided for @trainSelf.
  ///
  /// In en, this message translates to:
  /// **'I TRAIN MYSELF'**
  String get trainSelf;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'STATISTICS'**
  String get statistics;

  /// No description provided for @exportHistory.
  ///
  /// In en, this message translates to:
  /// **'EXPORT WORKOUT HISTORY'**
  String get exportHistory;

  /// No description provided for @historyEmpty.
  ///
  /// In en, this message translates to:
  /// **'History is empty, nothing to export yet'**
  String get historyEmpty;

  /// No description provided for @exportError.
  ///
  /// In en, this message translates to:
  /// **'Export error:'**
  String get exportError;

  /// No description provided for @exportJson.
  ///
  /// In en, this message translates to:
  /// **'EXPORT JSON'**
  String get exportJson;

  /// No description provided for @importData.
  ///
  /// In en, this message translates to:
  /// **'IMPORT'**
  String get importData;

  /// No description provided for @importSuccess.
  ///
  /// In en, this message translates to:
  /// **'Data imported successfully'**
  String get importSuccess;

  /// No description provided for @importError.
  ///
  /// In en, this message translates to:
  /// **'Import error:'**
  String get importError;

  /// No description provided for @importNewerVersion.
  ///
  /// In en, this message translates to:
  /// **'File was created by a newer app version'**
  String get importNewerVersion;

  /// No description provided for @importFileAccessError.
  ///
  /// In en, this message translates to:
  /// **'File access error'**
  String get importFileAccessError;

  /// No description provided for @importInvalidJson.
  ///
  /// In en, this message translates to:
  /// **'Invalid JSON format'**
  String get importInvalidJson;

  /// No description provided for @importInvalidBackupFile.
  ///
  /// In en, this message translates to:
  /// **'Error: invalid backup file selected'**
  String get importInvalidBackupFile;

  /// No description provided for @shareText.
  ///
  /// In en, this message translates to:
  /// **'IronVibe workout history'**
  String get shareText;

  /// No description provided for @monthStats.
  ///
  /// In en, this message translates to:
  /// **'THIS MONTH'**
  String get monthStats;

  /// No description provided for @yearStats.
  ///
  /// In en, this message translates to:
  /// **'THIS YEAR'**
  String get yearStats;

  /// No description provided for @allTimeStats.
  ///
  /// In en, this message translates to:
  /// **'ALL TIME'**
  String get allTimeStats;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @reps.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get reps;

  /// No description provided for @rir.
  ///
  /// In en, this message translates to:
  /// **'RIR'**
  String get rir;

  /// No description provided for @oneRm.
  ///
  /// In en, this message translates to:
  /// **'1RM'**
  String get oneRm;

  /// No description provided for @approxOneRm.
  ///
  /// In en, this message translates to:
  /// **'≈ 1RM:'**
  String get approxOneRm;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'kg'**
  String get kg;

  /// No description provided for @volumeShort.
  ///
  /// In en, this message translates to:
  /// **'VOL.'**
  String get volumeShort;

  /// No description provided for @addSet.
  ///
  /// In en, this message translates to:
  /// **'+ ADD SET'**
  String get addSet;

  /// No description provided for @addExercise.
  ///
  /// In en, this message translates to:
  /// **'+ ADD EXERCISE'**
  String get addExercise;

  /// No description provided for @finishWorkout.
  ///
  /// In en, this message translates to:
  /// **'FINISH WORKOUT'**
  String get finishWorkout;

  /// No description provided for @startWorkout.
  ///
  /// In en, this message translates to:
  /// **'START WORKOUT'**
  String get startWorkout;

  /// No description provided for @calendarWorkouts.
  ///
  /// In en, this message translates to:
  /// **'WORKOUT CALENDAR'**
  String get calendarWorkouts;

  /// No description provided for @personalProgress.
  ///
  /// In en, this message translates to:
  /// **'PERSONAL PROGRESS'**
  String get personalProgress;

  /// No description provided for @personalProgressSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search exercises'**
  String get personalProgressSearchHint;

  /// No description provided for @personalProgressBestSet.
  ///
  /// In en, this message translates to:
  /// **'Best set'**
  String get personalProgressBestSet;

  /// No description provided for @personalProgressMaxVolume.
  ///
  /// In en, this message translates to:
  /// **'Max volume'**
  String get personalProgressMaxVolume;

  /// No description provided for @personalProgressEmpty.
  ///
  /// In en, this message translates to:
  /// **'No exercises in workouts yet'**
  String get personalProgressEmpty;

  /// No description provided for @exerciseHint.
  ///
  /// In en, this message translates to:
  /// **'Enter exercise name'**
  String get exerciseHint;

  /// No description provided for @deleteFromHistory.
  ///
  /// In en, this message translates to:
  /// **'Remove from history?'**
  String get deleteFromHistory;

  /// No description provided for @deleteExerciseHint.
  ///
  /// In en, this message translates to:
  /// **'will no longer appear in suggestions.'**
  String get deleteExerciseHint;

  /// No description provided for @exerciseDeleted.
  ///
  /// In en, this message translates to:
  /// **'removed'**
  String get exerciseDeleted;

  /// No description provided for @deleteWorkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get deleteWorkoutTitle;

  /// No description provided for @deleteWorkoutMsg.
  ///
  /// In en, this message translates to:
  /// **'Delete this workout? Progress history will be lost.'**
  String get deleteWorkoutMsg;

  /// No description provided for @removeSetWithDataConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete set with data? This action cannot be undone.'**
  String get removeSetWithDataConfirm;

  /// No description provided for @deleteClientTitle.
  ///
  /// In en, this message translates to:
  /// **'DELETE CLIENT'**
  String get deleteClientTitle;

  /// No description provided for @deleteClientMsg.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this client? All their future workouts will be removed.'**
  String get deleteClientMsg;

  /// No description provided for @noClientsTitle.
  ///
  /// In en, this message translates to:
  /// **'NO CLIENTS'**
  String get noClientsTitle;

  /// No description provided for @noClientsMsg.
  ///
  /// In en, this message translates to:
  /// **'Add clients first in the Clients menu.'**
  String get noClientsMsg;

  /// No description provided for @newClient.
  ///
  /// In en, this message translates to:
  /// **'NEW CLIENT'**
  String get newClient;

  /// No description provided for @editClient.
  ///
  /// In en, this message translates to:
  /// **'EDIT'**
  String get editClient;

  /// No description provided for @clientName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get clientName;

  /// No description provided for @clientGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get clientGoal;

  /// No description provided for @clientWeight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get clientWeight;

  /// No description provided for @clientHeight.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get clientHeight;

  /// No description provided for @clientNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get clientNotes;

  /// No description provided for @saveClientChanges.
  ///
  /// In en, this message translates to:
  /// **'SAVE CHANGES'**
  String get saveClientChanges;

  /// No description provided for @clientProfileUnsavedTitle.
  ///
  /// In en, this message translates to:
  /// **'Unsaved changes'**
  String get clientProfileUnsavedTitle;

  /// No description provided for @clientProfileUnsavedMessage.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes. Save before leaving?'**
  String get clientProfileUnsavedMessage;

  /// No description provided for @clientProfileStay.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get clientProfileStay;

  /// No description provided for @clientProfileDiscard.
  ///
  /// In en, this message translates to:
  /// **'Leave without saving'**
  String get clientProfileDiscard;

  /// No description provided for @clientProfileSaveAndLeave.
  ///
  /// In en, this message translates to:
  /// **'Save and leave'**
  String get clientProfileSaveAndLeave;

  /// No description provided for @fillCurrentExerciseBeforeAdd.
  ///
  /// In en, this message translates to:
  /// **'Finish the current exercise before adding another one.'**
  String get fillCurrentExerciseBeforeAdd;

  /// No description provided for @clientWorkoutHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No workouts yet'**
  String get clientWorkoutHistoryEmpty;

  /// No description provided for @exerciseNumberedTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise #{n}'**
  String exerciseNumberedTitle(int n);

  /// No description provided for @exerciseNumberedTitleWithName.
  ///
  /// In en, this message translates to:
  /// **'Exercise #{n}: {exerciseName}'**
  String exerciseNumberedTitleWithName(int n, String exerciseName);

  /// No description provided for @clientProfileSectionGoal.
  ///
  /// In en, this message translates to:
  /// **'GOAL'**
  String get clientProfileSectionGoal;

  /// No description provided for @clientProfileSectionAnthropometry.
  ///
  /// In en, this message translates to:
  /// **'ANTHROPOMETRY'**
  String get clientProfileSectionAnthropometry;

  /// No description provided for @clientProfileSectionTrainerNotes.
  ///
  /// In en, this message translates to:
  /// **'COACH NOTES'**
  String get clientProfileSectionTrainerNotes;

  /// No description provided for @clientProfileSectionWorkoutHistory.
  ///
  /// In en, this message translates to:
  /// **'WORKOUT HISTORY'**
  String get clientProfileSectionWorkoutHistory;

  /// No description provided for @clientTrainerNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Injuries, specifics, plan…'**
  String get clientTrainerNotesHint;

  /// No description provided for @trainerSessionDefaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout'**
  String get trainerSessionDefaultTitle;

  /// No description provided for @durationMinutesShort.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get durationMinutesShort;

  /// No description provided for @addTraining.
  ///
  /// In en, this message translates to:
  /// **'ADD WORKOUT'**
  String get addTraining;

  /// No description provided for @clientLabel.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get clientLabel;

  /// No description provided for @deleteClientBtn.
  ///
  /// In en, this message translates to:
  /// **'DELETE CLIENT'**
  String get deleteClientBtn;

  /// No description provided for @clientsMenu.
  ///
  /// In en, this message translates to:
  /// **'CLIENTS'**
  String get clientsMenu;

  /// No description provided for @dateHeader.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateHeader;

  /// No description provided for @clientHeader.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get clientHeader;

  /// No description provided for @exerciseHeader.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get exerciseHeader;

  /// No description provided for @typeHeader.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get typeHeader;

  /// No description provided for @strengthType.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get strengthType;

  /// No description provided for @cardioType.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get cardioType;

  /// No description provided for @weightHeader.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weightHeader;

  /// No description provided for @weightUnitsChoiceShort.
  ///
  /// In en, this message translates to:
  /// **'kg / lb'**
  String get weightUnitsChoiceShort;

  /// No description provided for @progressChartWeightLegend.
  ///
  /// In en, this message translates to:
  /// **'Weight — kg / lb (your choice)'**
  String get progressChartWeightLegend;

  /// No description provided for @repsHeader.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get repsHeader;

  /// No description provided for @rirHeader.
  ///
  /// In en, this message translates to:
  /// **'RIR'**
  String get rirHeader;

  /// No description provided for @durationHeader.
  ///
  /// In en, this message translates to:
  /// **'Time (min)'**
  String get durationHeader;

  /// No description provided for @intensityHeader.
  ///
  /// In en, this message translates to:
  /// **'Intensity'**
  String get intensityHeader;

  /// No description provided for @setHeader.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get setHeader;

  /// No description provided for @strength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get strength;

  /// No description provided for @cardio.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get cardio;

  /// No description provided for @timeMin.
  ///
  /// In en, this message translates to:
  /// **'Time (min)'**
  String get timeMin;

  /// No description provided for @intensity.
  ///
  /// In en, this message translates to:
  /// **'Intensity'**
  String get intensity;

  /// No description provided for @reserve.
  ///
  /// In en, this message translates to:
  /// **'Reserve'**
  String get reserve;

  /// No description provided for @sets.
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get sets;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @rest.
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get rest;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @totalVolume.
  ///
  /// In en, this message translates to:
  /// **'Total volume'**
  String get totalVolume;

  /// No description provided for @chart.
  ///
  /// In en, this message translates to:
  /// **'Chart'**
  String get chart;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @dayMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get dayMonday;

  /// No description provided for @dayTuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get dayTuesday;

  /// No description provided for @dayWednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get dayWednesday;

  /// No description provided for @dayThursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get dayThursday;

  /// No description provided for @dayFriday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get dayFriday;

  /// No description provided for @daySaturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get daySaturday;

  /// No description provided for @daySunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get daySunday;

  /// No description provided for @greetingHi.
  ///
  /// In en, this message translates to:
  /// **'Hi'**
  String get greetingHi;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetingEvening;

  /// No description provided for @monthJanuary.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get monthJanuary;

  /// No description provided for @monthFebruary.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get monthFebruary;

  /// No description provided for @monthMarch.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get monthMarch;

  /// No description provided for @monthApril.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get monthApril;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJune.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get monthJune;

  /// No description provided for @monthJuly.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get monthJuly;

  /// No description provided for @monthAugust.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get monthAugust;

  /// No description provided for @monthSeptember.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get monthSeptember;

  /// No description provided for @monthOctober.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get monthOctober;

  /// No description provided for @monthNovember.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get monthNovember;

  /// No description provided for @monthDecember.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get monthDecember;

  /// No description provided for @exerciseBenchPress.
  ///
  /// In en, this message translates to:
  /// **'Bench press'**
  String get exerciseBenchPress;

  /// No description provided for @exerciseSquat.
  ///
  /// In en, this message translates to:
  /// **'Squat'**
  String get exerciseSquat;

  /// No description provided for @exerciseRow.
  ///
  /// In en, this message translates to:
  /// **'Row'**
  String get exerciseRow;

  /// No description provided for @exerciseDeadlift.
  ///
  /// In en, this message translates to:
  /// **'Deadlift'**
  String get exerciseDeadlift;

  /// No description provided for @exerciseOverheadPress.
  ///
  /// In en, this message translates to:
  /// **'Overhead press'**
  String get exerciseOverheadPress;

  /// No description provided for @exercisePullUp.
  ///
  /// In en, this message translates to:
  /// **'Pull-up'**
  String get exercisePullUp;

  /// No description provided for @exerciseLunges.
  ///
  /// In en, this message translates to:
  /// **'Lunges'**
  String get exerciseLunges;

  /// No description provided for @exercisePlank.
  ///
  /// In en, this message translates to:
  /// **'Plank'**
  String get exercisePlank;

  /// No description provided for @saveWorkout.
  ///
  /// In en, this message translates to:
  /// **'SAVE WORKOUT'**
  String get saveWorkout;

  /// No description provided for @deleteWorkout.
  ///
  /// In en, this message translates to:
  /// **'DELETE WORKOUT'**
  String get deleteWorkout;

  /// No description provided for @deleteTraining.
  ///
  /// In en, this message translates to:
  /// **'Delete workout'**
  String get deleteTraining;

  /// No description provided for @deleteTrainingQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete this workout from schedule?'**
  String get deleteTrainingQuestion;

  /// No description provided for @addSetButton.
  ///
  /// In en, this message translates to:
  /// **'Add set'**
  String get addSetButton;

  /// No description provided for @progressButton.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progressButton;

  /// No description provided for @filterMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get filterMonth;

  /// No description provided for @filterYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get filterYear;

  /// No description provided for @filterAllTime.
  ///
  /// In en, this message translates to:
  /// **'All time'**
  String get filterAllTime;

  /// No description provided for @noteLabel.
  ///
  /// In en, this message translates to:
  /// **'NOTE:'**
  String get noteLabel;

  /// No description provided for @addClient.
  ///
  /// In en, this message translates to:
  /// **'+ ADD CLIENT'**
  String get addClient;

  /// No description provided for @workoutsToday.
  ///
  /// In en, this message translates to:
  /// **'TODAY\'S WORKOUTS'**
  String get workoutsToday;

  /// No description provided for @workoutNumberPrefix.
  ///
  /// In en, this message translates to:
  /// **'Workout #'**
  String get workoutNumberPrefix;

  /// No description provided for @noEntries.
  ///
  /// In en, this message translates to:
  /// **'No entries'**
  String get noEntries;

  /// No description provided for @footerWebsite.
  ///
  /// In en, this message translates to:
  /// **'ironvibe.app'**
  String get footerWebsite;

  /// No description provided for @footerPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get footerPrivacyPolicy;

  /// No description provided for @instructionButton.
  ///
  /// In en, this message translates to:
  /// **'GUIDE'**
  String get instructionButton;

  /// No description provided for @instructionTitle.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get instructionTitle;

  /// No description provided for @instructionPhilosophy.
  ///
  /// In en, this message translates to:
  /// **'IronVibe deliberately ships without a built-in exercise catalog or preset \"programs.\" It is not here to teach you how to train—YouTube and real coaches already do that—but to help you keep stats exactly the way you like. You type exercise names yourself, in your own words, instead of hunting through a massive list. The longer you use it, the more it feels like home: the app learns your habits and adapts to you, not the other way around.'**
  String get instructionPhilosophy;

  /// No description provided for @instructionSectionSetControl.
  ///
  /// In en, this message translates to:
  /// **'Set controls'**
  String get instructionSectionSetControl;

  /// No description provided for @instructionSetMinusLabel.
  ///
  /// In en, this message translates to:
  /// **'Minus'**
  String get instructionSetMinusLabel;

  /// No description provided for @instructionSetMinusDesc.
  ///
  /// In en, this message translates to:
  /// **'Removes the last set. If it contains logged data, the app asks for confirmation.'**
  String get instructionSetMinusDesc;

  /// No description provided for @instructionSetPlusLabel.
  ///
  /// In en, this message translates to:
  /// **'Plus'**
  String get instructionSetPlusLabel;

  /// No description provided for @instructionSetPlusDesc.
  ///
  /// In en, this message translates to:
  /// **'Adds a new set row to the current exercise.'**
  String get instructionSetPlusDesc;

  /// No description provided for @instructionSetProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get instructionSetProgressLabel;

  /// No description provided for @instructionSetProgressDesc.
  ///
  /// In en, this message translates to:
  /// **'Opens the progress timeline for this exercise.'**
  String get instructionSetProgressDesc;

  /// No description provided for @instructionSectionProgressChart.
  ///
  /// In en, this message translates to:
  /// **'Progress chart'**
  String get instructionSectionProgressChart;

  /// No description provided for @instructionProgressChartIntro.
  ///
  /// In en, this message translates to:
  /// **'Two independent trends by date: red — heaviest single set that day; cyan — most reps in any single set that day. Left axis: weight; right axis: reps.'**
  String get instructionProgressChartIntro;

  /// No description provided for @instructionProgressLineWeightLabel.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get instructionProgressLineWeightLabel;

  /// No description provided for @instructionProgressLineWeightDesc.
  ///
  /// In en, this message translates to:
  /// **'Red line: maximum weight in one set on each calendar day.'**
  String get instructionProgressLineWeightDesc;

  /// No description provided for @instructionProgressLineRepsLabel.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get instructionProgressLineRepsLabel;

  /// No description provided for @instructionProgressLineRepsDesc.
  ///
  /// In en, this message translates to:
  /// **'Cyan line: maximum reps in one set that day (not tied to the heaviest weight).'**
  String get instructionProgressLineRepsDesc;

  /// No description provided for @instructionSectionWorkout.
  ///
  /// In en, this message translates to:
  /// **'Workout'**
  String get instructionSectionWorkout;

  /// No description provided for @instructionAddExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Add exercise'**
  String get instructionAddExerciseTitle;

  /// No description provided for @instructionAddExerciseBody.
  ///
  /// In en, this message translates to:
  /// **'Creates a new block for another movement.'**
  String get instructionAddExerciseBody;

  /// No description provided for @instructionSectionExerciseNameTools.
  ///
  /// In en, this message translates to:
  /// **'Exercise name'**
  String get instructionSectionExerciseNameTools;

  /// No description provided for @instructionRenameExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Long press to rename'**
  String get instructionRenameExerciseTitle;

  /// No description provided for @instructionRenameExerciseDesc.
  ///
  /// In en, this message translates to:
  /// **'Long-press the exercise name while logging a workout, on a suggestion in the dropdown, or on the title in a saved workout in history to rename that exercise everywhere.'**
  String get instructionRenameExerciseDesc;

  /// No description provided for @instructionRemoveFromBankTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove from your list'**
  String get instructionRemoveFromBankTitle;

  /// No description provided for @instructionRemoveFromBankDesc.
  ///
  /// In en, this message translates to:
  /// **'When the suggestions list is open under the name field, tap the X on a row to remove that name from your personal exercise list (the bank).'**
  String get instructionRemoveFromBankDesc;

  /// No description provided for @instructionSectionInputs.
  ///
  /// In en, this message translates to:
  /// **'Data fields'**
  String get instructionSectionInputs;

  /// No description provided for @instructionWeightTitle.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get instructionWeightTitle;

  /// No description provided for @instructionWeightBody.
  ///
  /// In en, this message translates to:
  /// **'Load on the bar or equipment you train with.'**
  String get instructionWeightBody;

  /// No description provided for @instructionRepsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get instructionRepsTitle;

  /// No description provided for @instructionRepsBody.
  ///
  /// In en, this message translates to:
  /// **'How many times you completed the movement in one set.'**
  String get instructionRepsBody;

  /// No description provided for @instructionRirTitle.
  ///
  /// In en, this message translates to:
  /// **'RIR'**
  String get instructionRirTitle;

  /// No description provided for @instructionRirBody.
  ///
  /// In en, this message translates to:
  /// **'How many more reps you could still do before failure. Helps track intensity.'**
  String get instructionRirBody;

  /// No description provided for @instructionOneRmTitle.
  ///
  /// In en, this message translates to:
  /// **'1RM (one-rep max)'**
  String get instructionOneRmTitle;

  /// No description provided for @instructionOneRmDesc.
  ///
  /// In en, this message translates to:
  /// **'Estimated maximum weight for one full repetition from your current weight and reps. A key strength benchmark for tracking progress and picking working weights.'**
  String get instructionOneRmDesc;

  /// No description provided for @instructionExerciseVolumeTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise volume (total)'**
  String get instructionExerciseVolumeTitle;

  /// No description provided for @instructionExerciseVolumeDesc.
  ///
  /// In en, this message translates to:
  /// **'Next to the progress (chart) button under the sets: total tonnage for this exercise—the sum of weight × reps for every set that has both values. Updates live as you add or edit sets.'**
  String get instructionExerciseVolumeDesc;

  /// No description provided for @instructionSectionPersonalProgress.
  ///
  /// In en, this message translates to:
  /// **'Personal progress'**
  String get instructionSectionPersonalProgress;

  /// No description provided for @instructionPersonalProgressIntro.
  ///
  /// In en, this message translates to:
  /// **'Personal Progress is for tracking strength gains exercise by exercise. Everything you have logged in saved workouts appears in one table, so you can compare at a glance; use the search field to find a movement right away. Open it from your home flow (the button under the workout calendar) or from a client profile when you train other people.'**
  String get instructionPersonalProgressIntro;

  /// No description provided for @instructionSectionSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get instructionSectionSaving;

  /// No description provided for @instructionFinishTitle.
  ///
  /// In en, this message translates to:
  /// **'Finish workout'**
  String get instructionFinishTitle;

  /// No description provided for @instructionFinishBody.
  ///
  /// In en, this message translates to:
  /// **'Saves the entire session to history. Until you tap it, nothing is recorded.'**
  String get instructionFinishBody;

  /// No description provided for @instructionSectionCardio.
  ///
  /// In en, this message translates to:
  /// **'Cardio & intensity'**
  String get instructionSectionCardio;

  /// No description provided for @instructionCardioTitle.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get instructionCardioTitle;

  /// No description provided for @instructionCardioBody.
  ///
  /// In en, this message translates to:
  /// **'Tracks time and intensity for cardio (distance is not entered). Helps you keep pace and monitor effort.'**
  String get instructionCardioBody;

  /// No description provided for @instructionIntensityTitle.
  ///
  /// In en, this message translates to:
  /// **'Intensity'**
  String get instructionIntensityTitle;

  /// No description provided for @instructionIntensityBody.
  ///
  /// In en, this message translates to:
  /// **'Use the effort scale to gauge how hard the workout felt. That is the key to progress without overtraining.'**
  String get instructionIntensityBody;

  /// No description provided for @instructionSectionStopwatch.
  ///
  /// In en, this message translates to:
  /// **'Stopwatch (your assistant)'**
  String get instructionSectionStopwatch;

  /// No description provided for @instructionStopwatchWhyTitle.
  ///
  /// In en, this message translates to:
  /// **'Why use it?'**
  String get instructionStopwatchWhyTitle;

  /// No description provided for @instructionStopwatchWhyBody.
  ///
  /// In en, this message translates to:
  /// **'To control rest between sets. Short rest — higher density; long rest — more strength for heavy weight.'**
  String get instructionStopwatchWhyBody;

  /// No description provided for @instructionStopwatchHowTitle.
  ///
  /// In en, this message translates to:
  /// **'How does it work?'**
  String get instructionStopwatchHowTitle;

  /// No description provided for @instructionStopwatchHowBody.
  ///
  /// In en, this message translates to:
  /// **'Center: time, Play/Pause, and Reset. Left and right: quick presets (below). In plain stopwatch mode time runs up with centiseconds. The timer stays pinned in the header while you scroll.'**
  String get instructionStopwatchHowBody;

  /// No description provided for @instructionStopwatchIntervalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Left: intervals'**
  String get instructionStopwatchIntervalsTitle;

  /// No description provided for @instructionStopwatchIntervalsBody.
  ///
  /// In en, this message translates to:
  /// **'1/1 — 60 s work, 60 s rest. 4/4 — 4 minutes work and 4 minutes rest each round. 20/10 — Tabata-style: 20 s on, 10 s off. After you pick one, the timer loops work and rest until you pause or reset. Red tint means work; blue means rest.'**
  String get instructionStopwatchIntervalsBody;

  /// No description provided for @instructionStopwatchRestTitle.
  ///
  /// In en, this message translates to:
  /// **'Right: rest countdown'**
  String get instructionStopwatchRestTitle;

  /// No description provided for @instructionStopwatchRestBody.
  ///
  /// In en, this message translates to:
  /// **'+1m, +2m, and +5m start or extend a normal minute countdown. If an interval loop was running, it switches to this countdown. If a countdown is already running, the minutes are added to the time left. Handy for rest between sets.'**
  String get instructionStopwatchRestBody;

  /// No description provided for @instructionStopwatchProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress bar'**
  String get instructionStopwatchProgressTitle;

  /// No description provided for @instructionStopwatchProgressBody.
  ///
  /// In en, this message translates to:
  /// **'During countdown and interval modes, a bar under the time shows how much of the current phase remains.'**
  String get instructionStopwatchProgressBody;

  /// No description provided for @instructionStopwatchSoundsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound & haptics'**
  String get instructionStopwatchSoundsTitle;

  /// No description provided for @instructionStopwatchSoundsBody.
  ///
  /// In en, this message translates to:
  /// **'At 3, 2, and 1 seconds left in a phase, a short in-app sound and light haptic play. When the phase ends or work/rest switches, a stronger cue and haptic follow. Sounds are minimal bundled clips—no microphone, no notification permission; media/system volume still affects loudness.'**
  String get instructionStopwatchSoundsBody;

  /// No description provided for @instructionSectionNavHistory.
  ///
  /// In en, this message translates to:
  /// **'History & data'**
  String get instructionSectionNavHistory;

  /// No description provided for @instructionNavHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'History / statistics'**
  String get instructionNavHistoryTitle;

  /// No description provided for @instructionNavHistoryDesc.
  ///
  /// In en, this message translates to:
  /// **'View completed workouts on the calendar and open aggregated statistics from the chart icon in the app bars.'**
  String get instructionNavHistoryDesc;

  /// No description provided for @instructionNavImportExportTitle.
  ///
  /// In en, this message translates to:
  /// **'Import / export'**
  String get instructionNavImportExportTitle;

  /// No description provided for @instructionNavImportExportDesc.
  ///
  /// In en, this message translates to:
  /// **'Back up or transfer your data using JSON export and import in the statistics dialog.'**
  String get instructionNavImportExportDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'it',
    'pl',
    'pt',
    'ru',
    'uk',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'uk':
      return AppLocalizationsUk();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
