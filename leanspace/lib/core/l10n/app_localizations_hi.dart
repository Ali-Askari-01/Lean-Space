// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'ब्लूम ट्रैकर';

  @override
  String get tabToday => 'आज';

  @override
  String get tabProgress => 'प्रगति';

  @override
  String get tabYou => 'आप';

  @override
  String get navMyDay => 'मेरा दिन';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get navHelp => 'मदद और सहायता';

  @override
  String get navHistory => 'पिछले 7 दिन';

  @override
  String get navLeftBehind => 'छोड़ा हुआ';

  @override
  String get navInsights => 'आपकी प्रगति';

  @override
  String get navMedals => 'मेरे पदक';

  @override
  String get navManagePro => 'Pro सदस्यता प्रबंधित करें';

  @override
  String get navPaywall => 'ब्लूम ट्रैकर Pro';

  @override
  String get greetingLateNight => 'आधी रात को भी जाग रहे हैं';

  @override
  String get greetingMorning => 'सुप्रभात, सूरज!';

  @override
  String get greetingAfternoon => 'नमस्कार, मित्र';

  @override
  String get greetingEvening => 'शुभ संध्या, चैंपियन';

  @override
  String get greetingNight => 'आराम से सो रहे हैं, रक्षक?';

  @override
  String todayTasksCount(String done, String total) {
    return 'आज · $total में से $done काम';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$total में से $done आदतें';
  }

  @override
  String get todayChainGrows => 'चेन आपके पूरा करने से बढ़ती है';

  @override
  String get todayChainComplete => 'चेन पूरी · कल बगीचे की देखभाल करें';

  @override
  String get taskCapInfo => '5 कार्यों की सीमा क्यों?';

  @override
  String get taskCapDiscipline => 'डिज़ाइन से पहले अनुशासन';

  @override
  String get taskCapTitle =>
      'हम जानबूझकर आपके दिन को 5 कार्यों तक सीमित रखते हैं।';

  @override
  String get taskCapBody =>
      'छोटी चेनें लंबी चेनों से बेहतर हैं। 10 में से 8 को छोड़कर हारने के एहसास से ज्यादा, 5 में से 3 को पूरा करके जीतने का एहसास होने की संभावना है।';

  @override
  String get taskCapBulletDone => 'पूर्ण किए गए कार्य चेन में गिने जाते हैं';

  @override
  String get taskCapBulletDoneBody =>
      'जिस दिन सभी 5 पूरे हो जाते हैं, आपकी चेन एक दिन बढ़ जाती है।';

  @override
  String get taskCapBulletMissed => 'छूटे हुए कार्य बाएं तरफ चले जाते हैं';

  @override
  String get taskCapBulletMissedBody =>
      'आधी रात को, अधूरे कार्य बाईं ओर सूची में आ जाते हैं। केवल वही दोबारा जोड़ें जो अभी भी मायने रखते हैं।';

  @override
  String get taskCapBulletFreeze => 'स्ट्रीक फ्रीज एक चूक को माफ करता है';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro आपको महीने में 2 स्ट्रीक फ्रीज देता है — वे एक छूटे हुए दिन को ढक देते हैं ताकि आपकी चेन जीवित रहे।';

  @override
  String get tasksHeader => 'कार्य';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'एक कार्य बीज जोड़ें';

  @override
  String get tasksCapReached =>
      '5/5 स्लॉट उपयोग में — नया बीज लगाने के लिए एक को पूरा करें।';

  @override
  String get tasksEmptyCta => 'अपना पहला बीज लगाएं — आज क्या मायने रखता है?';

  @override
  String get habitsHeader => 'आदतें';

  @override
  String habitsGrowing(String count) {
    return '$count growing';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Best $days d';
  }

  @override
  String get habitsPlantNew => 'नई आदत का अंकुर लगाएं';

  @override
  String get habitsPlantFirst => 'आदत लगाएं';

  @override
  String get habitsLocked => 'Pro आदत स्लॉट — और अंकुर लगाने के लिए अनलॉक करें';

  @override
  String get habitsCadence => 'रोज़ाना';

  @override
  String leftBehindBanner(String count) {
    return '$count missed — still in Left Behind';
  }

  @override
  String get leftBehindTap => 'दोबारा जोड़ने या छोड़ने के लिए टैप करें';

  @override
  String get leftBehindDismiss => 'खारिज करें';

  @override
  String get leftBehindTitle => 'छोड़ा हुआ';

  @override
  String get leftBehindEmpty => 'कुछ भी छोड़ा नहीं गया';

  @override
  String get leftBehindEmptyBody =>
      'कोई छूटा हुआ काम नहीं। हर बीज जो आप लगाते हैं उसकी देखभाल हो रही है। बगीचा साफ है।';

  @override
  String get leftBehindClearAll => 'सब साफ करें';

  @override
  String get leftBehindClearAllConfirm => 'सब छोड़ा हुआ साफ करें?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'This will permanently remove $count missed task(s). You can\'t undo this.';
  }

  @override
  String get leftBehindReAdd => 'Re-add today';

  @override
  String get leftBehindLetGo => 'छोड़ दें';

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
  String get medalsTitle => 'मेरे पदक';

  @override
  String get medalsTrophyRoom => 'ट्रॉफी रूम';

  @override
  String get medalsAllMedals => 'सभी पदक';

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
    return 'सभी $total पदकों की ओर प्रगति';
  }

  @override
  String get medalsShareCta => 'एक साझा करने योग्य कार्ड बनाएं';

  @override
  String get medalsEmptyTitle => 'इस श्रेणी में अभी कुछ नहीं है';

  @override
  String get medalsEmptyBody =>
      'ट्रॉफी रूम शुरू करने के लिए कोई कार्य पूरा करें या अंकुर की देखभाल करें।';

  @override
  String get medalSheetLocked => 'Pro पदक';

  @override
  String medalSheetEarned(String tier) {
    return 'अर्जित · $tier';
  }

  @override
  String get medalSheetUnlock => 'Pro से अनलॉक करें';

  @override
  String get medalSheetProgress => 'प्रगति';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Just $n more $unit to unlock.';
  }

  @override
  String get medalSheetAlmost => 'अनलॉक करने के लिए एक और कदम।';

  @override
  String get medalCategory => 'श्रेणी';

  @override
  String get medalShareOnSocials => 'सोशल मीडिया पर साझा करें';

  @override
  String get medalShareLater => 'बाद में';

  @override
  String get medalUnlocked => 'पदक अनलॉक हुआ';

  @override
  String get medalProgressTitle => 'प्रगति';

  @override
  String get historyTitle => 'पिछले 7 दिन';

  @override
  String historyThisWeek(String days) {
    return 'LAST $days DAYS';
  }

  @override
  String get historyDayByDay => 'दिन-प्रतिदिन';

  @override
  String get historyEmpty => 'Plant some seeds to see your week unfold.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'You finished $done of $total tasks. $perfect perfect day(s).';
  }

  @override
  String get historyUpsellTitle => 'अपना पूरा इतिहास देखें';

  @override
  String get historyUpsellBody =>
      'Pro 30 दिनों का इतिहास अनलॉक करता है। मुफ्त 7 दिखाता है।';

  @override
  String get historyPerfect => 'परफेक्ट';

  @override
  String get historyFrozen => 'फ्रोज़न';

  @override
  String get historyToday => 'आज';

  @override
  String get historyEmptyDay => 'उस दिन कोई बीज नहीं लगाया गया';

  @override
  String historyLeftBehindCount(String count) {
    return '$count left behind';
  }

  @override
  String get progressVitality => 'आज की जीवनशक्ति';

  @override
  String get progressVitalityEmpty => 'बगीचा शुरू करने के लिए एक बीज लगाएं।';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done of $total seeds planted today.';
  }

  @override
  String progressChainPill(String days) {
    return '$days दिन की चेन';
  }

  @override
  String get progressMetricCurrent => 'वर्तमान';

  @override
  String get progressMetricBest => 'सर्वश्रेष्ठ';

  @override
  String get progressMetricDone => 'पूर्ण';

  @override
  String get progressMetricPerfect => 'परफेक्ट';

  @override
  String get progressMetricHabits => 'आदतें';

  @override
  String get progressHabitBlooms => 'आदत के फूल';

  @override
  String get progressHabitBloomsSub =>
      'रोज़ पानी देने वाले अंकुरों के लिए स्ट्रीक मील का पत्थर।';

  @override
  String get progressNextBadge => 'अगला बैज';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned of $total';
  }

  @override
  String get progressPersonalActivity => 'व्यक्तिगत गतिविधि';

  @override
  String progressBrowseMonth(String month) {
    return 'Browsing $month. Tap \"Today\" to jump back to your live activity.';
  }

  @override
  String get progressJumpToToday => 'आज';

  @override
  String get progressCalendarLegend => 'गहरा = अधिक पूरा';

  @override
  String get progressCalendarBody =>
      'गहरा हरा एक परफेक्ट दिन का मतलब है। जैसे ही आप छोड़ते हैं रंग हल्का होता जाता है।';

  @override
  String get paywallTitle => 'चेन को न टूटने दें।';

  @override
  String get paywallSubtitle =>
      'ब्लूम ट्रैकर Pro आपको पूरा अनुशासन प्रणाली देता है।';

  @override
  String get paywallFeatures =>
      'All 5 habit slots, not just 3|Your full history, forever|The full medal set|Streak freeze every month|Weekly Receipt + share cards|Themes + more';

  @override
  String get paywallFeaturesBodies =>
      'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.|Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.|Unlock Legendary tier medals. The rarest badges are for the people who go all in.|2 streak freezes a month so a single bad day doesn\'t end your chain.|Beautiful share cards of your week. Post your chain, inspire someone else to start.|Unlock new accent colors and themes as we add them. Always free updates.';

  @override
  String get paywallYearly => 'वार्षिक';

  @override
  String get paywallYearlyCaption => 'सर्वोत्तम मूल्य · लगभग 2.50 डॉलर/माह';

  @override
  String get paywallYearlyBadge => '35% बचाएं';

  @override
  String get paywallMonthly => 'मासिक';

  @override
  String get paywallMonthlyCaption => 'मासिक बिल · कभी भी रद्द करें';

  @override
  String paywallStartCta(String price) {
    return 'Pro शुरू करें · $price/वर्ष';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Pro शुरू करें · $price/माह';
  }

  @override
  String get paywallRestore => 'खरीद बहाल करें';

  @override
  String get paywallTerms => 'शर्तें';

  @override
  String get paywallPrivacy => 'गोपनीयता';

  @override
  String get paywallNoRestore => 'इस खाते पर कोई पिछली खरीद नहीं मिली।';

  @override
  String get paywallRestoreLater => 'हम अगले सिंक पर आपकी खरीद बहाल कर देंगे।';

  @override
  String get paywallAlreadyPro => 'आप Pro पर हैं। आपके समर्थन के लिए धन्यवाद।';

  @override
  String get paywallHabitSlotHead =>
      'आपने अपनी सभी मुफ्त आदत स्लॉट का उपयोग कर लिया है। पूरा सेट अनलॉक करें ताकि हर अनुष्ठान लगाया जा सके।';

  @override
  String get paywallHistoryHead =>
      'अपना पूरा इतिहास देखें — हर परफेक्ट दिन, हर पदक, हर वापसी।';

  @override
  String get paywallMedalHead =>
      'सबसे दुर्लभ पदक केवल Pro के लिए हैं। आगे बढ़ते रहें — वे आपसे जितना आप सोचते हैं उससे कहीं अधिक करीब हैं।';

  @override
  String get settingsYourActivity => 'आपकी गतिविधि';

  @override
  String get settingsHelpInfo => 'मदद और जानकारी';

  @override
  String get settingsAccount => 'खाता';

  @override
  String get settingsNurturingTools => 'देखभाल उपकरण';

  @override
  String get settingsReminders => 'रिमाइंडर';

  @override
  String get settingsWidgetSanctuary => 'विजेट सैंक्चुरी';

  @override
  String get settingsEcosystemSupport => 'पारिस्थितिकी समर्थन';

  @override
  String get settingsHowItWorks => 'यह कैसे काम करता है';

  @override
  String get settingsSignOut => 'साइन आउट';

  @override
  String get settingsProActive => 'सक्रिय';

  @override
  String get settingsProFree => 'मुफ्त स्तर';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsLanguageValue => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get firstRunGreeting => '5 कार्य। बस। इन्हें मायने रखने वाला बनाएं।';

  @override
  String get firstRunBody =>
      'अपना पहला बीज लगाएं — आज सबसे महत्वपूर्ण क्या है?';

  @override
  String get firstRunCta => 'अपना पहला बीज लगाएं';

  @override
  String get emptyStateClearAll => 'सब साफ करें';

  @override
  String get cancel => 'रद्द करें';

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
  String get shareCardSnapshot => 'आपके सैंक्चुरी का एक स्नैपशॉट';

  @override
  String get shareCardBody =>
      'The card above is exported as a PNG and sent to your share sheet. Post it on your story, send it to a friend, or print it as a sticker.';

  @override
  String get shareCardShareMyBloom => 'अपना फूल साझा करें';

  @override
  String get shareCardCouldNotShare => 'अभी साझा नहीं कर सकते';

  @override
  String shareCardProgressText(String year) {
    return 'मेरी ब्लूम ट्रैकर प्रगति — ब्लूम ट्रैकर पर $year।';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'मैंने अभी ब्लूम ट्रैकर पर \"$title\" पदक अनलॉक किया। $subtitle';
  }

  @override
  String get howItWorksTitle => 'यह कैसे काम करता है';

  @override
  String get howItWorksBody =>
      'ब्लूम ट्रैकर आपको अनुशासन की एक छोटी, अटूट चेन रखने में मदद करता है। बस।';

  @override
  String get howItWorksToday => 'आज टैब';

  @override
  String get howItWorksTodayBody =>
      'यह आपका घर है। यह 5 कार्य और आज के लिए निर्धारित आदतें दिखाता है। आधी रात तक पूरा करें, चेन बढ़ती है।';

  @override
  String get howItWorksCap => '5 कार्य सीमा ही फीचर है';

  @override
  String get howItWorksCapBody =>
      'हम आपको 6वां नहीं जोड़ने देते। यही पूरा मकसद है। छोटी चेनें लंबी चेनों से बेहतर हैं। पूर्ण कारण के लिए होम स्क्रीन पर \"?\" टैप करें।';

  @override
  String get howItWorksHabits => 'आदतें रोज़ की हैं, चेन हमेशा के लिए';

  @override
  String get howItWorksHabitsBody =>
      'आदतें (सुबह योग, पानी पीना) हमेशा रहती हैं। कार्य एक बार के होते हैं। दोनों एक ही स्ट्रीक को बढ़ाते हैं।';

  @override
  String get howItWorksLeftBehind => 'छूटे कार्य → बाईं ओर';

  @override
  String get howItWorksLeftBehindBody =>
      'आधी रात को, अधूरे कार्य बाईं ओर चले जाते हैं। केवल वही दोबारा जोड़ें जो अभी भी मायने रखते हैं। बाकी को शांति से छोड़ दिया जाता है।';

  @override
  String get howItWorksProgress => 'प्रगति टैब';

  @override
  String get howItWorksProgressBody =>
      'स्ट्रीक, कैलेंडर, पदक, इतिहास — समय के साथ आप कैसा कर रहे हैं इसका सब कुछ। यहाँ कुछ भी जरूरी नहीं है।';

  @override
  String get howItWorksYou => 'आप टैब';

  @override
  String get howItWorksYouBody => 'आपका खाता, सेटिंग्स, साइन आउट। बस।';

  @override
  String get howItWorksRule => 'नियम: 5 छोटी चीज़ें, हर दिन, कोई बहाना नहीं।';

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


