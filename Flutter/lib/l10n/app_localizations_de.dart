// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'DEIN WORKOUT-VIBE';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get renameExerciseTitle => 'Übung umbenennen';

  @override
  String get renameExerciseEmpty => 'Name darf nicht leer sein';

  @override
  String get reassignHistoryExerciseTitle => 'Übung ändern';

  @override
  String get reassignHistoryExerciseBody =>
      'Nur dieses Training wird geändert. Sätze bleiben gleich; Fortschrittsdiagramme nutzen den neuen Übungsnamen.';

  @override
  String get delete => 'Löschen';

  @override
  String get yesDelete => 'Ja, löschen';

  @override
  String get close => 'Schließen';

  @override
  String get save => 'Speichern';

  @override
  String get add => 'Hinzufügen';

  @override
  String get trainOthers => 'ICH TRAINIERE ANDERE';

  @override
  String get trainSelf => 'ICH TRAINIERE MICH';

  @override
  String get statistics => 'STATISTIK';

  @override
  String get exportHistory => 'VERLAUF EXPORTIEREN';

  @override
  String get historyEmpty =>
      'Der Verlauf ist leer, es gibt noch nichts zu exportieren.';

  @override
  String get exportError => 'Exportfehler:';

  @override
  String get exportJson => 'JSON EXPORT';

  @override
  String get importData => 'IMPORT';

  @override
  String get importSuccess => 'Daten erfolgreich importiert';

  @override
  String get importError => 'Importfehler:';

  @override
  String get importNewerVersion => 'Datei von neuerer App-Version';

  @override
  String get importFileAccessError => 'Dateizugriffsfehler';

  @override
  String get importInvalidJson => 'Ungültiges JSON-Format';

  @override
  String get importInvalidBackupFile =>
      'Fehler: Ungültige Backup-Datei ausgewählt';

  @override
  String get importAthlete => 'ATHLET IMPORTIEREN';

  @override
  String importAthleteFound(int count) {
    return 'Einträge zu $count Trainingseinheiten eines Athleten gefunden, der nicht auf der Liste steht.';
  }

  @override
  String get importAthleteBackupOwn => 'ZUERST EIGENE DATEN SPEICHERN';

  @override
  String get importAthleteDecline => 'Nicht hinzufügen';

  @override
  String get importAthleteSuccess => 'Athlet hinzugefügt';

  @override
  String get importAthleteNotAthleteFile =>
      'Diese Datei ist keine Athletentrainingshistorie.';

  @override
  String get importAthleteEmpty =>
      'In dieser Datei wurden keine Trainingseinheiten gefunden.';

  @override
  String get importAthleteAlreadyImported =>
      'Diese Trainingseinheiten sind bereits auf diesem Gerät.';

  @override
  String get importAthleteUseDedicatedButton =>
      'Das sieht nach einer Athletenhistorie aus. Bitte „Athlet importieren“ verwenden.';

  @override
  String get shareText => 'IronVibe Trainingsverlauf';

  @override
  String get monthStats => 'DIESEN MONAT';

  @override
  String get yearStats => 'DIESES JAHR';

  @override
  String get allTimeStats => 'GESAMT';

  @override
  String get weight => 'Gewicht';

  @override
  String get reps => 'Wiederholungen';

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
  String get addSet => 'SATZ HINZUFÜGEN';

  @override
  String get addExercise => 'ÜBUNG HINZUFÜGEN';

  @override
  String get finishWorkout => 'TRAINING BEENDEN';

  @override
  String get finishWorkoutConfirmTitle => 'Training beenden?';

  @override
  String get finishWorkoutConfirmBody => 'Das Training wird gespeichert.';

  @override
  String get finishWorkoutConfirmAction => 'Beenden';

  @override
  String get workoutCompleteTitle => 'Training gespeichert';

  @override
  String get planChangesSavedTitle => 'Änderungen gespeichert';

  @override
  String get startWorkout => 'TRAINING STARTEN';

  @override
  String get quickWorkout => 'SCHNELLES TRAINING';

  @override
  String get quickWorkoutFullBody => 'GANZKÖRPER';

  @override
  String get quickWorkoutInsufficientTitle => 'Nicht genug Daten';

  @override
  String get quickWorkoutInsufficientBody =>
      'Für ein schnelles Training brauchst du Übungen für Brust, Rücken, eine Bein-Gruppe (vorderer oder hinterer Oberschenkel) und eine für Schultern, Arme oder Rumpf. Markiere sie unter Persönlicher Fortschritt — oder trainiere weiter: Die App fragt beim neuen Übungsnamen.';

  @override
  String get quickWorkoutOpenProgress => 'FORTSCHRITT ÖFFNEN';

  @override
  String get quickWorkoutPreviewTitle => 'SCHNELLES TRAINING · GANZKÖRPER';

  @override
  String get quickWorkoutStart => 'STARTEN';

  @override
  String get quickWorkoutSwap => 'Tauschen';

  @override
  String get quickWorkoutNoAlternatives =>
      'Keine andere Übung in dieser Gruppe';

  @override
  String get muscleGroupPromptTitle => 'Muskelgruppe';

  @override
  String get muscleGroupPromptBody => 'Für ein schnelles Ganzkörpertraining.';

  @override
  String get muscleGroupLater => 'Später';

  @override
  String get muscleGroupClear => 'Löschen';

  @override
  String get muscleGroupSkip => 'Nicht für Schnelltraining';

  @override
  String get muscleGroupChest => 'Brust';

  @override
  String get muscleGroupBack => 'Rücken';

  @override
  String get muscleGroupShoulders => 'Schultern';

  @override
  String get muscleGroupCore => 'Core';

  @override
  String get muscleGroupQuads => 'Vorderer Oberschenkel';

  @override
  String get muscleGroupHamstrings => 'Hinterer Oberschenkel';

  @override
  String get muscleGroupArmFlex => 'Armbeugung';

  @override
  String get muscleGroupArmExt => 'Armstreckung';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'TRAININGSKALENDER';

  @override
  String get personalProgress => 'PERSÖNLICHER FORTSCHRITT';

  @override
  String get personalProgressSearchHint => 'Übung suchen';

  @override
  String get personalProgressBestSet => 'Bester Satz';

  @override
  String get personalProgressMaxVolume => 'Max. Volumen';

  @override
  String get personalProgressEmpty => 'Noch keine Übungen in Workouts';

  @override
  String get favoriteExercises => 'LIEBLINGSÜBUNGEN';

  @override
  String get favoriteExercisesEmpty => 'Noch keine Lieblingsübungen';

  @override
  String get buildWorkoutFromFavorites => 'TRAINING ZUSAMMENSTELLEN';

  @override
  String get exerciseHint => 'Übungsname eingeben';

  @override
  String get deleteFromHistory => 'Aus Verlauf entfernen?';

  @override
  String get deleteExerciseHint =>
      'erscheint nicht mehr in den Vorschlägen und im persönlichen Fortschritt.';

  @override
  String get exerciseDeleted => 'entfernt';

  @override
  String get deleteWorkoutTitle => 'LÖSCHEN';

  @override
  String get deleteWorkoutMsg =>
      'Dieses Training löschen? Der Fortschrittsverlauf geht verloren.';

  @override
  String get removeSetWithDataConfirm =>
      'Satz mit Daten löschen? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get removeExerciseFromWorkout => 'Übung entfernen';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'Diese Übung aus dem Training entfernen? Das kann nicht rückgängig gemacht werden.';

  @override
  String get deleteClientTitle => 'KUNDE LÖSCHEN';

  @override
  String get deleteClientMsg =>
      'Diesen Kunden wirklich löschen? Alle seine zukünftigen Trainings werden entfernt.';

  @override
  String get noClientsTitle => 'KEINE KUNDEN';

  @override
  String get noClientsMsg => 'Zuerst Kunden im Menü „Kunden“ hinzufügen.';

  @override
  String get newClient => 'NEUER KUNDE';

  @override
  String get editClient => 'BEARBEITEN';

  @override
  String get clientName => 'Name';

  @override
  String get clientNameCannotChange =>
      'Der Name kann später nicht geändert werden.';

  @override
  String get clientNameTaken =>
      'Dieser Name ist bereits vergeben. Bitte einen anderen wählen.';

  @override
  String get clientGoal => 'Ziel';

  @override
  String get clientWeight => 'Gewicht';

  @override
  String get clientHeight => 'Größe';

  @override
  String get clientNotes => 'Notizen';

  @override
  String get saveClientChanges => 'ÄNDERUNGEN SPEICHERN';

  @override
  String get clientProfileUnsavedTitle => 'Ungespeicherte Änderungen';

  @override
  String get clientProfileUnsavedMessage =>
      'Ungespeicherte Änderungen. Vor dem Verlassen speichern?';

  @override
  String get clientProfileStay => 'Bleiben';

  @override
  String get clientProfileDiscard => 'Verlassen ohne Speichern';

  @override
  String get clientProfileSaveAndLeave => 'Speichern und verlassen';

  @override
  String get workoutRecoveryTitle => 'Training unterbrochen';

  @override
  String get workoutRecoveryMessage =>
      'Dein vorheriges Training wurde unerwartet beendet. Setze fort oder lösche die nicht gespeicherten Daten.';

  @override
  String get workoutRecoveryContinue => 'Training fortsetzen';

  @override
  String get workoutRecoveryDelete => 'Training löschen';

  @override
  String get workoutRecoverySessionMissing =>
      'Das geplante Kundentraining wurde entfernt. Der Entwurf wurde gelöscht.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Schließe zuerst die aktuelle Übung ab, bevor du eine weitere hinzufügst.';

  @override
  String get switchWorkoutTypeTitle => 'Trainingstyp wechseln?';

  @override
  String get switchWorkoutTypeBody =>
      'Bereits eingegebene Sätze des anderen Typs werden mit diesem Training nicht gespeichert.';

  @override
  String get switchWorkoutTypeConfirm => 'Wechseln';

  @override
  String get saveWorkoutNothingToSave =>
      'Noch nichts zu speichern. Gewicht und Wiederholungen oder Cardio-Dauer eintragen.';

  @override
  String get importedHistoryBadge => 'Importiert';

  @override
  String get clientWorkoutHistoryEmpty => 'Noch keine Einheiten';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Übung Nr. $n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Übung Nr. $n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return 'Nr. $n';
  }

  @override
  String get clientProfileSectionGoal => 'ZIEL';

  @override
  String get clientProfileSectionAnthropometry => 'KÖRPERDATEN';

  @override
  String get clientProfileSectionTrainerNotes => 'TRAINER-NOTIZEN';

  @override
  String get clientProfileSectionWorkoutHistory => 'TRAININGSVERLAUF';

  @override
  String get clientTrainerNotesHint => 'Verletzungen, Besonderheiten, Plan …';

  @override
  String get trainerSessionDefaultTitle => 'Training';

  @override
  String get durationMinutesShort => 'Min';

  @override
  String get addTraining => 'TRAINING HINZUFÜGEN';

  @override
  String get repeatLastWorkout => 'Letztes Training wiederholen';

  @override
  String get repeatLastUnavailable =>
      'Dieser Kunde hat noch kein Training zum Wiederholen.';

  @override
  String get editPlan => 'Plan bearbeiten';

  @override
  String get trainerSessionEmpty => 'Noch nicht geplant';

  @override
  String trainerSessionPlanned(int n) {
    return '$n geplant';
  }

  @override
  String get trainerClientsEmpty =>
      'Noch keine Kunden. Füge jemanden hinzu, um Termine zu planen.';

  @override
  String get clientNeverTrained => 'Noch keine Einheiten';

  @override
  String get clientNoUpcoming => 'Kein nächster Termin';

  @override
  String clientLastSession(String when) {
    return 'Zuletzt: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Nächste: $when';
  }

  @override
  String get clientSessionToday => 'heute';

  @override
  String get clientSessionYesterday => 'gestern';

  @override
  String get clientSessionTomorrow => 'morgen';

  @override
  String clientSessionDaysAgo(int n) {
    return 'vor $n Tagen';
  }

  @override
  String clientSessionInDays(int n) {
    return 'in $n Tagen';
  }

  @override
  String get clientProfileDetails => 'Profil';

  @override
  String get addSessionPickClient => 'Kunden wählen';

  @override
  String get clientLabel => 'Kunde';

  @override
  String get deleteClientBtn => 'KUNDE LÖSCHEN';

  @override
  String get clientsMenu => 'KUNDEN';

  @override
  String get dateHeader => 'Datum';

  @override
  String get clientHeader => 'Kunde';

  @override
  String get exerciseHeader => 'Übung';

  @override
  String get typeHeader => 'Typ';

  @override
  String get strengthType => 'Kraft';

  @override
  String get cardioType => 'Cardio';

  @override
  String get weightHeader => 'Gewicht';

  @override
  String get weightUnitsChoiceShort => 'kg / lb';

  @override
  String get progressChartWeightLegend => 'Gewicht — kg / lb (frei wählbar)';

  @override
  String get progressChartVolumeLegend => 'Volumen (Tonnage)';

  @override
  String get repsHeader => 'Wiederholungen';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'Zeit (Min)';

  @override
  String get intensityHeader => 'Intensität';

  @override
  String get setHeader => 'Satz';

  @override
  String get strength => 'Kraft';

  @override
  String get cardio => 'Cardio';

  @override
  String get timeMin => 'Zeit (Min)';

  @override
  String get intensity => 'Intensität';

  @override
  String get reserve => 'Reserve';

  @override
  String get sets => 'Sätze';

  @override
  String get time => 'Zeit';

  @override
  String get rest => 'Pause';

  @override
  String get settings => 'Einstellungen';

  @override
  String get max => 'Max';

  @override
  String get totalVolume => 'Gesamtvolumen';

  @override
  String get chart => 'Diagramm';

  @override
  String get progress => 'Fortschritt';

  @override
  String get dayMonday => 'Montag';

  @override
  String get dayTuesday => 'Dienstag';

  @override
  String get dayWednesday => 'Mittwoch';

  @override
  String get dayThursday => 'Donnerstag';

  @override
  String get dayFriday => 'Freitag';

  @override
  String get daySaturday => 'Samstag';

  @override
  String get daySunday => 'Sonntag';

  @override
  String get greetingHi => 'Hallo';

  @override
  String get greetingMorning => 'Guten Morgen';

  @override
  String get greetingAfternoon => 'Guten Tag';

  @override
  String get greetingEvening => 'Guten Abend';

  @override
  String get monthJanuary => 'Januar';

  @override
  String get monthFebruary => 'Februar';

  @override
  String get monthMarch => 'März';

  @override
  String get monthApril => 'April';

  @override
  String get monthMay => 'Mai';

  @override
  String get monthJune => 'Juni';

  @override
  String get monthJuly => 'Juli';

  @override
  String get monthAugust => 'August';

  @override
  String get monthSeptember => 'September';

  @override
  String get monthOctober => 'Oktober';

  @override
  String get monthNovember => 'November';

  @override
  String get monthDecember => 'Dezember';

  @override
  String get exerciseBenchPress => 'Bankdrücken';

  @override
  String get exerciseSquat => 'Kniebeuge';

  @override
  String get exerciseRow => 'Rudern';

  @override
  String get exerciseDeadlift => 'Kreuzheben';

  @override
  String get exerciseOverheadPress => 'Schulterdrücken';

  @override
  String get exercisePullUp => 'Klimmzug';

  @override
  String get exerciseLunges => 'Ausfallschritt';

  @override
  String get exercisePlank => 'Unterarmstütz';

  @override
  String get saveWorkout => 'TRAINING SPEICHERN';

  @override
  String get deleteWorkout => 'TRAINING LÖSCHEN';

  @override
  String get deleteTraining => 'Training löschen';

  @override
  String get deleteTrainingQuestion =>
      'Dieses Training aus dem Plan entfernen?';

  @override
  String get addSetButton => 'Satz hinzufügen';

  @override
  String get progressButton => 'Fortschritt';

  @override
  String get filterMonth => 'Monat';

  @override
  String get filterYear => 'Jahr';

  @override
  String get filterAllTime => 'Gesamte Zeit';

  @override
  String get noteLabel => 'Notiz';

  @override
  String get addClient => 'KUNDE HINZUFÜGEN';

  @override
  String get workoutsToday => 'HEUTIGE TRAININGS';

  @override
  String get workoutNumberPrefix => 'Training #';

  @override
  String get noEntries => 'Keine Einträge';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Datenschutz';

  @override
  String get instructionButton => 'ANLEITUNG';

  @override
  String get instructionTitle => 'So funktioniert die App';

  @override
  String get instructionPhilosophy =>
      'IronVibe kommt bewusst ohne feste Übungskataloge und eingebaute „Programme“. Es soll dich nicht trainieren lehren — dafür gibt es YouTube und Coaches — sondern beim Erfassen deiner Daten helfen, ganz nach deinen Vorstellungen. Du tippst Übungsnamen selbst ein. Optional kannst du eine Muskelgruppe markieren, damit die App aus deiner eigenen Liste ein schnelles Ganzkörpertraining zusammenstellt. Je länger du die App nutzt, desto mehr fühlt sie sich nach dir an: Sie passt sich an dich an, nicht umgekehrt.';

  @override
  String get instructionSectionSetControl => 'Satzsteuerung';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Entfernt den letzten Satz. Wenn in der Zeile bereits Gewicht, Wiederholungen oder RIR stehen, fragt die App nach. Eine leere Zeile wird sofort entfernt. Bleibt nur ein Satz: im aktuellen Training wird die Zeile geleert; in der gespeicherten Historie wird die ganze Übung gelöscht.';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Fügt der aktuellen Übung eine neue leere Satzzeile hinzu.';

  @override
  String get instructionSetProgressLabel => 'Zeitverlauf';

  @override
  String get instructionSetProgressDesc =>
      'Öffnet die Fortschritts-Timeline für diese Übung.';

  @override
  String get instructionSectionProgressChart => 'Fortschrittsdiagramm';

  @override
  String get instructionProgressChartIntro =>
      'Drei unabhängige Verläufe nach Datum: Rot — schwerster Satz des Tages; Cyan — meiste Wiederholungen in einem Satz; Gelb — Übungsvolumen (Summe aus Gewicht × Wiederholungen pro Tag). Links Gewicht, rechts Wiederholungen; Gelb ist als normalisierter Trend dargestellt.';

  @override
  String get instructionProgressLineWeightLabel => 'Gewicht';

  @override
  String get instructionProgressLineWeightDesc =>
      'Rote Linie: höchstes Gewicht in einem Satz pro Kalendertag.';

  @override
  String get instructionProgressLineRepsLabel => 'Wiederholungen';

  @override
  String get instructionProgressLineRepsDesc =>
      'Cyan-Linie: meiste Wiederholungen in einem Satz an diesem Tag (unabhängig vom Höchstgewicht).';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Gelbe Linie: tägliches Übungsvolumen (Tonnage), berechnet als Summe aus Gewicht × Wiederholungen für Sätze mit beiden Werten.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Während eines laufenden Trainings kann sich die Diagramm-Schaltfläche unter den Sätzen wie die Kurven einfärben: Rot, wenn du dein bisheriges Maximalgewicht in einem Satz übertriffst; Gelb, wenn das Gesamtvolumen der Übung höher ist als dein bisheriger Höchstwert; Cyan, wenn die Übung ohne Gewicht ist und die Summe der Wiederholungen über allen Sätzen höher ist als zuvor. Treffen mehrere zu, gilt die Priorität Rot, dann Gelb, dann Cyan. Die Farbe erscheint nur während der laufenden Eingabe, nicht in der gespeicherten Historie.';

  @override
  String get instructionSectionWorkout => 'Training';

  @override
  String get instructionAddExerciseTitle => 'Übung hinzufügen';

  @override
  String get instructionAddExerciseBody =>
      'Fügt einen neuen Block hinzu. Zuerst den Namen der aktuellen Übung eintragen — die App erinnert dich, wenn das Feld noch leer ist.';

  @override
  String get instructionSectionExerciseNameTools => 'Übungsname';

  @override
  String get instructionRenameExerciseTitle => 'Langes Drücken zum Umbenennen';

  @override
  String get instructionRenameExerciseDesc =>
      'Name lange drücken beim Eintragen, bei einem Vorschlag in der Liste oder auf dem Titel in einem gespeicherten Training in der Historie — der Name wird überall aktualisiert.';

  @override
  String get instructionRemoveFromBankTitle => 'Aus der Liste entfernen';

  @override
  String get instructionRemoveFromBankDesc =>
      'Ist die Vorschlagsliste unter dem Namen offen, X in der Zeile tippen — oder das rote X im persönlichen Fortschritt —, um den Namen aus Vorschlägen und der Fortschrittstabelle zu entfernen. Gespeicherte Einheiten bleiben erhalten.';

  @override
  String get instructionSectionInputs => 'Datenfelder';

  @override
  String get instructionWeightTitle => 'Gewicht';

  @override
  String get instructionWeightBody =>
      'Last an Langhantel oder Gerät. Zahl in kg oder lb eingeben — wie du trainierst. Die App rechnet Einheiten nicht um.';

  @override
  String get instructionRepsTitle => 'Wiederholungen';

  @override
  String get instructionRepsBody =>
      'Anzahl der ausgeführten Wiederholungen pro Satz.';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody =>
      'Wie viele Wiederholungen bis zum Muskelversagen noch möglich wären. Hilft bei der Intensitätssteuerung.';

  @override
  String get instructionOneRmTitle => '1RM (One-Rep-Max)';

  @override
  String get instructionOneRmDesc =>
      'Geschätztes Maximalgewicht für eine saubere Wiederholung aus aktuellem Gewicht und Wiederholungen. Wichtige Kraftreferenz für Fortschritt und Arbeitsgewichte.';

  @override
  String get instructionExerciseVolumeTitle => 'Übungsvolumen (Summe)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Unter den Sätzen neben dem Fortschritts-Button: Summe aus Gewicht × Wiederholungen für alle Sätze mit beiden Werten. Aktualisiert sich beim Eintragen.';

  @override
  String get instructionSectionPersonalProgress => 'Persönlicher Fortschritt';

  @override
  String get instructionPersonalProgressIntro =>
      'Eine Tabelle aller Bewegungen aus gespeicherten Trainings: bester Satz, geschätztes 1RM und Maximalvolumen. Die Suche findet den Namen sofort. Stern markiert Favoriten; das kleine Chip unter dem Namen setzt die Muskelgruppe; das rote X entfernt den Namen aus Vorschlägen und dieser Tabelle (gespeicherte Einheiten bleiben). Öffnen über das Trainingsmenü oder das Kundenprofil.';

  @override
  String get instructionSectionSaving => 'Speichern';

  @override
  String get instructionFinishTitle => 'Beenden';

  @override
  String get instructionFinishBody =>
      'Bestätigt und schreibt die Einheit in den Verlauf. Wenn du früher gehst, kannst du speichern, verwerfen oder bleiben. Wird die App unterbrochen, bleibt ein Entwurf automatisch erhalten.';

  @override
  String get instructionSectionCardio => 'Cardio und Intensität';

  @override
  String get instructionCardioTitle => 'Cardio';

  @override
  String get instructionCardioBody =>
      'Erfasst Zeit und Intensität im Cardio (keine Distanz). Hilft, Tempo und empfundene Anstrengung im Blick zu behalten.';

  @override
  String get instructionIntensityTitle => 'Intensität';

  @override
  String get instructionIntensityBody =>
      'Nutze die RPE-Anstrengungsskala, um zu bewerten, wie schwer das Training war. So machst du Fortschritt ohne Übertraining.';

  @override
  String get instructionSectionStopwatch => 'Stoppuhr (dein Helfer)';

  @override
  String get instructionStopwatchWhyTitle => 'Wofür ist sie?';

  @override
  String get instructionStopwatchWhyBody =>
      'Zur Kontrolle der Pausen zwischen Sätzen. Kurze Pausen erhöhen die Dichte, lange Pausen geben mehr Kraft für schwere Gewichte.';

  @override
  String get instructionStopwatchHowTitle => 'Wie funktioniert sie?';

  @override
  String get instructionStopwatchHowBody =>
      'Mitte: Zeit, Wiedergabe/Pause und Zurücksetzen. Links und rechts: Schnellwahlen (unten erklärt). Im reinen Stoppuhr-Modus läuft die Zeit mit Hundertstelsekunden hoch. Der Timer bleibt beim Scrollen in der Kopfzeile fixiert.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Links: Intervalle';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 s Arbeit, 60 s Pause. 4/4 — je 4 Minuten Arbeit und Pause pro Runde. 20/10 — Tabata: 20 s Belastung, 10 s Pause. Nach der Auswahl wechselt der Timer Arbeit und Pause im Kreis, bis du pausierst oder zurücksetzt. Rötlicher Schimmer = Arbeit, bläulich = Pause.';

  @override
  String get instructionStopwatchRestTitle => 'Rechts: Pausen-Countdown';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m und +5m starten oder verlängern einen Countdown in Minuten. Lief ein Intervallzyklus, wechselt die App zu diesem Countdown. Läuft bereits ein Countdown, werden die Minuten zur Restzeit addiert. Praktisch für Satzpausen.';

  @override
  String get instructionStopwatchProgressTitle => 'Fortschrittsbalken';

  @override
  String get instructionStopwatchProgressBody =>
      'Bei Countdown und Intervallen zeigt ein Balken unter der Zeit, wie viel von der aktuellen Phase noch übrig ist.';

  @override
  String get instructionStopwatchSoundsTitle => 'Ton & Haptik';

  @override
  String get instructionStopwatchSoundsBody =>
      'Bei 3, 2 und 1 verbleibender Sekunde kurzer In-App-Ton und leichtes haptisches Feedback. Beim Phasenwechsel oder Countdown auf null: stärkerer Ton. Minimale eingebettete Sounds — kein Mikrofon, keine Benachrichtigungsberechtigung; Gerätelautstärke wirkt weiterhin.';

  @override
  String get instructionSectionNavHistory => 'Verlauf & Daten';

  @override
  String get instructionNavHistoryTitle => 'Verlauf / Statistik';

  @override
  String get instructionNavHistoryDesc =>
      'Im Kalender/Verlauf zeigt jedes Training die gesamte Tonnage. Trainingsvolumen ist einer der besten Indikatoren für Hypertrophie: je mehr qualitatives Volumen, desto mehr Muskulatur baust du auf.';

  @override
  String get instructionNavImportExportTitle => 'Import / Export';

  @override
  String get instructionNavImportExportDesc =>
      'Daten sichern oder übertragen mit JSON-Export und -Import im Statistikdialog. Backups enthalten Verlauf, Übungsliste, Favoriten und Muskelgruppen-Tags. Trainer-Backups sind vom persönlichen Verlauf getrennt. Ein Trainer kann die Historie eines Athleten als neuen Kunden importieren, ohne Übungsnamen zu vermischen.';

  @override
  String get instructionSectionHome => 'Startseite';

  @override
  String get instructionThemeTitle => 'Design';

  @override
  String get instructionThemeDesc =>
      'Der Sonne-/Mond-Schalter auf der Startseite wechselt hell und dunkel. Die Wahl wird gespeichert.';

  @override
  String get instructionTrainSelfTitle => 'Ich trainiere selbst';

  @override
  String get instructionTrainSelfDesc =>
      'Deine Einheiten, Kalender, persönlicher Fortschritt, Favoriten, eine Rhythmus-Anzeige, wie oft du trainierst, und ein Ganzkörper-Schnelltraining aus markierten Übungen.';

  @override
  String get instructionTrainOthersTitle => 'Ich trainiere andere';

  @override
  String get instructionTrainOthersDesc =>
      'Trainer-Modus: Kunden, ein Plan und ein eigener Verlauf pro Person. Jeder Kunde hat eigene Fortschrittstabelle und Favoriten.';

  @override
  String get instructionSectionAthleteMenu => 'Dein Training';

  @override
  String get instructionStartWorkoutTitle => 'Training starten';

  @override
  String get instructionStartWorkoutDesc =>
      'Öffnet eine leere Einheit — kopiert nicht das letzte Training. Übungen hinzufügen, Sätze eintragen, dann beenden zum Speichern.';

  @override
  String get instructionQuickWorkoutTitle => 'Schnelles Training';

  @override
  String get instructionQuickWorkoutDesc =>
      'Stellt eine Ganzkörpereinheit aus 4 Übungen zusammen: Brust, Rücken, eine Beinhälfte (vorderer oder hinterer Oberschenkel — nie beides), und eine Accessory für Schultern, Arme oder Rumpf, je nachdem, was am längsten nicht trainiert wurde. Favoriten zuerst. Letzte Gewichte und Wiederholungen erscheinen grau als Ziel — jeden Satz trägst du selbst ein.';

  @override
  String get instructionCalendarMenuTitle => 'Trainingskalender';

  @override
  String get instructionCalendarMenuDesc =>
      'Siehst, an welchen Tagen du trainiert hast; öffnest eine gespeicherte Einheit oder fügst ein Training an einem gewählten Datum und Uhrzeit hinzu — auch in der Vergangenheit.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabelle mit besten Sätzen, geschätztem 1RM und Maximalvolumen. Hier Favoriten markieren und Muskelgruppen setzen.';

  @override
  String get instructionFavoritesMenuTitle => 'Lieblingsübungen';

  @override
  String get instructionFavoritesMenuDesc =>
      'Deine mit Stern markierte Liste. Gewünschte ankreuzen und „Training zusammenstellen“ tippen — die Einheit startet in dieser Reihenfolge. Letzte Gewichte und Wiederholungen erscheinen grau als Ziel.';

  @override
  String get instructionSectionRhythm => 'Trainingsrhythmus';

  @override
  String get instructionRhythmIntro =>
      'Nach ein paar Krafteinheiten erscheint oben auf dem Trainingsbildschirm eine Anzeige. Sie zeigt, an wie vielen Tagen pro Woche du in den letzten vier Wochen im Schnitt trainiert hast. Reine Cardio-Tage zählen nicht. Die Zahl ist ein Schnappschuss deiner Dichte — kein Ziel, das die App von dir erwartet. Tippe darauf für einen Hinweis zu deinem Tempo und dazu, wie eine Woche aktiver Erholung aussehen kann.';

  @override
  String get instructionRhythmGaugeTitle => 'Tage pro Woche';

  @override
  String get instructionRhythmGaugeDesc =>
      'Der Bogen füllt sich von 1 bis 6 Tagen pro Woche. Die Farbe geht von Stahl über Gold zu Rost, wenn die Dichte steigt. Die Anzeige erscheint, sobald in diesem Vier-Wochen-Fenster mindestens drei Krafttage liegen.';

  @override
  String get instructionRhythmDeloadTitle =>
      'Erinnerung an eine Woche aktiver Erholung';

  @override
  String get instructionRhythmDeloadDesc =>
      'Wenn du etwa zweieinhalb Tage pro Woche oder öfter mehrere Wochen ohne Woche aktiver Erholung trainierst, kann die App daran erinnern, dass eine kurze Woche aktiver Erholung manchmal sinnvoll ist — etwa 30 % weniger Tonnage und Wiederholungen. Je mehr Tage pro Woche, desto früher die Erinnerung. Das ist eine Erinnerung, keine Vorschrift. Höchstens einmal pro Woche, und nur im eigenen Trainingsmodus — nicht automatisch für Kunden. Tippe auf die Anzeige eines Kunden für denselben Hinweis.';

  @override
  String get instructionSectionFavorites => 'Favoriten';

  @override
  String get instructionFavoriteStarTitle => 'Stern';

  @override
  String get instructionFavoriteStarDesc =>
      'Im persönlichen Fortschritt den Stern neben einer Übung tippen, um sie zu Favoriten hinzuzufügen oder zu entfernen. Favoriten bleiben oben in der Tabelle.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Training zusammenstellen';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'Auf dem Favoriten-Bildschirm die gewünschten Übungen ankreuzen. Die Schaltfläche erscheint, sobald mindestens eine gewählt ist. Letzte Gewichte und Wiederholungen erscheinen grau als Ziel — jeden Satz trägst du selbst ein. Beim Kunden startet dieselbe Aktion eine Einheit für diese Person.';

  @override
  String get instructionSectionMuscleGroups =>
      'Muskelgruppen & Schnelltraining';

  @override
  String get instructionMuscleGroupsIntro =>
      'Gruppen sind optionale Labels an deinen eigenen Übungsnamen. Kein Katalog: sie helfen dem Schnelltraining nur, einen ausgewogenen Ganzkörper-Mix zu wählen. Acht Gruppen: Brust, Rücken, Schultern, Rumpf, vorderer Oberschenkel, hinterer Oberschenkel, Armbeugung, Armstreckung.';

  @override
  String get instructionMuscleGroupTagTitle => 'So markieren';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Beim ersten Eintragen eines neuen Namens fragt die App nach einer Gruppe. Später überspringen, oder „Nicht für Schnelltraining“ wählen, wenn die Bewegung nicht in den Ganzkörper-Mix soll. Das kleine Chip unter dem Namen in Fortschritt oder Favoriten ändert oder löscht die Markierung.';

  @override
  String get instructionQuickWorkoutHowTitle =>
      'So wird die Schnelleinheit gebaut';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Vier Slots: Brust, Rücken, eine Beinhälfte, dann Schultern/Arme/Rumpf nach Pause. In der Vorschau kannst du jeden Slot durch eine andere Übung derselben Gruppe ersetzen. Wenn es zu wenig ist, füge selbst Übungen hinzu.';

  @override
  String get instructionStrengthCardioTitle => 'Kraft / Cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Umschalter oben in der Einheit. Kraft: Gewicht, Wiederholungen, RIR. Cardio: nur Zeit und Intensität — kein Distanzfeld.';

  @override
  String get instructionPreviousHintsTitle => 'Graue Werte der letzten Einheit';

  @override
  String get instructionPreviousHintsDesc =>
      'Wenn du in einer Kundeneinheit, im Schnelltraining oder in einer Einheit aus Favoriten eine Übung wählst, erscheinen die letzten Gewichte und Wiederholungen grau — ein Minimum zum Übertreffen, kein fertiger Satz. In den Verlauf kommen nur Zahlen, die du selbst einträgst.';

  @override
  String get instructionRemoveExerciseTitle => 'Aus diesem Training entfernen';

  @override
  String get instructionRemoveExerciseDesc =>
      'Entfernt den Block nur aus der aktuellen Einheit. Der gespeicherte Verlauf ändert sich erst, wenn du beendest.';

  @override
  String get instructionReassignExerciseTitle => 'Übung in der Historie ändern';

  @override
  String get instructionReassignExerciseDesc =>
      'In einem gespeicherten Training kannst du einen Block einem anderen Namen zuweisen. Nur diese Einheit ändert sich; Diagramme folgen dem neuen Namen. Sätze bleiben wie sie waren.';

  @override
  String get instructionAutoSaveTitle => 'Unterbrochenes Training';

  @override
  String get instructionAutoSaveDesc =>
      'Schließt die App mitten in der Einheit, bietet sie an, dort weiterzumachen oder den ungespeicherten Entwurf zu löschen.';

  @override
  String get instructionSectionCalendar => 'Kalender';

  @override
  String get instructionCalendarAddTitle => 'An einem Datum hinzufügen';

  @override
  String get instructionCalendarAddDesc =>
      'Einen Tag wählen und ein Training zur gewünschten Uhrzeit hinzufügen. Praktisch, um eine verpasste Einheit nachzutragen.';

  @override
  String get instructionSectionTrainer => 'Trainer-Modus';

  @override
  String get instructionTrainerIntro =>
      '„Ich trainiere andere“ ist für Coaches. Kunden anlegen, Einheiten planen, Übungen im Voraus setzen und Trainings pro Person erfassen. Die letzte Einheit wiederholen ist optional. Export und Import der Trainerdaten sind vom persönlichen Verlauf getrennt. Beim Löschen eines Kunden entfallen künftige Termine, vergangene Trainings bleiben für die Auswertung.';

  @override
  String get instructionClientsTitle => 'Kunden';

  @override
  String get instructionClientsDesc =>
      'Kunden hinzufügen, bearbeiten oder löschen. Die Liste zeigt die letzte und nächste Einheit. Profilfelder: Ziel, Gewicht, Größe und private Trainer-Notizen.';

  @override
  String get instructionClientProfileTitle => 'Kundenprofil';

  @override
  String get instructionClientProfileDesc =>
      'Vom Profil startet eine leere heutige Einheit. Graue Zahlen der letzten Einheit erscheinen erst nach der Übungsauswahl. Der Verlauf zeigt nur abgeschlossene Trainings. Zukünftige Einheiten planst du im Kalender. Fortschritt und Favoriten sind auf demselben Bildschirm. Bei genug Kraftarbeit zuletzt zeigt eine Anzeige, wie oft die Person trainiert; tippe darauf für einen Hinweis zu Tempo und Pause. Ungespeicherte Profiländerungen fragen vor dem Verlassen nach.';

  @override
  String get instructionTrainerPlanTitle => 'Einheit planen';

  @override
  String get instructionTrainerPlanDesc =>
      'Planen nur im Trainer-Kalender: Kunde und Datum wählen, dann Übungen benennen. Vorherige Gewichte und Wiederholungen erscheinen grau als Hinweis. Geplante Einheiten haben ein Play-Symbol: antippen zum Starten (heute) oder Löschen. In den Verlauf kommen nur abgeschlossene Trainings. Ein Plan mit vergangenem Datum wird entfernt.';

  @override
  String get instructionTrainerRepeatTitle => 'Letztes Training wiederholen';

  @override
  String get instructionTrainerRepeatDesc =>
      'Optional. Vom Kundenprofil oder als Schalter beim Hinzufügen einer Einheit im Kalender. Übernimmt die Übungen der letzten Einheit in das heutige Live-Training oder einen neuen Plan; vorherige Gewichte und Wiederholungen sind graue Hinweise, keine fertigen Sätze.';

  @override
  String get printSession => 'Drucken';

  @override
  String get printSessionEmpty =>
      'Noch nichts zu drucken. Trage mindestens einen Satz ein.';

  @override
  String get printSessionShareText => 'IronVibe-Einheit';

  @override
  String get instructionPrintSessionTitle => 'Einheit drucken';

  @override
  String get instructionPrintSessionDesc =>
      'Bei einem abgeschlossenen Kundentraining macht das Druck-Symbol in der Kopfzeile ein A4-Blatt dieses Tages, so wie er erfasst wurde. Teilen, speichern oder drucken über den Systemdialog.';

  @override
  String get rhythmPerWeek => 'pro Woche';

  @override
  String get deloadNudgeTitle => 'Eine Woche aktiver Erholung?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Du trainierst etwa $rate Tage pro Woche seit rund $weeks Wochen. Das ist eine Erinnerung, dass eine kurze Woche aktiver Erholung manchmal sinnvoll ist — etwa 30 % weniger Tonnage und Wiederholungen. Keine Vorschrift.';
  }

  @override
  String get deloadNudgeLater => 'Nicht jetzt';

  @override
  String get deloadNudgeOk => 'Verstanden';

  @override
  String get backupNudgeTitle => 'Sicherung speichern?';

  @override
  String get backupNudgeBody =>
      'Deine Daten liegen nur auf diesem Gerät. Bei Verlust oder Speicherfehler ist der Verlauf weg. Teile jetzt eine Kopie oder verschiebe die Erinnerung um 28 Tage.';

  @override
  String get backupNudgeShare => 'Teilen';

  @override
  String get backupNudgeLater => 'Später';

  @override
  String get rhythmInsightTitle => 'Trainingsrhythmus';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'In den letzten vier Wochen trainierst du etwa $rate Tage pro Woche.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name trainiert in den letzten vier Wochen etwa $rate Tage pro Woche.';
  }

  @override
  String get rhythmInsightWindow =>
      'Nur Krafttage zählen. Reine Cardio-Tage fallen raus. Das ist ein Schnappschuss der Dichte, kein Ziel.';

  @override
  String get rhythmInsightWhatTitle => 'Woche aktiver Erholung';

  @override
  String get rhythmInsightWhatBody =>
      'Du senkst die Last bewusst, um dich zu erholen, ohne Form zu verlieren: dieselben Einheiten, aber etwa 30–50 % weniger Umfang. Oder du lässt die Krafttage aus und bleibst in Bewegung.';

  @override
  String get rhythmInsightAdviceLight =>
      'Gerade ist der Rhythmus ruhig. Wenn die Einheiten nicht extrem hart sind, kannst du lange ohne geplante Woche aktiver Erholung weitermachen.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Gerade ist das ein stetiger Rhythmus. Wenn das Training hart ist, reicht oft alle paar Monate eine Woche aktiver Erholung.';

  @override
  String get rhythmInsightAdviceDense =>
      'Gerade ist der Plan dicht. Wenn die Einheiten intensiv sind, lohnt alle zwei bis drei Monate eine Woche aktiver Erholung im Blick zu behalten.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Gerade ist das fast täglich. Wenn die Last hoch ist, gilt eine Woche aktiver Erholung etwa einmal im Monat vielen als sinnvoll.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Gut gemacht. Genau auf so einem Rhythmus hält langer Fortschritt.';

  @override
  String get rhythmInsightPraiseDense => 'Wirklich bei der Sache. Weiter so.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Sieht so aus, als würdest du die geheimen Fähigkeiten deines Körpers ausloten.';

  @override
  String get rhythmInsightRecentLighter =>
      'In den letzten Daten ist bereits eine Woche aktiver Erholung zu sehen.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    return 'Etwa $weeks Wochen in dieser Dichte ohne Woche aktiver Erholung.';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'Das ist ein Hinweis zur Orientierung, keine Vorschrift. Er erinnert nur daran, dass eine kurze Woche aktiver Erholung manchmal hilft. Wenn du dich gut fühlst, musst du nichts ändern.';

  @override
  String get instructionHubManifest =>
      'Kein eingebauter Katalog und keine Fertigprogramme. Du benennst Übungen selbst; die App führt die Statistik nach deiner Art.';

  @override
  String get instructionChapterStartTitle => 'Erste Schritte';

  @override
  String get instructionChapterStartBlurb =>
      'Startbildschirm, wie du trainierst, und warum die App dich nicht belehrt.';

  @override
  String get instructionChapterToolsTitle => 'Werkzeuge';

  @override
  String get instructionChapterToolsBlurb =>
      'Rhythmus, Favoriten, Muskelgruppen und Schnelltraining.';

  @override
  String get instructionChapterSessionTitle => 'Im Training';

  @override
  String get instructionChapterSessionBlurb =>
      'Sätze, Felder, Cardio, Speichern und die Stoppuhr.';

  @override
  String get instructionChapterProgressTitle => 'Fortschritt und Daten';

  @override
  String get instructionChapterProgressBlurb =>
      'Bestleistungen, Diagramm, Kalender, Verlauf und Sicherung.';

  @override
  String get instructionChapterCoachTitle => 'Trainer-Modus';

  @override
  String get instructionChapterCoachBlurb =>
      'Klienten, Profile, geplante Einheiten und Training wiederholen.';

  @override
  String get instructionSearchHint => 'Anleitung durchsuchen';

  @override
  String get instructionSearchEmpty => 'Keine Treffer.';
}
