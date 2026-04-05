// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'LA VIBE DEL TUO ALLENAMENTO';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annulla';

  @override
  String get renameExerciseTitle => 'Rinomina esercizio';

  @override
  String get renameExerciseEmpty => 'Il nome non può essere vuoto';

  @override
  String get delete => 'Elimina';

  @override
  String get yesDelete => 'Sì, elimina';

  @override
  String get close => 'Chiudi';

  @override
  String get save => 'Salva';

  @override
  String get add => 'Aggiungi';

  @override
  String get trainOthers => 'ALLENO ALTRI';

  @override
  String get trainSelf => 'MI ALLENO IO';

  @override
  String get statistics => 'STATISTICHE';

  @override
  String get exportHistory => 'ESPORTA CRONOLOGIA';

  @override
  String get historyEmpty =>
      'La cronologia è vuota, non c\'è ancora nulla da esportare.';

  @override
  String get exportError => 'Errore di esportazione:';

  @override
  String get exportJson => 'ESPORTA JSON';

  @override
  String get importData => 'IMPORTA';

  @override
  String get importSuccess => 'Dati importati con successo';

  @override
  String get importError => 'Errore di importazione:';

  @override
  String get importNewerVersion =>
      'File creato da una versione più recente dell\'app';

  @override
  String get importFileAccessError => 'Errore di accesso al file';

  @override
  String get importInvalidJson => 'Formato JSON non valido';

  @override
  String get importInvalidBackupFile =>
      'Errore: file di backup non valido selezionato';

  @override
  String get shareText => 'Cronologia allenamenti IronVibe';

  @override
  String get monthStats => 'QUESTO MESE';

  @override
  String get yearStats => 'QUEST\'ANNO';

  @override
  String get allTimeStats => 'TUTTO';

  @override
  String get weight => 'Peso';

  @override
  String get reps => 'Ripetizioni';

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
  String get addSet => '+ AGGIUNGI SERIE';

  @override
  String get addExercise => '+ AGGIUNGI ESERCIZIO';

  @override
  String get finishWorkout => 'TERMINA ALLENAMENTO';

  @override
  String get startWorkout => 'INIZIA ALLENAMENTO';

  @override
  String get calendarWorkouts => 'CALENDARIO ALLENAMENTI';

  @override
  String get personalProgress => 'PROGRESSO PERSONALE';

  @override
  String get personalProgressSearchHint => 'Cerca esercizio';

  @override
  String get personalProgressBestSet => 'Serie migliore';

  @override
  String get personalProgressMaxVolume => 'Vol. max';

  @override
  String get personalProgressEmpty => 'Nessun esercizio negli allenamenti';

  @override
  String get exerciseHint => 'Inserisci il nome dell\'esercizio';

  @override
  String get deleteFromHistory => 'Rimuovere dalla cronologia?';

  @override
  String get deleteExerciseHint => 'non apparirà più nei suggerimenti.';

  @override
  String get exerciseDeleted => 'rimosso';

  @override
  String get deleteWorkoutTitle => 'ELIMINA';

  @override
  String get deleteWorkoutMsg =>
      'Eliminare questo allenamento? La cronologia del progresso andrà persa.';

  @override
  String get removeSetWithDataConfirm =>
      'Eliminare la serie con dati? Questa azione non può essere annullata.';

  @override
  String get deleteClientTitle => 'ELIMINA CLIENTE';

  @override
  String get deleteClientMsg =>
      'Eliminare questo cliente? Tutti i suoi allenamenti futuri saranno rimossi.';

  @override
  String get noClientsTitle => 'NESSUN CLIENTE';

  @override
  String get noClientsMsg => 'Aggiungi prima i clienti dal menu «Clienti».';

  @override
  String get newClient => 'NUOVO CLIENTE';

  @override
  String get editClient => 'MODIFICA';

  @override
  String get clientName => 'Nome';

  @override
  String get clientGoal => 'Obiettivo';

  @override
  String get clientWeight => 'Peso';

  @override
  String get clientHeight => 'Altezza';

  @override
  String get clientNotes => 'Note';

  @override
  String get saveClientChanges => 'SALVA MODIFICHE';

  @override
  String get clientProfileUnsavedTitle => 'Modifiche non salvate';

  @override
  String get clientProfileUnsavedMessage =>
      'Modifiche non salvate. Salvare prima di uscire?';

  @override
  String get clientProfileStay => 'Resta';

  @override
  String get clientProfileDiscard => 'Esci senza salvare';

  @override
  String get clientProfileSaveAndLeave => 'Salva ed esci';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Completa l\'esercizio corrente prima di aggiungerne un altro.';

  @override
  String get clientWorkoutHistoryEmpty => 'Nessun allenamento ancora';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Esercizio n. $n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Esercizio n. $n: $exerciseName';
  }

  @override
  String get clientProfileSectionGoal => 'OBIETTIVO';

  @override
  String get clientProfileSectionAnthropometry => 'ANTROPOMETRIA';

  @override
  String get clientProfileSectionTrainerNotes => 'NOTE ALLENATORE';

  @override
  String get clientProfileSectionWorkoutHistory => 'STORIA ALLENAMENTI';

  @override
  String get clientTrainerNotesHint => 'Infortuni, note, piano…';

  @override
  String get trainerSessionDefaultTitle => 'Allenamento';

  @override
  String get durationMinutesShort => 'min';

  @override
  String get addTraining => 'AGGIUNGI ALLENAMENTO';

  @override
  String get clientLabel => 'Cliente';

  @override
  String get deleteClientBtn => 'ELIMINA CLIENTE';

  @override
  String get clientsMenu => 'CLIENTI';

  @override
  String get dateHeader => 'Data';

  @override
  String get clientHeader => 'Cliente';

  @override
  String get exerciseHeader => 'Esercizio';

  @override
  String get typeHeader => 'Tipo';

  @override
  String get strengthType => 'Forza';

  @override
  String get cardioType => 'Cardio';

  @override
  String get weightHeader => 'Peso';

  @override
  String get weightUnitsChoiceShort => 'kg / lb';

  @override
  String get progressChartWeightLegend => 'Peso — kg / lb (come annoti)';

  @override
  String get repsHeader => 'Ripetizioni';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'Tempo (min)';

  @override
  String get intensityHeader => 'Intensità';

  @override
  String get setHeader => 'Serie';

  @override
  String get strength => 'Forza';

  @override
  String get cardio => 'Cardio';

  @override
  String get timeMin => 'Tempo (min)';

  @override
  String get intensity => 'Intensità';

  @override
  String get reserve => 'Riserva';

  @override
  String get sets => 'Serie';

  @override
  String get time => 'Tempo';

  @override
  String get rest => 'Riposo';

  @override
  String get settings => 'Impostazioni';

  @override
  String get max => 'Max';

  @override
  String get totalVolume => 'Volume totale';

  @override
  String get chart => 'Grafico';

  @override
  String get progress => 'Progressi';

  @override
  String get dayMonday => 'Lunedì';

  @override
  String get dayTuesday => 'Martedì';

  @override
  String get dayWednesday => 'Mercoledì';

  @override
  String get dayThursday => 'Giovedì';

  @override
  String get dayFriday => 'Venerdì';

  @override
  String get daySaturday => 'Sabato';

  @override
  String get daySunday => 'Domenica';

  @override
  String get greetingHi => 'Ciao';

  @override
  String get greetingMorning => 'Buongiorno';

  @override
  String get greetingAfternoon => 'Buon pomeriggio';

  @override
  String get greetingEvening => 'Buonasera';

  @override
  String get monthJanuary => 'Gennaio';

  @override
  String get monthFebruary => 'Febbraio';

  @override
  String get monthMarch => 'Marzo';

  @override
  String get monthApril => 'Aprile';

  @override
  String get monthMay => 'Maggio';

  @override
  String get monthJune => 'Giugno';

  @override
  String get monthJuly => 'Luglio';

  @override
  String get monthAugust => 'Agosto';

  @override
  String get monthSeptember => 'Settembre';

  @override
  String get monthOctober => 'Ottobre';

  @override
  String get monthNovember => 'Novembre';

  @override
  String get monthDecember => 'Dicembre';

  @override
  String get exerciseBenchPress => 'Panca piana';

  @override
  String get exerciseSquat => 'Squat';

  @override
  String get exerciseRow => 'Rematore';

  @override
  String get exerciseDeadlift => 'Stacco';

  @override
  String get exerciseOverheadPress => 'Lento avanti';

  @override
  String get exercisePullUp => 'Trazioni';

  @override
  String get exerciseLunges => 'Affondi';

  @override
  String get exercisePlank => 'Plank';

  @override
  String get saveWorkout => 'SALVA ALLENAMENTO';

  @override
  String get deleteWorkout => 'ELIMINA ALLENAMENTO';

  @override
  String get deleteTraining => 'Elimina allenamento';

  @override
  String get deleteTrainingQuestion =>
      'Eliminare questo allenamento dal calendario?';

  @override
  String get addSetButton => 'Aggiungi serie';

  @override
  String get progressButton => 'Progressi';

  @override
  String get filterMonth => 'Mese';

  @override
  String get filterYear => 'Anno';

  @override
  String get filterAllTime => 'Tutto';

  @override
  String get noteLabel => 'Nota';

  @override
  String get addClient => '+ AGGIUNGI CLIENTE';

  @override
  String get workoutsToday => 'ALLENAMENTI DI OGGI';

  @override
  String get workoutNumberPrefix => 'Allenamento #';

  @override
  String get noEntries => 'Nessun record';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Informativa sulla privacy';

  @override
  String get instructionButton => 'GUIDA';

  @override
  String get instructionTitle => 'Come funziona';

  @override
  String get instructionPhilosophy =>
      'IronVibe non ha cataloghi di esercizi imposti né programmi preconfezionati: è una scelta consapevole. Non ti insegna ad allenarti — per quello ci sono YouTube e i coach — ti aiuta solo a registrare i numeri come preferisci. Scrivi tu i nomi degli esercizi, con le tue parole, invece di sceglierli da un elenco infinito. Più la usi, più ti sembra naturale: si adatta a te, non il contrario.';

  @override
  String get instructionSectionSetControl => 'Controllo serie';

  @override
  String get instructionSetMinusLabel => 'Meno';

  @override
  String get instructionSetMinusDesc =>
      'Rimuove l\'ultima serie. Se contiene dati, l\'app chiede conferma.';

  @override
  String get instructionSetPlusLabel => 'Più';

  @override
  String get instructionSetPlusDesc =>
      'Aggiunge una nuova riga serie all\'esercizio corrente.';

  @override
  String get instructionSetProgressLabel => 'Cronologia';

  @override
  String get instructionSetProgressDesc =>
      'Apre la cronologia di progresso per questo esercizio.';

  @override
  String get instructionSectionProgressChart => 'Grafico progressi';

  @override
  String get instructionProgressChartIntro =>
      'Due andamenti indipendenti per data: rosso — serie piu pesante del giorno (kg/lb); cyan — piu ripetizioni in una serie (qualsiasi peso). Sinistra: peso; destra: ripetizioni.';

  @override
  String get instructionProgressLineWeightLabel => 'Peso';

  @override
  String get instructionProgressLineWeightDesc =>
      'Linea rossa: massimo peso in una serie per ogni giorno.';

  @override
  String get instructionProgressLineRepsLabel => 'Ripetizioni';

  @override
  String get instructionProgressLineRepsDesc =>
      'Linea cyan: massimo di ripetizioni in una serie quel giorno (non legato al peso massimo).';

  @override
  String get instructionSectionWorkout => 'Allenamento';

  @override
  String get instructionAddExerciseTitle => 'Aggiungi esercizio';

  @override
  String get instructionAddExerciseBody =>
      'Crea un nuovo blocco per un altro tipo di esercizio.';

  @override
  String get instructionSectionExerciseNameTools => 'Nome esercizio';

  @override
  String get instructionRenameExerciseTitle => 'Pressione lunga per rinominare';

  @override
  String get instructionRenameExerciseDesc =>
      'Tieni premuto il nome durante l\'inserimento, su un suggerimento nell\'elenco o sul titolo di un allenamento salvato nella cronologia: il nome viene aggiornato ovunque.';

  @override
  String get instructionRemoveFromBankTitle => 'Rimuovi dall\'elenco';

  @override
  String get instructionRemoveFromBankDesc =>
      'Con l\'elenco suggerimenti aperto sotto il nome, tocca la X di una riga per rimuovere quel nome dalla tua lista personale (banca).';

  @override
  String get instructionSectionInputs => 'Dati';

  @override
  String get instructionWeightTitle => 'Peso';

  @override
  String get instructionWeightBody => 'Peso del carico (kg/lb).';

  @override
  String get instructionRepsTitle => 'Ripetizioni';

  @override
  String get instructionRepsBody =>
      'Numero di ripetizioni eseguite in una serie.';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody =>
      'Quante ripetizioni potresti ancora fare prima del cedimento. Aiuta a monitorare l\'intensità.';

  @override
  String get instructionOneRmTitle => '1RM (massimale su una ripetizione)';

  @override
  String get instructionOneRmDesc =>
      'Carico massimo stimato per una ripetizione corretta in base al peso e alle ripetizioni attuali. Indicatore chiave di forza per progressi e scelta dei carichi.';

  @override
  String get instructionExerciseVolumeTitle => 'Volume esercizio (totale)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Sotto le serie, accanto al pulsante progressi: somma di peso × ripetizioni per ogni serie con entrambi i valori. Si aggiorna mentre inserisci i dati.';

  @override
  String get instructionSectionPersonalProgress => 'Progresso personale';

  @override
  String get instructionPersonalProgressIntro =>
      'Progresso personale serve a monitorare i miglioramenti esercizio per esercizio: tutti i movimenti registrati compaiono in una tabella per confrontare in sintesi. La ricerca porta subito al nome cercato. Accesso dalla home allenamento (pulsante sotto il calendario) o dal profilo cliente.';

  @override
  String get instructionSectionSaving => 'Salvataggio';

  @override
  String get instructionFinishTitle => 'Termina';

  @override
  String get instructionFinishBody =>
      'Salva l\'intero allenamento nella cronologia. Finché non premi questo pulsante, i dati non sono registrati.';

  @override
  String get instructionSectionCardio => 'Cardio e intensita';

  @override
  String get instructionCardioTitle => 'Cardio';

  @override
  String get instructionCardioBody =>
      'Registra tempo e intensita nel cardio (nessuna distanza). Aiuta a tenere ritmo e livello di sforzo.';

  @override
  String get instructionIntensityTitle => 'Intensita';

  @override
  String get instructionIntensityBody =>
      'Usa la scala di sforzo (RPE) per capire quanto e stato impegnativo l\'allenamento. E la chiave per progredire senza sovrallenarti.';

  @override
  String get instructionSectionStopwatch => 'Cronometro (il tuo assistente)';

  @override
  String get instructionStopwatchWhyTitle => 'Perche usarlo?';

  @override
  String get instructionStopwatchWhyBody =>
      'Per controllare il recupero tra le serie. Recupero breve: maggiore densita; recupero lungo: piu forza per carichi pesanti.';

  @override
  String get instructionStopwatchHowTitle => 'Come funziona?';

  @override
  String get instructionStopwatchHowBody =>
      'Centro: tempo, play/pausa e reset. Sinistra e destra: preset rapidi (sotto). In modalita cronometro semplice il tempo sale con i centesimi. Il timer resta nell\'intestazione mentre scorri.';

  @override
  String get instructionStopwatchIntervalsTitle => 'A sinistra: intervalli';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 s lavoro, 60 s recupero. 4/4 — 4 minuti lavoro e 4 minuti recupero per turno. 20/10 — tabata: 20 s on, 10 s off. Dopo la scelta il timer alterna lavoro e recupero a ciclo fino a pausa o reset. Tinta rosata = lavoro; blu = recupero.';

  @override
  String get instructionStopwatchRestTitle => 'A destra: recupero';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m e +5m avviano o allungano un conto alla rovescia in minuti. Se era attivo un ciclo a intervalli, passa a quel conto alla rovescia. Se il conto alla rovescia era gia in corso, i minuti si sommano al tempo rimasto. Utile tra le serie.';

  @override
  String get instructionStopwatchProgressTitle => 'Barra di avanzamento';

  @override
  String get instructionStopwatchProgressBody =>
      'In conto alla rovescia e intervalli, una barra sotto il tempo mostra quanto manca alla fase corrente.';

  @override
  String get instructionStopwatchSoundsTitle => 'Suono e vibrazioni';

  @override
  String get instructionStopwatchSoundsBody =>
      'A 3, 2 e 1 secondo dalla fine: breve suono in-app e vibrazione leggera. Cambio fase o zero del countdown: segnale più forte. Clip minime incluse; niente microfono né permesso notifiche; il volume del dispositivo conta ancora.';

  @override
  String get instructionSectionNavHistory => 'Cronologia e dati';

  @override
  String get instructionNavHistoryTitle => 'Cronologia / statistiche';

  @override
  String get instructionNavHistoryDesc =>
      'Allenamenti completati nel calendario e statistiche dall\'icona grafico nelle barre dell\'app.';

  @override
  String get instructionNavImportExportTitle => 'Import / export';

  @override
  String get instructionNavImportExportDesc =>
      'Backup o trasferimento dati con export e import JSON nel dialogo statistiche.';
}
