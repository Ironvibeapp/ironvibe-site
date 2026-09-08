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
  String get reassignHistoryExerciseTitle => 'Cambia esercizio';

  @override
  String get reassignHistoryExerciseBody =>
      'Si modifica solo questo allenamento. Le serie restano; i grafici seguono il nuovo nome dell\'esercizio.';

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
  String get importAthlete => 'IMPORTA ATLETA';

  @override
  String importAthleteFound(int count) {
    return 'Trovati record di $count allenamenti di un atleta che non è in elenco.';
  }

  @override
  String get importAthleteBackupOwn => 'SALVA PRIMA I MIEI DATI';

  @override
  String get importAthleteDecline => 'Non aggiungere';

  @override
  String get importAthleteSuccess => 'Atleta aggiunto';

  @override
  String get importAthleteNotAthleteFile =>
      'Questo file non è uno storico allenamenti di un atleta.';

  @override
  String get importAthleteEmpty => 'Nessun allenamento trovato in questo file.';

  @override
  String get importAthleteAlreadyImported =>
      'Questi allenamenti sono già su questo dispositivo.';

  @override
  String get importAthleteUseDedicatedButton =>
      'Sembra lo storico di un atleta. Usa Importa atleta.';

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
  String get addSet => 'AGGIUNGI SERIE';

  @override
  String get addExercise => 'AGGIUNGI ESERCIZIO';

  @override
  String get finishWorkout => 'TERMINA ALLENAMENTO';

  @override
  String get finishWorkoutConfirmTitle => 'Terminare l\'allenamento?';

  @override
  String get finishWorkoutConfirmBody => 'L\'allenamento verrà salvato.';

  @override
  String get finishWorkoutConfirmAction => 'Termina';

  @override
  String get workoutCompleteTitle => 'Allenamento salvato';

  @override
  String get planChangesSavedTitle => 'Modifiche salvate';

  @override
  String get startWorkout => 'INIZIA ALLENAMENTO';

  @override
  String get quickWorkout => 'ALLENAMENTO RAPIDO';

  @override
  String get quickWorkoutFullBody => 'FULL BODY';

  @override
  String get quickWorkoutInsufficientTitle => 'Dati insufficienti';

  @override
  String get quickWorkoutInsufficientBody =>
      'Un allenamento rapido richiede esercizi per petto, schiena, un gruppo di gambe (coscia anteriore o posteriore) e uno per spalle, braccia o core. Contrassegnali in Progresso personale — oppure continua a registrare: l\'app chiederà quando inserisci un nuovo esercizio.';

  @override
  String get quickWorkoutOpenProgress => 'APRI PROGRESSO PERSONALE';

  @override
  String get quickWorkoutPreviewTitle => 'ALLENAMENTO RAPIDO · FULL BODY';

  @override
  String get quickWorkoutStart => 'INIZIA';

  @override
  String get quickWorkoutSwap => 'Cambia';

  @override
  String get quickWorkoutNoAlternatives =>
      'Nessun altro esercizio in questo gruppo';

  @override
  String get muscleGroupPromptTitle => 'Gruppo muscolare';

  @override
  String get muscleGroupPromptBody => 'Serve per un full body rapido.';

  @override
  String get muscleGroupLater => 'Più tardi';

  @override
  String get muscleGroupClear => 'Cancella';

  @override
  String get muscleGroupSkip => 'Non per l\'allenamento rapido';

  @override
  String get muscleGroupChest => 'Petto';

  @override
  String get muscleGroupBack => 'Schiena';

  @override
  String get muscleGroupShoulders => 'Spalle';

  @override
  String get muscleGroupCore => 'Core';

  @override
  String get muscleGroupQuads => 'Coscia anteriore';

  @override
  String get muscleGroupHamstrings => 'Coscia posteriore';

  @override
  String get muscleGroupArmFlex => 'Flessione braccia';

  @override
  String get muscleGroupArmExt => 'Estensione braccia';

  @override
  String get muscleGroupUntagged => '—';

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
  String get favoriteExercises => 'ESERCIZI PREFERITI';

  @override
  String get favoriteExercisesEmpty => 'Nessun esercizio preferito';

  @override
  String get buildWorkoutFromFavorites => 'COMPONI ALLENAMENTO';

  @override
  String get exerciseHint => 'Inserisci il nome dell\'esercizio';

  @override
  String get deleteFromHistory => 'Rimuovere dalla cronologia?';

  @override
  String get deleteExerciseHint =>
      'non apparirà più nei suggerimenti né nel progresso personale.';

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
  String get removeExerciseFromWorkout => 'Rimuovi esercizio';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'Rimuovere questo esercizio dall\'allenamento? Questa azione non può essere annullata.';

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
  String get clientNameCannotChange =>
      'Il nome non potrà essere modificato in seguito.';

  @override
  String get clientNameTaken => 'Questo nome è già in uso. Scegline un altro.';

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
  String get workoutRecoveryTitle => 'Allenamento interrotto';

  @override
  String get workoutRecoveryMessage =>
      'Il tuo allenamento precedente è terminato in modo imprevisto. Continua da dove avevi lasciato o elimina i dati non salvati.';

  @override
  String get workoutRecoveryContinue => 'Continua allenamento';

  @override
  String get workoutRecoveryDelete => 'Elimina allenamento';

  @override
  String get workoutRecoverySessionMissing =>
      'L\'allenamento programmato del cliente è stato rimosso. La bozza non salvata è stata cancellata.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Completa l\'esercizio corrente prima di aggiungerne un altro.';

  @override
  String get switchWorkoutTypeTitle => 'Cambiare tipo di allenamento?';

  @override
  String get switchWorkoutTypeBody =>
      'Le serie dell\'altro tipo non verranno salvate in questo allenamento.';

  @override
  String get switchWorkoutTypeConfirm => 'Cambia';

  @override
  String get saveWorkoutNothingToSave =>
      'Non c\'è ancora nulla da salvare. Inserisci peso e ripetizioni, o la durata del cardio.';

  @override
  String get importedHistoryBadge => 'Importato';

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
  String exerciseNumberLabel(int n) {
    return 'n. $n';
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
  String get repeatLastWorkout => 'Ripeti l\'ultimo allenamento';

  @override
  String get repeatLastUnavailable =>
      'Questo cliente non ha ancora un allenamento da ripetere.';

  @override
  String get editPlan => 'Modifica piano';

  @override
  String get trainerSessionEmpty => 'Non ancora pianificato';

  @override
  String trainerSessionPlanned(int n) {
    return '$n pianificati';
  }

  @override
  String get trainerClientsEmpty =>
      'Nessun cliente. Aggiungine uno per iniziare a programmare.';

  @override
  String get clientNeverTrained => 'Nessun allenamento ancora';

  @override
  String get clientNoUpcoming => 'Nessuna sessione in arrivo';

  @override
  String clientLastSession(String when) {
    return 'Ultimo: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Prossimo: $when';
  }

  @override
  String get clientSessionToday => 'oggi';

  @override
  String get clientSessionYesterday => 'ieri';

  @override
  String get clientSessionTomorrow => 'domani';

  @override
  String clientSessionDaysAgo(int n) {
    return '$n gg fa';
  }

  @override
  String clientSessionInDays(int n) {
    return 'tra $n gg';
  }

  @override
  String get clientProfileDetails => 'Profilo';

  @override
  String get addSessionPickClient => 'Seleziona un cliente';

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
  String get progressChartVolumeLegend => 'Volume (tonnellaggio)';

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
  String get addClient => 'AGGIUNGI CLIENTE';

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
  String get instructionTitle => 'Come è organizzato';

  @override
  String get instructionHubManifest =>
      'Niente catalogo di esercizi né programmi già pronti. Dai i nomi ai movimenti con le tue parole — l\'app tiene le statistiche.';

  @override
  String get instructionSearchHint => 'Cerca nella guida';

  @override
  String get instructionSearchEmpty => 'Nessun risultato.';

  @override
  String get instructionChapterStartTitle => 'Da dove iniziare';

  @override
  String get instructionChapterStartBlurb =>
      'Schermata iniziale, i due modi e la logica dell\'app.';

  @override
  String get instructionChapterSessionTitle => 'In allenamento';

  @override
  String get instructionChapterSessionBlurb =>
      'Serie, carico, ripetizioni, RIR, cardio e chiusura della sessione.';

  @override
  String get instructionChapterTimerTitle => 'Cronometro';

  @override
  String get instructionChapterTimerBlurb =>
      'Intervalli, recupero tra le serie e segnali.';

  @override
  String get instructionChapterExercisesTitle => 'Esercizi e gruppi';

  @override
  String get instructionChapterExercisesBlurb =>
      'La tua lista di movimenti, gruppi muscolari, preferiti e allenamento rapido.';

  @override
  String get instructionChapterProgressTitle => 'Progressi e record';

  @override
  String get instructionChapterProgressBlurb =>
      'Progresso personale, 1RM, tonnellaggio e grafico dell\'esercizio.';

  @override
  String get instructionChapterRhythmTitle => 'Ritmo e recupero';

  @override
  String get instructionChapterRhythmBlurb =>
      'L\'indicatore settimanale di ritmo e la settimana di scarico.';

  @override
  String get instructionChapterDataTitle => 'Cronologia e dati';

  @override
  String get instructionChapterDataBlurb =>
      'Calendario, modifica delle sedute, statistiche e backup.';

  @override
  String get instructionChapterCoachTitle => 'Modalità trainer';

  @override
  String get instructionChapterCoachBlurb =>
      'Clienti, agenda, piano di seduta e stampa.';

  @override
  String get instructionPhilosophy =>
      'IronVibe non insegna ad allenarsi e non consegna programmi già pronti — di quello si occupano il trainer e la tua esperienza. Non c\'è un catalogo di migliaia di esercizi: inserisci i nomi con le tue parole e l\'app conta i numeri con cura. Tutto resta sul dispositivo: niente account, abbonamenti o pubblicità.';

  @override
  String get instructionSectionHome => 'Schermata iniziale';

  @override
  String get instructionThemeTitle => 'Tema';

  @override
  String get instructionThemeDesc =>
      'L\'interruttore sole — luna passa da chiaro a scuro. La scelta viene ricordata.';

  @override
  String get instructionTrainSelfTitle => 'Mi alleno io';

  @override
  String get instructionTrainSelfDesc =>
      'Il tuo spazio: allenamenti, calendario, progresso personale, preferiti e indicatore di ritmo.';

  @override
  String get instructionTrainOthersTitle => 'Alleno altri';

  @override
  String get instructionTrainOthersDesc =>
      'Modalità trainer: clienti, agenda e una cronologia separata per persona. Non si mescola con i tuoi allenamenti.';

  @override
  String get instructionLanguageTitle => 'Lingua';

  @override
  String get instructionLanguageDesc =>
      'L\'app segue la lingua di sistema — non c\'è un\'impostazione a parte. Sono supportate dieci lingue.';

  @override
  String get instructionHomeLinksTitle => 'Versione e contatti';

  @override
  String get instructionHomeLinksDesc =>
      'In fondo alla schermata iniziale: numero di versione, sito, Telegram, e-mail di supporto e informativa sulla privacy.';

  @override
  String get instructionSectionAthleteMenu => 'I tuoi allenamenti';

  @override
  String get instructionStartWorkoutTitle => 'Inizia allenamento';

  @override
  String get instructionStartWorkoutDesc =>
      'Apre una sessione vuota — l\'ultimo allenamento non viene copiato. Aggiungi esercizi, registra le serie, poi termina per salvare.';

  @override
  String get instructionQuickWorkoutTitle => 'Allenamento rapido';

  @override
  String get instructionQuickWorkoutDesc =>
      'Compone un full body di quattro esercizi in base alle etichette dei gruppi muscolari.';

  @override
  String get instructionCalendarMenuTitle => 'Calendario allenamenti';

  @override
  String get instructionCalendarMenuDesc =>
      'I giorni in cui ti sei allenato. Da qui apri le sessioni salvate o aggiungi quelle saltate.';

  @override
  String get instructionSectionPersonalProgress => 'Progresso personale';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabella delle serie migliori, dell\'1RM stimato e del volume massimo per ogni movimento.';

  @override
  String get instructionFavoritesMenuTitle => 'Esercizi preferiti';

  @override
  String get instructionFavoritesMenuDesc =>
      'Movimenti contrassegnati con la stella. Da quelli componi un allenamento in un paio di tocchi.';

  @override
  String get instructionSectionWorkout => 'Sessione';

  @override
  String get instructionStrengthCardioTitle => 'Forza o cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'L\'interruttore in alto nella sessione imposta il tipo. Forza: carico, ripetizioni e RIR. Cardio: tempo e intensità. Se ci sono già dati dell\'altro tipo, l\'app chiede conferma.';

  @override
  String get instructionAddExerciseTitle => 'Aggiungi esercizio';

  @override
  String get instructionAddExerciseBody =>
      'Un nuovo blocco si aggiunge quando l\'esercizio corrente ha un nome e almeno una serie compilata.';

  @override
  String get instructionPreviousHintsTitle => 'Suggerimenti grigi';

  @override
  String get instructionPreviousHintsDesc =>
      'Carico e ripetizioni dell\'ultima volta sono in grigio — un riferimento da battere, non una serie già registrata. In cronologia finisce solo ciò che digiti tu.';

  @override
  String get instructionRemoveExerciseTitle => 'Togli esercizio';

  @override
  String get instructionRemoveExerciseDesc =>
      'La crocetta rossa toglie il blocco dalla sessione in corso. La cronologia salvata non cambia.';

  @override
  String get instructionSectionSetControl => 'Riga della serie';

  @override
  String get instructionSetPlusLabel => 'Più';

  @override
  String get instructionSetPlusDesc =>
      'Aggiunge una riga vuota per la serie successiva.';

  @override
  String get instructionSetMinusLabel => 'Meno';

  @override
  String get instructionSetMinusDesc =>
      'Toglie l\'ultima serie. Una riga vuota sparisce subito, una compilata dopo conferma. Se ne resta una sola, i campi si svuotano.';

  @override
  String get instructionSetProgressLabel => 'Grafico dell\'esercizio';

  @override
  String get instructionSetProgressDesc =>
      'Apre l\'andamento di questo movimento per mese, anno o tutto il tempo.';

  @override
  String get instructionExerciseVolumeTitle => 'Tonnellaggio dell\'esercizio';

  @override
  String get instructionExerciseVolumeDesc =>
      'A destra del pulsante del grafico: somma di carico × ripetizioni su tutte le serie compilate. Si ricalcola in tempo reale.';

  @override
  String get instructionSectionInputs => 'Cosa significano i campi';

  @override
  String get instructionWeightTitle => 'Carico';

  @override
  String get instructionWeightBody =>
      'Il carico di lavoro. Chilogrammi o libbre — l\'app non converte e non impone nulla.';

  @override
  String get instructionRepsTitle => 'Ripetizioni';

  @override
  String get instructionRepsBody =>
      'Quante volte hai eseguito il movimento nella serie.';

  @override
  String get instructionRirTitle => 'RIR — ripetizioni in riserva';

  @override
  String get instructionRirBody =>
      'Quante ripetizioni avresti ancora potuto fare. 0 è lavoro a cedimento, ∞ una serie di riscaldamento. Un modo semplice per dosare l\'intensità.';

  @override
  String get instructionOneRmTitle => '1RM — massimale su una ripetizione';

  @override
  String get instructionOneRmDesc =>
      'Stima del carico su una ripetizione con la formula di Epley, dal peso e dalle ripetizioni della serie. Compare sotto la riga — un riferimento chiave di forza.';

  @override
  String get instructionSectionCardio => 'Cardio';

  @override
  String get instructionCardioTitle => 'Tempo';

  @override
  String get instructionCardioBody =>
      'Durata del blocco in minuti. Niente distanza né frequenza cardiaca: l\'app non è collegata a tracker.';

  @override
  String get instructionIntensityTitle => 'Intensità';

  @override
  String get instructionIntensityBody =>
      'Sforzo da 1 a 5 — una scala RPE semplificata. In una sessione cardio si salva una sola riga per esercizio.';

  @override
  String get instructionSectionSaving => 'Chiusura';

  @override
  String get instructionFinishTitle => 'Termina allenamento';

  @override
  String get instructionFinishBody =>
      'Il pulsante in fondo alla sessione: l\'app chiede conferma e scrive l\'allenamento in cronologia. Serve almeno una serie compilata.';

  @override
  String get instructionLeaveWorkoutTitle => 'Uscire prima';

  @override
  String get instructionLeaveWorkoutDesc =>
      'Se chiudi una sessione con dati, puoi restare, salvare quanto registrato o cancellare la bozza.';

  @override
  String get instructionAutoSaveTitle => 'Allenamento interrotto';

  @override
  String get instructionAutoSaveDesc =>
      'La bozza si salva da sola — ogni minuto e quando l\'app va in background. Al prossimo avvio potrai riprendere dallo stesso punto o cancellarla.';

  @override
  String get instructionScreenAwakeTitle => 'Lo schermo resta acceso';

  @override
  String get instructionScreenAwakeDesc =>
      'Durante una sessione in corso lo schermo non si spegne, così non sblocchi il telefono dopo ogni serie.';

  @override
  String get instructionStopwatchWhyTitle => 'Perché cronometrare il recupero';

  @override
  String get instructionStopwatchWhyBody =>
      'La pausa tra le serie è un parametro di lavoro, come carico e ripetizioni: un recupero corto alza la densità, uno lungo lascia spingere su una serie pesante.';

  @override
  String get instructionStopwatchHowTitle => 'Avvio, pausa, reset';

  @override
  String get instructionStopwatchHowBody =>
      'Il timer è fissato nell\'intestazione della sessione e resta visibile mentre scorri. Al centro tempo e comandi; in modalità normale conta in su, con i centesimi.';

  @override
  String get instructionStopwatchIntervalsTitle => 'A sinistra: intervalli';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — un minuto di lavoro e uno di recupero. 4/4 — quattro minuti ciascuno. 20/10 — Tabata. Le fasi ruotano in loop fino a pausa o reset: tinta rossa è lavoro, blu è recupero.';

  @override
  String get instructionStopwatchRestTitle => 'A destra: recupero';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m e +5m avviano il conto alla rovescia tra le serie. Se è già in corso, i minuti si aggiungono al resto; un ciclo di intervalli passa al recupero.';

  @override
  String get instructionStopwatchProgressTitle => 'Barra di fase';

  @override
  String get instructionStopwatchProgressBody =>
      'Nel conto alla rovescia e negli intervalli, sotto le cifre si vede quanto resta della fase in corso.';

  @override
  String get instructionStopwatchSoundsTitle => 'Suono e vibrazione';

  @override
  String get instructionStopwatchSoundsBody =>
      'A tre, due e un secondo dalla fine della fase — un click breve e una vibrazione lieve; al cambio di fase il segnale è più netto. I suoni sono nell\'app: niente microfono, niente permesso notifiche. Il volume segue le impostazioni del telefono.';

  @override
  String get instructionExerciseBankIntro =>
      'La lista esercizi cresce da sola: ogni nuovo nome da un allenamento finito entra nei suggerimenti. I nomi sono in maiuscolo, così lo stesso movimento non si sdoppia.';

  @override
  String get instructionSectionExerciseNameTools => 'Nomi';

  @override
  String get instructionRenameExerciseTitle => 'Rinomina ovunque';

  @override
  String get instructionRenameExerciseDesc =>
      'Pressione lunga sul nome — in sessione, nella lista dei suggerimenti o in un allenamento salvato. Si aggiorna in tutta la cronologia e sui grafici.';

  @override
  String get instructionRemoveFromBankTitle => 'Togli dai suggerimenti';

  @override
  String get instructionRemoveFromBankDesc =>
      'La crocetta nella lista dei suggerimenti aperta, o quella rossa nel progresso personale, toglie il nome da suggerimenti e tabella. Gli allenamenti salvati restano intatti.';

  @override
  String get instructionReassignExerciseTitle =>
      'Sostituisci nella registrazione';

  @override
  String get instructionReassignExerciseDesc =>
      'In un allenamento salvato puoi riassegnare il blocco a un altro movimento. Le serie restano, ma passano alle statistiche del nuovo nome — cambia solo questa sessione.';

  @override
  String get instructionSectionMuscleGroups => 'Gruppi muscolari';

  @override
  String get instructionMuscleGroupsIntro =>
      'Il gruppo è un\'etichetta facoltativa sul tuo nome. Serve solo all\'allenamento rapido, per comporre un full body equilibrato. Otto gruppi: petto, schiena, spalle, core, coscia anteriore, coscia posteriore, flessione braccia, estensione braccia.';

  @override
  String get instructionMuscleGroupTagTitle => 'Come etichettare';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Alla prima immissione di un nome nuovo l\'app chiede il gruppo. Puoi rispondere Più tardi, o Non per l\'allenamento rapido se il movimento non deve entrare nel mix. L\'etichetta sotto il nome in progresso personale e preferiti si cambia o si toglie facilmente.';

  @override
  String get instructionSectionFavorites => 'Preferiti';

  @override
  String get instructionFavoriteStarTitle => 'Stella';

  @override
  String get instructionFavoriteStarDesc =>
      'La stella c\'è sulla scheda dell\'esercizio in sessione e nella tabella del progresso personale. I preferiti restano in cima alla lista.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Componi allenamento';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'Nella schermata dei preferiti seleziona i movimenti — il pulsante compare subito. La sessione si apre in quell\'ordine, con i suggerimenti grigi dell\'ultima volta. Per un cliente, la stessa azione apre il suo allenamento.';

  @override
  String get instructionSectionQuickWorkout => 'Allenamento rapido';

  @override
  String get instructionQuickWorkoutHowTitle => 'Quattro slot';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Petto, schiena, una metà delle gambe (coscia anteriore o posteriore — mai entrambe lo stesso giorno) e un movimento per spalle, braccia o core. In ogni slot l\'app prende il gruppo fermo da più tempo e dà priorità a un preferito.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Anteprima e scambio';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'Prima di partire vedi tutta la composizione: ogni slot si può scambiare con un altro esercizio dello stesso gruppo. Se mancano movimenti etichettati, l\'app lo dice e apre il progresso personale per mettere le etichette.';

  @override
  String get instructionPersonalProgressIntro =>
      'Una tabella di tutti i movimenti dagli allenamenti salvati. Preferiti in alto, il resto in ordine alfabetico; la ricerca trova il nome. Si apre dal menu allenamenti o dal profilo cliente.';

  @override
  String get instructionProgressBestSetTitle => 'Serie migliore';

  @override
  String get instructionProgressBestSetDesc =>
      'La serie con l\'1RM stimato più alto in tutta la cronologia. Per i movimenti senza carico si prende la serie con più ripetizioni.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Volume massimo';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'Il maggior tonnellaggio di questo esercizio in un singolo allenamento — un ancoraggio utile per pianificare il volume di lavoro.';

  @override
  String get instructionSectionProgressChart => 'Grafico dell\'esercizio';

  @override
  String get instructionProgressChartIntro =>
      'Tre curve indipendenti per data. A sinistra la scala del carico, a destra quella delle ripetizioni; la linea gialla è normalizzata per confrontare gli andamenti per forma. Il periodo si cambia — mese, anno, tutto il tempo — e un tocco su un punto mostra i numeri di quel giorno. Il cardio non entra nel grafico.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Rossa — carico più alto in una serie quel giorno.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Ciano — più ripetizioni in una serie, non per forza con il carico massimo.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Gialla — tonnellaggio del giorno: somma di carico × ripetizioni sulle serie con entrambi i campi compilati.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'In un allenamento in corso il pulsante del grafico si illumina se batti un record: rosso per il carico di serie, giallo per il tonnellaggio dell\'esercizio, ciano per la somma di ripetizioni sui movimenti senza carico. Se coincidono più condizioni, vince il rosso, poi il giallo, poi il ciano. Nella cronologia salvata non c\'è evidenziazione.';

  @override
  String get instructionRhythmIntro =>
      'Quando nelle ultime quattro settimane si accumulano almeno tre giorni di forza, in cima alla schermata allenamenti compare l\'indicatore di ritmo. Non è un obiettivo né un voto — è solo quanto vai in palestra in questo periodo.';

  @override
  String get instructionRhythmGaugeTitle => 'Giorni a settimana';

  @override
  String get instructionRhythmGaugeDesc =>
      'L\'arco si riempie da uno a sei giorni — la media su quattro settimane. Contano i giorni con lavoro di forza, non quelli solo cardio. Più denso è il ritmo, più il colore scivola dall\'acciaio all\'oro fino alla ruggine.';

  @override
  String get instructionRhythmInsightTitle => 'Lettura del ritmo';

  @override
  String get instructionRhythmInsightDesc =>
      'Tocca l\'indicatore: l\'app nomina la tua modalità — ritmo tranquillo, costante, denso o quasi senza giorni liberi — e spiega cosa significa per il recupero. Sul cliente del trainer si apre la stessa lettura.';

  @override
  String get instructionRhythmDeloadTitle => 'Settimana di scarico';

  @override
  String get instructionRhythmDeloadDesc =>
      'Lo scarico non è una pausa, è una settimana a mezza potenza: carichi di lavoro e numero di serie giù del 30–50%, oppure solo cardio. Il muscolo recupera prima di legamenti, tendini e articolazioni — questa settimana dà loro tempo di raggiungere.';

  @override
  String get instructionRhythmNudgeTitle => 'Promemoria';

  @override
  String get instructionRhythmNudgeDesc =>
      'Se tieni almeno due sedute e mezzo a settimana e da un po\' non scarichi, l\'app propone di prendere una settimana così. Più denso è il ritmo, prima arriva il suggerimento. Compare al massimo una volta a settimana e solo in modalità personale — è una raccomandazione, non un consiglio medico.';

  @override
  String get instructionSectionCalendar => 'Calendario e cronologia';

  @override
  String get instructionCalendarBrowseTitle => 'Come sfogliare';

  @override
  String get instructionCalendarBrowseDesc =>
      'I mesi si cambiano con lo swipe; un tocco sul nome del mese apre la scelta rapida della data. Un puntino sotto il numero significa che quel giorno c\'è stato un allenamento.';

  @override
  String get instructionCalendarAddTitle => 'Registrazione a posteriori';

  @override
  String get instructionCalendarAddDesc =>
      'Scegli il giorno, imposta l\'ora e aggiungi un allenamento — anche per una data già passata. Utile se ti sei dimenticato di registrare la sessione.';

  @override
  String get instructionNavHistoryTitle => 'Tonnellaggio dell\'allenamento';

  @override
  String get instructionNavHistoryDesc =>
      'Ogni sessione salvata mostra il tonnellaggio totale. Il volume è uno dei riferimenti più solidi per l\'ipertrofia: conta non il record di un giorno, ma come tiene di settimana in settimana.';

  @override
  String get instructionHistoryEditTitle => 'Modifica delle registrazioni';

  @override
  String get instructionHistoryEditDesc =>
      'Un allenamento salvato si può espandere e correggere: aggiungere esercizio o serie, cambiare i numeri, cancellare tutta la sessione. Le modifiche si salvano subito.';

  @override
  String get instructionSectionStats => 'Statistiche';

  @override
  String get instructionStatsTitle => 'Riepilogo allenamenti';

  @override
  String get instructionStatsDesc =>
      'L\'icona del grafico nell\'intestazione della schermata allenamenti o trainer: quante sessioni questo mese, quest\'anno e in totale. In modalità trainer anche il dettaglio per cliente.';

  @override
  String get instructionSectionBackup => 'Backup';

  @override
  String get instructionNavImportExportTitle => 'Esporta e importa';

  @override
  String get instructionNavImportExportDesc =>
      'L\'esportazione mette in un file JSON cronologia, lista esercizi, preferiti, etichette di gruppo, clienti e agenda. L\'importazione mescola il file ai dati attuali e salta i duplicati — non si cancella nulla. Il backup trainer è separato da quello personale.';

  @override
  String get instructionBackupNudgeTitle => 'Promemoria di copia';

  @override
  String get instructionBackupNudgeDesc =>
      'I dati vivono solo su questo dispositivo: niente account, niente cloud. Ogni quattro settimane l\'app propone di salvare una copia — se il telefono si perde, la cronologia torna solo da quel file.';

  @override
  String get instructionTrainerIntro =>
      '«Alleno altri» è uno spazio a parte per lavorare con le persone: clienti, agenda e una cronologia per ciascuno. Allenamenti personali e dati trainer non si incrociano.';

  @override
  String get instructionClientsTitle => 'Clienti';

  @override
  String get instructionClientsDesc =>
      'Elenco con obiettivo, ultima e prossima sessione. Sulla scheda: obiettivo, peso, altezza e note private del trainer. Il nome si imposta alla creazione e poi non cambia.';

  @override
  String get instructionClientProfileTitle => 'Profilo cliente';

  @override
  String get instructionClientProfileDesc =>
      'Da qui parte la sessione di oggi e si aprono progresso, preferiti e cronologia per mese. Se i giorni di forza bastano, c\'è anche l\'indicatore di ritmo. Eliminare un cliente toglie le sessioni future; gli allenamenti passati restano per il resoconto.';

  @override
  String get instructionTrainerScheduleTitle => 'Agenda';

  @override
  String get instructionTrainerScheduleDesc =>
      'Il calendario trainer mostra le sessioni di tutti i clienti: icona play = pianificata, spunta = conclusa, clessidra = quella di oggi in corso. I piani vuoti dei giorni passati si tolgono da soli.';

  @override
  String get instructionTrainerPlanTitle => 'Piano di seduta';

  @override
  String get instructionTrainerPlanDesc =>
      'Per una data futura puoi disporre esercizi e nota in anticipo e salvare senza chiudere l\'allenamento. Carico e ripetizioni dell\'ultima volta arrivano come suggerimenti grigi. In cronologia vanno solo le sessioni concluse.';

  @override
  String get instructionTrainerRepeatTitle => 'Ripeti l\'ultimo';

  @override
  String get instructionTrainerRepeatDesc =>
      'Dal profilo cliente o con l\'interruttore quando aggiungi una sessione nel calendario. Si copia la composizione degli esercizi; carico e ripetizioni arrivano come suggerimenti grigi, non come serie già fatte.';

  @override
  String get instructionPrintSessionTitle => 'Stampa la sessione';

  @override
  String get instructionPrintSessionDesc =>
      'In un allenamento concluso, l\'icona di stampa in intestazione compone un foglio A4 con composizione e numeri del giorno. Poi il foglio di sistema: stampante, PDF o invio al cliente.';

  @override
  String get instructionImportAthleteTitle => 'Importa cronologia atleta';

  @override
  String get instructionImportAthleteDesc =>
      'Pulsante dedicato nelle statistiche trainer: un file dalla modalità personale diventa un nuovo cliente, con preferiti ed etichette di gruppo. Gli allenamenti trasferiti sono contrassegnati come importati e i nomi degli esercizi non si mescolano ai tuoi.';

  @override
  String get printSession => 'Stampa';

  @override
  String get printSessionEmpty =>
      'Non c\'è ancora nulla da stampare. Registra almeno una serie.';

  @override
  String get printSessionShareText => 'Sessione IronVibe';

  @override
  String get rhythmPerWeek => 'a settimana';

  @override
  String get deloadNudgeTitle => 'Una settimana di recupero attivo?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Ti alleni circa $rate giorni a settimana da circa $weeks settimane. Buon momento per una settimana di recupero attivo: carichi e serie giù del 30–50%, oppure solo cardio. È una raccomandazione, non un consiglio medico.';
  }

  @override
  String get deloadNudgeLater => 'Non ora';

  @override
  String get deloadNudgeOk => 'Ho capito';

  @override
  String get backupNudgeTitle => 'Salvare una copia?';

  @override
  String get backupNudgeBody =>
      'I dati restano solo su questo dispositivo. Se lo perdi o si rompe la memoria, la cronologia sparisce. Condividi una copia ora, o rimanda di 28 giorni.';

  @override
  String get backupNudgeShare => 'Condividi';

  @override
  String get backupNudgeLater => 'Più tardi';

  @override
  String get rhythmInsightTitle => 'Ritmo di allenamento';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'Ti alleni in media circa $rate volte a settimana.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name si allena in media circa $rate volte a settimana.';
  }

  @override
  String get rhythmInsightBandLight => 'Ritmo tranquillo';

  @override
  String get rhythmInsightBandSteady => 'Ritmo costante';

  @override
  String get rhythmInsightBandDense => 'Ritmo denso';

  @override
  String get rhythmInsightBandVeryDense => 'Quasi senza giorni liberi';

  @override
  String get rhythmInsightHowTitle => 'Da dove arriva questo numero';

  @override
  String get rhythmInsightWindow =>
      'Media delle ultime quattro settimane. Contano i giorni con lavoro di forza; i giorni solo cardio no. Non è un obiettivo né un voto: è il tuo ritmo attuale.';

  @override
  String get rhythmInsightWhatTitle => 'Settimana di recupero attivo';

  @override
  String get rhythmInsightWhatBody =>
      'Non è una pausa, è una settimana a mezza potenza: carichi di lavoro e numero di serie giù del 30–50%. Puoi anche lasciare la forza e tenere cardio o un\'altra attività. Il muscolo recupera prima di articolazioni, legamenti e tendini: questa settimana dà loro tempo di raggiungere.';

  @override
  String get rhythmInsightPaceTitle => 'Cosa significa';

  @override
  String get rhythmInsightAdviceLight =>
      'Tra le sedute ci sono abbastanza giorni liberi, la fatica non si accumula. Non serve ancora pianificare un recupero attivo: a questo ritmo il corpo recupera da solo.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Un ritmo costante su cui si può lavorare per anni. Se le sedute sono dure, prendi una settimana di recupero attivo ogni pochi mesi: meglio prima che quando i carichi si fermano.';

  @override
  String get rhythmInsightAdviceDense =>
      'Le sedute sono vicine e la fatica si accumula in silenzio. Una settimana di recupero attivo ogni due o tre mesi di solito tiene il progresso meglio di un inseguimento senza pause.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Quasi ogni giorno sotto carico. Può funzionare se sonno e cibo tengono. A questo ritmo una settimana di recupero attivo circa una volta al mese è prevenzione ordinaria per articolazioni e legamenti, non una scappatoia.';

  @override
  String get rhythmInsightPraiseSteady =>
      'È il ritmo che la gente tiene per anni.';

  @override
  String get rhythmInsightPraiseDense =>
      'Ti alleni spesso: un calendario così non nasce da solo.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Sembra che tu abbia trovato la modalità segreta del corpo.';

  @override
  String get rhythmInsightRecentLighter =>
      'Il carico è già sceso di recente: il recupero attivo può contare come fatto. Riprendi il ritmo.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Questo ritmo dura già da $weeks settimane.',
      one: 'Questo ritmo dura già da $weeks settimana.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'È una raccomandazione, non un consiglio medico. Se ti senti bene, non c\'è niente da cambiare.';
}
