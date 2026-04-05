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
  String get addSet => '+ SATZ HINZUFÜGEN';

  @override
  String get addExercise => '+ ÜBUNG HINZUFÜGEN';

  @override
  String get finishWorkout => 'TRAINING BEENDEN';

  @override
  String get startWorkout => 'TRAINING STARTEN';

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
  String get exerciseHint => 'Übungsname eingeben';

  @override
  String get deleteFromHistory => 'Aus Verlauf entfernen?';

  @override
  String get deleteExerciseHint => 'erscheint nicht mehr in den Vorschlägen.';

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
  String get fillCurrentExerciseBeforeAdd =>
      'Schließe zuerst die aktuelle Übung ab, bevor du eine weitere hinzufügst.';

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
  String get addClient => '+ KUNDE HINZUFÜGEN';

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
      'IronVibe kommt bewusst ohne feste Übungskataloge und eingebaute „Programme“. Es soll dich nicht trainieren lehren — dafür gibt es YouTube und Coaches — sondern beim Erfassen deiner Daten helfen, ganz nach deinen Vorstellungen. Du tippst Übungsnamen selbst ein, mit deinen Worten, statt sie aus einer endlosen Liste zu wählen. Je länger du die App nutzt, desto mehr fühlt sie sich nach dir an: Sie passt sich an dich an, nicht umgekehrt.';

  @override
  String get instructionSectionSetControl => 'Satzsteuerung';

  @override
  String get instructionSetMinusLabel => 'Minus';

  @override
  String get instructionSetMinusDesc =>
      'Entfernt den letzten Satz. Wenn Daten enthalten sind, fragt die App nach Bestätigung.';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Fügt der aktuellen Übung eine neue Satzzeile hinzu.';

  @override
  String get instructionSetProgressLabel => 'Zeitverlauf';

  @override
  String get instructionSetProgressDesc =>
      'Öffnet die Fortschritts-Timeline für diese Übung.';

  @override
  String get instructionSectionProgressChart => 'Fortschrittsdiagramm';

  @override
  String get instructionProgressChartIntro =>
      'Zwei unabhängige Verläufe nach Datum: Rot — schwerster Satz des Tages; Cyan — meiste Wiederholungen in einem Satz. Links Gewicht, rechts Wiederholungen.';

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
  String get instructionSectionWorkout => 'Training';

  @override
  String get instructionAddExerciseTitle => 'Übung hinzufügen';

  @override
  String get instructionAddExerciseBody =>
      'Erstellt einen neuen Block für eine weitere Übung.';

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
      'Ist die Vorschlagsliste unter dem Namen offen, X in der Zeile tippen, um den Namen aus Ihrer persönlichen Übungsliste (Bank) zu entfernen.';

  @override
  String get instructionSectionInputs => 'Datenfelder';

  @override
  String get instructionWeightTitle => 'Gewicht';

  @override
  String get instructionWeightBody => 'Last an Langhantel oder Gerät.';

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
      'Persönlicher Fortschritt dient dem Training nach einzelnen Übungen: Alle erfassten Bewegungen aus gespeicherten Einheiten stehen in einer Tabelle zum schnellen Vergleich. Die Suche springt sofort zum passenden Namen. Erreichbar über die Trainings-Startseite (Schaltfläche unter dem Kalender) oder das Kundenprofil.';

  @override
  String get instructionSectionSaving => 'Speichern';

  @override
  String get instructionFinishTitle => 'Beenden';

  @override
  String get instructionFinishBody =>
      'Speichert das komplette Training im Verlauf. Vorher werden Daten nicht dauerhaft gespeichert.';

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
      'Abgeschlossene Trainings im Kalender und gesammelte Statistiken über das Diagramm-Symbol in den App-Leisten.';

  @override
  String get instructionNavImportExportTitle => 'Import / Export';

  @override
  String get instructionNavImportExportDesc =>
      'Daten sichern oder übertragen mit JSON-Export und -Import im Statistikdialog.';
}
