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
  String get tabYou => 'TÃº';

  @override
  String get navMyDay => 'Mi dÃ­a';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get navHelp => 'Ayuda y soporte';

  @override
  String get navHistory => 'Ãšltimos 7 dÃ­as';

  @override
  String get navLeftBehind => 'Pendientes';

  @override
  String get navInsights => 'Tu progreso';

  @override
  String get navMedals => 'Mis medallas';

  @override
  String get navManagePro => 'Gestionar suscripciÃ³n Pro';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Quemando el aceite de medianoche';

  @override
  String get greetingMorning => 'Â¡Buenos dÃ­as, sol!';

  @override
  String get greetingAfternoon => 'Buenas tardes, amigo';

  @override
  String get greetingEvening => 'Buenas noches, campeÃ³n';

  @override
  String get greetingNight => 'Â¿Descansando bien, guardiÃ¡n?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Hoy Â· $done de $total tareas';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done de $total hÃ¡bitos';
  }

  @override
  String get todayChainGrows => 'LA CADENA CRECE MIENTRAS TERMINAS';

  @override
  String get todayChainComplete =>
      'CADENA COMPLETA Â· CUIDA EL JARDÃN MAÃ‘ANA';

  @override
  String get taskCapInfo => 'Â¿Por quÃ© un lÃ­mite de 5 tareas?';

  @override
  String get taskCapDiscipline => 'DISCIPLINA PRIMERO';

  @override
  String get taskCapTitle => 'Limitamos tu dÃ­a a 5 tareas a propÃ³sito.';

  @override
  String get taskCapBody =>
      'Las cadenas pequeÃ±as son mejores que las largas. Es mÃ¡s probable que termines 3 de 5 y sientas la victoria que abandones 8 de 10 y sientas la derrota.';

  @override
  String get taskCapBulletDone =>
      'Las tareas completadas cuentan para tu cadena';

  @override
  String get taskCapBulletDoneBody =>
      'Un dÃ­a en que las 5 se completan extiende tu racha en uno.';

  @override
  String get taskCapBulletMissed => 'Las tareas perdidas van a Pendientes';

  @override
  String get taskCapBulletMissedBody =>
      'A medianoche, las tareas incompletas aparecen en Pendientes. Vuelve a aÃ±adir solo lo que aÃºn importa.';

  @override
  String get taskCapBulletFreeze =>
      'El congelamiento de racha perdona un fallo';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro te da 2 congelamientos de racha al mes â€” cubren un dÃ­a perdido para que tu cadena sobreviva.';

  @override
  String get tasksHeader => 'Tareas';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'AÃ±adir una semilla de tarea';

  @override
  String get tasksCapReached =>
      '5/5 espacios usados â€” termina uno para plantar una nueva semilla.';

  @override
  String get tasksEmptyCta =>
      'Planta tu primera semilla â€” Â¿quÃ© importa hoy?';

  @override
  String get habitsHeader => 'HÃ¡bitos';

  @override
  String habitsGrowing(String count) {
    return '$count creciendo';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Mejor $days d';
  }

  @override
  String get habitsPlantNew => 'Plantar un nuevo brote de hÃ¡bito';

  @override
  String get habitsPlantFirst => 'Plantar un hÃ¡bito';

  @override
  String get habitsLocked =>
      'Espacio de hÃ¡bito Pro â€” desbloquÃ©alo para plantar mÃ¡s brotes';

  @override
  String get habitsSlotsFull =>
      'Todos los espacios de hÃ¡bitos estÃ¡n ocupados actualmente.';

  @override
  String habitsStreakDays(String days) {
    return '${days}d';
  }

  @override
  String get habitsCadence => 'DIARIO';

  @override
  String leftBehindBanner(String count) {
    return '$count perdidas â€” aÃºn en Pendientes';
  }

  @override
  String get leftBehindTap => 'Toca para re-aÃ±adir o soltar';

  @override
  String get leftBehindDismiss => 'Descartar';

  @override
  String get leftBehindTitle => 'Pendientes';

  @override
  String get leftBehindEmpty => 'Nada pendiente';

  @override
  String get leftBehindEmptyBody =>
      'Sin tareas perdidas. Cada semilla que plantas estÃ¡ siendo cuidada. El jardÃ­n estÃ¡ limpio.';

  @override
  String get leftBehindClearAll => 'Limpiar todo';

  @override
  String get leftBehindClearAllConfirm => 'Â¿Limpiar todos los pendientes?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Esto eliminarÃ¡ permanentemente $count tarea(s) perdida(s). No se puede deshacer.';
  }

  @override
  String get leftBehindReAdd => 'Re-aÃ±adir hoy';

  @override
  String get leftBehindReAddButton => 'Re-aÃ±adir';

  @override
  String get leftBehindAddedToToday => 'AÃ±adido a hoy';

  @override
  String get leftBehindLetGo => 'Soltar';

  @override
  String get leftBehindHeader => 'PENDIENTES';

  @override
  String get leftBehindMissedTasks => 'TAREAS PERDIDAS';

  @override
  String get leftBehindWaitingOne => '1 tarea te estÃ¡ esperando.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count tareas te estÃ¡n esperando.';
  }

  @override
  String get leftBehindBody =>
      'Re-aÃ±ade una tarea para traerla de vuelta a hoy, o suÃ©ltala. Re-aÃ±adir mantiene tu racha viva.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" estÃ¡ de vuelta en tu dÃ­a.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'Se eliminÃ³ \"$task\"';
  }

  @override
  String get leftBehindClearedSnack => 'Pendientes limpiados';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Ayer Â· $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count tarea(s) restante(s) hoy';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Ãšltima llamada â€” $count tarea(s) aÃºn abierta(s)';
  }

  @override
  String get streakAtRiskBody =>
      'La medianoche estÃ¡ cerca. La cadena depende de estas.';

  @override
  String get streakAtRiskBodyLow =>
      'AÃºn tienes tiempo. Un dÃ­a limpio extiende tu racha.';

  @override
  String get streakAtRiskFreeze =>
      'Ayer se perdiÃ³ â€” Â¿usar un congelamiento de racha?';

  @override
  String get streakFreezeUse => 'Usar congelamiento';

  @override
  String get streakFreezeUseForYesterday =>
      'Usar congelamiento mensual de racha para ayer';

  @override
  String get streakFreezeAppliedYesterday =>
      'Congelamiento de racha aplicado para ayer.';

  @override
  String get chainBrokenTitle => 'La cadena se rompiÃ³. EstÃ¡ bien.';

  @override
  String get chainBrokenBody =>
      'Toda cadena larga termina una vez. Lo que importa es lo que plantas hoy. Un dÃ­a perfecto comienza la siguiente.';

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
      'Tu primera insignia estÃ¡ a una tarea de distancia';

  @override
  String get medalsTrophyFirst =>
      'Ganaste tu primera medalla â€” sigue adelante';

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
  String get medalsEmptyTitle => 'Nada en esta categorÃ­a aÃºn';

  @override
  String get medalsEmptyBody =>
      'Termina una tarea o cuida un brote para empezar tu sala de trofeos.';

  @override
  String get medalSheetLocked => 'MEDALLA PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'GANADA Â· $tier';
  }

  @override
  String get medalSheetUnlock => 'Desbloquear con Pro';

  @override
  String get medalSheetProgress => 'Progreso';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Solo $n $unit mÃ¡s para desbloquear.';
  }

  @override
  String get medalSheetAlmost => 'Un paso mÃ¡s para desbloquear.';

  @override
  String get medalCategory => 'CategorÃ­a';

  @override
  String get medalShareOnSocials => 'Compartir en redes';

  @override
  String get medalShareLater => 'QuizÃ¡ luego';

  @override
  String get medalUnlocked => 'MEDALLA DESBLOQUEADA';

  @override
  String get medalProgressTitle => 'Progreso';

  @override
  String get historyTitle => 'Ãšltimos 7 dÃ­as';

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
    return 'ÃšLTIMOS $days DÃAS';
  }

  @override
  String get historyDayByDay => 'DÃA A DÃA';

  @override
  String get historyEmpty =>
      'Planta algunas semillas para ver cÃ³mo se despliega tu semana.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Terminaste $done de $total tareas. $perfect dÃ­a(s) perfecto(s).';
  }

  @override
  String get historyUpsellTitle => 'Ver tu historial completo';

  @override
  String get historyUpsellBody =>
      'Pro desbloquea 30 dÃ­as de historial. Gratis muestra 7.';

  @override
  String get historyPerfect => 'PERFECTO';

  @override
  String get historyFrozen => 'CONGELADO';

  @override
  String get historyToday => 'Hoy';

  @override
  String get historyEmptyDay => 'No se plantaron semillas ese dÃ­a';

  @override
  String historyLeftBehindCount(String count) {
    return '$count pendiente(s)';
  }

  @override
  String get progressVitality => 'VITALIDAD DE HOY';

  @override
  String get progressVitalityEmpty =>
      'Planta una semilla para empezar tu jardÃ­n.';

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
  String get progressMetricHabits => 'HÃ¡bitos';

  @override
  String get progressHabitBlooms => 'Florecimientos de hÃ¡bitos';

  @override
  String get progressHabitBloomsSub =>
      'Hitos de racha para los brotes que riegas a diario.';

  @override
  String get progressNextBadge => 'PrÃ³xima insignia';

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
  String get progressCalendarLegend => 'mÃ¡s oscuro = mÃ¡s terminado';

  @override
  String get progressCalendarBody =>
      'Verde oscuro significa un dÃ­a perfecto. El tono se aclara a medida que omites tareas.';

  @override
  String get paywallTitle => 'No rompas la cadena.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro te da el sistema completo de disciplina.';

  @override
  String get paywallFeatures =>
      'Los 5 espacios de hÃ¡bitos, no solo 3|Tu historial completo, para siempre|El conjunto completo de medallas|Congelamiento de racha cada mes|Recibo semanal + tarjetas compartibles|Temas y mÃ¡s';

  @override
  String get paywallFeaturesBodies =>
      'Gratis te da 3. Pro desbloquea los cinco para que tu ritual diario completo pueda vivir aquÃ­.|Navega cada dÃ­a que has completado â€” no solo los Ãºltimos 7. Mira aÃ±os atrÃ¡s, no semanas.|Desbloquea medallas de nivel Legendario. Las insignias mÃ¡s raras son para quienes se van con todo.|2 congelamientos de racha al mes para que un mal dÃ­a no termine tu cadena.|Hermosas tarjetas compartibles de tu semana. Publica tu cadena, inspira a otro a comenzar.|Desbloquea nuevos colores y temas a medida que los agregamos. Siempre actualizaciones gratuitas.';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallYearlyCaption => 'Mejor valor Â· equivale a ~2,50\$/mes';

  @override
  String get paywallYearlyBadge => 'AHORRA 35%';

  @override
  String get paywallMonthly => 'Mensual';

  @override
  String get paywallMonthlyCaption => 'Cobro mensual Â· cancela cuando quieras';

  @override
  String paywallStartCta(String price) {
    return 'Empezar Pro Â· $price/aÃ±o';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Empezar Pro Â· $price/mes';
  }

  @override
  String get paywallLifetime => 'Lifetime';

  @override
  String get paywallLifetimeCaption => 'One-time payment · yours forever';

  @override
  String get paywallLifetimeBadge => 'BEST DEAL';

  @override
  String paywallStartCtaLifetime(String price) {
    return 'Start Pro · $price forever';
  }

  @override
  String get paywallRestore => 'Restaurar compra';

  @override
  String get paywallTerms => 'TÃ©rminos';

  @override
  String get paywallPrivacy => 'Privacidad';

  @override
  String get paywallNoRestore =>
      'No se encontrÃ³ ninguna compra previa en esta cuenta.';

  @override
  String get paywallRestoreLater =>
      'Restauraremos tu compra en la prÃ³xima sincronizaciÃ³n.';

  @override
  String get paywallAlreadyPro => 'Ya eres Pro. Gracias por el apoyo.';

  @override
  String get paywallHabitSlotHead =>
      'Has usado todos los espacios gratuitos de hÃ¡bitos. Desbloquea el conjunto completo para plantar cada ritual que te importa.';

  @override
  String get paywallHistoryHead =>
      'Ve tu historial completo â€” cada dÃ­a perfecto, cada medalla, cada regreso.';

  @override
  String get paywallMedalHead =>
      'Las medallas mÃ¡s raras son sÃ³lo Pro. EstÃ¡s mÃ¡s cerca de lo que crees.';

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
  String get settingsHowItWorks => 'CÃ³mo funciona';

  @override
  String get settingsSignOut => 'Cerrar sesiÃ³n';

  @override
  String get settingsSignOutConfirm =>
      'Â¿EstÃ¡s seguro de que quieres cerrar sesiÃ³n?';

  @override
  String get settingsProActive => 'Activo';

  @override
  String get settingsProFree => 'Nivel gratis';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsLanguageValue => 'Predeterminado del sistema';

  @override
  String get firstRunGreeting => '5 tareas. Ni una mÃ¡s. Haz que cuenten.';

  @override
  String get firstRunBody =>
      'Planta tu primera semilla â€” Â¿quÃ© importa hoy?';

  @override
  String get firstRunCta => 'Plantar mi primera semilla';

  @override
  String get emptyStateClearAll => 'Limpiar todo';

  @override
  String get cancel => 'Cancelar';

  @override
  String get intentionTitle1 => 'Â¡Vamos a plantar una nueva intenciÃ³n!';

  @override
  String get intentionBody1 =>
      'Todo bosque poderoso comienza con una pequeÃ±a elecciÃ³n. Dime, Â¿quÃ© estamos cultivando hoy?';

  @override
  String get intentionTitle2 => 'Â¿QuÃ© vamos a crecer hoy?';

  @override
  String get intentionBody2 =>
      'Semillas diminutas, cuidadas con esfuerzo, se convierten en Ã¡rboles altos. Elige la que mÃ¡s importa ahora mismo.';

  @override
  String get intentionTitle3 => 'Una semilla. Un respiro. Comienza.';

  @override
  String get intentionBody3 =>
      'No tienes que plantar todo el bosque de una vez â€” solo lo siguiente correcto.';

  @override
  String get intentionTitle4 => 'Cuida el siguiente paso pequeÃ±o.';

  @override
  String get intentionBody4 =>
      'Tu yo del futuro se construye con las elecciones que haces en los prÃ³ximos cinco minutos. Â¿CuÃ¡l es una amable?';

  @override
  String get intentionTitle5 => 'Elige en quÃ© quieres convertirte.';

  @override
  String get intentionBody5 =>
      'Las tareas son semillas, los hÃ¡bitos son brotes. Juntos forman un bosque del que estÃ¡s orgulloso.';

  @override
  String get intentionTitle6 => 'Planta algo que valga la pena recordar.';

  @override
  String get intentionBody6 =>
      'No todos los dÃ­as se sentirÃ¡n enormes. Una semilla regada aÃºn cuenta. Vamos a nombrar una.';

  @override
  String get intentionTitle7 => 'Haz que hoy sea un poco mÃ¡s valiente.';

  @override
  String get intentionBody7 =>
      'El coraje se acumula. Elige la semilla que has estado postergando â€” incluso nombrarla la mueve hacia adelante.';

  @override
  String get intentionTitle8 => 'Cuida la tierra antes de la semilla.';

  @override
  String get intentionBody8 =>
      'Â¿QuÃ© mentalidad, herramienta o pequeÃ±o harÃ¡ esta tarea mÃ¡s fÃ¡cil? AÃ±Ã¡delo a las notas.';

  @override
  String get shareCardSnapshot => 'Una foto de tu santuario';

  @override
  String get shareCardBody =>
      'La tarjeta de arriba se exporta como PNG y se envÃ­a a tu hoja de compartir. PublÃ­cala en tu historia, envÃ­ala a un amigo, o imprÃ­mela como pegatina.';

  @override
  String get shareCardShareMyBloom => 'Compartir mi flor';

  @override
  String get shareCardCouldNotShare => 'No se puede compartir ahora';

  @override
  String shareCardProgressText(String year) {
    return 'Mi progreso en Daily Stitch â€” $year en Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Acabo de desbloquear la medalla \"$title\" en Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'CÃ³mo funciona';

  @override
  String get howItWorksBody =>
      'Daily Stitch te ayuda a mantener una cadena pequeÃ±a e irrompible de disciplina. Eso es todo.';

  @override
  String get howItWorksToday => 'La pestaÃ±a Hoy';

  @override
  String get howItWorksTodayBody =>
      'Este es tu hogar. Muestra las 5 tareas y los hÃ¡bitos que estableciste para hoy. TermÃ­nalos antes de medianoche, la cadena se extiende.';

  @override
  String get howItWorksCap => 'El lÃ­mite de 5 tareas es la funciÃ³n';

  @override
  String get howItWorksCapBody =>
      'No te dejamos aÃ±adir un 6Âº. Ese es todo el punto. Toca el \"?\" en la pantalla principal para la explicaciÃ³n completa.';

  @override
  String get howItWorksHabits =>
      'Los hÃ¡bitos son diarios, la cadena es para siempre';

  @override
  String get howItWorksHabitsBody =>
      'Los hÃ¡bitos viven para siempre. Las tareas son Ãºnicas. Ambos alimentan la misma racha.';

  @override
  String get howItWorksLeftBehind => 'Tareas perdidas â†’ Pendientes';

  @override
  String get howItWorksLeftBehindBody =>
      'A medianoche, las tareas incompletas van a Pendientes. Re-aÃ±ade sÃ³lo las que aÃºn importan.';

  @override
  String get howItWorksProgress => 'La pestaÃ±a Progreso';

  @override
  String get howItWorksProgressBody =>
      'Racha, calendario, medallas, historial â€” todo sobre tu progreso. Nada urgente vive aquÃ­.';

  @override
  String get howItWorksYou => 'La pestaÃ±a TÃº';

  @override
  String get howItWorksYouBody =>
      'Tu cuenta, ajustes, cerrar sesiÃ³n. Eso es todo.';

  @override
  String get howItWorksRule =>
      'La regla: 5 cosas pequeÃ±as, todos los dÃ­as, sin excusas.';

  @override
  String get commonRetry => 'Reintentar';

  @override
  String get commonBack => 'AtrÃ¡s';

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
  String get commonError => 'Algo saliÃ³ mal';

  @override
  String get commonPageNotFound => 'PÃ¡gina no encontrada';

  @override
  String get commonHome => 'Inicio';

  @override
  String get commonUnknownError => 'Error de enrutamiento desconocido';

  @override
  String get commonSettingsTooltip => 'Ajustes';

  @override
  String get commonHowThisWorks => 'CÃ³mo funciona';

  @override
  String get myDayReminderSet => 'Recordatorio configurado';

  @override
  String get myDayPreparationNotes => 'NOTAS DE PREPARACIÃ“N';

  @override
  String get onboardingSkip => 'SALTAR';

  @override
  String get onboardingNext => 'Siguiente';

  @override
  String get onboardingEnterSanctuary => 'Entrar al Santuario';

  @override
  String get onboardingIntroduction => 'INTRODUCCIÃ“N';

  @override
  String get onboardingGrowYourForest => 'CRECE TU BOSQUE';

  @override
  String get onboardingPage1Title => 'Conoce a tu GuardiÃ¡n.';

  @override
  String get onboardingPage1Body =>
      'Bienvenido a tu Santuario Personal. AquÃ­, tu crecimiento se refleja en la vida de tu bosque.';

  @override
  String get onboardingPage2Title => 'Planta semillas. MÃ­ralas crecer.';

  @override
  String get onboardingPage2Body =>
      'Cada tarea es una semilla diminuta. Cada hÃ¡bito es un brote que cuidas a diario. Juntos forman un bosque de disciplina.';

  @override
  String get onboardingPage3Title => 'Cinco tareas. Una cadena.';

  @override
  String get onboardingPage3Body =>
      'Solo puedes plantar 5 semillas por dÃ­a. Ese lÃ­mite te obliga a enfocarte en lo que realmente importa â€” y proteger tu cadena.';

  @override
  String get onboardingPage4Title => 'Cuida tus brotes a diario.';

  @override
  String get onboardingPage4Body =>
      'Toca los hÃ¡bitos para hacerlos crecer. Salta un dÃ­a y la cadena no se extiende. El GuardiÃ¡n crece contigo.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Planta tu primera semilla.';

  @override
  String get authWelcomeBack => 'Bienvenido de vuelta, GuardiÃ¡n.';

  @override
  String get authFiveTasksDaily =>
      'Cinco tareas. HÃ¡bitos diarios. Sin excusas.';

  @override
  String get authSanctuaryWaiting => 'Tu santuario estÃ¡ esperando.';

  @override
  String get authSignIn => 'Iniciar sesiÃ³n';

  @override
  String get authSignUp => 'Registrarse';

  @override
  String get authEmail => 'CORREO ELECTRÃ“NICO';

  @override
  String get authPassword => 'CONTRASEÃ‘A';

  @override
  String get authEmailHint => 'tu@email.com';

  @override
  String get authCreateAccount => 'Crear cuenta';

  @override
  String get authSignInCta => 'Iniciar sesiÃ³n';

  @override
  String get authOrContinueWith => 'o continuar con';

  @override
  String get authContinueWithGoogle => 'Continuar con Google';

  @override
  String get authEnterEmail => 'Ingresa tu correo electrÃ³nico';

  @override
  String get authEnterValidEmail => 'Ingresa una direcciÃ³n de correo vÃ¡lida';

  @override
  String get authPasswordTooShort =>
      'La contraseÃ±a debe tener al menos 8 caracteres';

  @override
  String get authAccountCreated =>
      'Cuenta creada. Cambia a Iniciar sesiÃ³n y usa tu contraseÃ±a.';

  @override
  String get authSomethingWentWrong => 'Algo saliÃ³ mal. Intenta de nuevo.';

  @override
  String get authCouldNotStartGoogle =>
      'No se pudo iniciar sesiÃ³n con Google.';

  @override
  String get authMidnightReset =>
      'Al iniciar sesiÃ³n, aceptas que tu dÃ­a se reinicia a medianoche.';

  @override
  String get authSetupRequired => 'ConfiguraciÃ³n necesaria';

  @override
  String get settingsPersonalSanctuary => 'SANTUARIO PERSONAL';

  @override
  String get settingsHowThisWorks => 'CÃ³mo funciona';

  @override
  String get settingsHowThisWorksSubtitle =>
      'QuÃ© es la app, cÃ³mo funcionan el lÃ­mite y la racha';

  @override
  String get settingsStreakProtection => 'ProtecciÃ³n de racha';

  @override
  String get settingsStreakProtectionAvailable =>
      '1 congelamiento disponible este mes';

  @override
  String get settingsStreakProtectionUsed => 'Usado este mes';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Gestionar suscripciÃ³n Pro';

  @override
  String get settingsProCancelPlay => 'Cancelar o cambiar plan en Google Play';

  @override
  String get settingsProUnlock =>
      'Desbloquea los 5 hÃ¡bitos, historial completo y mÃ¡s';

  @override
  String get settingsTaskAlarms => 'Alarmas de tareas y Ãšltima llamada';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Aviso nocturno y alerta de medianoche';

  @override
  String get settingsHomeScreenWidget => 'Widget de pantalla de inicio';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'AÃ±ade tu racha a la pantalla de inicio';

  @override
  String get settingsShareBloomTracker => 'Compartir Daily Stitch';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'CuÃ©ntale a un amigo sobre la cadena';

  @override
  String get settingsHelpSupport => 'Ayuda y soporte';

  @override
  String get settingsHelpSupportSubtitle =>
      'Preguntas frecuentes o reportar un problema';

  @override
  String get settingsSignOutTile => 'Cerrar sesiÃ³n';

  @override
  String get settingsAllFeaturesUnlocked => 'Todas las funciones desbloqueadas';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'VersiÃ³n beta â€” las suscripciones estÃ¡n pausadas mientras probamos todo.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'VersiÃ³n $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'VersiÃ³n 1.0.0';

  @override
  String get settingsHabitMaster => 'Maestro de hÃ¡bitos';

  @override
  String settingsLevel(Object level) {
    return 'Nivel $level Â· Maestro de hÃ¡bitos';
  }

  @override
  String get languagePickerTitle => 'Idioma';

  @override
  String get youLast7Days => 'Ãšltimos 7 dÃ­as';

  @override
  String get youLast7DaysSubtitle => 'Historial de tareas dÃ­a a dÃ­a';

  @override
  String get youLeftBehindSubtitle =>
      'Tareas perdidas esperando ser re-aÃ±adidas';

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
  String get youPlantHabit => 'Planta un hÃ¡bito para iniciar una cadena.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'Desbloquea el sistema completo de disciplina.';

  @override
  String get youProFeatures =>
      '5 espacios de hÃ¡bitos, historial completo, medallas legendarias, congelamientos mensuales de racha, tarjetas compartibles semanales.';

  @override
  String get youSeePlans => 'Ver planes';

  @override
  String youFromPrice(Object price) {
    return 'desde $price/mes';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch Â· HÃ¡bitos y Tareas';

  @override
  String get progressMedals => 'Medallas';

  @override
  String get progressLast7Days => 'Ãšltimos 7 dÃ­as';

  @override
  String get progressSeeAll => 'Ver todo';

  @override
  String get progressSeeDayByDayActivity => 'Ver tu actividad dÃ­a a dÃ­a';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done de $total tareas terminadas Â· $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Sin medallas aÃºn â€” termina una tarea o cuida un brote para empezar.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Ver todas las medallas Â· $earned de $total ganadas';
  }

  @override
  String get progressGuardianInsight => 'Perspectiva del GuardiÃ¡n';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'PRÃ“XIMA INSIGNIA Â· $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return 'Objetivo de $days dÃ­as';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Ayuda y soporte';

  @override
  String get helpBody =>
      'La mayorÃ­a de las respuestas estÃ¡n abajo. Si no, envÃ­anos un mensaje y normalmente respondemos en 2â€“3 dÃ­as.';

  @override
  String get helpSectionFAQ => 'PREGUNTAS FRECUENTES';

  @override
  String get helpSectionContact => 'Â¿AÃšN NECESITAS AYUDA?';

  @override
  String get helpAddMessage => 'AÃ±ade un mensaje corto primero.';

  @override
  String get helpOpening => 'Abriendo tu aplicaciÃ³n de correoâ€¦';

  @override
  String get helpEmailUs => 'EscrÃ­benos';

  @override
  String get helpOpeningAction => 'Abriendoâ€¦';

  @override
  String get helpCopyEmail => 'Copiar correo de soporte';

  @override
  String get helpCopiedEmail => 'Copiado support@dailystitch.app';

  @override
  String get helpNoMailApp =>
      'No se encontrÃ³ aplicaciÃ³n de correo. EscrÃ­benos a support@dailystitch.app.';

  @override
  String get helpTopicLabel => 'Tema';

  @override
  String get helpWhatHappened => 'Â¿QuÃ© pasÃ³?';

  @override
  String get helpHint => 'Una descripciÃ³n corta ayuda muchoâ€¦';

  @override
  String get helpDisclaimer =>
      'Tocar \"EscrÃ­benos\" abre tu aplicaciÃ³n de correo con un mensaje prellenado (ningÃºn dato sale de tu dispositivo hasta que envÃ­es).';

  @override
  String get helpFaqQ1 => 'Â¿QuÃ© es el lÃ­mite de 5 tareas?';

  @override
  String get helpFaqA1 =>
      'Puedes aÃ±adir hasta 5 tareas por dÃ­a local. La 6Âª estÃ¡ bloqueada a propÃ³sito â€” la disciplina vence a la sobrecarga. El lÃ­mite es la funciÃ³n, no una limitaciÃ³n.';

  @override
  String get helpFaqQ2 => 'Â¿QuÃ© pasa a medianoche?';

  @override
  String get helpFaqA2 =>
      'A tu medianoche local, cualquier tarea que aÃºn estÃ© marcada como abierta se etiqueta como \"perdida\" y se mueve a Pendientes. Las rachas de hÃ¡bitos se reinician si el hÃ¡bito no se completÃ³ el dÃ­a anterior.';

  @override
  String get helpFaqQ3 => 'Â¿QuÃ© es Pendientes?';

  @override
  String get helpFaqA3 =>
      'Una lista amigable y descartable de tareas que no terminaste. Ãbrela, re-aÃ±ade solo lo que aÃºn importa y suelta lo demÃ¡s. El nivel gratis muestra los Ãºltimos 7 dÃ­as; Pro muestra el historial completo.';

  @override
  String get helpFaqQ4 => 'Â¿CÃ³mo funcionan las rachas?';

  @override
  String get helpFaqA4 =>
      'Un dÃ­a extiende la cadena cuando tuviste al menos 1 tarea y 0 se perdieron. Los dÃ­as con cero tareas ni extienden ni rompen la cadena. Un congelamiento de racha perdona un dÃ­a perdido al mes.';

  @override
  String get helpFaqQ5 => 'Â¿QuÃ© es el congelamiento de racha?';

  @override
  String get helpFaqA5 =>
      'Un \"congelamiento\" por mes calendario, solo para Pro. Ãšsalo en un dÃ­a que perdiste para mantener tu cadena viva. EncuÃ©ntralo en la pestaÃ±a de Progreso.';

  @override
  String get helpFaqQ6 => 'Â¿DÃ³nde se almacenan mis datos?';

  @override
  String get helpFaqA6 =>
      'Todos los datos viven en nuestro backend en la nube seguro bajo la cuenta que iniciÃ³ sesiÃ³n. Nunca vendemos ni compartimos. Consulta la polÃ­tica de privacidad enlistada en la tienda Play para mÃ¡s detalles.';

  @override
  String get helpFaqQ7 => 'Â¿CÃ³mo elimino mi cuenta?';

  @override
  String get helpFaqA7 =>
      'Ve a Ajustes â†’ Cuenta â†’ Eliminar cuenta. Esto elimina permanentemente tu perfil, tareas, hÃ¡bitos y datos de suscripciÃ³n. Las suscripciones activas de Play deben cancelarse por separado en Google Play.';

  @override
  String get helpTopicsGeneral => 'Pregunta general';

  @override
  String get helpTopicsBug => 'Reporte de error';

  @override
  String get helpTopicsStreak => 'Problema de racha / renovaciÃ³n';

  @override
  String get helpTopicsBilling => 'FacturaciÃ³n o nivel Pro';

  @override
  String get helpTopicsAccount => 'Cuenta y datos';

  @override
  String get helpTopicsFeature => 'Solicitud de funciÃ³n';

  @override
  String get helpAccountAnon => '(sin sesiÃ³n iniciada)';

  @override
  String get splashTagline => 'Cuida semillas pequeÃ±as. Haz crecer un bosque.';

  @override
  String get priorityStandard => 'ESTÃNDAR';

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
  String get settingsDeleteAccountConfirmTitle => 'Â¿Eliminar tu cuenta?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Esto elimina permanentemente tu perfil, tareas, hÃ¡bitos y progreso. Las suscripciones activas deben cancelarse en Google Play por separado. Esto no se puede deshacer.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Eliminar para siempre';

  @override
  String get settingsDeleteAccountSuccess => 'Tu cuenta ha sido eliminada.';

  @override
  String get settingsDeleteAccountFailed =>
      'No se pudo eliminar la cuenta. Intenta de nuevo o escrÃ­benos a support@dailystitch.app.';

  @override
  String get referralYouTitle => 'Invita amigos Â· gana Pro gratis';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress de $milestone amigos se unieron';
  }

  @override
  String get referralYouShare => 'Compartir invitaciÃ³n';

  @override
  String get referralYouDetails => 'Ver detalles';

  @override
  String get referralPaywallTitle => 'Mes de Pro gratis';

  @override
  String get referralPaywallBody =>
      'Invita 5 amigos que se registren â†’ 1 mes de Pro gratis';

  @override
  String get referralPaywallProBody =>
      'Sigue invitando â€” acumula meses de Pro gratis';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'No se pudo cargar tu progreso. Intenta de nuevo mÃ¡s tarde.';

  @override
  String get insightsMetricCurrentChain => 'CADENA ACTUAL';

  @override
  String get insightsMetricBestEver => 'MEJOR JAMÃS';

  @override
  String get insightsMetricTasksDone => 'TAREAS COMPLETADAS';

  @override
  String get insightsMetricPerfectDays => 'DÃAS PERFECTOS';

  @override
  String get insightsMetricHabits => 'HÃBITOS';

  @override
  String get insightsDay => 'dÃ­a';

  @override
  String get insightsDays => 'dÃ­as';

  @override
  String get insightsSectionThisWeek => 'Esta semana';

  @override
  String get insightsShareMyWeek => 'Compartir mi semana';

  @override
  String get insightsShareMyWeekPro => 'Compartir mi semana Â· Pro';

  @override
  String get insightsShareReceiptText =>
      'Mi semana en Daily Stitch. No rompas la cadena.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Mostrando los Ãºltimos $days dÃ­as';
  }

  @override
  String get insightsHistoryUpsell =>
      'Desbloquea tu historial completo con Pro';

  @override
  String get referralScreenTitle => 'Invitar amigos';

  @override
  String get referralLaunchGift => 'Regalo de lanzamiento';

  @override
  String get referralRewardTitle => 'ObtÃ©n 1 mes de Pro gratis';

  @override
  String get referralRewardBody =>
      'Comparte tu cÃ³digo con amigos. Cuando 5 personas se registren con Ã©l, desbloqueas Daily Stitch Pro por un mes completo.';

  @override
  String get referralYourCode => 'Tu cÃ³digo de referido';

  @override
  String get referralCopyCodeTooltip => 'Copiar cÃ³digo';

  @override
  String get referralCodeCopied => 'CÃ³digo de referido copiado';

  @override
  String get referralShareWithFriends => 'Compartir con amigos';

  @override
  String get referralFooterHint =>
      'Los amigos introducen tu cÃ³digo al crear una cuenta. Cada amigo cuenta una vez para tu recompensa.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count amigo se uniÃ³';
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
      'Recompensa desbloqueada â€” Â¡disfruta tu mes gratis de Pro!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining mÃ¡s para desbloquear tu mes gratis';
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
  String get manageProReferralHint => 'Invita mÃ¡s amigos para extender tu Pro';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nAÃ±ade API_BASE_URL y GOOGLE_CLIENT_ID (o el legado GOOGLE_CLIENT_ID) a leanspace/.env, luego reconstruye:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Predeterminado del sistema';

  @override
  String get languageNameEn => 'English';

  @override
  String get languageNameUr => 'Ø§Ø±Ø¯Ùˆ (Urdu)';

  @override
  String get languageNameEs => 'EspaÃ±ol';

  @override
  String get languageNamePt => 'PortuguÃªs';

  @override
  String get languageNameFr => 'FranÃ§ais';

  @override
  String get languageNameDe => 'Deutsch';

  @override
  String get languageNameIt => 'Italiano';

  @override
  String get languageNameAr => 'Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©';

  @override
  String get languageNameTr => 'TÃ¼rkÃ§e';

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
  String get settingsInviteFriendsTitle => 'Invitar amigos Â· Pro gratis';

  @override
  String get settingsInviteFriendsSubtitle =>
      'ObtÃ©n 1 mes gratis cuando 5 amigos se unan';

  @override
  String get themePickerTitle => 'Santuario personal';

  @override
  String get themePickerSubtitle =>
      'Elige una paleta de colores que te traiga paz.';

  @override
  String get themeNameClassicBloom => 'FloraciÃ³n ClÃ¡sica';

  @override
  String get themeNameSolarTerracotta => 'Terracota Solar';

  @override
  String get themeNameMidnightOasis => 'Oasis de Medianoche';

  @override
  String get themeNameLavenderDream => 'SueÃ±o de Lavanda';

  @override
  String get themeNameNordicFrost => 'Escarcha NÃ³rdica';

  @override
  String get themeNameCyberpunkNeon => 'NeÃ³n Cyberpunk';

  @override
  String get reminderTitle => 'Recordatorios';

  @override
  String get reminderBody =>
      'Ãšltima llamada te avisa antes de medianoche si hay tareas abiertas.';

  @override
  String get reminderFinalCall => 'Ãšltima llamada';

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
      'Aviso nocturno y recordatorios de Ãšltima llamada';

  @override
  String get notificationChannelAlarms => 'Alarmas de tareas de Daily Stitch';

  @override
  String get notificationChannelAlarmsDesc =>
      'Alarmas fuertes para recordatorios de tareas';

  @override
  String get notificationTaskReminderTitle => 'Recordatorio de tarea';

  @override
  String get notificationFinalCallTitle => 'Ãšltima llamada';

  @override
  String notificationFinalCallBody(int count) {
    return 'AÃºn tienes $count tarea(s) abierta(s) hoy.';
  }

  @override
  String get notificationEveningTitle => 'Consulta nocturna';

  @override
  String get notificationEveningBody => 'Â¿CÃ³mo creciÃ³ tu jardÃ­n hoy?';

  @override
  String get widgetSetupTitle => 'AÃ±adir widget de cadena';

  @override
  String get widgetSetupBody =>
      'MantÃ©n tu racha en la pantalla de inicio â€” sin necesidad de abrir la app.';

  @override
  String get widgetSetupAdd => 'AÃ±adir a pantalla de inicio';

  @override
  String get widgetSetupStep1 => 'MantÃ©n presionada la pantalla de inicio';

  @override
  String get widgetSetupStep2 => 'Toca Widgets';

  @override
  String get widgetSetupStep3 => 'Encuentra Daily Stitch y arrÃ¡stralo';

  @override
  String get widgetSetupPinSuccess =>
      'Revisa tu pantalla de inicio para colocar el widget.';

  @override
  String get widgetSetupPinFallback =>
      'Tu lanzador puede no soportar aÃ±adir con un toque. Usa los pasos manuales a continuaciÃ³n.';

  @override
  String get paywallWelcomePro => 'Bienvenido a Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'AHORRA ~16%';

  @override
  String get paywallTermsTitle => 'TÃ©rminos de suscripciÃ³n';

  @override
  String get paywallTermsBody =>
      'La facturaciÃ³n la maneja Google Play. Las suscripciones se renuevan automÃ¡ticamente hasta que canceles en Play Store â†’ Suscripciones al menos 24 horas antes del final del perÃ­odo actual. Puedes gestionar o cancelar tu suscripciÃ³n en cualquier momento desde tu cuenta de Google Play.\n\nDesinstalar la app no cancela tu suscripciÃ³n.\n\nLos precios mostrados estÃ¡n en tu moneda local y pueden variar por regiÃ³n. Pueden aplicarse impuestos.';

  @override
  String get paywallPrivacyTitle => 'Privacidad';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch almacena tus tareas, hÃ¡bitos y datos de racha en nuestro backend seguro, vinculados a tu cuenta. Nunca vendemos tus datos.\n\nLas compras de suscripciÃ³n son procesadas por Google Play. Recibimos un token de compra verificado de Google para confirmar tu estado Pro. No vemos ni almacenamos tus datos de pago.\n\nPuedes solicitar exportaciÃ³n completa de datos o eliminaciÃ³n de cuenta desde Ajustes â†’ EliminaciÃ³n de cuenta.';

  @override
  String get paywallCloseTooltip => 'Cerrar';

  @override
  String get paywallFooterLinks => 'Restaurar Â· TÃ©rminos Â· Privacidad';

  @override
  String get manageProTitle => 'SuscripciÃ³n Pro';

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
      'EstÃ¡s usando Daily Stitch Gratis. Actualiza para desbloquear el sistema completo.';

  @override
  String get manageProSectionManage => 'GESTIONAR';

  @override
  String get manageProOpenPlay => 'Abrir suscripciones de Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Cancelar, cambiar plan o actualizar mÃ©todo de pago';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Encuentra tu suscripciÃ³n existente (si la hay) aquÃ­';

  @override
  String get manageProShareApp => 'Compartir Daily Stitch';

  @override
  String get manageProShareSubtitle => 'CuÃ©ntale a un amigo sobre la cadena';

  @override
  String get manageProSectionHelp => 'Â¿NECESITAS AYUDA?';

  @override
  String get manageProHelpTitle => 'Ayuda y soporte';

  @override
  String get manageProHelpSubtitle =>
      'Preguntas frecuentes de suscripciÃ³n, contacto, reportes de errores';

  @override
  String manageProBillingFooter(String version) {
    return 'FacturaciÃ³n manejada por Google Play Â· $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Abre la app Google Play Store â†’ toca tu perfil â†’ Pagos y suscripciones â†’ Suscripciones.';

  @override
  String get addTaskGrowSomething => 'Haz crecer algo';

  @override
  String get addTaskPlantSprout => 'Plantar un brote';

  @override
  String get addTaskIntentionName => 'NOMBRE DE LA INTENCIÃ“N';

  @override
  String get addTaskSproutName => 'NOMBRE DEL BROTE';

  @override
  String get addTaskHintTask => 'ej., Saludo al sol matutino';

  @override
  String get addTaskHintHabit => 'ej. Yoga matutino';

  @override
  String get addTaskWhen => 'Â¿CUÃNDO?';

  @override
  String get addTaskPriority => 'PRIORIDAD';

  @override
  String get addTaskNotes => 'NOTAS';

  @override
  String get addTaskCadenceDaily => 'Diario';

  @override
  String get addTaskCadenceWeekdays => 'DÃ­as laborales';

  @override
  String get addTaskCadence3x => '3x/semana';

  @override
  String get addTaskCadenceWeekly => 'Semanal';

  @override
  String get addTaskPlantIntention => 'Plantar intenciÃ³n';

  @override
  String get addTaskPlantSproutCta => 'Plantar brote';

  @override
  String get addTaskPlanting => 'Plantandoâ€¦';

  @override
  String get addTaskNameIntentionError => 'Nombra tu intenciÃ³n';

  @override
  String get addTaskNameSproutError => 'Nombra tu brote';

  @override
  String get addTaskNotesMigrationWarning =>
      'Tarea guardada. Las notas y prioridad requieren la Ãºltima migraciÃ³n del backend.';

  @override
  String get addTaskNoSproutSlots =>
      'No hay espacios de brote vacÃ­os â€” cuida uno primero.';

  @override
  String get addTaskSaveSproutError =>
      'No se pudo guardar el brote â€” intenta de nuevo.';

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
  String get addTaskPreparationNotes => 'NOTAS DE PREPARACIÃ“N';

  @override
  String get addTaskTendingNotes => 'NOTAS DE CUIDADO';

  @override
  String get addTaskNotesHintTask =>
      'Â¿AlgÃºn consejo o herramienta para esta tarea?';

  @override
  String get addTaskNotesHintHabit => 'Â¿CÃ³mo se ve cuidar este brote?';

  @override
  String get addTaskChooseElement => 'ELEGIR ELEMENTO';

  @override
  String get addTaskElementsTooltip => 'Â¿QuÃ© significan los elementos?';

  @override
  String get addTaskTaskSeed => 'Semilla de tarea';

  @override
  String get addTaskHabitSprout => 'Brote de hÃ¡bito';

  @override
  String get addTaskPickElement => 'Elige el elemento correcto';

  @override
  String get addTaskPickElementBody =>
      'Cada elemento corresponde a un tipo diferente de esfuerzo. El GuardiÃ¡n crece mÃ¡s fuerte cuando riegas el correcto.';

  @override
  String get addTaskClearForm => 'Limpiar formulario';

  @override
  String get shareCouldNotShare => 'No se pudo compartir ahora';

  @override
  String get authReferralCodeLabel => 'CÃ³digo de referido (opcional)';

  @override
  String get authReferralCodeHint => 'CÃ³digo de amigo';

  @override
  String get youPerkHabitSlots => '5 espacios de hÃ¡bitos';

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
      'Las compras in-app no estÃ¡n disponibles en este dispositivo.';

  @override
  String get subscriptionLoadFailed =>
      'No se pudieron cargar las opciones de suscripciÃ³n.';

  @override
  String get subscriptionVerifyFailed =>
      'No se pudo verificar la compra. Intenta Restaurar compra.';

  @override
  String get streakFreezeFailed => 'No se pudo usar el congelamiento de racha.';

  @override
  String get streakFreezeAlreadyUsed => 'Ya usaste tu congelamiento este mes.';

  @override
  String get streakFreezeNoMissed =>
      'No hay tareas perdidas ese dÃ­a para congelar.';

  @override
  String get streakFreezeNotPastDay => 'Solo puedes congelar un dÃ­a pasado.';

  @override
  String get myDayLoadError =>
      'No se pudo cargar Mi dÃ­a. Desliza para actualizar.';

  @override
  String get myDayCapReached => 'Has alcanzado el lÃ­mite de 5 tareas de hoy.';

  @override
  String get myDayRemoveTaskError => 'No se pudo eliminar la tarea.';

  @override
  String get shareCardTitle => 'Compartir tu semana';

  @override
  String get shareCardCta => 'Compartir imagen';

  @override
  String get medalTierSprout => 'Brote';

  @override
  String get medalTierCommon => 'ComÃºn';

  @override
  String get medalTierRare => 'Raro';

  @override
  String get medalTierEpic => 'Ã‰pico';

  @override
  String get medalTierLegendary => 'Legendario';

  @override
  String get medalCategoryTasks => 'Tareas';

  @override
  String get medalCategoryHabits => 'HÃ¡bitos';

  @override
  String get medalCategoryStreaks => 'Rachas';

  @override
  String get medalCategoryMastery => 'MaestrÃ­a';

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
      'Comparte el logro con tu cÃ­rculo. La tarjeta se exporta como PNG y estÃ¡ lista para cualquier red social.';

  @override
  String get shareCardCtaPreparing => 'Preparandoâ€¦';

  @override
  String get shareCardMilestone => 'NUEVO HITO DESBLOQUEADO';

  @override
  String get shareCardStatChain => 'dÃ­as de cadena';

  @override
  String get shareCardStatSprouts => 'brotes';

  @override
  String get shareCardStatMedals => 'medallas';

  @override
  String shareCardHeadlineStreak(int days) {
    return 'Racha de $days dÃ­as';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Medallas Ganadas';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'GuardiÃ¡n de brotes';

  @override
  String get shareCardHeadlineFirstSeeds => 'Primeras Semillas Plantadas';

  @override
  String get shareCardHeadlineGardenBegins => 'Un JardÃ­n Comienza';

  @override
  String get shareCardSubheadMonth =>
      'Has cultivado exitosamente tus hÃ¡bitos durante un mes completo.';

  @override
  String get shareCardSubheadWeek =>
      'Una semana completa de crecimiento â€” tu bosque se estÃ¡ engrosando.';

  @override
  String get shareCardSubheadProgress =>
      'Tu santuario muestra progreso real. Sigue cuidando.';

  @override
  String get shareCardSubheadSprouts =>
      'Tus primeros brotes estÃ¡n echando raÃ­ces. RÃ­egalos a diario.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Tus primeras semillas estÃ¡n en la tierra. MÃ­ralas abrir.';

  @override
  String get shareCardSubheadFallback =>
      'Todo bosque comienza con una pequeÃ±a elecciÃ³n.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch â€” cinco semillas pequeÃ±as al dÃ­a, una cadena irrompible. Planta la tuya.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Prueba Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Estoy construyendo mi cadena diaria en Daily Stitch â€” Ãºnete con mi cÃ³digo de referido $code y ambos crecemos.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Ãšnete a Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Mi progreso en Daily Stitch â€” $year en Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Acabo de desbloquear la medalla \"$title\" en Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Tareas completadas';

  @override
  String get insightsReceiptPerfectDays => 'DÃ­as perfectos';

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
      'Restaurar. HidrataciÃ³n, descanso, cuidado emocional â€” cualquier cosa que repozne el pozo.';

  @override
  String get elementTaglineLight =>
      'Despertar. Luz matutina, bloques de enfoque, estudio, meditaciÃ³n â€” energÃ­a y claridad.';

  @override
  String get elementTaglineSoil =>
      'Enraizar. Leer, llevar un diario, trabajo profundo â€” raÃ­ces lentas que construyen fuerza a largo plazo.';

  @override
  String get elementTaglineBreeze =>
      'Mover. Caminar, correr, respiraciÃ³n â€” energÃ­a ligera y mÃ³vil que despeja la mente.';

  @override
  String get elementWhenWater => 'Cuando te sientes agotado o sin energÃ­a.';

  @override
  String get elementWhenLight =>
      'Cuando necesitas un comienzo claro para tu dÃ­a.';

  @override
  String get elementWhenSoil =>
      'Cuando el trabajo es lento pero vale la pena (estudio, oficio, cuidado).';

  @override
  String get elementWhenBreeze =>
      'Cuando tu cuerpo (o mente) necesita moverse y respirar.';

  @override
  String get bloomTierMastery => 'MaestrÃ­a';

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
    return 'Racha de $count dÃ­as Â· $element';
  }

  @override
  String get medal_id_first_spark => 'Primera Chispa';

  @override
  String get medal_sub_first_spark => 'Encendiste la mecha.';

  @override
  String get medal_desc_first_spark =>
      'Termina tu primera tarea. Toda cadena comienza aquÃ­.';

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
  String get medal_sub_quarter_century => 'Una temporada de decir sÃ­.';

  @override
  String get medal_desc_quarter_century => 'Termina 25 tareas en total.';

  @override
  String get medal_id_productivity_titan => 'TitÃ¡n de Productividad';

  @override
  String get medal_sub_productivity_titan => 'La constancia se compone.';

  @override
  String get medal_desc_productivity_titan =>
      'Termina 50 tareas â€” has construido un verdadero impulso.';

  @override
  String get medal_id_century_planter => 'Plantador del Siglo';

  @override
  String get medal_sub_century_planter => 'Un bosque propio.';

  @override
  String get medal_desc_century_planter =>
      'Termina 100 tareas. EstÃ¡s en el top 5% de usuarios.';

  @override
  String get medal_id_clean_day => 'DÃ­a Limpio';

  @override
  String get medal_sub_clean_day => 'Ni una sola mala hierba.';

  @override
  String get medal_desc_clean_day =>
      'Termina cada tarea que plantas en un solo dÃ­a.';

  @override
  String get medal_id_triple_perfect => 'Triple Perfecto';

  @override
  String get medal_sub_triple_perfect => 'Tres ejecuciones impecables.';

  @override
  String get medal_desc_triple_perfect => 'Alcanza 3 dÃ­as perfectos.';

  @override
  String get medal_id_perfect_week => 'Semana Perfecta';

  @override
  String get medal_sub_perfect_week => 'Siete dÃ­as sin interrupciones.';

  @override
  String get medal_desc_perfect_week => '7 dÃ­as perfectos seguidos.';

  @override
  String get medal_id_two_week_chain => 'Fuerza del Fortnight';

  @override
  String get medal_sub_two_week_chain => 'Dos semanas de fuego.';

  @override
  String get medal_desc_two_week_chain => 'MantÃ©n una cadena de 14 dÃ­as.';

  @override
  String get medal_id_iron_chain => 'Cadena de Hierro';

  @override
  String get medal_sub_iron_chain => '30 eslabones forjados.';

  @override
  String get medal_desc_iron_chain =>
      'Una cadena de 30 dÃ­as. La medalla mÃ¡s difÃ­cil.';

  @override
  String get medal_id_quarterly_chain => 'Cadena Trimestral';

  @override
  String get medal_sub_quarterly_chain => 'Una temporada, sin interrupciones.';

  @override
  String get medal_desc_quarterly_chain =>
      'Una cadena de 90 dÃ­as. Estatus legendario.';

  @override
  String get medal_id_vital_priority => 'Chispa Vital';

  @override
  String get medal_sub_vital_priority => 'Elegiste las difÃ­ciles.';

  @override
  String get medal_desc_vital_priority =>
      'Termina 5 tareas marcadas como Prioridad Vital.';

  @override
  String get medal_id_spark_priority => 'Domador de Chispas';

  @override
  String get medal_sub_spark_priority => 'Las victorias rÃ¡pidas se acumulan.';

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
      'Agrega notas de preparaciÃ³n a 5 tareas diferentes.';

  @override
  String get medal_id_left_behind_rescuer => 'Rescatador de Dejados';

  @override
  String get medal_sub_left_behind_rescuer => 'Ninguna tarea dejada atrÃ¡s.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Re-agrega 3 tareas perdidas al dÃ­a siguiente.';

  @override
  String get medal_id_first_sprout => 'Primera Brote';

  @override
  String get medal_sub_first_sprout => 'Un nuevo ritual diario.';

  @override
  String get medal_desc_first_sprout => 'Planta tu primer hÃ¡bito.';

  @override
  String get medal_id_trio_sprout => 'Trio Brote';

  @override
  String get medal_sub_trio_sprout => 'Un pequeÃ±o ecosistema.';

  @override
  String get medal_desc_trio_sprout => 'Planta 3 hÃ¡bitos diferentes.';

  @override
  String get medal_id_week_of_growth => 'Semana de Crecimiento';

  @override
  String get medal_sub_week_of_growth => 'Las raÃ­ces empiezan a sostener.';

  @override
  String get medal_desc_week_of_growth =>
      'Cuida un hÃ¡bito todos los dÃ­as durante 7 dÃ­as.';

  @override
  String get medal_id_fortnight_floret => 'Floreciente del Fortnight';

  @override
  String get medal_sub_fortnight_floret => 'Una floraciÃ³n completa.';

  @override
  String get medal_desc_fortnight_floret =>
      'Una racha de hÃ¡bitos de 14 dÃ­as.';

  @override
  String get medal_id_rooted_master => 'Maestro Arraigado';

  @override
  String get medal_sub_rooted_master => 'RaÃ­ces profundas, fuerza profunda.';

  @override
  String get medal_desc_rooted_master => 'Una racha de hÃ¡bitos de 30 dÃ­as.';

  @override
  String get medal_id_half_year_bloom => 'FloraciÃ³n Semestral';

  @override
  String get medal_sub_half_year_bloom => 'El jardÃ­n es permanente ahora.';

  @override
  String get medal_desc_half_year_bloom =>
      'MantÃ©n un solo hÃ¡bito durante 180 dÃ­as.';

  @override
  String get medal_id_garden_keeper => 'Custodio del JardÃ­n';

  @override
  String get medal_sub_garden_keeper => 'Variedad, juntos.';

  @override
  String get medal_desc_garden_keeper =>
      'Cultiva 4 hÃ¡bitos diferentes al mismo tiempo.';

  @override
  String get medal_id_hydration_hero => 'HÃ©roe de la HidrataciÃ³n';

  @override
  String get medal_sub_hydration_hero => 'Rellenas el pozo.';

  @override
  String get medal_desc_hydration_hero =>
      'Planta un hÃ¡bito de hidrataciÃ³n (agua/bebida).';

  @override
  String get medal_id_mindful_mover => 'Movimiento Consciente';

  @override
  String get medal_sub_mindful_mover => 'El cuerpo recuerda.';

  @override
  String get medal_desc_mindful_mover =>
      'Planta un hÃ¡bito de movimiento (yoga/correr/caminar).';

  @override
  String get medal_id_devoted_keeper => 'Custodio Devoto';

  @override
  String get medal_sub_devoted_keeper => 'Sesenta dÃ­as, una prÃ¡ctica.';

  @override
  String get medal_desc_devoted_keeper =>
      'Cuida un solo hÃ¡bito durante 60 dÃ­as seguidos.';

  @override
  String get medal_id_tending_notes => 'Notas de Cuidado';

  @override
  String get medal_sub_tending_notes => 'Reflexiona mientras avanzas.';

  @override
  String get medal_desc_tending_notes =>
      'Agrega notas de cuidado a 3 hÃ¡bitos.';

  @override
  String get medalTierTaglineSprout => 'Planta la primera semilla';

  @override
  String get medalTierTaglineCommon => 'Construir el hÃ¡bito';

  @override
  String get medalTierTaglineRare => 'Mostrando un verdadero impulso';

  @override
  String get medalTierTaglineEpic => 'Eres una fuerza de la naturaleza';

  @override
  String get medalTierTaglineLegendary => 'MÃ­tico, casi nadie llega aquÃ­';

  @override
  String get guardianHeadlineNoTasks =>
      'El suelo de hoy estÃ¡ fresco.\nPlanta tu primera semilla\ny mira crecer.';

  @override
  String get guardianHeadlineAllDone =>
      'Cada semilla que plantaste\nestÃ¡ en flor.\nDescansa, GuardiÃ¡n â€” te lo ganaste.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count dÃ­as\nde crecimiento ininterrumpido.\nTu bosque estÃ¡ lleno de vida.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Una semana completa en flor,\nGuardiÃ¡n.\nUn dÃ­a mÃ¡s perfecto\nextiende la cadena.';

  @override
  String get guardianHeadlineStreak3 =>
      'Tu cadena se sostiene.\nCuida las semillas\nque esperan abrirse.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'EstÃ¡s cuidando bien las tareas.\nPlanta un brote â€”\nlos hÃ¡bitos hacen crecer los bosques.';

  @override
  String get guardianHeadlineSomeDone =>
      'Algunas semillas abrieron,\notras no. EstÃ¡ bien.\nMaÃ±ana es otra siembra.';

  @override
  String get guardianHeadlineMorning =>
      'Buenos dÃ­as, GuardiÃ¡n.\nEl dÃ­a es joven\ny el suelo estÃ¡ listo.';

  @override
  String get guardianHeadlineAfternoon =>
      'Buenas tardes, GuardiÃ¡n.\nQueda la mitad de la luz â€”\nsigue cuidando.';

  @override
  String get guardianHeadlineEvening =>
      'Buenas noches, GuardiÃ¡n.\nUna Ãºltima revisiÃ³n\nantes de que se ponga el sol.';

  @override
  String get guardianHeadlineNight =>
      'Â¿Quemando el aceite de medianoche?\nIncluso los Guardianes descansan.\nPlanta la semilla de maÃ±ana.';

  @override
  String get guardianBodyNoTasks =>
      'Tu santuario estÃ¡ en silencio ahora. Agrega una intenciÃ³n y mira quÃ© cambia al atardecer.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count dÃ­as en marcha. La cadena no es suerte â€” son las pequeÃ±as elecciones acumulÃ¡ndose. Sigue acumulando.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Una cadena de $count dÃ­as es un impulso real. Termina las semillas abiertas de hoy antes de decir que has terminado.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Has plantado $count tareas hasta ahora. Agregar incluso un solo brote de hÃ¡bito harÃ­a que el trabajo crezca dÃ­a a dÃ­a.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'EstÃ¡s terminando el $pct% de lo que plantas. Menos semillas, mÃ¡s afiladas, tienden a crecer mÃ¡s altas que diez dispersas.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Tu santuario estÃ¡ vivo. $tasks tareas hechas, $sprouts brotes creciendo â€” el trabajo se nota.';
  }

  @override
  String get guardianInsightWaitingTitle => 'Esperando tu primer movimiento';

  @override
  String get guardianInsightWaitingBody =>
      'Agrega una tarea o hÃ¡bito y empezarÃ© a leer los patrones en tu jardÃ­n. Cuanto mÃ¡s plantes, mÃ¡s tengo para aprender.';

  @override
  String get guardianInsightWaitingCta => 'Planta tu primera semilla';

  @override
  String get guardianInsightChainSuperTitle => 'La cadena es tu superpoder';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Has mantenido una cadena de $count dÃ­as. Las rachas vencen a la motivaciÃ³n cada vez â€” mantenla cÃ¡lida, incluso en dÃ­as lentos.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Agrega la semilla de maÃ±ana';

  @override
  String get guardianInsightChainColdTitle =>
      'La cadena estÃ¡ frÃ­a â€” empieza una nueva';

  @override
  String get guardianInsightChainColdBody =>
      'Has plantado antes, lo que significa que puedes plantar de nuevo. Una tarea pequeÃ±a hecha hoy es una cadena mÃ¡s larga maÃ±ana.';

  @override
  String get guardianInsightChainColdCta => 'Planta una semilla';

  @override
  String get guardianInsightLessIsMoreTitle => 'Menos es mÃ¡s esta semana';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Terminas aproximadamente el $pct% de lo que plantas. Prueba 3 intenciones afiladas en vez de 5 dispersas â€” la calidad se compone.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Afila el dÃ­a';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Siguiente medalla: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Llevas $value de $target $unit. Unos dÃ­as mÃ¡s honestos y es tuya.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Mostrar medalla';

  @override
  String get guardianInsightSteadyTitle => 'EstÃ¡s en una temporada estable';

  @override
  String get guardianInsightSteadyBody =>
      'Ninguna medalla a la vista â€” estÃ¡ bien. Cuida lo que tienes. La prÃ³xima floraciÃ³n estÃ¡ en camino.';

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
  String get notificationEveningBodyOne => 'AÃºn tienes 1 tarea abierta hoy.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'AÃºn tienes $count tareas abiertas hoy.';
  }

  @override
  String get notificationTickerTaskReminder => 'Recordatorio de tarea';

  @override
  String get notificationTickerTaskAlarm => 'Alarma de tarea';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count dÃ­as de racha Â· $element';
  }
}
