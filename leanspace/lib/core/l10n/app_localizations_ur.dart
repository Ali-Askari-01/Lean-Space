// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'بلوم ٹریکر';

  @override
  String get tabToday => 'آج';

  @override
  String get tabProgress => 'پیشرفت';

  @override
  String get tabYou => 'آپ';

  @override
  String get navMyDay => 'میرا دن';

  @override
  String get navSettings => 'ترتیبات';

  @override
  String get navHelp => 'مدد اور سپورٹ';

  @override
  String get navHistory => 'آخری 7 دن';

  @override
  String get navLeftBehind => 'پیچھے چھوڑیں';

  @override
  String get navInsights => 'آپ کی پیشرفت';

  @override
  String get navMedals => 'میرے تمغے';

  @override
  String get navManagePro => 'پرو سبسکرپشن کا انتظام کریں';

  @override
  String get navPaywall => 'بلوم ٹریکر پرو';

  @override
  String get greetingLateNight => 'رات گئی، ابھی بھی جاگ رہے ہیں';

  @override
  String get greetingMorning => 'صبح بخیر، سورج!';

  @override
  String get greetingAfternoon => 'دوپہر بخیر، دوست';

  @override
  String get greetingEvening => 'شام بخیر، چیمپئن';

  @override
  String get greetingNight => 'آرام سے سو رہے ہیں، نگہبان؟';

  @override
  String todayTasksCount(String done, String total) {
    return 'آج · $total میں سے $done کام';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$total میں سے $done عادات';
  }

  @override
  String get todayChainGrows => 'زنجیر آپ کے مکمل کرنے سے بڑھتی ہے';

  @override
  String get todayChainComplete => 'زنجیر مکمل · کل باغ کی دیکھ بھال کریں';

  @override
  String get taskCapInfo => '5 کام کی حد کیوں؟';

  @override
  String get taskCapDiscipline => 'ڈیزائن سے پہلے نظم و ضبط';

  @override
  String get taskCapTitle =>
      'ہم آپ کے دن کو جان بوجھ کر 5 کام تک محدود رکھتے ہیں۔';

  @override
  String get taskCapBody =>
      'چھوٹی زنجیریں لمبی زنجیروں سے بہتر ہیں۔ آپ 5 میں سے 3 کام مکمل کر کے جیتنے کا احساس کرنے کا امکان 10 میں سے 8 کو چھوڑ کر ہارنے کے احساس سے زیادہ ہے۔';

  @override
  String get taskCapBulletDone => 'مکمل شدہ کام آپ کی زنجیر میں شامل ہوتے ہیں';

  @override
  String get taskCapBulletDoneBody =>
      'وہ دن جب تمام 5 مکمل ہو جائیں آپ کی زنجیر میں ایک دن کا اضافہ کرتا ہے۔';

  @override
  String get taskCapBulletMissed => 'چھوٹے ہوئے کام بائیں طرف چلے جاتے ہیں';

  @override
  String get taskCapBulletMissedBody =>
      'رات 12 بجے، نامکمل کام بائیں طرف کی فہرست میں آ جاتے ہیں۔ صرف وہی دوبارہ شامل کریں جو ابھی بھی اہم ہوں۔';

  @override
  String get taskCapBulletFreeze => 'اسٹریک فریز ایک چھوٹ کی معافی دیتا ہے';

  @override
  String get taskCapBulletFreezeBody =>
      'پرو آپ کو ماہانہ 2 اسٹریک فریز دیتا ہے — وہ ایک چھوٹے ہوئے دن کو ڈھانپتے ہیں تاکہ آپ کی زنجیر زندہ رہے۔';

  @override
  String get tasksHeader => 'کام';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'کام کا بیج شامل کریں';

  @override
  String get tasksCapReached =>
      '5/5 جگہیں استعمال ہوئیں — نیا بیج لگانے کے لیے ایک کو مکمل کریں۔';

  @override
  String get tasksEmptyCta => 'اپنا پہلا بیج لگائیں — آج کیا اہم ہے؟';

  @override
  String get habitsHeader => 'عادات';

  @override
  String habitsGrowing(String count) {
    return '$count growing';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Best $days d';
  }

  @override
  String get habitsPlantNew => 'نئی عادت کا پودا لگائیں';

  @override
  String get habitsPlantFirst => 'عادت لگائیں';

  @override
  String get habitsLocked => 'پرو عادت کی جگہ — مزید پودے لگانے کے لیے کھولیں';

  @override
  String get habitsCadence => 'روزانہ';

  @override
  String leftBehindBanner(String count) {
    return '$count missed — still in Left Behind';
  }

  @override
  String get leftBehindTap => 'دوبارہ شامل کرنے یا چھوڑنے کے لیے ٹیپ کریں';

  @override
  String get leftBehindDismiss => 'ختم کریں';

  @override
  String get leftBehindTitle => 'پیچھے چھوڑیں';

  @override
  String get leftBehindEmpty => 'کچھ بھی پیچھے نہیں چھوڑا';

  @override
  String get leftBehindEmptyBody =>
      'کوئی چھوٹا ہوا کام نہیں۔ ہر بیج جو آپ لگاتے ہیں اس کی دیکھ بھال ہو رہی ہے۔ باغ صاف ہے۔';

  @override
  String get leftBehindClearAll => 'سب صاف کریں';

  @override
  String get leftBehindClearAllConfirm => 'سب کچھ صاف کریں؟';

  @override
  String leftBehindClearAllBody(String count) {
    return 'This will permanently remove $count missed task(s). You can\'t undo this.';
  }

  @override
  String get leftBehindReAdd => 'Re-add today';

  @override
  String get leftBehindLetGo => 'چھوڑ دو';

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
  String get medalsTitle => 'میرے تمغے';

  @override
  String get medalsTrophyRoom => 'ٹرافی روم';

  @override
  String get medalsAllMedals => 'تمام تمغے';

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
    return 'تمام $total تمغوں کی طرف پیشرفت';
  }

  @override
  String get medalsShareCta => 'شیئر کرنے کے قابل کارڈ بنائیں';

  @override
  String get medalsEmptyTitle => 'اس زمرے میں ابھی کچھ نہیں ہے';

  @override
  String get medalsEmptyBody =>
      'ٹرافی روم شروع کرنے کے لیے کوئی کام مکمل کریں یا پودے کی دیکھ بھال کریں۔';

  @override
  String get medalSheetLocked => 'پرو تمغہ';

  @override
  String medalSheetEarned(String tier) {
    return 'حاصل · $tier';
  }

  @override
  String get medalSheetUnlock => 'پرو سے کھولیں';

  @override
  String get medalSheetProgress => 'پیشرفت';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Just $n more $unit to unlock.';
  }

  @override
  String get medalSheetAlmost => 'کھولنے کے لیے ایک اور قدم۔';

  @override
  String get medalCategory => 'زمرہ';

  @override
  String get medalShareOnSocials => 'سوشل میڈیا پر شیئر کریں';

  @override
  String get medalShareLater => 'بعد میں';

  @override
  String get medalUnlocked => 'تمغہ کھلا';

  @override
  String get medalProgressTitle => 'پیشرفت';

  @override
  String get historyTitle => 'آخری 7 دن';

  @override
  String historyThisWeek(String days) {
    return 'LAST $days DAYS';
  }

  @override
  String get historyDayByDay => 'دن بہ دن';

  @override
  String get historyEmpty => 'Plant some seeds to see your week unfold.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'You finished $done of $total tasks. $perfect perfect day(s).';
  }

  @override
  String get historyUpsellTitle => 'اپنا مکمل تاریخ دیکھیں';

  @override
  String get historyUpsellBody =>
      'پرو 30 دن کی تاریخ کھولتا ہے۔ مفت 7 دکھاتا ہے۔';

  @override
  String get historyPerfect => 'کامل';

  @override
  String get historyFrozen => 'منجمد';

  @override
  String get historyToday => 'آج';

  @override
  String get historyEmptyDay => 'اس دن کوئی بیج نہیں لگایا گیا';

  @override
  String historyLeftBehindCount(String count) {
    return '$count left behind';
  }

  @override
  String get progressVitality => 'آج کی جان';

  @override
  String get progressVitalityEmpty => 'باغ شروع کرنے کے لیے ایک بیج لگائیں۔';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done of $total seeds planted today.';
  }

  @override
  String progressChainPill(String days) {
    return '$days دن کی زنجیر';
  }

  @override
  String get progressMetricCurrent => 'حالیہ';

  @override
  String get progressMetricBest => 'بہترین';

  @override
  String get progressMetricDone => 'مکمل';

  @override
  String get progressMetricPerfect => 'کامل';

  @override
  String get progressMetricHabits => 'عادات';

  @override
  String get progressHabitBlooms => 'عادت کے پھول';

  @override
  String get progressHabitBloomsSub =>
      'روزانہ پانی دیے جانے والے پودوں کے لیے اسٹریک سنگ میلز۔';

  @override
  String get progressNextBadge => 'اگلا بیج';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned of $total';
  }

  @override
  String get progressPersonalActivity => 'ذاتی سرگرمی';

  @override
  String progressBrowseMonth(String month) {
    return 'Browsing $month. Tap \"Today\" to jump back to your live activity.';
  }

  @override
  String get progressJumpToToday => 'آج';

  @override
  String get progressCalendarLegend => 'گہرا = زیادہ مکمل';

  @override
  String get progressCalendarBody =>
      'گہرا سبز ایک کامل دن کا مطلب ہے۔ جیسے جیسے آپ چھوڑتے ہیں رنگ ہلکا ہوتا جاتا ہے۔';

  @override
  String get paywallTitle => 'زنجیر کو نہ ٹوٹنے دیں۔';

  @override
  String get paywallSubtitle =>
      'بلوم ٹریکر پرو آپ کو مکمل نظم و ضبط کا نظام دیتا ہے۔';

  @override
  String get paywallFeatures =>
      'All 5 habit slots, not just 3|Your full history, forever|The full medal set|Streak freeze every month|Weekly Receipt + share cards|Themes + more';

  @override
  String get paywallFeaturesBodies =>
      'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.|Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.|Unlock Legendary tier medals. The rarest badges are for the people who go all in.|2 streak freezes a month so a single bad day doesn\'t end your chain.|Beautiful share cards of your week. Post your chain, inspire someone else to start.|Unlock new accent colors and themes as we add them. Always free updates.';

  @override
  String get paywallYearly => 'سالانہ';

  @override
  String get paywallYearlyCaption => 'بہترین قیمت · تقریباً 2.50 ڈالر فی ماہ';

  @override
  String get paywallYearlyBadge => '35٪ بچائیں';

  @override
  String get paywallMonthly => 'ماہانہ';

  @override
  String get paywallMonthlyCaption => 'ماہانہ بلنگ · کسی بھی وقت منسوخ کریں';

  @override
  String paywallStartCta(String price) {
    return 'پرو شروع کریں · $price/سال';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'پرو شروع کریں · $price/ماہ';
  }

  @override
  String get paywallRestore => 'خریداری بحال کریں';

  @override
  String get paywallTerms => 'شرائط';

  @override
  String get paywallPrivacy => 'رازداری';

  @override
  String get paywallNoRestore => 'اس اکاؤنٹ پر کوئی پچھلی خریداری نہیں ملی۔';

  @override
  String get paywallRestoreLater =>
      'ہم اگلے سنک پر آپ کی خریداری بحال کر دیں گے۔';

  @override
  String get paywallAlreadyPro => 'آپ پرو پر ہیں۔ آپ کی حمایت کا شکریہ۔';

  @override
  String get paywallHabitSlotHead =>
      'آپ نے اپنی تمام مفت عادت کی جگہیں استعمال کر لی ہیں۔ مکمل سیٹ کھولیں تاکہ ہر رسم کو لگایا جا سکے۔';

  @override
  String get paywallHistoryHead =>
      'اپنا مکمل تاریخ دیکھیں — ہر کامل دن، ہر تمغہ، ہر واپسی۔';

  @override
  String get paywallMedalHead =>
      'نادر ترین تمغے صرف پرو کے لیے ہیں۔ آگے بڑھتے رہیں — وہ آپ سے زیادہ قریب ہیں جتنا آپ سوچتے ہیں۔';

  @override
  String get settingsYourActivity => 'آپ کی سرگرمی';

  @override
  String get settingsHelpInfo => 'مدد اور معلومات';

  @override
  String get settingsAccount => 'اکاؤنٹ';

  @override
  String get settingsNurturingTools => 'دیکھ بھال کے اوزار';

  @override
  String get settingsReminders => 'یاد دہانیاں';

  @override
  String get settingsWidgetSanctuary => 'ویجیٹ سینکچری';

  @override
  String get settingsEcosystemSupport => 'ماحولیاتی معاونت';

  @override
  String get settingsHowItWorks => 'یہ کیسے کام کرتا ہے';

  @override
  String get settingsSignOut => 'سائن آؤٹ';

  @override
  String get settingsProActive => 'فعال';

  @override
  String get settingsProFree => 'مفت ٹائر';

  @override
  String get settingsLanguage => 'زبان';

  @override
  String get settingsLanguageValue => 'سسٹم ڈیفالٹ';

  @override
  String get firstRunGreeting => '5 کام۔ بس۔ ان کی قدر رکھیں۔';

  @override
  String get firstRunBody =>
      'اپنا پہلا بیج لگائیں — آج سب سے زیادہ اہم کیا ہے؟';

  @override
  String get firstRunCta => 'اپنا پہلا بیج لگائیں';

  @override
  String get emptyStateClearAll => 'سب صاف کریں';

  @override
  String get cancel => 'منسوخ کریں';

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
  String get shareCardSnapshot => 'آپ کے سینکچری کا ایک منظر';

  @override
  String get shareCardBody =>
      'The card above is exported as a PNG and sent to your share sheet. Post it on your story, send it to a friend, or print it as a sticker.';

  @override
  String get shareCardShareMyBloom => 'اپنا پھول شیئر کریں';

  @override
  String get shareCardCouldNotShare => 'ابھی شیئر نہیں کر سکتے';

  @override
  String shareCardProgressText(String year) {
    return 'میری بلوم ٹریکر پیشرفت — بلوم ٹریکر پر $year۔';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'میں نے ابھی بلوم ٹریکر پر \"$title\" تمغہ کھولا ہے۔ $subtitle';
  }

  @override
  String get howItWorksTitle => 'یہ کیسے کام کرتا ہے';

  @override
  String get howItWorksBody =>
      'بلوم ٹریکر آپ کو نظم و ضبط کی ایک چھوٹی، نہ ٹوٹنے والی زنجیر رکھنے میں مدد کرتا ہے۔ بس۔';

  @override
  String get howItWorksToday => 'آج کا ٹیب';

  @override
  String get howItWorksTodayBody =>
      'یہ آپ کا گھر ہے۔ یہ 5 کام اور آج کے لیے مقرر کردہ عادات دکھاتا ہے۔ رات 12 بجے تک مکمل کریں، زنجیر بڑھتی ہے۔';

  @override
  String get howItWorksCap => '5 کام کی حد ہی فیچر ہے';

  @override
  String get howItWorksCapBody =>
      'ہم آپ کو 6واں شامل نہیں کرنے دیتے۔ یہی پورا مقصد ہے۔ چھوٹی زنجیریں لمبی زنجیروں سے بہتر ہیں۔ مکمل وجہ کے لیے ہوم اسکرین پر \"?\" ٹیپ کریں۔';

  @override
  String get howItWorksHabits => 'عادات روزانہ ہیں، زنجیر ہمیشہ کے لیے';

  @override
  String get howItWorksHabitsBody =>
      'عادات (صبح یوگا، پانی پینا) ہمیشہ رہتی ہیں۔ کام ایک بار کے ہوتے ہیں۔ دونوں ایک ہی اسٹریک کو بڑھاتے ہیں۔';

  @override
  String get howItWorksLeftBehind => 'چھوٹے کام → بائیں طرف';

  @override
  String get howItWorksLeftBehindBody =>
      'رات 12 بجے، نامکمل کام بائیں طرف چلے جاتے ہیں۔ صرف وہی دوبارہ شامل کریں جو ابھی بھی اہم ہو۔ باقی کو خاموشی سے چھوڑ دیا جاتا ہے۔';

  @override
  String get howItWorksProgress => 'پیشرفت کا ٹیب';

  @override
  String get howItWorksProgressBody =>
      'اسٹریک، کیلنڈر، تمغے، تاریخ — وقت کے ساتھ آپ کیسا کر رہے ہیں اس کا سب کچھ۔ یہاں کوئی فوری کام نہیں ہے۔';

  @override
  String get howItWorksYou => 'آپ کا ٹیب';

  @override
  String get howItWorksYouBody => 'آپ کا اکاؤنٹ، ترتیبات، سائن آؤٹ۔ بس۔';

  @override
  String get howItWorksRule => 'اصول: 5 چھوٹی چیزیں، ہر روز، کوئی بہانہ نہیں۔';

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
