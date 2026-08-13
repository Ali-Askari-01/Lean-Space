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
  String get tabProgress => 'ProgrÃ¨s';

  @override
  String get tabYou => 'Vous';

  @override
  String get navMyDay => 'Ma journÃ©e';

  @override
  String get navSettings => 'ParamÃ¨tres';

  @override
  String get navHelp => 'Aide et support';

  @override
  String get navHistory => '7 derniers jours';

  @override
  String get navLeftBehind => 'Abandons';

  @override
  String get navInsights => 'Votre progression';

  @override
  String get navMedals => 'Mes mÃ©dailles';

  @override
  String get navManagePro => 'GÃ©rer l\'abonnement Pro';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Encore debout Ã  cette heure ?';

  @override
  String get greetingMorning => 'Bonjour, soleil !';

  @override
  String get greetingAfternoon => 'Bon aprÃ¨s-midi, ami';

  @override
  String get greetingEvening => 'Bonsoir, champion';

  @override
  String get greetingNight => 'Tu te reposes bien, Gardien ?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Aujourd\'hui Â· $done sur $total tÃ¢ches';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done sur $total habitudes';
  }

  @override
  String get todayChainGrows => 'LA CHAÃŽNE GRANDIT QUAND TU FINIS';

  @override
  String get todayChainComplete =>
      'CHAÃŽNE COMPLÃˆTE Â· ENTRETiens LE JARDIN DEMAIN';

  @override
  String get taskCapInfo => 'Pourquoi une limite de 5 tÃ¢ches ?';

  @override
  String get taskCapDiscipline => 'DISCIPLINE D\'ABORD PAR CONCEPTION';

  @override
  String get taskCapTitle => 'On limite Ã  dessein ta journÃ©e Ã  5 tÃ¢ches.';

  @override
  String get taskCapBody =>
      'Les petites chaÃ®nes battent les longues. Tu as plus de chances de finir 3 sur 5 et de ressentir la victoire que d\'abandonner 8 sur 10 et de ressentir l\'Ã©chec.';

  @override
  String get taskCapBulletDone =>
      'Les tÃ¢ches terminÃ©es comptent pour ta chaÃ®ne';

  @override
  String get taskCapBulletDoneBody =>
      'Un jour oÃ¹ les 5 sont terminÃ©es prolonge ta sÃ©rie d\'un jour.';

  @override
  String get taskCapBulletMissed => 'Les tÃ¢ches manquÃ©es vont dans Abandons';

  @override
  String get taskCapBulletMissedBody =>
      'Ã€ minuit, les tÃ¢ches incomplÃ¨tes apparaissent dans Abandons. RÃ©ajoute seulement ce qui compte encore.';

  @override
  String get taskCapBulletFreeze => 'Le gel de sÃ©rie pardonne un manquement';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro te donne 2 gels de sÃ©rie par mois â€” ils couvrent un jour manquÃ© pour que ta chaÃ®ne survive.';

  @override
  String get tasksHeader => 'TÃ¢ches';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Ajouter une graine de tÃ¢che';

  @override
  String get tasksCapReached =>
      '5/5 emplacements utilisÃ©s â€” termine-en une pour en planter une nouvelle.';

  @override
  String get tasksEmptyCta =>
      'Plante ta premiÃ¨re graine â€” qu\'est-ce qui compte aujourd\'hui ?';

  @override
  String get habitsHeader => 'Habitudes';

  @override
  String habitsGrowing(String count) {
    return '$count en croissance';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Meilleure sÃ©rie $days j';
  }

  @override
  String get habitsPlantNew => 'Planter une nouvelle pousse d\'habitude';

  @override
  String get habitsPlantFirst => 'Planter une habitude';

  @override
  String get habitsLocked =>
      'Emplacement Pro â€” dÃ©bloque pour planter plus de pousses';

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
    return '$count manquÃ©es â€” toujours dans Abandons';
  }

  @override
  String get leftBehindTap => 'Appuie pour rÃ©ajouter ou laisser partir';

  @override
  String get leftBehindDismiss => 'Ignorer';

  @override
  String get leftBehindTitle => 'Abandons';

  @override
  String get leftBehindEmpty => 'Rien en reste';

  @override
  String get leftBehindEmptyBody =>
      'Aucune tÃ¢che manquÃ©e. Chaque graine que tu plantes est entretenue. Le jardin est propre.';

  @override
  String get leftBehindClearAll => 'Tout effacer';

  @override
  String get leftBehindClearAllConfirm => 'Effacer tous les abandonnÃ©s ?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Ceci supprimera dÃ©finitivement $count tÃ¢che(s) manquÃ©e(s). Cette action est irrÃ©versible.';
  }

  @override
  String get leftBehindReAdd => 'RÃ©ajouter aujourd\'hui';

  @override
  String get leftBehindReAddButton => 'RÃ©ajouter';

  @override
  String get leftBehindAddedToToday => 'AjoutÃ© Ã  aujourd\'hui';

  @override
  String get leftBehindLetGo => 'Laisser partir';

  @override
  String get leftBehindHeader => 'ABANDONS';

  @override
  String get leftBehindMissedTasks => 'TÃ‚CHES MANQUÃ‰ES';

  @override
  String get leftBehindWaitingOne => '1 tÃ¢che t\'attend.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count tÃ¢ches t\'attendent.';
  }

  @override
  String get leftBehindBody =>
      'RÃ©ajoute une tÃ¢che pour la ramener aujourd\'hui, ou laisse-la partir. RÃ©ajouter maintient ta sÃ©rie en vie.';

  @override
  String leftBehindReAddedSnack(String task) {
    return 'Â« $task Â» est de retour dans ta journÃ©e.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'Â« $task Â» supprimÃ©';
  }

  @override
  String get leftBehindClearedSnack => 'Abandons effacÃ©s';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Hier Â· $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count tÃ¢che(s) restante(s) pour aujourd\'hui';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Dernier appel â€” $count tÃ¢che(s) encore ouverte(s)';
  }

  @override
  String get streakAtRiskBody => 'Minuit approche. La chaÃ®ne en dÃ©pend.';

  @override
  String get streakAtRiskBodyLow =>
      'Tu as encore le temps. Un jour propre prolonge ta sÃ©rie.';

  @override
  String get streakAtRiskFreeze =>
      'Hier manquÃ© â€” utiliser un gel de sÃ©rie ?';

  @override
  String get streakFreezeUse => 'Utiliser le gel';

  @override
  String get streakFreezeUseForYesterday =>
      'Utiliser le gel de sÃ©rie mensuel pour hier';

  @override
  String get streakFreezeAppliedYesterday =>
      'Gel de sÃ©rie appliquÃ© pour hier.';

  @override
  String get chainBrokenTitle => 'La chaÃ®ne est cassÃ©e. Ce n\'est pas grave.';

  @override
  String get chainBrokenBody =>
      'Toute longue chaÃ®ne finit un jour. Ce qui compte, c\'est ce que tu plantes aujourd\'hui. Un seul jour parfait recommence la suivante.';

  @override
  String get chainBrokenCta => 'Retour Ã  aujourd\'hui';

  @override
  String get chainBrokenPlantFirst => 'Plante la premiÃ¨re graine du jour';

  @override
  String get chainBrokenCheck => 'VÃ©rifie d\'abord Abandons';

  @override
  String get chainBrokenBestChain => 'meilleure chaÃ®ne';

  @override
  String get chainBrokenTasksDone => 'tÃ¢ches terminÃ©es';

  @override
  String get chainBrokenSprouts => 'pousses';

  @override
  String get chainRecoveryFreshStart => 'Un nouveau dÃ©part';

  @override
  String get medalsTitle => 'Mes mÃ©dailles';

  @override
  String get medalsTrophyRoom => 'Salle des trophÃ©es';

  @override
  String get medalsAllMedals => 'Toutes les mÃ©dailles';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned sur $total mÃ©dailles obtenues';
  }

  @override
  String get medalsTrophyEmpty => 'Ton premier badge est Ã  une tÃ¢che';

  @override
  String get medalsTrophyFirst =>
      'Tu as obtenu ta premiÃ¨re mÃ©daille â€” continue';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned mÃ©dailles dans ta salle des trophÃ©es';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'ProgrÃ¨s vers les $total mÃ©dailles';
  }

  @override
  String get medalsShareCta => 'CrÃ©er une carte partageable';

  @override
  String get medalsEmptyTitle => 'Rien dans cette catÃ©gorie pour l\'instant';

  @override
  String get medalsEmptyBody =>
      'Termine une tÃ¢che ou entretiens une pousse pour dÃ©marrer ta salle des trophÃ©es.';

  @override
  String get medalSheetLocked => 'MÃ‰DAILLE PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'OBTENUE Â· $tier';
  }

  @override
  String get medalSheetUnlock => 'DÃ©bloquer avec Pro';

  @override
  String get medalSheetProgress => 'ProgrÃ¨s';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Encore $n $unit pour dÃ©bloquer.';
  }

  @override
  String get medalSheetAlmost => 'Encore un pas pour dÃ©bloquer.';

  @override
  String get medalCategory => 'CatÃ©gorie';

  @override
  String get medalShareOnSocials => 'Partager sur les rÃ©seaux';

  @override
  String get medalShareLater => 'Plus tard';

  @override
  String get medalUnlocked => 'MÃ‰DAILLE DÃ‰BLOQUÃ‰E';

  @override
  String get medalProgressTitle => 'ProgrÃ¨s';

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
    return '$percent% terminÃ©';
  }

  @override
  String historyThisWeek(String days) {
    return '$days DERNIERS JOURS';
  }

  @override
  String get historyDayByDay => 'JOUR PAR JOUR';

  @override
  String get historyEmpty =>
      'Plante des graines pour voir ta semaine se dÃ©rouler.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Tu as terminÃ© $done sur $total tÃ¢ches. $perfect jour(s) parfait(s).';
  }

  @override
  String get historyUpsellTitle => 'Voir ton historique complet';

  @override
  String get historyUpsellBody =>
      'Pro dÃ©bloque 30 jours d\'historique. Gratuit en montre 7.';

  @override
  String get historyPerfect => 'PARFAIT';

  @override
  String get historyFrozen => 'GELÃ‰';

  @override
  String get historyToday => 'Aujourd\'hui';

  @override
  String get historyEmptyDay => 'Aucune graine plantÃ©e ce jour';

  @override
  String historyLeftBehindCount(String count) {
    return '$count abandonnÃ©(s)';
  }

  @override
  String get progressVitality => 'VITALITÃ‰ DU JOUR';

  @override
  String get progressVitalityEmpty =>
      'Plante une graine pour commencer ton jardin.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done sur $total graines plantÃ©es aujourd\'hui.';
  }

  @override
  String progressChainPill(String days) {
    return 'ChaÃ®ne de ${days}j';
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
      'Jalons de sÃ©rie pour les pousses que tu arroses chaque jour.';

  @override
  String get progressNextBadge => 'Prochain badge';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned sur $total';
  }

  @override
  String get progressPersonalActivity => 'ActivitÃ© personnelle';

  @override
  String progressBrowseMonth(String month) {
    return 'Navigation $month. Appuie sur Â« Aujourd\'hui Â» pour revenir Ã  ton activitÃ© en cours.';
  }

  @override
  String get progressJumpToToday => 'Aujourd\'hui';

  @override
  String get progressCalendarLegend => 'plus foncÃ© = plus terminÃ©';

  @override
  String get progressCalendarBody =>
      'Le vert foncÃ© signifie un jour parfait. La teinte s\'estompe quand tu sautes.';

  @override
  String get paywallTitle => 'Ne casse pas la chaÃ®ne.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro te donne le systÃ¨me complet de discipline.';

  @override
  String get paywallFeatures =>
      'Les 5 emplacements d\'habitude, pas seulement 3|Ton historique complet, pour toujours|Le set complet de mÃ©dailles|Gel de sÃ©rie chaque mois|ReÃ§u hebdomadaire + cartes de partage|ThÃ¨mes et plus';

  @override
  String get paywallFeaturesBodies =>
      'Le gratuit te donne 3. Pro dÃ©bloque les cinq pour que ton rituel quotidien complet puisse vivre ici.|Parcoures chaque jour que tu as complÃ©tÃ© â€” pas seulement les 7 derniers. Regarde des annÃ©es en arriÃ¨re, pas des semaines.|DÃ©bloque les mÃ©dailles de niveau LÃ©gendaire. Les badges les plus rares sont pour ceux qui s\'engagent pleinement.|2 gels de sÃ©rie par mois pour qu\'un seul mauvais jour ne termine pas ta chaÃ®ne.|De belles cartes de partage de ta semaine. Publie ta chaÃ®ne, inspire quelqu\'un Ã  commencer.|DÃ©bloque de nouvelles couleurs d\'accent et thÃ¨mes au fur et Ã  mesure. Mises Ã  jour gratuites.';

  @override
  String get paywallYearly => 'Annuel';

  @override
  String get paywallYearlyCaption => 'Meilleur prix Â· ~2,50 \$/mois';

  @override
  String get paywallYearlyBadge => 'Ã‰CONOMISE 35%';

  @override
  String get paywallMonthly => 'Mensuel';

  @override
  String get paywallMonthlyCaption =>
      'Facturation mensuelle Â· annule Ã  tout moment';

  @override
  String paywallStartCta(String price) {
    return 'Commencer Pro Â· $price/an';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Commencer Pro Â· $price/mois';
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
  String get paywallRestore => 'Restaurer l\'achat';

  @override
  String get paywallTerms => 'Conditions';

  @override
  String get paywallPrivacy => 'ConfidentialitÃ©';

  @override
  String get paywallNoRestore =>
      'Aucun achat prÃ©cÃ©dent trouvÃ© sur ce compte.';

  @override
  String get paywallRestoreLater =>
      'Nous restaurerons ton achat Ã  la prochaine synchronisation.';

  @override
  String get paywallAlreadyPro => 'Tu es sur Pro. Merci pour le soutien.';

  @override
  String get paywallHabitSlotHead =>
      'Tu as utilisÃ© tous tes emplacements d\'habitude gratuits. DÃ©bloque le set complet pour planter chaque rituel qui te tient Ã  cÅ“ur.';

  @override
  String get paywallHistoryHead =>
      'Voir ton historique complet â€” chaque jour parfait, chaque mÃ©daille, chaque retour.';

  @override
  String get paywallMedalHead =>
      'Les mÃ©dailles les plus rares sont rÃ©servÃ©es aux Pro. Continue â€” tu es plus prÃ¨s que tu ne le penses.';

  @override
  String get settingsYourActivity => 'TON ACTIVITÃ‰';

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
  String get settingsEcosystemSupport => 'SUPPORT Ã‰COSYSTÃˆME';

  @override
  String get settingsHowItWorks => 'Comment Ã§a marche';

  @override
  String get settingsSignOut => 'DÃ©connexion';

  @override
  String get settingsSignOutConfirm =>
      'ÃŠtes-vous sÃ»r de vouloir vous dÃ©connecter ?';

  @override
  String get settingsProActive => 'Actif';

  @override
  String get settingsProFree => 'Niveau gratuit';

  @override
  String get settingsLanguage => 'Langue';

  @override
  String get settingsLanguageValue => 'Par dÃ©faut du systÃ¨me';

  @override
  String get firstRunGreeting =>
      '5 tÃ¢ches. Pas plus. Fais en sorte qu\'elles comptent.';

  @override
  String get firstRunBody =>
      'Plante ta premiÃ¨re graine â€” qu\'est-ce qui compte le plus aujourd\'hui ?';

  @override
  String get firstRunCta => 'Plante ta premiÃ¨re graine';

  @override
  String get emptyStateClearAll => 'Tout effacer';

  @override
  String get cancel => 'Annuler';

  @override
  String get intentionTitle1 => 'Plantons une nouvelle intention !';

  @override
  String get intentionBody1 =>
      'Chaque forÃªt majestueuse commence par un seul petit choix. Dis-moi, qu\'est-ce que nous entretenons aujourd\'hui ?';

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
      'Tu n\'as pas Ã  planter toute la forÃªt d\'un coup â€” juste la prochaine bonne chose.';

  @override
  String get intentionTitle4 => 'Entretiens la prochaine petite Ã©tape.';

  @override
  String get intentionBody4 =>
      'Le toi du futur se construit Ã  partir des choix que tu fais dans les cinq prochaines minutes. Quel est un choix bienveillant ?';

  @override
  String get intentionTitle5 => 'Choisis ce que tu veux devenir.';

  @override
  String get intentionBody5 =>
      'Les tÃ¢ches sont des graines, les habitudes sont des pousses. Ensemble, elles forment une forÃªt dont tu es fier.';

  @override
  String get intentionTitle6 => 'Plante quelque chose Ã  retenir.';

  @override
  String get intentionBody6 =>
      'Pas chaque jour semblera immense. Une graine arrosÃ©e compte quand mÃªme. Nommons-en une.';

  @override
  String get intentionTitle7 => 'Rends aujourd\'hui un peu plus courageux.';

  @override
  String get intentionBody7 =>
      'Le courage se cumule. Choisis la graine que tu reportes â€” mÃªme la nommer la fait avancer.';

  @override
  String get intentionTitle8 => 'Entretiens le sol avant la graine.';

  @override
  String get intentionBody8 =>
      'Quel Ã©tat d\'esprit, quel outil ou quel petit rituel rendra cette tÃ¢che plus facile ? Ajoute-le aux notes.';

  @override
  String get shareCardSnapshot => 'Un instantanÃ© de ton sanctuaire';

  @override
  String get shareCardBody =>
      'La carte ci-dessus est exportÃ©e en PNG et envoyÃ©e Ã  ton menu de partage. Publie-la sur ton histoire, envoie-la Ã  un ami, ou imprime-la en sticker.';

  @override
  String get shareCardShareMyBloom => 'Partager ma floraison';

  @override
  String get shareCardCouldNotShare => 'Impossible de partager maintenant';

  @override
  String shareCardProgressText(String year) {
    return 'Mon progrÃ¨s Daily Stitch â€” $year sur Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Je viens de dÃ©bloquer la mÃ©daille Â« $title Â» sur Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Comment Ã§a marche';

  @override
  String get howItWorksBody =>
      'Daily Stitch t\'aide Ã  garder une petite chaÃ®ne de discipline incassable. C\'est tout.';

  @override
  String get howItWorksToday => 'L\'onglet Aujourd\'hui';

  @override
  String get howItWorksTodayBody =>
      'C\'est ta maison. Elle montre les 5 tÃ¢ches et les habitudes que tu as fixÃ©es pour aujourd\'hui. Finis-les avant minuit, la chaÃ®ne s\'Ã©tend.';

  @override
  String get howItWorksCap => 'La limite de 5 tÃ¢ches est LA fonctionnalitÃ©';

  @override
  String get howItWorksCapBody =>
      'On ne te laisse pas en ajouter un 6e. C\'est tout l\'intÃ©rÃªt. Les petites chaÃ®nes battent les longues. Appuie sur le Â« ? Â» sur l\'Ã©cran d\'accueil pour l\'explication complÃ¨te.';

  @override
  String get howItWorksHabits =>
      'Les habitudes sont quotidiennes, la chaÃ®ne est pour toujours';

  @override
  String get howItWorksHabitsBody =>
      'Les habitudes vivent pour toujours. Les tÃ¢ches sont uniques. Les deux alimentent la mÃªme sÃ©rie.';

  @override
  String get howItWorksLeftBehind => 'TÃ¢ches manquÃ©es â†’ Abandons';

  @override
  String get howItWorksLeftBehindBody =>
      'Ã€ minuit, les tÃ¢ches incomplÃ¨tes vont dans Abandons. RÃ©ajoute seulement celles qui comptent encore.';

  @override
  String get howItWorksProgress => 'L\'onglet ProgrÃ¨s';

  @override
  String get howItWorksProgressBody =>
      'SÃ©rie, calendrier, mÃ©dailles, historique â€” tout sur ta progression. Rien d\'urgent ne vit ici.';

  @override
  String get howItWorksYou => 'L\'onglet Vous';

  @override
  String get howItWorksYouBody =>
      'Ton compte, les paramÃ¨tres, la dÃ©connexion. C\'est tout.';

  @override
  String get howItWorksRule =>
      'La rÃ¨gle : 5 petites choses, chaque jour, sans excuse.';

  @override
  String get commonRetry => 'RÃ©essayer';

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
  String get commonViewFull => 'Voir les notes complÃ¨tes';

  @override
  String get commonEdit => 'Modifier';

  @override
  String get commonDelete => 'Supprimer';

  @override
  String get commonDone => 'TerminÃ©';

  @override
  String get commonError => 'Quelque chose s\'est mal passÃ©';

  @override
  String get commonPageNotFound => 'Page non trouvÃ©e';

  @override
  String get commonHome => 'Accueil';

  @override
  String get commonUnknownError => 'Erreur de routage inconnue';

  @override
  String get commonSettingsTooltip => 'ParamÃ¨tres';

  @override
  String get commonHowThisWorks => 'Comment Ã§a marche';

  @override
  String get myDayReminderSet => 'Rappel dÃ©fini';

  @override
  String get myDayPreparationNotes => 'NOTES DE PRÃ‰PARATION';

  @override
  String get onboardingSkip => 'PASSER';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingEnterSanctuary => 'Entrer dans le Sanctuaire';

  @override
  String get onboardingIntroduction => 'INTRODUCTION';

  @override
  String get onboardingGrowYourForest => 'FAIS POUSSER TA FORÃŠT';

  @override
  String get onboardingPage1Title => 'Vois ton Gardien.';

  @override
  String get onboardingPage1Body =>
      'Bienvenue dans ton Sanctuaire Personnel. Ici, ta croissance se reflÃ¨te dans la vie de ta forÃªt.';

  @override
  String get onboardingPage2Title => 'Plante des graines. Regarde-les pousser.';

  @override
  String get onboardingPage2Body =>
      'Chaque tÃ¢che est une petite graine. Chaque habitude est une pousse que tu entretiens chaque jour. Ensemble, elles forment une forÃªt de discipline.';

  @override
  String get onboardingPage3Title => 'Cinq tÃ¢ches. Une chaÃ®ne.';

  @override
  String get onboardingPage3Body =>
      'Tu ne peux planter que 5 graines par jour. Cette limite te force Ã  te concentrer sur ce qui compte vraiment â€” et Ã  protÃ©ger ta chaÃ®ne.';

  @override
  String get onboardingPage4Title => 'Entretiens tes pousses chaque jour.';

  @override
  String get onboardingPage4Body =>
      'Appuie sur les habitudes pour les faire pousser. Saute un jour et la chaÃ®ne ne s\'Ã©tend pas. Le Gardien grandit avec toi.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Plante ta premiÃ¨re graine.';

  @override
  String get authWelcomeBack => 'Bon retour, Gardien.';

  @override
  String get authFiveTasksDaily =>
      'Cinq tÃ¢ches. Habitudes quotidiennes. Pas d\'excuses.';

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
  String get authCreateAccount => 'CrÃ©er un compte';

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
      'Le mot de passe doit contenir au moins 8 caractÃ¨res';

  @override
  String get authAccountCreated =>
      'Compte crÃ©Ã©. Passe Ã  Connexion et utilise ton mot de passe.';

  @override
  String get authSomethingWentWrong =>
      'Quelque chose s\'est mal passÃ©. RÃ©essaie.';

  @override
  String get authCouldNotStartGoogle =>
      'Impossible de dÃ©marrer la connexion Google.';

  @override
  String get authMidnightReset =>
      'En te connectant, tu acceptes que ta journÃ©e se rÃ©initialise Ã  minuit.';

  @override
  String get authSetupRequired => 'Configuration requise';

  @override
  String get settingsPersonalSanctuary => 'SANCTUAIRE PERSONNEL';

  @override
  String get settingsHowThisWorks => 'Comment Ã§a marche';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Ce qu\'est l\'application, comment la limite et la sÃ©rie fonctionnent';

  @override
  String get settingsStreakProtection => 'Protection de sÃ©rie';

  @override
  String get settingsStreakProtectionAvailable => '1 gel disponible ce mois-ci';

  @override
  String get settingsStreakProtectionUsed => 'UtilisÃ© pour ce mois-ci';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'GÃ©rer l\'abonnement Pro';

  @override
  String get settingsProCancelPlay =>
      'Annule ou modifie le plan dans Google Play';

  @override
  String get settingsProUnlock =>
      'DÃ©bloque les 5 habitudes, l\'historique complet et plus';

  @override
  String get settingsTaskAlarms => 'Alarmes de tÃ¢ches et Dernier appel';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Rappel du soir et avertissement de minuit';

  @override
  String get settingsHomeScreenWidget => 'Widget de l\'Ã©cran d\'accueil';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Ajoute ta sÃ©rie Ã  l\'Ã©cran d\'accueil';

  @override
  String get settingsShareBloomTracker => 'Partager Daily Stitch';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Parle de la chaÃ®ne Ã  un ami';

  @override
  String get settingsHelpSupport => 'Aide et support';

  @override
  String get settingsHelpSupportSubtitle => 'FAQ ou signaler un problÃ¨me';

  @override
  String get settingsSignOutTile => 'DÃ©connexion';

  @override
  String get settingsAllFeaturesUnlocked =>
      'Toutes les fonctionnalitÃ©s dÃ©bloquÃ©es';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Version bÃªta â€” abonnements en pause pendant que nous testons tout.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Version 1.0.0';

  @override
  String get settingsHabitMaster => 'MaÃ®tre des habitudes';

  @override
  String settingsLevel(Object level) {
    return 'Niveau $level Â· MaÃ®tre des habitudes';
  }

  @override
  String get languagePickerTitle => 'Langue';

  @override
  String get youLast7Days => '7 derniers jours';

  @override
  String get youLast7DaysSubtitle => 'Historique jour par jour';

  @override
  String get youLeftBehindSubtitle =>
      'TÃ¢ches manquÃ©es en attente de rÃ©ajout';

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
    return 'Meilleure sÃ©rie $days j';
  }

  @override
  String get youPlantHabit => 'Plante une habitude pour dÃ©marrer une chaÃ®ne.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'DÃ©bloque le systÃ¨me complet de discipline.';

  @override
  String get youProFeatures =>
      '5 emplacements d\'habitude, historique complet, mÃ©dailles lÃ©gendaires, gels de sÃ©rie mensuels, cartes de partage hebdomadaires.';

  @override
  String get youSeePlans => 'Voir les plans';

  @override
  String youFromPrice(Object price) {
    return 'Ã  partir de $price/mois';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch Â· Habitudes et tÃ¢ches';

  @override
  String get progressMedals => 'MÃ©dailles';

  @override
  String get progressLast7Days => '7 derniers jours';

  @override
  String get progressSeeAll => 'Tout voir';

  @override
  String get progressSeeDayByDayActivity => 'Voir ton activitÃ© jour par jour';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done sur $total tÃ¢ches terminÃ©es Â· $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Pas encore de mÃ©dailles â€” termine une tÃ¢che ou entretiens une pousse pour commencer.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Voir toutes les mÃ©dailles Â· $earned sur $total obtenues';
  }

  @override
  String get progressGuardianInsight => 'Analyse du Gardien';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'PROCHAIN BADGE Â· $tier';
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
      'La plupart des rÃ©ponses se trouvent ci-dessous. Sinon, envoie-nous un message et nous rÃ©pondons gÃ©nÃ©ralement sous 2 Ã  3 jours.';

  @override
  String get helpSectionFAQ => 'QUESTIONS FRÃ‰QUENTES';

  @override
  String get helpSectionContact => 'TOUJOURS BLOQUÃ‰ ?';

  @override
  String get helpAddMessage => 'Ajoute d\'abord un court message.';

  @override
  String get helpOpening => 'Ouverture de ton application mailâ€¦';

  @override
  String get helpEmailUs => 'Envoie-nous un e-mail';

  @override
  String get helpOpeningAction => 'Ouvertureâ€¦';

  @override
  String get helpCopyEmail => 'Copier l\'e-mail du support';

  @override
  String get helpCopiedEmail => 'support@dailystitch.app copiÃ©';

  @override
  String get helpNoMailApp =>
      'Aucune application mail trouvÃ©e. Envoie-nous un e-mail Ã  support@dailystitch.app.';

  @override
  String get helpTopicLabel => 'Sujet';

  @override
  String get helpWhatHappened => 'Que s\'est-il passÃ© ?';

  @override
  String get helpHint => 'Une courte description aide beaucoupâ€¦';

  @override
  String get helpDisclaimer =>
      'Appuyer sur Â« Envoie-nous un e-mail Â» ouvre ton application mail avec un message prÃ©-rempli (aucune donnÃ©e ne quitte ton appareil tant que tu n\'envoies pas).';

  @override
  String get helpFaqQ1 => 'Qu\'est-ce que la limite de 5 tÃ¢ches ?';

  @override
  String get helpFaqA1 =>
      'Tu peux ajouter jusqu\'Ã  5 tÃ¢ches par jour local. La 6e est bloquÃ©e volontairement â€” la discipline bat la surcharge. La limite est la fonctionnalitÃ©, pas une contrainte.';

  @override
  String get helpFaqQ2 => 'Que se passe-t-il Ã  minuit ?';

  @override
  String get helpFaqA2 =>
      'Ã€ minuit, toute tÃ¢che encore marquÃ©e comme ouverte est estampillÃ©e Â« manquÃ©e Â» et passe dans Abandons. Les sÃ©ries d\'habitudes se rÃ©initialisent si l\'habitude n\'a pas Ã©tÃ© complÃ©tÃ©e la veille.';

  @override
  String get helpFaqQ3 => 'Qu\'est-ce qu\'Abandons ?';

  @override
  String get helpFaqA3 =>
      'Une liste douce et dismissible de tÃ¢ches que tu n\'as pas terminÃ©es. Ouvre-la, rÃ©ajoute seulement ce qui compte encore, et laisse le reste partir. Le niveau gratuit voit les 7 derniers jours ; Pro voit l\'historique complet.';

  @override
  String get helpFaqQ4 => 'Comment fonctionnent les sÃ©ries ?';

  @override
  String get helpFaqA4 =>
      'Un jour prolonge la chaÃ®ne quand tu avais au moins 1 tÃ¢che et 0 manquÃ©es. Les jours sans tÃ¢che ne prolongent ni ne cassent la chaÃ®ne. Un gel de sÃ©rie pardonne un jour manquÃ© par mois.';

  @override
  String get helpFaqQ5 => 'Qu\'est-ce que le gel de sÃ©rie ?';

  @override
  String get helpFaqA5 =>
      'Un Â« gel Â» par mois civil, Pro uniquement. Utilise-le un jour que tu as manquÃ© pour maintenir ta chaÃ®ne en vie. Le trouve dans l\'onglet ProgrÃ¨s.';

  @override
  String get helpFaqQ6 => 'OÃ¹ sont stockÃ©es mes donnÃ©es ?';

  @override
  String get helpFaqA6 =>
      'Toutes les donnÃ©es sont stockÃ©es dans notre backend cloud sÃ©curisÃ© sous le compte connectÃ©. Nous ne vendons ni ne partageons jamais les donnÃ©es. Voir la politique de confidentialitÃ© dans la boutique Play Store pour les dÃ©tails.';

  @override
  String get helpFaqQ7 => 'Comment supprimer mon compte ?';

  @override
  String get helpFaqA7 =>
      'Va dans ParamÃ¨tres â†’ Compte â†’ Supprimer le compte. Ceci supprime dÃ©finitivement ton profil, tes tÃ¢ches, tes habitudes et les donnÃ©es d\'abonnement. Les abonnements Play actifs doivent Ãªtre annulÃ©s sÃ©parÃ©ment dans Google Play.';

  @override
  String get helpTopicsGeneral => 'Question gÃ©nÃ©rale';

  @override
  String get helpTopicsBug => 'Rapport de bug';

  @override
  String get helpTopicsStreak => 'ProblÃ¨me de sÃ©rie / report';

  @override
  String get helpTopicsBilling => 'Facturation ou niveau Pro';

  @override
  String get helpTopicsAccount => 'Compte et donnÃ©es';

  @override
  String get helpTopicsFeature => 'Demande de fonctionnalitÃ©';

  @override
  String get helpAccountAnon => '(non connectÃ©)';

  @override
  String get splashTagline =>
      'Entretiens de petites graines. Fais pousser une forÃªt.';

  @override
  String get priorityStandard => 'STANDARD';

  @override
  String get priorityVital => 'VITAL';

  @override
  String get prioritySpark => 'Ã‰TINCELLE';

  @override
  String get settingsDeleteAccount => 'Supprimer le compte';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Supprimer dÃ©finitivement tes donnÃ©es';

  @override
  String get settingsDeleteAccountConfirmTitle => 'Supprimer ton compte ?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Ceci supprime dÃ©finitivement ton profil, tes tÃ¢ches, tes habitudes et ta progression. Les abonnements actifs doivent Ãªtre annulÃ©s sÃ©parÃ©ment dans Google Play. Cette action est irrÃ©versible.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Supprimer dÃ©finitivement';

  @override
  String get settingsDeleteAccountSuccess => 'Ton compte a Ã©tÃ© supprimÃ©.';

  @override
  String get settingsDeleteAccountFailed =>
      'Impossible de supprimer le compte. RÃ©essaie ou envoie un e-mail Ã  support@dailystitch.app.';

  @override
  String get referralYouTitle => 'Invite des amis Â· gagne du Pro gratuit';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress sur $milestone amis ont rejoint';
  }

  @override
  String get referralYouShare => 'Partager l\'invitation';

  @override
  String get referralYouDetails => 'Voir les dÃ©tails';

  @override
  String get referralPaywallTitle => 'Mois Pro gratuit';

  @override
  String get referralPaywallBody =>
      'Invite 5 amis qui s\'inscrivent â†’ 1 mois de Pro gratuit';

  @override
  String get referralPaywallProBody =>
      'Continue Ã  inviter â€” empile les mois Pro gratuits';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'Impossible de charger ta progression. RÃ©essaie plus tard.';

  @override
  String get insightsMetricCurrentChain => 'CHAÃŽNE ACTUELLE';

  @override
  String get insightsMetricBestEver => 'MEILLEURE JAMAIS';

  @override
  String get insightsMetricTasksDone => 'TÃ‚CHES TERMINÃ‰ES';

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
  String get insightsShareMyWeekPro => 'Partager ma semaine Â· Pro';

  @override
  String get insightsShareReceiptText =>
      'Ma semaine sur Daily Stitch. Ne brise pas la chaÃ®ne.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Affichage des $days derniers jours';
  }

  @override
  String get insightsHistoryUpsell =>
      'DÃ©bloque ton historique complet avec Pro';

  @override
  String get referralScreenTitle => 'Inviter des amis';

  @override
  String get referralLaunchGift => 'Cadeau du mois de lancement';

  @override
  String get referralRewardTitle => 'Obtiens 1 mois de Pro gratuit';

  @override
  String get referralRewardBody =>
      'Partage ton code avec des amis. Quand 5 personnes s\'inscrivent avec, tu dÃ©bloques Daily Stitch Pro pendant un mois complet.';

  @override
  String get referralYourCode => 'Ton code de parrainage';

  @override
  String get referralCopyCodeTooltip => 'Copier le code';

  @override
  String get referralCodeCopied => 'Code de parrainage copiÃ©';

  @override
  String get referralShareWithFriends => 'Partager avec des amis';

  @override
  String get referralFooterHint =>
      'Les amis entrent ton code lorsqu\'ils crÃ©ent un compte. Chaque ami compte une seule fois pour ta rÃ©compense.';

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
    return 'Tu as gagnÃ© $count mois gratuit de Pro.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'Tu as gagnÃ© $count mois gratuits de Pro.';
  }

  @override
  String get referralRewardUnlocked =>
      'RÃ©compense dÃ©bloquÃ©e â€” profite de ton mois gratuit de Pro !';

  @override
  String referralRemainingToUnlock(int remaining) {
    return 'Encore $remaining pour dÃ©bloquer ton mois gratuit';
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
    return '$detail\n\nAjoute API_BASE_URL et GOOGLE_CLIENT_ID (ou l\'ancien GOOGLE_CLIENT_ID) dans leanspace/.env, puis reconstruis :\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Par dÃ©faut du systÃ¨me';

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
  String get onboardingLanguageTitle => 'Choisis ta langue';

  @override
  String get onboardingLanguageBody =>
      'SÃ©lectionne la langue que tu souhaites utiliser dans Daily Stitch. Tu peux la changer Ã  tout moment dans les paramÃ¨tres.';

  @override
  String get onboardingLanguageContinue => 'Continuer';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Ami';

  @override
  String get settingsAppTheme => 'ThÃ¨me de l\'application';

  @override
  String get settingsAppThemeSubtitle =>
      'Choisis les couleurs de ton sanctuaire personnel';

  @override
  String get settingsInviteFriendsTitle => 'Inviter des amis Â· Pro gratuit';

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
  String get themeNameLavenderDream => 'RÃªve de Lavande';

  @override
  String get themeNameNordicFrost => 'Givre Nordique';

  @override
  String get themeNameCyberpunkNeon => 'NÃ©on Cyberpunk';

  @override
  String get reminderTitle => 'Rappels';

  @override
  String get reminderBody =>
      'Le Dernier appel te ping avant minuit si des tÃ¢ches sont encore ouvertes.';

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
  String get notificationChannelAlarms => 'Alarmes de tÃ¢ches Daily Stitch';

  @override
  String get notificationChannelAlarmsDesc =>
      'Alarmes fortes pour les rappels de tÃ¢ches';

  @override
  String get notificationTaskReminderTitle => 'Rappel de tÃ¢che';

  @override
  String get notificationFinalCallTitle => 'Dernier appel';

  @override
  String notificationFinalCallBody(int count) {
    return 'Tu as encore $count tÃ¢che(s) ouverte(s) aujourd\'hui.';
  }

  @override
  String get notificationEveningTitle => 'VÃ©rification du soir';

  @override
  String get notificationEveningBody =>
      'Comment ton jardin a-t-il poussÃ© aujourd\'hui ?';

  @override
  String get widgetSetupTitle => 'Ajouter le widget de chaÃ®ne';

  @override
  String get widgetSetupBody =>
      'Garde ta sÃ©rie sur ton Ã©cran d\'accueil â€” pas besoin d\'ouvrir l\'application.';

  @override
  String get widgetSetupAdd => 'Ajouter Ã  l\'Ã©cran d\'accueil';

  @override
  String get widgetSetupStep1 => 'Appuie longuement sur ton Ã©cran d\'accueil';

  @override
  String get widgetSetupStep2 => 'Appuie sur Widgets';

  @override
  String get widgetSetupStep3 => 'Trouve Daily Stitch et glisse-le';

  @override
  String get widgetSetupPinSuccess =>
      'VÃ©rifie ton Ã©cran d\'accueil pour placer le widget.';

  @override
  String get widgetSetupPinFallback =>
      'Ton lanceur ne supporte peut-Ãªtre pas l\'ajout en un appui. Utilise les Ã©tapes manuelles ci-dessous.';

  @override
  String get paywallWelcomePro => 'Bienvenue dans Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'Ã‰CONOMISE ~16%';

  @override
  String get paywallTermsTitle => 'Conditions d\'abonnement';

  @override
  String get paywallTermsBody =>
      'La facturation est gÃ©rÃ©e par Google Play. Les abonnements se renouvellent automatiquement jusqu\'Ã  ce que tu annules dans Play Store \\u2192 Abonnements au moins 24 heures avant la fin de la pÃ©riode en cours. Tu peux gÃ©rer ou annuler ton abonnement Ã  tout moment depuis ton compte Google Play.\\n\\nDÃ©sinstaller l\'application n\'annule pas ton abonnement.\\n\\nLes prix affichÃ©s sont dans ta devise locale et peuvent varier selon la rÃ©gion. Des taxes peuvent s\'appliquer.';

  @override
  String get paywallPrivacyTitle => 'ConfidentialitÃ©';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch stocke tes tÃ¢ches, habitudes et donnÃ©es de sÃ©rie sur notre backend sÃ©curisÃ©, liÃ©es Ã  ton compte. Nous ne vendons jamais tes donnÃ©es.\\n\\nLes achats d\'abonnement sont traitÃ©s par Google Play. Nous recevons un jeton d\'achat vÃ©rifiÃ© de Google pour confirmer ton statut Pro. Nous ne voyons ni ne stockons tes dÃ©tails de paiement.\\n\\nTu peux demander l\'export complet de tes donnÃ©es ou la suppression de ton compte depuis ParamÃ¨tres \\u2192 Suppression de compte.';

  @override
  String get paywallCloseTooltip => 'Fermer';

  @override
  String get paywallFooterLinks =>
      'Restaurer Â· Conditions Â· ConfidentialitÃ©';

  @override
  String get manageProTitle => 'Abonnement Pro';

  @override
  String get manageProActive => 'Actif';

  @override
  String get manageProNotSubscribed => 'Non abonnÃ©';

  @override
  String get manageProFreeTier => 'Niveau gratuit';

  @override
  String manageProRenewsOn(String date) {
    return 'Renouvellement ou expiration le $date.';
  }

  @override
  String get manageProFreeBody =>
      'Tu utilises Daily Stitch Gratuit. Passe Ã  la version supÃ©rieure pour dÃ©bloquer le systÃ¨me complet.';

  @override
  String get manageProSectionManage => 'GÃ‰RER';

  @override
  String get manageProOpenPlay => 'Ouvrir les abonnements Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Annule, modifie le plan ou mets Ã  jour le moyen de paiement';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Retrouve ton abonnement existant (le cas Ã©chÃ©ant) ici';

  @override
  String get manageProShareApp => 'Partager Daily Stitch';

  @override
  String get manageProShareSubtitle => 'Parle de la chaÃ®ne Ã  un ami';

  @override
  String get manageProSectionHelp => 'BESOIN D\'AIDE ?';

  @override
  String get manageProHelpTitle => 'Aide et support';

  @override
  String get manageProHelpSubtitle =>
      'FAQ abonnement, contact, rapports de bugs';

  @override
  String manageProBillingFooter(String version) {
    return 'Facturation gÃ©rÃ©e par Google Play Â· $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Ouvre l\'application Google Play Store â†’ appuie sur ton profil â†’ Paiements et abonnements â†’ Abonnements.';

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
  String get addTaskPriority => 'PRIORITÃ‰';

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
  String get addTaskPlanting => 'Plantationâ€¦';

  @override
  String get addTaskNameIntentionError => 'Nomme ton intention';

  @override
  String get addTaskNameSproutError => 'Nomme ta pousse';

  @override
  String get addTaskNotesMigrationWarning =>
      'TÃ¢che sauvegardÃ©e. Les notes et la prioritÃ© nÃ©cessitent la derniÃ¨re migration du backend.';

  @override
  String get addTaskNoSproutSlots =>
      'Aucun emplacement de pousse disponible â€” entretiens-en un d\'abord.';

  @override
  String get addTaskSaveSproutError =>
      'Impossible de sauvegarder la pousse â€” rÃ©essaie.';

  @override
  String get addTaskElementWater => 'EAU';

  @override
  String get addTaskElementLight => 'LUMIÃˆRE';

  @override
  String get addTaskElementSoil => 'TERRE';

  @override
  String get addTaskElementBreeze => 'BRISE';

  @override
  String get addTaskCadenceLabel => 'CADENCE';

  @override
  String get addTaskPreparationNotes => 'NOTES DE PRÃ‰PARATION';

  @override
  String get addTaskTendingNotes => 'NOTES D\'ENTRETIEN';

  @override
  String get addTaskNotesHintTask =>
      'Des outils ou conseils pour cette tÃ¢che ?';

  @override
  String get addTaskNotesHintHabit =>
      'Ã€ quoi ressemble l\'entretien de cette pousse ?';

  @override
  String get addTaskChooseElement => 'CHOISIR L\'Ã‰LÃ‰MENT';

  @override
  String get addTaskElementsTooltip => 'Que signifient les Ã©lÃ©ments ?';

  @override
  String get addTaskTaskSeed => 'Graine de tÃ¢che';

  @override
  String get addTaskHabitSprout => 'Pousse d\'habitude';

  @override
  String get addTaskPickElement => 'Choisis le bon Ã©lÃ©ment';

  @override
  String get addTaskPickElementBody =>
      'Chaque Ã©lÃ©ment correspond Ã  un type d\'effort diffÃ©rent. Le Gardien grandit quand tu arroses le bon.';

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
  String get youPerkAllThemes => 'Tous les thÃ¨mes';

  @override
  String get youPerkStreakFreezes => '2 gels de sÃ©rie / mois';

  @override
  String get youPerkLegendaryMedals => 'MÃ©dailles lÃ©gendaires';

  @override
  String get subscriptionPurchaseFailed => 'Achat Ã©chouÃ©. RÃ©essaie.';

  @override
  String get subscriptionUnavailable =>
      'Les achats in-app ne sont pas disponibles sur cet appareil.';

  @override
  String get subscriptionLoadFailed =>
      'Impossible de charger les options d\'abonnement.';

  @override
  String get subscriptionVerifyFailed =>
      'Impossible de vÃ©rifier l\'achat. Essaie Restaurer l\'achat.';

  @override
  String get streakFreezeFailed => 'Impossible d\'utiliser le gel de sÃ©rie.';

  @override
  String get streakFreezeAlreadyUsed =>
      'Tu as dÃ©jÃ  utilisÃ© ton gel ce mois-ci.';

  @override
  String get streakFreezeNoMissed => 'Aucune tÃ¢che manquÃ©e ce jour Ã  geler.';

  @override
  String get streakFreezeNotPastDay => 'Tu ne peux geler qu\'un jour passÃ©.';

  @override
  String get myDayLoadError =>
      'Impossible de charger Ma journÃ©e. Tire pour rafraÃ®chir.';

  @override
  String get myDayCapReached => 'Tu as atteint la limite de 5 tÃ¢ches du jour.';

  @override
  String get myDayRemoveTaskError => 'Impossible de supprimer la tÃ¢che.';

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
  String get medalTierEpic => 'Ã‰pique';

  @override
  String get medalTierLegendary => 'LÃ©gendaire';

  @override
  String get medalCategoryTasks => 'TÃ¢ches';

  @override
  String get medalCategoryHabits => 'Habitudes';

  @override
  String get medalCategoryStreaks => 'SÃ©ries';

  @override
  String get medalCategoryMastery => 'MaÃ®trise';

  @override
  String get medalsShareTooltip => 'Partager les succÃ¨s';

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
  String get shareCardAppBarTitleMedal => 'Partager ta mÃ©daille';

  @override
  String shareCardDescMedal(Object title) {
    return 'Affiche ton nouveau badge $title';
  }

  @override
  String get shareCardBodyMedal =>
      'Partage la victoire avec ton entourage. La carte est exportÃ©e en PNG et prÃªte pour n\'importe quelle application sociale.';

  @override
  String get shareCardCtaPreparing => 'PrÃ©parationâ€¦';

  @override
  String get shareCardMilestone => 'NOUVEAU JALON DÃ‰BLOQUÃ‰';

  @override
  String get shareCardStatChain => 'jours de chaÃ®ne';

  @override
  String get shareCardStatSprouts => 'pousses';

  @override
  String get shareCardStatMedals => 'mÃ©dailles';

  @override
  String shareCardHeadlineStreak(int days) {
    return 'SÃ©rie de $days jours';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count mÃ©dailles obtenues';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Gardien de pousses';

  @override
  String get shareCardHeadlineFirstSeeds => 'PremiÃ¨res graines plantÃ©es';

  @override
  String get shareCardHeadlineGardenBegins => 'Un jardin commence';

  @override
  String get shareCardSubheadMonth =>
      'Tu as entretenu tes habitudes avec succÃ¨s pendant un mois complet.';

  @override
  String get shareCardSubheadWeek =>
      'Une semaine complÃ¨te de croissance â€” ta forÃªt s\'Ã©paissit.';

  @override
  String get shareCardSubheadProgress =>
      'Ton sanctuaire montre de vrais progrÃ¨s. Continue d\'entretenir.';

  @override
  String get shareCardSubheadSprouts =>
      'Tes premiÃ¨res pousses prennent racine. Arrose-les chaque jour.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Tes premiÃ¨res graines sont dans la terre. Regarde-les s\'ouvrir.';

  @override
  String get shareCardSubheadFallback =>
      'Toute forÃªt commence par un petit choix.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch â€” cinq petites graines par jour, une chaÃ®ne incassable. Plante les tiennes.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Essaie Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Je construis ma chaÃ®ne quotidienne sur Daily Stitch â€” rejoins-moi avec mon code de parrainage $code et nous grandissons ensemble.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Rejoins-moi sur Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Mon progrÃ¨s Daily Stitch â€” $year sur Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Je viens de dÃ©bloquer la mÃ©daille Â« $title Â» sur Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'TÃ¢ches terminÃ©es';

  @override
  String get insightsReceiptPerfectDays => 'Jours parfaits';

  @override
  String get insightsReceiptCompletion => 'ComplÃ©tion';

  @override
  String insightsReceiptDate(String date) {
    return 'Semaine du $date';
  }

  @override
  String get insightsReceiptFooter => 'Ne brise pas la chaÃ®ne.';

  @override
  String get elementLabelWater => 'Eau';

  @override
  String get elementLabelLight => 'LumiÃ¨re';

  @override
  String get elementLabelSoil => 'Terre';

  @override
  String get elementLabelBreeze => 'Brise';

  @override
  String get elementTaglineWater =>
      'Restaurer. Hydratation, repos, soins Ã©motionnels â€” tout ce qui remplit le puits.';

  @override
  String get elementTaglineLight =>
      'Ã‰veiller. LumiÃ¨re du matin, blocs de concentration, Ã©tude, mÃ©ditation â€” Ã©nergie et clartÃ©.';

  @override
  String get elementTaglineSoil =>
      'Ancrer. Lecture, journal, travail profond â€” racines lentes qui construisent une force Ã  long terme.';

  @override
  String get elementTaglineBreeze =>
      'Bouger. Marche, course, respiration â€” Ã©nergie lÃ©gÃ¨re et mobile qui dÃ©gage l\'esprit.';

  @override
  String get elementWhenWater => 'Quand tu te sens vidÃ© ou Ã©puisÃ©.';

  @override
  String get elementWhenLight =>
      'Quand tu as besoin d\'un dÃ©but clair Ã  ta journÃ©e.';

  @override
  String get elementWhenSoil =>
      'Quand le travail est lent mais en vaut la peine (Ã©tude, artisanat, soin).';

  @override
  String get elementWhenBreeze =>
      'Quand ton corps (ou ton esprit) a besoin de bouger et de respirer.';

  @override
  String get bloomTierMastery => 'MaÃ®trise';

  @override
  String get bloomTierStrong => 'Fort';

  @override
  String get bloomTierGrowing => 'En croissance';

  @override
  String get bloomTierSprouting => 'Germination';

  @override
  String get bloomTierLocked => 'VerrouillÃ©';

  @override
  String habitBloomSubtitle(int count, String element) {
    return 'SÃ©rie de $count jours Â· $element';
  }

  @override
  String get medal_id_first_spark => 'PremiÃ¨re Ã‰tincelle';

  @override
  String get medal_sub_first_spark => 'Tu as allumÃ© la mÃ¨che.';

  @override
  String get medal_desc_first_spark =>
      'Termine ta premiÃ¨re tÃ¢che. Toute chaÃ®ne commence ici.';

  @override
  String get medal_id_triple_seed => 'Triple Graine';

  @override
  String get medal_sub_triple_seed => 'Trois dans la terre.';

  @override
  String get medal_desc_triple_seed => 'Termine 3 tÃ¢ches au total.';

  @override
  String get medal_id_dozen_sower => 'Semeur de Douzaine';

  @override
  String get medal_sub_dozen_sower => 'Un champ de douze.';

  @override
  String get medal_desc_dozen_sower => 'Termine 12 tÃ¢ches au total.';

  @override
  String get medal_id_quarter_century => 'Quart de SiÃ¨cle';

  @override
  String get medal_sub_quarter_century => 'Une saison de oui.';

  @override
  String get medal_desc_quarter_century => 'Termine 25 tÃ¢ches au total.';

  @override
  String get medal_id_productivity_titan => 'Titan de ProductivitÃ©';

  @override
  String get medal_sub_productivity_titan => 'La constance se compose.';

  @override
  String get medal_desc_productivity_titan =>
      'Termine 50 tÃ¢ches â€” tu as crÃ©Ã© un vrai Ã©lan.';

  @override
  String get medal_id_century_planter => 'Planteur du SiÃ¨cle';

  @override
  String get medal_sub_century_planter => 'Une forÃªt Ã  toi.';

  @override
  String get medal_desc_century_planter =>
      'Termine 100 tÃ¢ches. Tu es dans le top 5% des utilisateurs.';

  @override
  String get medal_id_clean_day => 'Jour Propre';

  @override
  String get medal_sub_clean_day => 'Pas une seule mauvaise herbe.';

  @override
  String get medal_desc_clean_day =>
      'Termine chaque tÃ¢che que tu plantes en un seul jour.';

  @override
  String get medal_id_triple_perfect => 'Triple Parfait';

  @override
  String get medal_sub_triple_perfect => 'Trois exÃ©cutions sans faille.';

  @override
  String get medal_desc_triple_perfect => 'Atteins 3 jours parfaits.';

  @override
  String get medal_id_perfect_week => 'Semaine Parfaite';

  @override
  String get medal_sub_perfect_week => 'Sept jours sans rupture.';

  @override
  String get medal_desc_perfect_week => '7 jours parfaits d\'affilÃ©e.';

  @override
  String get medal_id_two_week_chain => 'Force du Fortnight';

  @override
  String get medal_sub_two_week_chain => 'Deux semaines de feu.';

  @override
  String get medal_desc_two_week_chain => 'Maintiens une chaÃ®ne de 14 jours.';

  @override
  String get medal_id_iron_chain => 'ChaÃ®ne de Fer';

  @override
  String get medal_sub_iron_chain => '30 maillons forgÃ©s.';

  @override
  String get medal_desc_iron_chain =>
      'Une chaÃ®ne de 30 jours. La mÃ©daille la plus difficile.';

  @override
  String get medal_id_quarterly_chain => 'ChaÃ®ne Trimestrielle';

  @override
  String get medal_sub_quarterly_chain => 'Une saison, sans rupture.';

  @override
  String get medal_desc_quarterly_chain =>
      'Une chaÃ®ne de 90 jours. Statut lÃ©gendaire.';

  @override
  String get medal_id_vital_priority => 'Ã‰tincelle Vitale';

  @override
  String get medal_sub_vital_priority => 'Tu as choisi les difficiles.';

  @override
  String get medal_desc_vital_priority =>
      'Termine 5 tÃ¢ches marquÃ©es PrioritÃ© Vitale.';

  @override
  String get medal_id_spark_priority => 'Dompteur d\'Ã‰tincelles';

  @override
  String get medal_sub_spark_priority =>
      'Les victoires rapides s\'additionnent.';

  @override
  String get medal_desc_spark_priority =>
      'Termine 5 tÃ¢ches marquÃ©es PrioritÃ© Ã‰tincelle.';

  @override
  String get medal_id_note_taker => 'Preneur de Notes';

  @override
  String get medal_sub_note_taker =>
      'Des plans sur papier battent des plans en tÃªte.';

  @override
  String get medal_desc_note_taker =>
      'Ajoute des notes de prÃ©paration Ã  5 tÃ¢ches diffÃ©rentes.';

  @override
  String get medal_id_left_behind_rescuer => 'Sauveur des AbandonnÃ©s';

  @override
  String get medal_sub_left_behind_rescuer => 'Aucune tÃ¢che abandonnÃ©e.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'RÃ©ajoute 3 tÃ¢ches manquÃ©es le lendemain.';

  @override
  String get medal_id_first_sprout => 'Premier Germe';

  @override
  String get medal_sub_first_sprout => 'Un nouveau rituel quotidien.';

  @override
  String get medal_desc_first_sprout => 'Plante ta premiÃ¨re habitude.';

  @override
  String get medal_id_trio_sprout => 'Trio Germe';

  @override
  String get medal_sub_trio_sprout => 'Un petit Ã©cosystÃ¨me.';

  @override
  String get medal_desc_trio_sprout => 'Plante 3 habitudes diffÃ©rentes.';

  @override
  String get medal_id_week_of_growth => 'Semaine de Croissance';

  @override
  String get medal_sub_week_of_growth => 'Les racines commencent Ã  tenir.';

  @override
  String get medal_desc_week_of_growth =>
      'Entretiens une habitude chaque jour pendant 7 jours.';

  @override
  String get medal_id_fortnight_floret => 'Fleur du Fortnight';

  @override
  String get medal_sub_fortnight_floret => 'Une floraison complÃ¨te.';

  @override
  String get medal_desc_fortnight_floret =>
      'Une sÃ©rie d\'habitudes de 14 jours.';

  @override
  String get medal_id_rooted_master => 'MaÃ®tre AncrÃ©';

  @override
  String get medal_sub_rooted_master => 'Racines profondes, force profonde.';

  @override
  String get medal_desc_rooted_master => 'Une sÃ©rie d\'habitudes de 30 jours.';

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
  String get medal_sub_garden_keeper => 'VariÃ©tÃ©, ensemble.';

  @override
  String get medal_desc_garden_keeper =>
      'Cultive 4 habitudes diffÃ©rentes en mÃªme temps.';

  @override
  String get medal_id_hydration_hero => 'HÃ©ros de l\'Hydratation';

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
  String get medal_id_devoted_keeper => 'Gardien DÃ©vouÃ©';

  @override
  String get medal_sub_devoted_keeper => 'Soixante jours, une pratique.';

  @override
  String get medal_desc_devoted_keeper =>
      'Entretiens une seule habitude pendant 60 jours consÃ©cutifs.';

  @override
  String get medal_id_tending_notes => 'Notes d\'Entretien';

  @override
  String get medal_sub_tending_notes => 'RÃ©flÃ©chis en chemin.';

  @override
  String get medal_desc_tending_notes =>
      'Ajoute des notes d\'entretien Ã  3 habitudes.';

  @override
  String get medalTierTaglineSprout => 'Plante la premiÃ¨re graine';

  @override
  String get medalTierTaglineCommon => 'Construire l\'habitude';

  @override
  String get medalTierTaglineRare => 'Montrer un vrai Ã©lan';

  @override
  String get medalTierTaglineEpic => 'Tu es une force de la nature';

  @override
  String get medalTierTaglineLegendary =>
      'Mythique, presque personne n\'arrive ici';

  @override
  String get guardianHeadlineNoTasks =>
      'Le sol d\'aujourd\'hui est frais.\nPlante ta premiÃ¨re graine\net regarde pousser.';

  @override
  String get guardianHeadlineAllDone =>
      'Chaque graine que tu as plantÃ©e\nest en fleur.\nRepose, Gardien â€” tu l\'as mÃ©ritÃ©.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count jours\nde croissance ininterrompue.\nTa forÃªt est pleine de vie.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Une semaine complÃ¨te en fleur,\nGardien.\nUn jour de plus parfait\nÃ©tend la chaÃ®ne.';

  @override
  String get guardianHeadlineStreak3 =>
      'Ta chaÃ®ne tient bon.\nEntretiens les graines\nqui attendent d\'ouvrir.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Tu gÃ¨res bien les tÃ¢ches.\nPlante un germe â€”\nles habitudes font pousser les forÃªts.';

  @override
  String get guardianHeadlineSomeDone =>
      'Certaines graines ont germÃ©,\nd\'autres non. C\'est OK.\nDemain est une autre plantation.';

  @override
  String get guardianHeadlineMorning =>
      'Bonjour, Gardien.\nLe jour est jeune\net le sol est prÃªt.';

  @override
  String get guardianHeadlineAfternoon =>
      'Bon aprÃ¨s-midi, Gardien.\nLa moitiÃ© de la lumiÃ¨re reste â€”\ncontinue d\'entretenir.';

  @override
  String get guardianHeadlineEvening =>
      'Bonsoir, Gardien.\nUn dernier tour\navant que le soleil ne se couche.';

  @override
  String get guardianHeadlineNight =>
      'Tu brÃ»les l\'huile de minuit ?\nMÃªme les Gardiens se reposent.\nPlante la graine de demain.';

  @override
  String get guardianBodyNoTasks =>
      'Ton sanctuaire est silencieux maintenant. Ajoute une intention et vois ce qui change au coucher du soleil.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count jours en cours. La chaÃ®ne n\'est pas de la chance â€” ce sont les petits choix qui s\'empilent. Continue Ã  empiler.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Une chaÃ®ne de $count jours est un vrai Ã©lan. Termine les graines ouvertes d\'aujourd\'hui avant de dire que tu as fini.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Tu as plantÃ© $count tÃ¢ches jusqu\'ici. Ajouter mÃªme un seul germe d\'habitude ferait croÃ®tre le travail jour aprÃ¨s jour.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Tu finis environ $pct% de ce que tu plantes. Moins de graines, plus affÃ»tÃ©es, tendent Ã  pousser plus haut que dix dispersÃ©es.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Ton sanctuaire est vivant. $tasks tÃ¢ches faites, $sprouts germes poussant â€” le travail se voit.';
  }

  @override
  String get guardianInsightWaitingTitle =>
      'En attente de ton premier mouvement';

  @override
  String get guardianInsightWaitingBody =>
      'Ajoute une tÃ¢che ou une habitude et je commencerai Ã  lire les patterns dans ton jardin. Plus tu plantes, plus j\'ai Ã  apprendre.';

  @override
  String get guardianInsightWaitingCta => 'Plante ta premiÃ¨re graine';

  @override
  String get guardianInsightChainSuperTitle =>
      'La chaÃ®ne est ton super-pouvoir';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Tu as maintenu une chaÃ®ne de $count jours. Les sÃ©ries battent la motivation Ã  chaque fois â€” garde-la chaude, mÃªme les jours lents.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Ajoute la graine de demain';

  @override
  String get guardianInsightChainColdTitle =>
      'La chaÃ®ne est froide â€” commence une nouvelle';

  @override
  String get guardianInsightChainColdBody =>
      'Tu as plantÃ© avant, ce qui signifie que tu peux replanter. Une petite tÃ¢che faite aujourd\'hui est une plus longue chaÃ®ne demain.';

  @override
  String get guardianInsightChainColdCta => 'Plante une graine';

  @override
  String get guardianInsightLessIsMoreTitle =>
      'Moins c\'est plus cette semaine';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Tu finis environ $pct% de ce que tu plantes. Essaie 3 intentions affÃ»tÃ©es au lieu de 5 vagues â€” la qualitÃ© se compose.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'AffÃ»te la journÃ©e';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Prochaine mÃ©daille : $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Tu en es Ã  $value sur $target $unit. Quelques jours de plus honnÃªtement et c\'est Ã  toi.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Voir la mÃ©daille';

  @override
  String get guardianInsightSteadyTitle => 'Tu es dans une saison stable';

  @override
  String get guardianInsightSteadyBody =>
      'Pas de mÃ©daille en vue â€” c\'est bien. Entretiens ce que tu as. La prochaine floraison est en chemin.';

  @override
  String get guardianInsightSteadyCta => 'Voir les progrÃ¨s';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 tÃ¢che dans ta chaÃ®ne. Minuit approche.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count tÃ¢ches dans ta chaÃ®ne. Minuit approche.';
  }

  @override
  String get notificationEveningBodyOne =>
      'Tu as encore 1 tÃ¢che ouverte aujourd\'hui.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Tu as encore $count tÃ¢ches ouvertes aujourd\'hui.';
  }

  @override
  String get notificationTickerTaskReminder => 'Rappel de tÃ¢che';

  @override
  String get notificationTickerTaskAlarm => 'Alarme de tÃ¢che';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count jours de sÃ©rie Â· $element';
  }
}
