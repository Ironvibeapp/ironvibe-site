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
  String get reassignHistoryExerciseTitle => 'Changer d\'exercice';

  @override
  String get reassignHistoryExerciseBody =>
      'Seule cette séance change. Les séries restent identiques; les graphiques suivent le nouvel exercice.';

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
  String get importAthlete => 'IMPORTER UN ATHLÈTE';

  @override
  String importAthleteFound(int count) {
    return 'Enregistrements de $count séances d\'un athlète absent de la liste.';
  }

  @override
  String get importAthleteBackupOwn => 'SAUVEGARDER MES DONNÉES D\'ABORD';

  @override
  String get importAthleteDecline => 'Ne pas ajouter';

  @override
  String get importAthleteSuccess => 'Athlète ajouté';

  @override
  String get importAthleteNotAthleteFile =>
      'Ce fichier n\'est pas un historique d\'entraînements d\'athlète.';

  @override
  String get importAthleteEmpty => 'Aucune séance trouvée dans ce fichier.';

  @override
  String get importAthleteAlreadyImported =>
      'Ces séances sont déjà sur cet appareil.';

  @override
  String get importAthleteUseDedicatedButton =>
      'Cela ressemble à l\'historique d\'un athlète. Utilisez Importer un athlète.';

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
  String get addSet => 'AJOUTER SÉRIE';

  @override
  String get addExercise => 'AJOUTER EXERCICE';

  @override
  String get finishWorkout => 'TERMINER L\'ENTRAÎNEMENT';

  @override
  String get finishWorkoutConfirmTitle => 'Terminer l\'entraînement ?';

  @override
  String get finishWorkoutConfirmBody => 'L\'entraînement sera enregistré.';

  @override
  String get finishWorkoutConfirmAction => 'Terminer';

  @override
  String get workoutCompleteTitle => 'Entraînement enregistré';

  @override
  String get planChangesSavedTitle => 'Modifications enregistrées';

  @override
  String get startWorkout => 'DÉMARRER L\'ENTRAÎNEMENT';

  @override
  String get quickWorkout => 'SÉANCE RAPIDE';

  @override
  String get quickWorkoutFullBody => 'FULL BODY';

  @override
  String get quickWorkoutInsufficientTitle => 'Pas assez de données';

  @override
  String get quickWorkoutInsufficientBody =>
      'Une séance rapide nécessite des exercices pour pectoraux, dos, un groupe de jambes (cuisse avant ou arrière) et un pour épaules, bras ou gainage. Marquez-les dans Progrès personnel — ou continuez à noter : l\'app demandera à la saisie d\'un nouvel exercice.';

  @override
  String get quickWorkoutOpenProgress => 'OUVRIR LE PROGRÈS PERSONNEL';

  @override
  String get quickWorkoutPreviewTitle => 'SÉANCE RAPIDE · FULL BODY';

  @override
  String get quickWorkoutStart => 'DÉMARRER';

  @override
  String get quickWorkoutSwap => 'Remplacer';

  @override
  String get quickWorkoutNoAlternatives =>
      'Aucun autre exercice dans ce groupe';

  @override
  String get muscleGroupPromptTitle => 'Groupe musculaire';

  @override
  String get muscleGroupPromptBody =>
      'Sert à composer une séance full body rapide.';

  @override
  String get muscleGroupLater => 'Plus tard';

  @override
  String get muscleGroupClear => 'Effacer';

  @override
  String get muscleGroupSkip => 'Pas pour la séance rapide';

  @override
  String get muscleGroupChest => 'Pectoraux';

  @override
  String get muscleGroupBack => 'Dos';

  @override
  String get muscleGroupShoulders => 'Épaules';

  @override
  String get muscleGroupCore => 'Gainage';

  @override
  String get muscleGroupQuads => 'Cuisse avant';

  @override
  String get muscleGroupHamstrings => 'Cuisse arrière';

  @override
  String get muscleGroupArmFlex => 'Flexion des bras';

  @override
  String get muscleGroupArmExt => 'Extension des bras';

  @override
  String get muscleGroupUntagged => '—';

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
  String get favoriteExercises => 'EXERCICES FAVORIS';

  @override
  String get favoriteExercisesEmpty => 'Aucun exercice favori pour l\'instant';

  @override
  String get buildWorkoutFromFavorites => 'COMPOSER L\'ENTRAÎNEMENT';

  @override
  String get exerciseHint => 'Saisir le nom de l\'exercice';

  @override
  String get deleteFromHistory => 'Retirer de l\'historique ?';

  @override
  String get deleteExerciseHint =>
      'n\'apparaîtra plus dans les suggestions ni dans le progrès personnel.';

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
  String get removeExerciseFromWorkout => 'Retirer l\'exercice';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'Retirer cet exercice de l\'entraînement ? Cette action est irréversible.';

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
  String get clientNameCannotChange => 'Le nom ne pourra plus être modifié.';

  @override
  String get clientNameTaken =>
      'Ce nom est déjà utilisé. Choisissez-en un autre.';

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
  String get workoutRecoveryTitle => 'Entraînement interrompu';

  @override
  String get workoutRecoveryMessage =>
      'Votre entraînement précédent s\'est terminé de façon inattendue. Reprenez où vous vous êtes arrêté ou supprimez les données non enregistrées.';

  @override
  String get workoutRecoveryContinue => 'Continuer l\'entraînement';

  @override
  String get workoutRecoveryDelete => 'Supprimer l\'entraînement';

  @override
  String get workoutRecoverySessionMissing =>
      'L\'entraînement client planifié a été supprimé. Le brouillon a été effacé.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Terminez l\'exercice en cours avant d\'en ajouter un autre.';

  @override
  String get switchWorkoutTypeTitle => 'Changer le type d\'entraînement ?';

  @override
  String get switchWorkoutTypeBody =>
      'Les séries de l\'autre type ne seront pas enregistrées avec cette séance.';

  @override
  String get switchWorkoutTypeConfirm => 'Changer';

  @override
  String get saveWorkoutNothingToSave =>
      'Rien à enregistrer pour l\'instant. Ajoutez poids et répétitions, ou une durée de cardio.';

  @override
  String get importedHistoryBadge => 'Importé';

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
  String exerciseNumberLabel(int n) {
    return 'n° $n';
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
  String get repeatLastWorkout => 'Répéter la dernière séance';

  @override
  String get repeatLastUnavailable =>
      'Ce client n\'a pas encore de séance à répéter.';

  @override
  String get editPlan => 'Modifier le plan';

  @override
  String get trainerSessionEmpty => 'Pas encore planifiée';

  @override
  String trainerSessionPlanned(int n) {
    return '$n planifiés';
  }

  @override
  String get trainerClientsEmpty =>
      'Pas encore de clients. Ajoutez quelqu\'un pour planifier.';

  @override
  String get clientNeverTrained => 'Pas encore de séances';

  @override
  String get clientNoUpcoming => 'Pas de séance à venir';

  @override
  String clientLastSession(String when) {
    return 'Dernière : $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Prochaine : $when';
  }

  @override
  String get clientSessionToday => 'aujourd\'hui';

  @override
  String get clientSessionYesterday => 'hier';

  @override
  String get clientSessionTomorrow => 'demain';

  @override
  String clientSessionDaysAgo(int n) {
    return 'il y a $n j';
  }

  @override
  String clientSessionInDays(int n) {
    return 'dans $n j';
  }

  @override
  String get clientProfileDetails => 'Profil';

  @override
  String get addSessionPickClient => 'Choisir un client';

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
  String get progressChartVolumeLegend => 'Volume (tonnage)';

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
  String get addClient => 'AJOUTER UN CLIENT';

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
  String get instructionTitle => 'Comment tout est organisé';

  @override
  String get instructionHubManifest =>
      'Pas de catalogue d\'exercices ni de programmes tout faits. Vous nommez les mouvements avec vos mots — l\'app tient les stats dessus.';

  @override
  String get instructionSearchHint => 'Rechercher dans le guide';

  @override
  String get instructionSearchEmpty => 'Aucun résultat.';

  @override
  String get instructionChapterStartTitle => 'Par où commencer';

  @override
  String get instructionChapterStartBlurb =>
      'Écran d\'accueil, les deux modes et la logique de l\'app.';

  @override
  String get instructionChapterSessionTitle => 'En séance';

  @override
  String get instructionChapterSessionBlurb =>
      'Séries, charge, répétitions, RIR, cardio et fin de séance.';

  @override
  String get instructionChapterTimerTitle => 'Chronomètre';

  @override
  String get instructionChapterTimerBlurb =>
      'Intervalles, repos entre les séries et signaux.';

  @override
  String get instructionChapterExercisesTitle => 'Exercices et groupes';

  @override
  String get instructionChapterExercisesBlurb =>
      'Votre liste de mouvements, groupes musculaires, favoris et séance rapide.';

  @override
  String get instructionChapterProgressTitle => 'Progrès et records';

  @override
  String get instructionChapterProgressBlurb =>
      'Progrès personnel, 1RM, tonnage et graphique d\'exercice.';

  @override
  String get instructionChapterRhythmTitle => 'Rythme et récupération';

  @override
  String get instructionChapterRhythmBlurb =>
      'La jauge de rythme hebdomadaire et la semaine de décharge.';

  @override
  String get instructionChapterDataTitle => 'Historique et données';

  @override
  String get instructionChapterDataBlurb =>
      'Calendrier, modification des séances, statistiques et sauvegarde.';

  @override
  String get instructionChapterCoachTitle => 'Mode coach';

  @override
  String get instructionChapterCoachBlurb =>
      'Clients, planning, plan de séance et impression.';

  @override
  String get instructionPhilosophy =>
      'IronVibe n\'apprend pas à s\'entraîner et ne livre pas de programmes tout faits — c\'est le rôle d\'un coach et de votre expérience. Il n\'y a pas de catalogue de milliers d\'exercices : vous saisissez les noms dans vos mots, et l\'app compte proprement les chiffres. Tout reste sur l\'appareil : pas de compte, pas d\'abonnement, pas de pub.';

  @override
  String get instructionSectionHome => 'Accueil';

  @override
  String get instructionThemeTitle => 'Thème';

  @override
  String get instructionThemeDesc =>
      'Le commutateur soleil — lune bascule le clair et le sombre. Le choix est mémorisé.';

  @override
  String get instructionTrainSelfTitle => 'Je m\'entraîne';

  @override
  String get instructionTrainSelfDesc =>
      'Votre espace : séances, calendrier, progrès personnel, favoris et jauge de rythme.';

  @override
  String get instructionTrainOthersTitle => 'J\'entraîne d\'autres';

  @override
  String get instructionTrainOthersDesc =>
      'Mode coach : clients, planning et un historique séparé par personne. Ça ne se mélange pas à vos propres séances.';

  @override
  String get instructionLanguageTitle => 'Langue';

  @override
  String get instructionLanguageDesc =>
      'L\'app suit la langue du système — il n\'y a pas de réglage à part. Dix langues sont prises en charge.';

  @override
  String get instructionHomeLinksTitle => 'Version et contact';

  @override
  String get instructionHomeLinksDesc =>
      'En bas de l\'écran d\'accueil : numéro de version, site, Telegram, e-mail du support et politique de confidentialité.';

  @override
  String get instructionSectionAthleteMenu => 'Vos entraînements';

  @override
  String get instructionStartWorkoutTitle => 'Démarrer l\'entraînement';

  @override
  String get instructionStartWorkoutDesc =>
      'Ouvre une séance vide — la précédente n\'est pas copiée. Ajoutez des exercices, notez les séries, puis terminez pour enregistrer.';

  @override
  String get instructionQuickWorkoutTitle => 'Séance rapide';

  @override
  String get instructionQuickWorkoutDesc =>
      'Compose un full body de quatre exercices à partir de vos étiquettes de groupes musculaires.';

  @override
  String get instructionCalendarMenuTitle => 'Calendrier d\'entraînements';

  @override
  String get instructionCalendarMenuDesc =>
      'Les jours où vous vous êtes entraîné. D\'ici s\'ouvrent les séances enregistrées et s\'ajoutent celles oubliées.';

  @override
  String get instructionSectionPersonalProgress => 'Progrès personnel';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tableau des meilleures séries, du 1RM estimé et du volume max pour chaque mouvement.';

  @override
  String get instructionFavoritesMenuTitle => 'Exercices favoris';

  @override
  String get instructionFavoritesMenuDesc =>
      'Les mouvements marqués d\'une étoile. On en compose une séance en deux taps.';

  @override
  String get instructionSectionWorkout => 'Séance';

  @override
  String get instructionStrengthCardioTitle => 'Force ou cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Le commutateur en haut de séance fixe le type. Force : charge, répétitions et RIR. Cardio : temps et intensité. Si des données de l\'autre type sont déjà là, l\'app redemande.';

  @override
  String get instructionAddExerciseTitle => 'Ajouter un exercice';

  @override
  String get instructionAddExerciseBody =>
      'Un nouveau bloc s\'ajoute quand l\'exercice en cours a un nom et au moins une série remplie.';

  @override
  String get instructionPreviousHintsTitle => 'Indices gris';

  @override
  String get instructionPreviousHintsDesc =>
      'Charge et répétitions de la dernière fois s\'affichent en gris — un palier à battre, pas une série déjà notée. Seuls les chiffres que vous tapez vont dans l\'historique.';

  @override
  String get instructionRemoveExerciseTitle => 'Retirer l\'exercice';

  @override
  String get instructionRemoveExerciseDesc =>
      'La croix rouge enlève le bloc de la séance en cours. L\'historique enregistré ne change pas.';

  @override
  String get instructionSectionSetControl => 'Ligne de série';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Ajoute une ligne vide pour la série suivante.';

  @override
  String get instructionSetMinusLabel => 'Moins';

  @override
  String get instructionSetMinusDesc =>
      'Retire la dernière série. Une ligne vide part tout de suite, une ligne remplie après confirmation. S\'il n\'en reste qu\'une, les champs sont simplement vidés.';

  @override
  String get instructionSetProgressLabel => 'Graphique de l\'exercice';

  @override
  String get instructionSetProgressDesc =>
      'Ouvre l\'évolution de ce mouvement sur un mois, un an ou tout le temps.';

  @override
  String get instructionExerciseVolumeTitle => 'Tonnage de l\'exercice';

  @override
  String get instructionExerciseVolumeDesc =>
      'À droite du bouton graphique : somme « charge × répétitions » sur toutes les séries remplies. Recalculé à la volée.';

  @override
  String get instructionSectionInputs => 'Ce que veulent dire les champs';

  @override
  String get instructionWeightTitle => 'Charge';

  @override
  String get instructionWeightBody =>
      'La charge de travail. Kilogrammes ou livres — l\'app ne convertit pas et n\'impose rien.';

  @override
  String get instructionRepsTitle => 'Répétitions';

  @override
  String get instructionRepsBody =>
      'Combien de fois le mouvement a été fait dans la série.';

  @override
  String get instructionRirTitle => 'RIR — répétitions en réserve';

  @override
  String get instructionRirBody =>
      'Combien de répétitions vous auriez encore pu faire. 0, c\'est le travail à l\'échec ; ∞, une série d\'échauffement. Une façon simple de doser l\'intensité.';

  @override
  String get instructionOneRmTitle => '1RM — maximum sur une répétition';

  @override
  String get instructionOneRmDesc =>
      'Estimation de la charge sur une répétition selon la formule d\'Epley, d\'après la charge et les répétitions de la série. Affiché sous la ligne — un repère clé de force.';

  @override
  String get instructionSectionCardio => 'Cardio';

  @override
  String get instructionCardioTitle => 'Temps';

  @override
  String get instructionCardioBody =>
      'Durée du bloc en minutes. Pas de distance ni de pouls : l\'app n\'est liée à aucun tracker.';

  @override
  String get instructionIntensityTitle => 'Intensité';

  @override
  String get instructionIntensityBody =>
      'Effort de 1 à 5 — une échelle RPE simplifiée. En séance cardio, une seule ligne est enregistrée par exercice.';

  @override
  String get instructionSectionSaving => 'Fin de séance';

  @override
  String get instructionFinishTitle => 'Terminer l\'entraînement';

  @override
  String get instructionFinishBody =>
      'Le bouton en bas de séance : l\'app confirme, puis écrit l\'entraînement dans l\'historique. Il faut au moins une série remplie.';

  @override
  String get instructionLeaveWorkoutTitle => 'Partir plus tôt';

  @override
  String get instructionLeaveWorkoutDesc =>
      'Si vous fermez une séance déjà commencée, vous pouvez rester, enregistrer ce qui est noté ou supprimer le brouillon.';

  @override
  String get instructionAutoSaveTitle => 'Séance interrompue';

  @override
  String get instructionAutoSaveDesc =>
      'Un brouillon se sauve tout seul — toutes les minutes et quand l\'app passe en arrière-plan. Au prochain lancement, vous pourrez reprendre au même endroit ou le supprimer.';

  @override
  String get instructionScreenAwakeTitle => 'L\'écran reste allumé';

  @override
  String get instructionScreenAwakeDesc =>
      'Pendant une séance en cours, l\'écran ne s\'éteint pas, pour ne pas déverrouiller le téléphone après chaque série.';

  @override
  String get instructionStopwatchWhyTitle => 'Pourquoi chronométrer le repos';

  @override
  String get instructionStopwatchWhyBody =>
      'La pause entre les séries est un paramètre de travail, comme la charge et les répétitions : un repos court densifie, un repos long laisse tout donner sur une série lourde.';

  @override
  String get instructionStopwatchHowTitle => 'Départ, pause, raz';

  @override
  String get instructionStopwatchHowBody =>
      'Le chrono est épinglé dans l\'en-tête de séance et reste visible en défilant. Au centre, le temps et les commandes ; en mode normal, ça compte vers le haut, au centième de seconde.';

  @override
  String get instructionStopwatchIntervalsTitle => 'À gauche : intervalles';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — une minute de travail, une minute de repos. 4/4 — quatre minutes chacun. 20/10 — Tabata. Les phases tournent en boucle jusqu\'à pause ou raz : teinte rouge = travail, bleue = repos.';

  @override
  String get instructionStopwatchRestTitle => 'À droite : repos';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m et +5m lancent le compte à rebours entre les séries. S\'il tourne déjà, les minutes s\'ajoutent au reste ; une boucle d\'intervalles bascule sur le repos.';

  @override
  String get instructionStopwatchProgressTitle => 'Barre de phase';

  @override
  String get instructionStopwatchProgressBody =>
      'En compte à rebours et en intervalles, sous les chiffres on voit ce qu\'il reste de la phase en cours.';

  @override
  String get instructionStopwatchSoundsTitle => 'Son et vibration';

  @override
  String get instructionStopwatchSoundsBody =>
      'Trois, deux et une seconde avant la fin de phase — un clic court et une vibration légère ; au changement de phase, le signal est plus net. Les sons sont dans l\'app : pas de micro, pas de permission de notifications. Le volume suit les réglages du téléphone.';

  @override
  String get instructionExerciseBankIntro =>
      'La liste d\'exercices grandit toute seule : chaque nouveau nom d\'une séance terminée rejoint les suggestions. Les noms sont en majuscules, pour qu\'un même mouvement ne se dédouble pas.';

  @override
  String get instructionSectionExerciseNameTools => 'Noms';

  @override
  String get instructionRenameExerciseTitle => 'Renommer partout';

  @override
  String get instructionRenameExerciseDesc =>
      'Appui long sur le nom — en séance, dans la liste de suggestions ou dans un entraînement enregistré. Le nom se met à jour dans tout l\'historique et sur les graphiques.';

  @override
  String get instructionRemoveFromBankTitle => 'Retirer des suggestions';

  @override
  String get instructionRemoveFromBankDesc =>
      'La croix dans la liste de suggestions ouverte, ou la croix rouge du progrès personnel, enlève le nom des suggestions et du tableau. Les entraînements enregistrés restent intacts.';

  @override
  String get instructionReassignExerciseTitle => 'Remplacer dans l\'entrée';

  @override
  String get instructionReassignExerciseDesc =>
      'Dans un entraînement enregistré, on peut réassigner un bloc à un autre mouvement. Les séries restent, mais passent dans les stats du nouveau nom — seule cette séance change.';

  @override
  String get instructionSectionMuscleGroups => 'Groupes musculaires';

  @override
  String get instructionMuscleGroupsIntro =>
      'Le groupe est une étiquette facultative sur votre nom. Il ne sert qu\'à la séance rapide, pour composer un full body équilibré. Huit groupes : pectoraux, dos, épaules, gainage, cuisse avant, cuisse arrière, flexion des bras, extension des bras.';

  @override
  String get instructionMuscleGroupTagTitle => 'Comment étiqueter';

  @override
  String get instructionMuscleGroupTagDesc =>
      'À la première saisie d\'un nouveau nom, l\'app demande le groupe. Vous pouvez répondre Plus tard, ou Pas pour la séance rapide si le mouvement ne doit pas entrer dans le mix. L\'étiquette sous le nom dans le progrès personnel et les favoris se change ou se retire facilement.';

  @override
  String get instructionSectionFavorites => 'Favoris';

  @override
  String get instructionFavoriteStarTitle => 'Étoile';

  @override
  String get instructionFavoriteStarDesc =>
      'L\'étoile est sur la carte d\'exercice en séance et dans le tableau du progrès personnel. Les favoris restent en haut de la liste.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Composer l\'entraînement';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'Sur l\'écran des favoris, cochez les mouvements voulus — le bouton apparaît tout de suite. La séance s\'ouvre dans cet ordre, avec les indices gris de la dernière fois. Pour un client, la même action ouvre sa séance.';

  @override
  String get instructionSectionQuickWorkout => 'Séance rapide';

  @override
  String get instructionQuickWorkoutHowTitle => 'Quatre emplacements';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Pectoraux, dos, une moitié des jambes (cuisse avant ou arrière — jamais les deux le même jour) et un mouvement pour épaules, bras ou gainage. À chaque emplacement, l\'app prend le groupe le plus longtemps inactif, et privilégie un favori.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Aperçu et échange';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'Avant de partir, toute la composition est visible : chaque emplacement peut être échangé contre un autre exercice du même groupe. S\'il manque de mouvements étiquetés, l\'app le dit et ouvre le progrès personnel pour poser les étiquettes.';

  @override
  String get instructionPersonalProgressIntro =>
      'Un seul tableau de tous les mouvements issus des entraînements enregistrés. Favoris en haut, le reste par ordre alphabétique ; la recherche trouve le nom. S\'ouvre depuis le menu d\'entraînement ou le profil client.';

  @override
  String get instructionProgressBestSetTitle => 'Meilleure série';

  @override
  String get instructionProgressBestSetDesc =>
      'La série au 1RM estimé le plus élevé sur tout l\'historique. Pour les mouvements sans charge, c\'est la série au plus grand nombre de répétitions.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Volume maximal';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'Le plus gros tonnage de cet exercice sur un seul entraînement — un bon ancrage pour planifier le volume de travail.';

  @override
  String get instructionSectionProgressChart => 'Graphique de l\'exercice';

  @override
  String get instructionProgressChartIntro =>
      'Trois courbes indépendantes par dates. À gauche l\'échelle de charge, à droite celle des répétitions ; la ligne jaune est normalisée pour comparer les tendances à la forme. La période bascule — mois, année, tout le temps — et un tap sur un point montre les chiffres du jour. Le cardio n\'entre pas dans le graphique.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Rouge — charge la plus élevée sur une série ce jour-là.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Cyan — plus grand nombre de répétitions sur une série, pas forcément avec la charge max.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Jaune — tonnage du jour : somme « charge × répétitions » sur les séries où les deux champs sont remplis.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Pendant une séance en direct, le bouton graphique s\'allume quand vous battez un record : rouge pour la charge de série, jaune pour le tonnage de l\'exercice, cyan pour la somme de répétitions sur les mouvements sans charge. Si plusieurs s\'appliquent, priorité au rouge, puis jaune, puis cyan. Pas de surbrillance dans l\'historique enregistré.';

  @override
  String get instructionRhythmIntro =>
      'Quand au moins trois jours de force s\'accumulent sur les quatre dernières semaines, une jauge de rythme apparaît en haut de l\'écran d\'entraînement. Ce n\'est ni un objectif ni une note — juste la fréquence à laquelle vous allez actuellement à la salle.';

  @override
  String get instructionRhythmGaugeTitle => 'Jours par semaine';

  @override
  String get instructionRhythmGaugeDesc =>
      'L\'arc se remplit de un à six jours — la moyenne sur quatre semaines. Les jours avec du travail de force comptent, les jours cardio seuls non. Plus le rythme est dense, plus la couleur glisse de l\'acier à l\'or puis à la rouille.';

  @override
  String get instructionRhythmInsightTitle => 'Lecture du rythme';

  @override
  String get instructionRhythmInsightDesc =>
      'Touchez la jauge : l\'app nomme votre mode — rythme calme, régulier, dense, ou presque sans jour de repos — et explique ce que ça veut dire pour la récupération. Chez un client du coach, c\'est la même lecture.';

  @override
  String get instructionRhythmDeloadTitle => 'Semaine de décharge';

  @override
  String get instructionRhythmDeloadDesc =>
      'La décharge n\'est pas une pause, c\'est une semaine à mi-puissance : charges de travail et nombre de séries en baisse de 30–50 %, ou cardio seulement. Le muscle récupère plus vite que ligaments, tendons et articulations — cette semaine leur laisse le temps de rattraper.';

  @override
  String get instructionRhythmNudgeTitle => 'Rappel';

  @override
  String get instructionRhythmNudgeDesc =>
      'Si vous tenez au moins deux séances et demie par semaine et que vous n\'avez pas déchargé depuis longtemps, l\'app propose de prendre une telle semaine. Plus le rythme est dense, plus l\'indice arrive tôt. Il apparaît au plus une fois par semaine, et seulement en mode personnel — une recommandation, pas un avis médical.';

  @override
  String get instructionSectionCalendar => 'Calendrier et historique';

  @override
  String get instructionCalendarBrowseTitle => 'Comment feuilleter';

  @override
  String get instructionCalendarBrowseDesc =>
      'Les mois se glissent au doigt ; un tap sur le nom du mois ouvre le choix rapide de date. Un point sous le chiffre signifie qu\'il y a eu un entraînement ce jour-là.';

  @override
  String get instructionCalendarAddTitle => 'Saisie rétroactive';

  @override
  String get instructionCalendarAddDesc =>
      'Choisissez un jour, l\'heure, et ajoutez un entraînement — y compris une date déjà passée. Pratique si la séance n\'a pas été notée.';

  @override
  String get instructionNavHistoryTitle => 'Tonnage de la séance';

  @override
  String get instructionNavHistoryDesc =>
      'Chaque séance enregistrée affiche le tonnage total. Le volume est l\'un des meilleurs repères d\'hypertrophie : ce qui compte n\'est pas le record d\'un jour, c\'est sa tenue d\'une semaine à l\'autre.';

  @override
  String get instructionHistoryEditTitle => 'Modifier les séances';

  @override
  String get instructionHistoryEditDesc =>
      'Un entraînement enregistré se déplie et se corrige : ajouter un exercice ou une série, changer les chiffres, supprimer toute la séance. Les changements s\'enregistrent tout de suite.';

  @override
  String get instructionSectionStats => 'Statistiques';

  @override
  String get instructionStatsTitle => 'Bilan des séances';

  @override
  String get instructionStatsDesc =>
      'L\'icône graphique dans l\'en-tête de l\'écran d\'entraînement ou coach : combien de séances ce mois, cette année et depuis le début. En mode coach, aussi le détail par client.';

  @override
  String get instructionSectionBackup => 'Sauvegarde';

  @override
  String get instructionNavImportExportTitle => 'Export et import';

  @override
  String get instructionNavImportExportDesc =>
      'L\'export rassemble dans un fichier JSON l\'historique, la liste d\'exercices, les favoris, les étiquettes de groupes, les clients et le planning. L\'import fusionne le fichier aux données actuelles et saute les doublons — rien n\'est écrasé. La copie coach est séparée de la copie personnelle.';

  @override
  String get instructionBackupNudgeTitle => 'Rappel de copie';

  @override
  String get instructionBackupNudgeDesc =>
      'Les données vivent seulement sur cet appareil : pas de compte, pas de cloud. Toutes les quatre semaines, l\'app propose d\'enregistrer une copie — si le téléphone est perdu, l\'historique ne revient que depuis ce fichier.';

  @override
  String get instructionTrainerIntro =>
      '« J\'entraîne d\'autres » est un espace à part pour travailler avec des gens : clients, planning et un historique par personne. Séances personnelles et données coach ne se croisent pas.';

  @override
  String get instructionClientsTitle => 'Clients';

  @override
  String get instructionClientsDesc =>
      'Liste avec l\'objectif, la dernière et la prochaine séance. Sur la fiche : objectif, poids, taille et notes privées du coach. Le nom est fixé à la création et ne change plus.';

  @override
  String get instructionClientProfileTitle => 'Profil client';

  @override
  String get instructionClientProfileDesc =>
      'La séance du jour part d\'ici, ainsi que le progrès, les favoris et l\'historique par mois. S\'il y a assez de jours de force, la jauge de rythme est là aussi. Supprimer un client retire les séances futures ; les entraînements passés restent pour le suivi.';

  @override
  String get instructionTrainerScheduleTitle => 'Planning';

  @override
  String get instructionTrainerScheduleDesc =>
      'Le calendrier coach montre les séances de tous les clients : icône lecture = planifiée, coche = terminée, sablier = celle d\'aujourd\'hui en cours. Les plans vides des jours passés se retirent tout seuls.';

  @override
  String get instructionTrainerPlanTitle => 'Plan de séance';

  @override
  String get instructionTrainerPlanDesc =>
      'Pour une date future, exercices et note se préparent à l\'avance et s\'enregistrent sans terminer l\'entraînement. Charge et répétitions de la dernière fois arrivent en indices gris. Seules les séances terminées vont dans l\'historique.';

  @override
  String get instructionTrainerRepeatTitle => 'Répéter la dernière';

  @override
  String get instructionTrainerRepeatDesc =>
      'Depuis le profil client, ou via l\'interrupteur à l\'ajout d\'une séance au calendrier. On copie la composition d\'exercices ; charge et répétitions viennent en indices gris, pas en séries toutes faites.';

  @override
  String get instructionPrintSessionTitle => 'Imprimer la séance';

  @override
  String get instructionPrintSessionDesc =>
      'Sur un entraînement terminé, l\'icône d\'impression en en-tête compose une feuille A4 avec le déroulé et les chiffres du jour. Puis la feuille système : imprimante, PDF ou envoi au client.';

  @override
  String get instructionImportAthleteTitle =>
      'Importer l\'historique d\'un athlète';

  @override
  String get instructionImportAthleteDesc =>
      'Bouton dédié dans les statistiques coach : un fichier du mode personnel devient un nouveau client, avec favoris et étiquettes de groupes. Les entraînements transférés sont marqués importés, et les noms d\'exercices ne se mélangent pas aux vôtres.';

  @override
  String get printSession => 'Imprimer';

  @override
  String get printSessionEmpty =>
      'Rien à imprimer pour l\'instant. Notez au moins une série.';

  @override
  String get printSessionShareText => 'Séance IronVibe';

  @override
  String get rhythmPerWeek => 'par semaine';

  @override
  String get deloadNudgeTitle => 'Une semaine de récupération active ?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Vous vous entraînez environ $rate jours par semaine depuis à peu près $weeks semaines. Bon moment pour une semaine de récupération active : charges et séries en baisse de 30–50 %, ou cardio seulement. C\'est une recommandation, pas un avis médical.';
  }

  @override
  String get deloadNudgeLater => 'Pas maintenant';

  @override
  String get deloadNudgeOk => 'Compris';

  @override
  String get backupNudgeTitle => 'Sauvegarder une copie ?';

  @override
  String get backupNudgeBody =>
      'Vos données restent uniquement sur cet appareil. En cas de perte ou de panne, l\'historique disparaît. Partagez une copie maintenant, ou reportez de 28 jours.';

  @override
  String get backupNudgeShare => 'Partager';

  @override
  String get backupNudgeLater => 'Plus tard';

  @override
  String get rhythmInsightTitle => 'Rythme d\'entraînement';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'Vous vous entraînez en moyenne environ $rate fois par semaine.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name s\'entraîne en moyenne environ $rate fois par semaine.';
  }

  @override
  String get rhythmInsightBandLight => 'Rythme calme';

  @override
  String get rhythmInsightBandSteady => 'Rythme régulier';

  @override
  String get rhythmInsightBandDense => 'Rythme dense';

  @override
  String get rhythmInsightBandVeryDense => 'Presque sans jour de repos';

  @override
  String get rhythmInsightHowTitle => 'D\'où vient ce chiffre';

  @override
  String get rhythmInsightWindow =>
      'Moyenne des quatre dernières semaines. Les jours avec du travail de force comptent ; les jours cardio seuls, non. Ce n\'est ni un objectif ni une note — juste votre rythme actuel.';

  @override
  String get rhythmInsightWhatTitle => 'Semaine de récupération active';

  @override
  String get rhythmInsightWhatBody =>
      'Ce n\'est pas une pause, c\'est une semaine à mi-puissance : charges de travail et nombre de séries en baisse de 30–50 %. Vous pouvez aussi laisser la force et garder le cardio ou une autre activité. Le muscle récupère plus vite que les articulations, ligaments et tendons — cette semaine leur laisse le temps de rattraper.';

  @override
  String get rhythmInsightPaceTitle => 'Ce que ça veut dire';

  @override
  String get rhythmInsightAdviceLight =>
      'Il y a assez de jours libres entre les séances, la fatigue ne s\'accumule pas. Pas besoin de planifier une récupération active pour l\'instant : à ce rythme, le corps récupère tout seul.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Un rythme régulier sur lequel on peut travailler des années. Si les séances sont dures, prenez une semaine de récupération active tous les quelques mois — mieux tôt que quand les charges stagnent.';

  @override
  String get rhythmInsightAdviceDense =>
      'Les séances s\'enchaînent, et la fatigue s\'accumule sans bruit. Une semaine de récupération active tous les deux ou trois mois tient souvent mieux le progrès qu\'un enchaînement sans pause.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Presque chaque jour sous charge. Ça peut marcher si le sommeil et l\'alimentation suivent. À ce rythme, une semaine de récupération active environ une fois par mois, c\'est de la prévention ordinaire pour les articulations et les ligaments, pas une fuite.';

  @override
  String get rhythmInsightPraiseSteady =>
      'C\'est le rythme que les gens tiennent des années.';

  @override
  String get rhythmInsightPraiseDense =>
      'Vous vous entraînez souvent — un tel calendrier ne se fait pas tout seul.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'On dirait que vous avez trouvé le mode secret de l\'organisme.';

  @override
  String get rhythmInsightRecentLighter =>
      'La charge a déjà baissé récemment — la récupération active peut compter comme faite. Reprenez le rythme.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Ce rythme tient déjà depuis $weeks semaines.',
      one: 'Ce rythme tient déjà depuis $weeks semaine.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'C\'est une recommandation, pas un avis médical. Si vous vous sentez bien, rien n\'est à changer.';
}
