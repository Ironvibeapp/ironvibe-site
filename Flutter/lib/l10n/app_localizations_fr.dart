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
  String get instructionTitle => 'Fonctionnement';

  @override
  String get instructionPhilosophy =>
      'IronVibe n\'intègre pas de catalogue d\'exercices ni de programmes imposés : c\'est voulu. L\'application n\'apprend pas à s\'entraîner à votre place — YouTube et les coachs existent pour ça — elle vous aide simplement à suivre vos stats, à votre manière. Vous saisissez vous-même les noms des mouvements. Vous pouvez aussi marquer un groupe musculaire pour qu\'elle assemble une séance rapide full body à partir de votre propre liste. Plus vous l\'utilisez, plus elle devient naturelle : c\'est elle qui s\'adapte à vous.';

  @override
  String get instructionSectionSetControl => 'Contrôle des séries';

  @override
  String get instructionSetMinusLabel => 'Moins';

  @override
  String get instructionSetMinusDesc =>
      'Supprime la dernière série. Si la ligne contient déjà un poids, des répétitions ou un RIR, l\'application demande confirmation. Une ligne vide est retirée tout de suite. S\'il ne reste qu\'une série : à l\'entraînement en cours, la ligne est vidée ; dans l\'historique enregistré, tout l\'exercice est supprimé.';

  @override
  String get instructionSetPlusLabel => 'Plus';

  @override
  String get instructionSetPlusDesc =>
      'Ajoute une nouvelle ligne de série vide à cet exercice.';

  @override
  String get instructionSetProgressLabel => 'Chronologie';

  @override
  String get instructionSetProgressDesc =>
      'Ouvre la chronologie de progression pour cet exercice.';

  @override
  String get instructionSectionProgressChart => 'Graphique de progression';

  @override
  String get instructionProgressChartIntro =>
      'Trois courbes indépendantes par date : rouge — charge la plus lourde en une série ce jour-là ; cyan — plus grand nombre de répétitions en une série ; jaune — volume de l\'exercice (somme poids × répétitions sur la journée). Axe gauche : poids ; axe droit : répétitions ; la courbe jaune est normalisée.';

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
  String get instructionProgressLineVolumeDesc =>
      'Ligne jaune : volume quotidien (tonnage), calculé comme la somme poids × répétitions pour les séries où les deux valeurs sont saisies.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Pendant une seance en cours le bouton du graphique sous les series peut prendre les memes teintes que les courbes : rouge si vous depassez votre meilleur poids sur une serie ; jaune si le volume total de l\'exercice bat votre record anterieur ; cyan si l\'exercice est sans charge et que la somme des repetitions sur toutes les series depasse votre maximum passe. Si plusieurs cas s\'appliquent, priorite rouge, puis jaune, puis cyan. Visible seulement pendant la saisie de la seance en cours, pas dans l\'historique enregistre.';

  @override
  String get instructionSectionWorkout => 'Entraînement';

  @override
  String get instructionAddExerciseTitle => 'Ajouter un exercice';

  @override
  String get instructionAddExerciseBody =>
      'Ajoute un nouveau bloc. Nommez d\'abord l\'exercice en cours — l\'app vous le rappelle si le champ est encore vide.';

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
      'Quand la liste de suggestions sous le nom est ouverte, touchez la croix d\'une ligne — ou la croix rouge dans Progrès personnel — pour retirer ce nom des suggestions et du tableau de progrès. Les séances enregistrées restent inchangées.';

  @override
  String get instructionSectionInputs => 'Données';

  @override
  String get instructionWeightTitle => 'Poids';

  @override
  String get instructionWeightBody =>
      'Charge de l\'équipement. Saisissez le nombre en kg ou lb, selon votre habitude. L\'app ne convertit pas les unités.';

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
      'Un tableau de tous les mouvements des séances enregistrées : meilleure série, 1RM estimé et volume max. La recherche trouve le nom tout de suite. L\'étoile marque les favoris ; la pastille sous le nom assigne le groupe musculaire ; la croix rouge retire le nom des suggestions et de ce tableau (les séances enregistrées restent). Accès depuis le menu d\'entraînement ou la fiche client.';

  @override
  String get instructionSectionSaving => 'Sauvegarde';

  @override
  String get instructionFinishTitle => 'Terminer';

  @override
  String get instructionFinishBody =>
      'Confirme et enregistre la séance dans l\'historique. Si vous sortez plus tôt, vous pouvez enregistrer, jeter le brouillon ou rester. Si l\'app s\'interrompt, un brouillon est conservé automatiquement.';

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
      'Dans le calendrier/historique, chaque séance affiche le tonnage total. Le volume d\'entraînement est l\'un des meilleurs indicateurs d\'hypertrophie : plus vous accumulez de volume de qualité, plus vous construisez de muscle.';

  @override
  String get instructionNavImportExportTitle => 'Import / export';

  @override
  String get instructionNavImportExportDesc =>
      'Sauvegarde ou transfert via export et import JSON dans la fenêtre statistiques. La copie inclut l\'historique, la liste d\'exercices, les favoris et les étiquettes de groupes musculaires. La sauvegarde coach est séparée de l\'historique personnel. Un coach peut aussi importer l\'historique d\'un athlète comme nouveau client sans mélanger les noms d\'exercices.';

  @override
  String get instructionSectionHome => 'Accueil';

  @override
  String get instructionThemeTitle => 'Thème';

  @override
  String get instructionThemeDesc =>
      'Le commutateur soleil / lune sur l\'écran d\'accueil bascule clair et sombre. Le choix est mémorisé.';

  @override
  String get instructionTrainSelfTitle => 'Je m\'entraîne';

  @override
  String get instructionTrainSelfDesc =>
      'Vos séances, calendrier, progrès personnel, favoris, une jauge de rythme (fréquence d\'entraînement) et une séance rapide full body à partir de vos exercices étiquetés.';

  @override
  String get instructionTrainOthersTitle => 'Je coache';

  @override
  String get instructionTrainOthersDesc =>
      'Mode coach : clients, planning et historique séparé par personne. Chaque client a son tableau de progrès et ses favoris.';

  @override
  String get instructionSectionAthleteMenu => 'Votre entraînement';

  @override
  String get instructionStartWorkoutTitle => 'Démarrer l\'entraînement';

  @override
  String get instructionStartWorkoutDesc =>
      'Ouvre une séance vide — elle ne copie pas la dernière séance. Ajoutez des exercices, saisissez les séries, puis terminez pour enregistrer.';

  @override
  String get instructionQuickWorkoutTitle => 'Séance rapide';

  @override
  String get instructionQuickWorkoutDesc =>
      'Assemble une séance full body de 4 exercices : pectoraux, dos, une moitié de jambes (cuisse avant ou arrière — jamais les deux) et un accessoire épaules, bras ou gainage, selon ce qui n\'a pas été travaillé depuis le plus longtemps. Favoris d\'abord. Les derniers poids et répétitions apparaissent en gris comme minimum à battre — vous saisissez chaque série.';

  @override
  String get instructionCalendarMenuTitle => 'Calendrier d\'entraînements';

  @override
  String get instructionCalendarMenuDesc =>
      'Voyez les jours où vous vous êtes entraîné, ouvrez une séance enregistrée ou ajoutez un entraînement à une date et une heure — y compris dans le passé.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tableau des meilleures séries, 1RM estimé et volume max. C\'est ici que vous marquez les favoris et les groupes musculaires.';

  @override
  String get instructionFavoritesMenuTitle => 'Exercices favoris';

  @override
  String get instructionFavoritesMenuDesc =>
      'Votre liste étoilée. Cochez ceux que vous voulez et appuyez sur Composer la séance pour démarrer dans cet ordre. Les derniers poids et répétitions apparaissent en gris comme minimum à battre.';

  @override
  String get instructionSectionRhythm => 'Rythme d\'entraînement';

  @override
  String get instructionRhythmIntro =>
      'Après quelques séances de force, une jauge apparaît en haut de l\'écran d\'entraînement. Elle indique combien de jours par semaine vous vous êtes entraîné en moyenne sur les quatre dernières semaines. Les jours cardio seuls ne comptent pas. C\'est un instantané de votre densité, pas un objectif imposé par l\'app. Touchez-la pour une note sur votre rythme et ce qu\'est une semaine de récupération active.';

  @override
  String get instructionRhythmGaugeTitle => 'Jours par semaine';

  @override
  String get instructionRhythmGaugeDesc =>
      'L\'arc se remplit de 1 à 6 jours par semaine. La couleur passe de l\'acier à l\'or puis à la rouille quand la densité monte. La jauge apparaît dès qu\'il y a au moins trois jours de force dans cette fenêtre de quatre semaines.';

  @override
  String get instructionRhythmDeloadTitle =>
      'Rappel de semaine de récupération active';

  @override
  String get instructionRhythmDeloadDesc =>
      'Si vous vous entraînez environ deux jours et demi par semaine ou plus pendant plusieurs semaines sans semaine de récupération active, l\'app peut rappeler qu\'une courte semaine de récupération active est parfois utile — environ 30 % de moins de tonnage et de répétitions. Plus il y a de jours par semaine, plus le rappel arrive tôt. C\'est un rappel, pas une prescription. Au plus une fois par semaine, et seulement dans votre mode d\'entraînement — pas automatiquement pour les clients. Touchez la jauge d\'un client pour la même note.';

  @override
  String get instructionSectionFavorites => 'Favoris';

  @override
  String get instructionFavoriteStarTitle => 'Étoile';

  @override
  String get instructionFavoriteStarDesc =>
      'Dans Progrès personnel, touchez l\'étoile à côté d\'un exercice pour l\'ajouter ou le retirer des favoris. Les favoris restent en haut du tableau.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Composer la séance';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'Sur l\'écran des favoris, cochez les exercices. Le bouton apparaît dès qu\'au moins un est sélectionné. Les derniers poids et répétitions apparaissent en gris comme minimum à battre — vous saisissez chaque série. Pour un client, la même action démarre une séance pour cette personne.';

  @override
  String get instructionSectionMuscleGroups =>
      'Groupes musculaires et séance rapide';

  @override
  String get instructionMuscleGroupsIntro =>
      'Les groupes sont des étiquettes optionnelles sur vos propres noms d\'exercices. Ce n\'est pas un catalogue : ils servent seulement à la séance rapide pour un mix full body équilibré. Huit groupes : pectoraux, dos, épaules, gainage, cuisse avant, cuisse arrière, flexion des bras, extension des bras.';

  @override
  String get instructionMuscleGroupTagTitle => 'Comment étiqueter';

  @override
  String get instructionMuscleGroupTagDesc =>
      'À la première saisie d\'un nouveau nom, l\'app demande un groupe. Vous pouvez passer avec Plus tard, ou marquer Pas pour la séance rapide si le mouvement ne doit pas entrer dans le mix. La pastille sous le nom dans Progrès ou Favoris permet de changer ou d\'effacer l\'étiquette.';

  @override
  String get instructionQuickWorkoutHowTitle =>
      'Comment la séance rapide est construite';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Quatre créneaux : pectoraux, dos, une moitié de jambes, puis épaules/bras/gainage selon l\'ancienneté. L\'aperçu permet de remplacer n\'importe quel créneau par un autre exercice du même groupe. Si ce n\'est pas assez, ajoutez des exercices vous-même.';

  @override
  String get instructionStrengthCardioTitle => 'Force / Cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Sélecteur en haut de la séance. Force : poids, répétitions, RIR. Cardio : uniquement temps et intensité — pas de champ distance.';

  @override
  String get instructionPreviousHintsTitle =>
      'Chiffres gris de la dernière séance';

  @override
  String get instructionPreviousHintsDesc =>
      'Quand vous choisissez un exercice dans une séance client, une séance rapide ou une séance depuis les favoris, les derniers poids et répétitions apparaissent en gris — un minimum à battre, pas une série déjà enregistrée. Seuls les chiffres que vous saisissez vont dans l\'historique.';

  @override
  String get instructionRemoveExerciseTitle => 'Retirer de cette séance';

  @override
  String get instructionRemoveExerciseDesc =>
      'Retire ce bloc de la séance en cours seulement. L\'historique enregistré ne change pas tant que vous n\'avez pas terminé.';

  @override
  String get instructionReassignExerciseTitle =>
      'Changer l\'exercice dans l\'historique';

  @override
  String get instructionReassignExerciseDesc =>
      'Dans une séance enregistrée, vous pouvez réattribuer un bloc à un autre nom. Seule cette séance change ; les graphiques suivent le nouveau nom. Les séries restent telles quelles.';

  @override
  String get instructionAutoSaveTitle => 'Séance interrompue';

  @override
  String get instructionAutoSaveDesc =>
      'Si l\'app se ferme en cours de séance, elle propose de continuer où vous en étiez ou de supprimer le brouillon non enregistré.';

  @override
  String get instructionSectionCalendar => 'Calendrier';

  @override
  String get instructionCalendarAddTitle => 'Ajouter à une date';

  @override
  String get instructionCalendarAddDesc =>
      'Choisissez un jour, puis ajoutez un entraînement à l\'heure voulue. Utile pour saisir une séance manquée.';

  @override
  String get instructionSectionTrainer => 'Mode coach';

  @override
  String get instructionTrainerIntro =>
      '« Je coache » est destiné aux entraîneurs. Ajoutez des clients, planifiez des séances, préparez les exercices à l\'avance et enregistrez les entraînements par personne. Répéter la dernière séance est optionnel. Export et import des données coach sont séparés de l\'historique personnel. Supprimer un client retire les séances futures ; les séances passées restent pour le suivi.';

  @override
  String get instructionClientsTitle => 'Clients';

  @override
  String get instructionClientsDesc =>
      'Ajouter, modifier ou supprimer des clients. La liste indique la dernière et la prochaine séance. Fiche : objectif, poids, taille et notes privées du coach.';

  @override
  String get instructionClientProfileTitle => 'Fiche client';

  @override
  String get instructionClientProfileDesc =>
      'Depuis la fiche, une séance du jour vide démarre. Les chiffres gris de la dernière fois n\'apparaissent qu\'après le choix d\'un exercice. L\'historique n\'affiche que les séances terminées. Planifiez les dates futures dans le calendrier. Progrès et favoris sont sur le même écran. S\'il y a assez de force récente, une jauge montre à quelle fréquence la personne s\'entraîne ; touchez-la pour une note sur le rythme et le repos. Les modifications de fiche non enregistrées demandent confirmation avant de quitter.';

  @override
  String get instructionTrainerPlanTitle => 'Planifier une séance';

  @override
  String get instructionTrainerPlanDesc =>
      'Planifiez uniquement depuis le calendrier coach : choisissez un client et une date, puis les exercices. Les poids et répétitions précédents apparaissent en gris. Une séance planifiée a une icône lecture : appuyez pour démarrer (aujourd\'hui) ou supprimer. Seules les séances terminées vont dans l\'historique. Un plan dont la date est passée est retiré.';

  @override
  String get instructionTrainerRepeatTitle => 'Répéter la dernière séance';

  @override
  String get instructionTrainerRepeatDesc =>
      'Optionnel. Depuis la fiche client, ou via le commutateur en ajoutant une séance au calendrier. Copie les exercices de la dernière séance dans la séance live du jour ou un nouveau plan ; les poids et répétitions précédents sont des indices gris, pas des séries terminées.';

  @override
  String get printSession => 'Imprimer';

  @override
  String get printSessionEmpty =>
      'Rien à imprimer pour l\'instant. Notez au moins une série.';

  @override
  String get printSessionShareText => 'Séance IronVibe';

  @override
  String get instructionPrintSessionTitle => 'Imprimer une séance';

  @override
  String get instructionPrintSessionDesc =>
      'Sur une séance client terminée, l\'icône d\'impression dans l\'en-tête compose une feuille A4 de ce jour tel qu\'il a été saisi. Partagez, enregistrez ou imprimez via le menu système.';

  @override
  String get rhythmPerWeek => 'par semaine';

  @override
  String get deloadNudgeTitle => 'Une semaine de récupération active ?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Vous vous entraînez environ $rate jours par semaine depuis à peu près $weeks semaines. C\'est un rappel qu\'une courte semaine de récupération active est parfois utile — environ 30 % de moins de tonnage et de répétitions. Pas une prescription.';
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
    return 'Sur les quatre dernières semaines, vous vous entraînez environ $rate jours par semaine.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name s\'entraîne environ $rate jours par semaine sur les quatre dernières semaines.';
  }

  @override
  String get rhythmInsightWindow =>
      'Seuls les jours de force comptent. Les jours cardio seuls sont ignorés. C\'est un instantané de densité, pas un objectif.';

  @override
  String get rhythmInsightWhatTitle => 'Semaine de récupération active';

  @override
  String get rhythmInsightWhatBody =>
      'Vous baissez la charge exprès pour récupérer sans perdre la forme : les mêmes séances, mais environ 30–50 % de volume en moins. Ou vous sautez les jours de force et restez en mouvement.';

  @override
  String get rhythmInsightAdviceLight =>
      'En ce moment le rythme est calme. Si les séances ne sont pas extrêmes, on peut aller très longtemps sans semaine de récupération active planifiée.';

  @override
  String get rhythmInsightAdviceSteady =>
      'En ce moment c\'est un rythme régulier. Si le travail est dur, une semaine de récupération active tous les quelques mois suffit souvent.';

  @override
  String get rhythmInsightAdviceDense =>
      'En ce moment le calendrier est dense. Si les séances sont intenses, une semaine de récupération active tous les deux à trois mois mérite d\'être gardée en tête.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'En ce moment c\'est presque tous les jours. Si la charge est élevée, une semaine de récupération active environ une fois par mois est souvent jugée raisonnable.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Bravo. C\'est exactement le rythme sur lequel tient le progrès long.';

  @override
  String get rhythmInsightPraiseDense =>
      'Vraiment investi. Continuez comme ça.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'On dirait que vous cherchez à débloquer les capacités secrètes de votre organisme.';

  @override
  String get rhythmInsightRecentLighter =>
      'Une semaine de récupération active apparaît déjà dans les données récentes.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    return 'Environ $weeks semaines à cette densité sans semaine de récupération active.';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'C\'est une note de référence, pas une prescription. Elle rappelle seulement qu\'une courte semaine de récupération active est parfois utile. Si vous vous sentez bien, vous n\'avez rien à changer.';

  @override
  String get instructionHubManifest =>
      'Pas de catalogue ni de programmes tout faits. Vous nommez les exercices ; l\'app tient les stats à votre façon.';

  @override
  String get instructionChapterStartTitle => 'Pour commencer';

  @override
  String get instructionChapterStartBlurb =>
      'Écran d\'accueil, votre façon de vous entraîner, et pourquoi l\'app ne vous fait pas la leçon.';

  @override
  String get instructionChapterToolsTitle => 'Outils';

  @override
  String get instructionChapterToolsBlurb =>
      'Rythme, favoris, groupes musculaires et séance rapide.';

  @override
  String get instructionChapterSessionTitle => 'En séance';

  @override
  String get instructionChapterSessionBlurb =>
      'Séries, champs, cardio, enregistrement et chronomètre.';

  @override
  String get instructionChapterProgressTitle => 'Progrès et données';

  @override
  String get instructionChapterProgressBlurb =>
      'Records, graphique, calendrier, historique et sauvegarde.';

  @override
  String get instructionChapterCoachTitle => 'Mode coach';

  @override
  String get instructionChapterCoachBlurb =>
      'Clients, profils, séances planifiées et reprise d\'un entraînement.';

  @override
  String get instructionSearchHint => 'Rechercher dans le guide';

  @override
  String get instructionSearchEmpty => 'Aucun résultat.';
}
