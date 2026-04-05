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
  String get addSet => '+ AÑADIR SERIE';

  @override
  String get addExercise => '+ AÑADIR EJERCICIO';

  @override
  String get finishWorkout => 'FINALIZAR ENTRENAMIENTO';

  @override
  String get startWorkout => 'INICIAR ENTRENAMIENTO';

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
  String get exerciseHint => 'Introduce el nombre del ejercicio';

  @override
  String get deleteFromHistory => '¿Eliminar del historial?';

  @override
  String get deleteExerciseHint => 'ya no aparecerá en las sugerencias.';

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
  String get fillCurrentExerciseBeforeAdd =>
      'Termina el ejercicio actual antes de añadir otro.';

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
  String get addClient => '+ AÑADIR CLIENTE';

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
      'IronVibe no trae una biblioteca de ejercicios fija ni programas impuestos: es deliberado. No te enseña a entrenar — para eso están YouTube y un entrenador — solo te ayuda a llevar tus datos a tu manera. Escribes tú los nombres de los ejercicios, como los llamas, en lugar de elegir de una lista enorme. Cuanto más la usas, más cómoda se siente: la app se adapta a ti, no al revés.';

  @override
  String get instructionSectionSetControl => 'Control de series';

  @override
  String get instructionSetMinusLabel => 'Menos';

  @override
  String get instructionSetMinusDesc =>
      'Elimina la ultima serie. Si contiene datos, la app pide confirmacion.';

  @override
  String get instructionSetPlusLabel => 'Más';

  @override
  String get instructionSetPlusDesc =>
      'Añade una nueva fila de serie al ejercicio en curso.';

  @override
  String get instructionSetProgressLabel => 'Cronología';

  @override
  String get instructionSetProgressDesc =>
      'Abre la linea de tiempo de progreso de este ejercicio.';

  @override
  String get instructionSectionProgressChart => 'Grafico de progreso';

  @override
  String get instructionProgressChartIntro =>
      'Dos tendencias independientes por fecha: rojo —serie mas pesada del dia (kg/lb); cyan — mas repeticiones en una serie (cualquier peso). Eje izquierdo: peso; derecho: repeticiones.';

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
  String get instructionSectionWorkout => 'Entrenamiento';

  @override
  String get instructionAddExerciseTitle => 'Añadir ejercicio';

  @override
  String get instructionAddExerciseBody =>
      'Crea un nuevo bloque para otro tipo de trabajo.';

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
      'Con la lista de sugerencias abierta bajo el nombre, pulse la X de una fila para quitar ese nombre de su lista personal (banco).';

  @override
  String get instructionSectionInputs => 'Datos';

  @override
  String get instructionWeightTitle => 'Peso';

  @override
  String get instructionWeightBody => 'Peso de la carga (kg/lb).';

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
      'Progreso personal sirve para seguir el avance ejercicio a ejercicio: en una tabla aparecen todos los movimientos guardados en el historial para compararlos rápido. El buscador muestra al momento el nombre que necesitas. Acceso desde el inicio de entrenamiento (botón bajo el calendario) o el perfil del cliente.';

  @override
  String get instructionSectionSaving => 'Guardado';

  @override
  String get instructionFinishTitle => 'Finalizar';

  @override
  String get instructionFinishBody =>
      'Guarda todo el entrenamiento en el historial. Hasta pulsarlo, los datos no quedan registrados.';

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
      'Entrenamientos terminados en el calendario y estadisticas desde el icono de grafico en las barras.';

  @override
  String get instructionNavImportExportTitle => 'Importar / exportar';

  @override
  String get instructionNavImportExportDesc =>
      'Copia de seguridad o traslado con exportacion e importacion JSON en el dialogo de estadisticas.';
}
