// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'A VIBE DO SEU TREINO';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get renameExerciseTitle => 'Renomear exercício';

  @override
  String get renameExerciseEmpty => 'O nome não pode estar vazio';

  @override
  String get reassignHistoryExerciseTitle => 'Trocar exercício';

  @override
  String get reassignHistoryExerciseBody =>
      'Só este treino muda. As séries ficam; o progresso segue o novo nome do exercício.';

  @override
  String get delete => 'Excluir';

  @override
  String get yesDelete => 'Sim, excluir';

  @override
  String get close => 'Fechar';

  @override
  String get save => 'Salvar';

  @override
  String get add => 'Adicionar';

  @override
  String get trainOthers => 'TREINO OUTROS';

  @override
  String get trainSelf => 'TREINO EU MESMO';

  @override
  String get statistics => 'ESTATÍSTICAS';

  @override
  String get exportHistory => 'EXPORTAR HISTÓRICO';

  @override
  String get historyEmpty =>
      'O histórico está vazio, ainda não há nada para exportar.';

  @override
  String get exportError => 'Erro ao exportar:';

  @override
  String get exportJson => 'EXPORTAR JSON';

  @override
  String get importData => 'IMPORTAR';

  @override
  String get importSuccess => 'Dados importados com sucesso';

  @override
  String get importError => 'Erro ao importar:';

  @override
  String get importNewerVersion => 'Ficheiro de uma versão mais recente da app';

  @override
  String get importFileAccessError => 'Erro de acesso ao ficheiro';

  @override
  String get importInvalidJson => 'Formato JSON inválido';

  @override
  String get importInvalidBackupFile =>
      'Erro: ficheiro de cópia de segurança inválido selecionado';

  @override
  String get importAthlete => 'IMPORTAR ATLETA';

  @override
  String importAthleteFound(int count) {
    return 'Foram encontrados registos de $count treinos de um atleta que não está na lista.';
  }

  @override
  String get importAthleteBackupOwn => 'GUARDAR OS MEUS DADOS PRIMEIRO';

  @override
  String get importAthleteDecline => 'Não adicionar';

  @override
  String get importAthleteSuccess => 'Atleta adicionado';

  @override
  String get importAthleteNotAthleteFile =>
      'Este ficheiro não é um histórico de treinos de atleta.';

  @override
  String get importAthleteEmpty =>
      'Não foram encontrados treinos neste ficheiro.';

  @override
  String get importAthleteAlreadyImported =>
      'Estes treinos já estão neste dispositivo.';

  @override
  String get importAthleteUseDedicatedButton =>
      'Isto parece o histórico de um atleta. Use Importar atleta.';

  @override
  String get shareText => 'Histórico de treinos IronVibe';

  @override
  String get monthStats => 'ESTE MÊS';

  @override
  String get yearStats => 'ESTE ANO';

  @override
  String get allTimeStats => 'TUDO';

  @override
  String get weight => 'Peso';

  @override
  String get reps => 'Repetições';

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
  String get addSet => 'ADICIONAR SÉRIE';

  @override
  String get addExercise => 'ADICIONAR EXERCÍCIO';

  @override
  String get finishWorkout => 'FINALIZAR TREINO';

  @override
  String get finishWorkoutConfirmTitle => 'Finalizar treino?';

  @override
  String get finishWorkoutConfirmBody => 'O treino será salvo.';

  @override
  String get finishWorkoutConfirmAction => 'Finalizar';

  @override
  String get workoutCompleteTitle => 'Treino salvo';

  @override
  String get planChangesSavedTitle => 'Alterações salvas';

  @override
  String get startWorkout => 'INICIAR TREINO';

  @override
  String get quickWorkout => 'TREINO RÁPIDO';

  @override
  String get quickWorkoutFullBody => 'CORPO TODO';

  @override
  String get quickWorkoutInsufficientTitle => 'Dados insuficientes';

  @override
  String get quickWorkoutInsufficientBody =>
      'Um treino rápido precisa de exercícios de peito, costas, um grupo de pernas (coxa anterior ou posterior) e um de ombros, braços ou core. Marque-os no Progresso pessoal — ou continue a registar: a app pergunta ao introduzir um exercício novo.';

  @override
  String get quickWorkoutOpenProgress => 'ABRIR PROGRESSO PESSOAL';

  @override
  String get quickWorkoutPreviewTitle => 'TREINO RÁPIDO · CORPO TODO';

  @override
  String get quickWorkoutStart => 'COMEÇAR';

  @override
  String get quickWorkoutSwap => 'Trocar';

  @override
  String get quickWorkoutNoAlternatives => 'Não há outro exercício neste grupo';

  @override
  String get muscleGroupPromptTitle => 'Grupo muscular';

  @override
  String get muscleGroupPromptBody =>
      'Serve para o treino rápido de corpo todo.';

  @override
  String get muscleGroupLater => 'Mais tarde';

  @override
  String get muscleGroupClear => 'Limpar';

  @override
  String get muscleGroupSkip => 'Não para treino rápido';

  @override
  String get muscleGroupChest => 'Peito';

  @override
  String get muscleGroupBack => 'Costas';

  @override
  String get muscleGroupShoulders => 'Ombros';

  @override
  String get muscleGroupCore => 'Core';

  @override
  String get muscleGroupQuads => 'Coxa anterior';

  @override
  String get muscleGroupHamstrings => 'Coxa posterior';

  @override
  String get muscleGroupArmFlex => 'Flexão de braços';

  @override
  String get muscleGroupArmExt => 'Extensão de braços';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'CALENDÁRIO DE TREINOS';

  @override
  String get personalProgress => 'PROGRESSO PESSOAL';

  @override
  String get personalProgressSearchHint => 'Buscar exercício';

  @override
  String get personalProgressBestSet => 'Melhor série';

  @override
  String get personalProgressMaxVolume => 'Vol. máx.';

  @override
  String get personalProgressEmpty => 'Ainda sem exercícios nos treinos';

  @override
  String get favoriteExercises => 'EXERCÍCIOS FAVORITOS';

  @override
  String get favoriteExercisesEmpty => 'Ainda sem exercícios favoritos';

  @override
  String get buildWorkoutFromFavorites => 'MONTAR TREINO';

  @override
  String get exerciseHint => 'Digite o nome do exercício';

  @override
  String get deleteFromHistory => 'Remover do histórico?';

  @override
  String get deleteExerciseHint =>
      'não aparecerá mais nas sugestões nem no progresso pessoal.';

  @override
  String get exerciseDeleted => 'removido';

  @override
  String get deleteWorkoutTitle => 'EXCLUIR';

  @override
  String get deleteWorkoutMsg =>
      'Excluir este treino? O histórico de progresso será perdido.';

  @override
  String get removeSetWithDataConfirm =>
      'Excluir série com dados? Esta ação não pode ser desfeita.';

  @override
  String get removeExerciseFromWorkout => 'Remover exercício';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      'Remover este exercício do treino? Esta ação não pode ser desfeita.';

  @override
  String get deleteClientTitle => 'EXCLUIR CLIENTE';

  @override
  String get deleteClientMsg =>
      'Tem certeza que deseja excluir este cliente? Todos os treinos futuros dele serão removidos.';

  @override
  String get noClientsTitle => 'SEM CLIENTES';

  @override
  String get noClientsMsg => 'Adicione clientes primeiro no menu «Clientes».';

  @override
  String get newClient => 'NOVO CLIENTE';

  @override
  String get editClient => 'EDITAR';

  @override
  String get clientName => 'Nome';

  @override
  String get clientNameCannotChange => 'O nome não pode ser alterado depois.';

  @override
  String get clientNameTaken => 'Este nome já está em uso. Escolha outro.';

  @override
  String get clientGoal => 'Objetivo';

  @override
  String get clientWeight => 'Peso';

  @override
  String get clientHeight => 'Altura';

  @override
  String get clientNotes => 'Anotações';

  @override
  String get saveClientChanges => 'SALVAR ALTERAÇÕES';

  @override
  String get clientProfileUnsavedTitle => 'Alterações não salvas';

  @override
  String get clientProfileUnsavedMessage =>
      'Há alterações não salvas. Salvar antes de sair?';

  @override
  String get clientProfileStay => 'Ficar';

  @override
  String get clientProfileDiscard => 'Sair sem salvar';

  @override
  String get clientProfileSaveAndLeave => 'Salvar e sair';

  @override
  String get workoutRecoveryTitle => 'Treino interrompido';

  @override
  String get workoutRecoveryMessage =>
      'Seu treino anterior terminou de forma inesperada. Continue de onde parou ou exclua os dados não salvos.';

  @override
  String get workoutRecoveryContinue => 'Continuar treino';

  @override
  String get workoutRecoveryDelete => 'Excluir treino';

  @override
  String get workoutRecoverySessionMissing =>
      'O treino agendado do cliente foi removido. O rascunho não salvo foi apagado.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Conclua o exercício atual antes de adicionar outro.';

  @override
  String get switchWorkoutTypeTitle => 'Mudar o tipo de treino?';

  @override
  String get switchWorkoutTypeBody =>
      'As séries do outro tipo não serão salvas neste treino.';

  @override
  String get switchWorkoutTypeConfirm => 'Mudar';

  @override
  String get saveWorkoutNothingToSave =>
      'Ainda não há o que salvar. Adicione peso e repetições, ou duração de cardio.';

  @override
  String get importedHistoryBadge => 'Importado';

  @override
  String get clientWorkoutHistoryEmpty => 'Nenhum treino ainda';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Exercício n.º $n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Exercício n.º $n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return 'n.º $n';
  }

  @override
  String get clientProfileSectionGoal => 'META';

  @override
  String get clientProfileSectionAnthropometry => 'ANTROPOMETRIA';

  @override
  String get clientProfileSectionTrainerNotes => 'NOTAS DO TREINADOR';

  @override
  String get clientProfileSectionWorkoutHistory => 'HISTÓRICO DE TREINOS';

  @override
  String get clientTrainerNotesHint => 'Lesões, detalhes, plano…';

  @override
  String get trainerSessionDefaultTitle => 'Treino';

  @override
  String get durationMinutesShort => 'min';

  @override
  String get addTraining => 'ADICIONAR TREINO';

  @override
  String get repeatLastWorkout => 'Repetir o último treino';

  @override
  String get repeatLastUnavailable =>
      'Este cliente ainda não tem um treino para repetir.';

  @override
  String get editPlan => 'Editar plano';

  @override
  String get trainerSessionEmpty => 'Ainda não planeado';

  @override
  String trainerSessionPlanned(int n) {
    return '$n planeados';
  }

  @override
  String get trainerClientsEmpty =>
      'Ainda sem clientes. Adiciona alguém para começar a agendar.';

  @override
  String get clientNeverTrained => 'Ainda sem treinos';

  @override
  String get clientNoUpcoming => 'Sem sessão próxima';

  @override
  String clientLastSession(String when) {
    return 'Último: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Próximo: $when';
  }

  @override
  String get clientSessionToday => 'hoje';

  @override
  String get clientSessionYesterday => 'ontem';

  @override
  String get clientSessionTomorrow => 'amanhã';

  @override
  String clientSessionDaysAgo(int n) {
    return 'há $n dias';
  }

  @override
  String clientSessionInDays(int n) {
    return 'em $n dias';
  }

  @override
  String get clientProfileDetails => 'Perfil';

  @override
  String get addSessionPickClient => 'Seleciona um cliente';

  @override
  String get clientLabel => 'Cliente';

  @override
  String get deleteClientBtn => 'EXCLUIR CLIENTE';

  @override
  String get clientsMenu => 'CLIENTES';

  @override
  String get dateHeader => 'Data';

  @override
  String get clientHeader => 'Cliente';

  @override
  String get exerciseHeader => 'Exercício';

  @override
  String get typeHeader => 'Tipo';

  @override
  String get strengthType => 'Força';

  @override
  String get cardioType => 'Cardio';

  @override
  String get weightHeader => 'Peso';

  @override
  String get weightUnitsChoiceShort => 'kg / lb';

  @override
  String get progressChartWeightLegend => 'Peso — kg / lb (à sua escolha)';

  @override
  String get progressChartVolumeLegend => 'Volume (tonelagem)';

  @override
  String get repsHeader => 'Repetições';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'Tempo (min)';

  @override
  String get intensityHeader => 'Intensidade';

  @override
  String get setHeader => 'Série';

  @override
  String get strength => 'Força';

  @override
  String get cardio => 'Cardio';

  @override
  String get timeMin => 'Tempo (min)';

  @override
  String get intensity => 'Intensidade';

  @override
  String get reserve => 'Reserva';

  @override
  String get sets => 'Séries';

  @override
  String get time => 'Tempo';

  @override
  String get rest => 'Descanso';

  @override
  String get settings => 'Configurações';

  @override
  String get max => 'Máximo';

  @override
  String get totalVolume => 'Volume total';

  @override
  String get chart => 'Gráfico';

  @override
  String get progress => 'Progresso';

  @override
  String get dayMonday => 'Segunda-feira';

  @override
  String get dayTuesday => 'Terça-feira';

  @override
  String get dayWednesday => 'Quarta-feira';

  @override
  String get dayThursday => 'Quinta-feira';

  @override
  String get dayFriday => 'Sexta-feira';

  @override
  String get daySaturday => 'Sábado';

  @override
  String get daySunday => 'Domingo';

  @override
  String get greetingHi => 'Olá';

  @override
  String get greetingMorning => 'Bom dia';

  @override
  String get greetingAfternoon => 'Boa tarde';

  @override
  String get greetingEvening => 'Boa noite';

  @override
  String get monthJanuary => 'Janeiro';

  @override
  String get monthFebruary => 'Fevereiro';

  @override
  String get monthMarch => 'Março';

  @override
  String get monthApril => 'Abril';

  @override
  String get monthMay => 'Maio';

  @override
  String get monthJune => 'Junho';

  @override
  String get monthJuly => 'Julho';

  @override
  String get monthAugust => 'Agosto';

  @override
  String get monthSeptember => 'Setembro';

  @override
  String get monthOctober => 'Outubro';

  @override
  String get monthNovember => 'Novembro';

  @override
  String get monthDecember => 'Dezembro';

  @override
  String get exerciseBenchPress => 'Supino';

  @override
  String get exerciseSquat => 'Agachamento';

  @override
  String get exerciseRow => 'Remada';

  @override
  String get exerciseDeadlift => 'Levantamento terra';

  @override
  String get exerciseOverheadPress => 'Desenvolvimento';

  @override
  String get exercisePullUp => 'Barra fixa';

  @override
  String get exerciseLunges => 'Afundos';

  @override
  String get exercisePlank => 'Prancha';

  @override
  String get saveWorkout => 'SALVAR TREINO';

  @override
  String get deleteWorkout => 'EXCLUIR TREINO';

  @override
  String get deleteTraining => 'Excluir treino';

  @override
  String get deleteTrainingQuestion => 'Excluir este treino da agenda?';

  @override
  String get addSetButton => 'Adicionar série';

  @override
  String get progressButton => 'Progresso';

  @override
  String get filterMonth => 'Mês';

  @override
  String get filterYear => 'Ano';

  @override
  String get filterAllTime => 'Tudo';

  @override
  String get noteLabel => 'Nota';

  @override
  String get addClient => 'ADICIONAR CLIENTE';

  @override
  String get workoutsToday => 'TREINOS DE HOJE';

  @override
  String get workoutNumberPrefix => 'Treino #';

  @override
  String get noEntries => 'Nenhum registro';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Política de privacidade';

  @override
  String get instructionButton => 'GUIA';

  @override
  String get instructionTitle => 'Como está organizado';

  @override
  String get instructionHubManifest =>
      'Sem catálogo de exercícios nem programas prontos. Dás os nomes aos movimentos com as tuas palavras — a app guarda as estatísticas.';

  @override
  String get instructionSearchHint => 'Pesquisar no guia';

  @override
  String get instructionSearchEmpty => 'Nada encontrado.';

  @override
  String get instructionChapterStartTitle => 'Por onde começar';

  @override
  String get instructionChapterStartBlurb =>
      'Ecrã inicial, os dois modos e a lógica da app.';

  @override
  String get instructionChapterSessionTitle => 'No treino';

  @override
  String get instructionChapterSessionBlurb =>
      'Séries, carga, repetições, RIR, cardio e fecho da sessão.';

  @override
  String get instructionChapterTimerTitle => 'Cronómetro';

  @override
  String get instructionChapterTimerBlurb =>
      'Intervalos, descanso entre séries e sinais.';

  @override
  String get instructionChapterExercisesTitle => 'Exercícios e grupos';

  @override
  String get instructionChapterExercisesBlurb =>
      'A tua lista de movimentos, grupos musculares, favoritos e o treino rápido.';

  @override
  String get instructionChapterProgressTitle => 'Progresso e recordes';

  @override
  String get instructionChapterProgressBlurb =>
      'Progresso pessoal, 1RM, tonelagem e o gráfico do exercício.';

  @override
  String get instructionChapterRhythmTitle => 'Ritmo e recuperação';

  @override
  String get instructionChapterRhythmBlurb =>
      'O indicador semanal de ritmo e a semana de descarga.';

  @override
  String get instructionChapterDataTitle => 'Histórico e dados';

  @override
  String get instructionChapterDataBlurb =>
      'Calendário, edição de registos, estatísticas e cópia de segurança.';

  @override
  String get instructionChapterCoachTitle => 'Modo treinador';

  @override
  String get instructionChapterCoachBlurb =>
      'Clientes, agenda, plano de sessão e impressão.';

  @override
  String get instructionPhilosophy =>
      'O IronVibe não ensina a treinar nem entrega programas prontos — isso é do treinador e da tua experiência. Não há um catálogo com milhares de exercícios: escreves os nomes com as tuas palavras e a app conta os números com cuidado. Tudo fica no dispositivo: sem contas, sem subscrições, sem anúncios.';

  @override
  String get instructionSectionHome => 'Ecrã inicial';

  @override
  String get instructionThemeTitle => 'Tema';

  @override
  String get instructionThemeDesc =>
      'O interruptor sol — lua muda entre claro e escuro. A escolha fica memorizada.';

  @override
  String get instructionTrainSelfTitle => 'Treino eu mesmo';

  @override
  String get instructionTrainSelfDesc =>
      'O teu espaço: treinos, calendário, progresso pessoal, favoritos e o indicador de ritmo.';

  @override
  String get instructionTrainOthersTitle => 'Treino outros';

  @override
  String get instructionTrainOthersDesc =>
      'Modo treinador: clientes, agenda e um histórico separado por pessoa. Não se mistura com os teus treinos.';

  @override
  String get instructionLanguageTitle => 'Idioma';

  @override
  String get instructionLanguageDesc =>
      'A app segue o idioma do sistema — não há uma definição à parte. São suportados dez idiomas.';

  @override
  String get instructionHomeLinksTitle => 'Versão e contacto';

  @override
  String get instructionHomeLinksDesc =>
      'No fundo do ecrã inicial: número de versão, site, Telegram, e-mail de suporte e política de privacidade.';

  @override
  String get instructionSectionAthleteMenu => 'Os teus treinos';

  @override
  String get instructionStartWorkoutTitle => 'Iniciar treino';

  @override
  String get instructionStartWorkoutDesc =>
      'Abre uma sessão vazia — o último treino não é copiado. Acrescenta exercícios, regista séries e termina para guardar.';

  @override
  String get instructionQuickWorkoutTitle => 'Treino rápido';

  @override
  String get instructionQuickWorkoutDesc =>
      'Monta um corpo todo com quatro exercícios a partir das tuas etiquetas de grupo muscular.';

  @override
  String get instructionCalendarMenuTitle => 'Calendário de treinos';

  @override
  String get instructionCalendarMenuDesc =>
      'Os dias em que treinaste. Daqui abres as sessões guardadas ou acrescentas as que faltam.';

  @override
  String get instructionSectionPersonalProgress => 'Progresso pessoal';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabela das melhores séries, do 1RM estimado e do volume máximo de cada movimento.';

  @override
  String get instructionFavoritesMenuTitle => 'Exercícios favoritos';

  @override
  String get instructionFavoritesMenuDesc =>
      'Movimentos marcados com estrela. Com eles montas um treino em dois toques.';

  @override
  String get instructionSectionWorkout => 'Sessão';

  @override
  String get instructionStrengthCardioTitle => 'Força ou cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'O interruptor no topo da sessão define o tipo. Força: carga, repetições e RIR. Cardio: tempo e intensidade. Se já houver dados do outro tipo, a app pergunta.';

  @override
  String get instructionAddExerciseTitle => 'Adicionar exercício';

  @override
  String get instructionAddExerciseBody =>
      'Um bloco novo aparece quando o exercício atual tem nome e pelo menos uma série preenchida.';

  @override
  String get instructionPreviousHintsTitle => 'Pistas cinzentas';

  @override
  String get instructionPreviousHintsDesc =>
      'Carga e repetições da última vez aparecem a cinzento — um alvo a bater, não uma série já registada. Para o histórico só entra o que escreveres tu.';

  @override
  String get instructionRemoveExerciseTitle => 'Retirar exercício';

  @override
  String get instructionRemoveExerciseDesc =>
      'A cruz vermelha tira o bloco da sessão atual. O histórico guardado não muda.';

  @override
  String get instructionSectionSetControl => 'Linha da série';

  @override
  String get instructionSetPlusLabel => 'Mais';

  @override
  String get instructionSetPlusDesc =>
      'Acrescenta uma linha vazia para a série seguinte.';

  @override
  String get instructionSetMinusLabel => 'Menos';

  @override
  String get instructionSetMinusDesc =>
      'Tira a última série. Uma linha vazia some já; uma preenchida, depois de confirmares. Se só restar uma série, os campos esvaziam-se.';

  @override
  String get instructionSetProgressLabel => 'Gráfico do exercício';

  @override
  String get instructionSetProgressDesc =>
      'Abre a evolução deste movimento no mês, no ano ou em todo o tempo.';

  @override
  String get instructionExerciseVolumeTitle => 'Tonelagem do exercício';

  @override
  String get instructionExerciseVolumeDesc =>
      'À direita do botão do gráfico: soma de carga × repetições em todas as séries preenchidas. Recalcula-se ao escrever.';

  @override
  String get instructionSectionInputs => 'O que significam os campos';

  @override
  String get instructionWeightTitle => 'Carga';

  @override
  String get instructionWeightBody =>
      'A carga de trabalho. Quilogramas ou libras — a app não converte unidades e não impõe nada.';

  @override
  String get instructionRepsTitle => 'Repetições';

  @override
  String get instructionRepsBody =>
      'Quantas vezes fizeste o movimento na série.';

  @override
  String get instructionRirTitle => 'RIR — repetições em reserva';

  @override
  String get instructionRirBody =>
      'Quantas repetições ainda poderias ter feito. 0 é trabalho até à falha, ∞ uma série de aquecimento. Uma forma simples de dosear a intensidade.';

  @override
  String get instructionOneRmTitle => '1RM — máximo de uma repetição';

  @override
  String get instructionOneRmDesc =>
      'Estimativa da carga a uma repetição com a fórmula de Epley, a partir da carga e das repetições da série. Mostra-se debaixo da linha — um marco-chave de força.';

  @override
  String get instructionSectionCardio => 'Cardio';

  @override
  String get instructionCardioTitle => 'Tempo';

  @override
  String get instructionCardioBody =>
      'Duração do bloco em minutos. Sem distância nem pulso: a app não está ligada a trackers.';

  @override
  String get instructionIntensityTitle => 'Intensidade';

  @override
  String get instructionIntensityBody =>
      'Esforço de 1 a 5 — uma escala RPE simplificada. Numa sessão de cardio guarda-se uma só linha por exercício.';

  @override
  String get instructionSectionSaving => 'Fecho';

  @override
  String get instructionFinishTitle => 'Finalizar treino';

  @override
  String get instructionFinishBody =>
      'O botão no fundo da sessão: a app confirma e escreve o treino no histórico. É precisa pelo menos uma série preenchida.';

  @override
  String get instructionLeaveWorkoutTitle => 'Sair mais cedo';

  @override
  String get instructionLeaveWorkoutDesc =>
      'Se fechares uma sessão com dados, podes ficar, guardar o que registaste ou apagar o rascunho.';

  @override
  String get instructionAutoSaveTitle => 'Treino interrompido';

  @override
  String get instructionAutoSaveDesc =>
      'O rascunho guarda-se sozinho — a cada minuto e quando a app vai para segundo plano. No próximo arranque podes continuar do mesmo sítio ou apagá-lo.';

  @override
  String get instructionScreenAwakeTitle => 'O ecrã não apaga';

  @override
  String get instructionScreenAwakeDesc =>
      'Enquanto a sessão está a decorrer, o ecrã fica ligado para não desbloqueares o telefone depois de cada série.';

  @override
  String get instructionStopwatchWhyTitle => 'Porque cronometrar o descanso';

  @override
  String get instructionStopwatchWhyBody =>
      'A pausa entre séries é um parâmetro de trabalho, como a carga e as repetições: descanso curto sobe a densidade, descanso longo deixa ir a fundo numa série pesada.';

  @override
  String get instructionStopwatchHowTitle => 'Início, pausa, reinício';

  @override
  String get instructionStopwatchHowBody =>
      'O cronómetro está fixo no cabeçalho da sessão e permanece visível ao deslizar. No centro, o tempo e os controlos; no modo normal conta para cima, com centésimos.';

  @override
  String get instructionStopwatchIntervalsTitle => 'À esquerda: intervalos';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — um minuto de trabalho e um de descanso. 4/4 — quatro minutos cada. 20/10 — tabata. As fases repetem-se em ciclo até pausares ou reiniciares: tom vermelho é trabalho, azul é descanso.';

  @override
  String get instructionStopwatchRestTitle => 'À direita: descanso';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m e +5m arrancam a contagem decrescente entre séries. Se já estiver a correr, os minutos somam-se ao resto; um ciclo de intervalos passa a descanso.';

  @override
  String get instructionStopwatchProgressTitle => 'Barra de fase';

  @override
  String get instructionStopwatchProgressBody =>
      'Na contagem decrescente e nos intervalos, por baixo dos algarismos vê-se quanto falta da fase atual.';

  @override
  String get instructionStopwatchSoundsTitle => 'Som e vibração';

  @override
  String get instructionStopwatchSoundsBody =>
      'A três, duas e um segundo do fim da fase — um clique curto e uma vibração ligeira; na mudança de fase o sinal é mais nítido. Os sons estão na app: sem microfone, sem permissão de notificações. O volume segue as definições do telefone.';

  @override
  String get instructionExerciseBankIntro =>
      'A lista de exercícios cresce sozinha: cada nome novo de um treino concluído entra nas sugestões. Os nomes ficam em maiúsculas para o mesmo movimento não se desdobrar.';

  @override
  String get instructionSectionExerciseNameTools => 'Nomes';

  @override
  String get instructionRenameExerciseTitle => 'Mudar o nome em todo o lado';

  @override
  String get instructionRenameExerciseDesc =>
      'Toque longo no nome — na sessão, na lista de sugestões ou num treino guardado. Atualiza-se em todo o histórico e nos gráficos.';

  @override
  String get instructionRemoveFromBankTitle => 'Tirar das sugestões';

  @override
  String get instructionRemoveFromBankDesc =>
      'A cruz na lista de sugestões aberta, ou a cruz vermelha no progresso pessoal, tira o nome das sugestões e da tabela. Os treinos guardados ficam intocados.';

  @override
  String get instructionReassignExerciseTitle => 'Substituir no registo';

  @override
  String get instructionReassignExerciseDesc =>
      'Num treino guardado podes reatribuir o bloco a outro movimento. As séries mantêm-se, mas passam para as estatísticas do nome novo — só esta sessão muda.';

  @override
  String get instructionSectionMuscleGroups => 'Grupos musculares';

  @override
  String get instructionMuscleGroupsIntro =>
      'O grupo é uma etiqueta opcional no teu nome. Só serve ao treino rápido, para montar um corpo todo equilibrado. Oito grupos: peito, costas, ombros, core, coxa anterior, coxa posterior, flexão de braços, extensão de braços.';

  @override
  String get instructionMuscleGroupTagTitle => 'Como etiquetar';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Na primeira vez que escreves um nome novo, a app pergunta o grupo. Podes responder Mais tarde, ou Não para treino rápido se o movimento não deve entrar no mix. A etiqueta debaixo do nome no progresso pessoal e nos favoritos muda-se ou tira-se com facilidade.';

  @override
  String get instructionSectionFavorites => 'Favoritos';

  @override
  String get instructionFavoriteStarTitle => 'Estrela';

  @override
  String get instructionFavoriteStarDesc =>
      'Há estrela no cartão do exercício na sessão e na tabela de progresso pessoal. Os favoritos ficam no topo da lista.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Montar treino';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'No ecrã de favoritos marca os movimentos que quiseres — o botão aparece já. A sessão abre por essa ordem, com as pistas cinzentas da última vez. Para um cliente, a mesma ação abre o treino dele.';

  @override
  String get instructionSectionQuickWorkout => 'Treino rápido';

  @override
  String get instructionQuickWorkoutHowTitle => 'Quatro lugares';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Peito, costas, uma metade das pernas (coxa anterior ou posterior — nunca as duas no mesmo dia) e um movimento para ombros, braços ou core. Em cada lugar a app escolhe o grupo que há mais tempo não trabalha e dá prioridade a um favorito.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Pré-visualização e troca';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'Antes de começares vês a composição toda: qualquer lugar pode trocar-se por outro exercício do mesmo grupo. Se faltarem movimentos etiquetados, a app diz e abre o progresso pessoal para pôr as etiquetas.';

  @override
  String get instructionPersonalProgressIntro =>
      'Uma tabela de todos os movimentos dos treinos guardados. Favoritos no topo, o resto por ordem alfabética; a pesquisa encontra o nome. Abre-se no menu de treinos ou no perfil do cliente.';

  @override
  String get instructionProgressBestSetTitle => 'Melhor série';

  @override
  String get instructionProgressBestSetDesc =>
      'A série com o 1RM estimado mais alto em todo o histórico. Em movimentos sem carga, fica a série com mais repetições.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Volume máximo';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'A maior tonelagem deste exercício num único treino — um bom ponto de apoio para planear o volume de trabalho.';

  @override
  String get instructionSectionProgressChart => 'Gráfico do exercício';

  @override
  String get instructionProgressChartIntro =>
      'Três curvas independentes por datas. À esquerda a escala de carga, à direita a de repetições; a linha amarela está normalizada para comparar tendências pela forma. O período muda — mês, ano, todo o tempo — e um toque num ponto mostra os números desse dia. O cardio não entra no gráfico.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Vermelha — maior carga numa série nesse dia.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Ciano — mais repetições numa série, não necessariamente com a carga máxima.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Amarela — tonelagem do dia: soma de carga × repetições nas séries com os dois campos preenchidos.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Num treino a decorrer, o botão do gráfico acende-se quando bates um recorde: vermelho no peso da série, amarelo na tonelagem do exercício, ciano na soma de repetições em movimentos sem carga. Se coincidirem vários, ganha o vermelho, depois o amarelo e o ciano. No histórico guardado não há destaque.';

  @override
  String get instructionRhythmIntro =>
      'Quando nas últimas quatro semanas se juntam pelo menos três dias de força, no topo do ecrã de treinos aparece o indicador de ritmo. Não é um objetivo nem uma nota — é só a frequência com que vais ao ginásio neste momento.';

  @override
  String get instructionRhythmGaugeTitle => 'Dias por semana';

  @override
  String get instructionRhythmGaugeDesc =>
      'O arco enche-se de um a seis dias — a média de quatro semanas. Contam os dias com trabalho de força; os só de cardio, não. Quanto mais denso o ritmo, mais a cor se afasta do aço para o ouro e a ferrugem.';

  @override
  String get instructionRhythmInsightTitle => 'Leitura do ritmo';

  @override
  String get instructionRhythmInsightDesc =>
      'Toca no indicador: a app nomeia o teu modo — ritmo calmo, estável, denso ou quase sem dias de folga — e explica o que isso significa para a recuperação. No cliente do treinador abre-se a mesma leitura.';

  @override
  String get instructionRhythmDeloadTitle => 'Semana de descarga';

  @override
  String get instructionRhythmDeloadDesc =>
      'A descarga não é uma pausa, é uma semana a meia potência: cargas de trabalho e número de séries 30–50% mais baixos, ou só cardio. O músculo recupera mais depressa do que ligamentos, tendões e articulações — esta semana dá-lhes tempo de alcançar.';

  @override
  String get instructionRhythmNudgeTitle => 'Lembrete';

  @override
  String get instructionRhythmNudgeDesc =>
      'Se manténs duas sessões e meia por semana ou mais e há muito que não descarregas, a app sugere tirar uma semana dessas. Quanto mais denso o ritmo, mais cedo aparece o aviso. Surge no máximo uma vez por semana e só no modo pessoal — é uma recomendação, não um conselho médico.';

  @override
  String get instructionSectionCalendar => 'Calendário e histórico';

  @override
  String get instructionCalendarBrowseTitle => 'Como folhear';

  @override
  String get instructionCalendarBrowseDesc =>
      'Os meses mudam com um deslize; um toque no nome do mês abre a escolha rápida de data. Um ponto debaixo do número significa que nesse dia houve treino.';

  @override
  String get instructionCalendarAddTitle => 'Registo a posteriori';

  @override
  String get instructionCalendarAddDesc =>
      'Escolhe o dia, define a hora e acrescenta um treino — inclusive de uma data já passada. Útil se te esqueceste de registar a sessão.';

  @override
  String get instructionNavHistoryTitle => 'Tonelagem do treino';

  @override
  String get instructionNavHistoryDesc =>
      'Cada sessão guardada mostra a tonelagem total. O volume é um dos marcos mais sólidos de hipertrofia: o que importa não é o recorde de um dia, é como se aguenta de semana para semana.';

  @override
  String get instructionHistoryEditTitle => 'Editar registos';

  @override
  String get instructionHistoryEditDesc =>
      'Um treino guardado pode abrir-se e corrigir-se: acrescentar exercício ou série, mudar os números, apagar a sessão inteira. As alterações guardam-se já.';

  @override
  String get instructionSectionStats => 'Estatísticas';

  @override
  String get instructionStatsTitle => 'Resumo de treinos';

  @override
  String get instructionStatsDesc =>
      'O ícone de gráfico no cabeçalho do ecrã de treinos ou do treinador: quantas sessões este mês, este ano e no total. No modo treinador, também a divisão por cliente.';

  @override
  String get instructionSectionBackup => 'Cópia de segurança';

  @override
  String get instructionNavImportExportTitle => 'Exportar e importar';

  @override
  String get instructionNavImportExportDesc =>
      'A exportação junta num ficheiro JSON o histórico, a lista de exercícios, os favoritos, as etiquetas de grupo, os clientes e a agenda. A importação mistura o ficheiro com os dados atuais e salta duplicados — nada é apagado. A cópia do treinador está separada da pessoal.';

  @override
  String get instructionBackupNudgeTitle => 'Lembrete de cópia';

  @override
  String get instructionBackupNudgeDesc =>
      'Os dados vivem só neste dispositivo: sem contas, sem nuvem. De quatro em quatro semanas a app oferece guardar uma cópia — se o telefone se perder, o histórico só volta a partir desse ficheiro.';

  @override
  String get instructionTrainerIntro =>
      '«Treino outros» é um espaço à parte para trabalhar com pessoas: clientes, agenda e um histórico por pessoa. Treinos pessoais e dados de treinador não se cruzam.';

  @override
  String get instructionClientsTitle => 'Clientes';

  @override
  String get instructionClientsDesc =>
      'Lista com o objetivo, a última e a próxima sessão. No cartão: objetivo, peso, altura e notas privadas do treinador. O nome define-se na criação e depois não muda.';

  @override
  String get instructionClientProfileTitle => 'Perfil do cliente';

  @override
  String get instructionClientProfileDesc =>
      'Daqui parte a sessão de hoje e abrem-se o progresso, os favoritos e o histórico por mês. Se houver dias de força suficientes, está também o indicador de ritmo. Apagar um cliente tira as sessões futuras; os treinos passados ficam para o relatório.';

  @override
  String get instructionTrainerScheduleTitle => 'Agenda';

  @override
  String get instructionTrainerScheduleDesc =>
      'O calendário do treinador mostra as sessões de todos os clientes: ícone de play é planeada, visto é concluída, ampulheta é a de hoje em curso. Os planos vazios de dias passados desaparecem sozinhos.';

  @override
  String get instructionTrainerPlanTitle => 'Plano de sessão';

  @override
  String get instructionTrainerPlanDesc =>
      'Para uma data futura podes dispor exercícios e uma nota à frente e guardar sem terminar o treino. Carga e repetições da última vez chegam como pistas cinzentas. Para o histórico só entram as sessões concluídas.';

  @override
  String get instructionTrainerRepeatTitle => 'Repetir o último';

  @override
  String get instructionTrainerRepeatDesc =>
      'Do perfil do cliente ou com o interruptor ao acrescentar uma sessão no calendário. Copia-se a composição dos exercícios; carga e repetições vêm como pistas cinzentas, não como séries já feitas.';

  @override
  String get instructionPrintSessionTitle => 'Imprimir a sessão';

  @override
  String get instructionPrintSessionDesc =>
      'Num treino concluído, o ícone de impressão no cabeçalho monta uma folha A4 com a composição e os números do dia. Depois a folha do sistema: impressora, PDF ou envio ao cliente.';

  @override
  String get instructionImportAthleteTitle => 'Importar histórico de um atleta';

  @override
  String get instructionImportAthleteDesc =>
      'Botão próprio nas estatísticas do treinador: um ficheiro do modo pessoal passa a cliente novo, com favoritos e etiquetas de grupo. Os treinos transferidos ficam marcados como importados e os nomes dos exercícios não se misturam com os teus.';

  @override
  String get printSession => 'Imprimir';

  @override
  String get printSessionEmpty =>
      'Ainda não há nada para imprimir. Regista pelo menos uma série.';

  @override
  String get printSessionShareText => 'Sessão IronVibe';

  @override
  String get rhythmPerWeek => 'por semana';

  @override
  String get deloadNudgeTitle => 'Uma semana de recuperação ativa?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Treinas cerca de $rate dias por semana há cerca de $weeks semanas. Bom momento para uma semana de recuperação ativa: pesos de trabalho e séries 30–50% mais baixos, ou só cardio. É uma recomendação, não um conselho médico.';
  }

  @override
  String get deloadNudgeLater => 'Agora não';

  @override
  String get deloadNudgeOk => 'Entendi';

  @override
  String get backupNudgeTitle => 'Guardar uma cópia?';

  @override
  String get backupNudgeBody =>
      'Os teus dados ficam só neste dispositivo. Se o perderes ou o armazenamento falhar, o histórico desaparece. Partilha uma cópia agora ou adia 28 dias.';

  @override
  String get backupNudgeShare => 'Partilhar';

  @override
  String get backupNudgeLater => 'Mais tarde';

  @override
  String get rhythmInsightTitle => 'Ritmo de treino';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'Treinas em média cerca de $rate vezes por semana.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name treina em média cerca de $rate vezes por semana.';
  }

  @override
  String get rhythmInsightBandLight => 'Ritmo calmo';

  @override
  String get rhythmInsightBandSteady => 'Ritmo estável';

  @override
  String get rhythmInsightBandDense => 'Ritmo denso';

  @override
  String get rhythmInsightBandVeryDense => 'Quase sem dias de folga';

  @override
  String get rhythmInsightHowTitle => 'De onde vem este número';

  @override
  String get rhythmInsightWindow =>
      'Média das últimas quatro semanas. Contam os dias com trabalho de força; dias só de cardio, não. Isto não é um objetivo nem uma nota — é o teu ritmo atual.';

  @override
  String get rhythmInsightWhatTitle => 'Semana de recuperação ativa';

  @override
  String get rhythmInsightWhatBody =>
      'Não é uma pausa, é uma semana a meia potência: pesos de trabalho e número de séries 30–50% mais baixos. Também podes deixar a força e ficar com cardio ou outra atividade. O músculo recupera mais depressa do que articulações, ligamentos e tendões — esta semana dá-lhes tempo de alcançar.';

  @override
  String get rhythmInsightPaceTitle => 'O que isto significa';

  @override
  String get rhythmInsightAdviceLight =>
      'Há dias livres suficientes entre sessões, o cansaço não se acumula. Ainda não é preciso planear recuperação ativa: neste ritmo o corpo recupera sozinho.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Um ritmo estável em que se pode trabalhar anos. Se as sessões forem duras, tira uma semana de recuperação ativa de uns em uns meses — mais vale cedo do que quando os pesos já pararam.';

  @override
  String get rhythmInsightAdviceDense =>
      'As sessões ficam juntas e o cansaço acumula-se em silêncio. Uma semana de recuperação ativa a cada dois ou três meses costuma aguentar o progresso melhor do que seguir sem pausa.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Quase todos os dias sob carga. Pode resultar se o sono e a comida acompanharem. Neste ritmo, uma semana de recuperação ativa cerca de uma vez por mês é prevenção normal para articulações e ligamentos, não fuga.';

  @override
  String get rhythmInsightPraiseSteady =>
      'É o ritmo que as pessoas mantêm durante anos.';

  @override
  String get rhythmInsightPraiseDense =>
      'Treinas muitas vezes — um calendário assim não se faz sozinho.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Parece que encontraste o modo secreto do corpo.';

  @override
  String get rhythmInsightRecentLighter =>
      'A carga já baixou há pouco — a recuperação ativa pode contar como feita. Retoma o ritmo.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Este ritmo já dura há $weeks semanas.',
      one: 'Este ritmo já dura há $weeks semana.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'Isto é uma recomendação, não um conselho médico. Se te sentes bem, não é preciso mudar nada.';
}
