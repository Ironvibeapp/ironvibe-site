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
  String get instructionTitle => 'So ist alles aufgebaut';

  @override
  String get instructionHubManifest =>
      'Kein Übungskatalog und keine Fertigprogramme. Du benennst Bewegungen mit eigenen Worten — die App führt dazu die Statistik.';

  @override
  String get instructionSearchHint => 'Anleitung durchsuchen';

  @override
  String get instructionSearchEmpty => 'Keine Treffer.';

  @override
  String get instructionChapterStartTitle => 'Erste Schritte';

  @override
  String get instructionChapterStartBlurb =>
      'Startbildschirm, zwei Modi und die Logik der App.';

  @override
  String get instructionChapterSessionTitle => 'Im Training';

  @override
  String get instructionChapterSessionBlurb =>
      'Sätze, Gewicht, Wiederholungen, RIR, Cardio und Abschluss der Einheit.';

  @override
  String get instructionChapterTimerTitle => 'Stoppuhr';

  @override
  String get instructionChapterTimerBlurb =>
      'Intervalle, Pause zwischen den Sätzen und Signale.';

  @override
  String get instructionChapterExercisesTitle => 'Übungen und Gruppen';

  @override
  String get instructionChapterExercisesBlurb =>
      'Deine Bewegungsliste, Muskelgruppen, Favoriten und das schnelle Training.';

  @override
  String get instructionChapterProgressTitle =>
      'Fortschritt und Bestleistungen';

  @override
  String get instructionChapterProgressBlurb =>
      'Persönlicher Fortschritt, 1RM, Tonnage und das Übungsdiagramm.';

  @override
  String get instructionChapterRhythmTitle => 'Rhythmus und Erholung';

  @override
  String get instructionChapterRhythmBlurb =>
      'Die Wochenanzeige und die Entlastungswoche.';

  @override
  String get instructionChapterDataTitle => 'Verlauf und Daten';

  @override
  String get instructionChapterDataBlurb =>
      'Kalender, Einträge bearbeiten, Statistik und Sicherung.';

  @override
  String get instructionChapterCoachTitle => 'Trainer-Modus';

  @override
  String get instructionChapterCoachBlurb =>
      'Kunden, Plan, Sitzungsvorbereitung und Drucken.';

  @override
  String get instructionPhilosophy =>
      'IronVibe bringt dir das Training nicht bei und liefert keine Fertigprogramme — dafür sind Trainer und eigene Erfahrung da. Es gibt keinen Katalog mit Tausenden Übungen: Du gibst Bewegungsnamen in deinen Worten ein, und die App zählt still die Zahlen. Alles bleibt auf dem Gerät: keine Konten, kein Abo, keine Werbung.';

  @override
  String get instructionSectionHome => 'Startbildschirm';

  @override
  String get instructionThemeTitle => 'Design';

  @override
  String get instructionThemeDesc =>
      'Der Sonne-Mond-Schalter wechselt hell und dunkel. Die Wahl wird gespeichert.';

  @override
  String get instructionTrainSelfTitle => 'Ich trainiere mich';

  @override
  String get instructionTrainSelfDesc =>
      'Dein Bereich: Training, Kalender, persönlicher Fortschritt, Favoriten und die Rhythmusanzeige.';

  @override
  String get instructionTrainOthersTitle => 'Ich trainiere andere';

  @override
  String get instructionTrainOthersDesc =>
      'Trainer-Modus: Kunden, ein Plan und ein eigener Verlauf pro Person. Vermischt sich nicht mit deinem eigenen Training.';

  @override
  String get instructionLanguageTitle => 'Sprache';

  @override
  String get instructionLanguageDesc =>
      'Die App folgt der Systemsprache — es gibt keine eigene Einstellung. Zehn Sprachen werden unterstützt.';

  @override
  String get instructionHomeLinksTitle => 'Version und Kontakt';

  @override
  String get instructionHomeLinksDesc =>
      'Unten auf dem Startbildschirm: Versionsnummer, Website, Telegram, Support-Mail und Datenschutzerklärung.';

  @override
  String get instructionSectionAthleteMenu => 'Dein Training';

  @override
  String get instructionStartWorkoutTitle => 'Training starten';

  @override
  String get instructionStartWorkoutDesc =>
      'Öffnet eine leere Einheit — das letzte Training wird nicht kopiert. Übungen hinzufügen, Sätze eintragen, dann beenden zum Speichern.';

  @override
  String get instructionQuickWorkoutTitle => 'Schnelles Training';

  @override
  String get instructionQuickWorkoutDesc =>
      'Stellt ein Ganzkörpertraining aus vier Übungen zusammen — nach deinen Muskelgruppen-Markierungen.';

  @override
  String get instructionCalendarMenuTitle => 'Trainingskalender';

  @override
  String get instructionCalendarMenuDesc =>
      'Die Tage, an denen du trainiert hast. Von hier öffnest du gespeicherte Einheiten oder trägst vergessene nach.';

  @override
  String get instructionSectionPersonalProgress => 'Persönlicher Fortschritt';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabelle mit besten Sätzen, geschätztem 1RM und Maximalvolumen für jede Bewegung.';

  @override
  String get instructionFavoritesMenuTitle => 'Lieblingsübungen';

  @override
  String get instructionFavoritesMenuDesc =>
      'Mit Stern markierte Bewegungen. Daraus stellst du ein Training in wenigen Tipps zusammen.';

  @override
  String get instructionSectionWorkout => 'Einheit';

  @override
  String get instructionStrengthCardioTitle => 'Kraft oder Cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Der Schalter oben in der Einheit legt den Typ fest. Kraft: Gewicht, Wiederholungen und RIR. Cardio: Zeit und Intensität. Stehen schon Daten des anderen Typs, fragt die App nach.';

  @override
  String get instructionAddExerciseTitle => 'Übung hinzufügen';

  @override
  String get instructionAddExerciseBody =>
      'Ein neuer Block kommt hinzu, sobald die aktuelle Übung einen Namen und mindestens einen ausgefüllten Satz hat.';

  @override
  String get instructionPreviousHintsTitle => 'Graue Hinweise';

  @override
  String get instructionPreviousHintsDesc =>
      'Gewicht und Wiederholungen vom letzten Mal stehen grau da — als Ziel, das du überbieten sollst, nicht als eingetragener Satz. In den Verlauf kommen nur Zahlen, die du selbst tippst.';

  @override
  String get instructionRemoveExerciseTitle => 'Übung entfernen';

  @override
  String get instructionRemoveExerciseDesc =>
      'Das rote Kreuz entfernt den Block aus der aktuellen Einheit. Der gespeicherte Verlauf ändert sich nicht.';

  @override
  String get instructionSectionSetControl => 'Satzzeile';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Fügt eine leere Zeile für den nächsten Satz hinzu.';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Entfernt den letzten Satz. Eine leere Zeile sofort, eine ausgefüllte nach Rückfrage. Bleibt nur ein Satz, werden die Felder einfach geleert.';

  @override
  String get instructionSetProgressLabel => 'Übungsdiagramm';

  @override
  String get instructionSetProgressDesc =>
      'Öffnet den Verlauf dieser Bewegung für Monat, Jahr oder die gesamte Zeit.';

  @override
  String get instructionExerciseVolumeTitle => 'Übungstonnage';

  @override
  String get instructionExerciseVolumeDesc =>
      'Rechts neben der Diagramm-Taste: Summe aus Gewicht × Wiederholungen über alle ausgefüllten Sätze. Wird live neu gerechnet.';

  @override
  String get instructionSectionInputs => 'Was die Felder bedeuten';

  @override
  String get instructionWeightTitle => 'Gewicht';

  @override
  String get instructionWeightBody =>
      'Das Arbeitsgewicht. Kilogramm oder Pfund — die App rechnet nicht um und zwingt dich zu nichts.';

  @override
  String get instructionRepsTitle => 'Wiederholungen';

  @override
  String get instructionRepsBody =>
      'Wie oft du die Bewegung im Satz ausgeführt hast.';

  @override
  String get instructionRirTitle => 'RIR — Wiederholungen in Reserve';

  @override
  String get instructionRirBody =>
      'Wie viele Wiederholungen noch bis zum Muskelversagen möglich gewesen wären. 0 ist Arbeit bis zum Versagen, ∞ ein Aufwärmsatz. Ein einfacher Weg, Intensität zu dosieren.';

  @override
  String get instructionOneRmTitle => '1RM — Wiederholungsmaximum';

  @override
  String get instructionOneRmDesc =>
      'Geschätztes Maximum für eine Wiederholung nach der Epley-Formel aus Gewicht und Wiederholungen des Satzes. Steht direkt unter der Zeile — ein zentraler Kraftwert.';

  @override
  String get instructionSectionCardio => 'Cardio';

  @override
  String get instructionCardioTitle => 'Zeit';

  @override
  String get instructionCardioBody =>
      'Dauer des Blocks in Minuten. Keine Distanz, kein Puls: Die App ist an keine Tracker gekoppelt.';

  @override
  String get instructionIntensityTitle => 'Intensität';

  @override
  String get instructionIntensityBody =>
      'Anstrengung von 1 bis 5 — eine vereinfachte RPE-Skala. In einer Cardio-Einheit wird pro Übung eine Zeile gespeichert.';

  @override
  String get instructionSectionSaving => 'Abschluss';

  @override
  String get instructionFinishTitle => 'Training beenden';

  @override
  String get instructionFinishBody =>
      'Die Taste unten in der Einheit: Die App fragt nach und schreibt das Training in den Verlauf. Mindestens ein ausgefüllter Satz ist nötig.';

  @override
  String get instructionLeaveWorkoutTitle => 'Früher gehen';

  @override
  String get instructionLeaveWorkoutDesc =>
      'Schließt du eine Einheit mit Daten, kannst du bleiben, das Eingetragene speichern oder den Entwurf löschen.';

  @override
  String get instructionAutoSaveTitle => 'Unterbrochenes Training';

  @override
  String get instructionAutoSaveDesc =>
      'Ein Entwurf speichert sich selbst — jede Minute und wenn die App in den Hintergrund geht. Beim nächsten Start kannst du an derselben Stelle weitermachen oder ihn löschen.';

  @override
  String get instructionScreenAwakeTitle => 'Bildschirm bleibt an';

  @override
  String get instructionScreenAwakeDesc =>
      'Während einer laufenden Einheit bleibt der Bildschirm wach, damit du das Telefon nicht nach jedem Satz entsperren musst.';

  @override
  String get instructionStopwatchWhyTitle => 'Warum die Pause zählen';

  @override
  String get instructionStopwatchWhyBody =>
      'Die Pause zwischen den Sätzen ist ein Arbeitswert wie Gewicht und Wiederholungen: kurze Pause erhöht die Dichte, lange Pause gibt Kraft für einen schweren Satz.';

  @override
  String get instructionStopwatchHowTitle => 'Start, Pause, Reset';

  @override
  String get instructionStopwatchHowBody =>
      'Die Uhr sitzt fest in der Kopfzeile der Einheit und bleibt beim Scrollen sichtbar. In der Mitte Zeit und Steuerung; im normalen Modus zählt sie aufwärts, mit Hundertsteln.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Links: Intervalle';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — eine Minute Arbeit, eine Minute Pause. 4/4 — je vier Minuten. 20/10 — Tabata. Die Phasen laufen im Kreis, bis du pausierst oder zurücksetzt: Rotton ist Arbeit, Blau Pause.';

  @override
  String get instructionStopwatchRestTitle => 'Rechts: Pause';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m und +5m starten den Countdown zwischen den Sätzen. Läuft schon einer, werden Minuten auf den Rest addiert; ein Intervallzyklus wechselt auf Pause.';

  @override
  String get instructionStopwatchProgressTitle => 'Phasenleiste';

  @override
  String get instructionStopwatchProgressBody =>
      'Im Countdown und bei Intervallen siehst du unter den Ziffern, wie viel von der aktuellen Phase noch bleibt.';

  @override
  String get instructionStopwatchSoundsTitle => 'Ton und Vibration';

  @override
  String get instructionStopwatchSoundsBody =>
      'Drei, zwei und eine Sekunde vor Phasenende — ein kurzer Klick und leichte Vibration, beim Phasenwechsel deutlicher. Töne sind in der App: kein Mikrofon, keine Benachrichtigungsrechte. Die Lautstärke kommt von den Telefoneinstellungen.';

  @override
  String get instructionExerciseBankIntro =>
      'Die Übungsliste wächst von selbst: Jeder neue Name aus einem abgeschlossenen Training landet in den Vorschlägen. Namen stehen in Großbuchstaben, damit dieselbe Bewegung nicht doppelt erscheint.';

  @override
  String get instructionSectionExerciseNameTools => 'Namen';

  @override
  String get instructionRenameExerciseTitle => 'Überall umbenennen';

  @override
  String get instructionRenameExerciseDesc =>
      'Langer Druck auf den Namen — in der Einheit, in der Vorschlagsliste oder in einem gespeicherten Training. Der Name aktualisiert sich im gesamten Verlauf und auf den Diagrammen.';

  @override
  String get instructionRemoveFromBankTitle => 'Aus Vorschlägen nehmen';

  @override
  String get instructionRemoveFromBankDesc =>
      'Das Kreuz in der offenen Vorschlagsliste oder das rote Kreuz im persönlichen Fortschritt nimmt den Namen aus Vorschlägen und Tabelle. Gespeicherte Trainings bleiben unangetastet.';

  @override
  String get instructionReassignExerciseTitle => 'Im Eintrag ersetzen';

  @override
  String get instructionReassignExerciseDesc =>
      'In einem gespeicherten Training kannst du einen Block einer anderen Bewegung zuordnen. Die Sätze bleiben, wandern aber in die Statistik des neuen Namens — nur diese Einheit ändert sich.';

  @override
  String get instructionSectionMuscleGroups => 'Muskelgruppen';

  @override
  String get instructionMuscleGroupsIntro =>
      'Die Gruppe ist eine optionale Markierung an deinem Namen. Sie braucht nur das schnelle Training, um ein ausgewogenes Ganzkörpertraining zu bauen. Acht Gruppen: Brust, Rücken, Schultern, Core, vorderer Oberschenkel, hinterer Oberschenkel, Armbeugung, Armstreckung.';

  @override
  String get instructionMuscleGroupTagTitle => 'So markierst du';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Beim ersten Eingeben eines neuen Namens fragt die App nach der Gruppe. Du kannst Später wählen oder Nicht für Schnelltraining, wenn die Bewegung nicht in den Mix soll. Die Markierung unter dem Namen in Fortschritt und Favoriten lässt sich leicht ändern oder lösen.';

  @override
  String get instructionSectionFavorites => 'Favoriten';

  @override
  String get instructionFavoriteStarTitle => 'Stern';

  @override
  String get instructionFavoriteStarDesc =>
      'Den Stern gibt es auf der Übungskarte in der Einheit und in der Tabelle des persönlichen Fortschritts. Favoriten bleiben oben in der Liste.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Training zusammenstellen';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'Auf dem Favoriten-Bildschirm die gewünschten Bewegungen ankreuzen — die Taste erscheint sofort. Die Einheit öffnet sich in dieser Reihenfolge, mit grauen Hinweisen vom letzten Mal. Beim Kunden öffnet dieselbe Aktion dessen Training.';

  @override
  String get instructionSectionQuickWorkout => 'Schnelles Training';

  @override
  String get instructionQuickWorkoutHowTitle => 'Vier Plätze';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Brust, Rücken, eine Beinhälfte (vorderer oder hinterer Oberschenkel — nie beide am selben Tag) und eine Bewegung für Schultern, Arme oder Core. Auf jedem Platz nimmt die App die Gruppe, die am längsten nicht dran war, und bevorzugt Favoriten.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Vorschau und Tausch';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'Vor dem Start siehst du die ganze Aufstellung: Jeder Platz lässt sich gegen eine andere Übung derselben Gruppe tauschen. Fehlen markierte Bewegungen, sagt die App Bescheid und öffnet den persönlichen Fortschritt, damit du Markierungen setzen kannst.';

  @override
  String get instructionPersonalProgressIntro =>
      'Eine Tabelle aller Bewegungen aus gespeicherten Trainings. Favoriten oben, der Rest alphabetisch; die Suche findet den Namen. Öffnen geht über das Trainingsmenü oder das Kundenprofil.';

  @override
  String get instructionProgressBestSetTitle => 'Bester Satz';

  @override
  String get instructionProgressBestSetDesc =>
      'Der Satz mit dem höchsten geschätzten 1RM in der gesamten Historie. Bei Bewegungen ohne Gewicht zählt der Satz mit den meisten Wiederholungen.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Maximales Volumen';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'Die höchste Tonnage dieser Übung in einem einzelnen Training — ein guter Anker, um das Arbeitsvolumen zu planen.';

  @override
  String get instructionSectionProgressChart => 'Übungsdiagramm';

  @override
  String get instructionProgressChartIntro =>
      'Drei unabhängige Kurven nach Datum. Links die Gewichtsskala, rechts die Wiederholungen; die gelbe Linie ist normalisiert, damit sich die Trends in der Form vergleichen lassen. Zeitraum umschalten — Monat, Jahr, gesamte Zeit — und ein Punkt zeigt die Zahlen des Tages. Cardio erscheint nicht im Diagramm.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Rot — höchstes Gewicht in einem Satz an diesem Tag.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Cyan — meiste Wiederholungen in einem Satz, nicht unbedingt mit dem höchsten Gewicht.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Gelb — Tages-Tonnage: Summe aus Gewicht × Wiederholungen bei Sätzen, in denen beide Felder ausgefüllt sind.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Im laufenden Training leuchtet die Diagramm-Taste auf, wenn du einen Rekord brichst: rot beim Satzgewicht, gelb bei der Übungstonnage, cyan bei der Wiederholungssumme ohne Gewicht. Treffen mehrere zu, gilt rot, dann gelb, dann cyan. Im gespeicherten Verlauf gibt es keine Hervorhebung.';

  @override
  String get instructionRhythmIntro =>
      'Sind in den letzten vier Wochen mindestens drei Krafttage zusammengekommen, erscheint oben auf dem Trainingsbildschirm die Rhythmusanzeige. Das ist kein Ziel und keine Note — nur, wie oft du gerade ins Studio gehst.';

  @override
  String get instructionRhythmGaugeTitle => 'Tage pro Woche';

  @override
  String get instructionRhythmGaugeDesc =>
      'Der Bogen füllt sich von einem bis sechs Tagen — der Schnitt über vier Wochen. Tage mit Kraftarbeit zählen, reine Cardio-Tage nicht. Je dichter der Rhythmus, desto weiter wandert die Farbe von Stahl über Gold zu Rost.';

  @override
  String get instructionRhythmInsightTitle => 'Rhythmus im Detail';

  @override
  String get instructionRhythmInsightDesc =>
      'Tippe auf die Anzeige: Die App benennt deinen Modus — ruhiger, gleichmäßiger, dichter Rhythmus oder kaum freie Tage — und erklärt, was das für die Erholung heißt. Beim Kunden des Trainers öffnet sich dieselbe Auswertung.';

  @override
  String get instructionRhythmDeloadTitle => 'Entlastungswoche';

  @override
  String get instructionRhythmDeloadDesc =>
      'Entlastung ist keine Pause, sondern eine Woche auf halber Kraft: Arbeitsgewichte und Satzzahl 30–50 % niedriger, oder nur Cardio. Muskeln erholen sich schneller als Bänder, Sehnen und Gelenke — diese Woche lässt sie aufholen.';

  @override
  String get instructionRhythmNudgeTitle => 'Erinnerung';

  @override
  String get instructionRhythmNudgeDesc =>
      'Hältst du mindestens zweieinhalb Einheiten pro Woche und hast lange nicht entlastet, schlägt die App eine solche Woche vor. Je dichter der Rhythmus, desto früher der Hinweis. Er erscheint höchstens einmal pro Woche und nur im eigenen Modus — und bleibt eine Empfehlung, kein medizinischer Rat.';

  @override
  String get instructionSectionCalendar => 'Kalender und Verlauf';

  @override
  String get instructionCalendarBrowseTitle => 'So blätterst du';

  @override
  String get instructionCalendarBrowseDesc =>
      'Monate per Wisch wechseln, Tipp auf den Monatsnamen öffnet die schnelle Datumsauswahl. Ein Punkt unter der Zahl bedeutet: an diesem Tag gab es ein Training.';

  @override
  String get instructionCalendarAddTitle => 'Nachträglich eintragen';

  @override
  String get instructionCalendarAddDesc =>
      'Tag wählen, Uhrzeit setzen und ein Training hinzufügen — auch für ein vergangenes Datum. Praktisch, wenn die Einheit nicht mitgeschrieben wurde.';

  @override
  String get instructionNavHistoryTitle => 'Trainingstonnage';

  @override
  String get instructionNavHistoryDesc =>
      'Bei jeder gespeicherten Einheit steht die Gesamttonnage. Volumen ist einer der verlässlichsten Hypertrophie-Werte: entscheidend ist nicht der Rekord an einem Tag, sondern wie er über die Wochen hält.';

  @override
  String get instructionHistoryEditTitle => 'Einträge bearbeiten';

  @override
  String get instructionHistoryEditDesc =>
      'Ein gespeichertes Training lässt sich aufklappen und korrigieren: Übung oder Satz hinzufügen, Zahlen ändern, die Einheit ganz löschen. Änderungen speichern sich sofort.';

  @override
  String get instructionSectionStats => 'Statistik';

  @override
  String get instructionStatsTitle => 'Trainingsübersicht';

  @override
  String get instructionStatsDesc =>
      'Das Diagramm-Symbol in der Kopfzeile von Training oder Trainer: wie viele Einheiten im Monat, im Jahr und insgesamt. Im Trainer-Modus zusätzlich die Aufteilung nach Kunden.';

  @override
  String get instructionSectionBackup => 'Sicherung';

  @override
  String get instructionNavImportExportTitle => 'Export und Import';

  @override
  String get instructionNavImportExportDesc =>
      'Der Export packt Verlauf, Übungsliste, Favoriten, Gruppenmarkierungen, Kunden und den Plan in eine JSON-Datei. Der Import mischt die Datei unter die aktuellen Daten und überspringt Duplikate — nichts wird überschrieben. Die Trainer-Sicherung ist von der persönlichen getrennt.';

  @override
  String get instructionBackupNudgeTitle => 'Erinnerung an die Kopie';

  @override
  String get instructionBackupNudgeDesc =>
      'Daten leben nur auf diesem Gerät: keine Konten, keine Cloud. Alle vier Wochen bietet die App an, eine Kopie zu speichern — geht das Telefon verloren, kommt der Verlauf nur aus dieser Datei zurück.';

  @override
  String get instructionTrainerIntro =>
      'Ich trainiere andere ist ein eigener Bereich für die Arbeit mit Menschen: Kunden, Plan und ein Verlauf pro Person. Eigenes Training und Trainerdaten kreuzen sich nicht.';

  @override
  String get instructionClientsTitle => 'Kunden';

  @override
  String get instructionClientsDesc =>
      'Liste mit Ziel, letzter und nächster Einheit. Auf der Karte: Ziel, Gewicht, Größe und private Trainer-Notizen. Der Name wird beim Anlegen gesetzt und ändert sich danach nicht.';

  @override
  String get instructionClientProfileTitle => 'Kundenprofil';

  @override
  String get instructionClientProfileDesc =>
      'Von hier startet die heutige Einheit, und hier liegen Fortschritt, Favoriten und Verlauf nach Monat. Reichen die Krafttage, ist auch die Rhythmusanzeige da. Wird ein Kunde gelöscht, entfallen künftige Einheiten; vergangene Trainings bleiben für die Auswertung.';

  @override
  String get instructionTrainerScheduleTitle => 'Plan';

  @override
  String get instructionTrainerScheduleDesc =>
      'Der Trainerkalender zeigt Einheiten aller Kunden: Play-Symbol heißt geplant, Häkchen fertig, Sanduhr heute in Arbeit. Leere Pläne vergangener Tage verschwinden von selbst.';

  @override
  String get instructionTrainerPlanTitle => 'Einheit planen';

  @override
  String get instructionTrainerPlanDesc =>
      'Für ein zukünftiges Datum kannst du Übungen und Notiz vorab setzen und speichern, ohne das Training zu beenden. Letzte Gewichte und Wiederholungen kommen als graue Hinweise. In den Verlauf kommen nur abgeschlossene Einheiten.';

  @override
  String get instructionTrainerRepeatTitle => 'Letztes wiederholen';

  @override
  String get instructionTrainerRepeatDesc =>
      'Aus dem Kundenprofil oder per Schalter beim Hinzufügen im Kalender. Kopiert wird die Übungsauswahl; Gewicht und Wiederholungen kommen als graue Hinweise, nicht als fertige Sätze.';

  @override
  String get instructionPrintSessionTitle => 'Einheit drucken';

  @override
  String get instructionPrintSessionDesc =>
      'Im abgeschlossenen Training baut das Druck-Symbol in der Kopfzeile ein A4-Blatt mit Ablauf und Zahlen des Tages. Danach das Systemfenster: Drucker, PDF oder Versand an den Kunden.';

  @override
  String get instructionImportAthleteTitle => 'Athletenverlauf importieren';

  @override
  String get instructionImportAthleteDesc =>
      'Eigene Taste in der Trainerstatistik: Eine Datei aus dem persönlichen Modus wird als neuer Kunde angelegt, samt Favoriten und Gruppenmarkierungen. Übernommene Trainings sind als importiert gekennzeichnet, Übungsnamen vermischen sich nicht mit deinen.';

  @override
  String get printSession => 'Drucken';

  @override
  String get printSessionEmpty =>
      'Noch nichts zu drucken. Trage mindestens einen Satz ein.';

  @override
  String get printSessionShareText => 'IronVibe-Einheit';

  @override
  String get rhythmPerWeek => 'pro Woche';

  @override
  String get deloadNudgeTitle => 'Eine Woche aktiver Erholung?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Du trainierst etwa $rate Tage pro Woche seit rund $weeks Wochen. Guter Moment für eine Woche aktiver Erholung: Arbeitsgewichte und Sätze um 30–50 % runter oder nur Cardio. Das ist eine Empfehlung, kein medizinischer Rat.';
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
    return 'Du trainierst im Schnitt etwa $rate Mal pro Woche.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name trainiert im Schnitt etwa $rate Mal pro Woche.';
  }

  @override
  String get rhythmInsightBandLight => 'Ruhiger Rhythmus';

  @override
  String get rhythmInsightBandSteady => 'Gleichmäßiger Rhythmus';

  @override
  String get rhythmInsightBandDense => 'Dichter Rhythmus';

  @override
  String get rhythmInsightBandVeryDense => 'Kaum freie Tage';

  @override
  String get rhythmInsightHowTitle => 'Woher die Zahl kommt';

  @override
  String get rhythmInsightWindow =>
      'Schnitt der letzten vier Wochen. Tage mit Kraftarbeit zählen; reine Cardio-Tage nicht. Das ist kein Ziel und keine Note — nur dein jetziger Rhythmus.';

  @override
  String get rhythmInsightWhatTitle => 'Woche aktiver Erholung';

  @override
  String get rhythmInsightWhatBody =>
      'Keine Pause, sondern eine Woche auf halber Kraft: Arbeitsgewichte und Satzzahl um 30–50 % runter. Du kannst Kraft auch ganz weglassen und Cardio oder andere Bewegung behalten. Muskeln erholen sich schneller als Gelenke, Bänder und Sehnen — diese Woche gibt ihnen Zeit nachzuziehen.';

  @override
  String get rhythmInsightPaceTitle => 'Was das bedeutet';

  @override
  String get rhythmInsightAdviceLight =>
      'Zwischen den Einheiten sind genug freie Tage, Müdigkeit stapelt sich nicht. Aktive Erholung extra zu planen ist noch unnötig — in diesem Rhythmus erholt sich der Körper von allein.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Ein gleichmäßiger Rhythmus, mit dem man Jahre arbeiten kann. Sind die Einheiten hart, nimm alle paar Monate eine Woche aktiver Erholung — lieber früh als erst, wenn die Gewichte stehen.';

  @override
  String get rhythmInsightAdviceDense =>
      'Die Einheiten sitzen dicht, und Müdigkeit baut sich leise auf. Eine Woche aktiver Erholung alle zwei bis drei Monate hält den Fortschritt meist besser als Dauerbetrieb ohne Pause.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Fast jeder Tag unter Last. Das kann gehen, wenn Schlaf und Essen mithalten. In diesem Rhythmus ist eine Woche aktiver Erholung etwa einmal im Monat ganz normale Vorsorge für Gelenke und Bänder, kein Ausweichen.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Genau so ein Rhythmus hält über Jahre.';

  @override
  String get rhythmInsightPraiseDense =>
      'Du trainierst oft — so ein Plan entsteht nicht von allein.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Sieht so aus, als hättest du den geheimen Modus des Körpers gefunden.';

  @override
  String get rhythmInsightRecentLighter =>
      'Die Last war kürzlich schon niedriger — aktive Erholung kann als erledigt gelten. Tempo wieder aufnehmen.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Dieser Rhythmus hält schon $weeks Wochen.',
      one: 'Dieser Rhythmus hält schon $weeks Woche.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'Das ist eine Empfehlung, kein medizinischer Rat. Wenn du dich gut fühlst, muss sich nichts ändern.';
}
