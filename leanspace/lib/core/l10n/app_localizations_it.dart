// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

  @override
  String get tabToday => 'Oggi';

  @override
  String get tabProgress => 'Progressi';

  @override
  String get tabYou => 'Tu';

  @override
  String get navMyDay => 'La mia giornata';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get navHelp => 'Aiuto e Supporto';

  @override
  String get navHistory => 'Ultimi 7 giorni';

  @override
  String get navLeftBehind => 'In sospeso';

  @override
  String get navInsights => 'I tuoi progressi';

  @override
  String get navMedals => 'Le mie medaglie';

  @override
  String get navManagePro => 'Gestisci abbonamento Pro';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Bruci olio di mezzanotte';

  @override
  String get greetingMorning => 'Buongiorno, sole!';

  @override
  String get greetingAfternoon => 'Buon pomeriggio, amico';

  @override
  String get greetingEvening => 'Buonasera, campione';

  @override
  String get greetingNight => 'Stai riposando bene, guardiano?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Oggi · $done di $total attività';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done di $total abitudini';
  }

  @override
  String get todayChainGrows => 'LA CATENA CRESCONO MAN MANO CHE COMPLETI';

  @override
  String get todayChainComplete => 'CATENA COMPLETA · CURA IL GIARDINO DOMANI';

  @override
  String get taskCapInfo => 'Perché un limite di 5 attività?';

  @override
  String get taskCapDiscipline => 'DISCIPLINA PRIMA PER COSTRUZIONE';

  @override
  String get taskCapTitle =>
      'Limitiamo la tua giornata a 5 attività volutamente.';

  @override
  String get taskCapBody =>
      'Le catene brevi battono quelle lunghe. È più probabile che tu completi 3 di 5 e senta la vittoria, piuttosto che abbandonare 8 di 10 e sentire la sconfitta.';

  @override
  String get taskCapBulletDone =>
      'Le attività completate contano per la tua catena';

  @override
  String get taskCapBulletDoneBody =>
      'Un giorno in cui tutte e 5 sono completate estende la tua catena di uno.';

  @override
  String get taskCapBulletMissed =>
      'Le attività mancate finiscono in In sospeso';

  @override
  String get taskCapBulletMissedBody =>
      'A mezzanotte, le attività incomplete appaiono in In sospeso. Riaggiungi solo ciò che conta ancora.';

  @override
  String get taskCapBulletFreeze => 'Il congelamento perdona un mancamento';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro ti dà 2 congelamenti al mese — coprono un giorno mancato così la tua catena sopravvive.';

  @override
  String get tasksHeader => 'Attività';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Aggiungi un seme di attività';

  @override
  String get tasksCapReached =>
      '5/5 slot usati — completa uno per piantare un nuovo seme.';

  @override
  String get tasksEmptyCta => 'Pianta il tuo primo seme — cosa conta oggi?';

  @override
  String get habitsHeader => 'Abitudini';

  @override
  String habitsGrowing(String count) {
    return '$count in crescita';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Migliore $days g';
  }

  @override
  String get habitsPlantNew => 'Pianta un nuovo germoglio di abitudine';

  @override
  String get habitsPlantFirst => 'Pianta un\'abitudine';

  @override
  String get habitsLocked =>
      'Slot abitudine Pro — sblocca per piantare più germogli';

  @override
  String get habitsSlotsFull =>
      'Tutti gli slot abitudine sono attualmente pieni.';

  @override
  String habitsStreakDays(String days) {
    return '${days}g';
  }

  @override
  String get habitsCadence => 'OGNI GIORNO';

  @override
  String leftBehindBanner(String count) {
    return '$count mancate — ancora in In sospeso';
  }

  @override
  String get leftBehindTap => 'Tocca per riaggiungere o lasciar andare';

  @override
  String get leftBehindDismiss => 'Ignora';

  @override
  String get leftBehindTitle => 'In sospeso';

  @override
  String get leftBehindEmpty => 'Niente di lasciato indietro';

  @override
  String get leftBehindEmptyBody =>
      'Nessuna attività mancata. Ogni seme che pianti viene curato. Il giardino è pulito.';

  @override
  String get leftBehindClearAll => 'Cancella tutto';

  @override
  String get leftBehindClearAllConfirm => 'Cancella tutto In sospeso?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'Questo rimuoverà permanentemente $count attività mancate. Non puoi annullare.';
  }

  @override
  String get leftBehindReAdd => 'Ri-aggiungi oggi';

  @override
  String get leftBehindReAddButton => 'Ri-aggiungi';

  @override
  String get leftBehindAddedToToday => 'Aggiunto a oggi';

  @override
  String get leftBehindLetGo => 'Lascia andare';

  @override
  String get leftBehindHeader => 'IN SOSPESO';

  @override
  String get leftBehindMissedTasks => 'ATTIVITÀ MANCATE';

  @override
  String get leftBehindWaitingOne => '1 attività ti aspetta.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count attività ti aspettano.';
  }

  @override
  String get leftBehindBody =>
      'Riaggiungi un\'attività per riportarla a oggi, o lasciala andare. Riaggiungere mantiene viva la tua catena.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" è tornata nella tua giornata.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'Rimossa \"$task\"';
  }

  @override
  String get leftBehindClearedSnack => 'In sospeso cancellato';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Ieri · $date';
  }

  @override
  String streakAtRisk(String count) {
    return '$count attività rimaste per oggi';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Ultima chiamata — $count attività ancora aperte';
  }

  @override
  String get streakAtRiskBody =>
      'Mezzanotte è vicina. La catena dipende da queste.';

  @override
  String get streakAtRiskBodyLow =>
      'Hai ancora tempo. Un giorno pulito estende la tua catena.';

  @override
  String get streakAtRiskFreeze =>
      'Ieri mancato — usare un congelamento della catena?';

  @override
  String get streakFreezeUse => 'Usa congelamento';

  @override
  String get streakFreezeUseForYesterday =>
      'Usa il congelamento mensile della catena per ieri';

  @override
  String get streakFreezeAppliedYesterday =>
      'Congelamento della catena applicato per ieri.';

  @override
  String get chainBrokenTitle => 'La catena si è spezzata. Va bene.';

  @override
  String get chainBrokenBody =>
      'Ogni lunga catena finisce una volta. Ciò che conta è ciò che pianti oggi. Un giorno perfetto inizia il prossimo.';

  @override
  String get chainBrokenCta => 'Torna a oggi';

  @override
  String get chainBrokenPlantFirst => 'Pianta il primo seme di oggi';

  @override
  String get chainBrokenCheck => 'Controlla prima In sospeso';

  @override
  String get chainBrokenBestChain => 'miglior catena';

  @override
  String get chainBrokenTasksDone => 'attività completate';

  @override
  String get chainBrokenSprouts => 'germogli';

  @override
  String get chainRecoveryFreshStart => 'Un nuovo inizio';

  @override
  String get medalsTitle => 'Le mie medaglie';

  @override
  String get medalsTrophyRoom => 'Sala dei trofei';

  @override
  String get medalsAllMedals => 'Tutte le medaglie';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned di $total medaglie ottenute';
  }

  @override
  String get medalsTrophyEmpty =>
      'Il tuo primo badge è a un\'attività di distanza';

  @override
  String get medalsTrophyFirst =>
      'Hai ottenuto la tua prima medaglia — continua così';

  @override
  String medalsTrophyMany(String earned) {
    return '$earned medaglie nella tua sala trofei';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'Progresso verso tutte le $total medaglie';
  }

  @override
  String get medalsShareCta => 'Crea una card condivisibile';

  @override
  String get medalsEmptyTitle => 'Niente ancora in questa categoria';

  @override
  String get medalsEmptyBody =>
      'Completa un\'attività o cura un germoglio per iniziare la tua sala trofei.';

  @override
  String get medalSheetLocked => 'MEDAGLIA PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'OTTENUTA · $tier';
  }

  @override
  String get medalSheetUnlock => 'Sblocca con Pro';

  @override
  String get medalSheetProgress => 'Progresso';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Solo $n $unit in più per sbloccare.';
  }

  @override
  String get medalSheetAlmost => 'Un altro passo per sbloccare.';

  @override
  String get medalCategory => 'Categoria';

  @override
  String get medalShareOnSocials => 'Condividi sui social';

  @override
  String get medalShareLater => 'Più tardi';

  @override
  String get medalUnlocked => 'MEDAGLIA SBLOCCATA';

  @override
  String get medalProgressTitle => 'Progresso';

  @override
  String get historyTitle => 'Ultimi 7 giorni';

  @override
  String get historyFullTitle => 'Cronologia completa';

  @override
  String get historyLoadError => 'Impossibile caricare la cronologia.';

  @override
  String get historyFullCalendar => 'Calendario completo';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% completato';
  }

  @override
  String historyThisWeek(String days) {
    return 'ULTIMI $days GIORNI';
  }

  @override
  String get historyDayByDay => 'GIORNO PER GIORNO';

  @override
  String get historyEmpty =>
      'Pianta qualche seme per vedere la tua settimana svilupparsi.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Hai completato $done di $total attività. $perfect giorno/i perfetto/i.';
  }

  @override
  String get historyUpsellTitle => 'Vedi la tua cronologia completa';

  @override
  String get historyUpsellBody => 'Pro sblocca 30 giorni di cronologia.';

  @override
  String get historyPerfect => 'PERFETTO';

  @override
  String get historyFrozen => 'CONGELATO';

  @override
  String get historyToday => 'Oggi';

  @override
  String get historyEmptyDay => 'Nessun seme piantato in quel giorno';

  @override
  String historyLeftBehindCount(String count) {
    return '$count lasciate indietro';
  }

  @override
  String get progressVitality => 'VITALITÀ DI OGGI';

  @override
  String get progressVitalityEmpty =>
      'Pianta un seme per iniziare il tuo giardino.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done di $total semi piantati oggi.';
  }

  @override
  String progressChainPill(String days) {
    return '${days}g di catena';
  }

  @override
  String get progressMetricCurrent => 'Attuale';

  @override
  String get progressMetricBest => 'Migliore';

  @override
  String get progressMetricDone => 'Fatto';

  @override
  String get progressMetricPerfect => 'Perfetto';

  @override
  String get progressMetricHabits => 'Abitudini';

  @override
  String get progressHabitBlooms => 'Fioriture delle abitudini';

  @override
  String get progressHabitBloomsSub =>
      'Traguardi della catena per i germogli che bagni ogni giorno.';

  @override
  String get progressNextBadge => 'Prossimo badge';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned di $total';
  }

  @override
  String get progressPersonalActivity => 'Attività Personale';

  @override
  String progressBrowseMonth(String month) {
    return 'Stai sfogliando $month. Tocca \"Oggi\" per tornare alla tua attività attiva.';
  }

  @override
  String get progressJumpToToday => 'Oggi';

  @override
  String get progressCalendarLegend => 'più scuro = più completati';

  @override
  String get progressCalendarBody =>
      'Verde scuro significa un giorno perfetto. La tonalità sfuma quando salti.';

  @override
  String get paywallTitle => 'Mantieni la catena intatta.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro ti dà il sistema completo di disciplina.';

  @override
  String get paywallFeatures =>
      'Tutti e 5 gli slot abitudini, non solo 3|La tua cronologia completa, per sempre|L\'insieme completo di medaglie|Congelamento della catena ogni mese|Ricevuta settimanale + card condivisibili|Temi e altro';

  @override
  String get paywallFeaturesBodies =>
      'Free ti dà 3. Pro sblocca tutti e cinque così il tuo rituale quotidiano completo può vivere qui.|Sfoglia ogni giorno che hai completato — non solo gli ultimi 7. Guarda indietro di anni, non settimane.|Sblocca medaglie di livello Leggendario. I badge più rari sono per chi si impegna al massimo.|2 congelamenti della catena al mese così un singolo giorno difficile non finisce la tua catena.|Belle card condivisibili della tua settimana. Pubblica la tua catena, ispira qualcun altro a iniziare.|Sblocca nuovi colori di accento e temi quando li aggiungiamo. Aggiornamenti sempre gratuiti.';

  @override
  String get paywallYearly => 'Annuale';

  @override
  String get paywallYearlyCaption => 'Miglior valore · circa 2,50 USD/mese';

  @override
  String get paywallYearlyBadge => 'RISPARMIA 35%';

  @override
  String get paywallMonthly => 'Mensile';

  @override
  String get paywallMonthlyCaption => 'Addebito mensile · annulla quando vuoi';

  @override
  String paywallStartCta(String price) {
    return 'Inizia Pro · $price/anno';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Inizia Pro · $price/mese';
  }

  @override
  String get paywallRestore => 'Ripristina acquisto';

  @override
  String get paywallTerms => 'Termini';

  @override
  String get paywallPrivacy => 'Privacy';

  @override
  String get paywallNoRestore =>
      'Nessun acquisto precedente trovato per questo account.';

  @override
  String get paywallRestoreLater =>
      'Ripristineremo il tuo acquisto alla prossima sincronizzazione.';

  @override
  String get paywallAlreadyPro => 'Sei su Pro. Grazie per il sostegno.';

  @override
  String get paywallHabitSlotHead =>
      'Hai usato tutti gli slot abitudine gratuiti. Sblocca l\'insieme completo per piantare ogni rituale a cui tieni.';

  @override
  String get paywallHistoryHead =>
      'Vedi la tua cronologia completa — ogni giorno perfetto, ogni medaglia, ogni ritorno.';

  @override
  String get paywallMedalHead =>
      'Le medaglie più rare sono solo per Pro. Continua — sono più vicine di quanto pensi.';

  @override
  String get settingsYourActivity => 'LA TUA ATTIVITÀ';

  @override
  String get settingsHelpInfo => 'AIUTO E INFO';

  @override
  String get settingsAccount => 'ACCOUNT';

  @override
  String get settingsNurturingTools => 'STRUMENTI DI CURA';

  @override
  String get settingsReminders => 'PROMEMORIA';

  @override
  String get settingsWidgetSanctuary => 'WIDGET DEL SANTUARIO';

  @override
  String get settingsEcosystemSupport => 'SUPPORTO ALL\'ECOSISTEMA';

  @override
  String get settingsHowItWorks => 'Come funziona';

  @override
  String get settingsSignOut => 'Disconnetti';

  @override
  String get settingsSignOutConfirm => 'Sei sicuro di voler uscire?';

  @override
  String get settingsProActive => 'Attivo';

  @override
  String get settingsProFree => 'Piano gratuito';

  @override
  String get settingsLanguage => 'Lingua';

  @override
  String get settingsLanguageValue => 'Predefinito di sistema';

  @override
  String get firstRunGreeting => '5 attività. Non di più. Fanne contare.';

  @override
  String get firstRunBody =>
      'Pianta il tuo primo seme — cosa conta di più oggi?';

  @override
  String get firstRunCta => 'Pianta il tuo primo seme';

  @override
  String get emptyStateClearAll => 'Cancella tutto';

  @override
  String get cancel => 'Annulla';

  @override
  String get intentionTitle1 => 'Piantiamo una nuova intenzione!';

  @override
  String get intentionBody1 =>
      'Ogni potente foresta inizia con una singola piccola scelta. Dimmi cosa stiamo curando oggi?';

  @override
  String get intentionTitle2 => 'Cosa faremo crescere oggi?';

  @override
  String get intentionBody2 =>
      'Piccoli semi, curati con attenzione, diventano alberi alti. Scegli quello che conta di più adesso.';

  @override
  String get intentionTitle3 => 'Un seme. Un respiro. Inizia.';

  @override
  String get intentionBody3 =>
      'Non devi piantare tutta la foresta in una volta — solo la prossima cosa giusta.';

  @override
  String get intentionTitle4 => 'Cura il prossimo piccolo passo.';

  @override
  String get intentionBody4 =>
      'Il te del futuro è costruito dalle scelte che fai nei prossimi cinque minuti. Qual è una gentile?';

  @override
  String get intentionTitle5 => 'Scegli cosa vuoi diventare.';

  @override
  String get intentionBody5 =>
      'Le attività sono semi, le abitudini sono germogli. Insieme formano una foresta di cui andare fieri.';

  @override
  String get intentionTitle6 => 'Pianta qualcosa da ricordare.';

  @override
  String get intentionBody6 =>
      'Non ogni giorno sembrerà enorme. Un seme innaffiato conta comunque. Chiamiamone uno.';

  @override
  String get intentionTitle7 => 'Rendi oggi un po\' più coraggioso.';

  @override
  String get intentionBody7 =>
      'Il coraggio si accumula. Scegli il seme che stai rimandando — anche nominarlo lo fa avanzare.';

  @override
  String get intentionTitle8 => 'Cura il terreno prima del seme.';

  @override
  String get intentionBody8 =>
      'Quale mentalità, strumento o piccolo rituale renderà quest\'attività più facile? Aggiungilo alle note.';

  @override
  String get shareCardSnapshot => 'Un\'istantanea del tuo santuario';

  @override
  String get shareCardBody =>
      'La card sopra viene esportata come PNG e inviata alla tua scheda condivisione. Pubblicala sulla tua storia, mandala a un amico, o stampala come adesivo.';

  @override
  String get shareCardShareMyBloom => 'Condividi la mia fioritura';

  @override
  String get shareCardCouldNotShare => 'Impossibile condividere ora';

  @override
  String shareCardProgressText(String year) {
    return 'I miei progressi su Daily Stitch — $year su Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Ho appena sbloccato la medaglia \"$title\" su Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'Come funziona';

  @override
  String get howItWorksBody =>
      'Daily Stitch ti aiuta a mantenere una piccola catena di disciplina ininterrotta. Ecco fatto.';

  @override
  String get howItWorksToday => 'La scheda Oggi';

  @override
  String get howItWorksTodayBody =>
      'Questa è la tua casa. Mostra le 5 attività e le abitudini che hai impostato per oggi. Completa entro mezzanotte, la catena si estende.';

  @override
  String get howItWorksCap => 'Il limite di 5 attività è la funzionalità';

  @override
  String get howItWorksCapBody =>
      'Non ti permettiamo di aggiungere una 6ª. Questo è il punto. Le catene brevi battono quelle lunghe. Tocca \"?\" nella schermata Home per il ragionamento completo.';

  @override
  String get howItWorksHabits =>
      'Le abitudini sono quotidiane, la catena è per sempre';

  @override
  String get howItWorksHabitsBody =>
      'Le abitudini (Yoga del mattino, Bevi acqua) vivono per sempre. Le attività sono一次性. Entrambe alimentano la stessa catena.';

  @override
  String get howItWorksLeftBehind => 'Attività mancate → In sospeso';

  @override
  String get howItWorksLeftBehindBody =>
      'A mezzanotte, le attività incomplete si spostano in In sospeso. Riaggiungi solo ciò che conta ancora. Il resto viene lasciato andare tranquillamente.';

  @override
  String get howItWorksProgress => 'La scheda Progressi';

  @override
  String get howItWorksProgressBody =>
      'Catena, calendario, medaglie, cronologia — tutto su come ti stai comportando nel tempo. Niente di urgente qui.';

  @override
  String get howItWorksYou => 'La scheda Tu';

  @override
  String get howItWorksYouBody =>
      'Il tuo account, le impostazioni, disconnetti. Ecco tutto.';

  @override
  String get howItWorksRule =>
      'La regola: 5 piccole cose, ogni giorno, nessuna scusa.';

  @override
  String get commonRetry => 'Riprova';

  @override
  String get commonBack => 'Indietro';

  @override
  String get commonDismiss => 'Ignora';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonClose => 'Chiudi';

  @override
  String get commonSend => 'Invia';

  @override
  String get commonCopy => 'Copia';

  @override
  String get commonShowLess => 'Mostra meno';

  @override
  String get commonViewFull => 'Vedi note complete';

  @override
  String get commonEdit => 'Modifica';

  @override
  String get commonDelete => 'Elimina';

  @override
  String get commonDone => 'Fatto';

  @override
  String get commonError => 'Qualcosa è andato storto';

  @override
  String get commonPageNotFound => 'Pagina non trovata';

  @override
  String get commonHome => 'Home';

  @override
  String get commonUnknownError => 'Errore di navigazione sconosciuto';

  @override
  String get commonSettingsTooltip => 'Impostazioni';

  @override
  String get commonHowThisWorks => 'Come funziona';

  @override
  String get myDayReminderSet => 'Promemoria impostato';

  @override
  String get myDayPreparationNotes => 'NOTE DI PREPARAZIONE';

  @override
  String get onboardingSkip => 'SALTA';

  @override
  String get onboardingNext => 'Avanti';

  @override
  String get onboardingEnterSanctuary => 'Entra nel Santuario';

  @override
  String get onboardingIntroduction => 'INTRODUZIONE';

  @override
  String get onboardingGrowYourForest => 'FAI CRESCERE LA TUA FORESTA';

  @override
  String get onboardingPage1Title => 'Incontra il tuo Guardiano.';

  @override
  String get onboardingPage1Body =>
      'Benvenuto nel tuo Santuario Personale. Qui, la tua crescita si riflette nella vita della tua foresta.';

  @override
  String get onboardingPage2Title => 'Pianta semi. Guardali crescere.';

  @override
  String get onboardingPage2Body =>
      'Ogni attività è un piccolo seme. Ogni abitudine è un germoglio che curi ogni giorno. Insieme formano una foresta di disciplina.';

  @override
  String get onboardingPage3Title => 'Cinque attività. Una catena.';

  @override
  String get onboardingPage3Body =>
      'Puoi piantare solo 5 semi al giorno. Quel limite ti costringe a concentrarti su ciò che conta veramente — e proteggere la tua catena.';

  @override
  String get onboardingPage4Title => 'Cura i tuoi germogli ogni giorno.';

  @override
  String get onboardingPage4Body =>
      'Tocca le abitudini per farle crescere. Salta un giorno e la catena non si estende. Il Guardiano cresce con te.';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Pianta il tuo primo seme.';

  @override
  String get authWelcomeBack => 'Bentornato, Guardiano.';

  @override
  String get authFiveTasksDaily =>
      'Cinque attività. Abitudini quotidiane. Nessuna scusa.';

  @override
  String get authSanctuaryWaiting => 'Il tuo santuario è in attesa.';

  @override
  String get authSignIn => 'Accedi';

  @override
  String get authSignUp => 'Registrati';

  @override
  String get authEmail => 'EMAIL';

  @override
  String get authPassword => 'PASSWORD';

  @override
  String get authEmailHint => 'you@email.com';

  @override
  String get authCreateAccount => 'Crea account';

  @override
  String get authSignInCta => 'Accedi';

  @override
  String get authOrContinueWith => 'oppure continua con';

  @override
  String get authContinueWithGoogle => 'Continua con Google';

  @override
  String get authEnterEmail => 'Inserisci la tua email';

  @override
  String get authEnterValidEmail => 'Inserisci un indirizzo email valido';

  @override
  String get authPasswordTooShort =>
      'La password deve avere almeno 6 caratteri';

  @override
  String get authAccountCreated =>
      'Account creato. Passa ad Accedi e usa la tua password.';

  @override
  String get authSomethingWentWrong => 'Qualcosa è andato storto. Riprova.';

  @override
  String get authCouldNotStartGoogle =>
      'Impossibile avviare l\'accesso con Google.';

  @override
  String get authMidnightReset =>
      'Accedendo, accetti che la tua giornata si reimposti a mezzanotte.';

  @override
  String get authSetupRequired => 'Configurazione necessaria';

  @override
  String get settingsPersonalSanctuary => 'SANTUARIO PERSONALE';

  @override
  String get settingsHowThisWorks => 'Come funziona';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Cos\'è l\'app, come funzionano il limite e la catena';

  @override
  String get settingsStreakProtection => 'Protezione della catena';

  @override
  String get settingsStreakProtectionAvailable =>
      '1 congelamento disponibile questo mese';

  @override
  String get settingsStreakProtectionUsed => 'Usato per questo mese';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Gestisci abbonamento Pro';

  @override
  String get settingsProCancelPlay => 'Annulla o cambia piano in Google Play';

  @override
  String get settingsProUnlock =>
      'Sblocca tutte e 5 le abitudini, cronologia completa, e altro';

  @override
  String get settingsTaskAlarms => 'Sveglie attività e Chiamata Finale';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Sollecito serale e avviso di mezzanotte';

  @override
  String get settingsHomeScreenWidget => 'Widget della schermata Home';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Aggiungi la tua catena alla schermata Home';

  @override
  String get settingsShareBloomTracker => 'Condividi Daily Stitch';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Parla della catena a un amico';

  @override
  String get settingsHelpSupport => 'Aiuto e Supporto';

  @override
  String get settingsHelpSupportSubtitle => 'FAQ o segnala un problema';

  @override
  String get settingsSignOutTile => 'Disconnetti';

  @override
  String get settingsAllFeaturesUnlocked => 'Tutte le funzionalità sbloccate';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Build beta — gli abbonamenti sono in pausa durante i test.';

  @override
  String settingsVersion(Object build, Object version) {
    return 'Versione $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'Versione 1.0.0';

  @override
  String get settingsHabitMaster => 'Maestro delle Abitudini';

  @override
  String settingsLevel(Object level) {
    return 'Livello $level · Maestro delle Abitudini';
  }

  @override
  String get languagePickerTitle => 'Lingua';

  @override
  String get youLast7Days => 'Ultimi 7 giorni';

  @override
  String get youLast7DaysSubtitle =>
      'Cronologia delle attività giorno per giorno';

  @override
  String get youLeftBehindSubtitle =>
      'Attività mancate in attesa di essere riaggiunte';

  @override
  String get youProTier => 'Piano Pro';

  @override
  String get youFreeTier => 'Piano gratuito';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Gratuito';

  @override
  String youLevelLabel(Object level) {
    return 'Livello $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'Migliore $days g';
  }

  @override
  String get youPlantHabit => 'Pianta un\'abitudine per iniziare una catena.';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'Sblocca il sistema completo di disciplina.';

  @override
  String get youProFeatures =>
      '5 slot abitudini, cronologia completa, medaglie leggendarie, congelamenti mensili della catena, card condivisibili settimanali.';

  @override
  String get youSeePlans => 'Vedi piani';

  @override
  String youFromPrice(Object price) {
    return 'da $price/mese';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch · Habit & To-Do';

  @override
  String get progressMedals => 'Medaglie';

  @override
  String get progressLast7Days => 'Ultimi 7 giorni';

  @override
  String get progressSeeAll => 'Vedi tutte';

  @override
  String get progressSeeDayByDayActivity =>
      'Vedi la tua attività giorno per giorno';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done di $total attività completate · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Nessuna medaglia ancora — completa un\'attività o cura un germoglio per iniziare.';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'Vedi tutte le medaglie · $earned di $total ottenute';
  }

  @override
  String get progressGuardianInsight => 'Intuizione del Guardiano';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'PROSSIMO BADGE · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return 'obiettivo $days giorni';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Aiuto e Supporto';

  @override
  String get helpBody =>
      'La maggior parte delle risposte è qui sotto. In caso contrario, inviaci un messaggio e di solito rispondiamo entro 2-3 giorni.';

  @override
  String get helpSectionFAQ => 'DOMANDE FREQUENTI';

  @override
  String get helpSectionContact => 'HAI ANCORA DUBBI?';

  @override
  String get helpAddMessage => 'Aggiungi prima un breve messaggio.';

  @override
  String get helpOpening => 'Apertura dell\'app di posta…';

  @override
  String get helpEmailUs => 'Scrivici';

  @override
  String get helpOpeningAction => 'Apertura…';

  @override
  String get helpCopyEmail => 'Copia email di supporto';

  @override
  String get helpCopiedEmail => 'Copiato dailystitch79315@gmail.com';

  @override
  String get helpNoMailApp =>
      'Nessuna app di posta trovata. Scrivici a dailystitch79315@gmail.com.';

  @override
  String get helpTopicLabel => 'Argomento';

  @override
  String get helpWhatHappened => 'Cos\'è successo?';

  @override
  String get helpHint => 'Una breve descrizione fa molta strada…';

  @override
  String get helpDisclaimer =>
      'Toccando \"Scrivici\" si apre la tua app di posta con un messaggio pre-compilato (nessun dato lascia il tuo dispositivo finché non invii).';

  @override
  String get helpFaqQ1 => 'Cos\'è il limite di 5 attività?';

  @override
  String get helpFaqA1 =>
      'Puoi aggiungere fino a 5 attività al giorno locale. La 6ª è bloccata appositamente — la disciplina batte il sovraccarico. Il limite è la funzionalità, non una limitazione.';

  @override
  String get helpFaqQ2 => 'Cosa succede a mezzanotte?';

  @override
  String get helpFaqA2 =>
      'A mezzanotte locale, qualsiasi attività ancora segnata come aperta viene contrassegnata come \"mancata\" e si sposta in In sospeso. Le catene delle abitudini si reimpostano se l\'abitudine non è stata completata il giorno prima.';

  @override
  String get helpFaqQ3 => 'Cos\'è In sospeso?';

  @override
  String get helpFaqA3 =>
      'Una lista gentile e ignorabile delle attività che non hai completato. Aprila, riaggiungi solo ciò che conta ancora, e lascia andare il resto. Il piano gratuito mostra gli ultimi 7 giorni; Pro mostra la cronologia completa.';

  @override
  String get helpFaqQ4 => 'Come funzionano le catene?';

  @override
  String get helpFaqA4 =>
      'Un giorno estende la catena quando hai avuto almeno 1 attività e 0 mancate. I giorni senza attività non estendono né rompono la catena. Un congelamento perdona un giorno mancato al mese.';

  @override
  String get helpFaqQ5 => 'Cos\'è il congelamento della catena?';

  @override
  String get helpFaqA5 =>
      'Un \"congelamento\" al mese solare, solo per Pro. Usalo in un giorno mancato per mantenere viva la tua catena. Lo trovi nella scheda Progressi.';

  @override
  String get helpFaqQ6 => 'Dove sono memorizzati i miei dati?';

  @override
  String get helpFaqA6 =>
      'Tutti i dati sono memorizzati in Supabase (Postgres) sotto l\'account che ha effettuato l\'accesso. Non vendiamo mai né condividiamo i dati. Consulta l\'informativa sulla privacy collegata nella pagina del Play Store per i dettagli completi.';

  @override
  String get helpFaqQ7 => 'Come elimino il mio account?';

  @override
  String get helpFaqA7 =>
      'Vai su Impostazioni → Account → Elimina account. Questo elimina permanentemente il tuo profilo, le attività, le abitudini e i progressi. Gli abbonamenti attivi devono essere annullati separatamente in Google Play.';

  @override
  String get helpTopicsGeneral => 'Domanda generale';

  @override
  String get helpTopicsBug => 'Segnalazione bug';

  @override
  String get helpTopicsStreak => 'Problema con catena / trasferimento';

  @override
  String get helpTopicsBilling => 'Fatturazione o piano Pro';

  @override
  String get helpTopicsAccount => 'Account e dati';

  @override
  String get helpTopicsFeature => 'Richiesta di funzionalità';

  @override
  String get helpAccountAnon => '(non connesso)';

  @override
  String get splashTagline => 'Cura i piccoli semi. Fai crescere una foresta.';

  @override
  String get priorityStandard => 'STANDARD';

  @override
  String get priorityVital => 'VITALE';

  @override
  String get prioritySpark => 'SCINTILLA';

  @override
  String get settingsDeleteAccount => 'Elimina account';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Rimuovi permanentemente i tuoi dati';

  @override
  String get settingsDeleteAccountConfirmTitle => 'Eliminare il tuo account?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'Questo elimina permanentemente il tuo profilo, le attività, le abitudini e i progressi. Gli abbonamenti attivi devono essere annullati separatamente in Google Play. Non può essere annullato.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Elimina per sempre';

  @override
  String get settingsDeleteAccountSuccess =>
      'Il tuo account è stato eliminato.';

  @override
  String get settingsDeleteAccountFailed =>
      'Impossibile eliminare l\'account. Riprova o scrivi a dailystitch79315@gmail.com.';

  @override
  String get referralYouTitle => 'Invita amici · ottieni Pro gratuito';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress di $milestone amici si sono uniti';
  }

  @override
  String get referralYouShare => 'Condividi invito';

  @override
  String get referralYouDetails => 'Vedi dettagli';

  @override
  String get referralPaywallTitle => 'Mese Pro gratuito';

  @override
  String get referralPaywallBody =>
      'Invita 5 amici che si registrano → 1 mese Pro gratuito';

  @override
  String get referralPaywallProBody =>
      'Continua a invitare — accumula mesi Pro gratuiti';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'Impossibile caricare i tuoi progressi. Riprova più tardi.';

  @override
  String get insightsMetricCurrentChain => 'CATENA ATTUALE';

  @override
  String get insightsMetricBestEver => 'MIGLIORE DI SEMPRE';

  @override
  String get insightsMetricTasksDone => 'ATTIVITÀ COMPLETATE';

  @override
  String get insightsMetricPerfectDays => 'GIORNI PERFETTI';

  @override
  String get insightsMetricHabits => 'ABITUDINI';

  @override
  String get insightsDay => 'giorno';

  @override
  String get insightsDays => 'giorni';

  @override
  String get insightsSectionThisWeek => 'Questa settimana';

  @override
  String get insightsShareMyWeek => 'Condividi la mia settimana';

  @override
  String get insightsShareMyWeekPro => 'Condividi la mia settimana · Pro';

  @override
  String get insightsShareReceiptText =>
      'La mia settimana su Daily Stitch. Non rompere la catena.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Mostrando gli ultimi $days giorni';
  }

  @override
  String get insightsHistoryUpsell =>
      'Sblocca la tua cronologia completa con Pro';

  @override
  String get referralScreenTitle => 'Invita amici';

  @override
  String get referralLaunchGift => 'Regalo del mese di lancio';

  @override
  String get referralRewardTitle => 'Ottieni 1 mese di Pro gratuito';

  @override
  String get referralRewardBody =>
      'Condividi il tuo codice con gli amici. Quando 5 persone si registrano usando il tuo codice, sblocchi Daily Stitch Pro per un mese intero.';

  @override
  String get referralYourCode => 'Il tuo codice referral';

  @override
  String get referralCopyCodeTooltip => 'Copia codice';

  @override
  String get referralCodeCopied => 'Codice referral copiato';

  @override
  String get referralShareWithFriends => 'Condividi con amici';

  @override
  String get referralFooterHint =>
      'Gli amici inseriscono il tuo codice quando creano un account. Ogni amico conta una volta verso la tua ricompensa.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count amico si è unito';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count amici si sono uniti';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'Hai ottenuto $count mese gratuito di Pro.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'Hai ottenuto $count mesi gratuiti di Pro.';
  }

  @override
  String get referralRewardUnlocked =>
      'Ricompensa sbloccata — goditi il tuo mese gratuito di Pro!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining in più per sbloccare il tuo mese gratuito';
  }

  @override
  String youProMemberSince(String month) {
    return 'Membro Bloom Pro da $month';
  }

  @override
  String get youProPerksTitle => 'I tuoi vantaggi Pro';

  @override
  String get manageProThankYou => 'Grazie per sostenere Bloom';

  @override
  String get manageProReferralHint =>
      'Invita altri amici per estendere il tuo Pro';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nAdd SUPABASE_URL and SUPABASE_PUBLISHABLE_KEY (or legacy SUPABASE_ANON_KEY) to leanspace/.env, then rebuild:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Predefinito di sistema';

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
  String get onboardingLanguageTitle => 'Scegli la tua lingua';

  @override
  String get onboardingLanguageBody =>
      'Scegli la lingua che vuoi usare in Daily Stitch. Puoi cambiarla in qualsiasi momento nelle Impostazioni.';

  @override
  String get onboardingLanguageContinue => 'Continua';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Amico';

  @override
  String get settingsAppTheme => 'Tema dell\'app';

  @override
  String get settingsAppThemeSubtitle =>
      'Seleziona i colori del tuo santuario personale';

  @override
  String get settingsInviteFriendsTitle => 'Invita amici · Pro gratuito';

  @override
  String get settingsInviteFriendsSubtitle =>
      'Ottieni 1 mese gratuito quando 5 amici si uniscono';

  @override
  String get themePickerTitle => 'Santuario Personale';

  @override
  String get themePickerSubtitle =>
      'Scegli una tavolozza di colori che ti porti pace.';

  @override
  String get themeNameClassicBloom => 'Bloom Classico';

  @override
  String get themeNameSolarTerracotta => 'Terracotta Solare';

  @override
  String get themeNameMidnightOasis => 'Oasi di Mezzanotte';

  @override
  String get themeNameLavenderDream => 'Sogno di Lavanda';

  @override
  String get themeNameNordicFrost => 'Gelo Nordico';

  @override
  String get themeNameCyberpunkNeon => 'Neon Cyberpunk';

  @override
  String get reminderTitle => 'Promemoria';

  @override
  String get reminderBody =>
      'La Chiamata Finale ti avvisa prima di mezzanotte se ci sono ancora attività aperte.';

  @override
  String get reminderFinalCall => 'Chiamata Finale';

  @override
  String get reminderEveningNudge => 'Sollecito serale';

  @override
  String get reminderChangeTime => 'Cambia orario';

  @override
  String get reminderSave => 'Salva promemoria';

  @override
  String get notificationChannelReminders => 'Promemoria Daily Stitch';

  @override
  String get notificationChannelRemindersDesc =>
      'Sollecito serale e promemoria della Chiamata Finale';

  @override
  String get notificationChannelAlarms => 'Sveglie attività Daily Stitch';

  @override
  String get notificationChannelAlarmsDesc =>
      'Sveglie ad alta voce per promemoria attività';

  @override
  String get notificationTaskReminderTitle => 'Promemoria attività';

  @override
  String get notificationFinalCallTitle => 'Chiamata Finale';

  @override
  String notificationFinalCallBody(int count) {
    return 'Hai ancora $count attività aperte oggi.';
  }

  @override
  String get notificationEveningTitle => 'Punto serale';

  @override
  String get notificationEveningBody =>
      'Come è cresciuto il tuo giardino oggi?';

  @override
  String get widgetSetupTitle => 'Aggiungi widget catena';

  @override
  String get widgetSetupBody =>
      'Mantieni la tua catena sulla schermata Home — non serve aprire l\'app.';

  @override
  String get widgetSetupAdd => 'Aggiungi alla schermata Home';

  @override
  String get widgetSetupStep1 => 'Premi a lungo sulla schermata Home';

  @override
  String get widgetSetupStep2 => 'Tocca Widget';

  @override
  String get widgetSetupStep3 => 'Trova Daily Stitch e trascinalo';

  @override
  String get widgetSetupPinSuccess =>
      'Controlla la schermata Home per posizionare il widget.';

  @override
  String get widgetSetupPinFallback =>
      'Il tuo launcher potrebbe non supportare l\'aggiunta con un tocco. Usa i passaggi manuali qui sotto.';

  @override
  String get paywallWelcomePro => 'Benvenuto in Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'RISPARMIA ~16%';

  @override
  String get paywallTermsTitle => 'Termini di abbonamento';

  @override
  String get paywallTermsBody =>
      'La fatturazione è gestita da Google Play. Gli abbonamenti si rinnovano automaticamente fino a quando non annulli in Play Store → Abbonamenti almeno 24 ore prima della fine del periodo corrente. Puoi gestire o annullare il tuo abbonamento in qualsiasi momento dal tuo account Google Play.\n\nLa disinstallazione dell\'app non annulla il tuo abbonamento.\n\nI prezzi mostrati sono nella tua valuta locale e possono variare in base alla regione. Possono essere applicate tasse.';

  @override
  String get paywallPrivacyTitle => 'Privacy';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch memorizza le tue attività, abitudini e dati della catena sul nostro backend Supabase, legati al tuo account. Non vendiamo mai i tuoi dati.\n\nGli acquisti degli abbonamenti sono elaborati da Google Play. Riceviamo un token di acquisto verificato da Google per confermare il tuo stato Pro. Non vediamo né memorizziamo i tuoi dati di pagamento.\n\nPuoi richiedere l\'esportazione completa dei dati o la cancellazione dell\'account da Impostazioni → Elimina account.';

  @override
  String get paywallCloseTooltip => 'Chiudi';

  @override
  String get paywallFooterLinks => 'Ripristina · Termini · Privacy';

  @override
  String get manageProTitle => 'Abbonamento Pro';

  @override
  String get manageProActive => 'Attivo';

  @override
  String get manageProNotSubscribed => 'Non iscritto';

  @override
  String get manageProFreeTier => 'Piano gratuito';

  @override
  String manageProRenewsOn(String date) {
    return 'Si rinnova o scade il $date.';
  }

  @override
  String get manageProFreeBody =>
      'Stai usando Daily Stitch Gratuito. Aggiorna per sbloccare il sistema completo.';

  @override
  String get manageProSectionManage => 'GESTISCI';

  @override
  String get manageProOpenPlay => 'Apri abbonamenti Google Play';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Annulla, cambia piano o aggiorna metodo di pagamento';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Trova il tuo abbonamento esistente (se presente) qui';

  @override
  String get manageProShareApp => 'Condividi Daily Stitch';

  @override
  String get manageProShareSubtitle => 'Parla della catena a un amico';

  @override
  String get manageProSectionHelp => 'HAI BISOGNO DI AIUTO?';

  @override
  String get manageProHelpTitle => 'Aiuto e Supporto';

  @override
  String get manageProHelpSubtitle =>
      'FAQ abbonamento, contatto, segnalazione bug';

  @override
  String manageProBillingFooter(String version) {
    return 'Fatturazione gestita da Google Play · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Apri l\'app Google Play Store → tocca il tuo profilo → Pagamenti e abbonamenti → Abbonamenti.';

  @override
  String get addTaskGrowSomething => 'Fai qualcosa crescere';

  @override
  String get addTaskPlantSprout => 'Pianta un Germoglio';

  @override
  String get addTaskIntentionName => 'NOME DELL\'INTENZIONE';

  @override
  String get addTaskSproutName => 'NOME DEL GERMOGLIO';

  @override
  String get addTaskHintTask => 'es., Saluto al Sole del Mattino';

  @override
  String get addTaskHintHabit => 'es. Yoga del Mattino';

  @override
  String get addTaskWhen => 'QUANDO?';

  @override
  String get addTaskPriority => 'PRIORITÀ';

  @override
  String get addTaskNotes => 'NOTE';

  @override
  String get addTaskCadenceDaily => 'Quotidiana';

  @override
  String get addTaskCadenceWeekdays => 'Giorni feriali';

  @override
  String get addTaskCadence3x => '3x/settimana';

  @override
  String get addTaskCadenceWeekly => 'Settimanale';

  @override
  String get addTaskPlantIntention => 'Pianta Intenzione';

  @override
  String get addTaskPlantSproutCta => 'Pianta Germoglio';

  @override
  String get addTaskPlanting => 'Piantando…';

  @override
  String get addTaskNameIntentionError => 'Dai un nome alla tua intenzione';

  @override
  String get addTaskNameSproutError => 'Dai un nome al tuo germoglio';

  @override
  String get addTaskNotesMigrationWarning =>
      'Task saved. Notes & priority need the latest Supabase migration — run supabase/migrations/20260701000000_todos_notes_priority.sql.';

  @override
  String get addTaskNoSproutSlots =>
      'Nessuno slot germoglio vuoto — curane uno prima.';

  @override
  String get addTaskSaveSproutError =>
      'Impossibile salvare il germoglio — riprova.';

  @override
  String get addTaskElementWater => 'ACQUA';

  @override
  String get addTaskElementLight => 'LUCE';

  @override
  String get addTaskElementSoil => 'TERRA';

  @override
  String get addTaskElementBreeze => 'BREZZA';

  @override
  String get addTaskCadenceLabel => 'CADENZA';

  @override
  String get addTaskPreparationNotes => 'NOTE DI PREPARAZIONE';

  @override
  String get addTaskTendingNotes => 'NOTE DI CURA';

  @override
  String get addTaskNotesHintTask =>
      'Strumenti o consigli mentali per questa attività?';

  @override
  String get addTaskNotesHintHabit => 'A cosa assomma curare questo germoglio?';

  @override
  String get addTaskChooseElement => 'SCEGLI ELEMENTO';

  @override
  String get addTaskElementsTooltip => 'Cosa significano gli elementi?';

  @override
  String get addTaskTaskSeed => 'Seme dell\'Attività';

  @override
  String get addTaskHabitSprout => 'Germoglio dell\'Abitudine';

  @override
  String get addTaskPickElement => 'Scegli l\'elemento giusto';

  @override
  String get addTaskPickElementBody =>
      'Ogni elemento corrisponde a un tipo diverso di sforzo. Il Guardiano cresce più forte quando innaffi quello giusto.';

  @override
  String get addTaskClearForm => 'Pulisci modulo';

  @override
  String get shareCouldNotShare => 'Impossibile condividere ora';

  @override
  String get authReferralCodeLabel => 'Codice referral (opzionale)';

  @override
  String get authReferralCodeHint => 'Codice dell\'amico';

  @override
  String get youPerkHabitSlots => '5 slot abitudini';

  @override
  String get youPerkFullHistory => 'Cronologia completa';

  @override
  String get youPerkAllThemes => 'Tutti i temi';

  @override
  String get youPerkStreakFreezes => '2 congelamenti catena / mese';

  @override
  String get youPerkLegendaryMedals => 'Medaglie leggendarie';

  @override
  String get subscriptionPurchaseFailed => 'Acquisto fallito. Riprova.';

  @override
  String get subscriptionUnavailable =>
      'Gli acquisti in-app non sono disponibili su questo dispositivo.';

  @override
  String get subscriptionLoadFailed =>
      'Impossibile caricare le opzioni di abbonamento.';

  @override
  String get subscriptionVerifyFailed =>
      'Impossibile verificare l\'acquisto. Prova Ripristina acquisto.';

  @override
  String get streakFreezeFailed =>
      'Impossibile usare il congelamento della catena.';

  @override
  String get streakFreezeAlreadyUsed =>
      'Hai già usato il tuo congelamento questo mese.';

  @override
  String get streakFreezeNoMissed =>
      'Nessuna attività mancata in quel giorno da congelare.';

  @override
  String get streakFreezeNotPastDay => 'Puoi congelare solo un giorno passato.';

  @override
  String get myDayLoadError =>
      'Impossibile caricare La Mia Giornata. Trascina per aggiornare.';

  @override
  String get myDayCapReached =>
      'Hai raggiunto il limite di 5 attività di oggi.';

  @override
  String get myDayRemoveTaskError => 'Impossibile rimuovere l\'attività.';

  @override
  String get shareCardTitle => 'Condividi la tua settimana';

  @override
  String get shareCardCta => 'Condividi immagine';

  @override
  String get medalTierSprout => 'Germoglio';

  @override
  String get medalTierCommon => 'Comune';

  @override
  String get medalTierRare => 'Rara';

  @override
  String get medalTierEpic => 'Epica';

  @override
  String get medalTierLegendary => 'Leggendaria';

  @override
  String get medalCategoryTasks => 'Attività';

  @override
  String get medalCategoryHabits => 'Abitudini';

  @override
  String get medalCategoryStreaks => 'Catene';

  @override
  String get medalCategoryMastery => 'Maestria';

  @override
  String get medalsShareTooltip => 'Condividi i traguardi';

  @override
  String get medalsFilterAll => 'Tutte';

  @override
  String get addHabitTitleNew => 'Pianta un nuovo germoglio';

  @override
  String get addHabitTitleEdit => 'Cura il tuo germoglio';

  @override
  String get addHabitLabelSproutName => 'NOME DEL GERMOGLIO';

  @override
  String get shareCardAppBarTitle => 'Card di condivisione';

  @override
  String get shareCardAppBarTitleMedal => 'Condividi la tua medaglia';

  @override
  String shareCardDescMedal(Object title) {
    return 'Mostra il tuo nuovo badge $title';
  }

  @override
  String get shareCardBodyMedal =>
      'Condividi la vittoria con il tuo circolo. La card viene esportata in PNG ed è pronta per qualsiasi app social.';

  @override
  String get shareCardCtaPreparing => 'Preparazione…';

  @override
  String get shareCardMilestone => 'NUOVO TRAGUARDO SBLOCCATO';

  @override
  String get shareCardStatChain => 'giorni di catena';

  @override
  String get shareCardStatSprouts => 'germogli';

  @override
  String get shareCardStatMedals => 'medaglie';

  @override
  String shareCardHeadlineStreak(int days) {
    return 'Catena di $days giorni';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count medaglie ottenute';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Guardiano dei germogli';

  @override
  String get shareCardHeadlineFirstSeeds => 'Primi semi piantati';

  @override
  String get shareCardHeadlineGardenBegins => 'Un giardino comincia';

  @override
  String get shareCardSubheadMonth =>
      'Hai curato le tue abitudini con successo per un intero mese.';

  @override
  String get shareCardSubheadWeek =>
      'Un\'intera settimana di crescita — la tua foresta si sta ispessendo.';

  @override
  String get shareCardSubheadProgress =>
      'Il tuo santuario mostra progressi reali. Continua a curare.';

  @override
  String get shareCardSubheadSprouts =>
      'I tuoi primi germogli si stanno radicando. Innaffiali ogni giorno.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'I tuoi primi semi sono nel terreno. Guardali aprirsi.';

  @override
  String get shareCardSubheadFallback =>
      'Ogni foresta comincia con una piccola scelta.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — cinque piccoli semi al giorno, una catena indistruttibile. Pianta il tuo.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Prova Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Sto costruendo la mia catena quotidiana su Daily Stitch — unisciti a me con il mio codice referral $code e cresceremo insieme.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Unisciti a me su Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'I miei progressi su Daily Stitch — $year su Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Ho appena sbloccato la medaglia \"$title\" su Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Attività completate';

  @override
  String get insightsReceiptPerfectDays => 'Giorni perfetti';

  @override
  String get insightsReceiptCompletion => 'Completamento';

  @override
  String insightsReceiptDate(String date) {
    return 'Settimana del $date';
  }

  @override
  String get insightsReceiptFooter => 'Non rompere la catena.';

  @override
  String get elementLabelWater => 'Acqua';

  @override
  String get elementLabelLight => 'Luce';

  @override
  String get elementLabelSoil => 'Terra';

  @override
  String get elementLabelBreeze => 'Brezza';

  @override
  String get elementTaglineWater =>
      'Ripristina. Idratazione, riposo, cura emotiva — qualsiasi cosa riempia il pozzo.';

  @override
  String get elementTaglineLight =>
      'Sveglia. Luce del mattino, blocchi di concentrazione, studio, meditazione — energia e chiarezza.';

  @override
  String get elementTaglineSoil =>
      'Radicare. Lettura, diario, lavoro profondo — radici lente che costruiscono forza a lungo termine.';

  @override
  String get elementTaglineBreeze =>
      'Muoversi. Camminare, correre, respirazione — energia leggera e mobile che libera la mente.';

  @override
  String get elementWhenWater => 'Quando ti senti esausto o prosciugato.';

  @override
  String get elementWhenLight =>
      'Quando hai bisogno di un inizio chiaro per la tua giornata.';

  @override
  String get elementWhenSoil =>
      'Quando il lavoro è lento ma ne vale la pena (studio, mestiere, cura).';

  @override
  String get elementWhenBreeze =>
      'Quando il tuo corpo (o la tua mente) ha bisogno di muoversi e respirare.';

  @override
  String get bloomTierMastery => 'Maestria';

  @override
  String get bloomTierStrong => 'Forte';

  @override
  String get bloomTierGrowing => 'In crescita';

  @override
  String get bloomTierSprouting => 'Germogliando';

  @override
  String get bloomTierLocked => 'Bloccato';

  @override
  String habitBloomSubtitle(int count, String element) {
    return '$count giorni di catena · $element';
  }

  @override
  String get medal_id_first_spark => 'Prima Scintilla';

  @override
  String get medal_sub_first_spark => 'Hai acceso la fiamma.';

  @override
  String get medal_desc_first_spark =>
      'Completa la tua prima attività. Ogni catena inizia qui.';

  @override
  String get medal_id_triple_seed => 'Triplice Seme';

  @override
  String get medal_sub_triple_seed => 'Tre nel terreno.';

  @override
  String get medal_desc_triple_seed => 'Completa 3 attività in totale.';

  @override
  String get medal_id_dozen_sower => 'Semina della Dordici';

  @override
  String get medal_sub_dozen_sower => 'Un campo di dodici.';

  @override
  String get medal_desc_dozen_sower => 'Completa 12 attività in totale.';

  @override
  String get medal_id_quarter_century => 'Un Quarto di Secolo';

  @override
  String get medal_sub_quarter_century => 'Una stagione di sì.';

  @override
  String get medal_desc_quarter_century => 'Completa 25 attività in totale.';

  @override
  String get medal_id_productivity_titan => 'Titano della Produttività';

  @override
  String get medal_sub_productivity_titan => 'La costanza si moltiplica.';

  @override
  String get medal_desc_productivity_titan =>
      'Completa 50 attività — hai costruito un vero slancio.';

  @override
  String get medal_id_century_planter => 'Piantatore del Secolo';

  @override
  String get medal_sub_century_planter => 'Una foresta tutta tua.';

  @override
  String get medal_desc_century_planter =>
      'Completa 100 attività. Sei nel top 5% degli utenti.';

  @override
  String get medal_id_clean_day => 'Giorno Pulito';

  @override
  String get medal_sub_clean_day => 'Nemmeno una erbacce.';

  @override
  String get medal_desc_clean_day =>
      'Completa ogni attività che pianti in un singolo giorno.';

  @override
  String get medal_id_triple_perfect => 'Triplice Perfetto';

  @override
  String get medal_sub_triple_perfect => 'Tre esecuzioni senza errori.';

  @override
  String get medal_desc_triple_perfect => 'Raggiungi 3 giorni perfetti.';

  @override
  String get medal_id_perfect_week => 'Settimana Perfetta';

  @override
  String get medal_sub_perfect_week => 'Sette giorni senza interruzioni.';

  @override
  String get medal_desc_perfect_week => '7 giorni perfetti di fila.';

  @override
  String get medal_id_two_week_chain => 'Forza del Fortnight';

  @override
  String get medal_sub_two_week_chain => 'Due settimane di fuoco.';

  @override
  String get medal_desc_two_week_chain => 'Mantieni una catena di 14 giorni.';

  @override
  String get medal_id_iron_chain => 'Catena di Ferro';

  @override
  String get medal_sub_iron_chain => '30 maglie forgiate.';

  @override
  String get medal_desc_iron_chain =>
      'Una catena di 30 giorni. La medaglia più difficile.';

  @override
  String get medal_id_quarterly_chain => 'Catena Trimestrale';

  @override
  String get medal_sub_quarterly_chain => 'Una stagione, senza interruzioni.';

  @override
  String get medal_desc_quarterly_chain =>
      'Una catena di 90 giorni. Status leggendario.';

  @override
  String get medal_id_vital_priority => 'Scintilla Vitale';

  @override
  String get medal_sub_vital_priority => 'Hai scelto le più difficili.';

  @override
  String get medal_desc_vital_priority =>
      'Completa 5 attività contrassegnate come Priorità Vitale.';

  @override
  String get medal_id_spark_priority => 'Domatore di Scintille';

  @override
  String get medal_sub_spark_priority => 'Le vittorie veloci si accumulano.';

  @override
  String get medal_desc_spark_priority =>
      'Completa 5 attività contrassegnate come Priorità Scintilla.';

  @override
  String get medal_id_note_taker => 'Appuntatore';

  @override
  String get medal_sub_note_taker => 'Piani su carta battono piani in testa.';

  @override
  String get medal_desc_note_taker =>
      'Aggiungi note di preparazione a 5 attività diverse.';

  @override
  String get medal_id_left_behind_rescuer => 'Salvatore dei Restanti';

  @override
  String get medal_sub_left_behind_rescuer =>
      'Nessuna attività lasciata indietro.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Ri-aggiungi 3 attività mancate il giorno dopo.';

  @override
  String get medal_id_first_sprout => 'Primo Germoglio';

  @override
  String get medal_sub_first_sprout => 'Un nuovo rituale quotidiano.';

  @override
  String get medal_desc_first_sprout => 'Pianta la tua prima abitudine.';

  @override
  String get medal_id_trio_sprout => 'Trio Germoglio';

  @override
  String get medal_sub_trio_sprout => 'Un piccolo ecosistema.';

  @override
  String get medal_desc_trio_sprout => 'Pianta 3 abitudini diverse.';

  @override
  String get medal_id_week_of_growth => 'Settimana di Crescita';

  @override
  String get medal_sub_week_of_growth => 'Le radici iniziano a tenere.';

  @override
  String get medal_desc_week_of_growth =>
      'Cura un\'abitudine ogni giorno per 7 giorni.';

  @override
  String get medal_id_fortnight_floret => 'Fiora del Fortnight';

  @override
  String get medal_sub_fortnight_floret => 'Una fioritura completa.';

  @override
  String get medal_desc_fortnight_floret =>
      'Una catena di abitudini di 14 giorni.';

  @override
  String get medal_id_rooted_master => 'Maestro Radicato';

  @override
  String get medal_sub_rooted_master => 'Radici profonde, forza profonda.';

  @override
  String get medal_desc_rooted_master =>
      'Una catena di abitudini di 30 giorni.';

  @override
  String get medal_id_half_year_bloom => 'Fioritura Semestrale';

  @override
  String get medal_sub_half_year_bloom => 'Il giardino è permanente ora.';

  @override
  String get medal_desc_half_year_bloom =>
      'Mantieni una singola abitudine per 180 giorni.';

  @override
  String get medal_id_garden_keeper => 'Custode del Giardino';

  @override
  String get medal_sub_garden_keeper => 'Varietà, insieme.';

  @override
  String get medal_desc_garden_keeper =>
      'Coltiva 4 abitudini diverse contemporaneamente.';

  @override
  String get medal_id_hydration_hero => 'Eroe dell\'Idratazione';

  @override
  String get medal_sub_hydration_hero => 'Riempi il pozzo.';

  @override
  String get medal_desc_hydration_hero =>
      'Pianta un\'abitudine di idratazione (acqua/bevanda).';

  @override
  String get medal_id_mindful_mover => 'Muoviti con Consapevolezza';

  @override
  String get medal_sub_mindful_mover => 'Il corpo ricorda.';

  @override
  String get medal_desc_mindful_mover =>
      'Pianta un\'abitudine di movimento (yoga/corsa/camminata).';

  @override
  String get medal_id_devoted_keeper => 'Custode Devoto';

  @override
  String get medal_sub_devoted_keeper => 'Sessanta giorni, una pratica.';

  @override
  String get medal_desc_devoted_keeper =>
      'Cura una singola abitudine per 60 giorni consecutivi.';

  @override
  String get medal_id_tending_notes => 'Note di Cura';

  @override
  String get medal_sub_tending_notes => 'Rifletti mentre vai.';

  @override
  String get medal_desc_tending_notes => 'Aggiungi note di cura a 3 abitudini.';

  @override
  String get medalTierTaglineSprout => 'Pianta il primo seme';

  @override
  String get medalTierTaglineCommon => 'Costruire l\'abitudine';

  @override
  String get medalTierTaglineRare => 'Mostrando un vero slancio';

  @override
  String get medalTierTaglineEpic => 'Sei una forza della natura';

  @override
  String get medalTierTaglineLegendary => 'Mitico, quasi nessuno arriva qui';

  @override
  String get guardianHeadlineNoTasks =>
      'Il terreno di oggi è fresco.\nPianta il tuo primo seme\ne guarda crescere.';

  @override
  String get guardianHeadlineAllDone =>
      'Ogni seme che hai piantato\nè in fioritura.\nRiposa, Guardiano — te lo sei guadagnato.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count giorni\ndi crescita ininterrotta.\nLa tua foresta è piena di vita.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Una settimana completa in fioritura,\nGuardiano.\nUn altro giorno perfetto\nestende la catena.';

  @override
  String get guardianHeadlineStreak3 =>
      'La tua catena sta reggendo.\nCura i semi\nche aspettano di aprirsi.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Stai gestendo bene le attività.\nPianta un germoglio —\nle abitudini fanno crescere le foreste.';

  @override
  String get guardianHeadlineSomeDone =>
      'Alcuni semi si sono aperti,\naltri no. Va bene.\nDomani è un\'altra piantagione.';

  @override
  String get guardianHeadlineMorning =>
      'Buongiorno, Guardiano.\nIl giorno è giovane\ne il terreno è pronto.';

  @override
  String get guardianHeadlineAfternoon =>
      'Buon pomeriggio, Guardiano.\nMeta della luce rimane —\ncontinua a curare.';

  @override
  String get guardianHeadlineEvening =>
      'Buonasera, Guardiano.\nUn\'ultima passata\nprima che il sole tramonti.';

  @override
  String get guardianHeadlineNight =>
      'Bruci olio di mezzanotte?\nAnche i Guardiani riposano.\nPianta il seme di domani.';

  @override
  String get guardianBodyNoTasks =>
      'Il tuo santuario è tranquillo ora. Aggiungi un\'intenzione e vedi cosa cambia al tramonto.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count giorni in corsa. La catena non è fortuna — sono le piccole scelte che si accumulano. Continua ad accumularle.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'Una catena di $count giorni è un vero slancio. Completa i semi aperti di oggi prima di dire che hai finito.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Hai piantato $count attività finora. Aggiungere anche un solo germoglio di abitudine farebbe crescere il lavoro giorno dopo giorno.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Stai completando il $pct% di quello che pianti. Semi più pochi e affilati tendono a crescere più alti di dieci sparsi.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Il tuo santuario è vivo. $tasks attività completate, $sprouts germogli in crescita — il lavoro si vede.';
  }

  @override
  String get guardianInsightWaitingTitle => 'In attesa della tua prima mossa';

  @override
  String get guardianInsightWaitingBody =>
      'Aggiungi un\'attività o un\'abitudine e inizierò a leggere i pattern nel tuo giardino. Più pianti, più ho da imparare.';

  @override
  String get guardianInsightWaitingCta => 'Pianta il tuo primo seme';

  @override
  String get guardianInsightChainSuperTitle =>
      'La catena è la tua superpotenza';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Hai mantenuto una catena di $count giorni. Le catene battono la motivazione ogni volta — mantienila calda, anche nei giorni lenti.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Aggiungi il seme di domani';

  @override
  String get guardianInsightChainColdTitle =>
      'La catena è fredda — iniziane una nuova';

  @override
  String get guardianInsightChainColdBody =>
      'Hai piantato prima, il che significa che puoi piantare di nuovo. Una singola attività completata oggi è una catena più lunga domani.';

  @override
  String get guardianInsightChainColdCta => 'Pianta un seme';

  @override
  String get guardianInsightLessIsMoreTitle => 'Meno è di più questa settimana';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Completavi il $pct% di quello che piantavi. Prova 3 intenzioni affilate invece di 5 vaghe — la qualità si moltiplica.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Affila la giornata';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Prossima medaglia: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Sei a $value di $target $unit. Alcuni giorni onesti in più e sarà tua.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Mostra medaglia';

  @override
  String get guardianInsightSteadyTitle => 'Sei in una stagione stabile';

  @override
  String get guardianInsightSteadyBody =>
      'Nessuna medaglia all\'orizzonte — va bene. Cura quello che hai. La prossima fioritura è in arrivo.';

  @override
  String get guardianInsightSteadyCta => 'Vedi i progressi';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 attività rimasta nella tua catena. Mezzanotte si avvicina.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count attività rimaste nella tua catena. Mezzanotte si avvicina.';
  }

  @override
  String get notificationEveningBodyOne => 'Hai ancora 1 attività aperta oggi.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Hai ancora $count attività aperte oggi.';
  }

  @override
  String get notificationTickerTaskReminder => 'Promemoria attività';

  @override
  String get notificationTickerTaskAlarm => 'Sveglia attività';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count giorni di catena · $element';
  }
}
