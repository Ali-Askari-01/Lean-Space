// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

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
  String get navLeftBehind => 'Abandons';

  @override
  String get navInsights => 'Votre progression';

  @override
  String get navMedals => 'Mes médailles';

  @override
  String get navManagePro => 'Gérer l\'abonnement Pro';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Encore debout à cette heure ?';

  @override
  String get greetingMorning => 'Bonjour, soleil !';

  @override
  String get greetingAfternoon => 'Bon après-midi, ami';

  @override
  String get greetingEvening => 'Bonsoir, champion';

  @override
  String get greetingNight => 'Tu te reposes bien, Gardien ?';

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
      'CHAÎNE COMPLÈTE · ENTRETiens LE JARDIN DEMAIN';

  @override
  String get taskCapInfo => 'Pourquoi une limite de 5 tâches ?';

  @override
  String get taskCapDiscipline => 'DISCIPLINE D\'ABORD PAR CONCEPTION';

  @override
  String get taskCapTitle => 'On limite à dessein ta journée à 5 tâches.';

  @override
  String get taskCapBody =>
      'Les petites chaînes battent les longues. Tu as plus de chances de finir 3 sur 5 et de ressentir la victoire que d\'abandonner 8 sur 10 et de ressentir l\'échec.';

  @override
  String get taskCapBulletDone =>
      'Les tâches terminées comptent pour ta chaîne';

  @override
  String get taskCapBulletDoneBody =>
      'Un jour où les 5 sont terminées prolonge ta série d\'un jour.';

  @override
  String get taskCapBulletMissed => 'Les tâches manquées vont dans Abandons';

  @override
  String get taskCapBulletMissedBody =>
      'À minuit, les tâches incomplètes apparaissent dans Abandons. Réajoute seulement ce qui compte encore.';

  @override
  String get taskCapBulletFreeze => 'Le gel de série pardonne un manquement';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro te donne 2 gels de série par mois — ils couvrent un jour manqué pour que ta chaîne survive.';

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
      '5/5 emplacements utilisés — termine-en une pour en planter une nouvelle.';

  @override
  String get tasksEmptyCta =>
      'Plante ta première graine — qu\'est-ce qui compte aujourd\'hui ?';

  @override
  String get habitsHeader => 'Habitudes';

  @override
  String habitsGrowing(String count) {
    return '$count en croissance';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Meilleure série $days j';
  }

  @override
  String get habitsPlantNew => 'Planter une nouvelle pousse d\'habitude';

  @override
  String get habitsPlantFirst => 'Planter une habitude';

  @override
  String get habitsLocked =>
      'Emplacement Pro — débloque pour planter plus de pousses';

  @override
  String get habitsSlotsFull =>
      'Tous les emplacements d\'habitude sont actuellement pleins.';

  @override
  String habitsStreakDays(String days) {
    return '${days}j';
  }

  @override
  String get habitsCadence => 'QUOTIDIEN';

  @override
  String leftBehindBanner(String count) {
    return '$count manquées — toujours dans Abandons';
  }

  @override
  String get leftBehindTap => 'Appuie pour réajouter ou laisser partir';

  @override
  String get leftBehindDismiss => 'Ignorer';

  @override
  String get leftBehindTitle => 'Abandons';

  @override
  String get leftBehindEmpty => 'Rien en reste';

  @override
  String get leftBehindEmptyBody =>
      'Aucune tâche manquée. Chaque graine que tu plantes est entretenue. Le jardin est propre.';

  @override
  String get leftBehindClearAll => 'Tout effacer';

  @override
  String get leftBehindClearAllConfirm => 'Effacer tous les abandonnés ?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Ceci supprimera définitivement $count tâche(s) manquée(s). Cette action est irréversible.';
  }

  @override
  String get leftBehindReAdd => 'Réajouter aujourd\'hui';

  @override
  String get leftBehindReAddButton => 'Réajouter';

  @override
  String get leftBehindAddedToToday => 'Ajouté à aujourd\'hui';

  @override
  String get leftBehindLetGo => 'Laisser partir';

  @override
  String get leftBehindHeader => 'ABANDONS';

  @override
  String get leftBehindMissedTasks => 'TÂCHES MANQUÉES';

  @override
  String get leftBehindWaitingOne => '1 tâche t\'attend.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count tâches t\'attendent.';
  }

  @override
  String get leftBehindBody =>
      'Réajoute une tâche pour la ramener aujourd\'hui, ou laisse-la partir. Réajouter maintient ta série en vie.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '« $task » est de retour dans ta journée.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return '« $task » supprimé';
  }

  @override
  String get leftBehindClearedSnack => 'Abandons effacés';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Hier · $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count tâche(s) restante(s) pour aujourd\'hui';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Dernier appel — $count tâche(s) encore ouverte(s)';
  }

  @override
  String get streakAtRiskBody => 'Minuit approche. La chaîne en dépend.';

  @override
  String get streakAtRiskBodyLow =>
      'Tu as encore le temps. Un jour propre prolonge ta série.';

  @override
  String get streakAtRiskFreeze => 'Hier manqué — utiliser un gel de série ?';

  @override
  String get streakFreezeUse => 'Utiliser le gel';

  @override
  String get streakFreezeUseForYesterday =>
      'Utiliser le gel de série mensuel pour hier';

  @override
  String get streakFreezeAppliedYesterday => 'Gel de série appliqué pour hier.';

  @override
  String get chainBrokenTitle => 'La chaîne est cassée. Ce n\'est pas grave.';

  @override
  String get chainBrokenBody =>
      'Toute longue chaîne finit un jour. Ce qui compte, c\'est ce que tu plantes aujourd\'hui. Un seul jour parfait recommence la suivante.';

  @override
  String get chainBrokenCta => 'Retour à aujourd\'hui';

  @override
  String get chainBrokenPlantFirst => 'Plante la première graine du jour';

  @override
  String get chainBrokenCheck => 'Vérifie d\'abord Abandons';

  @override
  String get chainBrokenBestChain => 'meilleure chaîne';

  @override
  String get chainBrokenTasksDone => 'tâches terminées';

  @override
  String get chainBrokenSprouts => 'pousses';

  @override
  String get chainRecoveryFreshStart => 'Un nouveau départ';

  @override
  String get medalsTitle => 'Mes médailles';

  @override
  String get medalsTrophyRoom => 'Salle des trophées';

  @override
  String get medalsAllMedals => 'Toutes les médailles';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned sur $total médailles obtenues';
  }

  @override
  String get medalsTrophyEmpty => 'Ton premier badge est à une tâche';

  @override
  String get medalsTrophyFirst =>
      'Tu as obtenu ta première médaille — continue';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned médailles dans ta salle des trophées';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'Progrès vers les $total médailles';
  }

  @override
  String get medalsShareCta => 'Créer une carte partageable';

  @override
  String get medalsEmptyTitle => 'Rien dans cette catégorie pour l\'instant';

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
    return 'Encore $n $unit pour débloquer.';
  }

  @override
  String get medalSheetAlmost => 'Encore un pas pour débloquer.';

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
  String get historyFullTitle => 'Historique complet';

  @override
  String get historyLoadError => 'Impossible de charger l\'historique.';

  @override
  String get historyFullCalendar => 'Calendrier complet';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% terminé';
  }

  @override
  String historyThisWeek(String days) {
    return '$days DERNIERS JOURS';
  }

  @override
  String get historyDayByDay => 'JOUR PAR JOUR';

  @override
  String get historyEmpty =>
      'Plante des graines pour voir ta semaine se dérouler.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Tu as terminé $done sur $total tâches. $perfect jour(s) parfait(s).';
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
    return '$count abandonné(s)';
  }

  @override
  String get progressVitality => 'VITALITÉ DU JOUR';

  @override
  String get progressVitalityEmpty =>
      'Plante une graine pour commencer ton jardin.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done sur $total graines plantées aujourd\'hui.';
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
    return '$earned sur $total';
  }

  @override
  String get progressPersonalActivity => 'Activité personnelle';

  @override
  String progressBrowseMonth(String month) {
    return 'Navigation $month. Appuie sur « Aujourd\'hui » pour revenir à ton activité en cours.';
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
      'Daily Stitch Pro te donne le système complet de discipline.';

  @override
  String get paywallFeatures =>
      'Les 5 emplacements d\'habitude, pas seulement 3|Ton historique complet, pour toujours|Le set complet de médailles|Gel de série chaque mois|Reçu hebdomadaire + cartes de partage|Thèmes et plus';

  @override
  String get paywallFeaturesBodies =>
      'Le gratuit te donne 3. Pro débloque les cinq pour que ton rituel quotidien complet puisse vivre ici.|Parcoures chaque jour que tu as complété — pas seulement les 7 derniers. Regarde des années en arrière, pas des semaines.|Débloque les médailles de niveau Légendaire. Les badges les plus rares sont pour ceux qui s\'engagent pleinement.|2 gels de série par mois pour qu\'un seul mauvais jour ne termine pas ta chaîne.|De belles cartes de partage de ta semaine. Publie ta chaîne, inspire quelqu\'un à commencer.|Débloque de nouvelles couleurs d\'accent et thèmes au fur et à mesure. Mises à jour gratuites.';

  @override
  String get paywallYearly => 'Annuel';

  @override
  String get paywallYearlyCaption => 'Meilleur prix · ~2,50 \$/mois';

  @override
  String get paywallYearlyBadge => 'ÉCONOMISE 35%';

  @override
  String get paywallMonthly => 'Mensuel';

  @override
  String get paywallMonthlyCaption =>
      'Facturation mensuelle · annule à tout moment';

  @override
  String paywallStartCta(String price) {
    return 'Commencer Pro · $price/an';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Commencer Pro · $price/mois';
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
      'Tu as utilisé tous tes emplacements d\'habitude gratuits. Débloque le set complet pour planter chaque rituel qui te tient à cœur.';

  @override
  String get paywallHistoryHead =>
      'Voir ton historique complet — chaque jour parfait, chaque médaille, chaque retour.';

  @override
  String get paywallMedalHead =>
      'Les médailles les plus rares sont réservées aux Pro. Continue — tu es plus près que tu ne le penses.';

  @override
  String get settingsYourActivity => 'TON ACTIVITÉ';

  @override
  String get settingsHelpInfo => 'AIDE ET INFOS';

  @override
  String get settingsAccount => 'COMPTE';

  @override
  String get settingsNurturingTools => 'OUTILS D\'ENTRETIEN';

  @override
  String get settingsReminders => 'RAPPELS';

  @override
  String get settingsWidgetSanctuary => 'WIDGET SANCTUAIRE';

  @override
  String get settingsEcosystemSupport => 'SUPPORT ÉCOSYSTÈME';

  @override
  String get settingsHowItWorks => 'Comment ça marche';

  @override
  String get settingsSignOut => 'Déconnexion';

  @override
  String get settingsSignOutConfirm => 'Are you sure you want to sign out?';

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
      '5 tâches. Pas plus. Fais en sorte qu\'elles comptent.';

  @override
  String get firstRunBody =>
      'Plante ta première graine — qu\'est-ce qui compte le plus aujourd\'hui ?';

  @override
  String get firstRunCta => 'Plante ta première graine';

  @override
  String get emptyStateClearAll => 'Tout effacer';

  @override
  String get cancel => 'Annuler';

  @override
  String get intentionTitle1 => 'Plantons une nouvelle intention !';

  @override
  String get intentionBody1 =>
      'Chaque forêt majestueuse commence par un seul petit choix. Dis-moi, qu\'est-ce que nous entretenons aujourd\'hui ?';

  @override
  String get intentionTitle2 =>
      'Qu\'est-ce que nous ferons pousser aujourd\'hui ?';

  @override
  String get intentionBody2 =>
      'De petites graines, entretenues avec soin, deviennent de grands arbres. Choisis celle qui compte le plus en ce moment.';

  @override
  String get intentionTitle3 => 'Une graine. Un souffle. Commence.';

  @override
  String get intentionBody3 =>
      'Tu n\'as pas à planter toute la forêt d\'un coup — juste la prochaine bonne chose.';

  @override
  String get intentionTitle4 => 'Entretiens la prochaine petite étape.';

  @override
  String get intentionBody4 =>
      'Le toi du futur se construit à partir des choix que tu fais dans les cinq prochaines minutes. Quel est un choix bienveillant ?';

  @override
  String get intentionTitle5 => 'Choisis ce que tu veux devenir.';

  @override
  String get intentionBody5 =>
      'Les tâches sont des graines, les habitudes sont des pousses. Ensemble, elles forment une forêt dont tu es fier.';

  @override
  String get intentionTitle6 => 'Plante quelque chose à retenir.';

  @override
  String get intentionBody6 =>
      'Pas chaque jour semblera immense. Une graine arrosée compte quand même. Nommons-en une.';

  @override
  String get intentionTitle7 => 'Rends aujourd\'hui un peu plus courageux.';

  @override
  String get intentionBody7 =>
      'Le courage se cumule. Choisis la graine que tu reportes — même la nommer la fait avancer.';

  @override
  String get intentionTitle8 => 'Entretiens le sol avant la graine.';

  @override
  String get intentionBody8 =>
      'Quel état d\'esprit, quel outil ou quel petit rituel rendra cette tâche plus facile ? Ajoute-le aux notes.';

  @override
  String get shareCardSnapshot => 'Un instantané de ton sanctuaire';

  @override
  String get shareCardBody =>
      'La carte ci-dessus est exportée en PNG et envoyée à ton menu de partage. Publie-la sur ton histoire, envoie-la à un ami, ou imprime-la en sticker.';

  @override
  String get shareCardShareMyBloom => 'Partager ma floraison';

  @override
  String get shareCardCouldNotShare => 'Impossible de partager maintenant';

  @override
  String shareCardProgressText(String year) {
    return 'Mon progrès Daily Stitch — $year sur Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Je viens de débloquer la médaille « $title » sur Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Comment ça marche';

  @override
  String get howItWorksBody =>
      'Daily Stitch t\'aide à garder une petite chaîne de discipline incassable. C\'est tout.';

  @override
  String get howItWorksToday => 'L\'onglet Aujourd\'hui';

  @override
  String get howItWorksTodayBody =>
      'C\'est ta maison. Elle montre les 5 tâches et les habitudes que tu as fixées pour aujourd\'hui. Finis-les avant minuit, la chaîne s\'étend.';

  @override
  String get howItWorksCap => 'La limite de 5 tâches est LA fonctionnalité';

  @override
  String get howItWorksCapBody =>
      'On ne te laisse pas en ajouter un 6e. C\'est tout l\'intérêt. Les petites chaînes battent les longues. Appuie sur le « ? » sur l\'écran d\'accueil pour l\'explication complète.';

  @override
  String get howItWorksHabits =>
      'Les habitudes sont quotidiennes, la chaîne est pour toujours';

  @override
  String get howItWorksHabitsBody =>
      'Les habitudes vivent pour toujours. Les tâches sont uniques. Les deux alimentent la même série.';

  @override
  String get howItWorksLeftBehind => 'Tâches manquées → Abandons';

  @override
  String get howItWorksLeftBehindBody =>
      'À minuit, les tâches incomplètes vont dans Abandons. Réajoute seulement celles qui comptent encore.';

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
      'La règle : 5 petites choses, chaque jour, sans excuse.';

  @override
  String get commonRetry => 'Réessayer';

  @override
  String get commonBack => 'Retour';

  @override
  String get commonDismiss => 'Ignorer';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonClose => 'Fermer';

  @override
  String get commonSend => 'Envoyer';

  @override
  String get commonCopy => 'Copier';

  @override
  String get commonShowLess => 'Afficher moins';

  @override
  String get commonViewFull => 'Voir les notes complètes';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonDone => 'Terminé';

  @override
  String get commonError => 'Quelque chose s\'est mal passé';

  @override
  String get commonPageNotFound => 'Page non trouvée';

  @override
  String get commonHome => 'Accueil';

  @override
  String get commonUnknownError => 'Erreur de routage inconnue';

  @override
  String get commonSettingsTooltip => 'Paramètres';

  @override
  String get commonHowThisWorks => 'Comment ça marche';

  @override
  String get myDayReminderSet => 'Rappel défini';

  @override
  String get myDayPreparationNotes => 'NOTES DE PRÉPARATION';

  @override
  String get onboardingSkip => 'PASSER';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingEnterSanctuary => 'Entrer dans le Sanctuaire';

  @override
  String get onboardingIntroduction => 'INTRODUCTION';

  @override
  String get onboardingGrowYourForest => 'FAIS POUSSER TA FORÊT';

  @override
  String get onboardingPage1Title => 'Vois ton Gardien.';

  @override
  String get onboardingPage1Body =>
      'Bienvenue dans ton Sanctuaire Personnel. Ici, ta croissance se reflète dans la vie de ta forêt.';

  @override
  String get onboardingPage2Title => 'Plante des graines. Regarde-les pousser.';

  @override
  String get onboardingPage2Body =>
      'Chaque tâche est une petite graine. Chaque habitude est une pousse que tu entretiens chaque jour. Ensemble, elles forment une forêt de discipline.';

  @override
  String get onboardingPage3Title => 'Cinq tâches. Une chaîne.';

  @override
  String get onboardingPage3Body =>
      'Tu ne peux planter que 5 graines par jour. Cette limite te force à te concentrer sur ce qui compte vraiment — et à protéger ta chaîne.';

  @override
  String get onboardingPage4Title => 'Entretiens tes pousses chaque jour.';

  @override
  String get onboardingPage4Body =>
      'Appuie sur les habitudes pour les faire pousser. Saute un jour et la chaîne ne s\'étend pas. Le Gardien grandit avec toi.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Plante ta première graine.';

  @override
  String get authWelcomeBack => 'Bon retour, Gardien.';

  @override
  String get authFiveTasksDaily =>
      'Cinq tâches. Habitudes quotidiennes. Pas d\'excuses.';

  @override
  String get authSanctuaryWaiting => 'Ton sanctuaire t\'attend.';

  @override
  String get authSignIn => 'Connexion';

  @override
  String get authSignUp => 'Inscription';

  @override
  String get authEmail => 'E-MAIL';

  @override
  String get authPassword => 'MOT DE PASSE';

  @override
  String get authEmailHint => 'toi@email.com';

  @override
  String get authCreateAccount => 'Créer un compte';

  @override
  String get authSignInCta => 'Se connecter';

  @override
  String get authOrContinueWith => 'ou continuer avec';

  @override
  String get authContinueWithGoogle => 'Continuer avec Google';

  @override
  String get authEnterEmail => 'Entre ton e-mail';

  @override
  String get authEnterValidEmail => 'Entre une adresse e-mail valide';

  @override
  String get authPasswordTooShort =>
      'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get authAccountCreated =>
      'Compte créé. Passe à Connexion et utilise ton mot de passe.';

  @override
  String get authSomethingWentWrong =>
      'Quelque chose s\'est mal passé. Réessaie.';

  @override
  String get authCouldNotStartGoogle =>
      'Impossible de démarrer la connexion Google.';

  @override
  String get authMidnightReset =>
      'En te connectant, tu acceptes que ta journée se réinitialise à minuit.';

  @override
  String get authSetupRequired => 'Configuration requise';

  @override
  String get settingsPersonalSanctuary => 'SANCTUAIRE PERSONNEL';

  @override
  String get settingsHowThisWorks => 'Comment ça marche';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Ce qu\'est l\'application, comment la limite et la série fonctionnent';

  @override
  String get settingsStreakProtection => 'Protection de série';

  @override
  String get settingsStreakProtectionAvailable => '1 gel disponible ce mois-ci';

  @override
  String get settingsStreakProtectionUsed => 'Utilisé pour ce mois-ci';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Gérer l\'abonnement Pro';

  @override
  String get settingsProCancelPlay =>
      'Annule ou modifie le plan dans Google Play';

  @override
  String get settingsProUnlock =>
      'Débloque les 5 habitudes, l\'historique complet et plus';

  @override
  String get settingsTaskAlarms => 'Alarmes de tâches et Dernier appel';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Rappel du soir et avertissement de minuit';

  @override
  String get settingsHomeScreenWidget => 'Widget de l\'écran d\'accueil';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Ajoute ta série à l\'écran d\'accueil';

  @override
  String get settingsShareBloomTracker => 'Partager Daily Stitch';

  @override
  String get settingsShareBloomTrackerSubtitle => 'Parle de la chaîne à un ami';

  @override
  String get settingsHelpSupport => 'Aide et support';

  @override
  String get settingsHelpSupportSubtitle => 'FAQ ou signaler un problème';

  @override
  String get settingsSignOutTile => 'Déconnexion';

  @override
  String get settingsAllFeaturesUnlocked =>
      'Toutes les fonctionnalités débloquées';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Version bêta — abonnements en pause pendant que nous testons tout.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Version 1.0.0';

  @override
  String get settingsHabitMaster => 'Maître des habitudes';

  @override
  String settingsLevel(Object level) {
    return 'Niveau $level · Maître des habitudes';
  }

  @override
  String get languagePickerTitle => 'Langue';

  @override
  String get youLast7Days => '7 derniers jours';

  @override
  String get youLast7DaysSubtitle => 'Historique jour par jour';

  @override
  String get youLeftBehindSubtitle => 'Tâches manquées en attente de réajout';

  @override
  String get youProTier => 'Niveau Pro';

  @override
  String get youFreeTier => 'Niveau gratuit';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Gratuit';

  @override
  String youLevelLabel(Object level) {
    return 'Niveau $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'Meilleure série $days j';
  }

  @override
  String get youPlantHabit => 'Plante une habitude pour démarrer une chaîne.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'Débloque le système complet de discipline.';

  @override
  String get youProFeatures =>
      '5 emplacements d\'habitude, historique complet, médailles légendaires, gels de série mensuels, cartes de partage hebdomadaires.';

  @override
  String get youSeePlans => 'Voir les plans';

  @override
  String youFromPrice(Object price) {
    return 'à partir de $price/mois';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch · Habitudes et tâches';

  @override
  String get progressMedals => 'Médailles';

  @override
  String get progressLast7Days => '7 derniers jours';

  @override
  String get progressSeeAll => 'Tout voir';

  @override
  String get progressSeeDayByDayActivity => 'Voir ton activité jour par jour';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done sur $total tâches terminées · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Pas encore de médailles — termine une tâche ou entretiens une pousse pour commencer.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Voir toutes les médailles · $earned sur $total obtenues';
  }

  @override
  String get progressGuardianInsight => 'Analyse du Gardien';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'PROCHAIN BADGE · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return 'Objectif de $days jours';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Aide et support';

  @override
  String get helpBody =>
      'La plupart des réponses se trouvent ci-dessous. Sinon, envoie-nous un message et nous répondons généralement sous 2 à 3 jours.';

  @override
  String get helpSectionFAQ => 'QUESTIONS FRÉQUENTES';

  @override
  String get helpSectionContact => 'TOUJOURS BLOQUÉ ?';

  @override
  String get helpAddMessage => 'Ajoute d\'abord un court message.';

  @override
  String get helpOpening => 'Ouverture de ton application mail…';

  @override
  String get helpEmailUs => 'Envoie-nous un e-mail';

  @override
  String get helpOpeningAction => 'Ouverture…';

  @override
  String get helpCopyEmail => 'Copier l\'e-mail du support';

  @override
  String get helpCopiedEmail => 'support@dailystitch.app copié';

  @override
  String get helpNoMailApp =>
      'Aucune application mail trouvée. Envoie-nous un e-mail à support@dailystitch.app.';

  @override
  String get helpTopicLabel => 'Sujet';

  @override
  String get helpWhatHappened => 'Que s\'est-il passé ?';

  @override
  String get helpHint => 'Une courte description aide beaucoup…';

  @override
  String get helpDisclaimer =>
      'Appuyer sur « Envoie-nous un e-mail » ouvre ton application mail avec un message pré-rempli (aucune donnée ne quitte ton appareil tant que tu n\'envoies pas).';

  @override
  String get helpFaqQ1 => 'Qu\'est-ce que la limite de 5 tâches ?';

  @override
  String get helpFaqA1 =>
      'Tu peux ajouter jusqu\'à 5 tâches par jour local. La 6e est bloquée volontairement — la discipline bat la surcharge. La limite est la fonctionnalité, pas une contrainte.';

  @override
  String get helpFaqQ2 => 'Que se passe-t-il à minuit ?';

  @override
  String get helpFaqA2 =>
      'À minuit, toute tâche encore marquée comme ouverte est estampillée « manquée » et passe dans Abandons. Les séries d\'habitudes se réinitialisent si l\'habitude n\'a pas été complétée la veille.';

  @override
  String get helpFaqQ3 => 'Qu\'est-ce qu\'Abandons ?';

  @override
  String get helpFaqA3 =>
      'Une liste douce et dismissible de tâches que tu n\'as pas terminées. Ouvre-la, réajoute seulement ce qui compte encore, et laisse le reste partir. Le niveau gratuit voit les 7 derniers jours ; Pro voit l\'historique complet.';

  @override
  String get helpFaqQ4 => 'Comment fonctionnent les séries ?';

  @override
  String get helpFaqA4 =>
      'Un jour prolonge la chaîne quand tu avais au moins 1 tâche et 0 manquées. Les jours sans tâche ne prolongent ni ne cassent la chaîne. Un gel de série pardonne un jour manqué par mois.';

  @override
  String get helpFaqQ5 => 'Qu\'est-ce que le gel de série ?';

  @override
  String get helpFaqA5 =>
      'Un « gel » par mois civil, Pro uniquement. Utilise-le un jour que tu as manqué pour maintenir ta chaîne en vie. Le trouve dans l\'onglet Progrès.';

  @override
  String get helpFaqQ6 => 'Où sont stockées mes données ?';

  @override
  String get helpFaqA6 =>
      'Toutes les données vivent dans Supabase (Postgres) sous le compte connecté. Nous ne vendons ni ne partageons jamais les données. Voir la politique de confidentialité dans la boutique Play Store pour les détails.';

  @override
  String get helpFaqQ7 => 'Comment supprimer mon compte ?';

  @override
  String get helpFaqA7 =>
      'Va dans Paramètres → Compte → Supprimer le compte. Ceci supprime définitivement ton profil, tes tâches, tes habitudes et les données d\'abonnement. Les abonnements Play actifs doivent être annulés séparément dans Google Play.';

  @override
  String get helpTopicsGeneral => 'Question générale';

  @override
  String get helpTopicsBug => 'Rapport de bug';

  @override
  String get helpTopicsStreak => 'Problème de série / report';

  @override
  String get helpTopicsBilling => 'Facturation ou niveau Pro';

  @override
  String get helpTopicsAccount => 'Compte et données';

  @override
  String get helpTopicsFeature => 'Demande de fonctionnalité';

  @override
  String get helpAccountAnon => '(non connecté)';

  @override
  String get splashTagline =>
      'Entretiens de petites graines. Fais pousser une forêt.';

  @override
  String get priorityStandard => 'STANDARD';

  @override
  String get priorityVital => 'VITAL';

  @override
  String get prioritySpark => 'ÉTINCELLE';

  @override
  String get settingsDeleteAccount => 'Supprimer le compte';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Supprimer définitivement tes données';

  @override
  String get settingsDeleteAccountConfirmTitle => 'Supprimer ton compte ?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Ceci supprime définitivement ton profil, tes tâches, tes habitudes et ta progression. Les abonnements actifs doivent être annulés séparément dans Google Play. Cette action est irréversible.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Supprimer définitivement';

  @override
  String get settingsDeleteAccountSuccess => 'Ton compte a été supprimé.';

  @override
  String get settingsDeleteAccountFailed =>
      'Impossible de supprimer le compte. Réessaie ou envoie un e-mail à support@dailystitch.app.';

  @override
  String get referralYouTitle => 'Invite des amis · gagne du Pro gratuit';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress sur $milestone amis ont rejoint';
  }

  @override
  String get referralYouShare => 'Partager l\'invitation';

  @override
  String get referralYouDetails => 'Voir les détails';

  @override
  String get referralPaywallTitle => 'Mois Pro gratuit';

  @override
  String get referralPaywallBody =>
      'Invite 5 amis qui s\'inscrivent → 1 mois de Pro gratuit';

  @override
  String get referralPaywallProBody =>
      'Continue à inviter — empile les mois Pro gratuits';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'Impossible de charger ta progression. Réessaie plus tard.';

  @override
  String get insightsMetricCurrentChain => 'CHAÎNE ACTUELLE';

  @override
  String get insightsMetricBestEver => 'MEILLEURE JAMAIS';

  @override
  String get insightsMetricTasksDone => 'TÂCHES TERMINÉES';

  @override
  String get insightsMetricPerfectDays => 'JOURS PARFAITS';

  @override
  String get insightsMetricHabits => 'HABITUDES';

  @override
  String get insightsDay => 'jour';

  @override
  String get insightsDays => 'jours';

  @override
  String get insightsSectionThisWeek => 'Cette semaine';

  @override
  String get insightsShareMyWeek => 'Partager ma semaine';

  @override
  String get insightsShareMyWeekPro => 'Partager ma semaine · Pro';

  @override
  String get insightsShareReceiptText =>
      'Ma semaine sur Daily Stitch. Ne brise pas la chaîne.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Affichage des $days derniers jours';
  }

  @override
  String get insightsHistoryUpsell =>
      'Débloque ton historique complet avec Pro';

  @override
  String get referralScreenTitle => 'Inviter des amis';

  @override
  String get referralLaunchGift => 'Cadeau du mois de lancement';

  @override
  String get referralRewardTitle => 'Obtiens 1 mois de Pro gratuit';

  @override
  String get referralRewardBody =>
      'Partage ton code avec des amis. Quand 5 personnes s\'inscrivent avec, tu débloques Daily Stitch Pro pendant un mois complet.';

  @override
  String get referralYourCode => 'Ton code de parrainage';

  @override
  String get referralCopyCodeTooltip => 'Copier le code';

  @override
  String get referralCodeCopied => 'Code de parrainage copié';

  @override
  String get referralShareWithFriends => 'Partager avec des amis';

  @override
  String get referralFooterHint =>
      'Les amis entrent ton code lorsqu\'ils créent un compte. Chaque ami compte une seule fois pour ta récompense.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count ami a rejoint';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count amis ont rejoint';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'Tu as gagné $count mois gratuit de Pro.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'Tu as gagné $count mois gratuits de Pro.';
  }

  @override
  String get referralRewardUnlocked =>
      'Récompense débloquée — profite de ton mois gratuit de Pro !';

  @override
  String referralRemainingToUnlock(int remaining) {
    return 'Encore $remaining pour débloquer ton mois gratuit';
  }

  @override
  String youProMemberSince(String month) {
    return 'Membre Bloom Pro depuis $month';
  }

  @override
  String get youProPerksTitle => 'Tes avantages Pro';

  @override
  String get manageProThankYou => 'Merci de soutenir Bloom';

  @override
  String get manageProReferralHint =>
      'Invite plus d\'amis pour prolonger ton Pro';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nAjoute SUPABASE_URL et SUPABASE_PUBLISHABLE_KEY (ou l\'ancien SUPABASE_ANON_KEY) dans leanspace/.env, puis reconstruis :\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Par défaut du système';

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
  String get onboardingLanguageTitle => 'Choisis ta langue';

  @override
  String get onboardingLanguageBody =>
      'Sélectionne la langue que tu souhaites utiliser dans Daily Stitch. Tu peux la changer à tout moment dans les paramètres.';

  @override
  String get onboardingLanguageContinue => 'Continuer';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Ami';

  @override
  String get settingsAppTheme => 'Thème de l\'application';

  @override
  String get settingsAppThemeSubtitle =>
      'Choisis les couleurs de ton sanctuaire personnel';

  @override
  String get settingsInviteFriendsTitle => 'Inviter des amis · Pro gratuit';

  @override
  String get settingsInviteFriendsSubtitle =>
      'Obtiens 1 mois gratuit quand 5 amis rejoignent';

  @override
  String get themePickerTitle => 'Sanctuaire personnel';

  @override
  String get themePickerSubtitle =>
      'Choisis une palette de couleurs qui t\'apporte la paix.';

  @override
  String get themeNameClassicBloom => 'Floraison Classique';

  @override
  String get themeNameSolarTerracotta => 'Terracotta Solaire';

  @override
  String get themeNameMidnightOasis => 'Oasis de Minuit';

  @override
  String get themeNameLavenderDream => 'Rêve de Lavande';

  @override
  String get themeNameNordicFrost => 'Givre Nordique';

  @override
  String get themeNameCyberpunkNeon => 'Néon Cyberpunk';

  @override
  String get reminderTitle => 'Rappels';

  @override
  String get reminderBody =>
      'Le Dernier appel te ping avant minuit si des tâches sont encore ouvertes.';

  @override
  String get reminderFinalCall => 'Dernier appel';

  @override
  String get reminderEveningNudge => 'Rappel du soir';

  @override
  String get reminderChangeTime => 'Changer l\'heure';

  @override
  String get reminderSave => 'Enregistrer les rappels';

  @override
  String get notificationChannelReminders => 'Rappels Daily Stitch';

  @override
  String get notificationChannelRemindersDesc =>
      'Rappels du soir et Dernier appel';

  @override
  String get notificationChannelAlarms => 'Alarmes de tâches Daily Stitch';

  @override
  String get notificationChannelAlarmsDesc =>
      'Alarmes fortes pour les rappels de tâches';

  @override
  String get notificationTaskReminderTitle => 'Rappel de tâche';

  @override
  String get notificationFinalCallTitle => 'Dernier appel';

  @override
  String notificationFinalCallBody(int count) {
    return 'Tu as encore $count tâche(s) ouverte(s) aujourd\'hui.';
  }

  @override
  String get notificationEveningTitle => 'Vérification du soir';

  @override
  String get notificationEveningBody =>
      'Comment ton jardin a-t-il poussé aujourd\'hui ?';

  @override
  String get widgetSetupTitle => 'Ajouter le widget de chaîne';

  @override
  String get widgetSetupBody =>
      'Garde ta série sur ton écran d\'accueil — pas besoin d\'ouvrir l\'application.';

  @override
  String get widgetSetupAdd => 'Ajouter à l\'écran d\'accueil';

  @override
  String get widgetSetupStep1 => 'Appuie longuement sur ton écran d\'accueil';

  @override
  String get widgetSetupStep2 => 'Appuie sur Widgets';

  @override
  String get widgetSetupStep3 => 'Trouve Daily Stitch et glisse-le';

  @override
  String get widgetSetupPinSuccess =>
      'Vérifie ton écran d\'accueil pour placer le widget.';

  @override
  String get widgetSetupPinFallback =>
      'Ton lanceur ne supporte peut-être pas l\'ajout en un appui. Utilise les étapes manuelles ci-dessous.';

  @override
  String get paywallWelcomePro => 'Bienvenue dans Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'ÉCONOMISE ~16%';

  @override
  String get paywallTermsTitle => 'Conditions d\'abonnement';

  @override
  String get paywallTermsBody =>
      'La facturation est gérée par Google Play. Les abonnements se renouvellent automatiquement jusqu\'à ce que tu annules dans Play Store \\u2192 Abonnements au moins 24 heures avant la fin de la période en cours. Tu peux gérer ou annuler ton abonnement à tout moment depuis ton compte Google Play.\\n\\nDésinstaller l\'application n\'annule pas ton abonnement.\\n\\nLes prix affichés sont dans ta devise locale et peuvent varier selon la région. Des taxes peuvent s\'appliquer.';

  @override
  String get paywallPrivacyTitle => 'Confidentialité';

  @override
  String get paywallPrivacyBody =>
      'LeanSpace stocke tes tâches, habitudes et données de série sur notre backend Supabase, liées à ton compte. Nous ne vendons jamais tes données.\\n\\nLes achats d\'abonnement sont traités par Google Play. Nous recevons un jeton d\'achat vérifié de Google pour confirmer ton statut Pro. Nous ne voyons ni ne stockons tes détails de paiement.\\n\\nTu peux demander l\'export complet de tes données ou la suppression de ton compte depuis Paramètres \\u2192 Suppression de compte.';

  @override
  String get paywallCloseTooltip => 'Fermer';

  @override
  String get paywallFooterLinks => 'Restaurer · Conditions · Confidentialité';

  @override
  String get manageProTitle => 'Abonnement Pro';

  @override
  String get manageProActive => 'Actif';

  @override
  String get manageProNotSubscribed => 'Non abonné';

  @override
  String get manageProFreeTier => 'Niveau gratuit';

  @override
  String manageProRenewsOn(String date) {
    return 'Renouvellement ou expiration le $date.';
  }

  @override
  String get manageProFreeBody =>
      'Tu utilises Daily Stitch Gratuit. Passe à la version supérieure pour débloquer le système complet.';

  @override
  String get manageProSectionManage => 'GÉRER';

  @override
  String get manageProOpenPlay => 'Ouvrir les abonnements Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Annule, modifie le plan ou mets à jour le moyen de paiement';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Retrouve ton abonnement existant (le cas échéant) ici';

  @override
  String get manageProShareApp => 'Partager Daily Stitch';

  @override
  String get manageProShareSubtitle => 'Parle de la chaîne à un ami';

  @override
  String get manageProSectionHelp => 'BESOIN D\'AIDE ?';

  @override
  String get manageProHelpTitle => 'Aide et support';

  @override
  String get manageProHelpSubtitle =>
      'FAQ abonnement, contact, rapports de bugs';

  @override
  String manageProBillingFooter(String version) {
    return 'Facturation gérée par Google Play · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Ouvre l\'application Google Play Store → appuie sur ton profil → Paiements et abonnements → Abonnements.';

  @override
  String get addTaskGrowSomething => 'Fais pousser quelque chose';

  @override
  String get addTaskPlantSprout => 'Planter une pousse';

  @override
  String get addTaskIntentionName => 'NOM DE L\'INTENTION';

  @override
  String get addTaskSproutName => 'NOM DE LA POUSSE';

  @override
  String get addTaskHintTask => 'ex., Salutation au Soleil du Matin';

  @override
  String get addTaskHintHabit => 'ex. Yoga du Matin';

  @override
  String get addTaskWhen => 'QUAND ?';

  @override
  String get addTaskPriority => 'PRIORITÉ';

  @override
  String get addTaskNotes => 'NOTES';

  @override
  String get addTaskCadenceDaily => 'Quotidien';

  @override
  String get addTaskCadenceWeekdays => 'En semaine';

  @override
  String get addTaskCadence3x => '3x/semaine';

  @override
  String get addTaskCadenceWeekly => 'Hebdomadaire';

  @override
  String get addTaskPlantIntention => 'Planter l\'intention';

  @override
  String get addTaskPlantSproutCta => 'Planter la pousse';

  @override
  String get addTaskPlanting => 'Plantation…';

  @override
  String get addTaskNameIntentionError => 'Nomme ton intention';

  @override
  String get addTaskNameSproutError => 'Nomme ta pousse';

  @override
  String get addTaskNotesMigrationWarning =>
      'Tâche sauvegardée. Les notes et la priorité nécessitent la dernière migration Supabase — exécute supabase/migrations/20260701000000_todos_notes_priority.sql.';

  @override
  String get addTaskNoSproutSlots =>
      'Aucun emplacement de pousse disponible — entretiens-en un d\'abord.';

  @override
  String get addTaskSaveSproutError =>
      'Impossible de sauvegarder la pousse — réessaie.';

  @override
  String get addTaskElementWater => 'EAU';

  @override
  String get addTaskElementLight => 'LUMIÈRE';

  @override
  String get addTaskElementSoil => 'TERRE';

  @override
  String get addTaskElementBreeze => 'BRISE';

  @override
  String get addTaskCadenceLabel => 'CADENCE';

  @override
  String get addTaskPreparationNotes => 'NOTES DE PRÉPARATION';

  @override
  String get addTaskTendingNotes => 'NOTES D\'ENTRETIEN';

  @override
  String get addTaskNotesHintTask =>
      'Des outils ou conseils pour cette tâche ?';

  @override
  String get addTaskNotesHintHabit =>
      'À quoi ressemble l\'entretien de cette pousse ?';

  @override
  String get addTaskChooseElement => 'CHOISIR L\'ÉLÉMENT';

  @override
  String get addTaskElementsTooltip => 'Que signifient les éléments ?';

  @override
  String get addTaskTaskSeed => 'Graine de tâche';

  @override
  String get addTaskHabitSprout => 'Pousse d\'habitude';

  @override
  String get addTaskPickElement => 'Choisis le bon élément';

  @override
  String get addTaskPickElementBody =>
      'Chaque élément correspond à un type d\'effort différent. Le Gardien grandit quand tu arroses le bon.';

  @override
  String get addTaskClearForm => 'Effacer le formulaire';

  @override
  String get shareCouldNotShare => 'Impossible de partager maintenant';

  @override
  String get authReferralCodeLabel => 'Code de parrainage (optionnel)';

  @override
  String get authReferralCodeHint => 'Code d\'un ami';

  @override
  String get youPerkHabitSlots => '5 emplacements d\'habitude';

  @override
  String get youPerkFullHistory => 'Historique complet';

  @override
  String get youPerkAllThemes => 'Tous les thèmes';

  @override
  String get youPerkStreakFreezes => '2 gels de série / mois';

  @override
  String get youPerkLegendaryMedals => 'Médailles légendaires';

  @override
  String get subscriptionPurchaseFailed => 'Achat échoué. Réessaie.';

  @override
  String get subscriptionUnavailable =>
      'Les achats in-app ne sont pas disponibles sur cet appareil.';

  @override
  String get subscriptionLoadFailed =>
      'Impossible de charger les options d\'abonnement.';

  @override
  String get subscriptionVerifyFailed =>
      'Impossible de vérifier l\'achat. Essaie Restaurer l\'achat.';

  @override
  String get streakFreezeFailed => 'Impossible d\'utiliser le gel de série.';

  @override
  String get streakFreezeAlreadyUsed =>
      'Tu as déjà utilisé ton gel ce mois-ci.';

  @override
  String get streakFreezeNoMissed => 'Aucune tâche manquée ce jour à geler.';

  @override
  String get streakFreezeNotPastDay => 'Tu ne peux geler qu\'un jour passé.';

  @override
  String get myDayLoadError =>
      'Impossible de charger Ma journée. Tire pour rafraîchir.';

  @override
  String get myDayCapReached => 'Tu as atteint la limite de 5 tâches du jour.';

  @override
  String get myDayRemoveTaskError => 'Impossible de supprimer la tâche.';

  @override
  String get shareCardTitle => 'Partager ta semaine';

  @override
  String get shareCardCta => 'Partager l\'image';

  @override
  String get medalTierSprout => 'Pousse';

  @override
  String get medalTierCommon => 'Commune';

  @override
  String get medalTierRare => 'Rare';

  @override
  String get medalTierEpic => 'Épique';

  @override
  String get medalTierLegendary => 'Légendaire';

  @override
  String get medalCategoryTasks => 'Tâches';

  @override
  String get medalCategoryHabits => 'Habitudes';

  @override
  String get medalCategoryStreaks => 'Séries';

  @override
  String get medalCategoryMastery => 'Maîtrise';

  @override
  String get medalsShareTooltip => 'Partager les succès';

  @override
  String get medalsFilterAll => 'Toutes';

  @override
  String get addHabitTitleNew => 'Planter une nouvelle pousse';

  @override
  String get addHabitTitleEdit => 'Entretiens ta pousse';

  @override
  String get addHabitLabelSproutName => 'NOM DE LA POUSSE';

  @override
  String get shareCardAppBarTitle => 'Carte de partage';

  @override
  String get shareCardAppBarTitleMedal => 'Partager ta médaille';

  @override
  String shareCardDescMedal(Object title) {
    return 'Affiche ton nouveau badge $title';
  }

  @override
  String get shareCardBodyMedal =>
      'Partage la victoire avec ton entourage. La carte est exportée en PNG et prête pour n\'importe quelle application sociale.';

  @override
  String get shareCardCtaPreparing => 'Préparation…';

  @override
  String get shareCardMilestone => 'NOUVEAU JALON DÉBLOQUÉ';

  @override
  String get shareCardStatChain => 'jours de chaîne';

  @override
  String get shareCardStatSprouts => 'pousses';

  @override
  String get shareCardStatMedals => 'médailles';

  @override
  String shareCardHeadlineStreak(int days) {
    return 'Série de $days jours';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count médailles obtenues';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Gardien de pousses';

  @override
  String get shareCardHeadlineFirstSeeds => 'Premières graines plantées';

  @override
  String get shareCardHeadlineGardenBegins => 'Un jardin commence';

  @override
  String get shareCardSubheadMonth =>
      'Tu as entretenu tes habitudes avec succès pendant un mois complet.';

  @override
  String get shareCardSubheadWeek =>
      'Une semaine complète de croissance — ta forêt s\'épaissit.';

  @override
  String get shareCardSubheadProgress =>
      'Ton sanctuaire montre de vrais progrès. Continue d\'entretenir.';

  @override
  String get shareCardSubheadSprouts =>
      'Tes premières pousses prennent racine. Arrose-les chaque jour.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Tes premières graines sont dans la terre. Regarde-les s\'ouvrir.';

  @override
  String get shareCardSubheadFallback =>
      'Toute forêt commence par un petit choix.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — cinq petites graines par jour, une chaîne incassable. Plante les tiennes.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Essaie Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Je construis ma chaîne quotidienne sur Daily Stitch — rejoins-moi avec mon code de parrainage $code et nous grandissons ensemble.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Rejoins-moi sur Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Mon progrès Daily Stitch — $year sur Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Je viens de débloquer la médaille « $title » sur Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Tâches terminées';

  @override
  String get insightsReceiptPerfectDays => 'Jours parfaits';

  @override
  String get insightsReceiptCompletion => 'Complétion';

  @override
  String insightsReceiptDate(String date) {
    return 'Semaine du $date';
  }

  @override
  String get insightsReceiptFooter => 'Ne brise pas la chaîne.';

  @override
  String get elementLabelWater => 'Eau';

  @override
  String get elementLabelLight => 'Lumière';

  @override
  String get elementLabelSoil => 'Terre';

  @override
  String get elementLabelBreeze => 'Brise';

  @override
  String get elementTaglineWater =>
      'Restaurer. Hydratation, repos, soins émotionnels — tout ce qui remplit le puits.';

  @override
  String get elementTaglineLight =>
      'Éveiller. Lumière du matin, blocs de concentration, étude, méditation — énergie et clarté.';

  @override
  String get elementTaglineSoil =>
      'Ancrer. Lecture, journal, travail profond — racines lentes qui construisent une force à long terme.';

  @override
  String get elementTaglineBreeze =>
      'Bouger. Marche, course, respiration — énergie légère et mobile qui dégage l\'esprit.';

  @override
  String get elementWhenWater => 'Quand tu te sens vidé ou épuisé.';

  @override
  String get elementWhenLight =>
      'Quand tu as besoin d\'un début clair à ta journée.';

  @override
  String get elementWhenSoil =>
      'Quand le travail est lent mais en vaut la peine (étude, artisanat, soin).';

  @override
  String get elementWhenBreeze =>
      'Quand ton corps (ou ton esprit) a besoin de bouger et de respirer.';

  @override
  String get bloomTierMastery => 'Maîtrise';

  @override
  String get bloomTierStrong => 'Fort';

  @override
  String get bloomTierGrowing => 'En croissance';

  @override
  String get bloomTierSprouting => 'Germination';

  @override
  String get bloomTierLocked => 'Verrouillé';

  @override
  String habitBloomSubtitle(int count, String element) {
    return 'Série de $count jours · $element';
  }

  @override
  String get medal_id_first_spark => 'Première Étincelle';

  @override
  String get medal_sub_first_spark => 'Tu as allumé la mèche.';

  @override
  String get medal_desc_first_spark =>
      'Termine ta première tâche. Toute chaîne commence ici.';

  @override
  String get medal_id_triple_seed => 'Triple Graine';

  @override
  String get medal_sub_triple_seed => 'Trois dans la terre.';

  @override
  String get medal_desc_triple_seed => 'Termine 3 tâches au total.';

  @override
  String get medal_id_dozen_sower => 'Semeur de Douzaine';

  @override
  String get medal_sub_dozen_sower => 'Un champ de douze.';

  @override
  String get medal_desc_dozen_sower => 'Termine 12 tâches au total.';

  @override
  String get medal_id_quarter_century => 'Quart de Siècle';

  @override
  String get medal_sub_quarter_century => 'Une saison de oui.';

  @override
  String get medal_desc_quarter_century => 'Termine 25 tâches au total.';

  @override
  String get medal_id_productivity_titan => 'Titan de Productivité';

  @override
  String get medal_sub_productivity_titan => 'La constance se compose.';

  @override
  String get medal_desc_productivity_titan =>
      'Termine 50 tâches — tu as créé un vrai élan.';

  @override
  String get medal_id_century_planter => 'Planteur du Siècle';

  @override
  String get medal_sub_century_planter => 'Une forêt à toi.';

  @override
  String get medal_desc_century_planter =>
      'Termine 100 tâches. Tu es dans le top 5% des utilisateurs.';

  @override
  String get medal_id_clean_day => 'Jour Propre';

  @override
  String get medal_sub_clean_day => 'Pas une seule mauvaise herbe.';

  @override
  String get medal_desc_clean_day =>
      'Termine chaque tâche que tu plantes en un seul jour.';

  @override
  String get medal_id_triple_perfect => 'Triple Parfait';

  @override
  String get medal_sub_triple_perfect => 'Trois exécutions sans faille.';

  @override
  String get medal_desc_triple_perfect => 'Atteins 3 jours parfaits.';

  @override
  String get medal_id_perfect_week => 'Semaine Parfaite';

  @override
  String get medal_sub_perfect_week => 'Sept jours sans rupture.';

  @override
  String get medal_desc_perfect_week => '7 jours parfaits d\'affilée.';

  @override
  String get medal_id_two_week_chain => 'Force du Fortnight';

  @override
  String get medal_sub_two_week_chain => 'Deux semaines de feu.';

  @override
  String get medal_desc_two_week_chain => 'Maintiens une chaîne de 14 jours.';

  @override
  String get medal_id_iron_chain => 'Chaîne de Fer';

  @override
  String get medal_sub_iron_chain => '30 maillons forgés.';

  @override
  String get medal_desc_iron_chain =>
      'Une chaîne de 30 jours. La médaille la plus difficile.';

  @override
  String get medal_id_quarterly_chain => 'Chaîne Trimestrielle';

  @override
  String get medal_sub_quarterly_chain => 'Une saison, sans rupture.';

  @override
  String get medal_desc_quarterly_chain =>
      'Une chaîne de 90 jours. Statut légendaire.';

  @override
  String get medal_id_vital_priority => 'Étincelle Vitale';

  @override
  String get medal_sub_vital_priority => 'Tu as choisi les difficiles.';

  @override
  String get medal_desc_vital_priority =>
      'Termine 5 tâches marquées Priorité Vitale.';

  @override
  String get medal_id_spark_priority => 'Dompteur d\'Étincelles';

  @override
  String get medal_sub_spark_priority =>
      'Les victoires rapides s\'additionnent.';

  @override
  String get medal_desc_spark_priority =>
      'Termine 5 tâches marquées Priorité Étincelle.';

  @override
  String get medal_id_note_taker => 'Preneur de Notes';

  @override
  String get medal_sub_note_taker =>
      'Des plans sur papier battent des plans en tête.';

  @override
  String get medal_desc_note_taker =>
      'Ajoute des notes de préparation à 5 tâches différentes.';

  @override
  String get medal_id_left_behind_rescuer => 'Sauveur des Abandonnés';

  @override
  String get medal_sub_left_behind_rescuer => 'Aucune tâche abandonnée.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Réajoute 3 tâches manquées le lendemain.';

  @override
  String get medal_id_first_sprout => 'Premier Germe';

  @override
  String get medal_sub_first_sprout => 'Un nouveau rituel quotidien.';

  @override
  String get medal_desc_first_sprout => 'Plante ta première habitude.';

  @override
  String get medal_id_trio_sprout => 'Trio Germe';

  @override
  String get medal_sub_trio_sprout => 'Un petit écosystème.';

  @override
  String get medal_desc_trio_sprout => 'Plante 3 habitudes différentes.';

  @override
  String get medal_id_week_of_growth => 'Semaine de Croissance';

  @override
  String get medal_sub_week_of_growth => 'Les racines commencent à tenir.';

  @override
  String get medal_desc_week_of_growth =>
      'Entretiens une habitude chaque jour pendant 7 jours.';

  @override
  String get medal_id_fortnight_floret => 'Fleur du Fortnight';

  @override
  String get medal_sub_fortnight_floret => 'Une floraison complète.';

  @override
  String get medal_desc_fortnight_floret =>
      'Une série d\'habitudes de 14 jours.';

  @override
  String get medal_id_rooted_master => 'Maître Ancré';

  @override
  String get medal_sub_rooted_master => 'Racines profondes, force profonde.';

  @override
  String get medal_desc_rooted_master => 'Une série d\'habitudes de 30 jours.';

  @override
  String get medal_id_half_year_bloom => 'Floraison Semestrielle';

  @override
  String get medal_sub_half_year_bloom => 'Le jardin est permanent maintenant.';

  @override
  String get medal_desc_half_year_bloom =>
      'Maintiens une seule habitude pendant 180 jours.';

  @override
  String get medal_id_garden_keeper => 'Gardien du Jardin';

  @override
  String get medal_sub_garden_keeper => 'Variété, ensemble.';

  @override
  String get medal_desc_garden_keeper =>
      'Cultive 4 habitudes différentes en même temps.';

  @override
  String get medal_id_hydration_hero => 'Héros de l\'Hydratation';

  @override
  String get medal_sub_hydration_hero => 'Tu remplis le puits.';

  @override
  String get medal_desc_hydration_hero =>
      'Plante une habitude d\'hydratation (eau/boisson).';

  @override
  String get medal_id_mindful_mover => 'Mouvant Conscient';

  @override
  String get medal_sub_mindful_mover => 'Le corps se souvient.';

  @override
  String get medal_desc_mindful_mover =>
      'Plante une habitude de mouvement (yoga/marcher/courir).';

  @override
  String get medal_id_devoted_keeper => 'Gardien Dévoué';

  @override
  String get medal_sub_devoted_keeper => 'Soixante jours, une pratique.';

  @override
  String get medal_desc_devoted_keeper =>
      'Entretiens une seule habitude pendant 60 jours consécutifs.';

  @override
  String get medal_id_tending_notes => 'Notes d\'Entretien';

  @override
  String get medal_sub_tending_notes => 'Réfléchis en chemin.';

  @override
  String get medal_desc_tending_notes =>
      'Ajoute des notes d\'entretien à 3 habitudes.';

  @override
  String get medalTierTaglineSprout => 'Plante la première graine';

  @override
  String get medalTierTaglineCommon => 'Construire l\'habitude';

  @override
  String get medalTierTaglineRare => 'Montrer un vrai élan';

  @override
  String get medalTierTaglineEpic => 'Tu es une force de la nature';

  @override
  String get medalTierTaglineLegendary =>
      'Mythique, presque personne n\'arrive ici';

  @override
  String get guardianHeadlineNoTasks =>
      'Le sol d\'aujourd\'hui est frais.\nPlante ta première graine\net regarde pousser.';

  @override
  String get guardianHeadlineAllDone =>
      'Chaque graine que tu as plantée\nest en fleur.\nRepose, Gardien — tu l\'as mérité.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count jours\nde croissance ininterrompue.\nTa forêt est pleine de vie.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Une semaine complète en fleur,\nGardien.\nUn jour de plus parfait\nétend la chaîne.';

  @override
  String get guardianHeadlineStreak3 =>
      'Ta chaîne tient bon.\nEntretiens les graines\nqui attendent d\'ouvrir.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Tu gères bien les tâches.\nPlante un germe —\nles habitudes font pousser les forêts.';

  @override
  String get guardianHeadlineSomeDone =>
      'Certaines graines ont germé,\nd\'autres non. C\'est OK.\nDemain est une autre plantation.';

  @override
  String get guardianHeadlineMorning =>
      'Bonjour, Gardien.\nLe jour est jeune\net le sol est prêt.';

  @override
  String get guardianHeadlineAfternoon =>
      'Bon après-midi, Gardien.\nLa moitié de la lumière reste —\ncontinue d\'entretenir.';

  @override
  String get guardianHeadlineEvening =>
      'Bonsoir, Gardien.\nUn dernier tour\navant que le soleil ne se couche.';

  @override
  String get guardianHeadlineNight =>
      'Tu brûles l\'huile de minuit ?\nMême les Gardiens se reposent.\nPlante la graine de demain.';

  @override
  String get guardianBodyNoTasks =>
      'Ton sanctuaire est silencieux maintenant. Ajoute une intention et vois ce qui change au coucher du soleil.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count jours en cours. La chaîne n\'est pas de la chance — ce sont les petits choix qui s\'empilent. Continue à empiler.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Une chaîne de $count jours est un vrai élan. Termine les graines ouvertes d\'aujourd\'hui avant de dire que tu as fini.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Tu as planté $count tâches jusqu\'ici. Ajouter même un seul germe d\'habitude ferait croître le travail jour après jour.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Tu finis environ $pct% de ce que tu plantes. Moins de graines, plus affûtées, tendent à pousser plus haut que dix dispersées.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Ton sanctuaire est vivant. $tasks tâches faites, $sprouts germes poussant — le travail se voit.';
  }

  @override
  String get guardianInsightWaitingTitle =>
      'En attente de ton premier mouvement';

  @override
  String get guardianInsightWaitingBody =>
      'Ajoute une tâche ou une habitude et je commencerai à lire les patterns dans ton jardin. Plus tu plantes, plus j\'ai à apprendre.';

  @override
  String get guardianInsightWaitingCta => 'Plante ta première graine';

  @override
  String get guardianInsightChainSuperTitle =>
      'La chaîne est ton super-pouvoir';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Tu as maintenu une chaîne de $count jours. Les séries battent la motivation à chaque fois — garde-la chaude, même les jours lents.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Ajoute la graine de demain';

  @override
  String get guardianInsightChainColdTitle =>
      'La chaîne est froide — commence une nouvelle';

  @override
  String get guardianInsightChainColdBody =>
      'Tu as planté avant, ce qui signifie que tu peux replanter. Une petite tâche faite aujourd\'hui est une plus longue chaîne demain.';

  @override
  String get guardianInsightChainColdCta => 'Plante une graine';

  @override
  String get guardianInsightLessIsMoreTitle =>
      'Moins c\'est plus cette semaine';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Tu finis environ $pct% de ce que tu plantes. Essaie 3 intentions affûtées au lieu de 5 vagues — la qualité se compose.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Affûte la journée';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Prochaine médaille : $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Tu en es à $value sur $target $unit. Quelques jours de plus honnêtement et c\'est à toi.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Voir la médaille';

  @override
  String get guardianInsightSteadyTitle => 'Tu es dans une saison stable';

  @override
  String get guardianInsightSteadyBody =>
      'Pas de médaille en vue — c\'est bien. Entretiens ce que tu as. La prochaine floraison est en chemin.';

  @override
  String get guardianInsightSteadyCta => 'Voir les progrès';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 tâche dans ta chaîne. Minuit approche.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count tâches dans ta chaîne. Minuit approche.';
  }

  @override
  String get notificationEveningBodyOne =>
      'Tu as encore 1 tâche ouverte aujourd\'hui.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Tu as encore $count tâches ouvertes aujourd\'hui.';
  }

  @override
  String get notificationTickerTaskReminder => 'Rappel de tâche';

  @override
  String get notificationTickerTaskAlarm => 'Alarme de tâche';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count jours de série · $element';
  }
}
