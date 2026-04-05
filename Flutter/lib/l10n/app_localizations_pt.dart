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
  String get addSet => '+ ADICIONAR SÉRIE';

  @override
  String get addExercise => '+ ADICIONAR EXERCÍCIO';

  @override
  String get finishWorkout => 'FINALIZAR TREINO';

  @override
  String get startWorkout => 'INICIAR TREINO';

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
  String get exerciseHint => 'Digite o nome do exercício';

  @override
  String get deleteFromHistory => 'Remover do histórico?';

  @override
  String get deleteExerciseHint => 'não aparecerá mais nas sugestões.';

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
  String get fillCurrentExerciseBeforeAdd =>
      'Conclua o exercício atual antes de adicionar outro.';

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
  String get addClient => '+ ADICIONAR CLIENTE';

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
      'O IronVibe vem de propósito sem catálogo fixo de exercícios nem programas impostos. Não ensina a treinar — para isso há o YouTube e treinadores de verdade — só ajuda a registar os teus números à tua maneira. Escreves tu os nomes dos movimentos, como os dizes, em vez de os escolher numa lista gigante. Quanto mais usas, mais natural fica: a app adapta-se a ti, não o contrário.';

  @override
  String get instructionSectionSetControl => 'Controle de series';

  @override
  String get instructionSetMinusLabel => 'Menos';

  @override
  String get instructionSetMinusDesc =>
      'Remove a ultima serie. Se houver dados, o app pede confirmacao.';

  @override
  String get instructionSetPlusLabel => 'Mais';

  @override
  String get instructionSetPlusDesc =>
      'Adiciona uma nova linha de serie ao exercicio atual.';

  @override
  String get instructionSetProgressLabel => 'Linha do tempo';

  @override
  String get instructionSetProgressDesc =>
      'Abre a linha do tempo de progresso deste exercicio.';

  @override
  String get instructionSectionProgressChart => 'Grafico de progresso';

  @override
  String get instructionProgressChartIntro =>
      'Duas tendencias por data: vermelho — serie mais pesada do dia (kg/lb); cian — mais repeticoes em uma serie (qualquer peso). Eixo esquerdo: peso; direito: repeticoes.';

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
  String get instructionSectionWorkout => 'Treino';

  @override
  String get instructionAddExerciseTitle => 'Adicionar exercício';

  @override
  String get instructionAddExerciseBody =>
      'Cria um novo bloco para outro tipo de exercício.';

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
      'Com a lista de sugestões aberta sob o nome, toque no X de uma linha para remover esse nome da sua lista pessoal (banco).';

  @override
  String get instructionSectionInputs => 'Dados';

  @override
  String get instructionWeightTitle => 'Peso';

  @override
  String get instructionWeightBody => 'Carga do equipamento (kg/lb).';

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
      'Progresso pessoal serve para acompanhar ganhos exercício a exercício: todos os movimentos registados no histórico aparecem numa tabela para comparar de relance. A pesquisa encontra de imediato o nome pretendido. Acesso a partir do ecrã inicial de treino (botão por baixo do calendário) ou do perfil do cliente.';

  @override
  String get instructionSectionSaving => 'Salvamento';

  @override
  String get instructionFinishTitle => 'Finalizar';

  @override
  String get instructionFinishBody =>
      'Salva todo o treino no histórico. Até você tocar neste botão, os dados não ficam registrados.';

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
      'Treinos concluidos no calendario e estatisticas pelo icone de grafico nas barras do app.';

  @override
  String get instructionNavImportExportTitle => 'Importar / exportar';

  @override
  String get instructionNavImportExportDesc =>
      'Backup ou transferencia com exportacao e importacao JSON na janela de estatisticas.';
}
