// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'LA VIBE DE TON ENTRAÎNEMENT';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Annuler';

  @override
  String get renameExerciseTitle => 'Renommer l\'exercice';

  @override
  String get renameExerciseEmpty => 'Le nom ne peut pas être vide';

  @override
  String get delete => 'Supprimer';

  @override
  String get yesDelete => 'Oui, supprimer';

  @override
  String get close => 'Fermer';

  @override
  String get save => 'Enregistrer';

  @override
  String get add => 'Ajouter';

  @override
  String get trainOthers => 'J\'ENTRAÎNE D\'AUTRES';

  @override
  String get trainSelf => 'JE M\'ENTRAÎNE';

  @override
  String get statistics => 'STATISTIQUES';

  @override
  String get exportHistory => 'EXPORTER L\'HISTORIQUE';

  @override
  String get historyEmpty =>
      'L\'historique est vide, rien à exporter pour l\'instant.';

  @override
  String get exportError => 'Erreur d\'export :';

  @override
  String get exportJson => 'EXPORTER JSON';

  @override
  String get importData => 'IMPORTER';

  @override
  String get importSuccess => 'Données importées avec succès';

  @override
  String get importError => 'Erreur d\'import :';

  @override
  String get importNewerVersion =>
      'Fichier créé par une version plus récente de l\'app';

  @override
  String get importFileAccessError => 'Erreur d\'accès au fichier';

  @override
  String get importInvalidJson => 'Format JSON invalide';

  @override
  String get importInvalidBackupFile =>
      'Erreur : fichier de sauvegarde invalide sélectionné';

  @override
  String get shareText => 'Historique d\'entraînements IronVibe';

  @override
  String get monthStats => 'CE MOIS-CI';

  @override
  String get yearStats => 'CETTE ANNÉE';

  @override
  String get allTimeStats => 'TOUT';

  @override
  String get weight => 'Poids';

  @override
  String get reps => 'Répétitions';

  @override
  String get rir => 'RIR';

  @override
  String get oneRm => '1RM';

  @override
  String get approxOneRm => '≈ 1RM :';

  @override
  String get kg => 'kg';

  @override
  String get volumeShort => 'VOL.';

  @override
  String get addSet => '+ AJOUTER SÉRIE';

  @override
  String get addExercise => '+ AJOUTER EXERCICE';

  @override
  String get finishWorkout => 'TERMINER L\'ENTRAÎNEMENT';

  @override
  String get startWorkout => 'DÉMARRER L\'ENTRAÎNEMENT';

  @override
  String get calendarWorkouts => 'CALENDRIER D\'ENTRAÎNEMENTS';

  @override
  String get personalProgress => 'PROGRÈS PERSONNEL';

  @override
  String get personalProgressSearchHint => 'Rechercher un exercice';

  @override
  String get personalProgressBestSet => 'Meilleure série';

  @override
  String get personalProgressMaxVolume => 'Vol. max';

  @override
  String get personalProgressEmpty => 'Aucun exercice dans l\'historique';

  @override
  String get exerciseHint => 'Saisir le nom de l\'exercice';

  @override
  String get deleteFromHistory => 'Retirer de l\'historique ?';

  @override
  String get deleteExerciseHint => 'n\'apparaîtra plus dans les suggestions.';

  @override
  String get exerciseDeleted => 'supprimé';

  @override
  String get deleteWorkoutTitle => 'SUPPRIMER';

  @override
  String get deleteWorkoutMsg =>
      'Supprimer cet entraînement ? L\'historique de progression sera perdu.';

  @override
  String get removeSetWithDataConfirm =>
      'Supprimer la série avec des données ? Cette action est irréversible.';

  @override
  String get deleteClientTitle => 'SUPPRIMER LE CLIENT';

  @override
  String get deleteClientMsg =>
      'Supprimer ce client ? Tous ses entraînements à venir seront supprimés.';

  @override
  String get noClientsTitle => 'AUCUN CLIENT';

  @override
  String get noClientsMsg =>
      'Ajoutez d\'abord des clients dans le menu « Clients ».';

  @override
  String get newClient => 'NOUVEAU CLIENT';

  @override
  String get editClient => 'MODIFIER';

  @override
  String get clientName => 'Nom';

  @override
  String get clientGoal => 'Objectif';

  @override
  String get clientWeight => 'Poids';

  @override
  String get clientHeight => 'Taille';

  @override
  String get clientNotes => 'Notes';

  @override
  String get saveClientChanges => 'ENREGISTRER LES MODIFICATIONS';

  @override
  String get clientProfileUnsavedTitle => 'Modifications non enregistrées';

  @override
  String get clientProfileUnsavedMessage =>
      'Modifications non enregistrées. Enregistrer avant de quitter ?';

  @override
  String get clientProfileStay => 'Rester';

  @override
  String get clientProfileDiscard => 'Quitter sans enregistrer';

  @override
  String get clientProfileSaveAndLeave => 'Enregistrer et quitter';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Terminez l\'exercice en cours avant d\'en ajouter un autre.';

  @override
  String get clientWorkoutHistoryEmpty => 'Pas encore d\'entraînements';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Exercice n° $n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Exercice n° $n : $exerciseName';
  }

  @override
  String get clientProfileSectionGoal => 'OBJECTIF';

  @override
  String get clientProfileSectionAnthropometry => 'ANTHROPOMÉTRIE';

  @override
  String get clientProfileSectionTrainerNotes => 'NOTES COACH';

  @override
  String get clientProfileSectionWorkoutHistory => 'HISTORIQUE DES SÉANCES';

  @override
  String get clientTrainerNotesHint => 'Blessures, particularités, plan…';

  @override
  String get trainerSessionDefaultTitle => 'Séance';

  @override
  String get durationMinutesShort => 'min';

  @override
  String get addTraining => 'AJOUTER UN ENTRAÎNEMENT';

  @override
  String get clientLabel => 'Client';

  @override
  String get deleteClientBtn => 'SUPPRIMER LE CLIENT';

  @override
  String get clientsMenu => 'CLIENTS';

  @override
  String get dateHeader => 'Date';

  @override
  String get clientHeader => 'Client';

  @override
  String get exerciseHeader => 'Exercice';

  @override
  String get typeHeader => 'Type';

  @override
  String get strengthType => 'Force';

  @override
  String get cardioType => 'Cardio';

  @override
  String get weightHeader => 'Poids';

  @override
  String get weightUnitsChoiceShort => 'kg / lb';

  @override
  String get progressChartWeightLegend => 'Poids — kg / lb (au choix)';

  @override
  String get repsHeader => 'Répétitions';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'Temps (min)';

  @override
  String get intensityHeader => 'Intensité';

  @override
  String get setHeader => 'Série';

  @override
  String get strength => 'Force';

  @override
  String get cardio => 'Cardio';

  @override
  String get timeMin => 'Temps (min)';

  @override
  String get intensity => 'Intensité';

  @override
  String get reserve => 'Réserve';

  @override
  String get sets => 'Séries';

  @override
  String get time => 'Temps';

  @override
  String get rest => 'Repos';

  @override
  String get settings => 'Paramètres';

  @override
  String get max => 'Max';

  @override
  String get totalVolume => 'Volume total';

  @override
  String get chart => 'Graphique';

  @override
  String get progress => 'Progression';

  @override
  String get dayMonday => 'Lundi';

  @override
  String get dayTuesday => 'Mardi';

  @override
  String get dayWednesday => 'Mercredi';

  @override
  String get dayThursday => 'Jeudi';

  @override
  String get dayFriday => 'Vendredi';

  @override
  String get daySaturday => 'Samedi';

  @override
  String get daySunday => 'Dimanche';

  @override
  String get greetingHi => 'Salut';

  @override
  String get greetingMorning => 'Bonjour';

  @override
  String get greetingAfternoon => 'Bon après-midi';

  @override
  String get greetingEvening => 'Bonsoir';

  @override
  String get monthJanuary => 'Janvier';

  @override
  String get monthFebruary => 'Février';

  @override
  String get monthMarch => 'Mars';

  @override
  String get monthApril => 'Avril';

  @override
  String get monthMay => 'Mai';

  @override
  String get monthJune => 'Juin';

  @override
  String get monthJuly => 'Juillet';

  @override
  String get monthAugust => 'Août';

  @override
  String get monthSeptember => 'Septembre';

  @override
  String get monthOctober => 'Octobre';

  @override
  String get monthNovember => 'Novembre';

  @override
  String get monthDecember => 'Décembre';

  @override
  String get exerciseBenchPress => 'Développé couché';

  @override
  String get exerciseSquat => 'Squat';

  @override
  String get exerciseRow => 'Rowing';

  @override
  String get exerciseDeadlift => 'Soulevé de terre';

  @override
  String get exerciseOverheadPress => 'Développé militaire';

  @override
  String get exercisePullUp => 'Traction';

  @override
  String get exerciseLunges => 'Fentes';

  @override
  String get exercisePlank => 'Gainage';

  @override
  String get saveWorkout => 'ENREGISTRER L\'ENTRAÎNEMENT';

  @override
  String get deleteWorkout => 'SUPPRIMER L\'ENTRAÎNEMENT';

  @override
  String get deleteTraining => 'Supprimer l\'entraînement';

  @override
  String get deleteTrainingQuestion =>
      'Supprimer cet entraînement du planning ?';

  @override
  String get addSetButton => 'Ajouter une série';

  @override
  String get progressButton => 'Progression';

  @override
  String get filterMonth => 'Mois';

  @override
  String get filterYear => 'Année';

  @override
  String get filterAllTime => 'Tout';

  @override
  String get noteLabel => 'Note';

  @override
  String get addClient => '+ AJOUTER UN CLIENT';

  @override
  String get workoutsToday => 'ENTRAÎNEMENTS DU JOUR';

  @override
  String get workoutNumberPrefix => 'Séance #';

  @override
  String get noEntries => 'Aucune entrée';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get instructionButton => 'GUIDE';

  @override
  String get instructionTitle => 'Fonctionnement';

  @override
  String get instructionPhilosophy =>
      'IronVibe n\'intègre pas de catalogue d\'exercices ni de programmes imposés : c\'est voulu. L\'application n\'apprend pas à s\'entraîner à votre place — YouTube et les coachs existent pour ça — elle vous aide simplement à suivre vos stats, à votre manière. Vous saisissez vous-même les noms des mouvements, comme vous les dites, plutôt que de les piocher dans une liste interminable. Plus vous l\'utilisez, plus elle devient naturelle : c\'est elle qui s\'adapte à vous.';

  @override
  String get instructionSectionSetControl => 'Contrôle des séries';

  @override
  String get instructionSetMinusLabel => 'Moins';

  @override
  String get instructionSetMinusDesc =>
      'Supprime la dernière série. Si des données sont saisies, l\'application demande confirmation.';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Ajoute une nouvelle ligne de série à l\'exercice en cours.';

  @override
  String get instructionSetProgressLabel => 'Chronologie';

  @override
  String get instructionSetProgressDesc =>
      'Ouvre la chronologie de progression pour cet exercice.';

  @override
  String get instructionSectionProgressChart => 'Graphique de progression';

  @override
  String get instructionProgressChartIntro =>
      'Deux courbes indépendantes par date : rouge — charge la plus lourde en une série ce jour-là (kg/lb) ; cyan — plus grand nombre de répétitions en une série (toute charge). À gauche la masse, à droite les répétitions.';

  @override
  String get instructionProgressLineWeightLabel => 'Poids';

  @override
  String get instructionProgressLineWeightDesc =>
      'Ligne rouge : masse maximale en une série pour chaque jour.';

  @override
  String get instructionProgressLineRepsLabel => 'Répétitions';

  @override
  String get instructionProgressLineRepsDesc =>
      'Ligne cyan : maximum de répétitions en une série ce jour (sans lien obligatoire avec la charge max).';

  @override
  String get instructionSectionWorkout => 'Entraînement';

  @override
  String get instructionAddExerciseTitle => 'Ajouter un exercice';

  @override
  String get instructionAddExerciseBody =>
      'Crée un nouveau bloc pour un autre type d\'exercice.';

  @override
  String get instructionSectionExerciseNameTools => 'Nom de l\'exercice';

  @override
  String get instructionRenameExerciseTitle => 'Appui long pour renommer';

  @override
  String get instructionRenameExerciseDesc =>
      'Appui long sur le nom pendant la saisie, sur une suggestion de la liste ou sur le titre d\'une séance enregistrée dans l\'historique — le nom est mis à jour partout.';

  @override
  String get instructionRemoveFromBankTitle => 'Retirer de la liste';

  @override
  String get instructionRemoveFromBankDesc =>
      'Quand la liste de suggestions sous le nom est ouverte, touchez la croix d\'une ligne pour retirer ce nom de votre liste personnelle (banque).';

  @override
  String get instructionSectionInputs => 'Données';

  @override
  String get instructionWeightTitle => 'Poids';

  @override
  String get instructionWeightBody => 'Charge de l\'équipement (kg/lb).';

  @override
  String get instructionRepsTitle => 'Répétitions';

  @override
  String get instructionRepsBody =>
      'Nombre de répétitions réalisées sur une série.';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody =>
      'Nombre de répétitions encore possibles avant l\'échec. Sert à suivre l\'intensité.';

  @override
  String get instructionOneRmTitle => '1RM (max sur une répétition)';

  @override
  String get instructionOneRmDesc =>
      'Charge maximale estimée pour une répétition parfaite, à partir du poids et des répétitions actuels. Indicateur clé de force pour le suivi et le choix des charges.';

  @override
  String get instructionExerciseVolumeTitle => 'Volume d\'exercice (total)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Sous les séries, à côté du bouton progression : somme poids × répétitions pour toutes les séries complètes. Se met à jour en temps réel.';

  @override
  String get instructionSectionPersonalProgress => 'Progrès personnel';

  @override
  String get instructionPersonalProgressIntro =>
      'Progrès personnel sert à suivre la progression exercice par exercice : tous les mouvements enregistrés dans l\'historique figurent dans un tableau pour comparer en un coup d\'œil. La recherche fait apparaître tout de suite le nom voulu. Accès depuis l\'écran d\'accueil d\'entraînement (bouton sous le calendrier) ou la fiche client.';

  @override
  String get instructionSectionSaving => 'Sauvegarde';

  @override
  String get instructionFinishTitle => 'Terminer';

  @override
  String get instructionFinishBody =>
      'Enregistre toute la séance dans l\'historique. Tant que vous ne validez pas, rien n\'est sauvegardé.';

  @override
  String get instructionSectionCardio => 'Cardio et intensite';

  @override
  String get instructionCardioTitle => 'Cardio';

  @override
  String get instructionCardioBody =>
      'Suit le temps et l\'intensite cardio (pas de distance). Aide a garder le rythme et suivre l\'effort.';

  @override
  String get instructionIntensityTitle => 'Intensite';

  @override
  String get instructionIntensityBody =>
      'Utilisez l\'echelle d\'effort (RPE) pour evaluer la difficulte de la seance. C\'est la cle du progres sans surentrainement.';

  @override
  String get instructionSectionStopwatch => 'Chronometre (votre assistant)';

  @override
  String get instructionStopwatchWhyTitle => 'Pourquoi l\'utiliser ?';

  @override
  String get instructionStopwatchWhyBody =>
      'Pour controler le repos entre les series. Repos court: plus de densite; repos long: plus de force pour les charges lourdes.';

  @override
  String get instructionStopwatchHowTitle => 'Comment ca marche ?';

  @override
  String get instructionStopwatchHowBody =>
      'Centre : temps, lecture/pause et reinitialisation. Gauche et droite : raccourcis (voir ci-dessous). En mode chronometre seul le temps defile avec les centiemes. Le minuteur reste en en-tete quand vous faites defiler.';

  @override
  String get instructionStopwatchIntervalsTitle => 'A gauche : intervalles';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 s de travail, 60 s de repos. 4/4 — 4 minutes de travail et 4 minutes de repos par tour. 20/10 — type tabata : 20 s d\'effort, 10 s de repos. Apres le choix, le minuteur alterne travail et repos en boucle jusqu\'a pause ou reset. Teinte rouge : travail ; bleue : repos.';

  @override
  String get instructionStopwatchRestTitle => 'A droite : repos';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m et +5m lancent ou prolongent un compte a rebours en minutes. Si une boucle d\'intervalles tournait, elle passe a ce compte a rebours. Si un compte a rebours etait deja actif, les minutes s\'ajoutent au temps restant. Pratique entre les series.';

  @override
  String get instructionStopwatchProgressTitle => 'Barre de progression';

  @override
  String get instructionStopwatchProgressBody =>
      'En compte a rebours et intervalles, une barre sous le temps indique la part restante de la phase en cours.';

  @override
  String get instructionStopwatchSoundsTitle => 'Son et vibrations';

  @override
  String get instructionStopwatchSoundsBody =>
      'À 3, 2 et 1 seconde avant la fin : court signal dans l\'app et vibration légère. Changement de phase ou fin du compte à rebours : signal plus marqué. Sons courts inclus ; pas de micro, pas d\'autorisation de notification ; le volume système s\'applique toujours.';

  @override
  String get instructionSectionNavHistory => 'Historique et donnees';

  @override
  String get instructionNavHistoryTitle => 'Historique / statistiques';

  @override
  String get instructionNavHistoryDesc =>
      'Seances terminees dans le calendrier et statistiques via l\'icone graphique dans les barres d\'outils.';

  @override
  String get instructionNavImportExportTitle => 'Import / export';

  @override
  String get instructionNavImportExportDesc =>
      'Sauvegarde ou transfert via export et import JSON dans la fenetre statistiques.';
}
