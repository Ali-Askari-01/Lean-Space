// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

  @override
  String get tabToday => 'Heute';

  @override
  String get tabProgress => 'Fortschritt';

  @override
  String get tabYou => 'Du';

  @override
  String get navMyDay => 'Mein Tag';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get navHelp => 'Hilfe & Support';

  @override
  String get navHistory => 'Letzte 7 Tage';

  @override
  String get navLeftBehind => 'ZurÃ¼ckgelassen';

  @override
  String get navInsights => 'Dein Fortschritt';

  @override
  String get navMedals => 'Meine Medaillen';

  @override
  String get navManagePro => 'Pro-Abonnement verwalten';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Das MitternachtsÃ¶l brennen';

  @override
  String get greetingMorning => 'Guten Morgen, Sonne!';

  @override
  String get greetingAfternoon => 'Guten Tag, Freund';

  @override
  String get greetingEvening => 'Guten Abend, Champion';

  @override
  String get greetingNight => 'Ruhst du gut, HÃ¼ter?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Heute Â· $done von $total Aufgaben';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done von $total Gewohnheiten';
  }

  @override
  String get todayChainGrows => 'Die Kette wÃ¤chst, wÃ¤hrend du fertig wirst';

  @override
  String get todayChainComplete =>
      'KETTE KOMPLETT Â· MORGEN DEN GARTEN PFLEGEN';

  @override
  String get taskCapInfo => 'Warum eine Obergrenze von 5 Aufgaben?';

  @override
  String get taskCapDiscipline => 'DISZIPLIN-FIRST DURCH DESIGN';

  @override
  String get taskCapTitle =>
      'Wir begrenzen deinen Tag absichtlich auf 5 Aufgaben.';

  @override
  String get taskCapBody =>
      'Kleine Ketten schlagen lange. Es ist wahrscheinlicher, dass du 3 von 5 abschlieÃŸt und den Sieg spÃ¼rst, als 8 von 10 aufzugeben und den Verlust zu spÃ¼ren.';

  @override
  String get taskCapBulletDone => 'Erledigte Aufgaben zÃ¤hlen zu deiner Kette';

  @override
  String get taskCapBulletDoneBody =>
      'Ein Tag, an dem alle fÃ¼nf erledigt sind, verlÃ¤ngert deine Erfolgsserie um eins.';

  @override
  String get taskCapBulletMissed =>
      'Verpasste Aufgaben werden auf ZurÃ¼ckgelassen Ã¼bertragen';

  @override
  String get taskCapBulletMissedBody =>
      'Um Mitternacht tauchen in ZurÃ¼ckgelassen unerledigte Aufgaben auf.';

  @override
  String get taskCapBulletFreeze => 'Streak-Freeze verzeiht einen Fehlschlag';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro bietet dir 2 Streak-Freezes pro Monat â€” sie decken einen verpassten Tag ab.';

  @override
  String get tasksHeader => 'Aufgaben';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Aufgabensamen hinzufÃ¼gen';

  @override
  String get tasksCapReached =>
      '5/5 PlÃ¤tze belegt â€” schlieÃŸe einen ab, um einen neuen Samen zu sÃ¤en.';

  @override
  String get tasksEmptyCta =>
      'Pflanze deinen ersten Samen â€” worauf kommt es heute an?';

  @override
  String get habitsHeader => 'Gewohnheiten';

  @override
  String habitsGrowing(String count) {
    return '$count wÃ¤chst';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Beste $days T';
  }

  @override
  String get habitsPlantNew => 'Einen neuen Gewohnheitsspross pflanzen';

  @override
  String get habitsPlantFirst => 'Gewohnheit pflanzen';

  @override
  String get habitsLocked =>
      'Pro-Gewohnheitsplatz â€” freischalten, um mehr Sprossen zu pflanzen';

  @override
  String get habitsSlotsFull => 'Alle GewohnheitsplÃ¤tze sind derzeit belegt.';

  @override
  String habitsStreakDays(String days) {
    return '${days}T';
  }

  @override
  String get habitsCadence => 'TÃ„GLICH';

  @override
  String leftBehindBanner(String count) {
    return '$count verpasst â€” immer noch in ZurÃ¼ckgelassen';
  }

  @override
  String get leftBehindTap =>
      'Zum erneuten HinzufÃ¼gen antippen oder loslassen';

  @override
  String get leftBehindDismiss => 'Verwerfen';

  @override
  String get leftBehindTitle => 'ZurÃ¼ckgelassen';

  @override
  String get leftBehindEmpty => 'Nichts bleibt zurÃ¼ck';

  @override
  String get leftBehindEmptyBody =>
      'Keine verpassten Aufgaben. Jeder Samen wird gepflegt.';

  @override
  String get leftBehindClearAll => 'Alle lÃ¶schen';

  @override
  String get leftBehindClearAllConfirm =>
      'Alles lÃ¶schen, was zurÃ¼ckgeblieben ist?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Dadurch werden $count verpasste Aufgaben dauerhaft entfernt.';
  }

  @override
  String get leftBehindReAdd => 'Heute erneut hinzufÃ¼gen';

  @override
  String get leftBehindReAddButton => 'Erneut hinzufÃ¼gen';

  @override
  String get leftBehindAddedToToday => 'Heute hinzugefÃ¼gt';

  @override
  String get leftBehindLetGo => 'Loslassen';

  @override
  String get leftBehindHeader => 'ZURÃœCKGELASSEN';

  @override
  String get leftBehindMissedTasks => 'VERPASSTE AUFGABEN';

  @override
  String get leftBehindWaitingOne => '1 Aufgabe wartet auf dich.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count Aufgaben warten auf dich.';
  }

  @override
  String get leftBehindBody =>
      'FÃ¼ge eine Aufgabe erneut hinzu oder lass sie los.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" ist wieder da.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return '\"$task\" entfernt';
  }

  @override
  String get leftBehindClearedSnack => 'ZurÃ¼ckgebliebene gelÃ¶scht';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Gestern Â· $date';
  }

  @override
  String streakAtRisk(String count) {
    return 'FÃ¼r heute sind noch $count Aufgaben Ã¼brig';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Letzter Aufruf â€” $count Aufgabe(n) noch offen';
  }

  @override
  String get streakAtRiskBody =>
      'Mitternacht ist nah. Die Kette hÃ¤ngt von diesen ab.';

  @override
  String get streakAtRiskBodyLow =>
      'Du hast noch Zeit. Ein sauberer Tag verlÃ¤ngert deine ErfolgsstrÃ¤hne.';

  @override
  String get streakAtRiskFreeze =>
      'Gestern verpasst â€” einen Streak-Freeze verwenden?';

  @override
  String get streakFreezeUse => 'Freeze verwenden';

  @override
  String get streakFreezeUseForYesterday =>
      'Monatlichen Streak-Freeze fÃ¼r gestern verwenden';

  @override
  String get streakFreezeAppliedYesterday =>
      'Streak-Freeze fÃ¼r gestern angewendet.';

  @override
  String get chainBrokenTitle => 'Die Kette ist gerissen. Das ist okay.';

  @override
  String get chainBrokenBody =>
      'Jede lange Kette endet einmal. Was zÃ¤hlt, ist, was du heute pflanzt.';

  @override
  String get chainBrokenCta => 'Komm zurÃ¼ck zum heutigen Tag';

  @override
  String get chainBrokenPlantFirst => 'Pflanze den ersten Samen von heute';

  @override
  String get chainBrokenCheck => 'Schau zuerst bei ZurÃ¼ckgelassen vorbei.';

  @override
  String get chainBrokenBestChain => 'beste Kette';

  @override
  String get chainBrokenTasksDone => 'Aufgaben erledigt';

  @override
  String get chainBrokenSprouts => 'Sprossen';

  @override
  String get chainRecoveryFreshStart => 'Ein Neuanfang';

  @override
  String get medalsTitle => 'Meine Medaillen';

  @override
  String get medalsTrophyRoom => 'TrophÃ¤enraum';

  @override
  String get medalsAllMedals => 'Alle Medaillen';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned von $total verdienten Medaillen';
  }

  @override
  String get medalsTrophyEmpty =>
      'Dein erstes Abzeichen ist nur eine Aufgabe entfernt';

  @override
  String get medalsTrophyFirst =>
      'Du hast deine erste Medaille gewonnen â€” mach weiter';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned Medaillen in deinem TrophÃ¤enraum';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'Fortschritt fÃ¼r alle $total Medaillen';
  }

  @override
  String get medalsShareCta => 'Teilbare Karte erstellen';

  @override
  String get medalsEmptyTitle => 'Noch nichts in dieser Kategorie';

  @override
  String get medalsEmptyBody =>
      'Erledige eine Aufgabe oder pflege einen Spross, um deinen TrophÃ¤enraum zu erÃ¶ffnen.';

  @override
  String get medalSheetLocked => 'PRO-MEDAILLE';

  @override
  String medalSheetEarned(String tier) {
    return 'VERDIENT Â· $tier';
  }

  @override
  String get medalSheetUnlock => 'Mit Pro freischalten';

  @override
  String get medalSheetProgress => 'Fortschritt';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Noch $n weitere $unit zum Freischalten.';
  }

  @override
  String get medalSheetAlmost => 'Noch ein Schritt zum Entsperren.';

  @override
  String get medalCategory => 'Kategorie';

  @override
  String get medalShareOnSocials => 'In sozialen Netzwerken teilen';

  @override
  String get medalShareLater => 'Vielleicht spÃ¤ter';

  @override
  String get medalUnlocked => 'MEDAILLE FREIGESCHALTET';

  @override
  String get medalProgressTitle => 'Fortschritt';

  @override
  String get historyTitle => 'Letzte 7 Tage';

  @override
  String get historyFullTitle => 'VollstÃ¤ndiger Verlauf';

  @override
  String get historyLoadError => 'Der Verlauf konnte nicht geladen werden.';

  @override
  String get historyFullCalendar => 'VollstÃ¤ndiger Kalender';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% abgeschlossen';
  }

  @override
  String historyThisWeek(String days) {
    return 'LETZTE $days TAGE';
  }

  @override
  String get historyDayByDay => 'TAG FÃœR TAG';

  @override
  String get historyEmpty =>
      'Pflanze einige Samen, um zu sehen, wie sich deine Woche entfaltet.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Du hast $done von $total Aufgaben erledigt.';
  }

  @override
  String get historyUpsellTitle => 'VollstÃ¤ndigen Verlauf ansehen';

  @override
  String get historyUpsellBody => 'Pro schaltet 30 Tage Verlauf frei.';

  @override
  String get historyPerfect => 'PERFEKT';

  @override
  String get historyFrozen => 'GEFROREN';

  @override
  String get historyToday => 'Heute';

  @override
  String get historyEmptyDay => 'An diesem Tag wurden keine Samen gepflanzt';

  @override
  String historyLeftBehindCount(String count) {
    return '$count ist zurÃ¼ckgeblieben';
  }

  @override
  String get progressVitality => 'HEUTIGE VITALITÃ„T';

  @override
  String get progressVitalityEmpty =>
      'Pflanze einen Samen, um deinen Garten zu beginnen.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done von $total Samen, die heute gepflanzt wurden.';
  }

  @override
  String progressChainPill(String days) {
    return '${days}T Kette';
  }

  @override
  String get progressMetricCurrent => 'Aktuell';

  @override
  String get progressMetricBest => 'Beste';

  @override
  String get progressMetricDone => 'Fertig';

  @override
  String get progressMetricPerfect => 'Perfekt';

  @override
  String get progressMetricHabits => 'Gewohnheiten';

  @override
  String get progressHabitBlooms => 'GewohnheitsblÃ¼ten';

  @override
  String get progressHabitBloomsSub =>
      'Streak-Meilensteine fÃ¼r die Sprossen, die du tÃ¤glich gieÃŸt.';

  @override
  String get progressNextBadge => 'NÃ¤chste Marke';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned von $total';
  }

  @override
  String get progressPersonalActivity => 'PersÃ¶nliche AktivitÃ¤t';

  @override
  String progressBrowseMonth(String month) {
    return 'Durchsuche $month. Tippe auf Heute.';
  }

  @override
  String get progressJumpToToday => 'Heute';

  @override
  String get progressCalendarLegend => 'dunkler = mehr erledigt';

  @override
  String get progressCalendarBody =>
      'DunkelgrÃ¼n bedeutet einen perfekten Tag.';

  @override
  String get paywallTitle => 'Halte die Kette ununterbrochen.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro bietet dir das vollstÃ¤ndige Disziplinsystem.';

  @override
  String get paywallFeatures =>
      'Alle 5 Gewohnheitsslots, nicht nur 3|Dein vollstÃ¤ndiger Verlauf|Medaillenset|Streak-Freeze|Share-Karten|Themen';

  @override
  String get paywallFeaturesBodies =>
      'Free gibt 3. Pro schaltet alle fÃ¼nf frei.|Durchsuche jeden Tag.|LegendÃ¤re Medaillen.|2 Freezes pro Monat.|Share-Karten.|Neue Themen.';

  @override
  String get paywallYearly => 'JÃ¤hrlich';

  @override
  String get paywallYearlyCaption => 'Bestes Preis-Leistungs-VerhÃ¤ltnis';

  @override
  String get paywallYearlyBadge => '35 % SPAREN';

  @override
  String get paywallMonthly => 'Monatlich';

  @override
  String get paywallMonthlyCaption =>
      'Monatliche Abrechnung Â· jederzeit kÃ¼ndbar';

  @override
  String paywallStartCta(String price) {
    return 'Pro starten Â· $price/Jahr';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Pro starten Â· $price/Monat';
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
  String get paywallRestore => 'Kauf wiederherstellen';

  @override
  String get paywallTerms => 'Bedingungen';

  @override
  String get paywallPrivacy => 'Datenschutz';

  @override
  String get paywallNoRestore =>
      'FÃ¼r dieses Konto wurde kein vorheriger Kauf gefunden.';

  @override
  String get paywallRestoreLater =>
      'Wir stellen deinen Kauf bei der nÃ¤chsten Synchronisierung wieder her.';

  @override
  String get paywallAlreadyPro =>
      'Du bist auf Pro. Vielen Dank fÃ¼r die UnterstÃ¼tzung.';

  @override
  String get paywallHabitSlotHead =>
      'Du hast alle deine freien GewohnheitsplÃ¤tze aufgebraucht.';

  @override
  String get paywallHistoryHead => 'Schau dir deinen gesamten Verlauf an.';

  @override
  String get paywallMedalHead =>
      'Die seltensten Medaillen sind nur fÃ¼r Profis erhÃ¤ltlich.';

  @override
  String get settingsYourActivity => 'DEINE AKTIVITÃ„T';

  @override
  String get settingsHelpInfo => 'HILFE & INFORMATIONEN';

  @override
  String get settingsAccount => 'KONTO';

  @override
  String get settingsNurturingTools => 'PFLEGEWERKZEUGE';

  @override
  String get settingsReminders => 'ERINNERUNGEN';

  @override
  String get settingsWidgetSanctuary => 'WIDGET-HEILIGTUM';

  @override
  String get settingsEcosystemSupport => 'Ã–KOSYSTEM-UNTERSTÃœTZUNG';

  @override
  String get settingsHowItWorks => 'Wie es funktioniert';

  @override
  String get settingsSignOut => 'Abmelden';

  @override
  String get settingsSignOutConfirm => 'MÃ¶chtest du dich wirklich abmelden?';

  @override
  String get settingsProActive => 'Aktiv';

  @override
  String get settingsProFree => 'Kostenloses Kontingent';

  @override
  String get settingsLanguage => 'Sprache';

  @override
  String get settingsLanguageValue => 'Systemstandard';

  @override
  String get firstRunGreeting => '5 Aufgaben. Nicht mehr. Lass sie zÃ¤hlen.';

  @override
  String get firstRunBody =>
      'Pflanze deinen ersten Samen â€” was ist heute am wichtigsten?';

  @override
  String get firstRunCta => 'Pflanze deinen ersten Samen';

  @override
  String get emptyStateClearAll => 'Alles lÃ¶schen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get intentionTitle1 => 'Lasst uns eine neue Absicht pflanzen!';

  @override
  String get intentionBody1 =>
      'Jeder mÃ¤chtige Wald beginnt mit einer einzigen winzigen Entscheidung.';

  @override
  String get intentionTitle2 => 'Was werden wir heute anbauen?';

  @override
  String get intentionBody2 =>
      'Aus winzigen Samen werden bei sorgfÃ¤ltiger Pflege groÃŸe BÃ¤ume.';

  @override
  String get intentionTitle3 => 'Ein Samen. Ein Atemzug. Beginnen.';

  @override
  String get intentionBody3 =>
      'Du musst nicht den ganzen Wald auf einmal pflanzen.';

  @override
  String get intentionTitle4 => 'FÃ¶rdere den nÃ¤chsten kleinen Schritt.';

  @override
  String get intentionBody4 =>
      'Zukunft-Du basiert auf den Entscheidungen, die du in den nÃ¤chsten fÃ¼nf Minuten triffst.';

  @override
  String get intentionTitle5 => 'WÃ¤hle, was du werden mÃ¶chtest.';

  @override
  String get intentionBody5 => 'Aufgaben sind Samen, Gewohnheiten sind Keime.';

  @override
  String get intentionTitle6 =>
      'Pflanze etwas, an das du dich erinnern solltest.';

  @override
  String get intentionBody6 => 'Nicht jeder Tag wird sich riesig anfÃ¼hlen.';

  @override
  String get intentionTitle7 => 'Mache den heutigen Tag etwas mutiger.';

  @override
  String get intentionBody7 =>
      'Mutverbindungen. WÃ¤hle den Samen aus, den du aufgeschoben hast.';

  @override
  String get intentionTitle8 => 'Pflege den Boden vor der Aussaat.';

  @override
  String get intentionBody8 =>
      'Welche Denkweise wird diese Aufgabe erleichtern? FÃ¼ge es zu den Notizen hinzu.';

  @override
  String get shareCardSnapshot => 'Ein Schnappschuss deines Heiligtums';

  @override
  String get shareCardBody =>
      'Die obige Karte wird als PNG exportiert und an dein Freigabeblatt gesendet.';

  @override
  String get shareCardShareMyBloom => 'Teile meine BlÃ¼te';

  @override
  String get shareCardCouldNotShare => 'Konnte momentan nicht geteilt werden';

  @override
  String shareCardProgressText(String year) {
    return 'Mein Daily Stitch-Fortschritt â€” $year.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Ich habe gerade die Medaille \"$title\" freigeschaltet. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Wie das funktioniert';

  @override
  String get howItWorksBody =>
      'Daily Stitch hilft dir, eine kleine, ununterbrochene Disziplinkette aufrechtzuerhalten.';

  @override
  String get howItWorksToday => 'Der Heute-Tab';

  @override
  String get howItWorksTodayBody =>
      'Das ist dein Zuhause. Es zeigt die 5 Aufgaben und Gewohnheiten.';

  @override
  String get howItWorksCap => 'Die 5-Aufgaben-Obergrenze ist das Feature';

  @override
  String get howItWorksCapBody =>
      'Wir lassen nicht zu, dass du eine Sechste hinzufÃ¼gst. Das ist der springende Punkt.';

  @override
  String get howItWorksHabits =>
      'Gewohnheiten sind alltÃ¤glich, die Kette ist fÃ¼r immer';

  @override
  String get howItWorksHabitsBody =>
      'Gewohnheiten bleiben fÃ¼r immer bestehen. Aufgaben sind einmalig.';

  @override
  String get howItWorksLeftBehind => 'Verpasste Aufgaben â†’ ZurÃ¼ckgelassen';

  @override
  String get howItWorksLeftBehindBody =>
      'Um Mitternacht werden nicht erledigte Aufgaben nach ZurÃ¼ckgelassen verschoben.';

  @override
  String get howItWorksProgress => 'Der Fortschritt-Tab';

  @override
  String get howItWorksProgressBody =>
      'Streak, Kalender, Medaillen, Verlauf â€” alles darÃ¼ber, wie es dir geht.';

  @override
  String get howItWorksYou => 'Der Du-Tab';

  @override
  String get howItWorksYouBody =>
      'Dein Konto, Einstellungen, Abmelden. Das ist alles.';

  @override
  String get howItWorksRule =>
      'Die Regel: 5 kleine Dinge, jeden Tag, keine Ausreden.';

  @override
  String get commonRetry => 'Erneut versuchen';

  @override
  String get commonBack => 'ZurÃ¼ck';

  @override
  String get commonDismiss => 'Verwerfen';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonClose => 'SchlieÃŸen';

  @override
  String get commonSend => 'Senden';

  @override
  String get commonCopy => 'Kopieren';

  @override
  String get commonShowLess => 'Weniger anzeigen';

  @override
  String get commonViewFull => 'VollstÃ¤ndige Notizen anzeigen';

  @override
  String get commonEdit => 'Bearbeiten';

  @override
  String get commonDelete => 'LÃ¶schen';

  @override
  String get commonDone => 'Fertig';

  @override
  String get commonError => 'Etwas ist schiefgelaufen';

  @override
  String get commonPageNotFound => 'Seite nicht gefunden';

  @override
  String get commonHome => 'Startseite';

  @override
  String get commonUnknownError => 'Unbekannter Navigationsfehler';

  @override
  String get commonSettingsTooltip => 'Einstellungen';

  @override
  String get commonHowThisWorks => 'Wie das funktioniert';

  @override
  String get myDayReminderSet => 'Erinnerung gesetzt';

  @override
  String get myDayPreparationNotes => 'VORBEREITUNGSHINWEISE';

  @override
  String get onboardingSkip => 'ÃœBERSPRINGEN';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get onboardingEnterSanctuary => 'Heiligtum betreten';

  @override
  String get onboardingIntroduction => 'EINFÃœHRUNG';

  @override
  String get onboardingGrowYourForest => 'DEINEN WALD WACHSEN LASSEN';

  @override
  String get onboardingPage1Title => 'Lerne deinen HÃ¼ter kennen.';

  @override
  String get onboardingPage1Body =>
      'Willkommen in deinem persÃ¶nlichen Heiligtum. Hier spiegelt sich dein Wachstum im Leben deines Waldes wider.';

  @override
  String get onboardingPage2Title => 'SÃ¤e Samen. Schau, wie sie wachsen.';

  @override
  String get onboardingPage2Body =>
      'Jede Aufgabe ist ein winziger Samen. Jede Gewohnheit ist ein Spross, den du tÃ¤glich pflegst. Zusammen bilden sie einen Wald der Disziplin.';

  @override
  String get onboardingPage3Title => 'FÃ¼nf Aufgaben. Eine Kette.';

  @override
  String get onboardingPage3Body =>
      'Du kannst nur 5 Samen pro Tag sÃ¤en. Diese Obergrenze zwingt dich, dich auf das zu konzentrieren, was wirklich zÃ¤hlt â€” und deine Kette zu schÃ¼tzen.';

  @override
  String get onboardingPage4Title => 'Pflege deine Sprossen tÃ¤glich.';

  @override
  String get onboardingPage4Body =>
      'Tippe auf Gewohnheiten, um sie wachsen zu lassen. Ãœberspringe einen Tag und die Kette verlÃ¤ngert sich nicht. Der HÃ¼ter wÃ¤chst mit dir.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Pflanze deinen ersten Samen.';

  @override
  String get authWelcomeBack => 'Willkommen zurÃ¼ck, HÃ¼ter.';

  @override
  String get authFiveTasksDaily =>
      'FÃ¼nf Aufgaben. TÃ¤gliche Gewohnheiten. Keine Ausreden.';

  @override
  String get authSanctuaryWaiting => 'Dein Heiligtum wartet.';

  @override
  String get authSignIn => 'Anmelden';

  @override
  String get authSignUp => 'Registrieren';

  @override
  String get authEmail => 'E-MAIL';

  @override
  String get authPassword => 'PASSWORT';

  @override
  String get authEmailHint => 'deine@email.de';

  @override
  String get authCreateAccount => 'Konto erstellen';

  @override
  String get authSignInCta => 'Anmelden';

  @override
  String get authOrContinueWith => 'oder fortfahren mit';

  @override
  String get authContinueWithGoogle => 'Mit Google fortfahren';

  @override
  String get authEnterEmail => 'E-Mail-Adresse eingeben';

  @override
  String get authEnterValidEmail => 'GÃ¼ltige E-Mail-Adresse eingeben';

  @override
  String get authPasswordTooShort =>
      'Passwort muss mindestens 8 Zeichen lang sein';

  @override
  String get authAccountCreated =>
      'Konto erstellt. Wechsle zur Anmeldung und verwende dein Passwort.';

  @override
  String get authSomethingWentWrong =>
      'Etwas ist schiefgelaufen. Versuche es erneut.';

  @override
  String get authCouldNotStartGoogle =>
      'Google-Anmeldung konnte nicht gestartet werden.';

  @override
  String get authMidnightReset =>
      'Mit der Anmeldung akzeptierst du, dass dein Tag um Mitternacht zurÃ¼ckgesetzt wird.';

  @override
  String get authSetupRequired => 'Einrichtung erforderlich';

  @override
  String get settingsPersonalSanctuary => 'PERSÃ–NLICHES HEILIGTUM';

  @override
  String get settingsHowThisWorks => 'Wie es funktioniert';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Was die App ist, wie die Obergrenze und die Kette funktionieren';

  @override
  String get settingsStreakProtection => 'Kettenschutz';

  @override
  String get settingsStreakProtectionAvailable =>
      '1 Freeze diesen Monat verfÃ¼gbar';

  @override
  String get settingsStreakProtectionUsed => 'Diesen Monat verwendet';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Pro-Abonnement verwalten';

  @override
  String get settingsProCancelPlay =>
      'KÃ¼ndigen oder Plan Ã¤ndern in Google Play';

  @override
  String get settingsProUnlock =>
      'Alle 5 Gewohnheiten freischalten, vollstÃ¤ndiger Verlauf, mehr';

  @override
  String get settingsTaskAlarms => 'Aufgabenalarme & Letzter Aufruf';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Abendlicher AnstoÃŸ und Mitternachtswarnung';

  @override
  String get settingsHomeScreenWidget => 'Startbildschirm-Widget';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'FÃ¼ge deine Ketten-Serie zum Startbildschirm hinzu';

  @override
  String get settingsShareBloomTracker => 'Daily Stitch teilen';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'ErzÃ¤hle einem Freund von der Kette';

  @override
  String get settingsHelpSupport => 'Hilfe & Support';

  @override
  String get settingsHelpSupportSubtitle => 'FAQ oder Problem melden';

  @override
  String get settingsSignOutTile => 'Abmelden';

  @override
  String get settingsAllFeaturesUnlocked => 'Alle Funktionen freigeschaltet';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Beta-Version â€” Abonnements sind pausiert.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'Version $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Version 1.0.0';

  @override
  String get settingsHabitMaster => 'Gewohnheitsmeister';

  @override
  String settingsLevel(Object level) {
    return 'Level $level Â· Gewohnheitsmeister';
  }

  @override
  String get languagePickerTitle => 'Sprache';

  @override
  String get youLast7Days => 'Letzte 7 Tage';

  @override
  String get youLast7DaysSubtitle => 'Aufgabenverlauf Tag fÃ¼r Tag';

  @override
  String get youLeftBehindSubtitle =>
      'Verpasste Aufgaben warten auf erneutes HinzufÃ¼gen';

  @override
  String get youProTier => 'Pro-Stufe';

  @override
  String get youFreeTier => 'Kostenlose Stufe';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Kostenlos';

  @override
  String youLevelLabel(Object level) {
    return 'Level $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'Beste $days T';
  }

  @override
  String get youPlantHabit =>
      'Pflanze eine Gewohnheit, um eine Kette zu starten.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'Schalte das vollstÃ¤ndige Disziplinsystem frei.';

  @override
  String get youProFeatures =>
      '5 GewohnheitsplÃ¤tze, vollstÃ¤ndiger Verlauf, legendÃ¤re Medaillen.';

  @override
  String get youSeePlans => 'PlÃ¤ne ansehen';

  @override
  String youFromPrice(Object price) {
    return 'ab $price/Monat';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch Â· Habit & To-Do';

  @override
  String get progressMedals => 'Medaillen';

  @override
  String get progressLast7Days => 'Letzte 7 Tage';

  @override
  String get progressSeeAll => 'Alle ansehen';

  @override
  String get progressSeeDayByDayActivity => 'Siehe deine tÃ¤gliche AktivitÃ¤t';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done von $total Aufgaben erledigt Â· $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Noch keine Medaillen â€” erledige eine Aufgabe.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Alle Medaillen ansehen Â· $earned von $total verdient';
  }

  @override
  String get progressGuardianInsight => 'HÃ¼ter-Einblick';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'NÃ„CHSTES ABZEICHEN Â· $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return '$days-Tage-Ziel';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Hilfe & Support';

  @override
  String get helpBody => 'Die meisten Antworten findest du unten.';

  @override
  String get helpSectionFAQ => 'HÃ„UFIGE FRAGEN';

  @override
  String get helpSectionContact => 'NOCH OFFENE FRAGEN?';

  @override
  String get helpAddMessage => 'FÃ¼ge zuerst eine kurze Nachricht hinzu.';

  @override
  String get helpOpening => 'E-Mail-App wird geÃ¶ffnetâ€¦';

  @override
  String get helpEmailUs => 'E-Mail senden';

  @override
  String get helpOpeningAction => 'Wird geÃ¶ffnetâ€¦';

  @override
  String get helpCopyEmail => 'Support-E-Mail kopieren';

  @override
  String get helpCopiedEmail => 'support@dailystitch.app kopiert';

  @override
  String get helpNoMailApp =>
      'Keine E-Mail-App gefunden. Sende uns eine E-Mail an support@dailystitch.app.';

  @override
  String get helpTopicLabel => 'Thema';

  @override
  String get helpWhatHappened => 'Was ist passiert?';

  @override
  String get helpHint => 'Eine kurze Beschreibung hilft schon vielâ€¦';

  @override
  String get helpDisclaimer =>
      'Wenn du auf E-Mail senden tippst, wird deine E-Mail-App geÃ¶ffnet.';

  @override
  String get helpFaqQ1 => 'Was ist die 5-Aufgaben-Obergrenze?';

  @override
  String get helpFaqA1 =>
      'Du kannst pro lokalen Tag maximal 5 Aufgaben hinzufÃ¼gen.';

  @override
  String get helpFaqQ2 => 'Was passiert um Mitternacht?';

  @override
  String get helpFaqA2 =>
      'Zu deiner lokalen Mitternacht wird jede noch offene Aufgabe als verpasst markiert.';

  @override
  String get helpFaqQ3 => 'Was ist ZurÃ¼ckgelassen?';

  @override
  String get helpFaqA3 =>
      'Eine sanfte, ausblendbare Liste von Aufgaben, die du nicht fertiggestellt hast.';

  @override
  String get helpFaqQ4 => 'Wie funktionieren Ketten?';

  @override
  String get helpFaqA4 =>
      'Ein Tag verlÃ¤ngert die Kette, wenn du mindestens 1 Aufgabe hattest und 0 verpasst hast.';

  @override
  String get helpFaqQ5 => 'Was ist der Streak-Freeze?';

  @override
  String get helpFaqA5 => 'Ein Freeze pro Kalendermonat, nur fÃ¼r Pro.';

  @override
  String get helpFaqQ6 => 'Wo werden meine Daten gespeichert?';

  @override
  String get helpFaqA6 =>
      'Alle Daten werden in unserer sicheren Cloud-Infrastruktur unter dem angemeldeten Konto gespeichert.';

  @override
  String get helpFaqQ7 => 'Wie lÃ¶sche ich mein Konto?';

  @override
  String get helpFaqA7 => 'Gehe zu Einstellungen â†’ Konto â†’ Konto lÃ¶schen.';

  @override
  String get helpTopicsGeneral => 'Allgemeine Frage';

  @override
  String get helpTopicsBug => 'Fehlerbericht';

  @override
  String get helpTopicsStreak => 'Ketten-/Weiterleitungsproblem';

  @override
  String get helpTopicsBilling => 'Abrechnung oder Pro-Stufe';

  @override
  String get helpTopicsAccount => 'Konto & Daten';

  @override
  String get helpTopicsFeature => 'Funktionswunsch';

  @override
  String get helpAccountAnon => '(nicht angemeldet)';

  @override
  String get splashTagline =>
      'Kleine Samen pflegen. Einen Wald wachsen lassen.';

  @override
  String get priorityStandard => 'STANDARD';

  @override
  String get priorityVital => 'VITAL';

  @override
  String get prioritySpark => 'FUNKE';

  @override
  String get settingsDeleteAccount => 'Konto lÃ¶schen';

  @override
  String get settingsDeleteAccountSubtitle => 'Deine Daten dauerhaft entfernen';

  @override
  String get settingsDeleteAccountConfirmTitle => 'Konto lÃ¶schen?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Dadurch werden dein Profil, deine Aufgaben, Gewohnheiten und dein Fortschritt dauerhaft gelÃ¶scht.';

  @override
  String get settingsDeleteAccountConfirmButton => 'FÃ¼r immer lÃ¶schen';

  @override
  String get settingsDeleteAccountSuccess => 'Dein Konto wurde gelÃ¶scht.';

  @override
  String get settingsDeleteAccountFailed =>
      'Konto konnte nicht gelÃ¶scht werden. Versuche es erneut.';

  @override
  String get referralYouTitle => 'Freunde einladen Â· Gratis Pro verdienen';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress von $milestone Freunden sind beigetreten';
  }

  @override
  String get referralYouShare => 'Einladung teilen';

  @override
  String get referralYouDetails => 'Details anzeigen';

  @override
  String get referralPaywallTitle => 'Kostenloser Pro-Monat';

  @override
  String get referralPaywallBody =>
      'Lade 5 Freunde ein, die sich anmelden â†’ 1 Monat Pro kostenlos';

  @override
  String get referralPaywallProBody =>
      'Lade weiterhin ein â€” staple kostenlose Pro-Monate';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'Dein Fortschritt konnte nicht geladen werden.';

  @override
  String get insightsMetricCurrentChain => 'AKTUELLE KETTE';

  @override
  String get insightsMetricBestEver => 'DAS BESTE ALLER ZEITEN';

  @override
  String get insightsMetricTasksDone => 'AUFGABEN ERLEDIGT';

  @override
  String get insightsMetricPerfectDays => 'PERFEKTE TAGE';

  @override
  String get insightsMetricHabits => 'GEWOHNHEITEN';

  @override
  String get insightsDay => 'Tag';

  @override
  String get insightsDays => 'Tage';

  @override
  String get insightsSectionThisWeek => 'Diese Woche';

  @override
  String get insightsShareMyWeek => 'Woche teilen';

  @override
  String get insightsShareMyWeekPro => 'Woche teilen Â· Pro';

  @override
  String get insightsShareReceiptText =>
      'Meine Woche auf Daily Stitch. Breche die Kette nicht.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Zeigt die letzten $days Tage an';
  }

  @override
  String get insightsHistoryUpsell =>
      'Schalte deinen vollstÃ¤ndigen Verlauf mit Pro frei';

  @override
  String get referralScreenTitle => 'Freunde einladen';

  @override
  String get referralLaunchGift => 'Geschenk zum EinfÃ¼hrungsmonat';

  @override
  String get referralRewardTitle => 'Erhalte 1 Monat Pro kostenlos';

  @override
  String get referralRewardBody =>
      'Teile deinen Code mit Freunden. Wenn sich 5 Personen anmelden.';

  @override
  String get referralYourCode => 'Dein Empfehlungscode';

  @override
  String get referralCopyCodeTooltip => 'Code kopieren';

  @override
  String get referralCodeCopied => 'Empfehlungscode kopiert';

  @override
  String get referralShareWithFriends => 'Mit Freunden teilen';

  @override
  String get referralFooterHint =>
      'Freunde geben deinen Code ein, wenn sie ein Konto erstellen.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count Freund ist beigetreten';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count Freunde sind beigetreten';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'Du hast $count kostenlosen Pro-Monat verdient.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'Du hast $count kostenlose Pro-Monate verdient.';
  }

  @override
  String get referralRewardUnlocked => 'Belohnung freigeschaltet!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining mehr, um deinen kostenlosen Monat freizuschalten';
  }

  @override
  String youProMemberSince(String month) {
    return 'Bloom Pro-Mitglied seit $month';
  }

  @override
  String get youProPerksTitle => 'Deine Pro-Vorteile';

  @override
  String get manageProThankYou => 'Vielen Dank, dass du Bloom unterstÃ¼tzt';

  @override
  String get manageProReferralHint =>
      'Lade weitere Freunde ein, um dein Pro zu verlÃ¤ngern';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nFÃ¼ge API_BASE_URL und GOOGLE_CLIENT_ID zu leanspace/.env hinzu.';
  }

  @override
  String get languageSystemDefault => 'Systemstandard';

  @override
  String get languageNameEn => 'Englisch';

  @override
  String get languageNameUr => 'Ø§Ø±Ø¯Ùˆ (Urdu)';

  @override
  String get languageNameEs => 'Spanisch';

  @override
  String get languageNamePt => 'Portugiesisch';

  @override
  String get languageNameFr => 'FranzÃ¶sisch';

  @override
  String get languageNameDe => 'Deutsch';

  @override
  String get languageNameIt => 'Italienisch';

  @override
  String get languageNameAr => 'Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©';

  @override
  String get languageNameTr => 'TÃ¼rkÃ§e';

  @override
  String get languageNameId => 'Bahasa Indonesien';

  @override
  String get onboardingLanguageTitle => 'WÃ¤hle deine Sprache';

  @override
  String get onboardingLanguageBody =>
      'WÃ¤hle die Sprache aus, die du im gesamten Daily Stitch verwenden mÃ¶chtest.';

  @override
  String get onboardingLanguageContinue => 'Weiter';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Freund';

  @override
  String get settingsAppTheme => 'App-Theme';

  @override
  String get settingsAppThemeSubtitle =>
      'WÃ¤hle die Farben deines persÃ¶nlichen Heiligtums';

  @override
  String get settingsInviteFriendsTitle => 'Freunde einladen Â· Gratis Pro';

  @override
  String get settingsInviteFriendsSubtitle =>
      'Erhalte 1 Monat gratis, wenn 5 Freunde beitreten';

  @override
  String get themePickerTitle => 'PersÃ¶nliches Heiligtum';

  @override
  String get themePickerSubtitle =>
      'WÃ¤hle eine Farbpalette, die dir Frieden bringt.';

  @override
  String get themeNameClassicBloom => 'Klassische BlÃ¼te';

  @override
  String get themeNameSolarTerracotta => 'Solar-Terrakotta';

  @override
  String get themeNameMidnightOasis => 'Mitternachtsoase';

  @override
  String get themeNameLavenderDream => 'Lavendeltraum';

  @override
  String get themeNameNordicFrost => 'Nordischer Frost';

  @override
  String get themeNameCyberpunkNeon => 'Cyberpunk-Neon';

  @override
  String get reminderTitle => 'Erinnerungen';

  @override
  String get reminderBody =>
      'Letzter Aufruf benachrichtigt dich vor Mitternacht.';

  @override
  String get reminderFinalCall => 'Letzter Aufruf';

  @override
  String get reminderEveningNudge => 'Abendlicher AnstoÃŸ';

  @override
  String get reminderChangeTime => 'Zeit Ã¤ndern';

  @override
  String get reminderSave => 'Erinnerungen speichern';

  @override
  String get notificationChannelReminders => 'Daily Stitch-Erinnerungen';

  @override
  String get notificationChannelRemindersDesc =>
      'Abendlicher AnstoÃŸ- und Letzter-Aufruf-Erinnerungen';

  @override
  String get notificationChannelAlarms => 'Daily Stitch-Aufgabenalarme';

  @override
  String get notificationChannelAlarmsDesc =>
      'Lautstarke Alarme zur Aufgabenerinnerung';

  @override
  String get notificationTaskReminderTitle => 'Aufgabenerinnerung';

  @override
  String get notificationFinalCallTitle => 'Letzter Aufruf';

  @override
  String notificationFinalCallBody(int count) {
    return 'Du hast heute noch $count offene Aufgabe(n).';
  }

  @override
  String get notificationEveningTitle => 'Abendlicher Check-in';

  @override
  String get notificationEveningBody => 'Wie ist dein Garten heute gewachsen?';

  @override
  String get widgetSetupTitle => 'Ketten-Widget hinzufÃ¼gen';

  @override
  String get widgetSetupBody =>
      'Behalte deinen Streak auf deinem Startbildschirm.';

  @override
  String get widgetSetupAdd => 'Zum Startbildschirm hinzufÃ¼gen';

  @override
  String get widgetSetupStep1 => 'DrÃ¼cke lange auf deinen Startbildschirm';

  @override
  String get widgetSetupStep2 => 'Tippe auf Widgets';

  @override
  String get widgetSetupStep3 => 'Finde Daily Stitch und ziehe es hinein';

  @override
  String get widgetSetupPinSuccess =>
      'ÃœberprÃ¼fe deinen Startbildschirm, um das Widget zu platzieren.';

  @override
  String get widgetSetupPinFallback =>
      'Dein Launcher unterstÃ¼tzt mÃ¶glicherweise nicht das HinzufÃ¼gen mit einem Fingertipp.';

  @override
  String get paywallWelcomePro => 'Willkommen bei Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'SPARE ~16 %';

  @override
  String get paywallTermsTitle => 'Abonnementbedingungen';

  @override
  String get paywallTermsBody =>
      'Die Abrechnung erfolgt Ã¼ber Google Play. Abonnements verlÃ¤ngern sich automatisch.';

  @override
  String get paywallPrivacyTitle => 'PrivatsphÃ¤re';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch speichert deine Aufgaben und Streak-Daten in unserem sicheren Backend.';

  @override
  String get paywallCloseTooltip => 'SchlieÃŸen';

  @override
  String get paywallFooterLinks =>
      'Wiederherstellen Â· Bedingungen Â· Datenschutz';

  @override
  String get manageProTitle => 'Pro-Abonnement';

  @override
  String get manageProActive => 'Aktiv';

  @override
  String get manageProNotSubscribed => 'Nicht abonniert';

  @override
  String get manageProFreeTier => 'Kostenloses Kontingent';

  @override
  String manageProRenewsOn(String date) {
    return 'Wird am $date verlÃ¤ngert oder lÃ¤uft ab.';
  }

  @override
  String get manageProFreeBody =>
      'Du verwendest Daily Stitch Free. FÃ¼hre ein Upgrade durch.';

  @override
  String get manageProSectionManage => 'VERWALTEN';

  @override
  String get manageProOpenPlay => 'Google Play-Abonnements Ã¶ffnen';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'KÃ¼ndigen, Plan Ã¤ndern oder Zahlungsmethode aktualisieren';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Finde hier dein bestehendes Abonnement.';

  @override
  String get manageProShareApp => 'Daily Stitch teilen';

  @override
  String get manageProShareSubtitle => 'ErzÃ¤hle einem Freund von der Kette';

  @override
  String get manageProSectionHelp => 'BRAUCHST DU HILFE?';

  @override
  String get manageProHelpTitle => 'Hilfe und Support';

  @override
  String get manageProHelpSubtitle => 'Abonnement-FAQ, Kontakt, Fehlerberichte';

  @override
  String manageProBillingFooter(String version) {
    return 'Abrechnung erfolgt Ã¼ber Google Play Â· $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Ã–ffne die Google Play Store-App â†’ tippe auf dein Profil â†’ Zahlungen & Abonnements â†’ Abonnements.';

  @override
  String get addTaskGrowSomething => 'Etwas anbauen';

  @override
  String get addTaskPlantSprout => 'Einen Spross pflanzen';

  @override
  String get addTaskIntentionName => 'ABSICHTSNAME';

  @override
  String get addTaskSproutName => 'SPROSSENNAME';

  @override
  String get addTaskHintTask => 'z. B. MorgensonnengruÃŸ';

  @override
  String get addTaskHintHabit => 'z.B. Morgenyoga';

  @override
  String get addTaskWhen => 'WANN?';

  @override
  String get addTaskPriority => 'PRIORITÃ„T';

  @override
  String get addTaskNotes => 'HINWEISE';

  @override
  String get addTaskCadenceDaily => 'TÃ¤glich';

  @override
  String get addTaskCadenceWeekdays => 'Werktags';

  @override
  String get addTaskCadence3x => '3x/Woche';

  @override
  String get addTaskCadenceWeekly => 'WÃ¶chentlich';

  @override
  String get addTaskPlantIntention => 'Absicht pflanzen';

  @override
  String get addTaskPlantSproutCta => 'Spross pflanzen';

  @override
  String get addTaskPlanting => 'Wird gepflanztâ€¦';

  @override
  String get addTaskNameIntentionError => 'Benenne deine Absicht';

  @override
  String get addTaskNameSproutError => 'Benenne deinen Spross';

  @override
  String get addTaskNotesMigrationWarning =>
      'Aufgabe gespeichert. Notizen und PrioritÃ¤t erfordern die neueste Backend-Migration.';

  @override
  String get addTaskNoSproutSlots =>
      'Keine leeren SprossenplÃ¤tze â€” kÃ¼mmere dich zuerst um einen.';

  @override
  String get addTaskSaveSproutError =>
      'Spross konnte nicht gespeichert werden â€” versuche es erneut.';

  @override
  String get addTaskElementWater => 'WASSER';

  @override
  String get addTaskElementLight => 'LICHT';

  @override
  String get addTaskElementSoil => 'BODEN';

  @override
  String get addTaskElementBreeze => 'BRISE';

  @override
  String get addTaskCadenceLabel => 'KADENZ';

  @override
  String get addTaskPreparationNotes => 'VORBEREITUNGSHINWEISE';

  @override
  String get addTaskTendingNotes => 'PFLEGEHINWEISE';

  @override
  String get addTaskNotesHintTask =>
      'Gibt es Tools oder Tipps fÃ¼r diese Aufgabe?';

  @override
  String get addTaskNotesHintHabit =>
      'Wie sieht es aus, diesen Spross zu pflegen?';

  @override
  String get addTaskChooseElement => 'ELEMENT WÃ„HLEN';

  @override
  String get addTaskElementsTooltip => 'Was bedeuten die Elemente?';

  @override
  String get addTaskTaskSeed => 'Aufgabensamen';

  @override
  String get addTaskHabitSprout => 'Gewohnheits-Spross';

  @override
  String get addTaskPickElement => 'WÃ¤hle das richtige Element aus';

  @override
  String get addTaskPickElementBody =>
      'Jedes Element entspricht einer anderen Art von Anstrengung.';

  @override
  String get addTaskClearForm => 'Formular leeren';

  @override
  String get shareCouldNotShare => 'Konnte momentan nicht geteilt werden';

  @override
  String get authReferralCodeLabel => 'Empfehlungscode (optional)';

  @override
  String get authReferralCodeHint => 'Code eines Freundes';

  @override
  String get youPerkHabitSlots => '5 GewohnheitsplÃ¤tze';

  @override
  String get youPerkFullHistory => 'VollstÃ¤ndiger Verlauf';

  @override
  String get youPerkAllThemes => 'Alle Themen';

  @override
  String get youPerkStreakFreezes => '2 Streak-Freezes pro Monat';

  @override
  String get youPerkLegendaryMedals => 'LegendÃ¤re Medaillen';

  @override
  String get subscriptionPurchaseFailed =>
      'Der Kauf ist fehlgeschlagen. Versuche es erneut.';

  @override
  String get subscriptionUnavailable =>
      'In-App-KÃ¤ufe sind auf diesem GerÃ¤t nicht verfÃ¼gbar.';

  @override
  String get subscriptionLoadFailed =>
      'Abonnementoptionen konnten nicht geladen werden.';

  @override
  String get subscriptionVerifyFailed =>
      'Der Kauf konnte nicht bestÃ¤tigt werden.';

  @override
  String get streakFreezeFailed =>
      'Streak-Freeze konnte nicht verwendet werden.';

  @override
  String get streakFreezeAlreadyUsed =>
      'Du hast deinen Freeze diesen Monat bereits genutzt.';

  @override
  String get streakFreezeNoMissed =>
      'Keine verpassten Aufgaben an diesem Tag zum Einfrieren.';

  @override
  String get streakFreezeNotPastDay =>
      'Du kannst nur einen vergangenen Tag einfrieren.';

  @override
  String get myDayLoadError =>
      'Mein Tag konnte nicht geladen werden. Ziehe zum Aktualisieren.';

  @override
  String get myDayCapReached =>
      'Du hast die heutige Obergrenze von 5 Aufgaben erreicht.';

  @override
  String get myDayRemoveTaskError => 'Aufgabe konnte nicht entfernt werden.';

  @override
  String get shareCardTitle => 'Teile deine Woche';

  @override
  String get shareCardCta => 'Bild teilen';

  @override
  String get medalTierSprout => 'Spross';

  @override
  String get medalTierCommon => 'Gemeinsam';

  @override
  String get medalTierRare => 'Selten';

  @override
  String get medalTierEpic => 'Episch';

  @override
  String get medalTierLegendary => 'LegendÃ¤r';

  @override
  String get medalCategoryTasks => 'Aufgaben';

  @override
  String get medalCategoryHabits => 'Gewohnheiten';

  @override
  String get medalCategoryStreaks => 'Ketten';

  @override
  String get medalCategoryMastery => 'Meisterschaft';

  @override
  String get medalsShareTooltip => 'Erfolge teilen';

  @override
  String get medalsFilterAll => 'Alle';

  @override
  String get addHabitTitleNew => 'Neuen Spross pflanzen';

  @override
  String get addHabitTitleEdit => 'Deinen Spross pflegen';

  @override
  String get addHabitLabelSproutName => 'SPROSSENNAME';

  @override
  String get shareCardAppBarTitle => 'Share-Karte';

  @override
  String get shareCardAppBarTitleMedal => 'Teile deine Medaille';

  @override
  String shareCardDescMedal(Object title) {
    return 'Zeige dein neues $title-Abzeichen';
  }

  @override
  String get shareCardBodyMedal => 'Teile den Erfolg mit deinem Kreis.';

  @override
  String get shareCardCtaPreparing => 'Wird vorbereitetâ€¦';

  @override
  String get shareCardMilestone => 'NEUES ZIEL ERREICHT';

  @override
  String get shareCardStatChain => 'Tage-Kette';

  @override
  String get shareCardStatSprouts => 'Sprossen';

  @override
  String get shareCardStatMedals => 'Medaillen';

  @override
  String shareCardHeadlineStreak(int days) {
    return '$days-Tage-Kette';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Medaillen verdient';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Sprossen-HÃ¼ter';

  @override
  String get shareCardHeadlineFirstSeeds => 'Erste Samen gepflanzt';

  @override
  String get shareCardHeadlineGardenBegins => 'Ein Garten beginnt';

  @override
  String get shareCardSubheadMonth =>
      'Du hast deine Gewohnheiten erfolgreich einen ganzen Monat lang gepflegt.';

  @override
  String get shareCardSubheadWeek =>
      'Eine volle Woche Wachstum â€” dein Wald wird dichter.';

  @override
  String get shareCardSubheadProgress =>
      'Dein Heiligtum zeigt echten Fortschritt. Bleib dran.';

  @override
  String get shareCardSubheadSprouts =>
      'Deine ersten Sprossen schlagen Wurzeln. GieÃŸe sie tÃ¤glich.';

  @override
  String get shareCardSubheadFirstSeeds => 'Deine ersten Samen sind im Boden.';

  @override
  String get shareCardSubheadFallback =>
      'Jeder Wald beginnt mit einer einzigen winzigen Entscheidung.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch â€” fÃ¼nf kleine Samen am Tag, eine unzerbrechliche Kette.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Probiere Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Ich baue meine tÃ¤gliche Kette auf Daily Stitch auf â€” tritt mit meinem Empfehlungscode $code bei.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Tritt mir bei bei Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Mein Daily Stitch-Fortschritt â€” $year.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Ich habe gerade die Medaille \"$title\" freigeschaltet. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Aufgaben erledigt';

  @override
  String get insightsReceiptPerfectDays => 'Perfekte Tage';

  @override
  String get insightsReceiptCompletion => 'Abschlussquote';

  @override
  String insightsReceiptDate(String date) {
    return 'Woche vom $date';
  }

  @override
  String get insightsReceiptFooter => 'Breche die Kette nicht.';

  @override
  String get elementLabelWater => 'Wasser';

  @override
  String get elementLabelLight => 'Licht';

  @override
  String get elementLabelSoil => 'Boden';

  @override
  String get elementLabelBreeze => 'Brise';

  @override
  String get elementTaglineWater =>
      'Regeneration. Hydration, Ruhe, emotionale Pflege.';

  @override
  String get elementTaglineLight =>
      'Erwachen. Morgenlicht, FokusblÃ¶cke, Lernen, Meditation.';

  @override
  String get elementTaglineSoil => 'Verwurzeln. Lesen, Tagebuch, Tiefenarbeit.';

  @override
  String get elementTaglineBreeze =>
      'Bewegen. SpaziergÃ¤nge, Laufen, Atemarbeit.';

  @override
  String get elementWhenWater =>
      'Wenn du dich erschÃ¶pft oder ausgelaugt fÃ¼hlst.';

  @override
  String get elementWhenLight =>
      'Wenn du einen klaren Start in deinen Tag brauchst.';

  @override
  String get elementWhenSoil => 'Wenn die Arbeit langsam, aber lohnend ist.';

  @override
  String get elementWhenBreeze =>
      'Wenn dein KÃ¶rper (oder Geist) sich bewegen und atmen muss.';

  @override
  String get bloomTierMastery => 'Meisterschaft';

  @override
  String get bloomTierStrong => 'Stark';

  @override
  String get bloomTierGrowing => 'Wachsend';

  @override
  String get bloomTierSprouting => 'SprieÃŸend';

  @override
  String get bloomTierLocked => 'Gesperrt';

  @override
  String habitBloomSubtitle(int count, String element) {
    return '$count-Tage-Kette Â· $element';
  }

  @override
  String get medal_id_first_spark => 'Erster Funke';

  @override
  String get medal_sub_first_spark => 'Du hast das Feuer entzÃ¼ndet.';

  @override
  String get medal_desc_first_spark => 'Beende deine erste Aufgabe.';

  @override
  String get medal_id_triple_seed => 'Dreifacher Samen';

  @override
  String get medal_sub_triple_seed => 'Drei in den Boden.';

  @override
  String get medal_desc_triple_seed => 'Beende 3 Aufgaben insgesamt.';

  @override
  String get medal_id_dozen_sower => 'Dutzend-SÃ¤er';

  @override
  String get medal_sub_dozen_sower => 'Ein Feld von zwÃ¶lf.';

  @override
  String get medal_desc_dozen_sower => 'Beende 12 Aufgaben insgesamt.';

  @override
  String get medal_id_quarter_century => 'Vierteljahrhundert';

  @override
  String get medal_sub_quarter_century => 'Eine Saison des Ja-Sagens.';

  @override
  String get medal_desc_quarter_century => 'Beende 25 Aufgaben insgesamt.';

  @override
  String get medal_id_productivity_titan => 'ProduktivitÃ¤ts-Titan';

  @override
  String get medal_sub_productivity_titan => 'Konstanz setzt sich zusammen.';

  @override
  String get medal_desc_productivity_titan => 'Beende 50 Aufgaben.';

  @override
  String get medal_id_century_planter => 'Jahrhundert-Pflanzer';

  @override
  String get medal_sub_century_planter => 'Ein Wald ganz fÃ¼r dich.';

  @override
  String get medal_desc_century_planter => 'Beende 100 Aufgaben.';

  @override
  String get medal_id_clean_day => 'Sauberer Tag';

  @override
  String get medal_sub_clean_day => 'Kein einziges Unkraut.';

  @override
  String get medal_desc_clean_day =>
      'Beende jede Aufgabe, die du an einem Tag pflanzt.';

  @override
  String get medal_id_triple_perfect => 'Dreifach Perfekt';

  @override
  String get medal_sub_triple_perfect => 'Drei makellose DurchlÃ¤ufe.';

  @override
  String get medal_desc_triple_perfect => 'Erreiche 3 perfekte Tage.';

  @override
  String get medal_id_perfect_week => 'Perfekte Woche';

  @override
  String get medal_sub_perfect_week => 'Sieben Tage ohne Unterbrechung.';

  @override
  String get medal_desc_perfect_week => '7 perfekte Tage am StÃ¼ck.';

  @override
  String get medal_id_two_week_chain => 'Fortnight-Kraft';

  @override
  String get medal_sub_two_week_chain => 'Zwei Wochen im Feuer.';

  @override
  String get medal_desc_two_week_chain => 'Halte eine 14-Tage-Kette.';

  @override
  String get medal_id_iron_chain => 'Eiserne Kette';

  @override
  String get medal_sub_iron_chain => '30 Glieder geschmiedet.';

  @override
  String get medal_desc_iron_chain => 'Eine 30-Tage-Kette.';

  @override
  String get medal_id_quarterly_chain => 'VierteljÃ¤hrliche Kette';

  @override
  String get medal_sub_quarterly_chain => 'Eine Saison, ununterbrochen.';

  @override
  String get medal_desc_quarterly_chain => 'Eine 90-Tage-Kette.';

  @override
  String get medal_id_vital_priority => 'Vitaler Funke';

  @override
  String get medal_sub_vital_priority => 'Du hast die Schwierigen gewÃ¤hlt.';

  @override
  String get medal_desc_vital_priority =>
      'Beende 5 Aufgaben mit vitaler PrioritÃ¤t.';

  @override
  String get medal_id_spark_priority => 'FunkenbÃ¤ndiger';

  @override
  String get medal_sub_spark_priority => 'Schnelle Siege addieren sich.';

  @override
  String get medal_desc_spark_priority =>
      'Beende 5 Aufgaben mit Funken-PrioritÃ¤t.';

  @override
  String get medal_id_note_taker => 'Notiznehmer';

  @override
  String get medal_sub_note_taker =>
      'PlÃ¤ne auf Papier schlagen PlÃ¤ne im Kopf.';

  @override
  String get medal_desc_note_taker =>
      'FÃ¼ge Vorbereitungsnotizen zu 5 verschiedenen Aufgaben hinzu.';

  @override
  String get medal_id_left_behind_rescuer => 'ZurÃ¼ckgelassenen-Retter';

  @override
  String get medal_sub_left_behind_rescuer => 'Keine Aufgabe zurÃ¼ckgelassen.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'FÃ¼ge 3 verpasste Aufgaben am nÃ¤chsten Tag wieder hinzu.';

  @override
  String get medal_id_first_sprout => 'Erste Sprosse';

  @override
  String get medal_sub_first_sprout => 'Ein neues tÃ¤gliches Ritual.';

  @override
  String get medal_desc_first_sprout => 'Pflanze deine erste Gewohnheit.';

  @override
  String get medal_id_trio_sprout => 'Dreier-Sprosse';

  @override
  String get medal_sub_trio_sprout => 'Ein kleines Ã–kosystem.';

  @override
  String get medal_desc_trio_sprout => 'Pflanze 3 verschiedene Gewohnheiten.';

  @override
  String get medal_id_week_of_growth => 'Wachstumswoche';

  @override
  String get medal_sub_week_of_growth => 'Die Wurzeln beginnen zu halten.';

  @override
  String get medal_desc_week_of_growth =>
      'Pflege eine Gewohnheit jeden Tag fÃ¼r 7 Tage.';

  @override
  String get medal_id_fortnight_floret => 'Fortnight-BlÃ¼te';

  @override
  String get medal_sub_fortnight_floret => 'Eine volle BlÃ¼te.';

  @override
  String get medal_desc_fortnight_floret => 'Eine 14-Tage-Gewohnheitskette.';

  @override
  String get medal_id_rooted_master => 'Verwurzelter Meister';

  @override
  String get medal_sub_rooted_master => 'Tiefe Wurzeln, tiefe Kraft.';

  @override
  String get medal_desc_rooted_master => 'Eine 30-Tage-Gewohnheitskette.';

  @override
  String get medal_id_half_year_bloom => 'HalbjahresblÃ¼te';

  @override
  String get medal_sub_half_year_bloom => 'Der Garten ist jetzt dauerhaft.';

  @override
  String get medal_desc_half_year_bloom =>
      'Halte eine einzige Gewohnheit fÃ¼r 180 Tage.';

  @override
  String get medal_id_garden_keeper => 'GartenhÃ¼ter';

  @override
  String get medal_sub_garden_keeper => 'Vielfalt, gemeinsam.';

  @override
  String get medal_desc_garden_keeper =>
      'Pflege 4 verschiedene Gewohnheiten gleichzeitig.';

  @override
  String get medal_id_hydration_hero => 'Hydrationsheld';

  @override
  String get medal_sub_hydration_hero => 'Du fÃ¼llst den Brunnen auf.';

  @override
  String get medal_desc_hydration_hero => 'Pflanze eine Hydrations-Gewohnheit.';

  @override
  String get medal_id_mindful_mover => 'Bewusster Beweger';

  @override
  String get medal_sub_mindful_mover => 'Der KÃ¶rper erinnert sich.';

  @override
  String get medal_desc_mindful_mover => 'Pflanze eine Bewegungsgewohnheit.';

  @override
  String get medal_id_devoted_keeper => 'Hingebungsvoller HÃ¼ter';

  @override
  String get medal_sub_devoted_keeper => 'Sechzig Tage, eine Praxis.';

  @override
  String get medal_desc_devoted_keeper =>
      'Pflege eine einzige Gewohnheit fÃ¼r 60 Tage am StÃ¼ck.';

  @override
  String get medal_id_tending_notes => 'Pflegenotizen';

  @override
  String get medal_sub_tending_notes => 'Reflektiere unterwegs.';

  @override
  String get medal_desc_tending_notes =>
      'FÃ¼ge Pflegehinweise zu 3 Gewohnheiten hinzu.';

  @override
  String get medalTierTaglineSprout => 'Pflanze den ersten Samen';

  @override
  String get medalTierTaglineCommon => 'Die Gewohnheit aufbauen';

  @override
  String get medalTierTaglineRare => 'Echten Schwung zeigen';

  @override
  String get medalTierTaglineEpic => 'Du bist eine Naturgewalt';

  @override
  String get medalTierTaglineLegendary =>
      'Mythisch, fast niemand kommt hierher';

  @override
  String get guardianHeadlineNoTasks =>
      'Der Boden von heute ist frisch. Pflanze deinen ersten Samen.';

  @override
  String get guardianHeadlineAllDone =>
      'Jeder Samen, den du gepflanzt hast, ist in BlÃ¼te. Ruh dich aus, HÃ¼ter.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count Tage ununterbrochenen Wachstums.';
  }

  @override
  String get guardianHeadlineStreak7 => 'Eine volle Woche in BlÃ¼te, HÃ¼ter.';

  @override
  String get guardianHeadlineStreak3 => 'Deine Kette hÃ¤lt. Pflege die Samen.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Du machst die Aufgaben gut. Pflanze eine Sprosse.';

  @override
  String get guardianHeadlineSomeDone =>
      'Einige Samen sind aufgegangen, andere nicht. Das ist okay.';

  @override
  String get guardianHeadlineMorning =>
      'Guten Morgen, HÃ¼ter. Der Tag ist jung und der Boden ist bereit.';

  @override
  String get guardianHeadlineAfternoon =>
      'Guten Tag, HÃ¼ter. Die HÃ¤lfte des Lichts bleibt.';

  @override
  String get guardianHeadlineEvening =>
      'Guten Abend, HÃ¼ter. Ein letzter Rundgang bevor die Sonne untergeht.';

  @override
  String get guardianHeadlineNight =>
      'MitternachtsÃ¶l brennen? Auch HÃ¼ter ruhen sich aus.';

  @override
  String get guardianBodyNoTasks =>
      'Dein Heiligtum ist jetzt ruhig. FÃ¼ge eine Absicht hinzu.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count Tage am Laufen. Stapel weiter.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Eine $count-Tage-Kette ist echter Schwung.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Du hast bisher $count Aufgaben gepflanzt.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Du beendest etwa $pct% dessen, was du pflanzt.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Dein Heiligtum lebt. $tasks Aufgaben erledigt, $sprouts Sprossen wachsen.';
  }

  @override
  String get guardianInsightWaitingTitle => 'Warte auf deinen ersten Zug';

  @override
  String get guardianInsightWaitingBody =>
      'FÃ¼ge eine Aufgabe oder Gewohnheit hinzu.';

  @override
  String get guardianInsightWaitingCta => 'Pflanze deinen ersten Samen';

  @override
  String get guardianInsightChainSuperTitle => 'Die Kette ist deine Superkraft';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Du hast eine $count-Tage-Kette gehalten.';
  }

  @override
  String get guardianInsightChainSuperCta => 'FÃ¼ge den Samen von morgen hinzu';

  @override
  String get guardianInsightChainColdTitle =>
      'Die Kette ist kalt â€” starte eine neue';

  @override
  String get guardianInsightChainColdBody =>
      'Du hast vorher gepflanzt, was bedeutet, dass du wieder pflanzen kannst.';

  @override
  String get guardianInsightChainColdCta => 'Pflanze einen Samen';

  @override
  String get guardianInsightLessIsMoreTitle => 'Weniger ist mehr diese Woche';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Du beendest etwa $pct% dessen, was du pflanzt.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'SchÃ¤rfe den Tag';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'NÃ¤chste Medaille: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Du bist bei $value von $target $unit.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Medaille anzeigen';

  @override
  String get guardianInsightSteadyTitle => 'Du bist in einer stabilen Saison';

  @override
  String get guardianInsightSteadyBody =>
      'Keine Medaille in Sicht â€” das ist okay.';

  @override
  String get guardianInsightSteadyCta => 'Fortschritt ansehen';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 Aufgabe in deiner Kette. Mitternacht naht.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count Aufgaben in deiner Kette. Mitternacht naht.';
  }

  @override
  String get notificationEveningBodyOne =>
      'Du hast noch 1 offene Aufgabe heute.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Du hast noch $count offene Aufgaben heute.';
  }

  @override
  String get notificationTickerTaskReminder => 'Aufgabenerinnerung';

  @override
  String get notificationTickerTaskAlarm => 'Aufgabenalarm';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count-Tage-Kette Â· $element';
  }
}
