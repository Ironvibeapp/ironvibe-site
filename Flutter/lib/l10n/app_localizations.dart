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

  /// No description provided for @reassignHistoryExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Change exercise'**
  String get reassignHistoryExerciseTitle;

  /// No description provided for @reassignHistoryExerciseBody.
  ///
  /// In en, this message translates to:
  /// **'Only this workout changes. Your sets stay the same; progress charts follow the new exercise name.'**
  String get reassignHistoryExerciseBody;

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

  /// No description provided for @importAthlete.
  ///
  /// In en, this message translates to:
  /// **'IMPORT ATHLETE'**
  String get importAthlete;

  /// No description provided for @importAthleteFound.
  ///
  /// In en, this message translates to:
  /// **'Found records of {count} workouts from an athlete who is not on your list.'**
  String importAthleteFound(int count);

  /// No description provided for @importAthleteBackupOwn.
  ///
  /// In en, this message translates to:
  /// **'SAVE MY DATA FIRST'**
  String get importAthleteBackupOwn;

  /// No description provided for @importAthleteDecline.
  ///
  /// In en, this message translates to:
  /// **'Don\'t add'**
  String get importAthleteDecline;

  /// No description provided for @importAthleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Athlete added'**
  String get importAthleteSuccess;

  /// No description provided for @importAthleteNotAthleteFile.
  ///
  /// In en, this message translates to:
  /// **'This file is not an athlete workout history.'**
  String get importAthleteNotAthleteFile;

  /// No description provided for @importAthleteEmpty.
  ///
  /// In en, this message translates to:
  /// **'No workouts found in this file.'**
  String get importAthleteEmpty;

  /// No description provided for @importAthleteAlreadyImported.
  ///
  /// In en, this message translates to:
  /// **'These workouts are already on this device.'**
  String get importAthleteAlreadyImported;

  /// No description provided for @importAthleteUseDedicatedButton.
  ///
  /// In en, this message translates to:
  /// **'This looks like an athlete history file. Use Import athlete instead.'**
  String get importAthleteUseDedicatedButton;

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
  /// **'ADD SET'**
  String get addSet;

  /// No description provided for @addExercise.
  ///
  /// In en, this message translates to:
  /// **'ADD EXERCISE'**
  String get addExercise;

  /// No description provided for @finishWorkout.
  ///
  /// In en, this message translates to:
  /// **'FINISH WORKOUT'**
  String get finishWorkout;

  /// No description provided for @finishWorkoutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Finish workout?'**
  String get finishWorkoutConfirmTitle;

  /// No description provided for @finishWorkoutConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'The workout will be saved.'**
  String get finishWorkoutConfirmBody;

  /// No description provided for @finishWorkoutConfirmAction.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finishWorkoutConfirmAction;

  /// No description provided for @workoutCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout saved'**
  String get workoutCompleteTitle;

  /// No description provided for @planChangesSavedTitle.
  ///
  /// In en, this message translates to:
  /// **'Changes saved'**
  String get planChangesSavedTitle;

  /// No description provided for @startWorkout.
  ///
  /// In en, this message translates to:
  /// **'START WORKOUT'**
  String get startWorkout;

  /// No description provided for @quickWorkout.
  ///
  /// In en, this message translates to:
  /// **'QUICK WORKOUT'**
  String get quickWorkout;

  /// No description provided for @quickWorkoutFullBody.
  ///
  /// In en, this message translates to:
  /// **'FULL BODY'**
  String get quickWorkoutFullBody;

  /// No description provided for @quickWorkoutInsufficientTitle.
  ///
  /// In en, this message translates to:
  /// **'Not enough data'**
  String get quickWorkoutInsufficientTitle;

  /// No description provided for @quickWorkoutInsufficientBody.
  ///
  /// In en, this message translates to:
  /// **'A quick workout needs tagged exercises for chest, back, one leg group (front or rear thigh), and one of shoulders, arms, or core. Mark groups in Personal Progress — or keep logging: the app will ask when you enter a new exercise.'**
  String get quickWorkoutInsufficientBody;

  /// No description provided for @quickWorkoutOpenProgress.
  ///
  /// In en, this message translates to:
  /// **'OPEN PERSONAL PROGRESS'**
  String get quickWorkoutOpenProgress;

  /// No description provided for @quickWorkoutPreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'QUICK WORKOUT · FULL BODY'**
  String get quickWorkoutPreviewTitle;

  /// No description provided for @quickWorkoutStart.
  ///
  /// In en, this message translates to:
  /// **'START'**
  String get quickWorkoutStart;

  /// No description provided for @quickWorkoutSwap.
  ///
  /// In en, this message translates to:
  /// **'Swap'**
  String get quickWorkoutSwap;

  /// No description provided for @quickWorkoutNoAlternatives.
  ///
  /// In en, this message translates to:
  /// **'No other exercise in this group'**
  String get quickWorkoutNoAlternatives;

  /// No description provided for @muscleGroupPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Muscle group'**
  String get muscleGroupPromptTitle;

  /// No description provided for @muscleGroupPromptBody.
  ///
  /// In en, this message translates to:
  /// **'Used to build a quick full-body workout.'**
  String get muscleGroupPromptBody;

  /// No description provided for @muscleGroupLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get muscleGroupLater;

  /// No description provided for @muscleGroupClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get muscleGroupClear;

  /// No description provided for @muscleGroupSkip.
  ///
  /// In en, this message translates to:
  /// **'Not for quick workout'**
  String get muscleGroupSkip;

  /// No description provided for @muscleGroupChest.
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get muscleGroupChest;

  /// No description provided for @muscleGroupBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get muscleGroupBack;

  /// No description provided for @muscleGroupShoulders.
  ///
  /// In en, this message translates to:
  /// **'Shoulders'**
  String get muscleGroupShoulders;

  /// No description provided for @muscleGroupCore.
  ///
  /// In en, this message translates to:
  /// **'Core'**
  String get muscleGroupCore;

  /// No description provided for @muscleGroupQuads.
  ///
  /// In en, this message translates to:
  /// **'Front thigh'**
  String get muscleGroupQuads;

  /// No description provided for @muscleGroupHamstrings.
  ///
  /// In en, this message translates to:
  /// **'Rear thigh'**
  String get muscleGroupHamstrings;

  /// No description provided for @muscleGroupArmFlex.
  ///
  /// In en, this message translates to:
  /// **'Arm curl'**
  String get muscleGroupArmFlex;

  /// No description provided for @muscleGroupArmExt.
  ///
  /// In en, this message translates to:
  /// **'Arm extension'**
  String get muscleGroupArmExt;

  /// No description provided for @muscleGroupUntagged.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get muscleGroupUntagged;

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

  /// No description provided for @favoriteExercises.
  ///
  /// In en, this message translates to:
  /// **'FAVORITE EXERCISES'**
  String get favoriteExercises;

  /// No description provided for @favoriteExercisesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No favorite exercises yet'**
  String get favoriteExercisesEmpty;

  /// No description provided for @buildWorkoutFromFavorites.
  ///
  /// In en, this message translates to:
  /// **'BUILD WORKOUT'**
  String get buildWorkoutFromFavorites;

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
  /// **'will no longer appear in suggestions or Personal Progress.'**
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

  /// No description provided for @removeExerciseFromWorkout.
  ///
  /// In en, this message translates to:
  /// **'Remove exercise'**
  String get removeExerciseFromWorkout;

  /// No description provided for @removeExerciseFromWorkoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove this exercise from the workout? This cannot be undone.'**
  String get removeExerciseFromWorkoutConfirm;

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

  /// No description provided for @clientNameCannotChange.
  ///
  /// In en, this message translates to:
  /// **'The name cannot be changed later.'**
  String get clientNameCannotChange;

  /// No description provided for @clientNameTaken.
  ///
  /// In en, this message translates to:
  /// **'This name is already in use. Choose another.'**
  String get clientNameTaken;

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

  /// No description provided for @workoutRecoveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout interrupted'**
  String get workoutRecoveryTitle;

  /// No description provided for @workoutRecoveryMessage.
  ///
  /// In en, this message translates to:
  /// **'Your previous workout ended unexpectedly. Continue where you left off or delete the unsaved data.'**
  String get workoutRecoveryMessage;

  /// No description provided for @workoutRecoveryContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue workout'**
  String get workoutRecoveryContinue;

  /// No description provided for @workoutRecoveryDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete workout'**
  String get workoutRecoveryDelete;

  /// No description provided for @workoutRecoverySessionMissing.
  ///
  /// In en, this message translates to:
  /// **'The scheduled client workout was removed. The unsaved draft has been cleared.'**
  String get workoutRecoverySessionMissing;

  /// No description provided for @fillCurrentExerciseBeforeAdd.
  ///
  /// In en, this message translates to:
  /// **'Finish the current exercise before adding another one.'**
  String get fillCurrentExerciseBeforeAdd;

  /// No description provided for @switchWorkoutTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Switch workout type?'**
  String get switchWorkoutTypeTitle;

  /// No description provided for @switchWorkoutTypeBody.
  ///
  /// In en, this message translates to:
  /// **'Sets already entered for the other type will not be saved with this workout.'**
  String get switchWorkoutTypeBody;

  /// No description provided for @switchWorkoutTypeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get switchWorkoutTypeConfirm;

  /// No description provided for @saveWorkoutNothingToSave.
  ///
  /// In en, this message translates to:
  /// **'Nothing to save yet. Add weight and reps, or duration for cardio.'**
  String get saveWorkoutNothingToSave;

  /// No description provided for @importedHistoryBadge.
  ///
  /// In en, this message translates to:
  /// **'Imported'**
  String get importedHistoryBadge;

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

  /// No description provided for @exerciseNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'#{n}'**
  String exerciseNumberLabel(int n);

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

  /// No description provided for @repeatLastWorkout.
  ///
  /// In en, this message translates to:
  /// **'Repeat last workout'**
  String get repeatLastWorkout;

  /// No description provided for @repeatLastUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This client has no previous workout to repeat.'**
  String get repeatLastUnavailable;

  /// No description provided for @editPlan.
  ///
  /// In en, this message translates to:
  /// **'Edit plan'**
  String get editPlan;

  /// No description provided for @trainerSessionEmpty.
  ///
  /// In en, this message translates to:
  /// **'Not planned yet'**
  String get trainerSessionEmpty;

  /// No description provided for @trainerSessionPlanned.
  ///
  /// In en, this message translates to:
  /// **'{n} planned'**
  String trainerSessionPlanned(int n);

  /// No description provided for @trainerClientsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No clients yet. Add someone to start scheduling.'**
  String get trainerClientsEmpty;

  /// No description provided for @clientNeverTrained.
  ///
  /// In en, this message translates to:
  /// **'No workouts yet'**
  String get clientNeverTrained;

  /// No description provided for @clientNoUpcoming.
  ///
  /// In en, this message translates to:
  /// **'No upcoming session'**
  String get clientNoUpcoming;

  /// No description provided for @clientLastSession.
  ///
  /// In en, this message translates to:
  /// **'Last: {when}'**
  String clientLastSession(String when);

  /// No description provided for @clientNextSession.
  ///
  /// In en, this message translates to:
  /// **'Next: {when}'**
  String clientNextSession(String when);

  /// No description provided for @clientSessionToday.
  ///
  /// In en, this message translates to:
  /// **'today'**
  String get clientSessionToday;

  /// No description provided for @clientSessionYesterday.
  ///
  /// In en, this message translates to:
  /// **'yesterday'**
  String get clientSessionYesterday;

  /// No description provided for @clientSessionTomorrow.
  ///
  /// In en, this message translates to:
  /// **'tomorrow'**
  String get clientSessionTomorrow;

  /// No description provided for @clientSessionDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{n} days ago'**
  String clientSessionDaysAgo(int n);

  /// No description provided for @clientSessionInDays.
  ///
  /// In en, this message translates to:
  /// **'in {n} days'**
  String clientSessionInDays(int n);

  /// No description provided for @clientProfileDetails.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get clientProfileDetails;

  /// No description provided for @addSessionPickClient.
  ///
  /// In en, this message translates to:
  /// **'Select a client'**
  String get addSessionPickClient;

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

  /// No description provided for @progressChartVolumeLegend.
  ///
  /// In en, this message translates to:
  /// **'Volume (tonnage)'**
  String get progressChartVolumeLegend;

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
  /// **'ADD CLIENT'**
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

  /// No description provided for @instructionHubManifest.
  ///
  /// In en, this message translates to:
  /// **'No exercise catalog and no ready-made programs. You name movements in your own words — the app keeps stats on them.'**
  String get instructionHubManifest;

  /// No description provided for @instructionSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search the guide'**
  String get instructionSearchHint;

  /// No description provided for @instructionSearchEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing found.'**
  String get instructionSearchEmpty;

  /// No description provided for @instructionChapterStartTitle.
  ///
  /// In en, this message translates to:
  /// **'Getting started'**
  String get instructionChapterStartTitle;

  /// No description provided for @instructionChapterStartBlurb.
  ///
  /// In en, this message translates to:
  /// **'Home screen, the two modes, and how the app thinks.'**
  String get instructionChapterStartBlurb;

  /// No description provided for @instructionChapterSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'During a workout'**
  String get instructionChapterSessionTitle;

  /// No description provided for @instructionChapterSessionBlurb.
  ///
  /// In en, this message translates to:
  /// **'Sets, weight, reps, RIR, cardio, and finishing a session.'**
  String get instructionChapterSessionBlurb;

  /// No description provided for @instructionChapterTimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Stopwatch'**
  String get instructionChapterTimerTitle;

  /// No description provided for @instructionChapterTimerBlurb.
  ///
  /// In en, this message translates to:
  /// **'Intervals, rest between sets, and cues.'**
  String get instructionChapterTimerBlurb;

  /// No description provided for @instructionChapterExercisesTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercises and groups'**
  String get instructionChapterExercisesTitle;

  /// No description provided for @instructionChapterExercisesBlurb.
  ///
  /// In en, this message translates to:
  /// **'Your movement list, muscle groups, favorites, and the quick workout.'**
  String get instructionChapterExercisesBlurb;

  /// No description provided for @instructionChapterProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress and records'**
  String get instructionChapterProgressTitle;

  /// No description provided for @instructionChapterProgressBlurb.
  ///
  /// In en, this message translates to:
  /// **'Personal progress, 1RM, tonnage, and the exercise chart.'**
  String get instructionChapterProgressBlurb;

  /// No description provided for @instructionChapterRhythmTitle.
  ///
  /// In en, this message translates to:
  /// **'Rhythm and recovery'**
  String get instructionChapterRhythmTitle;

  /// No description provided for @instructionChapterRhythmBlurb.
  ///
  /// In en, this message translates to:
  /// **'The weekly rhythm gauge and the deload week.'**
  String get instructionChapterRhythmBlurb;

  /// No description provided for @instructionChapterDataTitle.
  ///
  /// In en, this message translates to:
  /// **'History and data'**
  String get instructionChapterDataTitle;

  /// No description provided for @instructionChapterDataBlurb.
  ///
  /// In en, this message translates to:
  /// **'Calendar, editing records, statistics, and backup.'**
  String get instructionChapterDataBlurb;

  /// No description provided for @instructionChapterCoachTitle.
  ///
  /// In en, this message translates to:
  /// **'Coach mode'**
  String get instructionChapterCoachTitle;

  /// No description provided for @instructionChapterCoachBlurb.
  ///
  /// In en, this message translates to:
  /// **'Clients, schedule, session plan, and print.'**
  String get instructionChapterCoachBlurb;

  /// No description provided for @instructionPhilosophy.
  ///
  /// In en, this message translates to:
  /// **'IronVibe does not teach you how to train and does not hand you ready-made programs — that is what a coach and your own experience are for. There is no catalog of thousands of exercises: you type movement names in your own words, and the app quietly does the counting. Everything stays on the device: no accounts, no subscriptions, no ads.'**
  String get instructionPhilosophy;

  /// No description provided for @instructionSectionHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get instructionSectionHome;

  /// No description provided for @instructionThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get instructionThemeTitle;

  /// No description provided for @instructionThemeDesc.
  ///
  /// In en, this message translates to:
  /// **'The sun–moon switch changes light and dark. Your choice is remembered.'**
  String get instructionThemeDesc;

  /// No description provided for @instructionTrainSelfTitle.
  ///
  /// In en, this message translates to:
  /// **'I train myself'**
  String get instructionTrainSelfTitle;

  /// No description provided for @instructionTrainSelfDesc.
  ///
  /// In en, this message translates to:
  /// **'Your space: workouts, calendar, personal progress, favorites, and the rhythm gauge.'**
  String get instructionTrainSelfDesc;

  /// No description provided for @instructionTrainOthersTitle.
  ///
  /// In en, this message translates to:
  /// **'I train others'**
  String get instructionTrainOthersTitle;

  /// No description provided for @instructionTrainOthersDesc.
  ///
  /// In en, this message translates to:
  /// **'Coach mode: clients, a schedule, and a separate history for each person. It never mixes with your own training.'**
  String get instructionTrainOthersDesc;

  /// No description provided for @instructionLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get instructionLanguageTitle;

  /// No description provided for @instructionLanguageDesc.
  ///
  /// In en, this message translates to:
  /// **'The app follows the system language — there is no separate setting. Ten languages are supported.'**
  String get instructionLanguageDesc;

  /// No description provided for @instructionHomeLinksTitle.
  ///
  /// In en, this message translates to:
  /// **'Version and contact'**
  String get instructionHomeLinksTitle;

  /// No description provided for @instructionHomeLinksDesc.
  ///
  /// In en, this message translates to:
  /// **'At the bottom of the home screen: version number, website, Telegram, support email, and the privacy policy.'**
  String get instructionHomeLinksDesc;

  /// No description provided for @instructionSectionAthleteMenu.
  ///
  /// In en, this message translates to:
  /// **'Your training'**
  String get instructionSectionAthleteMenu;

  /// No description provided for @instructionStartWorkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Start workout'**
  String get instructionStartWorkoutTitle;

  /// No description provided for @instructionStartWorkoutDesc.
  ///
  /// In en, this message translates to:
  /// **'Opens an empty session — the last workout is not copied. Add exercises, log sets, then finish to save.'**
  String get instructionStartWorkoutDesc;

  /// No description provided for @instructionQuickWorkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick workout'**
  String get instructionQuickWorkoutTitle;

  /// No description provided for @instructionQuickWorkoutDesc.
  ///
  /// In en, this message translates to:
  /// **'Builds a full-body session from four exercises using your muscle-group tags.'**
  String get instructionQuickWorkoutDesc;

  /// No description provided for @instructionCalendarMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout calendar'**
  String get instructionCalendarMenuTitle;

  /// No description provided for @instructionCalendarMenuDesc.
  ///
  /// In en, this message translates to:
  /// **'The days you trained. Open saved sessions here, or add one you missed.'**
  String get instructionCalendarMenuDesc;

  /// No description provided for @instructionSectionPersonalProgress.
  ///
  /// In en, this message translates to:
  /// **'Personal progress'**
  String get instructionSectionPersonalProgress;

  /// No description provided for @instructionPersonalProgressMenuDesc.
  ///
  /// In en, this message translates to:
  /// **'A table of best sets, estimated 1RM, and max volume for every movement.'**
  String get instructionPersonalProgressMenuDesc;

  /// No description provided for @instructionFavoritesMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorite exercises'**
  String get instructionFavoritesMenuTitle;

  /// No description provided for @instructionFavoritesMenuDesc.
  ///
  /// In en, this message translates to:
  /// **'Movements marked with a star. Build a workout from them in a couple of taps.'**
  String get instructionFavoritesMenuDesc;

  /// No description provided for @instructionSectionWorkout.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get instructionSectionWorkout;

  /// No description provided for @instructionStrengthCardioTitle.
  ///
  /// In en, this message translates to:
  /// **'Strength or cardio'**
  String get instructionStrengthCardioTitle;

  /// No description provided for @instructionStrengthCardioDesc.
  ///
  /// In en, this message translates to:
  /// **'The switch at the top of the session sets the workout type. Strength: weight, reps, and RIR. Cardio: time and intensity. If the other type is already logged, the app asks before switching.'**
  String get instructionStrengthCardioDesc;

  /// No description provided for @instructionAddExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Add exercise'**
  String get instructionAddExerciseTitle;

  /// No description provided for @instructionAddExerciseBody.
  ///
  /// In en, this message translates to:
  /// **'A new block is added once the current exercise has a name and at least one completed set.'**
  String get instructionAddExerciseBody;

  /// No description provided for @instructionPreviousHintsTitle.
  ///
  /// In en, this message translates to:
  /// **'Grey hints'**
  String get instructionPreviousHintsTitle;

  /// No description provided for @instructionPreviousHintsDesc.
  ///
  /// In en, this message translates to:
  /// **'Last time\'s weight and reps show in grey — a target to beat, not a logged set. Only numbers you type yourself go into history.'**
  String get instructionPreviousHintsDesc;

  /// No description provided for @instructionRemoveExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove exercise'**
  String get instructionRemoveExerciseTitle;

  /// No description provided for @instructionRemoveExerciseDesc.
  ///
  /// In en, this message translates to:
  /// **'The red X removes the block from the current session. Saved history is not changed.'**
  String get instructionRemoveExerciseDesc;

  /// No description provided for @instructionSectionSetControl.
  ///
  /// In en, this message translates to:
  /// **'Set row'**
  String get instructionSectionSetControl;

  /// No description provided for @instructionSetPlusLabel.
  ///
  /// In en, this message translates to:
  /// **'Plus'**
  String get instructionSetPlusLabel;

  /// No description provided for @instructionSetPlusDesc.
  ///
  /// In en, this message translates to:
  /// **'Adds an empty row for the next set.'**
  String get instructionSetPlusDesc;

  /// No description provided for @instructionSetMinusLabel.
  ///
  /// In en, this message translates to:
  /// **'Minus'**
  String get instructionSetMinusLabel;

  /// No description provided for @instructionSetMinusDesc.
  ///
  /// In en, this message translates to:
  /// **'Removes the last set. An empty row is deleted at once; a filled one after confirmation. If only one set remains, the fields are simply cleared.'**
  String get instructionSetMinusDesc;

  /// No description provided for @instructionSetProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Exercise chart'**
  String get instructionSetProgressLabel;

  /// No description provided for @instructionSetProgressDesc.
  ///
  /// In en, this message translates to:
  /// **'Opens the trend for this movement over a month, a year, or all time.'**
  String get instructionSetProgressDesc;

  /// No description provided for @instructionExerciseVolumeTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise tonnage'**
  String get instructionExerciseVolumeTitle;

  /// No description provided for @instructionExerciseVolumeDesc.
  ///
  /// In en, this message translates to:
  /// **'To the right of the chart button: the sum of weight × reps across every completed set. Updates as you type.'**
  String get instructionExerciseVolumeDesc;

  /// No description provided for @instructionSectionInputs.
  ///
  /// In en, this message translates to:
  /// **'What the fields mean'**
  String get instructionSectionInputs;

  /// No description provided for @instructionWeightTitle.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get instructionWeightTitle;

  /// No description provided for @instructionWeightBody.
  ///
  /// In en, this message translates to:
  /// **'Working load on the bar or machine. Enter kilograms or pounds — the app does not convert units and does not force a choice.'**
  String get instructionWeightBody;

  /// No description provided for @instructionRepsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reps'**
  String get instructionRepsTitle;

  /// No description provided for @instructionRepsBody.
  ///
  /// In en, this message translates to:
  /// **'How many repetitions you did in the set.'**
  String get instructionRepsBody;

  /// No description provided for @instructionRirTitle.
  ///
  /// In en, this message translates to:
  /// **'RIR — reps in reserve'**
  String get instructionRirTitle;

  /// No description provided for @instructionRirBody.
  ///
  /// In en, this message translates to:
  /// **'How many more reps you could have done. 0 is work to failure, ∞ is a warm-up set. A simple way to dose intensity.'**
  String get instructionRirBody;

  /// No description provided for @instructionOneRmTitle.
  ///
  /// In en, this message translates to:
  /// **'1RM — one-rep max'**
  String get instructionOneRmTitle;

  /// No description provided for @instructionOneRmDesc.
  ///
  /// In en, this message translates to:
  /// **'An estimated max for a single repetition, using the Epley formula from that set\'s weight and reps. Shown under the row — a key strength landmark.'**
  String get instructionOneRmDesc;

  /// No description provided for @instructionSectionCardio.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get instructionSectionCardio;

  /// No description provided for @instructionCardioTitle.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get instructionCardioTitle;

  /// No description provided for @instructionCardioBody.
  ///
  /// In en, this message translates to:
  /// **'Block duration in minutes. No distance and no heart rate: the app is not tied to trackers.'**
  String get instructionCardioBody;

  /// No description provided for @instructionIntensityTitle.
  ///
  /// In en, this message translates to:
  /// **'Intensity'**
  String get instructionIntensityTitle;

  /// No description provided for @instructionIntensityBody.
  ///
  /// In en, this message translates to:
  /// **'Effort from 1 to 5 — a simplified RPE scale. In a cardio session, one row is saved per exercise.'**
  String get instructionIntensityBody;

  /// No description provided for @instructionSectionSaving.
  ///
  /// In en, this message translates to:
  /// **'Finishing'**
  String get instructionSectionSaving;

  /// No description provided for @instructionFinishTitle.
  ///
  /// In en, this message translates to:
  /// **'Finish workout'**
  String get instructionFinishTitle;

  /// No description provided for @instructionFinishBody.
  ///
  /// In en, this message translates to:
  /// **'The button at the bottom of the session: the app confirms, then writes the workout to history. You need at least one completed set.'**
  String get instructionFinishBody;

  /// No description provided for @instructionLeaveWorkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Leaving early'**
  String get instructionLeaveWorkoutTitle;

  /// No description provided for @instructionLeaveWorkoutDesc.
  ///
  /// In en, this message translates to:
  /// **'If you close a session that already has data, you can stay, save what you logged, or delete the draft.'**
  String get instructionLeaveWorkoutDesc;

  /// No description provided for @instructionAutoSaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Interrupted workout'**
  String get instructionAutoSaveTitle;

  /// No description provided for @instructionAutoSaveDesc.
  ///
  /// In en, this message translates to:
  /// **'A draft is saved on its own — every minute and when you background the app. Next launch, you can continue from the same place or delete it.'**
  String get instructionAutoSaveDesc;

  /// No description provided for @instructionScreenAwakeTitle.
  ///
  /// In en, this message translates to:
  /// **'Screen stays on'**
  String get instructionScreenAwakeTitle;

  /// No description provided for @instructionScreenAwakeDesc.
  ///
  /// In en, this message translates to:
  /// **'During a live session the screen stays awake, so you do not unlock the phone after every set.'**
  String get instructionScreenAwakeDesc;

  /// No description provided for @instructionStopwatchWhyTitle.
  ///
  /// In en, this message translates to:
  /// **'Why time rest'**
  String get instructionStopwatchWhyTitle;

  /// No description provided for @instructionStopwatchWhyBody.
  ///
  /// In en, this message translates to:
  /// **'The pause between sets is a working parameter, same as weight and reps: short rest raises density, long rest lets you hit a heavy set.'**
  String get instructionStopwatchWhyBody;

  /// No description provided for @instructionStopwatchHowTitle.
  ///
  /// In en, this message translates to:
  /// **'Start, pause, reset'**
  String get instructionStopwatchHowTitle;

  /// No description provided for @instructionStopwatchHowBody.
  ///
  /// In en, this message translates to:
  /// **'The timer is pinned in the session header and stays visible as you scroll. Time and controls sit in the center; in normal mode it counts up, including hundredths of a second.'**
  String get instructionStopwatchHowBody;

  /// No description provided for @instructionStopwatchIntervalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Left: intervals'**
  String get instructionStopwatchIntervalsTitle;

  /// No description provided for @instructionStopwatchIntervalsBody.
  ///
  /// In en, this message translates to:
  /// **'1/1 — a minute of work and a minute of rest. 4/4 — four minutes each. 20/10 — Tabata. Phases loop until you pause or reset: red tint is work, blue is rest.'**
  String get instructionStopwatchIntervalsBody;

  /// No description provided for @instructionStopwatchRestTitle.
  ///
  /// In en, this message translates to:
  /// **'Right: rest'**
  String get instructionStopwatchRestTitle;

  /// No description provided for @instructionStopwatchRestBody.
  ///
  /// In en, this message translates to:
  /// **'+1m, +2m, and +5m start a countdown between sets. If a countdown is already running, minutes are added to the remaining time; an interval loop switches to rest.'**
  String get instructionStopwatchRestBody;

  /// No description provided for @instructionStopwatchProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Phase bar'**
  String get instructionStopwatchProgressTitle;

  /// No description provided for @instructionStopwatchProgressBody.
  ///
  /// In en, this message translates to:
  /// **'In countdown and interval modes, a bar under the digits shows how much of the current phase is left.'**
  String get instructionStopwatchProgressBody;

  /// No description provided for @instructionStopwatchSoundsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sound and haptics'**
  String get instructionStopwatchSoundsTitle;

  /// No description provided for @instructionStopwatchSoundsBody.
  ///
  /// In en, this message translates to:
  /// **'Three, two, and one seconds before a phase ends — a short click and a light vibration; the phase change is louder. Sounds are built into the app: no microphone, no notification permission. Volume follows the phone settings.'**
  String get instructionStopwatchSoundsBody;

  /// No description provided for @instructionExerciseBankIntro.
  ///
  /// In en, this message translates to:
  /// **'The exercise list grows on its own: every new name from a finished workout joins the suggestions. Names are stored in uppercase so the same movement never splits in two.'**
  String get instructionExerciseBankIntro;

  /// No description provided for @instructionSectionExerciseNameTools.
  ///
  /// In en, this message translates to:
  /// **'Names'**
  String get instructionSectionExerciseNameTools;

  /// No description provided for @instructionRenameExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Rename everywhere'**
  String get instructionRenameExerciseTitle;

  /// No description provided for @instructionRenameExerciseDesc.
  ///
  /// In en, this message translates to:
  /// **'Long-press the name — in a session, in the suggestion list, or in a saved workout. It updates across history and on the charts.'**
  String get instructionRenameExerciseDesc;

  /// No description provided for @instructionRemoveFromBankTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove from suggestions'**
  String get instructionRemoveFromBankTitle;

  /// No description provided for @instructionRemoveFromBankDesc.
  ///
  /// In en, this message translates to:
  /// **'The X in the open suggestion list, or the red X in personal progress, drops the name from suggestions and from the table. Saved workouts stay untouched.'**
  String get instructionRemoveFromBankDesc;

  /// No description provided for @instructionReassignExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Reassign in a record'**
  String get instructionReassignExerciseTitle;

  /// No description provided for @instructionReassignExerciseDesc.
  ///
  /// In en, this message translates to:
  /// **'In a saved workout you can point a block at a different movement. The sets stay as they were, but they move into the new name\'s stats — only this session changes.'**
  String get instructionReassignExerciseDesc;

  /// No description provided for @instructionSectionMuscleGroups.
  ///
  /// In en, this message translates to:
  /// **'Muscle groups'**
  String get instructionSectionMuscleGroups;

  /// No description provided for @instructionMuscleGroupsIntro.
  ///
  /// In en, this message translates to:
  /// **'A group is an optional tag on your name. It is used only by the quick workout, to build a balanced full-body session. Eight groups: chest, back, shoulders, core, front thigh, rear thigh, arm curl, arm extension.'**
  String get instructionMuscleGroupsIntro;

  /// No description provided for @instructionMuscleGroupTagTitle.
  ///
  /// In en, this message translates to:
  /// **'How to tag'**
  String get instructionMuscleGroupTagTitle;

  /// No description provided for @instructionMuscleGroupTagDesc.
  ///
  /// In en, this message translates to:
  /// **'The first time you enter a new name, the app asks for a group. You can answer Later, or Not for quick workout if the movement should stay out of the mix. The chip under the name in personal progress and favorites is easy to change or clear.'**
  String get instructionMuscleGroupTagDesc;

  /// No description provided for @instructionSectionFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get instructionSectionFavorites;

  /// No description provided for @instructionFavoriteStarTitle.
  ///
  /// In en, this message translates to:
  /// **'Star'**
  String get instructionFavoriteStarTitle;

  /// No description provided for @instructionFavoriteStarDesc.
  ///
  /// In en, this message translates to:
  /// **'The star is on the exercise card in a session and in the personal progress table. Favorites stay at the top of the list.'**
  String get instructionFavoriteStarDesc;

  /// No description provided for @instructionBuildFromFavoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Build workout'**
  String get instructionBuildFromFavoritesTitle;

  /// No description provided for @instructionBuildFromFavoritesDesc.
  ///
  /// In en, this message translates to:
  /// **'On the favorites screen, tick the movements you want — the button appears at once. The session opens in that order, with grey hints from last time. For a client, the same action opens their workout.'**
  String get instructionBuildFromFavoritesDesc;

  /// No description provided for @instructionSectionQuickWorkout.
  ///
  /// In en, this message translates to:
  /// **'Quick workout'**
  String get instructionSectionQuickWorkout;

  /// No description provided for @instructionQuickWorkoutHowTitle.
  ///
  /// In en, this message translates to:
  /// **'Four slots'**
  String get instructionQuickWorkoutHowTitle;

  /// No description provided for @instructionQuickWorkoutHowDesc.
  ///
  /// In en, this message translates to:
  /// **'Chest, back, one half of the legs (front or rear thigh — never both on the same day), and one movement for shoulders, arms, or core. In each slot the app picks the group that has gone longest without work, and prefers a favorite.'**
  String get instructionQuickWorkoutHowDesc;

  /// No description provided for @instructionQuickWorkoutPreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Preview and swap'**
  String get instructionQuickWorkoutPreviewTitle;

  /// No description provided for @instructionQuickWorkoutPreviewDesc.
  ///
  /// In en, this message translates to:
  /// **'You see the full line-up before you start: any slot can be swapped for another exercise from the same group. If there are not enough tagged movements, the app says so and opens personal progress so you can add tags.'**
  String get instructionQuickWorkoutPreviewDesc;

  /// No description provided for @instructionPersonalProgressIntro.
  ///
  /// In en, this message translates to:
  /// **'One table of every movement from saved workouts. Favorites on top, the rest alphabetically; search finds a name. Open it from the training menu or from a client profile.'**
  String get instructionPersonalProgressIntro;

  /// No description provided for @instructionProgressBestSetTitle.
  ///
  /// In en, this message translates to:
  /// **'Best set'**
  String get instructionProgressBestSetTitle;

  /// No description provided for @instructionProgressBestSetDesc.
  ///
  /// In en, this message translates to:
  /// **'The set with the highest estimated 1RM across your history. For movements without weight, it is the set with the most reps.'**
  String get instructionProgressBestSetDesc;

  /// No description provided for @instructionProgressMaxVolumeTitle.
  ///
  /// In en, this message translates to:
  /// **'Max volume'**
  String get instructionProgressMaxVolumeTitle;

  /// No description provided for @instructionProgressMaxVolumeDesc.
  ///
  /// In en, this message translates to:
  /// **'The largest tonnage for this exercise in a single workout — a useful anchor when you plan working volume.'**
  String get instructionProgressMaxVolumeDesc;

  /// No description provided for @instructionSectionProgressChart.
  ///
  /// In en, this message translates to:
  /// **'Exercise chart'**
  String get instructionSectionProgressChart;

  /// No description provided for @instructionProgressChartIntro.
  ///
  /// In en, this message translates to:
  /// **'Three independent curves by date. Left axis is weight, right axis is reps; the yellow line is normalized so the trends can be compared by shape. Switch the window — month, year, all time — and tap a point for that day\'s numbers. Cardio does not appear on the chart.'**
  String get instructionProgressChartIntro;

  /// No description provided for @instructionProgressLineWeightDesc.
  ///
  /// In en, this message translates to:
  /// **'Red — heaviest weight in one set that day.'**
  String get instructionProgressLineWeightDesc;

  /// No description provided for @instructionProgressLineRepsDesc.
  ///
  /// In en, this message translates to:
  /// **'Cyan — most reps in a set, not necessarily with the heaviest weight.'**
  String get instructionProgressLineRepsDesc;

  /// No description provided for @instructionProgressLineVolumeDesc.
  ///
  /// In en, this message translates to:
  /// **'Yellow — daily tonnage: the sum of weight × reps for sets where both fields are filled.'**
  String get instructionProgressLineVolumeDesc;

  /// No description provided for @instructionProgressChartSessionHighlight.
  ///
  /// In en, this message translates to:
  /// **'In a live workout the chart button lights up when you beat a record: red for set weight, yellow for exercise tonnage, cyan for total reps on movements without weight. If more than one applies, red wins, then yellow, then cyan. Saved history has no highlight.'**
  String get instructionProgressChartSessionHighlight;

  /// No description provided for @instructionRhythmIntro.
  ///
  /// In en, this message translates to:
  /// **'Once you have at least three strength days in the last four weeks, a rhythm gauge appears at the top of the training screen. It is not a goal and not a grade — just how often you currently get to the gym.'**
  String get instructionRhythmIntro;

  /// No description provided for @instructionRhythmGaugeTitle.
  ///
  /// In en, this message translates to:
  /// **'Days per week'**
  String get instructionRhythmGaugeTitle;

  /// No description provided for @instructionRhythmGaugeDesc.
  ///
  /// In en, this message translates to:
  /// **'The arc fills from one to six days — a four-week average. Days with strength work count; cardio-only days do not. The denser the rhythm, the further the color moves from steel through gold toward rust.'**
  String get instructionRhythmGaugeDesc;

  /// No description provided for @instructionRhythmInsightTitle.
  ///
  /// In en, this message translates to:
  /// **'Rhythm breakdown'**
  String get instructionRhythmInsightTitle;

  /// No description provided for @instructionRhythmInsightDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap the gauge: the app names your mode — an easy rhythm, a steady rhythm, a dense rhythm, or almost no days off — and explains what that means for recovery. A client\'s gauge opens the same breakdown.'**
  String get instructionRhythmInsightDesc;

  /// No description provided for @instructionRhythmDeloadTitle.
  ///
  /// In en, this message translates to:
  /// **'Deload week'**
  String get instructionRhythmDeloadTitle;

  /// No description provided for @instructionRhythmDeloadDesc.
  ///
  /// In en, this message translates to:
  /// **'A deload is not a pause — it is a week at half power: working weights and set counts down 30–50%, or cardio only. Muscle recovers faster than ligaments, tendons, and joints — this week lets them catch up.'**
  String get instructionRhythmDeloadDesc;

  /// No description provided for @instructionRhythmNudgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get instructionRhythmNudgeTitle;

  /// No description provided for @instructionRhythmNudgeDesc.
  ///
  /// In en, this message translates to:
  /// **'If you hold two and a half sessions a week or more and have not deloaded in a while, the app suggests taking such a week. The denser the rhythm, the sooner the hint appears. It shows at most once a week, in personal mode only — and it stays a recommendation, not medical advice.'**
  String get instructionRhythmNudgeDesc;

  /// No description provided for @instructionSectionCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar and history'**
  String get instructionSectionCalendar;

  /// No description provided for @instructionCalendarBrowseTitle.
  ///
  /// In en, this message translates to:
  /// **'How to browse'**
  String get instructionCalendarBrowseTitle;

  /// No description provided for @instructionCalendarBrowseDesc.
  ///
  /// In en, this message translates to:
  /// **'Swipe to change months; tap the month name for a quick date picker. A dot under a day means there was a workout.'**
  String get instructionCalendarBrowseDesc;

  /// No description provided for @instructionCalendarAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Backdated entry'**
  String get instructionCalendarAddTitle;

  /// No description provided for @instructionCalendarAddDesc.
  ///
  /// In en, this message translates to:
  /// **'Pick a day, set a time, and add a workout — including a date already past. Handy if you forgot to log the session.'**
  String get instructionCalendarAddDesc;

  /// No description provided for @instructionNavHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout tonnage'**
  String get instructionNavHistoryTitle;

  /// No description provided for @instructionNavHistoryDesc.
  ///
  /// In en, this message translates to:
  /// **'Every saved session shows total tonnage. Volume is one of the most reliable hypertrophy landmarks: what matters is not a single-day record, but how it holds from week to week.'**
  String get instructionNavHistoryDesc;

  /// No description provided for @instructionHistoryEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Editing records'**
  String get instructionHistoryEditTitle;

  /// No description provided for @instructionHistoryEditDesc.
  ///
  /// In en, this message translates to:
  /// **'A saved workout can be expanded and edited: add an exercise or a set, change the numbers, or delete the session. Changes save immediately.'**
  String get instructionHistoryEditDesc;

  /// No description provided for @instructionSectionStats.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get instructionSectionStats;

  /// No description provided for @instructionStatsTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout summary'**
  String get instructionStatsTitle;

  /// No description provided for @instructionStatsDesc.
  ///
  /// In en, this message translates to:
  /// **'The chart icon in the header of the training or coach screen: how many sessions this month, this year, and all time. In coach mode it also breaks the count down per client.'**
  String get instructionStatsDesc;

  /// No description provided for @instructionSectionBackup.
  ///
  /// In en, this message translates to:
  /// **'Backup'**
  String get instructionSectionBackup;

  /// No description provided for @instructionNavImportExportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export and import'**
  String get instructionNavImportExportTitle;

  /// No description provided for @instructionNavImportExportDesc.
  ///
  /// In en, this message translates to:
  /// **'Export packs history, the exercise list, favorites, group tags, clients, and the schedule into one JSON file. Import merges the file into current data and skips duplicates — nothing is wiped. A coach backup is separate from a personal one.'**
  String get instructionNavImportExportDesc;

  /// No description provided for @instructionBackupNudgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup reminder'**
  String get instructionBackupNudgeTitle;

  /// No description provided for @instructionBackupNudgeDesc.
  ///
  /// In en, this message translates to:
  /// **'Data lives on this device only: no accounts, no cloud. Every four weeks the app offers to save a copy — if the phone is lost, history comes back only from that file.'**
  String get instructionBackupNudgeDesc;

  /// No description provided for @instructionTrainerIntro.
  ///
  /// In en, this message translates to:
  /// **'I train others is a separate space for working with people: clients, a schedule, and a history per person. Personal workouts and coach data never cross.'**
  String get instructionTrainerIntro;

  /// No description provided for @instructionClientsTitle.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get instructionClientsTitle;

  /// No description provided for @instructionClientsDesc.
  ///
  /// In en, this message translates to:
  /// **'A list with the goal, last session, and next session. The card holds goal, weight, height, and private coach notes. The name is set at creation and cannot be changed later.'**
  String get instructionClientsDesc;

  /// No description provided for @instructionClientProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Client profile'**
  String get instructionClientProfileTitle;

  /// No description provided for @instructionClientProfileDesc.
  ///
  /// In en, this message translates to:
  /// **'Today\'s session starts here, along with progress, favorites, and history by month. If there are enough strength days, the rhythm gauge is here too. Deleting a client removes future sessions; past workouts stay for reporting.'**
  String get instructionClientProfileDesc;

  /// No description provided for @instructionTrainerScheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get instructionTrainerScheduleTitle;

  /// No description provided for @instructionTrainerScheduleDesc.
  ///
  /// In en, this message translates to:
  /// **'The coach calendar shows sessions for every client: a play icon means planned, a check means finished, an hourglass means today is in progress. Empty plans from past days are cleared on their own.'**
  String get instructionTrainerScheduleDesc;

  /// No description provided for @instructionTrainerPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Session plan'**
  String get instructionTrainerPlanTitle;

  /// No description provided for @instructionTrainerPlanDesc.
  ///
  /// In en, this message translates to:
  /// **'For a future date you can lay out exercises and a note in advance and save without finishing the workout. Last weights and reps arrive as grey hints. Only finished sessions go into history.'**
  String get instructionTrainerPlanDesc;

  /// No description provided for @instructionTrainerRepeatTitle.
  ///
  /// In en, this message translates to:
  /// **'Repeat last'**
  String get instructionTrainerRepeatTitle;

  /// No description provided for @instructionTrainerRepeatDesc.
  ///
  /// In en, this message translates to:
  /// **'From the client profile, or as a switch when adding a session on the calendar. The exercise list is copied; weights and reps come as grey hints, not as finished sets.'**
  String get instructionTrainerRepeatDesc;

  /// No description provided for @instructionPrintSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Print a session'**
  String get instructionPrintSessionTitle;

  /// No description provided for @instructionPrintSessionDesc.
  ///
  /// In en, this message translates to:
  /// **'On a finished workout, the print icon in the header builds an A4 sheet with that day\'s line-up and numbers. Then the system sheet: printer, PDF, or send to the client.'**
  String get instructionPrintSessionDesc;

  /// No description provided for @instructionImportAthleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Import an athlete\'s history'**
  String get instructionImportAthleteTitle;

  /// No description provided for @instructionImportAthleteDesc.
  ///
  /// In en, this message translates to:
  /// **'A dedicated button in coach statistics: a file from personal mode becomes a new client, including favorites and group tags. Transferred workouts are marked as imported, and exercise names stay separate from yours.'**
  String get instructionImportAthleteDesc;

  /// No description provided for @printSession.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get printSession;

  /// No description provided for @printSessionEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing to print yet. Log at least one set.'**
  String get printSessionEmpty;

  /// No description provided for @printSessionShareText.
  ///
  /// In en, this message translates to:
  /// **'IronVibe session'**
  String get printSessionShareText;

  /// No description provided for @rhythmPerWeek.
  ///
  /// In en, this message translates to:
  /// **'per week'**
  String get rhythmPerWeek;

  /// No description provided for @deloadNudgeTitle.
  ///
  /// In en, this message translates to:
  /// **'An active recovery week?'**
  String get deloadNudgeTitle;

  /// No description provided for @deloadNudgeBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve been training about {rate} days a week for roughly {weeks} weeks. A good moment for an active recovery week: working weights and sets down 30–50%, or cardio only. This is a recommendation, not medical advice.'**
  String deloadNudgeBody(String rate, int weeks);

  /// No description provided for @deloadNudgeLater.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get deloadNudgeLater;

  /// No description provided for @deloadNudgeOk.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get deloadNudgeOk;

  /// No description provided for @backupNudgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Save a backup?'**
  String get backupNudgeTitle;

  /// No description provided for @backupNudgeBody.
  ///
  /// In en, this message translates to:
  /// **'Your data lives only on this device. If it is lost or storage fails, that history is gone. Share a copy now, or postpone for 28 days.'**
  String get backupNudgeBody;

  /// No description provided for @backupNudgeShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get backupNudgeShare;

  /// No description provided for @backupNudgeLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get backupNudgeLater;

  /// No description provided for @rhythmInsightTitle.
  ///
  /// In en, this message translates to:
  /// **'Training rhythm'**
  String get rhythmInsightTitle;

  /// No description provided for @rhythmInsightRateYou.
  ///
  /// In en, this message translates to:
  /// **'You train about {rate} times a week on average.'**
  String rhythmInsightRateYou(String rate);

  /// No description provided for @rhythmInsightRateClient.
  ///
  /// In en, this message translates to:
  /// **'{name} trains about {rate} times a week on average.'**
  String rhythmInsightRateClient(String name, String rate);

  /// No description provided for @rhythmInsightBandLight.
  ///
  /// In en, this message translates to:
  /// **'An easy rhythm'**
  String get rhythmInsightBandLight;

  /// No description provided for @rhythmInsightBandSteady.
  ///
  /// In en, this message translates to:
  /// **'A steady rhythm'**
  String get rhythmInsightBandSteady;

  /// No description provided for @rhythmInsightBandDense.
  ///
  /// In en, this message translates to:
  /// **'A dense rhythm'**
  String get rhythmInsightBandDense;

  /// No description provided for @rhythmInsightBandVeryDense.
  ///
  /// In en, this message translates to:
  /// **'Almost no days off'**
  String get rhythmInsightBandVeryDense;

  /// No description provided for @rhythmInsightHowTitle.
  ///
  /// In en, this message translates to:
  /// **'Where this number comes from'**
  String get rhythmInsightHowTitle;

  /// No description provided for @rhythmInsightWindow.
  ///
  /// In en, this message translates to:
  /// **'Average over the last four weeks. Days with strength work count; cardio-only days do not. This is not a goal and not a grade — just your current rhythm.'**
  String get rhythmInsightWindow;

  /// No description provided for @rhythmInsightWhatTitle.
  ///
  /// In en, this message translates to:
  /// **'Active recovery week'**
  String get rhythmInsightWhatTitle;

  /// No description provided for @rhythmInsightWhatBody.
  ///
  /// In en, this message translates to:
  /// **'Not a pause — a week at half power: working weights and set counts down 30–50%. You can skip strength entirely and keep cardio or any other activity. Muscle recovers faster than joints, ligaments, and tendons — this week gives them time to catch up.'**
  String get rhythmInsightWhatBody;

  /// No description provided for @rhythmInsightPaceTitle.
  ///
  /// In en, this message translates to:
  /// **'What this means'**
  String get rhythmInsightPaceTitle;

  /// No description provided for @rhythmInsightAdviceLight.
  ///
  /// In en, this message translates to:
  /// **'There are enough rest days between sessions that fatigue does not stack. No need to plan active recovery yet — at this rhythm the body recovers on its own.'**
  String get rhythmInsightAdviceLight;

  /// No description provided for @rhythmInsightAdviceSteady.
  ///
  /// In en, this message translates to:
  /// **'A steady rhythm you can live on for years. If the sessions are hard, take an active recovery week every few months — better early than after the weights stall.'**
  String get rhythmInsightAdviceSteady;

  /// No description provided for @rhythmInsightAdviceDense.
  ///
  /// In en, this message translates to:
  /// **'Sessions sit close together, and fatigue builds quietly. An active recovery week every two or three months usually keeps progress better than grinding without a break.'**
  String get rhythmInsightAdviceDense;

  /// No description provided for @rhythmInsightAdviceVeryDense.
  ///
  /// In en, this message translates to:
  /// **'Almost every day under load. That can work if sleep and food keep up. At this rhythm an active recovery week about once a month is ordinary care for joints and ligaments, not a cop-out.'**
  String get rhythmInsightAdviceVeryDense;

  /// No description provided for @rhythmInsightPraiseSteady.
  ///
  /// In en, this message translates to:
  /// **'This is the rhythm people keep for years.'**
  String get rhythmInsightPraiseSteady;

  /// No description provided for @rhythmInsightPraiseDense.
  ///
  /// In en, this message translates to:
  /// **'You train often — a schedule like that does not happen by itself.'**
  String get rhythmInsightPraiseDense;

  /// No description provided for @rhythmInsightPraiseVeryDense.
  ///
  /// In en, this message translates to:
  /// **'Looks like you found the body\'s secret mode.'**
  String get rhythmInsightPraiseVeryDense;

  /// No description provided for @rhythmInsightRecentLighter.
  ///
  /// In en, this message translates to:
  /// **'Load already dropped recently — active recovery can count as done. Pick the pace back up.'**
  String get rhythmInsightRecentLighter;

  /// No description provided for @rhythmInsightAccumulation.
  ///
  /// In en, this message translates to:
  /// **'{weeks, plural, =1{This rhythm has held for {weeks} week.} other{This rhythm has held for {weeks} weeks.}}'**
  String rhythmInsightAccumulation(int weeks);

  /// No description provided for @rhythmInsightDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is a recommendation, not medical advice. If you feel fine, nothing has to change.'**
  String get rhythmInsightDisclaimer;
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
