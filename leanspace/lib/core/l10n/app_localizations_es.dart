// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Bloom Tracker';

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
  String get navPaywall => 'Bloom Tracker Pro';

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
  String get taskCapBulletDone => 'Done tasks count toward your chain';

  @override
  String get taskCapBulletDoneBody =>
      'A day where all 5 are done extends your streak by one.';

  @override
  String get taskCapBulletMissed => 'Missed tasks roll to Left Behind';

  @override
  String get taskCapBulletMissedBody =>
      'At midnight, unfinished tasks surface in Left Behind. Re-add only what still matters.';

  @override
  String get taskCapBulletFreeze => 'Streak freeze forgives a miss';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro gives you 2 streak freezes a month — they cover a missed day so your chain survives.';

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
    return '$count growing';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Best $days d';
  }

  @override
  String get habitsPlantNew => 'Plantar un nuevo brote de hábito';

  @override
  String get habitsPlantFirst => 'Plantar un hábito';

  @override
  String get habitsLocked =>
      'Espacio de hábito Pro — desbloquéalo para plantar más';

  @override
  String get habitsCadence => 'DIARIO';

  @override
  String leftBehindBanner(String count) {
    return '$count missed — still in Left Behind';
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
    return 'This will permanently remove $count missed task(s). You can\'t undo this.';
  }

  @override
  String get leftBehindReAdd => 'Re-add today';

  @override
  String get leftBehindLetGo => 'Soltar';

  @override
  String streakAtRisk(String count) {
    return '$count task(s) left for today';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Last call — $count task(s) still open';
  }

  @override
  String get streakAtRiskBody =>
      'Midnight is close. The chain depends on these.';

  @override
  String get streakAtRiskBodyLow =>
      'You still have time. A clean day extends your streak.';

  @override
  String get streakAtRiskFreeze => 'Yesterday missed — use a streak freeze?';

  @override
  String get chainBrokenTitle => 'The chain broke. That\'s okay.';

  @override
  String get chainBrokenBody =>
      'Every long chain ends once. What matters is what you plant today. One perfect day starts the next one.';

  @override
  String get chainBrokenCta => 'Get back to today';

  @override
  String get chainBrokenCheck => 'Check Left Behind first';

  @override
  String get chainBrokenBestChain => 'best chain';

  @override
  String get chainBrokenTasksDone => 'tasks done';

  @override
  String get chainBrokenSprouts => 'sprouts';

  @override
  String get chainRecoveryFreshStart => 'A fresh start';

  @override
  String get medalsTitle => 'Mis medallas';

  @override
  String get medalsTrophyRoom => 'Sala de trofeos';

  @override
  String get medalsAllMedals => 'Todas las medallas';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned of $total medals earned';
  }

  @override
  String get medalsTrophyEmpty => 'Your first badge is one task away';

  @override
  String get medalsTrophyFirst => 'You earned your first medal — keep going';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned medals in your trophy room';
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
    return 'Just $n more $unit to unlock.';
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
  String historyThisWeek(String days) {
    return 'LAST $days DAYS';
  }

  @override
  String get historyDayByDay => 'DÍA A DÍA';

  @override
  String get historyEmpty => 'Plant some seeds to see your week unfold.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'You finished $done of $total tasks. $perfect perfect day(s).';
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
    return '$count left behind';
  }

  @override
  String get progressVitality => 'VITALIDAD DE HOY';

  @override
  String get progressVitalityEmpty =>
      'Planta una semilla para empezar tu jardín.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done of $total seeds planted today.';
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
    return '$earned of $total';
  }

  @override
  String get progressPersonalActivity => 'Actividad personal';

  @override
  String progressBrowseMonth(String month) {
    return 'Browsing $month. Tap \"Today\" to jump back to your live activity.';
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
      'Bloom Tracker Pro te da el sistema completo de disciplina.';

  @override
  String get paywallFeatures =>
      'All 5 habit slots, not just 3|Your full history, forever|The full medal set|Streak freeze every month|Weekly Receipt + share cards|Themes + more';

  @override
  String get paywallFeaturesBodies =>
      'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.|Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.|Unlock Legendary tier medals. The rarest badges are for the people who go all in.|2 streak freezes a month so a single bad day doesn\'t end your chain.|Beautiful share cards of your week. Post your chain, inspire someone else to start.|Unlock new accent colors and themes as we add them. Always free updates.';

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
      'Has usado todos los espacios gratuitos de hábitos. Desbloquea el conjunto completo.';

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
  String get intentionTitle1 => 'Let\'s plant a new intention!';

  @override
  String get intentionBody1 =>
      'Every mighty forest begins with a single tiny choice. Tell me what we\'re nurturing today?';

  @override
  String get intentionTitle2 => 'What shall we grow today?';

  @override
  String get intentionBody2 =>
      'Tiny seeds, tended with care, become tall trees. Pick the one that matters most right now.';

  @override
  String get intentionTitle3 => 'One seed. One breath. Begin.';

  @override
  String get intentionBody3 =>
      'You don\'t have to plant the whole forest at once — just the next right thing.';

  @override
  String get intentionTitle4 => 'Nurture the next small step.';

  @override
  String get intentionBody4 =>
      'Future-you is built from the choices you make in the next five minutes. What\'s one kind one?';

  @override
  String get intentionTitle5 => 'Choose what you want to become.';

  @override
  String get intentionBody5 =>
      'Tasks are seeds, habits are sprouts. Together they form a forest you\'re proud of.';

  @override
  String get intentionTitle6 => 'Plant something worth remembering.';

  @override
  String get intentionBody6 =>
      'Not every day will feel huge. A watered seed still counts. Let\'s name one.';

  @override
  String get intentionTitle7 => 'Make today a little braver.';

  @override
  String get intentionBody7 =>
      'Courage compounds. Pick the seed you\'ve been postponing — even naming it moves it forward.';

  @override
  String get intentionTitle8 => 'Tend the soil before the seed.';

  @override
  String get intentionBody8 =>
      'What mindset, tool, or small ritual will make this task easier? Add it to the notes.';

  @override
  String get shareCardSnapshot => 'Una foto de tu santuario';

  @override
  String get shareCardBody =>
      'The card above is exported as a PNG and sent to your share sheet. Post it on your story, send it to a friend, or print it as a sticker.';

  @override
  String get shareCardShareMyBloom => 'Compartir mi flor';

  @override
  String get shareCardCouldNotShare => 'No se puede compartir ahora';

  @override
  String shareCardProgressText(String year) {
    return 'Mi progreso en Bloom Tracker — $year en Bloom Tracker.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Acabo de desbloquear la medalla \"$title\" en Bloom Tracker. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Cómo funciona';

  @override
  String get howItWorksBody =>
      'Bloom Tracker te ayuda a mantener una cadena pequeña e irrompible de disciplina. Eso es todo.';

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
  String get commonRetry => 'Retry';

  @override
  String get commonBack => 'Back';

  @override
  String get commonDismiss => 'Dismiss';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonClose => 'Close';

  @override
  String get commonSend => 'Send';

  @override
  String get commonCopy => 'Copy';

  @override
  String get commonShowLess => 'Show less';

  @override
  String get commonViewFull => 'View full notes';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonDone => 'Done';

  @override
  String get commonError => 'Something went wrong';

  @override
  String get commonPageNotFound => 'Page Not Found';

  @override
  String get commonHome => 'Home';

  @override
  String get commonUnknownError => 'Unknown routing error';

  @override
  String get commonSettingsTooltip => 'Settings';

  @override
  String get commonHowThisWorks => 'How this works';

  @override
  String get myDayReminderSet => 'Reminder set';

  @override
  String get myDayPreparationNotes => 'PREPARATION NOTES';

  @override
  String get onboardingSkip => 'SKIP';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingEnterSanctuary => 'Enter Sanctuary';

  @override
  String get onboardingIntroduction => 'INTRODUCTION';

  @override
  String get onboardingGrowYourForest => 'GROW YOUR FOREST';

  @override
  String get onboardingPage1Title => 'Meet your Guardian.';

  @override
  String get onboardingPage1Body =>
      'Welcome to your Personal Sanctuary. Here, your growth is mirrored in the life of your forest.';

  @override
  String get onboardingPage2Title => 'Plant seeds. Watch them grow.';

  @override
  String get onboardingPage2Body =>
      'Each task is a tiny seed. Each habit is a sprout you tend daily. Together they form a forest of discipline.';

  @override
  String get onboardingPage3Title => 'Five tasks. One chain.';

  @override
  String get onboardingPage3Body =>
      'You can only plant 5 seeds per day. That cap forces you to focus on what actually matters — and protect your chain.';

  @override
  String get onboardingPage4Title => 'Tend your sprouts daily.';

  @override
  String get onboardingPage4Body =>
      'Tap habits to grow them. Skip a day and the chain doesn\'t extend. The Guardian grows with you.';

  @override
  String get authBrand => 'BLOOM TRACKER';

  @override
  String get authPlantFirstSeed => 'Plant your first seed.';

  @override
  String get authWelcomeBack => 'Welcome back, Guardian.';

  @override
  String get authFiveTasksDaily => 'Five tasks. Daily habits. No excuses.';

  @override
  String get authSanctuaryWaiting => 'Your sanctuary is waiting.';

  @override
  String get authSignIn => 'Sign In';

  @override
  String get authSignUp => 'Sign Up';

  @override
  String get authEmail => 'EMAIL';

  @override
  String get authPassword => 'PASSWORD';

  @override
  String get authEmailHint => 'you@email.com';

  @override
  String get authCreateAccount => 'Create account';

  @override
  String get authSignInCta => 'Sign in';

  @override
  String get authOrContinueWith => 'or continue with';

  @override
  String get authContinueWithGoogle => 'Continue with Google';

  @override
  String get authEnterEmail => 'Enter your email';

  @override
  String get authEnterValidEmail => 'Enter a valid email address';

  @override
  String get authPasswordTooShort =>
      'Password must be at least 6 characters';

  @override
  String get authAccountCreated =>
      'Account created. Switch to Sign In and use your password.';

  @override
  String get authSomethingWentWrong => 'Something went wrong. Try again.';

  @override
  String get authCouldNotStartGoogle => 'Could not start Google sign-in.';

  @override
  String get authMidnightReset =>
      'By signing in, you accept that your day resets at midnight.';

  @override
  String get authSetupRequired => 'Setup required';

  @override
  String get settingsPersonalSanctuary => 'PERSONAL SANCTUARY';

  @override
  String get settingsHowThisWorks => 'How this works';

  @override
  String get settingsHowThisWorksSubtitle =>
      'What the app is, how the cap and streak work';

  @override
  String get settingsStreakProtection => 'Streak Protection';

  @override
  String get settingsStreakProtectionAvailable =>
      '1 freeze available this month';

  @override
  String get settingsStreakProtectionUsed => 'Used for this month';

  @override
  String get settingsProSubscription => 'Bloom Tracker Pro';

  @override
  String get settingsManageProSubscription => 'Manage Pro subscription';

  @override
  String get settingsProCancelPlay =>
      'Cancel or change plan in Google Play';

  @override
  String get settingsProUnlock =>
      'Unlock all 5 habits, full history, more';

  @override
  String get settingsTaskAlarms => 'Task alarms & Final Call';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Evening nudge and midnight warning';

  @override
  String get settingsHomeScreenWidget => 'Home-screen widget';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Add your chain streak to the home screen';

  @override
  String get settingsShareBloomTracker => 'Share Bloom Tracker';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Tell a friend about the chain';

  @override
  String get settingsHelpSupport => 'Help & Support';

  @override
  String get settingsHelpSupportSubtitle => 'FAQ or report a problem';

  @override
  String get settingsSignOutTile => 'Sign Out';

  @override
  String get settingsAllFeaturesUnlocked => 'All features unlocked';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Beta build — subscriptions paused while we test everything.';

  @override
  String settingsVersion(String version, String build) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Version 1.0.0';

  @override
  String get settingsHabitMaster => 'Habit Master';

  @override
  String settingsLevel(String level) {
    return 'Level $level · Habit Master';
  }

  @override
  String get languagePickerTitle => 'Language';

  @override
  String get youLast7Days => 'Last 7 days';

  @override
  String get youLast7DaysSubtitle => 'Day-by-day task history';

  @override
  String get youLeftBehindSubtitle =>
      'Missed tasks waiting to be re-added';

  @override
  String get youProTier => 'Pro tier';

  @override
  String get youFreeTier => 'Free tier';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Free';

  @override
  String youLevelLabel(String level) {
    return 'Level $level';
  }

  @override
  String youBestStreakLabel(String days) {
    return 'Best $days d';
  }

  @override
  String get youPlantHabit => 'Plant a habit to start a chain.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline => 'Unlock the full discipline system.';

  @override
  String get youProFeatures =>
      '5 habit slots, full history, legendary medals, monthly streak freezes, weekly share cards.';

  @override
  String get youSeePlans => 'See plans';

  @override
  String youFromPrice(String price) {
    return 'from \$$price/mo';
  }

  @override
  String get youBloomTrackerFooter => 'Bloom Tracker · Habit & To-Do';

  @override
  String get progressMedals => 'Medals';


  @override
  String get progressLast7Days => 'Last 7 days';
  @override
  String get progressSeeAll => 'See all';

  @override
  String get progressSeeDayByDayActivity =>
      'See your day-by-day activity';

  @override
  String progressTasksFinishedPct(String done, String total, String pct) {
    return '$done of $total tasks finished · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'No medals yet — finish a task or tend a sprout to get started.';

  @override
  String progressSeeAllMedals(String earned, String total) {
    return 'See all medals · $earned of $total earned';
  }

  @override
  String get progressGuardianInsight => 'Guardian insight';

  @override
  String progressNextBadgeTier(String tier) {
    return 'NEXT BADGE · ${tier.toUpperCase()}';
  }

  @override
  String progressDaysTarget(String days) {
    return '$days day target';
  }

  @override
  String progressOfTotal(String value, String target) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Help & Support';

  @override
  String get helpBody =>
      'Most answers are below. If not, send us a note and we usually reply within 2–3 days.';

  @override
  String get helpSectionFAQ => 'FREQUENT QUESTIONS';

  @override
  String get helpSectionContact => 'STILL STUCK?';

  @override
  String get helpAddMessage => 'Add a short message first.';

  @override
  String get helpOpening => 'Opening your mail app…';

  @override
  String get helpEmailUs => 'Email us';

  @override
  String get helpOpeningAction => 'Opening…';

  @override
  String get helpCopyEmail => 'Copy support email';

  @override
  String get helpCopiedEmail => 'Copied support@bloomtracker.app';

  @override
  String get helpNoMailApp =>
      'No mail app found. Email us at support@bloomtracker.app.';

  @override
  String get helpTopicLabel => 'Topic';

  @override
  String get helpWhatHappened => 'What happened?';

  @override
  String get helpHint => 'A short description goes a long way…';

  @override
  String get helpDisclaimer =>
      'Tapping "Email us" opens your mail app with a pre-filled message (no data leaves your device until you send).';

  @override
  String get helpFaqQ1 => 'What is the 5-task cap?';

  @override
  String get helpFaqA1 =>
      'You can add up to 5 tasks per local day. The 6th is blocked on purpose — discipline beats overload. The cap is the feature, not a limitation.';

  @override
  String get helpFaqQ2 => 'What happens at midnight?';

  @override
  String get helpFaqA2 =>
      'At your local midnight, any task still marked open is stamped "missed" and moves to Left Behind. Habit streaks reset if the habit was not completed the day before.';

  @override
  String get helpFaqQ3 => 'What is Left Behind?';

  @override
  String get helpFaqA3 =>
      'A gentle, dismissible list of tasks you didn\'t finish. Open it, re-add only what still matters, and let the rest go. Free tier sees the last 7 days; Pro sees full history.';

  @override
  String get helpFaqQ4 => 'How do streaks work?';

  @override
  String get helpFaqA4 =>
      'A day extends the chain when you had at least 1 task and 0 were missed. Days with zero tasks neither extend nor break the chain. A streak freeze forgives one missed day per month.';

  @override
  String get helpFaqQ5 => 'What is the streak freeze?';

  @override
  String get helpFaqA5 =>
      'One "freeze" per calendar month, Pro only. Spend it on a day you missed to keep your chain alive. Find it on the Progress tab.';

  @override
  String get helpFaqQ6 => 'Where is my data stored?';

  @override
  String get helpFaqA6 =>
      'All data lives in Supabase (Postgres) under the account that signed in. We never sell or share it. See the privacy policy linked in the Play Store listing for the full details.';

  @override
  String get helpFaqQ7 => 'How do I delete my account?';

  @override
  String get helpFaqA7 =>
      'Account deletion is coming to Settings in the next release. For now, email support@bloomtracker.app and we\'ll handle it within a day.';

  @override
  String get helpTopicsGeneral => 'General question';

  @override
  String get helpTopicsBug => 'Bug report';

  @override
  String get helpTopicsStreak => 'Streak / rollover issue';

  @override
  String get helpTopicsBilling => 'Billing or Pro tier';

  @override
  String get helpTopicsAccount => 'Account & data';

  @override
  String get helpTopicsFeature => 'Feature request';

  @override
  String get helpAccountAnon => '(not signed in)';

  @override
  String get splashTagline => 'Nurture small seeds. Grow a forest.';

  @override
  String get priorityStandard => 'STANDARD';

  @override
  String get priorityVital => 'VITAL';

  @override
  String get prioritySpark => 'SPARK';
}


