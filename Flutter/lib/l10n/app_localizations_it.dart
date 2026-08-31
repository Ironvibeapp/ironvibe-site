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
  String get instructionTitle => 'Come funziona';

  @override
  String get instructionPhilosophy =>
      'IronVibe non ha cataloghi di esercizi imposti né programmi preconfezionati: è una scelta consapevole. Non ti insegna ad allenarti — per quello ci sono YouTube e i coach — ti aiuta solo a registrare i numeri come preferisci. Scrivi tu i nomi degli esercizi. Se vuoi, assegni un gruppo muscolare così l\'app può comporre un allenamento rapido full body dalla tua lista. Più la usi, più ti sembra naturale: si adatta a te, non il contrario.';

  @override
  String get instructionSectionSetControl => 'Controllo serie';

  @override
  String get instructionSetMinusLabel => 'Meno';

  @override
  String get instructionSetMinusDesc =>
      'Rimuove l\'ultima serie. Se la riga ha già peso, ripetizioni o RIR, l\'app chiede conferma. Una riga vuota viene tolta subito. Se resta una sola serie: nell\'allenamento in corso la riga viene svuotata; nella cronologia salvata viene eliminato tutto l\'esercizio.';

  @override
  String get instructionSetPlusLabel => 'Più';

  @override
  String get instructionSetPlusDesc =>
      'Aggiunge una nuova riga di serie vuota a questo esercizio.';

  @override
  String get instructionSetProgressLabel => 'Cronologia';

  @override
  String get instructionSetProgressDesc =>
      'Apre la cronologia di progresso per questo esercizio.';

  @override
  String get instructionSectionProgressChart => 'Grafico progressi';

  @override
  String get instructionProgressChartIntro =>
      'Tre andamenti indipendenti per data: rosso — serie piu pesante del giorno; cyan — piu ripetizioni in una serie; giallo — volume esercizio (somma peso × ripetizioni del giorno). Asse sinistro: peso; destro: ripetizioni; la linea gialla e normalizzata.';

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
  String get instructionProgressLineVolumeDesc =>
      'Linea gialla: volume giornaliero (tonnellaggio), calcolato come somma peso × ripetizioni nelle serie con entrambi i valori.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Durante un allenamento attivo il pulsante del grafico sotto le serie puo colorarsi come le linee: rosso se superi il tuo miglior peso in una serie; giallo se il volume totale dell\'esercizio batte il tuo record precedente; ciano se l\'esercizio e senza peso e la somma delle ripetizioni di tutte le serie supera il massimo passato. Se valgono piu condizioni, priorita rosso, poi giallo, poi ciano. Evidenza solo mentre registri l\'allenamento in corso, non nella cronologia salvata.';

  @override
  String get instructionSectionWorkout => 'Allenamento';

  @override
  String get instructionAddExerciseTitle => 'Aggiungi esercizio';

  @override
  String get instructionAddExerciseBody =>
      'Aggiunge un nuovo blocco. Prima dai un nome all\'esercizio corrente: l\'app te lo ricorda se il campo è ancora vuoto.';

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
      'Con l\'elenco suggerimenti aperto sotto il nome, tocca la X di una riga — o la X rossa in Progresso personale — per rimuovere quel nome dai suggerimenti e dalla tabella dei progressi. Gli allenamenti salvati restano invariati.';

  @override
  String get instructionSectionInputs => 'Dati';

  @override
  String get instructionWeightTitle => 'Peso';

  @override
  String get instructionWeightBody =>
      'Peso del carico. Inserisci il numero in kg o lb, come ti alleni. L\'app non converte le unità.';

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
      'Una tabella di tutti i movimenti degli allenamenti salvati: serie migliore, 1RM stimato e volume massimo. La ricerca trova subito il nome. La stella segna i preferiti; il chip sotto il nome assegna il gruppo muscolare; la X rossa toglie il nome dai suggerimenti e da questa tabella (gli allenamenti salvati restano). Accesso dal menu allenamento o dal profilo cliente.';

  @override
  String get instructionSectionSaving => 'Salvataggio';

  @override
  String get instructionFinishTitle => 'Termina';

  @override
  String get instructionFinishBody =>
      'Conferma e scrive la sessione nella cronologia. Se esci prima, puoi salvare, scartare o restare. Se l\'app si interrompe, la bozza resta automaticamente.';

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
      'Nel calendario/storico ogni allenamento mostra il tonnellaggio totale. Il volume di allenamento e uno dei migliori indicatori di ipertrofia: piu volume di qualita accumuli, piu muscolo costruisci.';

  @override
  String get instructionNavImportExportTitle => 'Import / export';

  @override
  String get instructionNavImportExportDesc =>
      'Backup o trasferimento dati con export e import JSON nel dialogo statistiche. La copia include cronologia, elenco esercizi, preferiti ed etichette dei gruppi muscolari. Il backup coach è separato dalla cronologia personale.';

  @override
  String get instructionSectionHome => 'Home';

  @override
  String get instructionThemeTitle => 'Tema';

  @override
  String get instructionThemeDesc =>
      'L\'interruttore sole / luna nella home passa da chiaro a scuro. La scelta viene ricordata.';

  @override
  String get instructionTrainSelfTitle => 'Mi alleno da solo';

  @override
  String get instructionTrainSelfDesc =>
      'I tuoi allenamenti, calendario, progresso personale, preferiti, un indicatore di ritmo su quanto ti alleni e un allenamento rapido full body dai tuoi esercizi etichettati.';

  @override
  String get instructionTrainOthersTitle => 'Alleno gli altri';

  @override
  String get instructionTrainOthersDesc =>
      'Modalità coach: clienti, agenda e cronologia separata per persona. Ogni cliente ha tabella dei progressi e preferiti propri.';

  @override
  String get instructionSectionAthleteMenu => 'Il tuo allenamento';

  @override
  String get instructionStartWorkoutTitle => 'Inizia allenamento';

  @override
  String get instructionStartWorkoutDesc =>
      'Apre una sessione vuota — non copia l\'ultimo allenamento. Aggiungi esercizi, registra le serie e termina per salvare.';

  @override
  String get instructionQuickWorkoutTitle => 'Allenamento rapido';

  @override
  String get instructionQuickWorkoutDesc =>
      'Compone una sessione full body di 4 esercizi: petto, schiena, una metà delle gambe (coscia anteriore o posteriore — mai entrambe) e uno per spalle, braccia o core, il gruppo che non alleni da più tempo. Prima i preferiti. Pesi e ripetizioni precedenti appaiono in grigio come minimo da battere — ogni serie la inserisci tu.';

  @override
  String get instructionCalendarMenuTitle => 'Calendario allenamenti';

  @override
  String get instructionCalendarMenuDesc =>
      'Vedi in quali giorni ti sei allenato, apri una sessione salvata o aggiungi un allenamento a data e ora scelte — anche nei giorni passati.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabella delle serie migliori, 1RM stimato e volume massimo. Qui segni i preferiti e i gruppi muscolari.';

  @override
  String get instructionFavoritesMenuTitle => 'Esercizi preferiti';

  @override
  String get instructionFavoritesMenuDesc =>
      'La lista con stella. Seleziona quelli che vuoi e tocca Componi allenamento per iniziare in quell\'ordine. Pesi e ripetizioni precedenti appaiono in grigio come minimo da battere.';

  @override
  String get instructionSectionRhythm => 'Ritmo di allenamento';

  @override
  String get instructionRhythmIntro =>
      'Dopo alcune sessioni di forza, in cima alla schermata di allenamento compare un indicatore. Mostra quanti giorni a settimana ti sei allenato in media nelle ultime quattro settimane. I giorni solo cardio non contano. Il numero è uno scatto della tua densità, non un obiettivo che l\'app ti impone.';

  @override
  String get instructionRhythmGaugeTitle => 'Giorni a settimana';

  @override
  String get instructionRhythmGaugeDesc =>
      'L\'arco si riempie da 1 a 6 giorni a settimana. L\'acciaio freddo indica un ritmo più leggero; i toni caldi, una densità più alta. L\'indicatore compare quando in quella finestra di quattro settimane ci sono almeno tre giorni di forza.';

  @override
  String get instructionRhythmDeloadTitle => 'Promemoria settimana più leggera';

  @override
  String get instructionRhythmDeloadDesc =>
      'Se ti alleni circa due giorni e mezzo a settimana o più per diverse settimane senza una settimana più leggera, l\'app può suggerire di ridurre tonnellaggio e ripetizioni di circa il 30% per una settimana. Più giorni a settimana, prima arriva il promemoria. È un promemoria, non una prescrizione. Al massimo una volta a settimana.';

  @override
  String get instructionSectionFavorites => 'Preferiti';

  @override
  String get instructionFavoriteStarTitle => 'Stella';

  @override
  String get instructionFavoriteStarDesc =>
      'In Progresso personale tocca la stella accanto a un esercizio per aggiungerlo o toglierlo dai preferiti. I preferiti restano in cima alla tabella.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Componi allenamento';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'Nella schermata preferiti seleziona gli esercizi. Il pulsante compare quando ne è selezionato almeno uno. Pesi e ripetizioni precedenti appaiono in grigio come minimo da battere — ogni serie la registri tu. Per un cliente, la stessa azione avvia una sessione per quella persona.';

  @override
  String get instructionSectionMuscleGroups =>
      'Gruppi muscolari e allenamento rapido';

  @override
  String get instructionMuscleGroupsIntro =>
      'I gruppi sono etichette opzionali sui nomi che hai scritto tu. Non sono un catalogo: servono solo all\'allenamento rapido per un mix full body equilibrato. Otto gruppi: petto, schiena, spalle, core, coscia anteriore, coscia posteriore, flessione braccia, estensione braccia.';

  @override
  String get instructionMuscleGroupTagTitle => 'Come etichettare';

  @override
  String get instructionMuscleGroupTagDesc =>
      'La prima volta che inserisci un nome nuovo, l\'app chiede un gruppo. Puoi saltare con Più tardi, o marcare Non per l\'allenamento rapido se non vuoi quel movimento nel mix. Il chip sotto il nome in Progresso o Preferiti cambia o toglie l\'etichetta.';

  @override
  String get instructionQuickWorkoutHowTitle =>
      'Come si costruisce la sessione rapida';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Quattro slot: petto, schiena, una metà delle gambe, poi spalle/braccia/core in base a quanto tempo è passato. L\'anteprima consente di sostituire qualsiasi slot con un altro esercizio dello stesso gruppo. Se è poco, aggiungi esercizi tu.';

  @override
  String get instructionStrengthCardioTitle => 'Forza / Cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Selettore in alto nella sessione. Forza: peso, ripetizioni, RIR. Cardio: solo tempo e intensità — nessun campo distanza.';

  @override
  String get instructionPreviousHintsTitle =>
      'Cifre grigie dell\'ultima sessione';

  @override
  String get instructionPreviousHintsDesc =>
      'Quando scegli un esercizio in una sessione cliente, un allenamento rapido o una sessione dai preferiti, gli ultimi pesi e ripetizioni appaiono in grigio — un minimo da battere, non una serie già registrata. In cronologia finiscono solo i numeri che inserisci tu.';

  @override
  String get instructionRemoveExerciseTitle => 'Rimuovi da questo allenamento';

  @override
  String get instructionRemoveExerciseDesc =>
      'Rimuove quel blocco solo dalla sessione in corso. La cronologia salvata non cambia finché non termini.';

  @override
  String get instructionReassignExerciseTitle =>
      'Cambia esercizio in cronologia';

  @override
  String get instructionReassignExerciseDesc =>
      'In un allenamento salvato puoi riassegnare un blocco a un altro nome. Cambia solo quella sessione; i grafici seguono il nuovo nome. Le serie restano com\'erano.';

  @override
  String get instructionAutoSaveTitle => 'Allenamento interrotto';

  @override
  String get instructionAutoSaveDesc =>
      'Se l\'app si chiude a metà sessione, propone di continuare da dove eri o di eliminare la bozza non salvata.';

  @override
  String get instructionSectionCalendar => 'Calendario';

  @override
  String get instructionCalendarAddTitle => 'Aggiungi in una data';

  @override
  String get instructionCalendarAddDesc =>
      'Scegli un giorno e aggiungi un allenamento all\'orario scelto. Utile per registrare una sessione saltata.';

  @override
  String get instructionSectionTrainer => 'Modalità coach';

  @override
  String get instructionTrainerIntro =>
      '«Alleno gli altri» è per i coach. Aggiungi clienti, programma sessioni, pianifica gli esercizi in anticipo e registra gli allenamenti per persona. Ripetere l\'ultima sessione è facoltativo. Export e import dei dati coach sono separati dalla cronologia personale. Eliminando un cliente si tolgono le sessioni future; gli allenamenti passati restano per il resoconto.';

  @override
  String get instructionClientsTitle => 'Clienti';

  @override
  String get instructionClientsDesc =>
      'Aggiungi, modifica o elimina clienti. L\'elenco mostra l\'ultima e la prossima sessione. Campi del profilo: obiettivo, peso, altezza e note private del coach.';

  @override
  String get instructionClientProfileTitle => 'Profilo cliente';

  @override
  String get instructionClientProfileDesc =>
      'Dal profilo parte una sessione di oggi vuota. I numeri grigi dell\'ultima volta appaiono solo dopo aver scelto un esercizio. La cronologia elenca solo gli allenamenti completati. Pianifica le date future nel calendario. Progresso e preferiti sono sulla stessa schermata. Le modifiche al profilo non salvate chiedono conferma prima di uscire.';

  @override
  String get instructionTrainerPlanTitle => 'Pianifica una sessione';

  @override
  String get instructionTrainerPlanDesc =>
      'Pianifica solo dal calendario coach: scegli cliente e data, poi gli esercizi. Pesi e ripetizioni precedenti appaiono in grigio come suggerimento. Una sessione pianificata ha l\'icona play: tocca per iniziare (oggi) o eliminare. In cronologia vanno solo gli allenamenti finiti. Un piano con data già passata viene rimosso.';

  @override
  String get instructionTrainerRepeatTitle => 'Ripeti l\'ultimo allenamento';

  @override
  String get instructionTrainerRepeatDesc =>
      'Facoltativo. Dal profilo cliente, o come interruttore quando aggiungi una sessione nel calendario. Copia gli esercizi dell\'ultima sessione nella sessione live di oggi o in un nuovo piano; i pesi e le ripetizioni precedenti sono suggerimenti grigi, non serie già fatte.';

  @override
  String get rhythmPerWeek => 'a settimana';

  @override
  String get deloadNudgeTitle => 'Una settimana più leggera?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Ti alleni circa $rate giorni a settimana da circa $weeks settimane. È un promemoria, non una prescrizione. Con questo ritmo spesso conviene ridurre tonnellaggio e ripetizioni di circa il 30% per una settimana.';
  }

  @override
  String get deloadNudgeLater => 'Non ora';

  @override
  String get deloadNudgeOk => 'Ho capito';

  @override
  String get instructionHubManifest =>
      'Niente catalogo né programmi precotti. Dai tu i nomi agli esercizi; l\'app tiene le statistiche come vuoi tu.';

  @override
  String get instructionChapterStartTitle => 'Per iniziare';

  @override
  String get instructionChapterStartBlurb =>
      'Schermata home, come ti alleni e perché l\'app non ti insegna ad allenarti.';

  @override
  String get instructionChapterToolsTitle => 'Strumenti';

  @override
  String get instructionChapterToolsBlurb =>
      'Ritmo, preferiti, gruppi muscolari e allenamento rapido.';

  @override
  String get instructionChapterSessionTitle => 'In sessione';

  @override
  String get instructionChapterSessionBlurb =>
      'Serie, campi, cardio, salvataggio e cronometro.';

  @override
  String get instructionChapterProgressTitle => 'Progressi e dati';

  @override
  String get instructionChapterProgressBlurb =>
      'Record personali, grafico, calendario, cronologia e backup.';

  @override
  String get instructionChapterCoachTitle => 'Modalità coach';

  @override
  String get instructionChapterCoachBlurb =>
      'Clienti, profili, sessioni pianificate e ripetizione di un allenamento.';

  @override
  String get instructionSearchHint => 'Cerca nella guida';

  @override
  String get instructionSearchEmpty => 'Nessun risultato.';
}
