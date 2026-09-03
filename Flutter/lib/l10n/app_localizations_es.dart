// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'IronVibe';

  @override
  String get slogan => 'TU VIBRA DE ENTRENAMIENTO';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancelar';

  @override
  String get renameExerciseTitle => 'Renombrar ejercicio';

  @override
  String get renameExerciseEmpty => 'El nombre no puede estar vacío';

  @override
  String get reassignHistoryExerciseTitle => 'Cambiar ejercicio';

  @override
  String get reassignHistoryExerciseBody =>
      'Solo cambia este entreno. Las series se mantienen; el progreso sigue el nuevo nombre del ejercicio.';

  @override
  String get delete => 'Eliminar';

  @override
  String get yesDelete => 'Sí, eliminar';

  @override
  String get close => 'Cerrar';

  @override
  String get save => 'Guardar';

  @override
  String get add => 'Añadir';

  @override
  String get trainOthers => 'ENTRENO A OTROS';

  @override
  String get trainSelf => 'ME ENTRENO YO';

  @override
  String get statistics => 'ESTADÍSTICAS';

  @override
  String get exportHistory => 'EXPORTAR HISTORIAL';

  @override
  String get historyEmpty =>
      'El historial está vacío, aún no hay nada que exportar.';

  @override
  String get exportError => 'Error al exportar:';

  @override
  String get exportJson => 'EXPORTAR JSON';

  @override
  String get importData => 'IMPORTAR';

  @override
  String get importSuccess => 'Datos importados correctamente';

  @override
  String get importError => 'Error al importar:';

  @override
  String get importNewerVersion => 'Archivo de una versión más nueva de la app';

  @override
  String get importFileAccessError => 'Error de acceso al archivo';

  @override
  String get importInvalidJson => 'Formato JSON no válido';

  @override
  String get importInvalidBackupFile =>
      'Error: archivo de copia de seguridad no válido seleccionado';

  @override
  String get importAthlete => 'IMPORTAR ATLETA';

  @override
  String importAthleteFound(int count) {
    return 'Se encontraron registros de $count entrenamientos de un atleta que no está en la lista.';
  }

  @override
  String get importAthleteBackupOwn => 'GUARDAR MIS DATOS PRIMERO';

  @override
  String get importAthleteDecline => 'No añadir';

  @override
  String get importAthleteSuccess => 'Atleta añadido';

  @override
  String get importAthleteNotAthleteFile =>
      'Este archivo no es un historial de entrenamientos de un atleta.';

  @override
  String get importAthleteEmpty =>
      'No se encontraron entrenamientos en este archivo.';

  @override
  String get importAthleteAlreadyImported =>
      'Estos entrenamientos ya están en este dispositivo.';

  @override
  String get importAthleteUseDedicatedButton =>
      'Esto parece el historial de un atleta. Usa Importar atleta.';

  @override
  String get shareText => 'Historial de entrenamientos IronVibe';

  @override
  String get monthStats => 'ESTE MES';

  @override
  String get yearStats => 'ESTE AÑO';

  @override
  String get allTimeStats => 'TODO EL TIEMPO';

  @override
  String get weight => 'Peso';

  @override
  String get reps => 'Repeticiones';

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
  String get addSet => 'AÑADIR SERIE';

  @override
  String get addExercise => 'AÑADIR EJERCICIO';

  @override
  String get finishWorkout => 'FINALIZAR ENTRENAMIENTO';

  @override
  String get finishWorkoutConfirmTitle => '¿Terminar entrenamiento?';

  @override
  String get finishWorkoutConfirmBody => 'El entrenamiento se guardará.';

  @override
  String get finishWorkoutConfirmAction => 'Terminar';

  @override
  String get workoutCompleteTitle => 'Entrenamiento guardado';

  @override
  String get planChangesSavedTitle => 'Cambios guardados';

  @override
  String get startWorkout => 'INICIAR ENTRENAMIENTO';

  @override
  String get quickWorkout => 'ENTRENO RÁPIDO';

  @override
  String get quickWorkoutFullBody => 'CUERPO COMPLETO';

  @override
  String get quickWorkoutInsufficientTitle => 'Datos insuficientes';

  @override
  String get quickWorkoutInsufficientBody =>
      'Un entreno rápido necesita ejercicios de pecho, espalda, un grupo de pierna (muslo anterior o posterior) y uno de hombros, brazos o core. Márcalos en Progreso personal — o sigue registrando: la app preguntará al introducir un ejercicio nuevo.';

  @override
  String get quickWorkoutOpenProgress => 'ABRIR PROGRESO PERSONAL';

  @override
  String get quickWorkoutPreviewTitle => 'ENTRENO RÁPIDO · CUERPO COMPLETO';

  @override
  String get quickWorkoutStart => 'EMPEZAR';

  @override
  String get quickWorkoutSwap => 'Cambiar';

  @override
  String get quickWorkoutNoAlternatives =>
      'No hay otro ejercicio en este grupo';

  @override
  String get muscleGroupPromptTitle => 'Grupo muscular';

  @override
  String get muscleGroupPromptBody =>
      'Sirve para el entreno rápido de cuerpo completo.';

  @override
  String get muscleGroupLater => 'Más tarde';

  @override
  String get muscleGroupClear => 'Quitar';

  @override
  String get muscleGroupSkip => 'No para entreno rápido';

  @override
  String get muscleGroupChest => 'Pecho';

  @override
  String get muscleGroupBack => 'Espalda';

  @override
  String get muscleGroupShoulders => 'Hombros';

  @override
  String get muscleGroupCore => 'Core';

  @override
  String get muscleGroupQuads => 'Muslo anterior';

  @override
  String get muscleGroupHamstrings => 'Muslo posterior';

  @override
  String get muscleGroupArmFlex => 'Flexión de brazos';

  @override
  String get muscleGroupArmExt => 'Extensión de brazos';

  @override
  String get muscleGroupUntagged => '—';

  @override
  String get calendarWorkouts => 'CALENDARIO DE ENTRENAMIENTOS';

  @override
  String get personalProgress => 'PROGRESO PERSONAL';

  @override
  String get personalProgressSearchHint => 'Buscar ejercicio';

  @override
  String get personalProgressBestSet => 'Mejor serie';

  @override
  String get personalProgressMaxVolume => 'Vol. máx.';

  @override
  String get personalProgressEmpty => 'Aún no hay ejercicios en los entrenos';

  @override
  String get favoriteExercises => 'EJERCICIOS FAVORITOS';

  @override
  String get favoriteExercisesEmpty => 'Aún no hay ejercicios favoritos';

  @override
  String get buildWorkoutFromFavorites => 'ARMAR ENTRENO';

  @override
  String get exerciseHint => 'Introduce el nombre del ejercicio';

  @override
  String get deleteFromHistory => '¿Eliminar del historial?';

  @override
  String get deleteExerciseHint =>
      'ya no aparecerá en las sugerencias ni en el progreso personal.';

  @override
  String get exerciseDeleted => 'eliminado';

  @override
  String get deleteWorkoutTitle => 'ELIMINAR';

  @override
  String get deleteWorkoutMsg =>
      '¿Eliminar este entrenamiento? Se perderá el historial de progreso.';

  @override
  String get removeSetWithDataConfirm =>
      '¿Eliminar serie con datos? Esta acción no se puede deshacer.';

  @override
  String get removeExerciseFromWorkout => 'Quitar ejercicio';

  @override
  String get removeExerciseFromWorkoutConfirm =>
      '¿Quitar este ejercicio del entrenamiento? Esta acción no se puede deshacer.';

  @override
  String get deleteClientTitle => 'ELIMINAR CLIENTE';

  @override
  String get deleteClientMsg =>
      '¿Seguro que quieres eliminar este cliente? Se eliminarán todas sus futuras sesiones.';

  @override
  String get noClientsTitle => 'SIN CLIENTES';

  @override
  String get noClientsMsg => 'Añade clientes primero en el menú «Clientes».';

  @override
  String get newClient => 'NUEVO CLIENTE';

  @override
  String get editClient => 'EDITAR';

  @override
  String get clientName => 'Nombre';

  @override
  String get clientNameCannotChange => 'El nombre no se puede cambiar después.';

  @override
  String get clientNameTaken => 'Este nombre ya está en uso. Elige otro.';

  @override
  String get clientGoal => 'Objetivo';

  @override
  String get clientWeight => 'Peso';

  @override
  String get clientHeight => 'Altura';

  @override
  String get clientNotes => 'Notas';

  @override
  String get saveClientChanges => 'GUARDAR CAMBIOS';

  @override
  String get clientProfileUnsavedTitle => 'Cambios sin guardar';

  @override
  String get clientProfileUnsavedMessage =>
      'Hay cambios sin guardar. ¿Guardar antes de salir?';

  @override
  String get clientProfileStay => 'Quedarse';

  @override
  String get clientProfileDiscard => 'Salir sin guardar';

  @override
  String get clientProfileSaveAndLeave => 'Guardar y salir';

  @override
  String get workoutRecoveryTitle => 'Entrenamiento interrumpido';

  @override
  String get workoutRecoveryMessage =>
      'Tu entrenamiento anterior terminó de forma inesperada. Continúa donde lo dejaste o elimina los datos no guardados.';

  @override
  String get workoutRecoveryContinue => 'Continuar entrenamiento';

  @override
  String get workoutRecoveryDelete => 'Eliminar entrenamiento';

  @override
  String get workoutRecoverySessionMissing =>
      'Se eliminó el entrenamiento programado del cliente. El borrador no guardado se ha borrado.';

  @override
  String get fillCurrentExerciseBeforeAdd =>
      'Termina el ejercicio actual antes de añadir otro.';

  @override
  String get switchWorkoutTypeTitle => '¿Cambiar el tipo de entrenamiento?';

  @override
  String get switchWorkoutTypeBody =>
      'Las series del otro tipo no se guardarán en este entrenamiento.';

  @override
  String get switchWorkoutTypeConfirm => 'Cambiar';

  @override
  String get saveWorkoutNothingToSave =>
      'Aún no hay nada que guardar. Añade peso y repeticiones, o duración de cardio.';

  @override
  String get importedHistoryBadge => 'Importado';

  @override
  String get clientWorkoutHistoryEmpty => 'Aún no hay entrenos';

  @override
  String exerciseNumberedTitle(int n) {
    return 'Ejercicio n.º $n';
  }

  @override
  String exerciseNumberedTitleWithName(int n, String exerciseName) {
    return 'Ejercicio n.º $n: $exerciseName';
  }

  @override
  String exerciseNumberLabel(int n) {
    return 'n.º $n';
  }

  @override
  String get clientProfileSectionGoal => 'OBJETIVO';

  @override
  String get clientProfileSectionAnthropometry => 'ANTROPOMETRÍA';

  @override
  String get clientProfileSectionTrainerNotes => 'NOTAS DEL ENTRENADOR';

  @override
  String get clientProfileSectionWorkoutHistory => 'HISTORIAL DE ENTRENOS';

  @override
  String get clientTrainerNotesHint => 'Lesiones, detalles, plan…';

  @override
  String get trainerSessionDefaultTitle => 'Entrenamiento';

  @override
  String get durationMinutesShort => 'min';

  @override
  String get addTraining => 'AÑADIR ENTRENAMIENTO';

  @override
  String get repeatLastWorkout => 'Repetir el último entreno';

  @override
  String get repeatLastUnavailable =>
      'Este cliente aún no tiene un entreno para repetir.';

  @override
  String get editPlan => 'Editar plan';

  @override
  String get trainerSessionEmpty => 'Aún no planificado';

  @override
  String trainerSessionPlanned(int n) {
    return '$n planificados';
  }

  @override
  String get trainerClientsEmpty =>
      'Aún no hay clientes. Añade a alguien para empezar a programar.';

  @override
  String get clientNeverTrained => 'Aún no hay entrenos';

  @override
  String get clientNoUpcoming => 'Sin sesión próxima';

  @override
  String clientLastSession(String when) {
    return 'Último: $when';
  }

  @override
  String clientNextSession(String when) {
    return 'Próximo: $when';
  }

  @override
  String get clientSessionToday => 'hoy';

  @override
  String get clientSessionYesterday => 'ayer';

  @override
  String get clientSessionTomorrow => 'mañana';

  @override
  String clientSessionDaysAgo(int n) {
    return 'hace $n días';
  }

  @override
  String clientSessionInDays(int n) {
    return 'en $n días';
  }

  @override
  String get clientProfileDetails => 'Perfil';

  @override
  String get addSessionPickClient => 'Elige un cliente';

  @override
  String get clientLabel => 'Cliente';

  @override
  String get deleteClientBtn => 'ELIMINAR CLIENTE';

  @override
  String get clientsMenu => 'CLIENTES';

  @override
  String get dateHeader => 'Fecha';

  @override
  String get clientHeader => 'Cliente';

  @override
  String get exerciseHeader => 'Ejercicio';

  @override
  String get typeHeader => 'Tipo';

  @override
  String get strengthType => 'Fuerza';

  @override
  String get cardioType => 'Cardio';

  @override
  String get weightHeader => 'Peso';

  @override
  String get weightUnitsChoiceShort => 'kg / lb';

  @override
  String get progressChartWeightLegend => 'Peso — kg / lb (como anotas)';

  @override
  String get progressChartVolumeLegend => 'Volumen (tonelaje)';

  @override
  String get repsHeader => 'Repeticiones';

  @override
  String get rirHeader => 'RIR';

  @override
  String get durationHeader => 'Tiempo (min)';

  @override
  String get intensityHeader => 'Intensidad';

  @override
  String get setHeader => 'Serie';

  @override
  String get strength => 'Fuerza';

  @override
  String get cardio => 'Cardio';

  @override
  String get timeMin => 'Tiempo (min)';

  @override
  String get intensity => 'Intensidad';

  @override
  String get reserve => 'Reserva';

  @override
  String get sets => 'Series';

  @override
  String get time => 'Tiempo';

  @override
  String get rest => 'Descanso';

  @override
  String get settings => 'Ajustes';

  @override
  String get max => 'Máximo';

  @override
  String get totalVolume => 'Volumen total';

  @override
  String get chart => 'Gráfico';

  @override
  String get progress => 'Progreso';

  @override
  String get dayMonday => 'Lunes';

  @override
  String get dayTuesday => 'Martes';

  @override
  String get dayWednesday => 'Miércoles';

  @override
  String get dayThursday => 'Jueves';

  @override
  String get dayFriday => 'Viernes';

  @override
  String get daySaturday => 'Sábado';

  @override
  String get daySunday => 'Domingo';

  @override
  String get greetingHi => 'Hola';

  @override
  String get greetingMorning => 'Buenos días';

  @override
  String get greetingAfternoon => 'Buenas tardes';

  @override
  String get greetingEvening => 'Buenas noches';

  @override
  String get monthJanuary => 'Enero';

  @override
  String get monthFebruary => 'Febrero';

  @override
  String get monthMarch => 'Marzo';

  @override
  String get monthApril => 'Abril';

  @override
  String get monthMay => 'Mayo';

  @override
  String get monthJune => 'Junio';

  @override
  String get monthJuly => 'Julio';

  @override
  String get monthAugust => 'Agosto';

  @override
  String get monthSeptember => 'Septiembre';

  @override
  String get monthOctober => 'Octubre';

  @override
  String get monthNovember => 'Noviembre';

  @override
  String get monthDecember => 'Diciembre';

  @override
  String get exerciseBenchPress => 'Press de banca';

  @override
  String get exerciseSquat => 'Sentadilla';

  @override
  String get exerciseRow => 'Remo';

  @override
  String get exerciseDeadlift => 'Peso muerto';

  @override
  String get exerciseOverheadPress => 'Press militar';

  @override
  String get exercisePullUp => 'Dominada';

  @override
  String get exerciseLunges => 'Zancadas';

  @override
  String get exercisePlank => 'Plancha';

  @override
  String get saveWorkout => 'GUARDAR ENTRENAMIENTO';

  @override
  String get deleteWorkout => 'ELIMINAR ENTRENAMIENTO';

  @override
  String get deleteTraining => 'Eliminar entrenamiento';

  @override
  String get deleteTrainingQuestion =>
      '¿Eliminar este entrenamiento del calendario?';

  @override
  String get addSetButton => 'Añadir serie';

  @override
  String get progressButton => 'Progreso';

  @override
  String get filterMonth => 'Mes';

  @override
  String get filterYear => 'Año';

  @override
  String get filterAllTime => 'Todo';

  @override
  String get noteLabel => 'Nota';

  @override
  String get addClient => 'AÑADIR CLIENTE';

  @override
  String get workoutsToday => 'ENTRENAMIENTOS DE HOY';

  @override
  String get workoutNumberPrefix => 'Entrenamiento #';

  @override
  String get noEntries => 'Sin registros';

  @override
  String get footerWebsite => 'ironvibe.app';

  @override
  String get footerPrivacyPolicy => 'Política de privacidad';

  @override
  String get instructionButton => 'GUÍA';

  @override
  String get instructionTitle => 'Cómo funciona';

  @override
  String get instructionPhilosophy =>
      'IronVibe no trae una biblioteca de ejercicios fija ni programas impuestos: es deliberado. No te enseña a entrenar — para eso están YouTube y un entrenador — solo te ayuda a llevar tus datos a tu manera. Escribes tú los nombres de los ejercicios. Si quieres, marcas un grupo muscular para que la app arme un entreno rápido de cuerpo completo con tu propia lista. Cuanto más la usas, más cómoda se siente: la app se adapta a ti, no al revés.';

  @override
  String get instructionSectionSetControl => 'Control de series';

  @override
  String get instructionSetMinusLabel => 'Menos';

  @override
  String get instructionSetMinusDesc =>
      'Elimina la última serie. Si la fila ya tiene peso, repeticiones o RIR, la app pide confirmación. Una fila vacía se quita al momento. Si queda solo una serie: en el entrenamiento actual se vacía la fila; en el historial guardado se elimina todo el ejercicio.';

  @override
  String get instructionSetPlusLabel => 'Más';

  @override
  String get instructionSetPlusDesc =>
      'Añade una nueva fila de serie vacía a este ejercicio.';

  @override
  String get instructionSetProgressLabel => 'Cronología';

  @override
  String get instructionSetProgressDesc =>
      'Abre la linea de tiempo de progreso de este ejercicio.';

  @override
  String get instructionSectionProgressChart => 'Grafico de progreso';

  @override
  String get instructionProgressChartIntro =>
      'Tres tendencias independientes por fecha: rojo — serie mas pesada del dia; cyan — mas repeticiones en una serie; amarillo — volumen del ejercicio (suma de peso × repeticiones del dia). Eje izquierdo: peso; derecho: repeticiones; la linea amarilla se muestra normalizada.';

  @override
  String get instructionProgressLineWeightLabel => 'Peso';

  @override
  String get instructionProgressLineWeightDesc =>
      'Linea roja: mayor peso en una serie por dia.';

  @override
  String get instructionProgressLineRepsLabel => 'Repeticiones';

  @override
  String get instructionProgressLineRepsDesc =>
      'Linea cyan: maximo de repeticiones en una serie ese dia (no ligado al peso maximo).';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Linea amarilla: volumen diario del ejercicio (tonelaje), calculado como la suma de peso × repeticiones en series con ambos valores.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'Durante un entreno activo el boton del grafico bajo las series puede teñirse como las curvas: rojo si superas tu mejor peso en una serie; amarillo si el volumen total del ejercicio supera tu mejor marca anterior; cian si el ejercicio es sin peso y la suma de repeticiones de todas las series supera tu maximo anterior. Si varias condiciones se cumplen, la prioridad es rojo, luego amarillo, luego cian. Solo mientras registras el entreno actual, no en el historial guardado.';

  @override
  String get instructionSectionWorkout => 'Entrenamiento';

  @override
  String get instructionAddExerciseTitle => 'Añadir ejercicio';

  @override
  String get instructionAddExerciseBody =>
      'Añade un bloque nuevo. Primero pon nombre al ejercicio actual: la app te avisa si el campo sigue vacío.';

  @override
  String get instructionSectionExerciseNameTools => 'Nombre del ejercicio';

  @override
  String get instructionRenameExerciseTitle => 'Pulsacion larga para renombrar';

  @override
  String get instructionRenameExerciseDesc =>
      'Mantenga pulsado el nombre al registrar, una sugerencia en la lista o el titulo en un entreno guardado en el historial; el nombre se actualiza en todas partes.';

  @override
  String get instructionRemoveFromBankTitle => 'Quitar de la lista';

  @override
  String get instructionRemoveFromBankDesc =>
      'Con la lista de sugerencias abierta bajo el nombre, pulse la X de una fila — o la X roja en Progreso personal — para quitar ese nombre de las sugerencias y de la tabla de progreso. Los entrenos guardados no cambian.';

  @override
  String get instructionSectionInputs => 'Datos';

  @override
  String get instructionWeightTitle => 'Peso';

  @override
  String get instructionWeightBody =>
      'Peso de la carga. Escribe el número en kg o lb, como entrenes. La app no convierte unidades.';

  @override
  String get instructionRepsTitle => 'Repeticiones';

  @override
  String get instructionRepsBody =>
      'Cantidad de repeticiones realizadas en una serie.';

  @override
  String get instructionRirTitle => 'RIR';

  @override
  String get instructionRirBody =>
      'Cuántas repeticiones más podrías hacer antes del fallo. Ayuda a controlar la intensidad.';

  @override
  String get instructionOneRmTitle => '1RM (una repeticion maxima)';

  @override
  String get instructionOneRmDesc =>
      'Peso maximo estimado para una repeticion correcta segun tu peso y repeticiones actuales. Referencia clave de fuerza para el progreso y cargas de trabajo.';

  @override
  String get instructionExerciseVolumeTitle => 'Volumen del ejercicio (total)';

  @override
  String get instructionExerciseVolumeDesc =>
      'Debajo de las series, junto al botón de progreso: suma de peso × repeticiones en todas las series con ambos datos. Se actualiza al escribir.';

  @override
  String get instructionSectionPersonalProgress => 'Progreso personal';

  @override
  String get instructionPersonalProgressIntro =>
      'Una tabla con todos los movimientos de los entrenos guardados: mejor serie, 1RM estimado y volumen máximo. El buscador encuentra el nombre al momento. La estrella marca favoritos; el chip bajo el nombre asigna el grupo muscular; la X roja quita el nombre de sugerencias y de esta tabla (los entrenos guardados no cambian). Acceso desde el menú de entrenamiento o el perfil del cliente.';

  @override
  String get instructionSectionSaving => 'Guardado';

  @override
  String get instructionFinishTitle => 'Finalizar';

  @override
  String get instructionFinishBody =>
      'Confirma y guarda la sesión en el historial. Si sales antes, puedes guardar, descartar o quedarte. Si la app se interrumpe, el borrador se conserva solo.';

  @override
  String get instructionSectionCardio => 'Cardio e intensidad';

  @override
  String get instructionCardioTitle => 'Cardio';

  @override
  String get instructionCardioBody =>
      'Registra tiempo e intensidad en cardio (sin distancia). Ayuda a mantener el ritmo y el esfuerzo.';

  @override
  String get instructionIntensityTitle => 'Intensidad';

  @override
  String get instructionIntensityBody =>
      'Usa la escala de esfuerzo (RPE) para entender que tan exigente fue el entrenamiento. Es la clave para progresar sin sobreentrenarte.';

  @override
  String get instructionSectionStopwatch => 'Cronometro (tu asistente)';

  @override
  String get instructionStopwatchWhyTitle => 'Para que sirve?';

  @override
  String get instructionStopwatchWhyBody =>
      'Para controlar el descanso entre series. Descanso corto: mayor densidad; descanso largo: mas fuerza para peso pesado.';

  @override
  String get instructionStopwatchHowTitle => 'Como funciona?';

  @override
  String get instructionStopwatchHowBody =>
      'Centro: tiempo, reproducir/pausa y reiniciar. Izquierda y derecha: accesos rapidos (ver abajo). En modo cronometro puro el tiempo sube con centesimas. El temporizador permanece fijado en la cabecera al desplazarte.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Izquierda: intervalos';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — 60 s de trabajo, 60 s de descanso. 4/4 — 4 min de trabajo y 4 min de descanso por ronda. 20/10 — estilo tabata: 20 s activos, 10 s de pausa. Tras elegir uno, el temporizador alterna trabajo y descanso en bucle hasta que pauses o reinicies. Tono rojizo: trabajo; azulado: descanso.';

  @override
  String get instructionStopwatchRestTitle => 'Derecha: descanso';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m y +5m inician o alargan una cuenta atras en minutos. Si habia un ciclo de intervalos, pasa a esa cuenta atras. Si ya habia una cuenta atras en marcha, los minutos se suman al tiempo restante. Util entre series.';

  @override
  String get instructionStopwatchProgressTitle => 'Barra de progreso';

  @override
  String get instructionStopwatchProgressBody =>
      'En cuenta atras e intervalos, una barra bajo el tiempo muestra cuanto queda de la fase actual.';

  @override
  String get instructionStopwatchSoundsTitle => 'Sonido y vibracion';

  @override
  String get instructionStopwatchSoundsBody =>
      'A 3, 2 y 1 segundos del final: sonido corto dentro de la app y vibracion ligera. Al cambiar de fase o al llegar a cero: senal mas fuerte. Clips minimos incluidos; sin microfono ni permiso de notificaciones; el volumen del dispositivo sigue aplicando.';

  @override
  String get instructionSectionNavHistory => 'Historial y datos';

  @override
  String get instructionNavHistoryTitle => 'Historial / estadisticas';

  @override
  String get instructionNavHistoryDesc =>
      'En calendario/historial cada entrenamiento muestra el tonelaje total. El volumen de entrenamiento es uno de los mejores indicadores de hipertrofia: cuanto mas volumen de calidad acumulas, mas musculo construyes.';

  @override
  String get instructionNavImportExportTitle => 'Importar / exportar';

  @override
  String get instructionNavImportExportDesc =>
      'Copia de seguridad o traslado con exportación e importación JSON en el diálogo de estadísticas. La copia incluye historial, lista de ejercicios, favoritos y etiquetas de grupo muscular. La copia del entrenador es independiente del historial personal. Un entrenador también puede importar el historial de un atleta como cliente nuevo sin mezclar los nombres de los ejercicios.';

  @override
  String get instructionSectionHome => 'Inicio';

  @override
  String get instructionThemeTitle => 'Tema';

  @override
  String get instructionThemeDesc =>
      'El interruptor sol / luna en la pantalla de inicio cambia entre claro y oscuro. La elección se recuerda.';

  @override
  String get instructionTrainSelfTitle => 'Entreno yo';

  @override
  String get instructionTrainSelfDesc =>
      'Tus entrenos, calendario, progreso personal, favoritos, un indicador de ritmo de cuánto entrenas y un entreno rápido de cuerpo completo a partir de tus ejercicios etiquetados.';

  @override
  String get instructionTrainOthersTitle => 'Entreno a otros';

  @override
  String get instructionTrainOthersDesc =>
      'Modo entrenador: clientes, agenda e historial aparte por persona. Cada cliente tiene su tabla de progreso y sus favoritos.';

  @override
  String get instructionSectionAthleteMenu => 'Tu entrenamiento';

  @override
  String get instructionStartWorkoutTitle => 'Empezar entreno';

  @override
  String get instructionStartWorkoutDesc =>
      'Abre una sesión vacía — no copia el último entreno. Añade ejercicios, registra series y finaliza para guardar.';

  @override
  String get instructionQuickWorkoutTitle => 'Entreno rápido';

  @override
  String get instructionQuickWorkoutDesc =>
      'Arma una sesión de cuerpo completo con 4 ejercicios: pecho, espalda, una mitad de pierna (muslo anterior o posterior — nunca ambos) y uno de hombros, brazos o core, el que más tiempo lleves sin entrenar. Prefiere favoritos. Los últimos pesos y repeticiones aparecen en gris como mínimo a superar — cada serie la registras tú.';

  @override
  String get instructionCalendarMenuTitle => 'Calendario de entrenos';

  @override
  String get instructionCalendarMenuDesc =>
      'Ves qué días entrenaste, abres una sesión guardada o añades un entreno en una fecha y hora concretas — también en días pasados.';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabla de mejores series, 1RM estimado y volumen máximo. Aquí marcas favoritos y el grupo muscular.';

  @override
  String get instructionFavoritesMenuTitle => 'Ejercicios favoritos';

  @override
  String get instructionFavoritesMenuDesc =>
      'Tu lista con estrella. Marca los que quieras y pulsa Armar entreno para empezar en ese orden. Los últimos pesos y repeticiones aparecen en gris como mínimo a superar.';

  @override
  String get instructionSectionRhythm => 'Ritmo de entrenamiento';

  @override
  String get instructionRhythmIntro =>
      'Tras unas cuantas sesiones de fuerza, arriba en tu pantalla de entrenamiento aparece un indicador. Muestra cuántos días por semana has entrenado de media en las últimas cuatro semanas. Los días solo de cardio no cuentan. El número es una foto de tu densidad, no un objetivo que la app te imponga. Tócalo para una nota sobre tu ritmo y qué es una semana de descanso activo.';

  @override
  String get instructionRhythmGaugeTitle => 'Días por semana';

  @override
  String get instructionRhythmGaugeDesc =>
      'El arco se llena de 1 a 6 días por semana. El color pasa del acero al oro y hacia el óxido cuando sube la densidad. El indicador aparece cuando hay al menos tres días de fuerza en esa ventana de cuatro semanas.';

  @override
  String get instructionRhythmDeloadTitle =>
      'Recordatorio de semana de descanso activo';

  @override
  String get instructionRhythmDeloadDesc =>
      'Si llevas unos dos días y medio por semana o más durante varias semanas sin una semana de descanso activo, la app puede recordarte que a veces ayuda una semana corta de descanso activo: bajar tonelaje y repeticiones un 30 %. Cuantos más días por semana, antes llega el recordatorio. Es un recordatorio, no una receta. Como máximo una vez por semana, y solo en tu modo de entrenamiento, no automáticamente para clientes. Toca el indicador de un cliente para la misma nota.';

  @override
  String get instructionSectionFavorites => 'Favoritos';

  @override
  String get instructionFavoriteStarTitle => 'Estrella';

  @override
  String get instructionFavoriteStarDesc =>
      'En Progreso personal, pulsa la estrella junto a un ejercicio para añadirlo o quitarlo de favoritos. Los favoritos se quedan arriba en la tabla.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Armar entreno';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'En la pantalla de favoritos marca los ejercicios. El botón aparece cuando hay al menos uno seleccionado. Los últimos pesos y repeticiones aparecen en gris como mínimo a superar — cada serie la registras tú. En un cliente, la misma acción inicia una sesión para esa persona.';

  @override
  String get instructionSectionMuscleGroups =>
      'Grupos musculares y entreno rápido';

  @override
  String get instructionMuscleGroupsIntro =>
      'Los grupos son etiquetas opcionales sobre tus propios nombres de ejercicio. No son un catálogo: solo ayudan al entreno rápido a elegir un mix equilibrado de cuerpo completo. Ocho grupos: pecho, espalda, hombros, core, muslo anterior, muslo posterior, flexión de brazos, extensión de brazos.';

  @override
  String get instructionMuscleGroupTagTitle => 'Cómo etiquetar';

  @override
  String get instructionMuscleGroupTagDesc =>
      'La primera vez que escribes un nombre nuevo, la app pide un grupo. Puedes pulsar Más tarde o marcar No para entreno rápido si no quieres ese movimiento en el mix. El chip bajo el nombre en Progreso o Favoritos cambia o quita la etiqueta.';

  @override
  String get instructionQuickWorkoutHowTitle => 'Cómo se arma la sesión rápida';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Cuatro huecos: pecho, espalda, una mitad de pierna, luego hombros/brazos/core según antigüedad. En la vista previa puedes cambiar cualquier hueco por otro ejercicio del mismo grupo. Si es poco, añade ejercicios tú.';

  @override
  String get instructionStrengthCardioTitle => 'Fuerza / Cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'Cambio arriba de la sesión. Fuerza: peso, repeticiones, RIR. Cardio: solo tiempo e intensidad — no hay campo de distancia.';

  @override
  String get instructionPreviousHintsTitle =>
      'Cifras grises de la sesión anterior';

  @override
  String get instructionPreviousHintsDesc =>
      'Cuando eliges un ejercicio en una sesión de cliente, un entreno rápido o una sesión desde favoritos, los últimos pesos y repeticiones aparecen en gris — un mínimo a superar, no una serie ya registrada. En el historial solo entran los números que escribes tú.';

  @override
  String get instructionRemoveExerciseTitle => 'Quitar de este entreno';

  @override
  String get instructionRemoveExerciseDesc =>
      'Quita ese bloque solo de la sesión actual. El historial guardado no cambia hasta que finalices.';

  @override
  String get instructionReassignExerciseTitle =>
      'Cambiar ejercicio en el historial';

  @override
  String get instructionReassignExerciseDesc =>
      'En un entreno guardado puedes reasignar un bloque a otro nombre. Solo cambia esa sesión; las gráficas siguen el nombre nuevo. Las series quedan igual.';

  @override
  String get instructionAutoSaveTitle => 'Entreno interrumpido';

  @override
  String get instructionAutoSaveDesc =>
      'Si la app se cierra a mitad de sesión, ofrece continuar donde lo dejaste o borrar el borrador no guardado.';

  @override
  String get instructionSectionCalendar => 'Calendario';

  @override
  String get instructionCalendarAddTitle => 'Añadir en una fecha';

  @override
  String get instructionCalendarAddDesc =>
      'Elige un día y añade un entreno a la hora que quieras. Útil para registrar una sesión que se te pasó.';

  @override
  String get instructionSectionTrainer => 'Modo entrenador';

  @override
  String get instructionTrainerIntro =>
      '«Entreno a otros» es para entrenadores. Añade clientes, programa sesiones, planifica ejercicios de antemano y registra entrenos por persona. Repetir la última sesión es opcional. Exportar e importar datos de entrenador es independiente del historial personal. Al borrar un cliente se quitan las sesiones futuras; los entrenos pasados se quedan para el informe.';

  @override
  String get instructionClientsTitle => 'Clientes';

  @override
  String get instructionClientsDesc =>
      'Añadir, editar o eliminar clientes. La lista muestra la última y la próxima sesión. Campos del perfil: objetivo, peso, altura y notas privadas del entrenador.';

  @override
  String get instructionClientProfileTitle => 'Perfil del cliente';

  @override
  String get instructionClientProfileDesc =>
      'Desde el perfil empieza una sesión de hoy vacía. Los números grises de la última vez aparecen solo al elegir un ejercicio. El historial muestra solo entrenos terminados. Planifica fechas futuras en el calendario. Progreso y favoritos están en la misma pantalla. Si hay suficiente trabajo de fuerza reciente, un indicador muestra con qué frecuencia entrena; tócalo para una nota sobre ritmo y descanso. Los cambios de perfil sin guardar piden confirmación al salir.';

  @override
  String get instructionTrainerPlanTitle => 'Planificar una sesión';

  @override
  String get instructionTrainerPlanDesc =>
      'Planifica solo desde el calendario del entrenador: elige cliente y fecha, luego los ejercicios. Los pesos y repeticiones anteriores aparecen en gris como pista. La sesión planificada tiene un icono de play: tócala para empezar (hoy) o borrar. Al historial solo van los entrenos terminados. Un plan con fecha pasada se elimina.';

  @override
  String get instructionTrainerRepeatTitle => 'Repetir el último entreno';

  @override
  String get instructionTrainerRepeatDesc =>
      'Opcional. Desde el perfil del cliente, o con el interruptor al añadir una sesión en el calendario. Copia los ejercicios de la última sesión al entreno en vivo de hoy o a un plan nuevo; los pesos y repeticiones anteriores son pistas grises, no series terminadas.';

  @override
  String get printSession => 'Imprimir';

  @override
  String get printSessionEmpty =>
      'Aún no hay nada que imprimir. Registra al menos una serie.';

  @override
  String get printSessionShareText => 'Sesión IronVibe';

  @override
  String get instructionPrintSessionTitle => 'Imprimir una sesión';

  @override
  String get instructionPrintSessionDesc =>
      'En un entreno de cliente terminado, el icono de imprimir en la cabecera arma una hoja A4 de ese día tal como está registrado. Comparte, guarda o imprime desde el menú del sistema.';

  @override
  String get rhythmPerWeek => 'por semana';

  @override
  String get deloadNudgeTitle => '¿Una semana de descanso activo?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Llevas unos $rate días por semana desde hace unas $weeks semanas. Es un recordatorio de que a veces ayuda una semana corta de descanso activo: bajar tonelaje y repeticiones un 30 %. No es una receta.';
  }

  @override
  String get deloadNudgeLater => 'Ahora no';

  @override
  String get deloadNudgeOk => 'Entendido';

  @override
  String get backupNudgeTitle => '¿Guardar una copia?';

  @override
  String get backupNudgeBody =>
      'Tus datos están solo en este dispositivo. Si lo pierdes o falla el almacenamiento, se pierde el historial. Comparte una copia ahora o pospón 28 días.';

  @override
  String get backupNudgeShare => 'Compartir';

  @override
  String get backupNudgeLater => 'Más tarde';

  @override
  String get rhythmInsightTitle => 'Ritmo de entrenamiento';

  @override
  String rhythmInsightRateYou(String rate) {
    return 'En las últimas cuatro semanas entrenas unos $rate días por semana.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name entrena unos $rate días por semana en las últimas cuatro semanas.';
  }

  @override
  String get rhythmInsightWindow =>
      'Solo cuentan los días de fuerza. Los días solo de cardio no entran. Es una foto de la densidad, no un objetivo.';

  @override
  String get rhythmInsightWhatTitle => 'Semana de descanso activo';

  @override
  String get rhythmInsightWhatBody =>
      'Bajas la carga a propósito para recuperarte sin perder forma: las mismas sesiones, pero un 30–50 % menos de volumen. O saltas los días de fuerza y sigues en movimiento.';

  @override
  String get rhythmInsightAdviceLight =>
      'Ahora el ritmo es tranquilo. Si las sesiones no son extremas, puedes seguir mucho tiempo sin una semana de descanso activo planificada.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Ahora el ritmo es estable. Si el trabajo es duro, una semana de descanso activo cada pocos meses suele bastar.';

  @override
  String get rhythmInsightAdviceDense =>
      'Ahora el calendario es denso. Si las sesiones son intensas, una semana de descanso activo cada dos o tres meses conviene tenerla en mente.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Ahora es casi a diario. Si la carga es alta, una semana de descanso activo más o menos una vez al mes suele considerarse razonable.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Bien. Este es el tipo de ritmo sobre el que se sostiene el progreso largo.';

  @override
  String get rhythmInsightPraiseDense => 'De verdad comprometido. Sigue así.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Parece que estás intentando desbloquear las capacidades secretas de tu cuerpo.';

  @override
  String get rhythmInsightRecentLighter =>
      'En los datos recientes ya se ve una semana de descanso activo.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    return 'Unas $weeks semanas a esta densidad sin una semana de descanso activo.';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'Es una nota de referencia, no una receta. Solo recuerda que a veces ayuda una semana corta de descanso activo. Si te encuentras bien, no hace falta cambiar nada.';

  @override
  String get instructionHubManifest =>
      'Sin catálogo ni programas predefinidos. Tú pones los nombres; la app guarda las estadísticas a tu manera.';

  @override
  String get instructionChapterStartTitle => 'Primeros pasos';

  @override
  String get instructionChapterStartBlurb =>
      'Pantalla de inicio, cómo entrenas y por qué la app no te dice cómo hacerlo.';

  @override
  String get instructionChapterToolsTitle => 'Herramientas';

  @override
  String get instructionChapterToolsBlurb =>
      'Ritmo, favoritos, grupos musculares y entrenamiento rápido.';

  @override
  String get instructionChapterSessionTitle => 'En la sesión';

  @override
  String get instructionChapterSessionBlurb =>
      'Series, campos, cardio, guardar y el cronómetro.';

  @override
  String get instructionChapterProgressTitle => 'Progreso y datos';

  @override
  String get instructionChapterProgressBlurb =>
      'Marcas personales, gráfico, calendario, historial y copia de seguridad.';

  @override
  String get instructionChapterCoachTitle => 'Modo entrenador';

  @override
  String get instructionChapterCoachBlurb =>
      'Clientes, perfiles, sesiones planificadas y repetir un entrenamiento.';

  @override
  String get instructionSearchHint => 'Buscar en la guía';

  @override
  String get instructionSearchEmpty => 'Nada coincide con esa búsqueda.';
}
