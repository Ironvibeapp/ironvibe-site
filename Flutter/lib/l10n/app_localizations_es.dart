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
  String get instructionTitle => 'Cómo está organizado';

  @override
  String get instructionHubManifest =>
      'Sin catálogo de ejercicios ni programas listos. Tú nombras los movimientos con tus palabras — la app lleva las estadísticas.';

  @override
  String get instructionSearchHint => 'Buscar en la guía';

  @override
  String get instructionSearchEmpty => 'No se ha encontrado nada.';

  @override
  String get instructionChapterStartTitle => 'Por dónde empezar';

  @override
  String get instructionChapterStartBlurb =>
      'Pantalla de inicio, los dos modos y la lógica de la app.';

  @override
  String get instructionChapterSessionTitle => 'En el entreno';

  @override
  String get instructionChapterSessionBlurb =>
      'Series, peso, repeticiones, RIR, cardio y cierre de la sesión.';

  @override
  String get instructionChapterTimerTitle => 'Cronómetro';

  @override
  String get instructionChapterTimerBlurb =>
      'Intervalos, descanso entre series y avisos.';

  @override
  String get instructionChapterExercisesTitle => 'Ejercicios y grupos';

  @override
  String get instructionChapterExercisesBlurb =>
      'Tu lista de movimientos, grupos musculares, favoritos y el entreno rápido.';

  @override
  String get instructionChapterProgressTitle => 'Progreso y marcas';

  @override
  String get instructionChapterProgressBlurb =>
      'Progreso personal, 1RM, tonelaje y la gráfica del ejercicio.';

  @override
  String get instructionChapterRhythmTitle => 'Ritmo y recuperación';

  @override
  String get instructionChapterRhythmBlurb =>
      'El indicador semanal de ritmo y la semana de descarga.';

  @override
  String get instructionChapterDataTitle => 'Historial y datos';

  @override
  String get instructionChapterDataBlurb =>
      'Calendario, edición de registros, estadísticas y copia de seguridad.';

  @override
  String get instructionChapterCoachTitle => 'Modo entrenador';

  @override
  String get instructionChapterCoachBlurb =>
      'Clientes, agenda, plan de sesión e impresión.';

  @override
  String get instructionPhilosophy =>
      'IronVibe no enseña a entrenar ni te da programas listos — para eso están el entrenador y tu propia experiencia. No hay un catálogo de miles de ejercicios: escribes los nombres con tus palabras y la app cuenta los números con cuidado. Todo se queda en el dispositivo: ni cuentas, ni suscripciones, ni anuncios.';

  @override
  String get instructionSectionHome => 'Inicio';

  @override
  String get instructionThemeTitle => 'Tema';

  @override
  String get instructionThemeDesc =>
      'El interruptor sol — luna cambia entre claro y oscuro. La elección se recuerda.';

  @override
  String get instructionTrainSelfTitle => 'Me entreno yo';

  @override
  String get instructionTrainSelfDesc =>
      'Tu espacio: entrenos, calendario, progreso personal, favoritos e indicador de ritmo.';

  @override
  String get instructionTrainOthersTitle => 'Entreno a otros';

  @override
  String get instructionTrainOthersDesc =>
      'Modo entrenador: clientes, agenda e historial aparte por persona. No se mezcla con tus propios entrenos.';

  @override
  String get instructionLanguageTitle => 'Idioma';

  @override
  String get instructionLanguageDesc =>
      'La app sigue el idioma del sistema — no hay un ajuste aparte. Se admiten diez idiomas.';

  @override
  String get instructionHomeLinksTitle => 'Versión y contacto';

  @override
  String get instructionHomeLinksDesc =>
      'Abajo en la pantalla de inicio: número de versión, web, Telegram, correo de soporte y política de privacidad.';

  @override
  String get instructionSectionAthleteMenu => 'Tus entrenos';

  @override
  String get instructionStartWorkoutTitle => 'Iniciar entrenamiento';

  @override
  String get instructionStartWorkoutDesc =>
      'Abre una sesión vacía — no copia el último entreno. Añade ejercicios, anota series y termina para guardar.';

  @override
  String get instructionQuickWorkoutTitle => 'Entreno rápido';

  @override
  String get instructionQuickWorkoutDesc =>
      'Arma un cuerpo completo de cuatro ejercicios según tus etiquetas de grupo muscular.';

  @override
  String get instructionCalendarMenuTitle => 'Calendario de entrenamientos';

  @override
  String get instructionCalendarMenuDesc =>
      'Los días en que entrenaste. Desde aquí se abren las sesiones guardadas y se añaden las que faltan.';

  @override
  String get instructionSectionPersonalProgress => 'Progreso personal';

  @override
  String get instructionPersonalProgressMenuDesc =>
      'Tabla de mejores series, 1RM estimado y volumen máximo de cada movimiento.';

  @override
  String get instructionFavoritesMenuTitle => 'Ejercicios favoritos';

  @override
  String get instructionFavoritesMenuDesc =>
      'Movimientos marcados con estrella. Con ellos se arma un entreno en un par de toques.';

  @override
  String get instructionSectionWorkout => 'Sesión';

  @override
  String get instructionStrengthCardioTitle => 'Fuerza o cardio';

  @override
  String get instructionStrengthCardioDesc =>
      'El interruptor arriba de la sesión fija el tipo. Fuerza: peso, repeticiones y RIR. Cardio: tiempo e intensidad. Si ya hay datos del otro tipo, la app pregunta.';

  @override
  String get instructionAddExerciseTitle => 'Añadir ejercicio';

  @override
  String get instructionAddExerciseBody =>
      'Se añade un bloque nuevo cuando el ejercicio actual tiene nombre y al menos una serie rellenada.';

  @override
  String get instructionPreviousHintsTitle => 'Pistas grises';

  @override
  String get instructionPreviousHintsDesc =>
      'Peso y repeticiones de la vez anterior salen en gris — una marca a superar, no una serie ya apuntada. Al historial solo entra lo que escribas tú.';

  @override
  String get instructionRemoveExerciseTitle => 'Quitar ejercicio';

  @override
  String get instructionRemoveExerciseDesc =>
      'La cruz roja quita el bloque de la sesión actual. El historial guardado no cambia.';

  @override
  String get instructionSectionSetControl => 'Fila de la serie';

  @override
  String get instructionSetPlusLabel => 'Más';

  @override
  String get instructionSetPlusDesc =>
      'Añade una fila vacía para la siguiente serie.';

  @override
  String get instructionSetMinusLabel => 'Menos';

  @override
  String get instructionSetMinusDesc =>
      'Quita la última serie. Una fila vacía se borra al momento; una rellenada, tras confirmar. Si solo queda una serie, los campos se vacían.';

  @override
  String get instructionSetProgressLabel => 'Gráfica del ejercicio';

  @override
  String get instructionSetProgressDesc =>
      'Abre la evolución de este movimiento por mes, año o todo el tiempo.';

  @override
  String get instructionExerciseVolumeTitle => 'Tonelaje del ejercicio';

  @override
  String get instructionExerciseVolumeDesc =>
      'A la derecha del botón de la gráfica: suma de peso × repeticiones en todas las series rellenadas. Se recalcula al escribir.';

  @override
  String get instructionSectionInputs => 'Qué significan los campos';

  @override
  String get instructionWeightTitle => 'Peso';

  @override
  String get instructionWeightBody =>
      'La carga de trabajo. En kilogramos o libras — la app no convierte unidades y no impone nada.';

  @override
  String get instructionRepsTitle => 'Repeticiones';

  @override
  String get instructionRepsBody =>
      'Cuántas veces hiciste el movimiento en la serie.';

  @override
  String get instructionRirTitle => 'RIR — repeticiones en reserva';

  @override
  String get instructionRirBody =>
      'Cuántas repeticiones más podrías haber hecho. 0 es trabajo al fallo, ∞ una serie de calentamiento. Una forma sencilla de dosificar la intensidad.';

  @override
  String get instructionOneRmTitle => '1RM — máximo de una repetición';

  @override
  String get instructionOneRmDesc =>
      'Estimación de la carga a una repetición con la fórmula de Epley, a partir del peso y las repeticiones de la serie. Se muestra bajo la fila — un referente clave de fuerza.';

  @override
  String get instructionSectionCardio => 'Cardio';

  @override
  String get instructionCardioTitle => 'Tiempo';

  @override
  String get instructionCardioBody =>
      'Duración del bloque en minutos. No hay distancia ni pulso: la app no se enlaza a trackers.';

  @override
  String get instructionIntensityTitle => 'Intensidad';

  @override
  String get instructionIntensityBody =>
      'Esfuerzo de 1 a 5 — una escala RPE simplificada. En una sesión de cardio se guarda una sola fila por ejercicio.';

  @override
  String get instructionSectionSaving => 'Cierre';

  @override
  String get instructionFinishTitle => 'Finalizar entrenamiento';

  @override
  String get instructionFinishBody =>
      'El botón al pie de la sesión: la app confirma y escribe el entreno en el historial. Hace falta al menos una serie rellenada.';

  @override
  String get instructionLeaveWorkoutTitle => 'Salir antes de tiempo';

  @override
  String get instructionLeaveWorkoutDesc =>
      'Si cierras una sesión con datos, puedes quedarte, guardar lo anotado o borrar el borrador.';

  @override
  String get instructionAutoSaveTitle => 'Entreno interrumpido';

  @override
  String get instructionAutoSaveDesc =>
      'El borrador se guarda solo — cada minuto y al pasar la app a segundo plano. En el siguiente arranque podrás seguir desde el mismo sitio o borrarlo.';

  @override
  String get instructionScreenAwakeTitle => 'La pantalla no se apaga';

  @override
  String get instructionScreenAwakeDesc =>
      'Mientras la sesión está en curso, la pantalla sigue encendida para no desbloquear el teléfono tras cada serie.';

  @override
  String get instructionStopwatchWhyTitle => 'Por qué cronometrar el descanso';

  @override
  String get instructionStopwatchWhyBody =>
      'La pausa entre series es un parámetro de trabajo, igual que el peso y las repeticiones: un descanso corto sube la densidad; uno largo deja sacar una serie pesada.';

  @override
  String get instructionStopwatchHowTitle => 'Inicio, pausa, reinicio';

  @override
  String get instructionStopwatchHowBody =>
      'El cronómetro va fijado en la cabecera de la sesión y se ve al desplazarte. En el centro, el tiempo y los controles; en modo normal cuenta hacia arriba, con centésimas.';

  @override
  String get instructionStopwatchIntervalsTitle => 'Izquierda: intervalos';

  @override
  String get instructionStopwatchIntervalsBody =>
      '1/1 — un minuto de trabajo y uno de descanso. 4/4 — cuatro minutos cada uno. 20/10 — tabata. Las fases giran en bucle hasta pausar o reiniciar: tono rojo es trabajo, azul es descanso.';

  @override
  String get instructionStopwatchRestTitle => 'Derecha: descanso';

  @override
  String get instructionStopwatchRestBody =>
      '+1m, +2m y +5m arrancan la cuenta atrás entre series. Si ya corre, los minutos se suman al resto; un ciclo de intervalos pasa a descanso.';

  @override
  String get instructionStopwatchProgressTitle => 'Barra de fase';

  @override
  String get instructionStopwatchProgressBody =>
      'En la cuenta atrás y en intervalos, bajo las cifras se ve cuánto queda de la fase actual.';

  @override
  String get instructionStopwatchSoundsTitle => 'Sonido y vibración';

  @override
  String get instructionStopwatchSoundsBody =>
      'A tres, dos y un segundo del final de fase — un clic corto y una vibración suave; al cambiar de fase, el aviso es más claro. Los sonidos van en la app: ni micrófono ni permiso de notificaciones. El volumen sigue el del teléfono.';

  @override
  String get instructionExerciseBankIntro =>
      'La lista de ejercicios crece sola: cada nombre nuevo de un entreno terminado entra en las sugerencias. Los nombres se guardan en mayúsculas para que el mismo movimiento no se parta en dos.';

  @override
  String get instructionSectionExerciseNameTools => 'Nombres';

  @override
  String get instructionRenameExerciseTitle => 'Renombrar en todas partes';

  @override
  String get instructionRenameExerciseDesc =>
      'Pulsación larga sobre el nombre — en la sesión, en la lista de sugerencias o en un entreno guardado. Se actualiza en todo el historial y en las gráficas.';

  @override
  String get instructionRemoveFromBankTitle => 'Quitar de sugerencias';

  @override
  String get instructionRemoveFromBankDesc =>
      'La cruz de la lista de sugerencias abierta, o la cruz roja del progreso personal, quita el nombre de las sugerencias y de la tabla. Los entrenos guardados no se tocan.';

  @override
  String get instructionReassignExerciseTitle => 'Cambiar en el registro';

  @override
  String get instructionReassignExerciseDesc =>
      'En un entreno guardado puedes reasignar el bloque a otro movimiento. Las series quedan igual, pero pasan a las estadísticas del nombre nuevo — solo cambia esta sesión.';

  @override
  String get instructionSectionMuscleGroups => 'Grupos musculares';

  @override
  String get instructionMuscleGroupsIntro =>
      'El grupo es una etiqueta opcional sobre tu nombre. Solo la usa el entreno rápido para armar un cuerpo completo equilibrado. Ocho grupos: pecho, espalda, hombros, core, muslo anterior, muslo posterior, flexión de brazos, extensión de brazos.';

  @override
  String get instructionMuscleGroupTagTitle => 'Cómo etiquetar';

  @override
  String get instructionMuscleGroupTagDesc =>
      'La primera vez que escribes un nombre nuevo, la app pregunta el grupo. Puedes responder Más tarde, o No para entreno rápido si el movimiento no debe entrar en el mix. La etiqueta bajo el nombre en progreso personal y favoritos se cambia o se quita fácil.';

  @override
  String get instructionSectionFavorites => 'Favoritos';

  @override
  String get instructionFavoriteStarTitle => 'Estrella';

  @override
  String get instructionFavoriteStarDesc =>
      'Hay estrella en la tarjeta del ejercicio durante la sesión y en la tabla de progreso personal. Los favoritos se quedan arriba de la lista.';

  @override
  String get instructionBuildFromFavoritesTitle => 'Armar entreno';

  @override
  String get instructionBuildFromFavoritesDesc =>
      'En la pantalla de favoritos marca los movimientos que quieras — el botón aparece al momento. La sesión se abre en ese orden, con las pistas grises de la vez anterior. Para un cliente, la misma acción abre su entreno.';

  @override
  String get instructionSectionQuickWorkout => 'Entreno rápido';

  @override
  String get instructionQuickWorkoutHowTitle => 'Cuatro huecos';

  @override
  String get instructionQuickWorkoutHowDesc =>
      'Pecho, espalda, una mitad de piernas (muslo anterior o posterior — nunca ambos el mismo día) y un movimiento de hombros, brazos o core. En cada hueco la app elige el grupo que más tiempo lleva sin trabajar, y prioriza un favorito.';

  @override
  String get instructionQuickWorkoutPreviewTitle => 'Vista previa y cambio';

  @override
  String get instructionQuickWorkoutPreviewDesc =>
      'Antes de empezar se ve toda la alineación: cualquier hueco se puede cambiar por otro ejercicio del mismo grupo. Si faltan movimientos etiquetados, la app lo dice y abre el progreso personal para poner etiquetas.';

  @override
  String get instructionPersonalProgressIntro =>
      'Una sola tabla de todos los movimientos de los entrenos guardados. Favoritos arriba, el resto por alfabeto; la búsqueda encuentra el nombre. Se abre desde el menú de entrenos o el perfil del cliente.';

  @override
  String get instructionProgressBestSetTitle => 'Mejor serie';

  @override
  String get instructionProgressBestSetDesc =>
      'La serie con el 1RM estimado más alto de todo el historial. En movimientos sin peso se toma la serie con más repeticiones.';

  @override
  String get instructionProgressMaxVolumeTitle => 'Volumen máximo';

  @override
  String get instructionProgressMaxVolumeDesc =>
      'El mayor tonelaje de este ejercicio en un solo entreno — un ancla útil para planear el volumen de trabajo.';

  @override
  String get instructionSectionProgressChart => 'Gráfica del ejercicio';

  @override
  String get instructionProgressChartIntro =>
      'Tres curvas independientes por fechas. A la izquierda la escala de peso, a la derecha la de repeticiones; la línea amarilla está normalizada para comparar tendencias por la forma. El periodo se cambia — mes, año, todo el tiempo — y un toque en un punto muestra las cifras de ese día. El cardio no entra en la gráfica.';

  @override
  String get instructionProgressLineWeightDesc =>
      'Roja — mayor peso en una serie ese día.';

  @override
  String get instructionProgressLineRepsDesc =>
      'Cian — más repeticiones en una serie, no necesariamente con el peso máximo.';

  @override
  String get instructionProgressLineVolumeDesc =>
      'Amarilla — tonelaje del día: suma de peso × repeticiones en las series con ambos campos rellenados.';

  @override
  String get instructionProgressChartSessionHighlight =>
      'En un entreno en curso el botón de la gráfica se ilumina si bates una marca: rojo por peso de serie, amarillo por tonelaje del ejercicio, cian por la suma de repeticiones en movimientos sin peso. Si coinciden varios, gana el rojo, luego el amarillo y el cian. En el historial guardado no hay resalte.';

  @override
  String get instructionRhythmIntro =>
      'Cuando en las últimas cuatro semanas se juntan al menos tres días de fuerza, arriba de la pantalla de entrenos aparece el indicador de ritmo. No es un objetivo ni una nota — solo con qué frecuencia vas ahora al gym.';

  @override
  String get instructionRhythmGaugeTitle => 'Días por semana';

  @override
  String get instructionRhythmGaugeDesc =>
      'El arco se llena de uno a seis días — la media de cuatro semanas. Cuentan los días con trabajo de fuerza; los de solo cardio, no. Cuanto más denso el ritmo, más se aleja el color del acero hacia el oro y el óxido.';

  @override
  String get instructionRhythmInsightTitle => 'Lectura del ritmo';

  @override
  String get instructionRhythmInsightDesc =>
      'Toca el indicador: la app nombra tu modo — ritmo tranquilo, estable, denso o casi sin días libres — y explica qué implica para la recuperación. En el cliente del entrenador se abre la misma lectura.';

  @override
  String get instructionRhythmDeloadTitle => 'Semana de descarga';

  @override
  String get instructionRhythmDeloadDesc =>
      'La descarga no es una pausa, es una semana a media potencia: pesos de trabajo y número de series un 30–50 % más bajos, o solo cardio. El músculo se recupera antes que ligamentos, tendones y articulaciones — esta semana les da tiempo de alcanzarlos.';

  @override
  String get instructionRhythmNudgeTitle => 'Recordatorio';

  @override
  String get instructionRhythmNudgeDesc =>
      'Si mantienes dos entrenos y medio por semana o más y llevas tiempo sin descargar, la app propone tomarte esa semana. Cuanto más denso el ritmo, antes aparece el aviso. Sale como mucho una vez por semana y solo en modo personal — es una recomendación, no un consejo médico.';

  @override
  String get instructionSectionCalendar => 'Calendario e historial';

  @override
  String get instructionCalendarBrowseTitle => 'Cómo recorrer';

  @override
  String get instructionCalendarBrowseDesc =>
      'Los meses se deslizan con el dedo; un toque en el nombre del mes abre el selector rápido de fecha. Un punto bajo el número significa que ese día hubo entreno.';

  @override
  String get instructionCalendarAddTitle => 'Anotar a destiempo';

  @override
  String get instructionCalendarAddDesc =>
      'Elige el día, pon la hora y añade un entreno — también de una fecha ya pasada. Útil si se te olvidó apuntar la sesión.';

  @override
  String get instructionNavHistoryTitle => 'Tonelaje del entreno';

  @override
  String get instructionNavHistoryDesc =>
      'Cada sesión guardada muestra el tonelaje total. El volumen es uno de los referentes más sólidos de hipertrofia: no importa tanto la marca de un día como cómo se sostiene de semana en semana.';

  @override
  String get instructionHistoryEditTitle => 'Editar registros';

  @override
  String get instructionHistoryEditDesc =>
      'Un entreno guardado se puede desplegar y corregir: añadir ejercicio o serie, cambiar cifras, borrar la sesión entera. Los cambios se guardan al momento.';

  @override
  String get instructionSectionStats => 'Estadísticas';

  @override
  String get instructionStatsTitle => 'Resumen de entrenos';

  @override
  String get instructionStatsDesc =>
      'El icono de gráfica en la cabecera de entrenos o del entrenador: cuántas sesiones este mes, este año y en total. En modo entrenador, también el desglose por cliente.';

  @override
  String get instructionSectionBackup => 'Copia de seguridad';

  @override
  String get instructionNavImportExportTitle => 'Exportar e importar';

  @override
  String get instructionNavImportExportDesc =>
      'La exportación mete en un JSON el historial, la lista de ejercicios, favoritos, etiquetas de grupo, clientes y la agenda. La importación mezcla el archivo con los datos actuales y salta duplicados — no se borra nada. La copia del entrenador va aparte de la personal.';

  @override
  String get instructionBackupNudgeTitle => 'Recordatorio de copia';

  @override
  String get instructionBackupNudgeDesc =>
      'Los datos viven solo en este dispositivo: ni cuentas ni nube. Cada cuatro semanas la app ofrece guardar una copia — si se pierde el teléfono, el historial solo vuelve desde ese archivo.';

  @override
  String get instructionTrainerIntro =>
      '«Entreno a otros» es un espacio aparte para trabajar con gente: clientes, agenda e historial por persona. Los entrenos propios y los datos de entrenador no se cruzan.';

  @override
  String get instructionClientsTitle => 'Clientes';

  @override
  String get instructionClientsDesc =>
      'Lista con el objetivo, la última y la siguiente sesión. En la ficha: objetivo, peso, altura y notas privadas del entrenador. El nombre se fija al crear y luego no cambia.';

  @override
  String get instructionClientProfileTitle => 'Perfil del cliente';

  @override
  String get instructionClientProfileDesc =>
      'Desde aquí arranca la sesión de hoy y se abren el progreso, los favoritos y el historial por meses. Si hay suficientes días de fuerza, también está el indicador de ritmo. Borrar un cliente quita las sesiones futuras; los entrenos pasados quedan para el seguimiento.';

  @override
  String get instructionTrainerScheduleTitle => 'Agenda';

  @override
  String get instructionTrainerScheduleDesc =>
      'El calendario del entrenador muestra las sesiones de todos los clientes: icono de play es planificada, el visto es terminada, el reloj de arena es la de hoy en curso. Los planes vacíos de días pasados se limpian solos.';

  @override
  String get instructionTrainerPlanTitle => 'Plan de sesión';

  @override
  String get instructionTrainerPlanDesc =>
      'Para una fecha futura puedes colocar ejercicios y una nota de antemano y guardar sin terminar el entreno. Peso y repeticiones de la vez anterior llegan como pistas grises. Al historial solo entran las sesiones terminadas.';

  @override
  String get instructionTrainerRepeatTitle => 'Repetir la última';

  @override
  String get instructionTrainerRepeatDesc =>
      'Desde el perfil del cliente o con el interruptor al añadir una sesión en el calendario. Se copia la lista de ejercicios; peso y repeticiones llegan como pistas grises, no como series ya hechas.';

  @override
  String get instructionPrintSessionTitle => 'Imprimir la sesión';

  @override
  String get instructionPrintSessionDesc =>
      'En un entreno terminado, el icono de impresión de la cabecera arma una hoja A4 con el contenido y las cifras del día. Luego la hoja del sistema: impresora, PDF o envío al cliente.';

  @override
  String get instructionImportAthleteTitle => 'Importar historial de un atleta';

  @override
  String get instructionImportAthleteDesc =>
      'Botón propio en las estadísticas del entrenador: un archivo del modo personal se da de alta como cliente nuevo, con favoritos y etiquetas de grupo. Los entrenos pasados se marcan como importados y los nombres de ejercicios no se mezclan con los tuyos.';

  @override
  String get printSession => 'Imprimir';

  @override
  String get printSessionEmpty =>
      'Aún no hay nada que imprimir. Registra al menos una serie.';

  @override
  String get printSessionShareText => 'Sesión IronVibe';

  @override
  String get rhythmPerWeek => 'por semana';

  @override
  String get deloadNudgeTitle => '¿Una semana de descanso activo?';

  @override
  String deloadNudgeBody(String rate, int weeks) {
    return 'Llevas unos $rate días por semana desde hace unas $weeks semanas. Buen momento para una semana de descanso activo: pesos de trabajo y series un 30–50 % más bajos, o solo cardio. Es una recomendación, no un consejo médico.';
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
    return 'Entrenas de media unas $rate veces por semana.';
  }

  @override
  String rhythmInsightRateClient(String name, String rate) {
    return '$name entrena de media unas $rate veces por semana.';
  }

  @override
  String get rhythmInsightBandLight => 'Ritmo tranquilo';

  @override
  String get rhythmInsightBandSteady => 'Ritmo estable';

  @override
  String get rhythmInsightBandDense => 'Ritmo denso';

  @override
  String get rhythmInsightBandVeryDense => 'Casi sin días libres';

  @override
  String get rhythmInsightHowTitle => 'De dónde sale este número';

  @override
  String get rhythmInsightWindow =>
      'Media de las últimas cuatro semanas. Cuentan los días con trabajo de fuerza; los días solo de cardio, no. No es un objetivo ni una nota: es tu ritmo actual.';

  @override
  String get rhythmInsightWhatTitle => 'Semana de descanso activo';

  @override
  String get rhythmInsightWhatBody =>
      'No es una pausa, es una semana a media potencia: pesos de trabajo y número de series un 30–50 % más bajos. También puedes dejar la fuerza y seguir con cardio u otra actividad. El músculo se recupera antes que las articulaciones, ligamentos y tendones: esta semana les da tiempo de alcanzarlos.';

  @override
  String get rhythmInsightPaceTitle => 'Qué significa';

  @override
  String get rhythmInsightAdviceLight =>
      'Hay suficientes días libres entre sesiones y el cansancio no se acumula. Aún no hace falta planear descanso activo: con este ritmo el cuerpo se recupera solo.';

  @override
  String get rhythmInsightAdviceSteady =>
      'Un ritmo estable con el que se puede trabajar años. Si las sesiones son duras, toma una semana de descanso activo cada pocos meses: mejor pronto que cuando los pesos ya se hayan parado.';

  @override
  String get rhythmInsightAdviceDense =>
      'Las sesiones van juntas y el cansancio se acumula sin hacer ruido. Una semana de descanso activo cada dos o tres meses suele sostener el progreso mejor que seguir sin parar.';

  @override
  String get rhythmInsightAdviceVeryDense =>
      'Casi cada día bajo carga. Puede funcionar si el sueño y la comida siguen. Con este ritmo, una semana de descanso activo más o menos una vez al mes es cuidado normal de articulaciones y ligamentos, no una huida.';

  @override
  String get rhythmInsightPraiseSteady =>
      'Este es el ritmo que la gente mantiene durante años.';

  @override
  String get rhythmInsightPraiseDense =>
      'Entrenas a menudo: un calendario así no se arma solo.';

  @override
  String get rhythmInsightPraiseVeryDense =>
      'Parece que encontraste el modo secreto del cuerpo.';

  @override
  String get rhythmInsightRecentLighter =>
      'La carga ya bajó hace poco: el descanso activo puede darse por hecho. Retoma el ritmo.';

  @override
  String rhythmInsightAccumulation(int weeks) {
    String _temp0 = intl.Intl.pluralLogic(
      weeks,
      locale: localeName,
      other: 'Este ritmo lleva ya $weeks semanas.',
      one: 'Este ritmo lleva ya $weeks semana.',
    );
    return '$_temp0';
  }

  @override
  String get rhythmInsightDisclaimer =>
      'Es una recomendación, no un consejo médico. Si te encuentras bien, no hace falta cambiar nada.';
}
