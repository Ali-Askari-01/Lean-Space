// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

  @override
  String get tabToday => 'Hoy';

  @override
  String get tabProgress => 'Progreso';

  @override
  String get tabYou => 'Tú';

  @override
  String get navMyDay => 'Mi día';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get navHelp => 'Ayuda y soporte';

  @override
  String get navHistory => 'Últimos 7 días';

  @override
  String get navLeftBehind => 'Pendientes';

  @override
  String get navInsights => 'Tu progreso';

  @override
  String get navMedals => 'Mis medallas';

  @override
  String get navManagePro => 'Gestionar suscripción Pro';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Quemando el aceite de medianoche';

  @override
  String get greetingMorning => '¡Buenos días, sol!';

  @override
  String get greetingAfternoon => 'Buenas tardes, amigo';

  @override
  String get greetingEvening => 'Buenas noches, campeón';

  @override
  String get greetingNight => '¿Descansando bien, guardián?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Hoy · $done de $total tareas';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done de $total hábitos';
  }

  @override
  String get todayChainGrows => 'LA CADENA CRECE MIENTRAS TERMINAS';

  @override
  String get todayChainComplete => 'CADENA COMPLETA · CUIDA EL JARDÍN MAÑANA';

  @override
  String get taskCapInfo => '¿Por qué un límite de 5 tareas?';

  @override
  String get taskCapDiscipline => 'DISCIPLINA PRIMERO';

  @override
  String get taskCapTitle => 'Limitamos tu día a 5 tareas a propósito.';

  @override
  String get taskCapBody =>
      'Las cadenas pequeñas son mejores que las largas. Es más probable que termines 3 de 5 y sientas la victoria que abandones 8 de 10 y sientas la derrota.';

  @override
  String get taskCapBulletDone =>
      'Las tareas completadas cuentan para tu cadena';

  @override
  String get taskCapBulletDoneBody =>
      'Un día en que las 5 se completan extiende tu racha en uno.';

  @override
  String get taskCapBulletMissed => 'Las tareas perdidas van a Pendientes';

  @override
  String get taskCapBulletMissedBody =>
      'A medianoche, las tareas incompletas aparecen en Pendientes. Vuelve a añadir solo lo que aún importa.';

  @override
  String get taskCapBulletFreeze =>
      'El congelamiento de racha perdona un fallo';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro te da 2 congelamientos de racha al mes — cubren un día perdido para que tu cadena sobreviva.';

  @override
  String get tasksHeader => 'Tareas';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Añadir una semilla de tarea';

  @override
  String get tasksCapReached =>
      '5/5 espacios usados — termina uno para plantar una nueva semilla.';

  @override
  String get tasksEmptyCta => 'Planta tu primera semilla — ¿qué importa hoy?';

  @override
  String get habitsHeader => 'Hábitos';

  @override
  String habitsGrowing(String count) {
    return '$count creciendo';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Mejor $days d';
  }

  @override
  String get habitsPlantNew => 'Plantar un nuevo brote de hábito';

  @override
  String get habitsPlantFirst => 'Plantar un hábito';

  @override
  String get habitsLocked =>
      'Espacio de hábito Pro — desbloquéalo para plantar más brotes';

  @override
  String get habitsSlotsFull =>
      'Todos los espacios de hábitos están ocupados actualmente.';

  @override
  String habitsStreakDays(String days) {
    return '${days}d';
  }

  @override
  String get habitsCadence => 'DIARIO';

  @override
  String leftBehindBanner(String count) {
    return '$count perdidas — aún en Pendientes';
  }

  @override
  String get leftBehindTap => 'Toca para re-añadir o soltar';

  @override
  String get leftBehindDismiss => 'Descartar';

  @override
  String get leftBehindTitle => 'Pendientes';

  @override
  String get leftBehindEmpty => 'Nada pendiente';

  @override
  String get leftBehindEmptyBody =>
      'Sin tareas perdidas. Cada semilla que plantas está siendo cuidada. El jardín está limpio.';

  @override
  String get leftBehindClearAll => 'Limpiar todo';

  @override
  String get leftBehindClearAllConfirm => '¿Limpiar todos los pendientes?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Esto eliminará permanentemente $count tarea(s) perdida(s). No se puede deshacer.';
  }

  @override
  String get leftBehindReAdd => 'Re-añadir hoy';

  @override
  String get leftBehindReAddButton => 'Re-añadir';

  @override
  String get leftBehindAddedToToday => 'Añadido a hoy';

  @override
  String get leftBehindLetGo => 'Soltar';

  @override
  String get leftBehindHeader => 'PENDIENTES';

  @override
  String get leftBehindMissedTasks => 'TAREAS PERDIDAS';

  @override
  String get leftBehindWaitingOne => '1 tarea te está esperando.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count tareas te están esperando.';
  }

  @override
  String get leftBehindBody =>
      'Re-añade una tarea para traerla de vuelta a hoy, o suéltala. Re-añadir mantiene tu racha viva.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" está de vuelta en tu día.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'Se eliminó \"$task\"';
  }

  @override
  String get leftBehindClearedSnack => 'Pendientes limpiados';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Ayer · $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count tarea(s) restante(s) hoy';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Última llamada — $count tarea(s) aún abierta(s)';
  }

  @override
  String get streakAtRiskBody =>
      'La medianoche está cerca. La cadena depende de estas.';

  @override
  String get streakAtRiskBodyLow =>
      'Aún tienes tiempo. Un día limpio extiende tu racha.';

  @override
  String get streakAtRiskFreeze =>
      'Ayer se perdió — ¿usar un congelamiento de racha?';

  @override
  String get streakFreezeUse => 'Usar congelamiento';

  @override
  String get streakFreezeUseForYesterday =>
      'Usar congelamiento mensual de racha para ayer';

  @override
  String get streakFreezeAppliedYesterday =>
      'Congelamiento de racha aplicado para ayer.';

  @override
  String get chainBrokenTitle => 'La cadena se rompió. Está bien.';

  @override
  String get chainBrokenBody =>
      'Toda cadena larga termina una vez. Lo que importa es lo que plantas hoy. Un día perfecto comienza la siguiente.';

  @override
  String get chainBrokenCta => 'Volver a hoy';

  @override
  String get chainBrokenPlantFirst => 'Plantar la primera semilla de hoy';

  @override
  String get chainBrokenCheck => 'Revisar Pendientes primero';

  @override
  String get chainBrokenBestChain => 'mejor cadena';

  @override
  String get chainBrokenTasksDone => 'tareas completadas';

  @override
  String get chainBrokenSprouts => 'brotes';

  @override
  String get chainRecoveryFreshStart => 'Un nuevo comienzo';

  @override
  String get medalsTitle => 'Mis medallas';

  @override
  String get medalsTrophyRoom => 'Sala de trofeos';

  @override
  String get medalsAllMedals => 'Todas las medallas';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned de $total medallas ganadas';
  }

  @override
  String get medalsTrophyEmpty =>
      'Tu primera insignia está a una tarea de distancia';

  @override
  String get medalsTrophyFirst => 'Ganaste tu primera medalla — sigue adelante';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned medallas en tu sala de trofeos';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'Progreso a las $total medallas';
  }

  @override
  String get medalsShareCta => 'Crear una tarjeta compartible';

  @override
  String get medalsEmptyTitle => 'Nada en esta categoría aún';

  @override
  String get medalsEmptyBody =>
      'Termina una tarea o cuida un brote para empezar tu sala de trofeos.';

  @override
  String get medalSheetLocked => 'MEDALLA PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'GANADA · $tier';
  }

  @override
  String get medalSheetUnlock => 'Desbloquear con Pro';

  @override
  String get medalSheetProgress => 'Progreso';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Solo $n $unit más para desbloquear.';
  }

  @override
  String get medalSheetAlmost => 'Un paso más para desbloquear.';

  @override
  String get medalCategory => 'Categoría';

  @override
  String get medalShareOnSocials => 'Compartir en redes';

  @override
  String get medalShareLater => 'Quizá luego';

  @override
  String get medalUnlocked => 'MEDALLA DESBLOQUEADA';

  @override
  String get medalProgressTitle => 'Progreso';

  @override
  String get historyTitle => 'Últimos 7 días';

  @override
  String get historyFullTitle => 'Historial completo';

  @override
  String get historyLoadError => 'No se pudo cargar el historial.';

  @override
  String get historyFullCalendar => 'Calendario completo';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% completado';
  }

  @override
  String historyThisWeek(String days) {
    return 'ÚLTIMOS $days DÍAS';
  }

  @override
  String get historyDayByDay => 'DÍA A DÍA';

  @override
  String get historyEmpty =>
      'Planta algunas semillas para ver cómo se despliega tu semana.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Terminaste $done de $total tareas. $perfect día(s) perfecto(s).';
  }

  @override
  String get historyUpsellTitle => 'Ver tu historial completo';

  @override
  String get historyUpsellBody =>
      'Pro desbloquea 30 días de historial. Gratis muestra 7.';

  @override
  String get historyPerfect => 'PERFECTO';

  @override
  String get historyFrozen => 'CONGELADO';

  @override
  String get historyToday => 'Hoy';

  @override
  String get historyEmptyDay => 'No se plantaron semillas ese día';

  @override
  String historyLeftBehindCount(String count) {
    return '$count pendiente(s)';
  }

  @override
  String get progressVitality => 'VITALIDAD DE HOY';

  @override
  String get progressVitalityEmpty =>
      'Planta una semilla para empezar tu jardín.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done de $total semillas plantadas hoy.';
  }

  @override
  String progressChainPill(String days) {
    return '${days}d de cadena';
  }

  @override
  String get progressMetricCurrent => 'Actual';

  @override
  String get progressMetricBest => 'Mejor';

  @override
  String get progressMetricDone => 'Hecho';

  @override
  String get progressMetricPerfect => 'Perfecto';

  @override
  String get progressMetricHabits => 'Hábitos';

  @override
  String get progressHabitBlooms => 'Florecimientos de hábitos';

  @override
  String get progressHabitBloomsSub =>
      'Hitos de racha para los brotes que riegas a diario.';

  @override
  String get progressNextBadge => 'Próxima insignia';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned de $total';
  }

  @override
  String get progressPersonalActivity => 'Actividad personal';

  @override
  String progressBrowseMonth(String month) {
    return 'Navegando por $month. Toca \"Hoy\" para volver a tu actividad en vivo.';
  }

  @override
  String get progressJumpToToday => 'Hoy';

  @override
  String get progressCalendarLegend => 'más oscuro = más terminado';

  @override
  String get progressCalendarBody =>
      'Verde oscuro significa un día perfecto. El tono se aclara a medida que omites tareas.';

  @override
  String get paywallTitle => 'No rompas la cadena.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro te da el sistema completo de disciplina.';

  @override
  String get paywallFeatures =>
      'Los 5 espacios de hábitos, no solo 3|Tu historial completo, para siempre|El conjunto completo de medallas|Congelamiento de racha cada mes|Recibo semanal + tarjetas compartibles|Temas y más';

  @override
  String get paywallFeaturesBodies =>
      'Gratis te da 3. Pro desbloquea los cinco para que tu ritual diario completo pueda vivir aquí.|Navega cada día que has completado — no solo los últimos 7. Mira años atrás, no semanas.|Desbloquea medallas de nivel Legendario. Las insignias más raras son para quienes se van con todo.|2 congelamientos de racha al mes para que un mal día no termine tu cadena.|Hermosas tarjetas compartibles de tu semana. Publica tu cadena, inspira a otro a comenzar.|Desbloquea nuevos colores y temas a medida que los agregamos. Siempre actualizaciones gratuitas.';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallYearlyCaption => 'Mejor valor · equivale a ~2,50\$/mes';

  @override
  String get paywallYearlyBadge => 'AHORRA 35%';

  @override
  String get paywallMonthly => 'Mensual';

  @override
  String get paywallMonthlyCaption => 'Cobro mensual · cancela cuando quieras';

  @override
  String paywallStartCta(String price) {
    return 'Empezar Pro · $price/año';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Empezar Pro · $price/mes';
  }

  @override
  String get paywallRestore => 'Restaurar compra';

  @override
  String get paywallTerms => 'Términos';

  @override
  String get paywallPrivacy => 'Privacidad';

  @override
  String get paywallNoRestore =>
      'No se encontró ninguna compra previa en esta cuenta.';

  @override
  String get paywallRestoreLater =>
      'Restauraremos tu compra en la próxima sincronización.';

  @override
  String get paywallAlreadyPro => 'Ya eres Pro. Gracias por el apoyo.';

  @override
  String get paywallHabitSlotHead =>
      'Has usado todos los espacios gratuitos de hábitos. Desbloquea el conjunto completo para plantar cada ritual que te importa.';

  @override
  String get paywallHistoryHead =>
      'Ve tu historial completo — cada día perfecto, cada medalla, cada regreso.';

  @override
  String get paywallMedalHead =>
      'Las medallas más raras son sólo Pro. Estás más cerca de lo que crees.';

  @override
  String get settingsYourActivity => 'TU ACTIVIDAD';

  @override
  String get settingsHelpInfo => 'AYUDA E INFO';

  @override
  String get settingsAccount => 'CUENTA';

  @override
  String get settingsNurturingTools => 'HERRAMIENTAS';

  @override
  String get settingsReminders => 'RECORDATORIOS';

  @override
  String get settingsWidgetSanctuary => 'WIDGET';

  @override
  String get settingsEcosystemSupport => 'SOPORTE';

  @override
  String get settingsHowItWorks => 'Cómo funciona';

  @override
  String get settingsSignOut => 'Cerrar sesión';

  @override
  String get settingsSignOutConfirm => 'Are you sure you want to sign out?';

  @override
  String get settingsProActive => 'Activo';

  @override
  String get settingsProFree => 'Nivel gratis';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageValue => 'Predeterminado del sistema';

  @override
  String get firstRunGreeting => '5 tareas. Ni una más. Haz que cuenten.';

  @override
  String get firstRunBody => 'Planta tu primera semilla — ¿qué importa hoy?';

  @override
  String get firstRunCta => 'Plantar mi primera semilla';

  @override
  String get emptyStateClearAll => 'Limpiar todo';

  @override
  String get cancel => 'Cancelar';

  @override
  String get intentionTitle1 => '¡Vamos a plantar una nueva intención!';

  @override
  String get intentionBody1 =>
      'Todo bosque poderoso comienza con una pequeña elección. Dime, ¿qué estamos cultivando hoy?';

  @override
  String get intentionTitle2 => '¿Qué vamos a crecer hoy?';

  @override
  String get intentionBody2 =>
      'Semillas diminutas, cuidadas con esfuerzo, se convierten en árboles altos. Elige la que más importa ahora mismo.';

  @override
  String get intentionTitle3 => 'Una semilla. Un respiro. Comienza.';

  @override
  String get intentionBody3 =>
      'No tienes que plantar todo el bosque de una vez — solo lo siguiente correcto.';

  @override
  String get intentionTitle4 => 'Cuida el siguiente paso pequeño.';

  @override
  String get intentionBody4 =>
      'Tu yo del futuro se construye con las elecciones que haces en los próximos cinco minutos. ¿Cuál es una amable?';

  @override
  String get intentionTitle5 => 'Elige en qué quieres convertirte.';

  @override
  String get intentionBody5 =>
      'Las tareas son semillas, los hábitos son brotes. Juntos forman un bosque del que estás orgulloso.';

  @override
  String get intentionTitle6 => 'Planta algo que valga la pena recordar.';

  @override
  String get intentionBody6 =>
      'No todos los días se sentirán enormes. Una semilla regada aún cuenta. Vamos a nombrar una.';

  @override
  String get intentionTitle7 => 'Haz que hoy sea un poco más valiente.';

  @override
  String get intentionBody7 =>
      'El coraje se acumula. Elige la semilla que has estado postergando — incluso nombrarla la mueve hacia adelante.';

  @override
  String get intentionTitle8 => 'Cuida la tierra antes de la semilla.';

  @override
  String get intentionBody8 =>
      '¿Qué mentalidad, herramienta o pequeño hará esta tarea más fácil? Añádelo a las notas.';

  @override
  String get shareCardSnapshot => 'Una foto de tu santuario';

  @override
  String get shareCardBody =>
      'La tarjeta de arriba se exporta como PNG y se envía a tu hoja de compartir. Publícala en tu historia, envíala a un amigo, o imprímela como pegatina.';

  @override
  String get shareCardShareMyBloom => 'Compartir mi flor';

  @override
  String get shareCardCouldNotShare => 'No se puede compartir ahora';

  @override
  String shareCardProgressText(String year) {
    return 'Mi progreso en Daily Stitch — $year en Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Acabo de desbloquear la medalla \"$title\" en Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Cómo funciona';

  @override
  String get howItWorksBody =>
      'Daily Stitch te ayuda a mantener una cadena pequeña e irrompible de disciplina. Eso es todo.';

  @override
  String get howItWorksToday => 'La pestaña Hoy';

  @override
  String get howItWorksTodayBody =>
      'Este es tu hogar. Muestra las 5 tareas y los hábitos que estableciste para hoy. Termínalos antes de medianoche, la cadena se extiende.';

  @override
  String get howItWorksCap => 'El límite de 5 tareas es la función';

  @override
  String get howItWorksCapBody =>
      'No te dejamos añadir un 6º. Ese es todo el punto. Toca el \"?\" en la pantalla principal para la explicación completa.';

  @override
  String get howItWorksHabits =>
      'Los hábitos son diarios, la cadena es para siempre';

  @override
  String get howItWorksHabitsBody =>
      'Los hábitos viven para siempre. Las tareas son únicas. Ambos alimentan la misma racha.';

  @override
  String get howItWorksLeftBehind => 'Tareas perdidas → Pendientes';

  @override
  String get howItWorksLeftBehindBody =>
      'A medianoche, las tareas incompletas van a Pendientes. Re-añade sólo las que aún importan.';

  @override
  String get howItWorksProgress => 'La pestaña Progreso';

  @override
  String get howItWorksProgressBody =>
      'Racha, calendario, medallas, historial — todo sobre tu progreso. Nada urgente vive aquí.';

  @override
  String get howItWorksYou => 'La pestaña Tú';

  @override
  String get howItWorksYouBody =>
      'Tu cuenta, ajustes, cerrar sesión. Eso es todo.';

  @override
  String get howItWorksRule =>
      'La regla: 5 cosas pequeñas, todos los días, sin excusas.';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonBack => 'Atrás';

  @override
  String get commonDismiss => 'Descartar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonClose => 'Cerrar';

  @override
  String get commonSend => 'Enviar';

  @override
  String get commonCopy => 'Copiar';

  @override
  String get commonShowLess => 'Mostrar menos';

  @override
  String get commonViewFull => 'Ver notas completas';

  @override
  String get commonEdit => 'Editar';

  @override
  String get commonDelete => 'Eliminar';

  @override
  String get commonDone => 'Hecho';

  @override
  String get commonError => 'Algo salió mal';

  @override
  String get commonPageNotFound => 'Página no encontrada';

  @override
  String get commonHome => 'Inicio';

  @override
  String get commonUnknownError => 'Error de enrutamiento desconocido';

  @override
  String get commonSettingsTooltip => 'Ajustes';

  @override
  String get commonHowThisWorks => 'Cómo funciona';

  @override
  String get myDayReminderSet => 'Recordatorio configurado';

  @override
  String get myDayPreparationNotes => 'NOTAS DE PREPARACIÓN';

  @override
  String get onboardingSkip => 'SALTAR';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingEnterSanctuary => 'Entrar al Santuario';

  @override
  String get onboardingIntroduction => 'INTRODUCCIÓN';

  @override
  String get onboardingGrowYourForest => 'CRECE TU BOSQUE';

  @override
  String get onboardingPage1Title => 'Conoce a tu Guardián.';

  @override
  String get onboardingPage1Body =>
      'Bienvenido a tu Santuario Personal. Aquí, tu crecimiento se refleja en la vida de tu bosque.';

  @override
  String get onboardingPage2Title => 'Planta semillas. Míralas crecer.';

  @override
  String get onboardingPage2Body =>
      'Cada tarea es una semilla diminuta. Cada hábito es un brote que cuidas a diario. Juntos forman un bosque de disciplina.';

  @override
  String get onboardingPage3Title => 'Cinco tareas. Una cadena.';

  @override
  String get onboardingPage3Body =>
      'Solo puedes plantar 5 semillas por día. Ese límite te obliga a enfocarte en lo que realmente importa — y proteger tu cadena.';

  @override
  String get onboardingPage4Title => 'Cuida tus brotes a diario.';

  @override
  String get onboardingPage4Body =>
      'Toca los hábitos para hacerlos crecer. Salta un día y la cadena no se extiende. El Guardián crece contigo.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Planta tu primera semilla.';

  @override
  String get authWelcomeBack => 'Bienvenido de vuelta, Guardián.';

  @override
  String get authFiveTasksDaily =>
      'Cinco tareas. Hábitos diarios. Sin excusas.';

  @override
  String get authSanctuaryWaiting => 'Tu santuario está esperando.';

  @override
  String get authSignIn => 'Iniciar sesión';

  @override
  String get authSignUp => 'Registrarse';

  @override
  String get authEmail => 'CORREO ELECTRÓNICO';

  @override
  String get authPassword => 'CONTRASEÑA';

  @override
  String get authEmailHint => 'tu@email.com';

  @override
  String get authCreateAccount => 'Crear cuenta';

  @override
  String get authSignInCta => 'Iniciar sesión';

  @override
  String get authOrContinueWith => 'o continuar con';

  @override
  String get authContinueWithGoogle => 'Continuar con Google';

  @override
  String get authEnterEmail => 'Ingresa tu correo electrónico';

  @override
  String get authEnterValidEmail => 'Ingresa una dirección de correo válida';

  @override
  String get authPasswordTooShort =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get authAccountCreated =>
      'Cuenta creada. Cambia a Iniciar sesión y usa tu contraseña.';

  @override
  String get authSomethingWentWrong => 'Algo salió mal. Intenta de nuevo.';

  @override
  String get authCouldNotStartGoogle => 'No se pudo iniciar sesión con Google.';

  @override
  String get authMidnightReset =>
      'Al iniciar sesión, aceptas que tu día se reinicia a medianoche.';

  @override
  String get authSetupRequired => 'Configuración necesaria';

  @override
  String get settingsPersonalSanctuary => 'SANTUARIO PERSONAL';

  @override
  String get settingsHowThisWorks => 'Cómo funciona';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Qué es la app, cómo funcionan el límite y la racha';

  @override
  String get settingsStreakProtection => 'Protección de racha';

  @override
  String get settingsStreakProtectionAvailable =>
      '1 congelamiento disponible este mes';

  @override
  String get settingsStreakProtectionUsed => 'Usado este mes';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Gestionar suscripción Pro';

  @override
  String get settingsProCancelPlay => 'Cancelar o cambiar plan en Google Play';

  @override
  String get settingsProUnlock =>
      'Desbloquea los 5 hábitos, historial completo y más';

  @override
  String get settingsTaskAlarms => 'Alarmas de tareas y Última llamada';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Aviso nocturno y alerta de medianoche';

  @override
  String get settingsHomeScreenWidget => 'Widget de pantalla de inicio';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Añade tu racha a la pantalla de inicio';

  @override
  String get settingsShareBloomTracker => 'Compartir Daily Stitch';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Cuéntale a un amigo sobre la cadena';

  @override
  String get settingsHelpSupport => 'Ayuda y soporte';

  @override
  String get settingsHelpSupportSubtitle =>
      'Preguntas frecuentes o reportar un problema';

  @override
  String get settingsSignOutTile => 'Cerrar sesión';

  @override
  String get settingsAllFeaturesUnlocked => 'Todas las funciones desbloqueadas';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Versión beta — las suscripciones están pausadas mientras probamos todo.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'Versión $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Versión 1.0.0';

  @override
  String get settingsHabitMaster => 'Maestro de hábitos';

  @override
  String settingsLevel(Object level) {
    return 'Nivel $level · Maestro de hábitos';
  }

  @override
  String get languagePickerTitle => 'Idioma';

  @override
  String get youLast7Days => 'Últimos 7 días';

  @override
  String get youLast7DaysSubtitle => 'Historial de tareas día a día';

  @override
  String get youLeftBehindSubtitle =>
      'Tareas perdidas esperando ser re-añadidas';

  @override
  String get youProTier => 'Nivel Pro';

  @override
  String get youFreeTier => 'Nivel gratis';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Gratis';

  @override
  String youLevelLabel(Object level) {
    return 'Nivel $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'Mejor $days d';
  }

  @override
  String get youPlantHabit => 'Planta un hábito para iniciar una cadena.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'Desbloquea el sistema completo de disciplina.';

  @override
  String get youProFeatures =>
      '5 espacios de hábitos, historial completo, medallas legendarias, congelamientos mensuales de racha, tarjetas compartibles semanales.';

  @override
  String get youSeePlans => 'Ver planes';

  @override
  String youFromPrice(Object price) {
    return 'desde $price/mes';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch · Hábitos y Tareas';

  @override
  String get progressMedals => 'Medallas';

  @override
  String get progressLast7Days => 'Últimos 7 días';

  @override
  String get progressSeeAll => 'Ver todo';

  @override
  String get progressSeeDayByDayActivity => 'Ver tu actividad día a día';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done de $total tareas terminadas · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Sin medallas aún — termina una tarea o cuida un brote para empezar.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Ver todas las medallas · $earned de $total ganadas';
  }

  @override
  String get progressGuardianInsight => 'Perspectiva del Guardián';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'PRÓXIMA INSIGNIA · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return 'Objetivo de $days días';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Ayuda y soporte';

  @override
  String get helpBody =>
      'La mayoría de las respuestas están abajo. Si no, envíanos un mensaje y normalmente respondemos en 2–3 días.';

  @override
  String get helpSectionFAQ => 'PREGUNTAS FRECUENTES';

  @override
  String get helpSectionContact => '¿AÚN NECESITAS AYUDA?';

  @override
  String get helpAddMessage => 'Añade un mensaje corto primero.';

  @override
  String get helpOpening => 'Abriendo tu aplicación de correo…';

  @override
  String get helpEmailUs => 'Escríbenos';

  @override
  String get helpOpeningAction => 'Abriendo…';

  @override
  String get helpCopyEmail => 'Copiar correo de soporte';

  @override
  String get helpCopiedEmail => 'Copiado support@dailystitch.app';

  @override
  String get helpNoMailApp =>
      'No se encontró aplicación de correo. Escríbenos a support@dailystitch.app.';

  @override
  String get helpTopicLabel => 'Tema';

  @override
  String get helpWhatHappened => '¿Qué pasó?';

  @override
  String get helpHint => 'Una descripción corta ayuda mucho…';

  @override
  String get helpDisclaimer =>
      'Tocar \"Escríbenos\" abre tu aplicación de correo con un mensaje prellenado (ningún dato sale de tu dispositivo hasta que envíes).';

  @override
  String get helpFaqQ1 => '¿Qué es el límite de 5 tareas?';

  @override
  String get helpFaqA1 =>
      'Puedes añadir hasta 5 tareas por día local. La 6ª está bloqueada a propósito — la disciplina vence a la sobrecarga. El límite es la función, no una limitación.';

  @override
  String get helpFaqQ2 => '¿Qué pasa a medianoche?';

  @override
  String get helpFaqA2 =>
      'A tu medianoche local, cualquier tarea que aún esté marcada como abierta se etiqueta como \"perdida\" y se mueve a Pendientes. Las rachas de hábitos se reinician si el hábito no se completó el día anterior.';

  @override
  String get helpFaqQ3 => '¿Qué es Pendientes?';

  @override
  String get helpFaqA3 =>
      'Una lista amigable y descartable de tareas que no terminaste. Ábrela, re-añade solo lo que aún importa y suelta lo demás. El nivel gratis muestra los últimos 7 días; Pro muestra el historial completo.';

  @override
  String get helpFaqQ4 => '¿Cómo funcionan las rachas?';

  @override
  String get helpFaqA4 =>
      'Un día extiende la cadena cuando tuviste al menos 1 tarea y 0 se perdieron. Los días con cero tareas ni extienden ni rompen la cadena. Un congelamiento de racha perdona un día perdido al mes.';

  @override
  String get helpFaqQ5 => '¿Qué es el congelamiento de racha?';

  @override
  String get helpFaqA5 =>
      'Un \"congelamiento\" por mes calendario, solo para Pro. Úsalo en un día que perdiste para mantener tu cadena viva. Encuéntralo en la pestaña de Progreso.';

  @override
  String get helpFaqQ6 => '¿Dónde se almacenan mis datos?';

  @override
  String get helpFaqA6 =>
      'Todos los datos viven en Supabase (Postgres) bajo la cuenta que inició sesión. Nunca vendemos ni compartimos. Consulta la política de privacidad enlistada en la tienda Play para más detalles.';

  @override
  String get helpFaqQ7 => '¿Cómo elimino mi cuenta?';

  @override
  String get helpFaqA7 =>
      'Ve a Ajustes → Cuenta → Eliminar cuenta. Esto elimina permanentemente tu perfil, tareas, hábitos y datos de suscripción. Las suscripciones activas de Play deben cancelarse por separado en Google Play.';

  @override
  String get helpTopicsGeneral => 'Pregunta general';

  @override
  String get helpTopicsBug => 'Reporte de error';

  @override
  String get helpTopicsStreak => 'Problema de racha / renovación';

  @override
  String get helpTopicsBilling => 'Facturación o nivel Pro';

  @override
  String get helpTopicsAccount => 'Cuenta y datos';

  @override
  String get helpTopicsFeature => 'Solicitud de función';

  @override
  String get helpAccountAnon => '(sin sesión iniciada)';

  @override
  String get splashTagline => 'Cuida semillas pequeñas. Haz crecer un bosque.';

  @override
  String get priorityStandard => 'ESTÁNDAR';

  @override
  String get priorityVital => 'VITAL';

  @override
  String get prioritySpark => 'CHISPA';

  @override
  String get settingsDeleteAccount => 'Eliminar cuenta';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Eliminar permanentemente tus datos';

  @override
  String get settingsDeleteAccountConfirmTitle => '¿Eliminar tu cuenta?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Esto elimina permanentemente tu perfil, tareas, hábitos y progreso. Las suscripciones activas deben cancelarse en Google Play por separado. Esto no se puede deshacer.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Eliminar para siempre';

  @override
  String get settingsDeleteAccountSuccess => 'Tu cuenta ha sido eliminada.';

  @override
  String get settingsDeleteAccountFailed =>
      'No se pudo eliminar la cuenta. Intenta de nuevo o escríbenos a support@dailystitch.app.';

  @override
  String get referralYouTitle => 'Invita amigos · gana Pro gratis';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress de $milestone amigos se unieron';
  }

  @override
  String get referralYouShare => 'Compartir invitación';

  @override
  String get referralYouDetails => 'Ver detalles';

  @override
  String get referralPaywallTitle => 'Mes de Pro gratis';

  @override
  String get referralPaywallBody =>
      'Invita 5 amigos que se registren → 1 mes de Pro gratis';

  @override
  String get referralPaywallProBody =>
      'Sigue invitando — acumula meses de Pro gratis';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'No se pudo cargar tu progreso. Intenta de nuevo más tarde.';

  @override
  String get insightsMetricCurrentChain => 'CADENA ACTUAL';

  @override
  String get insightsMetricBestEver => 'MEJOR JAMÁS';

  @override
  String get insightsMetricTasksDone => 'TAREAS COMPLETADAS';

  @override
  String get insightsMetricPerfectDays => 'DÍAS PERFECTOS';

  @override
  String get insightsMetricHabits => 'HÁBITOS';

  @override
  String get insightsDay => 'día';

  @override
  String get insightsDays => 'días';

  @override
  String get insightsSectionThisWeek => 'Esta semana';

  @override
  String get insightsShareMyWeek => 'Compartir mi semana';

  @override
  String get insightsShareMyWeekPro => 'Compartir mi semana · Pro';

  @override
  String get insightsShareReceiptText =>
      'Mi semana en Daily Stitch. No rompas la cadena.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Mostrando los últimos $days días';
  }

  @override
  String get insightsHistoryUpsell =>
      'Desbloquea tu historial completo con Pro';

  @override
  String get referralScreenTitle => 'Invitar amigos';

  @override
  String get referralLaunchGift => 'Regalo de lanzamiento';

  @override
  String get referralRewardTitle => 'Obtén 1 mes de Pro gratis';

  @override
  String get referralRewardBody =>
      'Comparte tu código con amigos. Cuando 5 personas se registren con él, desbloqueas Daily Stitch Pro por un mes completo.';

  @override
  String get referralYourCode => 'Tu código de referido';

  @override
  String get referralCopyCodeTooltip => 'Copiar código';

  @override
  String get referralCodeCopied => 'Código de referido copiado';

  @override
  String get referralShareWithFriends => 'Compartir con amigos';

  @override
  String get referralFooterHint =>
      'Los amigos introducen tu código al crear una cuenta. Cada amigo cuenta una vez para tu recompensa.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count amigo se unió';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count amigos se unieron';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'Has ganado $count mes gratis de Pro.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'Has ganado $count meses gratis de Pro.';
  }

  @override
  String get referralRewardUnlocked =>
      'Recompensa desbloqueada — ¡disfruta tu mes gratis de Pro!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining más para desbloquear tu mes gratis';
  }

  @override
  String youProMemberSince(String month) {
    return 'Miembro Pro de Bloom desde $month';
  }

  @override
  String get youProPerksTitle => 'Tus ventajas Pro';

  @override
  String get manageProThankYou => 'Gracias por apoyar Bloom';

  @override
  String get manageProReferralHint => 'Invita más amigos para extender tu Pro';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nAñade SUPABASE_URL y SUPABASE_PUBLISHABLE_KEY (o el legado SUPABASE_ANON_KEY) a leanspace/.env, luego reconstruye:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Predeterminado del sistema';

  @override
  String get languageNameEn => 'English';

  @override
  String get languageNameUr => 'اردو (Urdu)';

  @override
  String get languageNameEs => 'Español';

  @override
  String get languageNamePt => 'Português';

  @override
  String get languageNameFr => 'Français';

  @override
  String get languageNameDe => 'Deutsch';

  @override
  String get languageNameIt => 'Italiano';

  @override
  String get languageNameAr => 'العربية';

  @override
  String get languageNameTr => 'Türkçe';

  @override
  String get languageNameId => 'Bahasa Indonesia';

  @override
  String get onboardingLanguageTitle => 'Elige tu idioma';

  @override
  String get onboardingLanguageBody =>
      'Selecciona el idioma que quieres usar en Daily Stitch. Puedes cambiarlo en cualquier momento en Ajustes.';

  @override
  String get onboardingLanguageContinue => 'Continuar';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Amigo';

  @override
  String get settingsAppTheme => 'Tema de la app';

  @override
  String get settingsAppThemeSubtitle =>
      'Selecciona los colores de tu santuario personal';

  @override
  String get settingsInviteFriendsTitle => 'Invitar amigos · Pro gratis';

  @override
  String get settingsInviteFriendsSubtitle =>
      'Obtén 1 mes gratis cuando 5 amigos se unan';

  @override
  String get themePickerTitle => 'Santuario personal';

  @override
  String get themePickerSubtitle =>
      'Elige una paleta de colores que te traiga paz.';

  @override
  String get themeNameClassicBloom => 'Floración Clásica';

  @override
  String get themeNameSolarTerracotta => 'Terracota Solar';

  @override
  String get themeNameMidnightOasis => 'Oasis de Medianoche';

  @override
  String get themeNameLavenderDream => 'Sueño de Lavanda';

  @override
  String get themeNameNordicFrost => 'Escarcha Nórdica';

  @override
  String get themeNameCyberpunkNeon => 'Neón Cyberpunk';

  @override
  String get reminderTitle => 'Recordatorios';

  @override
  String get reminderBody =>
      'Última llamada te avisa antes de medianoche si hay tareas abiertas.';

  @override
  String get reminderFinalCall => 'Última llamada';

  @override
  String get reminderEveningNudge => 'Aviso nocturno';

  @override
  String get reminderChangeTime => 'Cambiar hora';

  @override
  String get reminderSave => 'Guardar recordatorios';

  @override
  String get notificationChannelReminders => 'Recordatorios de Daily Stitch';

  @override
  String get notificationChannelRemindersDesc =>
      'Aviso nocturno y recordatorios de Última llamada';

  @override
  String get notificationChannelAlarms => 'Alarmas de tareas de Daily Stitch';

  @override
  String get notificationChannelAlarmsDesc =>
      'Alarmas fuertes para recordatorios de tareas';

  @override
  String get notificationTaskReminderTitle => 'Recordatorio de tarea';

  @override
  String get notificationFinalCallTitle => 'Última llamada';

  @override
  String notificationFinalCallBody(int count) {
    return 'Aún tienes $count tarea(s) abierta(s) hoy.';
  }

  @override
  String get notificationEveningTitle => 'Consulta nocturna';

  @override
  String get notificationEveningBody => '¿Cómo creció tu jardín hoy?';

  @override
  String get widgetSetupTitle => 'Añadir widget de cadena';

  @override
  String get widgetSetupBody =>
      'Mantén tu racha en la pantalla de inicio — sin necesidad de abrir la app.';

  @override
  String get widgetSetupAdd => 'Añadir a pantalla de inicio';

  @override
  String get widgetSetupStep1 => 'Mantén presionada la pantalla de inicio';

  @override
  String get widgetSetupStep2 => 'Toca Widgets';

  @override
  String get widgetSetupStep3 => 'Encuentra Daily Stitch y arrástralo';

  @override
  String get widgetSetupPinSuccess =>
      'Revisa tu pantalla de inicio para colocar el widget.';

  @override
  String get widgetSetupPinFallback =>
      'Tu lanzador puede no soportar añadir con un toque. Usa los pasos manuales a continuación.';

  @override
  String get paywallWelcomePro => 'Bienvenido a Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'AHORRA ~16%';

  @override
  String get paywallTermsTitle => 'Términos de suscripción';

  @override
  String get paywallTermsBody =>
      'La facturación la maneja Google Play. Las suscripciones se renuevan automáticamente hasta que canceles en Play Store → Suscripciones al menos 24 horas antes del final del período actual. Puedes gestionar o cancelar tu suscripción en cualquier momento desde tu cuenta de Google Play.\n\nDesinstalar la app no cancela tu suscripción.\n\nLos precios mostrados están en tu moneda local y pueden variar por región. Pueden aplicarse impuestos.';

  @override
  String get paywallPrivacyTitle => 'Privacidad';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch almacena tus tareas, hábitos y datos de racha en nuestro backend de Supabase, vinculados a tu cuenta. Nunca vendemos tus datos.\n\nLas compras de suscripción son procesadas por Google Play. Recibimos un token de compra verificado de Google para confirmar tu estado Pro. No vemos ni almacenamos tus datos de pago.\n\nPuedes solicitar exportación completa de datos o eliminación de cuenta desde Ajustes → Eliminación de cuenta.';

  @override
  String get paywallCloseTooltip => 'Cerrar';

  @override
  String get paywallFooterLinks => 'Restaurar · Términos · Privacidad';

  @override
  String get manageProTitle => 'Suscripción Pro';

  @override
  String get manageProActive => 'Activa';

  @override
  String get manageProNotSubscribed => 'No suscrito';

  @override
  String get manageProFreeTier => 'Nivel gratis';

  @override
  String manageProRenewsOn(String date) {
    return 'Se renueva o expira el $date.';
  }

  @override
  String get manageProFreeBody =>
      'Estás usando Daily Stitch Gratis. Actualiza para desbloquear el sistema completo.';

  @override
  String get manageProSectionManage => 'GESTIONAR';

  @override
  String get manageProOpenPlay => 'Abrir suscripciones de Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Cancelar, cambiar plan o actualizar método de pago';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Encuentra tu suscripción existente (si la hay) aquí';

  @override
  String get manageProShareApp => 'Compartir Daily Stitch';

  @override
  String get manageProShareSubtitle => 'Cuéntale a un amigo sobre la cadena';

  @override
  String get manageProSectionHelp => '¿NECESITAS AYUDA?';

  @override
  String get manageProHelpTitle => 'Ayuda y soporte';

  @override
  String get manageProHelpSubtitle =>
      'Preguntas frecuentes de suscripción, contacto, reportes de errores';

  @override
  String manageProBillingFooter(String version) {
    return 'Facturación manejada por Google Play · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Abre la app Google Play Store → toca tu perfil → Pagos y suscripciones → Suscripciones.';

  @override
  String get addTaskGrowSomething => 'Haz crecer algo';

  @override
  String get addTaskPlantSprout => 'Plantar un brote';

  @override
  String get addTaskIntentionName => 'NOMBRE DE LA INTENCIÓN';

  @override
  String get addTaskSproutName => 'NOMBRE DEL BROTE';

  @override
  String get addTaskHintTask => 'ej., Saludo al sol matutino';

  @override
  String get addTaskHintHabit => 'ej. Yoga matutino';

  @override
  String get addTaskWhen => '¿CUÁNDO?';

  @override
  String get addTaskPriority => 'PRIORIDAD';

  @override
  String get addTaskNotes => 'NOTAS';

  @override
  String get addTaskCadenceDaily => 'Diario';

  @override
  String get addTaskCadenceWeekdays => 'Días laborales';

  @override
  String get addTaskCadence3x => '3x/semana';

  @override
  String get addTaskCadenceWeekly => 'Semanal';

  @override
  String get addTaskPlantIntention => 'Plantar intención';

  @override
  String get addTaskPlantSproutCta => 'Plantar brote';

  @override
  String get addTaskPlanting => 'Plantando…';

  @override
  String get addTaskNameIntentionError => 'Nombra tu intención';

  @override
  String get addTaskNameSproutError => 'Nombra tu brote';

  @override
  String get addTaskNotesMigrationWarning =>
      'Tarea guardada. Las notas y prioridad necesitan la última migración de Supabase — ejecuta supabase/migrations/20260701000000_todos_notes_priority.sql.';

  @override
  String get addTaskNoSproutSlots =>
      'No hay espacios de brote vacíos — cuida uno primero.';

  @override
  String get addTaskSaveSproutError =>
      'No se pudo guardar el brote — intenta de nuevo.';

  @override
  String get addTaskElementWater => 'AGUA';

  @override
  String get addTaskElementLight => 'LUZ';

  @override
  String get addTaskElementSoil => 'TIERRA';

  @override
  String get addTaskElementBreeze => 'BRISA';

  @override
  String get addTaskCadenceLabel => 'CADENCIA';

  @override
  String get addTaskPreparationNotes => 'NOTAS DE PREPARACIÓN';

  @override
  String get addTaskTendingNotes => 'NOTAS DE CUIDADO';

  @override
  String get addTaskNotesHintTask =>
      '¿Algún consejo o herramienta para esta tarea?';

  @override
  String get addTaskNotesHintHabit => '¿Cómo se ve cuidar este brote?';

  @override
  String get addTaskChooseElement => 'ELEGIR ELEMENTO';

  @override
  String get addTaskElementsTooltip => '¿Qué significan los elementos?';

  @override
  String get addTaskTaskSeed => 'Semilla de tarea';

  @override
  String get addTaskHabitSprout => 'Brote de hábito';

  @override
  String get addTaskPickElement => 'Elige el elemento correcto';

  @override
  String get addTaskPickElementBody =>
      'Cada elemento corresponde a un tipo diferente de esfuerzo. El Guardián crece más fuerte cuando riegas el correcto.';

  @override
  String get addTaskClearForm => 'Limpiar formulario';

  @override
  String get shareCouldNotShare => 'No se pudo compartir ahora';

  @override
  String get authReferralCodeLabel => 'Código de referido (opcional)';

  @override
  String get authReferralCodeHint => 'Código de amigo';

  @override
  String get youPerkHabitSlots => '5 espacios de hábitos';

  @override
  String get youPerkFullHistory => 'Historial completo';

  @override
  String get youPerkAllThemes => 'Todos los temas';

  @override
  String get youPerkStreakFreezes => '2 congelamientos de racha / mes';

  @override
  String get youPerkLegendaryMedals => 'Medallas legendarias';

  @override
  String get subscriptionPurchaseFailed => 'Compra fallida. Intenta de nuevo.';

  @override
  String get subscriptionUnavailable =>
      'Las compras in-app no están disponibles en este dispositivo.';

  @override
  String get subscriptionLoadFailed =>
      'No se pudieron cargar las opciones de suscripción.';

  @override
  String get subscriptionVerifyFailed =>
      'No se pudo verificar la compra. Intenta Restaurar compra.';

  @override
  String get streakFreezeFailed => 'No se pudo usar el congelamiento de racha.';

  @override
  String get streakFreezeAlreadyUsed => 'Ya usaste tu congelamiento este mes.';

  @override
  String get streakFreezeNoMissed =>
      'No hay tareas perdidas ese día para congelar.';

  @override
  String get streakFreezeNotPastDay => 'Solo puedes congelar un día pasado.';

  @override
  String get myDayLoadError =>
      'No se pudo cargar Mi día. Desliza para actualizar.';

  @override
  String get myDayCapReached => 'Has alcanzado el límite de 5 tareas de hoy.';

  @override
  String get myDayRemoveTaskError => 'No se pudo eliminar la tarea.';

  @override
  String get shareCardTitle => 'Compartir tu semana';

  @override
  String get shareCardCta => 'Compartir imagen';

  @override
  String get medalTierSprout => 'Brote';

  @override
  String get medalTierCommon => 'Común';

  @override
  String get medalTierRare => 'Raro';

  @override
  String get medalTierEpic => 'Épico';

  @override
  String get medalTierLegendary => 'Legendario';

  @override
  String get medalCategoryTasks => 'Tareas';

  @override
  String get medalCategoryHabits => 'Hábitos';

  @override
  String get medalCategoryStreaks => 'Rachas';

  @override
  String get medalCategoryMastery => 'Maestría';

  @override
  String get medalsShareTooltip => 'Compartir logros';

  @override
  String get medalsFilterAll => 'Todas';

  @override
  String get addHabitTitleNew => 'Plantar un nuevo brote';

  @override
  String get addHabitTitleEdit => 'Cuidar tu brote';

  @override
  String get addHabitLabelSproutName => 'NOMBRE DEL BROTE';

  @override
  String get shareCardAppBarTitle => 'Tarjeta para compartir';

  @override
  String get shareCardAppBarTitleMedal => 'Comparte tu medalla';

  @override
  String shareCardDescMedal(Object title) {
    return 'Muestra tu nueva insignia $title';
  }

  @override
  String get shareCardBodyMedal =>
      'Comparte el logro con tu círculo. La tarjeta se exporta como PNG y está lista para cualquier red social.';

  @override
  String get shareCardCtaPreparing => 'Preparando…';

  @override
  String get shareCardMilestone => 'NUEVO HITO DESBLOQUEADO';

  @override
  String get shareCardStatChain => 'días de cadena';

  @override
  String get shareCardStatSprouts => 'brotes';

  @override
  String get shareCardStatMedals => 'medallas';

  @override
  String shareCardHeadlineStreak(int days) {
    return 'Racha de $days días';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Medallas Ganadas';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Guardián de brotes';

  @override
  String get shareCardHeadlineFirstSeeds => 'Primeras Semillas Plantadas';

  @override
  String get shareCardHeadlineGardenBegins => 'Un Jardín Comienza';

  @override
  String get shareCardSubheadMonth =>
      'Has cultivado exitosamente tus hábitos durante un mes completo.';

  @override
  String get shareCardSubheadWeek =>
      'Una semana completa de crecimiento — tu bosque se está engrosando.';

  @override
  String get shareCardSubheadProgress =>
      'Tu santuario muestra progreso real. Sigue cuidando.';

  @override
  String get shareCardSubheadSprouts =>
      'Tus primeros brotes están echando raíces. Ríegalos a diario.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Tus primeras semillas están en la tierra. Míralas abrir.';

  @override
  String get shareCardSubheadFallback =>
      'Todo bosque comienza con una pequeña elección.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — cinco semillas pequeñas al día, una cadena irrompible. Planta la tuya.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Prueba Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Estoy construyendo mi cadena diaria en Daily Stitch — únete con mi código de referido $code y ambos crecemos.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Únete a Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Mi progreso en Daily Stitch — $year en Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Acabo de desbloquear la medalla \"$title\" en Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Tareas completadas';

  @override
  String get insightsReceiptPerfectDays => 'Días perfectos';

  @override
  String get insightsReceiptCompletion => 'Completado';

  @override
  String insightsReceiptDate(String date) {
    return 'Semana del $date';
  }

  @override
  String get insightsReceiptFooter => 'No rompas la cadena.';

  @override
  String get elementLabelWater => 'Agua';

  @override
  String get elementLabelLight => 'Luz';

  @override
  String get elementLabelSoil => 'Tierra';

  @override
  String get elementLabelBreeze => 'Brisa';

  @override
  String get elementTaglineWater =>
      'Restaurar. Hidratación, descanso, cuidado emocional — cualquier cosa que repozne el pozo.';

  @override
  String get elementTaglineLight =>
      'Despertar. Luz matutina, bloques de enfoque, estudio, meditación — energía y claridad.';

  @override
  String get elementTaglineSoil =>
      'Enraizar. Leer, llevar un diario, trabajo profundo — raíces lentas que construyen fuerza a largo plazo.';

  @override
  String get elementTaglineBreeze =>
      'Mover. Caminar, correr, respiración — energía ligera y móvil que despeja la mente.';

  @override
  String get elementWhenWater => 'Cuando te sientes agotado o sin energía.';

  @override
  String get elementWhenLight =>
      'Cuando necesitas un comienzo claro para tu día.';

  @override
  String get elementWhenSoil =>
      'Cuando el trabajo es lento pero vale la pena (estudio, oficio, cuidado).';

  @override
  String get elementWhenBreeze =>
      'Cuando tu cuerpo (o mente) necesita moverse y respirar.';

  @override
  String get bloomTierMastery => 'Maestría';

  @override
  String get bloomTierStrong => 'Fuerte';

  @override
  String get bloomTierGrowing => 'Creciendo';

  @override
  String get bloomTierSprouting => 'Brotando';

  @override
  String get bloomTierLocked => 'Bloqueado';

  @override
  String habitBloomSubtitle(int count, String element) {
    return 'Racha de $count días · $element';
  }

  @override
  String get medal_id_first_spark => 'Primera Chispa';

  @override
  String get medal_sub_first_spark => 'Encendiste la mecha.';

  @override
  String get medal_desc_first_spark =>
      'Termina tu primera tarea. Toda cadena comienza aquí.';

  @override
  String get medal_id_triple_seed => 'Triple Semilla';

  @override
  String get medal_sub_triple_seed => 'Tres en la tierra.';

  @override
  String get medal_desc_triple_seed => 'Termina 3 tareas en total.';

  @override
  String get medal_id_dozen_sower => 'Sembrador de Docena';

  @override
  String get medal_sub_dozen_sower => 'Un campo de doce.';

  @override
  String get medal_desc_dozen_sower => 'Termina 12 tareas en total.';

  @override
  String get medal_id_quarter_century => 'Cuarto de Siglo';

  @override
  String get medal_sub_quarter_century => 'Una temporada de decir sí.';

  @override
  String get medal_desc_quarter_century => 'Termina 25 tareas en total.';

  @override
  String get medal_id_productivity_titan => 'Titán de Productividad';

  @override
  String get medal_sub_productivity_titan => 'La constancia se compone.';

  @override
  String get medal_desc_productivity_titan =>
      'Termina 50 tareas — has construido un verdadero impulso.';

  @override
  String get medal_id_century_planter => 'Plantador del Siglo';

  @override
  String get medal_sub_century_planter => 'Un bosque propio.';

  @override
  String get medal_desc_century_planter =>
      'Termina 100 tareas. Estás en el top 5% de usuarios.';

  @override
  String get medal_id_clean_day => 'Día Limpio';

  @override
  String get medal_sub_clean_day => 'Ni una sola mala hierba.';

  @override
  String get medal_desc_clean_day =>
      'Termina cada tarea que plantas en un solo día.';

  @override
  String get medal_id_triple_perfect => 'Triple Perfecto';

  @override
  String get medal_sub_triple_perfect => 'Tres ejecuciones impecables.';

  @override
  String get medal_desc_triple_perfect => 'Alcanza 3 días perfectos.';

  @override
  String get medal_id_perfect_week => 'Semana Perfecta';

  @override
  String get medal_sub_perfect_week => 'Siete días sin interrupciones.';

  @override
  String get medal_desc_perfect_week => '7 días perfectos seguidos.';

  @override
  String get medal_id_two_week_chain => 'Fuerza del Fortnight';

  @override
  String get medal_sub_two_week_chain => 'Dos semanas de fuego.';

  @override
  String get medal_desc_two_week_chain => 'Mantén una cadena de 14 días.';

  @override
  String get medal_id_iron_chain => 'Cadena de Hierro';

  @override
  String get medal_sub_iron_chain => '30 eslabones forjados.';

  @override
  String get medal_desc_iron_chain =>
      'Una cadena de 30 días. La medalla más difícil.';

  @override
  String get medal_id_quarterly_chain => 'Cadena Trimestral';

  @override
  String get medal_sub_quarterly_chain => 'Una temporada, sin interrupciones.';

  @override
  String get medal_desc_quarterly_chain =>
      'Una cadena de 90 días. Estatus legendario.';

  @override
  String get medal_id_vital_priority => 'Chispa Vital';

  @override
  String get medal_sub_vital_priority => 'Elegiste las difíciles.';

  @override
  String get medal_desc_vital_priority =>
      'Termina 5 tareas marcadas como Prioridad Vital.';

  @override
  String get medal_id_spark_priority => 'Domador de Chispas';

  @override
  String get medal_sub_spark_priority => 'Las victorias rápidas se acumulan.';

  @override
  String get medal_desc_spark_priority =>
      'Termina 5 tareas marcadas como Prioridad Chispa.';

  @override
  String get medal_id_note_taker => 'Anotador';

  @override
  String get medal_sub_note_taker =>
      'Planes en papel superan planes en la cabeza.';

  @override
  String get medal_desc_note_taker =>
      'Agrega notas de preparación a 5 tareas diferentes.';

  @override
  String get medal_id_left_behind_rescuer => 'Rescatador de Dejados';

  @override
  String get medal_sub_left_behind_rescuer => 'Ninguna tarea dejada atrás.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Re-agrega 3 tareas perdidas al día siguiente.';

  @override
  String get medal_id_first_sprout => 'Primera Brote';

  @override
  String get medal_sub_first_sprout => 'Un nuevo ritual diario.';

  @override
  String get medal_desc_first_sprout => 'Planta tu primer hábito.';

  @override
  String get medal_id_trio_sprout => 'Trio Brote';

  @override
  String get medal_sub_trio_sprout => 'Un pequeño ecosistema.';

  @override
  String get medal_desc_trio_sprout => 'Planta 3 hábitos diferentes.';

  @override
  String get medal_id_week_of_growth => 'Semana de Crecimiento';

  @override
  String get medal_sub_week_of_growth => 'Las raíces empiezan a sostener.';

  @override
  String get medal_desc_week_of_growth =>
      'Cuida un hábito todos los días durante 7 días.';

  @override
  String get medal_id_fortnight_floret => 'Floreciente del Fortnight';

  @override
  String get medal_sub_fortnight_floret => 'Una floración completa.';

  @override
  String get medal_desc_fortnight_floret => 'Una racha de hábitos de 14 días.';

  @override
  String get medal_id_rooted_master => 'Maestro Arraigado';

  @override
  String get medal_sub_rooted_master => 'Raíces profundas, fuerza profunda.';

  @override
  String get medal_desc_rooted_master => 'Una racha de hábitos de 30 días.';

  @override
  String get medal_id_half_year_bloom => 'Floración Semestral';

  @override
  String get medal_sub_half_year_bloom => 'El jardín es permanente ahora.';

  @override
  String get medal_desc_half_year_bloom =>
      'Mantén un solo hábito durante 180 días.';

  @override
  String get medal_id_garden_keeper => 'Custodio del Jardín';

  @override
  String get medal_sub_garden_keeper => 'Variedad, juntos.';

  @override
  String get medal_desc_garden_keeper =>
      'Cultiva 4 hábitos diferentes al mismo tiempo.';

  @override
  String get medal_id_hydration_hero => 'Héroe de la Hidratación';

  @override
  String get medal_sub_hydration_hero => 'Rellenas el pozo.';

  @override
  String get medal_desc_hydration_hero =>
      'Planta un hábito de hidratación (agua/bebida).';

  @override
  String get medal_id_mindful_mover => 'Movimiento Consciente';

  @override
  String get medal_sub_mindful_mover => 'El cuerpo recuerda.';

  @override
  String get medal_desc_mindful_mover =>
      'Planta un hábito de movimiento (yoga/correr/caminar).';

  @override
  String get medal_id_devoted_keeper => 'Custodio Devoto';

  @override
  String get medal_sub_devoted_keeper => 'Sesenta días, una práctica.';

  @override
  String get medal_desc_devoted_keeper =>
      'Cuida un solo hábito durante 60 días seguidos.';

  @override
  String get medal_id_tending_notes => 'Notas de Cuidado';

  @override
  String get medal_sub_tending_notes => 'Reflexiona mientras avanzas.';

  @override
  String get medal_desc_tending_notes => 'Agrega notas de cuidado a 3 hábitos.';

  @override
  String get medalTierTaglineSprout => 'Planta la primera semilla';

  @override
  String get medalTierTaglineCommon => 'Construir el hábito';

  @override
  String get medalTierTaglineRare => 'Mostrando un verdadero impulso';

  @override
  String get medalTierTaglineEpic => 'Eres una fuerza de la naturaleza';

  @override
  String get medalTierTaglineLegendary => 'Mítico, casi nadie llega aquí';

  @override
  String get guardianHeadlineNoTasks =>
      'El suelo de hoy está fresco.\nPlanta tu primera semilla\ny mira crecer.';

  @override
  String get guardianHeadlineAllDone =>
      'Cada semilla que plantaste\nestá en flor.\nDescansa, Guardián — te lo ganaste.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count días\nde crecimiento ininterrumpido.\nTu bosque está lleno de vida.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Una semana completa en flor,\nGuardián.\nUn día más perfecto\nextiende la cadena.';

  @override
  String get guardianHeadlineStreak3 =>
      'Tu cadena se sostiene.\nCuida las semillas\nque esperan abrirse.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Estás cuidando bien las tareas.\nPlanta un brote —\nlos hábitos hacen crecer los bosques.';

  @override
  String get guardianHeadlineSomeDone =>
      'Algunas semillas abrieron,\notras no. Está bien.\nMañana es otra siembra.';

  @override
  String get guardianHeadlineMorning =>
      'Buenos días, Guardián.\nEl día es joven\ny el suelo está listo.';

  @override
  String get guardianHeadlineAfternoon =>
      'Buenas tardes, Guardián.\nQueda la mitad de la luz —\nsigue cuidando.';

  @override
  String get guardianHeadlineEvening =>
      'Buenas noches, Guardián.\nUna última revisión\nantes de que se ponga el sol.';

  @override
  String get guardianHeadlineNight =>
      '¿Quemando el aceite de medianoche?\nIncluso los Guardianes descansan.\nPlanta la semilla de mañana.';

  @override
  String get guardianBodyNoTasks =>
      'Tu santuario está en silencio ahora. Agrega una intención y mira qué cambia al atardecer.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count días en marcha. La cadena no es suerte — son las pequeñas elecciones acumulándose. Sigue acumulando.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Una cadena de $count días es un impulso real. Termina las semillas abiertas de hoy antes de decir que has terminado.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Has plantado $count tareas hasta ahora. Agregar incluso un solo brote de hábito haría que el trabajo crezca día a día.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Estás terminando el $pct% de lo que plantas. Menos semillas, más afiladas, tienden a crecer más altas que diez dispersas.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Tu santuario está vivo. $tasks tareas hechas, $sprouts brotes creciendo — el trabajo se nota.';
  }

  @override
  String get guardianInsightWaitingTitle => 'Esperando tu primer movimiento';

  @override
  String get guardianInsightWaitingBody =>
      'Agrega una tarea o hábito y empezaré a leer los patrones en tu jardín. Cuanto más plantes, más tengo para aprender.';

  @override
  String get guardianInsightWaitingCta => 'Planta tu primera semilla';

  @override
  String get guardianInsightChainSuperTitle => 'La cadena es tu superpoder';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Has mantenido una cadena de $count días. Las rachas vencen a la motivación cada vez — mantenla cálida, incluso en días lentos.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Agrega la semilla de mañana';

  @override
  String get guardianInsightChainColdTitle =>
      'La cadena está fría — empieza una nueva';

  @override
  String get guardianInsightChainColdBody =>
      'Has plantado antes, lo que significa que puedes plantar de nuevo. Una tarea pequeña hecha hoy es una cadena más larga mañana.';

  @override
  String get guardianInsightChainColdCta => 'Planta una semilla';

  @override
  String get guardianInsightLessIsMoreTitle => 'Menos es más esta semana';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Terminas aproximadamente el $pct% de lo que plantas. Prueba 3 intenciones afiladas en vez de 5 dispersas — la calidad se compone.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Afila el día';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Siguiente medalla: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Llevas $value de $target $unit. Unos días más honestos y es tuya.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Mostrar medalla';

  @override
  String get guardianInsightSteadyTitle => 'Estás en una temporada estable';

  @override
  String get guardianInsightSteadyBody =>
      'Ninguna medalla a la vista — está bien. Cuida lo que tienes. La próxima floración está en camino.';

  @override
  String get guardianInsightSteadyCta => 'Ver progreso';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 tarea en tu cadena. La medianoche se acerca.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count tareas en tu cadena. La medianoche se acerca.';
  }

  @override
  String get notificationEveningBodyOne => 'Aún tienes 1 tarea abierta hoy.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Aún tienes $count tareas abiertas hoy.';
  }

  @override
  String get notificationTickerTaskReminder => 'Recordatorio de tarea';

  @override
  String get notificationTickerTaskAlarm => 'Alarma de tarea';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count días de racha · $element';
  }
}
