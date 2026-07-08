// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Bloom Tracker';

  @override
  String get tabToday => 'Aujourd\'hui';

  @override
  String get tabProgress => 'Progrès';

  @override
  String get tabYou => 'Vous';

  @override
  String get navMyDay => 'Ma journée';

  @override
  String get navSettings => 'Paramètres';

  @override
  String get navHelp => 'Aide et support';

  @override
  String get navHistory => '7 derniers jours';

  @override
  String get navLeftBehind => 'Restes';

  @override
  String get navInsights => 'Votre progrès';

  @override
  String get navMedals => 'Mes médailles';

  @override
  String get navManagePro => 'Gérer l\'abonnement Pro';

  @override
  String get navPaywall => 'Bloom Tracker Pro';

  @override
  String get greetingLateNight => 'Brûler l\'huile de minuit';

  @override
  String get greetingMorning => 'Bonjour, soleil !';

  @override
  String get greetingAfternoon => 'Bon après-midi, ami';

  @override
  String get greetingEvening => 'Bonsoir, champion';

  @override
  String get greetingNight => 'Tu te reposes bien, gardien ?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Aujourd\'hui · $done sur $total tâches';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done sur $total habitudes';
  }

  @override
  String get todayChainGrows => 'LA CHAÎNE GRANDIT QUAND TU FINIS';

  @override
  String get todayChainComplete =>
      'CHAÎNE COMPLÈTE · PRENDS SOIN DU JARDIN DEMAIN';

  @override
  String get taskCapInfo => 'Pourquoi 5 tâches max ?';

  @override
  String get taskCapDiscipline => 'DISCIPLINE D\'ABORD';

  @override
  String get taskCapTitle => 'On limite à dessein ta journée à 5 tâches.';

  @override
  String get taskCapBody =>
      'Les petites chaînes sont meilleures que les longues. Tu as plus de chances de finir 3 sur 5 et de ressentir la victoire que d\'abandonner 8 sur 10 et de ressentir la perte.';

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
  String get tasksHeader => 'Tâches';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Ajouter une graine de tâche';

  @override
  String get tasksCapReached =>
      '5/5 emplacements utilisés — finis-en une pour en planter une nouvelle.';

  @override
  String get tasksEmptyCta =>
      'Plante ta première graine — qu\'est-ce qui compte aujourd\'hui ?';

  @override
  String get habitsHeader => 'Habitudes';

  @override
  String habitsGrowing(String count) {
    return '$count growing';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Best $days d';
  }

  @override
  String get habitsPlantNew => 'Planter une nouvelle pousse';

  @override
  String get habitsPlantFirst => 'Planter une habitude';

  @override
  String get habitsLocked => 'Emplacement Pro — débloque pour plus de pousses';

  @override
  String get habitsCadence => 'QUOTIDIEN';

  @override
  String leftBehindBanner(String count) {
    return '$count missed — still in Left Behind';
  }

  @override
  String get leftBehindTap => 'Tapez pour ré-ajouter ou laisser partir';

  @override
  String get leftBehindDismiss => 'Ignorer';

  @override
  String get leftBehindTitle => 'Restes';

  @override
  String get leftBehindEmpty => 'Rien en reste';

  @override
  String get leftBehindEmptyBody =>
      'Aucune tâche manquée. Chaque graine que tu plantes est entretenue. Le jardin est propre.';

  @override
  String get leftBehindClearAll => 'Tout effacer';

  @override
  String get leftBehindClearAllConfirm => 'Effacer tous les restes ?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'This will permanently remove $count missed task(s). You can\'t undo this.';
  }

  @override
  String get leftBehindReAdd => 'Re-add today';

  @override
  String get leftBehindLetGo => 'Laisser partir';

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
  String get medalsTitle => 'Mes médailles';

  @override
  String get medalsTrophyRoom => 'Salle des trophées';

  @override
  String get medalsAllMedals => 'Toutes les médailles';

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
    return 'Progrès vers les $total médailles';
  }

  @override
  String get medalsShareCta => 'Créer une carte partageable';

  @override
  String get medalsEmptyTitle => 'Rien dans cette catégorie';

  @override
  String get medalsEmptyBody =>
      'Termine une tâche ou entretiens une pousse pour démarrer ta salle des trophées.';

  @override
  String get medalSheetLocked => 'MÉDAILLE PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'OBTENUE · $tier';
  }

  @override
  String get medalSheetUnlock => 'Débloquer avec Pro';

  @override
  String get medalSheetProgress => 'Progrès';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Just $n more $unit to unlock.';
  }

  @override
  String get medalSheetAlmost => 'Plus qu\'un pas pour débloquer.';

  @override
  String get medalCategory => 'Catégorie';

  @override
  String get medalShareOnSocials => 'Partager sur les réseaux';

  @override
  String get medalShareLater => 'Plus tard';

  @override
  String get medalUnlocked => 'MÉDAILLE DÉBLOQUÉE';

  @override
  String get medalProgressTitle => 'Progrès';

  @override
  String get historyTitle => '7 derniers jours';

  @override
  String historyThisWeek(String days) {
    return 'LAST $days DAYS';
  }

  @override
  String get historyDayByDay => 'JOUR PAR JOUR';

  @override
  String get historyEmpty => 'Plant some seeds to see your week unfold.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'You finished $done of $total tasks. $perfect perfect day(s).';
  }

  @override
  String get historyUpsellTitle => 'Voir ton historique complet';

  @override
  String get historyUpsellBody =>
      'Pro débloque 30 jours d\'historique. Gratuit en montre 7.';

  @override
  String get historyPerfect => 'PARFAIT';

  @override
  String get historyFrozen => 'GELÉ';

  @override
  String get historyToday => 'Aujourd\'hui';

  @override
  String get historyEmptyDay => 'Aucune graine plantée ce jour';

  @override
  String historyLeftBehindCount(String count) {
    return '$count left behind';
  }

  @override
  String get progressVitality => 'VITALITÉ DU JOUR';

  @override
  String get progressVitalityEmpty =>
      'Plante une graine pour commencer ton jardin.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done of $total seeds planted today.';
  }

  @override
  String progressChainPill(String days) {
    return 'Chaîne de ${days}j';
  }

  @override
  String get progressMetricCurrent => 'Actuelle';

  @override
  String get progressMetricBest => 'Meilleure';

  @override
  String get progressMetricDone => 'Faite';

  @override
  String get progressMetricPerfect => 'Parfait';

  @override
  String get progressMetricHabits => 'Habitudes';

  @override
  String get progressHabitBlooms => 'Floraisons d\'habitude';

  @override
  String get progressHabitBloomsSub =>
      'Jalons de série pour les pousses que tu arroses chaque jour.';

  @override
  String get progressNextBadge => 'Prochain badge';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned of $total';
  }

  @override
  String get progressPersonalActivity => 'Activité personnelle';

  @override
  String progressBrowseMonth(String month) {
    return 'Browsing $month. Tap \"Today\" to jump back to your live activity.';
  }

  @override
  String get progressJumpToToday => 'Aujourd\'hui';

  @override
  String get progressCalendarLegend => 'plus foncé = plus terminé';

  @override
  String get progressCalendarBody =>
      'Le vert foncé signifie un jour parfait. La teinte s\'estompe quand tu sautes.';

  @override
  String get paywallTitle => 'Ne casse pas la chaîne.';

  @override
  String get paywallSubtitle =>
      'Bloom Tracker Pro te donne le système complet de discipline.';

  @override
  String get paywallFeatures =>
      'All 5 habit slots, not just 3|Your full history, forever|The full medal set|Streak freeze every month|Weekly Receipt + share cards|Themes + more';

  @override
  String get paywallFeaturesBodies =>
      'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.|Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.|Unlock Legendary tier medals. The rarest badges are for the people who go all in.|2 streak freezes a month so a single bad day doesn\'t end your chain.|Beautiful share cards of your week. Post your chain, inspire someone else to start.|Unlock new accent colors and themes as we add them. Always free updates.';

  @override
  String get paywallYearly => 'Annuel';

  @override
  String get paywallYearlyCaption => 'Meilleur prix · ~2,50 \$/mois';

  @override
  String get paywallYearlyBadge => 'ÉCONOMISEZ 35%';

  @override
  String get paywallMonthly => 'Mensuel';

  @override
  String get paywallMonthlyCaption =>
      'Facturation mensuelle · annule à tout moment';

  @override
  String paywallStartCta(String price) {
    return 'Démarrer Pro · $price/an';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Démarrer Pro · $price/mois';
  }

  @override
  String get paywallRestore => 'Restaurer l\'achat';

  @override
  String get paywallTerms => 'Conditions';

  @override
  String get paywallPrivacy => 'Confidentialité';

  @override
  String get paywallNoRestore => 'Aucun achat précédent trouvé sur ce compte.';

  @override
  String get paywallRestoreLater =>
      'Nous restaurerons ton achat à la prochaine synchronisation.';

  @override
  String get paywallAlreadyPro => 'Tu es sur Pro. Merci pour le soutien.';

  @override
  String get paywallHabitSlotHead =>
      'Tu as utilisé tous tes emplacements d\'habitude gratuits. Débloque le set complet.';

  @override
  String get paywallHistoryHead =>
      'Voir ton historique complet — chaque jour parfait, chaque médaille, chaque retour.';

  @override
  String get paywallMedalHead =>
      'Les médailles les plus rares sont Pro uniquement. Continue — tu es plus près que tu ne le penses.';

  @override
  String get settingsYourActivity => 'TON ACTIVITÉ';

  @override
  String get settingsHelpInfo => 'AIDE ET INFOS';

  @override
  String get settingsAccount => 'COMPTE';

  @override
  String get settingsNurturingTools => 'OUTILS';

  @override
  String get settingsReminders => 'RAPPELS';

  @override
  String get settingsWidgetSanctuary => 'WIDGET';

  @override
  String get settingsEcosystemSupport => 'SUPPORT';

  @override
  String get settingsHowItWorks => 'Comment ça marche';

  @override
  String get settingsSignOut => 'Déconnexion';

  @override
  String get settingsProActive => 'Actif';

  @override
  String get settingsProFree => 'Niveau gratuit';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsLanguageValue => 'Par défaut du système';

  @override
  String get firstRunGreeting =>
      '5 tâches. Pas plus. Faites qu\'elles comptent.';

  @override
  String get firstRunBody =>
      'Plante ta première graine — qu\'est-ce qui compte aujourd\'hui ?';

  @override
  String get firstRunCta => 'Plante ma première graine';

  @override
  String get emptyStateClearAll => 'Tout effacer';

  @override
  String get cancel => 'Annuler';

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
  String get shareCardSnapshot => 'Un instantané de ton sanctuaire';

  @override
  String get shareCardBody =>
      'The card above is exported as a PNG and sent to your share sheet. Post it on your story, send it to a friend, or print it as a sticker.';

  @override
  String get shareCardShareMyBloom => 'Partager ma fleur';

  @override
  String get shareCardCouldNotShare => 'Impossible de partager maintenant';

  @override
  String shareCardProgressText(String year) {
    return 'Mon progrès Bloom Tracker — $year sur Bloom Tracker.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Je viens de débloquer la médaille « $title » sur Bloom Tracker. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Comment ça marche';

  @override
  String get howItWorksBody =>
      'Bloom Tracker t\'aide à garder une petite chaîne de discipline incassable. C\'est tout.';

  @override
  String get howItWorksToday => 'L\'onglet Aujourd\'hui';

  @override
  String get howItWorksTodayBody =>
      'C\'est ta maison. Elle montre les 5 tâches et les habitudes que tu as fixées pour aujourd\'hui. Finis-les avant minuit, la chaîne s\'étend.';

  @override
  String get howItWorksCap => 'La limite de 5 tâches est la fonctionnalité';

  @override
  String get howItWorksCapBody =>
      'On ne te laisse pas en ajouter un 6e. C\'est tout le point. Tapez le « ? » sur l\'écran d\'accueil pour l\'explication complète.';

  @override
  String get howItWorksHabits =>
      'Les habitudes sont quotidiennes, la chaîne est pour toujours';

  @override
  String get howItWorksHabitsBody =>
      'Les habitudes vivent pour toujours. Les tâches sont uniques. Les deux alimentent la même série.';

  @override
  String get howItWorksLeftBehind => 'Tâches manquées → Restes';

  @override
  String get howItWorksLeftBehindBody =>
      'À minuit, les tâches incomplètes vont dans Restes. Ré-ajoute seulement celles qui comptent encore.';

  @override
  String get howItWorksProgress => 'L\'onglet Progrès';

  @override
  String get howItWorksProgressBody =>
      'Série, calendrier, médailles, historique — tout sur ta progression. Rien d\'urgent ne vit ici.';

  @override
  String get howItWorksYou => 'L\'onglet Vous';

  @override
  String get howItWorksYouBody =>
      'Ton compte, les paramètres, la déconnexion. C\'est tout.';

  @override
  String get howItWorksRule =>
      'La règle : 5 petites choses, chaque jour, sans excuses.';

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
  String get authPasswordTooShort => 'Password must be at least 6 characters';

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
  String get settingsProCancelPlay => 'Cancel or change plan in Google Play';

  @override
  String get settingsProUnlock => 'Unlock all 5 habits, full history, more';

  @override
  String get settingsTaskAlarms => 'Task alarms & Final Call';

  @override
  String get settingsTaskAlarmsSubtitle => 'Evening nudge and midnight warning';

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
  String settingsVersion(Object build, Object version) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Version 1.0.0';

  @override
  String get settingsHabitMaster => 'Habit Master';

  @override
  String settingsLevel(Object level) {
    return 'Level $level · Habit Master';
  }

  @override
  String get languagePickerTitle => 'Language';

  @override
  String get youLast7Days => 'Last 7 days';

  @override
  String get youLast7DaysSubtitle => 'Day-by-day task history';

  @override
  String get youLeftBehindSubtitle => 'Missed tasks waiting to be re-added';

  @override
  String get youProTier => 'Pro tier';

  @override
  String get youFreeTier => 'Free tier';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Free';

  @override
  String youLevelLabel(Object level) {
    return 'Level $level';
  }

  @override
  String youBestStreakLabel(Object days) {
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
  String youFromPrice(Object price) {
    return 'from $price/mo';
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
  String get progressSeeDayByDayActivity => 'See your day-by-day activity';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done of $total tasks finished · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'No medals yet — finish a task or tend a sprout to get started.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'See all medals · $earned of $total earned';
  }

  @override
  String get progressGuardianInsight => 'Guardian insight';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'NEXT BADGE · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return '$days day target';
  }

  @override
  String progressOfTotal(Object target, Object value) {
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
      'Tapping \"Email us\" opens your mail app with a pre-filled message (no data leaves your device until you send).';

  @override
  String get helpFaqQ1 => 'What is the 5-task cap?';

  @override
  String get helpFaqA1 =>
      'You can add up to 5 tasks per local day. The 6th is blocked on purpose — discipline beats overload. The cap is the feature, not a limitation.';

  @override
  String get helpFaqQ2 => 'What happens at midnight?';

  @override
  String get helpFaqA2 =>
      'At your local midnight, any task still marked open is stamped \"missed\" and moves to Left Behind. Habit streaks reset if the habit was not completed the day before.';

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
      'One \"freeze\" per calendar month, Pro only. Spend it on a day you missed to keep your chain alive. Find it on the Progress tab.';

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
