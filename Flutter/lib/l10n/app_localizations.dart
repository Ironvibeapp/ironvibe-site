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

  /// No description provided for @instructionPhilosophy.
  ///
  /// In en, this message translates to:
  /// **'IronVibe deliberately ships without a built-in exercise catalog or preset \"programs.\" It is not here to teach you how to train—YouTube and real coaches already do that—but to help you keep stats exactly the way you like. You type exercise names yourself, in your own words. Optionally tag a muscle group so the app can assemble a quick full-body session from your own list. The longer you use it, the more it feels like home: the app learns your habits and adapts to you, not the other way around.'**
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
  /// **'Removes the last set. If that row already has weight, reps, or RIR, the app asks for confirmation. An empty row is removed right away. If only one set remains: in the current workout the row is cleared; in saved history the whole exercise is deleted.'**
  String get instructionSetMinusDesc;

  /// No description provided for @instructionSetPlusLabel.
  ///
  /// In en, this message translates to:
  /// **'Plus'**
  String get instructionSetPlusLabel;

  /// No description provided for @instructionSetPlusDesc.
  ///
  /// In en, this message translates to:
  /// **'Adds a new empty set row to this exercise.'**
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
  /// **'Three independent trends by date: red — heaviest single set that day; cyan — most reps in any single set that day; yellow — exercise volume (sum of weight × reps for that day). Left axis: weight; right axis: reps; yellow is shown as a normalized trend.'**
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

  /// No description provided for @instructionProgressLineVolumeDesc.
  ///
  /// In en, this message translates to:
  /// **'Yellow line: daily exercise volume (tonnage), calculated as the sum of weight × reps for sets where both values are logged.'**
  String get instructionProgressLineVolumeDesc;

  /// No description provided for @instructionProgressChartSessionHighlight.
  ///
  /// In en, this message translates to:
  /// **'During an active workout, the chart button under the sets may tint in the same colors as the graph: red if you beat your previous best weight in a single set; yellow if total exercise volume beats your past best for that movement; cyan if the exercise is bodyweight-only and your total reps (sum across all sets) beat your past best. If several apply, priority is red, then yellow, then cyan. The tint appears only while you are logging the current workout—not in saved history.'**
  String get instructionProgressChartSessionHighlight;

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
  /// **'Adds a new block. Name the current exercise first — the app will remind you if that field is still empty.'**
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
  /// **'When the suggestions list is open under the name field, tap the X on a row — or the red X in Personal Progress — to remove that name from suggestions and the progress table. Saved workouts stay unchanged.'**
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
  /// **'Load on the bar or equipment. Type the number in kg or lb — whichever you use. The app does not convert units.'**
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
  /// **'One table of every movement from saved workouts: best set, estimated 1RM, and max volume. Search to find a name. Star favorites; tap the small chip under the name to tag a muscle group; the red X removes the name from suggestions and this table (saved workouts stay). Open it from your training menu or a client profile.'**
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
  /// **'Confirms and writes the session to history. If you leave earlier, you can save, discard, or stay. A draft is also kept automatically if the app is interrupted.'**
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
  /// **'In calendar/history each workout shows total tonnage. Workout volume is one of the best indicators of hypertrophy: the more quality volume you accumulate, the more muscle you can build.'**
  String get instructionNavHistoryDesc;

  /// No description provided for @instructionNavImportExportTitle.
  ///
  /// In en, this message translates to:
  /// **'Import / export'**
  String get instructionNavImportExportTitle;

  /// No description provided for @instructionNavImportExportDesc.
  ///
  /// In en, this message translates to:
  /// **'Back up or transfer your data using JSON export and import in the statistics dialog. Backups include workout history, your exercise list, favorites, and muscle-group tags. Coach backups are separate from personal history. A coach can also import an athlete\'s history as a new client without mixing exercise names.'**
  String get instructionNavImportExportDesc;

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
  /// **'The sun / moon switch on the home screen toggles light and dark. Your choice is remembered.'**
  String get instructionThemeDesc;

  /// No description provided for @instructionTrainSelfTitle.
  ///
  /// In en, this message translates to:
  /// **'I train myself'**
  String get instructionTrainSelfTitle;

  /// No description provided for @instructionTrainSelfDesc.
  ///
  /// In en, this message translates to:
  /// **'Your own workouts, calendar, personal progress, favorites, a rhythm gauge of how often you train, and a full-body quick workout built from your tagged exercises.'**
  String get instructionTrainSelfDesc;

  /// No description provided for @instructionTrainOthersTitle.
  ///
  /// In en, this message translates to:
  /// **'I train others'**
  String get instructionTrainOthersTitle;

  /// No description provided for @instructionTrainOthersDesc.
  ///
  /// In en, this message translates to:
  /// **'Coach mode: clients, a schedule, and a separate history per person. Each client has their own progress table and favorites.'**
  String get instructionTrainOthersDesc;

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
  /// **'Opens an empty session — it does not copy the last workout. Add exercises, log sets, then finish to save.'**
  String get instructionStartWorkoutDesc;

  /// No description provided for @instructionQuickWorkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick workout'**
  String get instructionQuickWorkoutTitle;

  /// No description provided for @instructionQuickWorkoutDesc.
  ///
  /// In en, this message translates to:
  /// **'Assembles a 4-exercise full-body session: chest, back, one leg movement (front or rear thigh — never both), and one accessory for shoulders, arms, or core, whichever you have trained least recently. Prefers favorites. Last weights and reps appear greyed as a target to beat — you log each set yourself.'**
  String get instructionQuickWorkoutDesc;

  /// No description provided for @instructionCalendarMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Workout calendar'**
  String get instructionCalendarMenuTitle;

  /// No description provided for @instructionCalendarMenuDesc.
  ///
  /// In en, this message translates to:
  /// **'See which days you trained, open a saved session, or add a workout on a chosen date and time — including past days.'**
  String get instructionCalendarMenuDesc;

  /// No description provided for @instructionPersonalProgressMenuDesc.
  ///
  /// In en, this message translates to:
  /// **'A table of your best sets, estimated 1RM, and max volume. Star favorites and tag muscle groups here.'**
  String get instructionPersonalProgressMenuDesc;

  /// No description provided for @instructionFavoritesMenuTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorite exercises'**
  String get instructionFavoritesMenuTitle;

  /// No description provided for @instructionFavoritesMenuDesc.
  ///
  /// In en, this message translates to:
  /// **'Your starred list. Tick the ones you want and tap Build workout to start a session in that order. Last weights and reps appear greyed as a target to beat.'**
  String get instructionFavoritesMenuDesc;

  /// No description provided for @instructionSectionRhythm.
  ///
  /// In en, this message translates to:
  /// **'Training rhythm'**
  String get instructionSectionRhythm;

  /// No description provided for @instructionRhythmIntro.
  ///
  /// In en, this message translates to:
  /// **'After a few strength sessions, a gauge appears at the top of your training screen. It shows how many days per week you have trained on average over the last four weeks. Cardio-only days are not counted. The number is a snapshot of your density — not a target the app expects you to hit. Tap it for a note about your pace and what an active recovery week can look like.'**
  String get instructionRhythmIntro;

  /// No description provided for @instructionRhythmGaugeTitle.
  ///
  /// In en, this message translates to:
  /// **'Days per week'**
  String get instructionRhythmGaugeTitle;

  /// No description provided for @instructionRhythmGaugeDesc.
  ///
  /// In en, this message translates to:
  /// **'The arc fills from 1 to 6 days per week. Color moves from steel through gold toward rust as density rises. The gauge appears once you have at least three strength days in that four-week window.'**
  String get instructionRhythmGaugeDesc;

  /// No description provided for @instructionRhythmDeloadTitle.
  ///
  /// In en, this message translates to:
  /// **'Active recovery week reminder'**
  String get instructionRhythmDeloadTitle;

  /// No description provided for @instructionRhythmDeloadDesc.
  ///
  /// In en, this message translates to:
  /// **'If you have been training about two and a half days a week or more for several weeks without an active recovery week, the app may remind you that a short active recovery week is sometimes useful — about 30% less tonnage and reps. The more days per week, the sooner that reminder. It is a reminder, not a prescription. You will see it at most once per week, and only in your own training mode — not automatically for clients. Tap a client\'s gauge for the same note.'**
  String get instructionRhythmDeloadDesc;

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
  /// **'In Personal Progress, tap the star next to an exercise to add or remove it from favorites. Favorites stay at the top of the table.'**
  String get instructionFavoriteStarDesc;

  /// No description provided for @instructionBuildFromFavoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Build workout'**
  String get instructionBuildFromFavoritesTitle;

  /// No description provided for @instructionBuildFromFavoritesDesc.
  ///
  /// In en, this message translates to:
  /// **'On the favorites screen, tick the exercises you want. The button appears when at least one is selected. Last weights and reps appear greyed as a target to beat — you log each set yourself. For a client, the same action starts a session for that person.'**
  String get instructionBuildFromFavoritesDesc;

  /// No description provided for @instructionSectionMuscleGroups.
  ///
  /// In en, this message translates to:
  /// **'Muscle groups & quick workout'**
  String get instructionSectionMuscleGroups;

  /// No description provided for @instructionMuscleGroupsIntro.
  ///
  /// In en, this message translates to:
  /// **'Groups are optional labels you attach to your own exercise names. They are not a catalog: they only help Quick workout pick a balanced full-body mix. Eight groups: chest, back, shoulders, core, front thigh, rear thigh, arm curl, arm extension.'**
  String get instructionMuscleGroupsIntro;

  /// No description provided for @instructionMuscleGroupTagTitle.
  ///
  /// In en, this message translates to:
  /// **'How to tag'**
  String get instructionMuscleGroupTagTitle;

  /// No description provided for @instructionMuscleGroupTagDesc.
  ///
  /// In en, this message translates to:
  /// **'When you first enter a new exercise name, the app asks for a group. You can skip with Later, or mark Not for quick workout if you do not want that movement in a full-body mix. Tap the small chip under the name in Personal Progress or Favorites to change or clear it.'**
  String get instructionMuscleGroupTagDesc;

  /// No description provided for @instructionQuickWorkoutHowTitle.
  ///
  /// In en, this message translates to:
  /// **'How a quick session is built'**
  String get instructionQuickWorkoutHowTitle;

  /// No description provided for @instructionQuickWorkoutHowDesc.
  ///
  /// In en, this message translates to:
  /// **'Four slots: chest, back, one half of the legs, then shoulders/arms/core by recency. A preview lets you swap any slot for another exercise in the same group. Add more yourself if you want a longer session.'**
  String get instructionQuickWorkoutHowDesc;

  /// No description provided for @instructionStrengthCardioTitle.
  ///
  /// In en, this message translates to:
  /// **'Strength / Cardio'**
  String get instructionStrengthCardioTitle;

  /// No description provided for @instructionStrengthCardioDesc.
  ///
  /// In en, this message translates to:
  /// **'Switch at the top of the session. Strength: weight, reps, RIR. Cardio: time and intensity only — no distance field.'**
  String get instructionStrengthCardioDesc;

  /// No description provided for @instructionPreviousHintsTitle.
  ///
  /// In en, this message translates to:
  /// **'Grey last-session numbers'**
  String get instructionPreviousHintsTitle;

  /// No description provided for @instructionPreviousHintsDesc.
  ///
  /// In en, this message translates to:
  /// **'When you pick an exercise in a client session, a quick workout, or a session built from favorites, last logged weights and reps show as grey placeholders — a minimum to beat, not a finished set. Only numbers you type are saved to history.'**
  String get instructionPreviousHintsDesc;

  /// No description provided for @instructionRemoveExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove from this workout'**
  String get instructionRemoveExerciseTitle;

  /// No description provided for @instructionRemoveExerciseDesc.
  ///
  /// In en, this message translates to:
  /// **'Removes that block from the current session only. Saved history is not affected until you finish.'**
  String get instructionRemoveExerciseDesc;

  /// No description provided for @instructionReassignExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Change exercise in history'**
  String get instructionReassignExerciseTitle;

  /// No description provided for @instructionReassignExerciseDesc.
  ///
  /// In en, this message translates to:
  /// **'In a saved workout you can reassign a block to a different name. Only that session changes; charts follow the new name. Sets stay as they were.'**
  String get instructionReassignExerciseDesc;

  /// No description provided for @instructionAutoSaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Interrupted workout'**
  String get instructionAutoSaveTitle;

  /// No description provided for @instructionAutoSaveDesc.
  ///
  /// In en, this message translates to:
  /// **'If the app closes mid-session, it offers to continue where you left off or delete the unsaved draft.'**
  String get instructionAutoSaveDesc;

  /// No description provided for @instructionSectionCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get instructionSectionCalendar;

  /// No description provided for @instructionCalendarAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add on a date'**
  String get instructionCalendarAddTitle;

  /// No description provided for @instructionCalendarAddDesc.
  ///
  /// In en, this message translates to:
  /// **'Pick a day, then add a workout at a chosen time. Useful for logging a missed session.'**
  String get instructionCalendarAddDesc;

  /// No description provided for @instructionSectionTrainer.
  ///
  /// In en, this message translates to:
  /// **'Coach mode'**
  String get instructionSectionTrainer;

  /// No description provided for @instructionTrainerIntro.
  ///
  /// In en, this message translates to:
  /// **'I train others is for coaches. Add clients, schedule sessions, plan exercises ahead of time, and log workouts per person. Repeating the last session is optional. Export and import for coach data is separate from your personal history. Deleting a client removes future sessions but keeps past workouts for reporting.'**
  String get instructionTrainerIntro;

  /// No description provided for @instructionClientsTitle.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get instructionClientsTitle;

  /// No description provided for @instructionClientsDesc.
  ///
  /// In en, this message translates to:
  /// **'Add, edit, or delete clients. The list shows the last and next session. Profile fields: goal, weight, height, and private coach notes.'**
  String get instructionClientsDesc;

  /// No description provided for @instructionClientProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Client profile'**
  String get instructionClientProfileTitle;

  /// No description provided for @instructionClientProfileDesc.
  ///
  /// In en, this message translates to:
  /// **'Start today\'s session from the profile: an empty live workout. Grey last-session numbers appear only after you pick an exercise. History lists completed workouts only. Plan future sessions on the calendar. Progress and favorites are on the same screen. When there is enough recent strength work, a rhythm gauge shows how often they train; tap it for a note about pace and rest. Unsaved profile edits ask before you leave.'**
  String get instructionClientProfileDesc;

  /// No description provided for @instructionTrainerPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Plan a session'**
  String get instructionTrainerPlanTitle;

  /// No description provided for @instructionTrainerPlanDesc.
  ///
  /// In en, this message translates to:
  /// **'Plan only from the coach calendar: pick a client and date, then name exercises. Previous weights and reps appear grey as a hint. A planned session shows a play icon. Tap it to start (today) or delete. Only finished workouts go to history. A plan whose date has already passed is removed.'**
  String get instructionTrainerPlanDesc;

  /// No description provided for @instructionTrainerRepeatTitle.
  ///
  /// In en, this message translates to:
  /// **'Repeat last workout'**
  String get instructionTrainerRepeatTitle;

  /// No description provided for @instructionTrainerRepeatDesc.
  ///
  /// In en, this message translates to:
  /// **'Optional. From the client profile, or as a switch when adding a session on the calendar. Copies the last session\'s exercises into today\'s live workout or a new plan; previous weights and reps show as grey hints, not as finished sets.'**
  String get instructionTrainerRepeatDesc;

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

  /// No description provided for @instructionPrintSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Print a session'**
  String get instructionPrintSessionTitle;

  /// No description provided for @instructionPrintSessionDesc.
  ///
  /// In en, this message translates to:
  /// **'On a finished client workout, the print icon in the header makes an A4 sheet of that day as logged. Share, save, or print from the system sheet.'**
  String get instructionPrintSessionDesc;

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
  /// **'You\'ve been training about {rate} days a week for roughly {weeks} weeks. This is a reminder that a short active recovery week is sometimes useful — about 30% less tonnage and reps. Not a prescription.'**
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
  /// **'You\'ve trained about {rate} days a week over the last four weeks.'**
  String rhythmInsightRateYou(String rate);

  /// No description provided for @rhythmInsightRateClient.
  ///
  /// In en, this message translates to:
  /// **'{name} has trained about {rate} days a week over the last four weeks.'**
  String rhythmInsightRateClient(String name, String rate);

  /// No description provided for @rhythmInsightWindow.
  ///
  /// In en, this message translates to:
  /// **'Only strength days count. Cardio-only days are ignored. This is a snapshot of density, not a target.'**
  String get rhythmInsightWindow;

  /// No description provided for @rhythmInsightWhatTitle.
  ///
  /// In en, this message translates to:
  /// **'Active recovery week'**
  String get rhythmInsightWhatTitle;

  /// No description provided for @rhythmInsightWhatBody.
  ///
  /// In en, this message translates to:
  /// **'A week of deliberately lighter work so you recover without losing fitness: same sessions, about 30–50% less volume. Or skip strength days and stay moving.'**
  String get rhythmInsightWhatBody;

  /// No description provided for @rhythmInsightAdviceLight.
  ///
  /// In en, this message translates to:
  /// **'Right now the rhythm is easy. If sessions are not extremely hard, you can go a long time without a planned active recovery week.'**
  String get rhythmInsightAdviceLight;

  /// No description provided for @rhythmInsightAdviceSteady.
  ///
  /// In en, this message translates to:
  /// **'Right now this is a steady rhythm. If the work is hard, an active recovery week every few months is often enough.'**
  String get rhythmInsightAdviceSteady;

  /// No description provided for @rhythmInsightAdviceDense.
  ///
  /// In en, this message translates to:
  /// **'Right now this is a dense schedule. If sessions are intense, an active recovery week every two to three months is often worth keeping in mind.'**
  String get rhythmInsightAdviceDense;

  /// No description provided for @rhythmInsightAdviceVeryDense.
  ///
  /// In en, this message translates to:
  /// **'Right now this is nearly every day. If the load is high, an active recovery week about once a month is a common way to stay durable.'**
  String get rhythmInsightAdviceVeryDense;

  /// No description provided for @rhythmInsightPraiseSteady.
  ///
  /// In en, this message translates to:
  /// **'Well done. This is the kind of rhythm long progress is built on.'**
  String get rhythmInsightPraiseSteady;

  /// No description provided for @rhythmInsightPraiseDense.
  ///
  /// In en, this message translates to:
  /// **'Truly dedicated. Keep it up.'**
  String get rhythmInsightPraiseDense;

  /// No description provided for @rhythmInsightPraiseVeryDense.
  ///
  /// In en, this message translates to:
  /// **'Looks like you\'re trying to unlock the secret capabilities of your body.'**
  String get rhythmInsightPraiseVeryDense;

  /// No description provided for @rhythmInsightRecentLighter.
  ///
  /// In en, this message translates to:
  /// **'An active recovery week already shows up in the recent data.'**
  String get rhythmInsightRecentLighter;

  /// No description provided for @rhythmInsightAccumulation.
  ///
  /// In en, this message translates to:
  /// **'About {weeks} weeks at this density without an active recovery week.'**
  String rhythmInsightAccumulation(int weeks);

  /// No description provided for @rhythmInsightDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This is a reference note, not a prescription. It only flags that a short active recovery week can help. If you feel fine, you can leave things as they are.'**
  String get rhythmInsightDisclaimer;

  /// No description provided for @instructionHubManifest.
  ///
  /// In en, this message translates to:
  /// **'No built-in catalog or preset programs. You name exercises yourself; the app keeps stats your way.'**
  String get instructionHubManifest;

  /// No description provided for @instructionChapterStartTitle.
  ///
  /// In en, this message translates to:
  /// **'Getting started'**
  String get instructionChapterStartTitle;

  /// No description provided for @instructionChapterStartBlurb.
  ///
  /// In en, this message translates to:
  /// **'Home screen, how you train, and why the app stays out of your way.'**
  String get instructionChapterStartBlurb;

  /// No description provided for @instructionChapterToolsTitle.
  ///
  /// In en, this message translates to:
  /// **'Training tools'**
  String get instructionChapterToolsTitle;

  /// No description provided for @instructionChapterToolsBlurb.
  ///
  /// In en, this message translates to:
  /// **'Rhythm gauge, favorites, muscle tags, and quick workout.'**
  String get instructionChapterToolsBlurb;

  /// No description provided for @instructionChapterSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'In session'**
  String get instructionChapterSessionTitle;

  /// No description provided for @instructionChapterSessionBlurb.
  ///
  /// In en, this message translates to:
  /// **'Logging sets, fields, cardio, saving, and the stopwatch.'**
  String get instructionChapterSessionBlurb;

  /// No description provided for @instructionChapterProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress and data'**
  String get instructionChapterProgressTitle;

  /// No description provided for @instructionChapterProgressBlurb.
  ///
  /// In en, this message translates to:
  /// **'Personal records, the chart, calendar, history, and backup.'**
  String get instructionChapterProgressBlurb;

  /// No description provided for @instructionChapterCoachTitle.
  ///
  /// In en, this message translates to:
  /// **'Coach mode'**
  String get instructionChapterCoachTitle;

  /// No description provided for @instructionChapterCoachBlurb.
  ///
  /// In en, this message translates to:
  /// **'Clients, profiles, planned sessions, and repeating a workout.'**
  String get instructionChapterCoachBlurb;

  /// No description provided for @instructionSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search the guide'**
  String get instructionSearchHint;

  /// No description provided for @instructionSearchEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing matches that search.'**
  String get instructionSearchEmpty;
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
