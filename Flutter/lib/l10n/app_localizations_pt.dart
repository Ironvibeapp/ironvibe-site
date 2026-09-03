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
  String get instructionTitle => 'Como funciona';

  @override
  String get instructionPhilosophy =>
      'O IronVibe vem de propósito sem catálogo fixo de exercícios nem programas impostos. Não ensina a treinar — para isso há o YouTube e treinadores de verdade — só ajuda a registar os teus números à tua maneira. Escreves tu os nomes dos movimentos. Se quiseres, marcas um grupo muscular para a app montar um treino rápido de corpo todo a partir da tua lista. Quanto mais usas, mais natural fica: a app adapta-se a ti, não o contrário.';

  @override
  String get instructionSectionSetControl => 'Controle de series';

  @override
  String get instructionSetMinusLabel => 'Menos';

  @override
  String get instructionSetMinusDesc =>
      'Remove a última série. Se a linha já tiver peso, repetições ou RIR, o app pede confirmação. Uma linha vazia é removida na hora. Se restar só uma série: no treino atual a linha é limpa; no histórico salvo o exercício inteiro é excluído.';

  @override
  String get instructionSetPlusLabel => 'Mais';

  @override
  String get instructionSetPlusDesc =>
      'Adiciona uma nova linha de série vazia a este exercício.';

  @override
  String get instructionSetProgressLabel => 'Linha do tempo';

  @override
  String get instructionSetProgressDesc =>
      'Abre a linha do tempo de progresso deste exercicio.';

  @override
  String get instructionSectionProgressChart => 'Grafico de progresso';

  @override
  String get instructionProgressChartIntro =>
      'Tres tendencias independentes por data: vermelho — serie mais pesada do dia; cian — mais repeticoes em uma serie; amarelo — volume do exercicio (soma de peso × repeticoes no dia). Eixo esquerdo: peso; direito: repeticoes; a linha amarela e normalizada.';

  @override
  String get instructionProgressLineWeightLabel => 'Peso';

  @override
  String get instructionProgressLineWeightDesc =>
      'Linha vermelha: maior peso em uma serie por dia.';

  @override
  String get instructionProgressLineRepsLabel => 'Repeticoes';

  @override
  String get instructionProgressLineRepsDesc =>
      'Linha cian: maximo de repeticoes em uma serie naquele dia (sem ligacao ao peso maximo).';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Linha amarela: volume diario do exercicio (tonelagem), calculado como soma de peso × repeticoes nas series com ambos os valores.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Durante o treino ativo o botao do grafico abaixo das series pode ganhar as mesmas cores das curvas: vermelho se voce supera seu melhor peso em uma serie; amarelo se o volume total do exercicio supera seu recorde anterior; ciano se o exercicio e so com o corpo e a soma de repeticoes de todas as series supera seu maximo anterior. Se varias condicoes valem, a prioridade e vermelho, depois amarelo, depois ciano. Apenas enquanto registra o treino atual, nao no historico salvo.';

  @override
  String get instructionSectionWorkout => 'Treino';

  @override
  String get instructionAddExerciseTitle => 'Adicionar exercício';

  @override
  String get instructionAddExerciseBody =>
      'Adiciona um bloco novo. Primeiro dá um nome ao exercício atual — a app avisa se o campo ainda estiver vazio.';

  @override
  String get instructionSectionExerciseNameTools => 'Nome do exercício';

  @override
  String get instructionRenameExerciseTitle => 'Toque longo para renomear';

  @override
  String get instructionRenameExerciseDesc =>
      'Mantenha pressionado o nome ao registrar, numa sugestão da lista ou no título de um treino salvo no histórico; o nome é atualizado em todos os lugares.';

  @override
  String get instructionRemoveFromBankTitle => 'Remover da lista';

  @override
  String get instructionRemoveFromBankDesc =>
      'Com a lista de sugestões aberta sob o nome, toque no X de uma linha — ou no X vermelho no Progresso pessoal — para remover esse nome das sugestões e da tabela de progresso. Os treinos gravados não mudam.';

  @override
  String get instructionSectionInputs => 'Dados';

  @override
  String get instructionWeightTitle => 'Peso';

  @override
  String get instructionWeightBody =>
      'Carga do equipamento. Escreve o número em kg ou lb, como treinas. A app não converte unidades.';

  @override
  String get instructionRepsTitle => 'Repetições';

  @override
  String get instructionRepsBody =>
      'Quantidade de repetições realizadas em uma série.';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody =>
      'Quantas repetições você ainda conseguiria fazer antes da falha. Ajuda a controlar a intensidade.';

  @override
  String get instructionOneRmTitle => '1RM (uma repetição máxima)';

  @override
  String get instructionOneRmDesc =>
      'Carga máxima estimada para uma repetição correta com base no peso e nas repetições atuais. Referência chave de força para acompanhar o progresso e escolher cargas de trabalho.';

  @override
  String get instructionExerciseVolumeTitle => 'Volume do exercício (total)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Abaixo das séries, ao lado do botão de progresso: soma de peso × repetições em todas as séries com os dois valores. Atualiza ao editar.';

  @override
  String get instructionSectionPersonalProgress => 'Progresso pessoal';

  @override
  String get instructionPersonalProgressIntro =>
      'Uma tabela de todos os movimentos dos treinos gravados: melhor série, 1RM estimado e volume máximo. A pesquisa encontra o nome de imediato. A estrela marca favoritos; o chip debaixo do nome atribui o grupo muscular; o X vermelho tira o nome das sugestões e desta tabela (os treinos gravados não mudam). Acesso a partir do menu de treino ou do perfil do cliente.';

  @override
  String get instructionSectionSaving => 'Salvamento';

  @override
  String get instructionFinishTitle => 'Finalizar';

  @override
  String get instructionFinishBody =>
      'Confirma e grava a sessão no histórico. Se saíres mais cedo, podes guardar, descartar ou ficar. Se a app for interrompida, o rascunho fica guardado automaticamente.';

  @override
  String get instructionSectionCardio => 'Cardio e intensidade';

  @override
  String get instructionCardioTitle => 'Cardio';

  @override
  String get instructionCardioBody =>
      'Registra tempo e intensidade no cardio (sem distancia). Ajuda a manter o ritmo e o esforco.';

  @override
  String get instructionIntensityTitle => 'Intensidade';

  @override
  String get instructionIntensityBody =>
      'Use a escala de esforco (RPE) para entender o quao pesado foi o treino. Essa e a chave para progredir sem overtraining.';

  @override
  String get instructionSectionStopwatch => 'Cronometro (seu assistente)';

  @override
  String get instructionStopwatchWhyTitle => 'Para que serve?';

  @override
  String get instructionStopwatchWhyBody =>
      'Para controlar o descanso entre series. Descanso curto: maior densidade; descanso longo: mais forca para carga pesada.';

  @override
  String get instructionStopwatchHowTitle => 'Como funciona?';

  @override
  String get instructionStopwatchHowBody =>
      'Centro: tempo, iniciar/pausa e repor. Esquerda e direita: atalhos rapidos (abaixo). No modo cronometro simples o tempo sobe com centesimos. O temporizador fica fixo no topo ao rolar.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Esquerda: intervalos';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 s trabalho, 60 s descanso. 4/4 — 4 minutos trabalho e 4 minutos descanso por ronda. 20/10 — estilo tabata: 20 s a fundo, 10 s pausa. Apos escolher, o temporizador alterna trabalho e descanso em ciclo ate pausar ou repor. Tom avermelhado: trabalho; azulado: descanso.';

  @override
  String get instructionStopwatchRestTitle => 'Direita: descanso';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m e +5m iniciam ou prolongam uma contagem decrescente em minutos. Se um ciclo de intervalos estiver a correr, passa para essa contagem. Se ja houver contagem em curso, os minutos somam ao tempo restante. Util entre series.';

  @override
  String get instructionStopwatchProgressTitle => 'Barra de progresso';

  @override
  String get instructionStopwatchProgressBody =>
      'Na contagem decrescente e nos intervalos, uma barra sob o tempo mostra quanto falta da fase atual.';

  @override
  String get instructionStopwatchSoundsTitle => 'Som e vibracao';

  @override
  String get instructionStopwatchSoundsBody =>
      'A 3, 2 e 1 segundo do fim: som curto na app e vibração leve. Mudança de fase ou contagem a zero: sinal mais forte. Sons mínimos incluídos; sem microfone nem permissão de notificação; o volume do aparelho continua a valer.';

  @override
  String get instructionSectionNavHistory => 'Historico e dados';

  @override
  String get instructionNavHistoryTitle => 'Historico / estatisticas';

  @override
  String get instructionNavHistoryDesc =>
      'No calendario/historico cada treino mostra a tonelagem total. O volume de treino e um dos melhores indicadores de hipertrofia: quanto mais volume de qualidade, mais musculatura voce constroi.';

  @override
  String get instructionNavImportExportTitle => 'Importar / exportar';

  @override
  String get instructionNavImportExportDesc =>
      'Backup ou transferência com exportação e importação JSON na janela de estatísticas. A cópia inclui histórico, lista de exercícios, favoritos e etiquetas de grupo muscular. O backup de treinador é separado do histórico pessoal. Um treinador também pode importar o histórico de um atleta como novo cliente sem misturar os nomes dos exercícios.';

  @override
  String get instructionSectionHome => 'Início';

  @override
  String get instructionThemeTitle => 'Tema';

  @override
  String get instructionThemeDesc =>
      'O interruptor sol / lua no ecrã inicial alterna claro e escuro. A escolha fica memorizada.';

  @override
  String get instructionTrainSelfTitle => 'Treino sozinho';

  @override
  String get instructionTrainSelfDesc =>
      'Os teus treinos, calendário, progresso pessoal, favoritos, um indicador de ritmo de quão frequentemente treinas e um treino rápido de corpo todo a partir dos exercícios etiquetados.';

  @override
  String get instructionTrainOthersTitle => 'Treino outras pessoas';

  @override
  String get instructionTrainOthersDesc =>
      'Modo treinador: clientes, agenda e histórico separado por pessoa. Cada cliente tem a sua tabela de progresso e os seus favoritos.';

  @override
  String get instructionSectionAthleteMenu => 'O teu treino';

  @override
  String get instructionStartWorkoutTitle => 'Começar treino';

  @override
  String get instructionStartWorkoutDesc =>
      'Abre uma sessão vazia — não copia o último treino. Adiciona exercícios, regista as séries e finaliza para guardar.';

  @override
  String get instructionQuickWorkoutTitle => 'Treino rápido';

  @override
  String get instructionQuickWorkoutDesc =>
      'Monta uma sessão de corpo todo com 4 exercícios: peito, costas, uma metade das pernas (coxa anterior ou posterior — nunca ambas) e um de ombros, braços ou core, o grupo que treinas há mais tempo. Prefere favoritos. Os últimos pesos e repetições aparecem a cinzento como mínimo a ultrapassar — cada série é introduzida por ti.';

  @override
  String get instructionCalendarMenuTitle => 'Calendário de treinos';

  @override
  String get instructionCalendarMenuDesc =>
      'Vês em que dias treinaste, abres uma sessão gravada ou adicionas um treino numa data e hora escolhidas — inclusive em dias passados.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabela das melhores séries, 1RM estimado e volume máximo. Aqui marcas favoritos e o grupo muscular.';

  @override
  String get instructionFavoritesMenuTitle => 'Exercícios favoritos';

  @override
  String get instructionFavoritesMenuDesc =>
      'A tua lista com estrela. Marca os que queres e toca em Montar treino para começar nessa ordem. Os últimos pesos e repetições aparecem a cinzento como mínimo a ultrapassar.';

  @override
  String get instructionSectionRhythm => 'Ritmo de treino';

  @override
  String get instructionRhythmIntro =>
      'Após algumas sessões de força, aparece no topo do ecrã de treino um indicador. Mostra quantos dias por semana treinaste em média nas últimas quatro semanas. Dias só de cardio não contam. O número é um retrato da tua densidade, não um objetivo que a app te impõe. Toca para uma nota sobre o teu ritmo e o que é uma semana de recuperação ativa.';

  @override
  String get instructionRhythmGaugeTitle => 'Dias por semana';

  @override
  String get instructionRhythmGaugeDesc =>
      'O arco enche de 1 a 6 dias por semana. A cor vai do aço ao ouro e à ferrugem quando a densidade sobe. O indicador aparece quando há pelo menos três dias de força nessa janela de quatro semanas.';

  @override
  String get instructionRhythmDeloadTitle =>
      'Lembrete de semana de recuperação ativa';

  @override
  String get instructionRhythmDeloadDesc =>
      'Se treinas cerca de dois dias e meio por semana ou mais durante várias semanas sem uma semana de recuperação ativa, a app pode lembrar que às vezes é útil uma semana curta de recuperação ativa — cerca de 30% menos de tonelagem e repetições. Quanto mais dias por semana, mais cedo chega o lembrete. É um lembrete, não uma prescrição. No máximo uma vez por semana, e só no teu modo de treino — não automaticamente para clientes. Toca no indicador de um cliente para a mesma nota.';

  @override
  String get instructionSectionFavorites => 'Favoritos';

  @override
  String get instructionFavoriteStarTitle => 'Estrela';

  @override
  String get instructionFavoriteStarDesc =>
      'No Progresso pessoal, toca na estrela ao lado de um exercício para o adicionar ou tirar dos favoritos. Os favoritos ficam no topo da tabela.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Montar treino';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'No ecrã de favoritos, marca os exercícios. O botão aparece quando há pelo menos um selecionado. Os últimos pesos e repetições aparecem a cinzento como mínimo a ultrapassar — cada série é introduzida por ti. Para um cliente, a mesma ação inicia uma sessão dessa pessoa.';

  @override
  String get instructionSectionMuscleGroups =>
      'Grupos musculares e treino rápido';

  @override
  String get instructionMuscleGroupsIntro =>
      'Os grupos são etiquetas opcionais nos nomes que tu escreveste. Não são um catálogo: só ajudam o treino rápido a escolher um mix equilibrado de corpo todo. Oito grupos: peito, costas, ombros, core, coxa anterior, coxa posterior, flexão de braços, extensão de braços.';

  @override
  String get instructionMuscleGroupTagTitle => 'Como etiquetar';

  @override
  String get instructionMuscleGroupTagDesc =>
      'Na primeira vez que escreves um nome novo, a app pede um grupo. Podes saltar com Mais tarde, ou marcar Não para treino rápido se não quiseres esse movimento no mix. O chip debaixo do nome no Progresso ou Favoritos altera ou limpa a etiqueta.';

  @override
  String get instructionQuickWorkoutHowTitle => 'Como se monta a sessão rápida';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Quatro lugares: peito, costas, uma metade das pernas, depois ombros/braços/core segundo a antiguidade. A pré-visualização deixa trocar qualquer lugar por outro exercício do mesmo grupo. Se for pouco, adiciona exercícios tu.';

  @override
  String get instructionStrengthCardioTitle => 'Força / Cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Seletor no topo da sessão. Força: peso, repetições, RIR. Cardio: só tempo e intensidade — sem campo de distância.';

  @override
  String get instructionPreviousHintsTitle =>
      'Números cinzentos da última sessão';

  @override
  String get instructionPreviousHintsDesc =>
      'Quando escolhes um exercício numa sessão de cliente, num treino rápido ou numa sessão a partir dos favoritos, os últimos pesos e repetições aparecem a cinzento — um mínimo a ultrapassar, não uma série já registada. No histórico entram só os números que escreves tu.';

  @override
  String get instructionRemoveExerciseTitle => 'Remover deste treino';

  @override
  String get instructionRemoveExerciseDesc =>
      'Remove esse bloco só da sessão atual. O histórico gravado não muda até finalizares.';

  @override
  String get instructionReassignExerciseTitle =>
      'Trocar exercício no histórico';

  @override
  String get instructionReassignExerciseDesc =>
      'Num treino gravado podes reatribuir um bloco a outro nome. Só essa sessão muda; os gráficos seguem o nome novo. As séries ficam como estavam.';

  @override
  String get instructionAutoSaveTitle => 'Treino interrompido';

  @override
  String get instructionAutoSaveDesc =>
      'Se a app fechar a meio da sessão, oferece continuar de onde paraste ou apagar o rascunho não gravado.';

  @override
  String get instructionSectionCalendar => 'Calendário';

  @override
  String get instructionCalendarAddTitle => 'Adicionar numa data';

  @override
  String get instructionCalendarAddDesc =>
      'Escolhe um dia e adiciona um treino à hora escolhida. Útil para registar uma sessão em falta.';

  @override
  String get instructionSectionTrainer => 'Modo treinador';

  @override
  String get instructionTrainerIntro =>
      '«Treino outras pessoas» é para treinadores. Adiciona clientes, agenda sessões, planeia exercícios à frente e regista treinos por pessoa. Repetir a última sessão é opcional. Exportar e importar dados de treinador é separado do histórico pessoal. Apagar um cliente remove sessões futuras; os treinos passados ficam para o relatório.';

  @override
  String get instructionClientsTitle => 'Clientes';

  @override
  String get instructionClientsDesc =>
      'Adicionar, editar ou eliminar clientes. A lista mostra a última e a próxima sessão. Campos do perfil: objetivo, peso, altura e notas privadas do treinador.';

  @override
  String get instructionClientProfileTitle => 'Perfil do cliente';

  @override
  String get instructionClientProfileDesc =>
      'No perfil começa uma sessão de hoje vazia. Os números cinzentos da última vez aparecem só depois de escolheres um exercício. O histórico mostra só treinos concluídos. Planeia datas futuras no calendário. Progresso e favoritos estão no mesmo ecrã. Se houver força recente suficiente, um indicador mostra com que frequência treina; toca para uma nota sobre ritmo e descanso. Alterações de perfil por gravar pedem confirmação ao sair.';

  @override
  String get instructionTrainerPlanTitle => 'Planear uma sessão';

  @override
  String get instructionTrainerPlanDesc =>
      'Planeia só no calendário do treinador: escolhe cliente e data, depois os exercícios. Pesos e repetições anteriores aparecem a cinzento como dica. Uma sessão planeada tem o ícone de play: toca para começar (hoje) ou apagar. No histórico só entram treinos concluídos. Um plano com data já passada é removido.';

  @override
  String get instructionTrainerRepeatTitle => 'Repetir o último treino';

  @override
  String get instructionTrainerRepeatDesc =>
      'Opcional. No perfil do cliente, ou como interruptor ao adicionar uma sessão no calendário. Copia os exercícios da última sessão para o treino ao vivo de hoje ou para um plano novo; pesos e repetições anteriores são dicas cinzentas, não séries já feitas.';

  @override
  String get printSession => 'Imprimir';

  @override
  String get printSessionEmpty =>
      'Ainda não há nada para imprimir. Regista pelo menos uma série.';

  @override
  String get printSessionShareText => 'Sessão IronVibe';

  @override
  String get instructionPrintSessionTitle => 'Imprimir uma sessão';

  @override
  String get instructionPrintSessionDesc =>
      'Num treino de cliente concluído, o ícone de impressão no cabeçalho monta uma folha A4 desse dia tal como foi registado. Partilha, guarda ou imprime a partir da folha do sistema.';

  @override
  String get rhythmPerWeek => 'por semana';

  @override
  String get deloadNudgeTitle => 'Uma semana de recuperação ativa?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Treinas cerca de $rate dias por semana há cerca de $weeks semanas. É um lembrete de que às vezes é útil uma semana curta de recuperação ativa — cerca de 30% menos de tonelagem e repetições. Não é uma prescrição.';
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
    return 'Nas últimas quatro semanas treinas cerca de $rate dias por semana.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name treina cerca de $rate dias por semana nas últimas quatro semanas.';
  }

  @override
  String get rhythmInsightWindow =>
      'Só contam os dias de força. Dias só de cardio não entram. É um retrato da densidade, não um objetivo.';

  @override
  String get rhythmInsightWhatTitle => 'Semana de recuperação ativa';

  @override
  String get rhythmInsightWhatBody =>
      'Baixas a carga de propósito para recuperar sem perder forma: os mesmos treinos, mas cerca de 30–50% menos volume. Ou saltas os dias de força e ficas em movimento.';

  @override
  String get rhythmInsightAdviceLight =>
      'Agora o ritmo está calmo. Se as sessões não forem extremas, dá para ir muito tempo sem uma semana de recuperação ativa planeada.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Agora é um ritmo estável. Se o trabalho é duro, uma semana de recuperação ativa de uns em uns meses costuma chegar.';

  @override
  String get rhythmInsightAdviceDense =>
      'Agora o calendário está denso. Se as sessões são intensas, uma semana de recuperação ativa a cada dois ou três meses convém ter em mente.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Agora é quase todos os dias. Se a carga é alta, uma semana de recuperação ativa cerca de uma vez por mês muitos consideram razoável.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Bem. É exactamente neste ritmo que se sustentam os progressos longos.';

  @override
  String get rhythmInsightPraiseDense => 'Mesmo dedicado. Continua assim.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Parece que estás a tentar desbloquear as capacidades secretas do teu organismo.';

  @override
  String get rhythmInsightRecentLighter =>
      'Nos dados recentes já se vê uma semana de recuperação ativa.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    return 'Cerca de $weeks semanas nesta densidade sem uma semana de recuperação ativa.';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'É uma nota de referência, não uma prescrição. Só lembra que às vezes é útil uma semana curta de recuperação ativa. Se te sentes bem, não precisas de mudar nada.';

  @override
  String get instructionHubManifest =>
      'Sem catálogo nem programas prontos. Você nomeia os exercícios; o app guarda as estatísticas do seu jeito.';

  @override
  String get instructionChapterStartTitle => 'Primeiros passos';

  @override
  String get instructionChapterStartBlurb =>
      'Tela inicial, como você treina e por que o app não ensina a treinar.';

  @override
  String get instructionChapterToolsTitle => 'Ferramentas';

  @override
  String get instructionChapterToolsBlurb =>
      'Ritmo, favoritos, grupos musculares e treino rápido.';

  @override
  String get instructionChapterSessionTitle => 'Na sessão';

  @override
  String get instructionChapterSessionBlurb =>
      'Séries, campos, cardio, salvar e o cronômetro.';

  @override
  String get instructionChapterProgressTitle => 'Progresso e dados';

  @override
  String get instructionChapterProgressBlurb =>
      'Recordes, gráfico, calendário, histórico e backup.';

  @override
  String get instructionChapterCoachTitle => 'Modo treinador';

  @override
  String get instructionChapterCoachBlurb =>
      'Clientes, perfis, sessões planejadas e repetir um treino.';

  @override
  String get instructionSearchHint => 'Pesquisar no guia';

  @override
  String get instructionSearchEmpty => 'Nada corresponde a essa busca.';
}
