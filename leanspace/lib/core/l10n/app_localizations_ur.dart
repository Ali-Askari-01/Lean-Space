// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

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
  String get navHelp => 'مدد و معاونت';

  @override
  String get navHistory => 'آخری 7 دن';

  @override
  String get navLeftBehind => 'پیچھے چھوڑے گئے';

  @override
  String get navInsights => 'آپ کی پیشرفت';

  @override
  String get navMedals => 'میرے تمغے';

  @override
  String get navManagePro => 'Pro سبسکرپشن کا انتظام کریں';

  @override
  String get navPaywall => 'Daily Stitch Pro';

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
    return 'آج · $done / $total کام مکمل';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done / $total عادات';
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
      'چھوٹی زنجیریں لمبی زنجیروں سے بہتر ہیں۔ آپ 5 میں سے 3 کام مکمل کر کے جیتنے کا احساس محسوس کرنے کا امکان 10 میں سے 8 کو چھوڑ کر ہارنے کے احساس سے زیادہ ہے۔';

  @override
  String get taskCapBulletDone => 'مکمل شدہ کام آپ کی زنجیر میں شامل ہوتے ہیں';

  @override
  String get taskCapBulletDoneBody =>
      'وہ دن جب تمام 5 مکمل ہو جائیں آپ کی زنجیر میں ایک دن کا اضافہ کرتا ہے۔';

  @override
  String get taskCapBulletMissed =>
      'چھوٹے ہوئے کام Left Behind میں چلے جاتے ہیں';

  @override
  String get taskCapBulletMissedBody =>
      'رات 12 بجے، نامکمل کام Left Behind میں آ جاتے ہیں۔ صرف وہی دوبارہ شامل کریں جو ابھی بھی اہم ہوں۔';

  @override
  String get taskCapBulletFreeze => 'اسٹریک فریز ایک چھوٹ کی معافی دیتا ہے';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro آپ کو ماہانہ 2 اسٹریک فریز دیتا ہے — وہ ایک چھوٹے ہوئے دن کو ڈھانپتے ہیں تاکہ آپ کی زنجیر زندہ رہے۔';

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
    return '$count بڑھ رہی ہیں';
  }

  @override
  String habitsBestStreak(String days) {
    return 'بہترین $days دن';
  }

  @override
  String get habitsPlantNew => 'نئی عادت کا پودا لگائیں';

  @override
  String get habitsPlantFirst => 'عادت لگائیں';

  @override
  String get habitsLocked => 'Pro عادت کی جگہ — مزید پودے لگانے کے لیے کھولیں';

  @override
  String get habitsSlotsFull => 'تمام عادت کی جگہیں فل ہیں۔';

  @override
  String habitsStreakDays(String days) {
    return '$daysدن';
  }

  @override
  String get habitsCadence => 'روزانہ';

  @override
  String leftBehindBanner(String count) {
    return '$count چھوٹے گئے — ابھی بھی Left Behind میں ہیں';
  }

  @override
  String get leftBehindTap => 'دوبارہ شامل کرنے یا چھوڑنے کے لیے ٹیپ کریں';

  @override
  String get leftBehindDismiss => 'ختم کریں';

  @override
  String get leftBehindTitle => 'پیچھے چھوڑے گئے';

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
    return 'یہ $count چھوٹے ہوئے کام کو مستقل طور پر ہٹا دے گا۔ آپ اسے واپس نہیں کر سکتے۔';
  }

  @override
  String get leftBehindReAdd => 'آج دوبارہ شامل کریں';

  @override
  String get leftBehindReAddButton => 'دوبارہ شامل کریں';

  @override
  String get leftBehindAddedToToday => 'آج شامل کر دیا گیا';

  @override
  String get leftBehindLetGo => 'چھوڑ دو';

  @override
  String get leftBehindHeader => 'LEFT BEHIND';

  @override
  String get leftBehindMissedTasks => 'چھوٹے ہوئے کام';

  @override
  String get leftBehindWaitingOne => '1 کام آپ کا منتظر ہے۔';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count کام آپ کا منتظر ہیں۔';
  }

  @override
  String get leftBehindBody =>
      'کام کو آج واپس لانے کے لیے دوبارہ شامل کریں، یا چھوڑ دیں۔ دوبارہ شامل کرنے سے آپ کی اسٹریک زندہ رہتی ہے۔';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" آپ کے دن میں واپس آ گیا۔';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return '\"$task\" ہٹا دیا گیا';
  }

  @override
  String get leftBehindClearedSnack => 'Left Behind صاف ہو گیا';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'کل · $date';
  }

  @override
  String streakAtRisk(String count) {
    return 'آج کے لیے $count کام باقی ہیں';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'آخری موقع — $count کام ابھی بھی کھلے ہیں';
  }

  @override
  String get streakAtRiskBody => 'رات قریب ہے۔ زنجیر ان پر منحصر ہے۔';

  @override
  String get streakAtRiskBodyLow =>
      'ابھی بھی وقت ہے۔ صاف دن آپ کی اسٹریک بڑھاتا ہے۔';

  @override
  String get streakAtRiskFreeze => 'کل چھوٹ گیا — اسٹریک فریز استعمال کریں؟';

  @override
  String get streakFreezeUse => 'فریز استعمال کریں';

  @override
  String get streakFreezeUseForYesterday =>
      'کل کے لیے ماہانہ اسٹریک فریز استعمال کریں';

  @override
  String get streakFreezeAppliedYesterday =>
      'کل کے لیے اسٹریک فریز لاگو ہو گیا۔';

  @override
  String get chainBrokenTitle => 'زنجیر ٹوٹ گئی۔ کوئی بات نہیں۔';

  @override
  String get chainBrokenBody =>
      'ہر لمبی زنجیر ایک بار ٹوٹتی ہے۔ جو اہم ہے وہ ہے آج آپ کیا لگاتے ہیں۔ ایک کامل دن اگلی زنجیر شروع کرتا ہے۔';

  @override
  String get chainBrokenCta => 'آج پر واپس آئیں';

  @override
  String get chainBrokenPlantFirst => 'آج کا پہلا بیج لگائیں';

  @override
  String get chainBrokenCheck => 'پہلے Left Behind چیک کریں';

  @override
  String get chainBrokenBestChain => 'بہترین زنجیر';

  @override
  String get chainBrokenTasksDone => 'کام مکمل';

  @override
  String get chainBrokenSprouts => 'پودے';

  @override
  String get chainRecoveryFreshStart => 'نئی شروعات';

  @override
  String get medalsTitle => 'میرے تمغے';

  @override
  String get medalsTrophyRoom => 'ٹرافی روم';

  @override
  String get medalsAllMedals => 'تمام تمغے';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned / $total تمغے حاصل';
  }

  @override
  String get medalsTrophyEmpty => 'آپ کا پہلا بیج ایک کام دور ہے';

  @override
  String get medalsTrophyFirst =>
      'آپ نے اپنا پہلا تمغہ حاصل کر لیا — جاری رکھیں';

  @override
  String medalsTrophyMany(String earned) {
    return 'آپ کے ٹرافی روم میں $earned تمغے';
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
  String get medalSheetLocked => 'Pro تمغہ';

  @override
  String medalSheetEarned(String tier) {
    return 'حاصل · $tier';
  }

  @override
  String get medalSheetUnlock => 'Pro سے کھولیں';

  @override
  String get medalSheetProgress => 'پیشرفت';

  @override
  String medalSheetHint(String n, String unit) {
    return 'صرف $n مزید $unit کھولنے کے لیے۔';
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
  String get historyFullTitle => 'مکمل تاریخ';

  @override
  String get historyLoadError => 'تاریخ لو نہیں ہو سکی۔';

  @override
  String get historyFullCalendar => 'مکمل کیلنڈر';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% مکمل';
  }

  @override
  String historyThisWeek(String days) {
    return 'آخری $days دن';
  }

  @override
  String get historyDayByDay => 'دن بہ دن';

  @override
  String get historyEmpty => 'اپنا ہفتہ دیکھنے کے لیے کچھ بیج لگائیں۔';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'آپ نے $total میں سے $done کام مکمل کیے۔ $perfect کامل دن۔';
  }

  @override
  String get historyUpsellTitle => 'اپنا مکمل تاریخ دیکھیں';

  @override
  String get historyUpsellBody =>
      'Pro 30 دن کی تاریخ کھولتا ہے۔ مفت 7 دکھاتا ہے۔';

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
    return '$count پیچھے چھوڑے گئے';
  }

  @override
  String get progressVitality => 'آج کی جان';

  @override
  String get progressVitalityEmpty => 'باغ شروع کرنے کے لیے ایک بیج لگائیں۔';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done / $total بیج آج لگائے گئے۔';
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
    return '$earned / $total';
  }

  @override
  String get progressPersonalActivity => 'ذاتی سرگرمی';

  @override
  String progressBrowseMonth(String month) {
    return '$month براؤز کر رہے ہیں۔ اپنی لائیو سرگرمی پر واپس جانے کے لیے \"آج\" ٹیپ کریں۔';
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
      'Daily Stitch Pro آپ کو مکمل نظم و ضبط کا نظام دیتا ہے۔';

  @override
  String get paywallFeatures =>
      'تمام 5 عادت کی جگہیں، صرف 3 نہیں|آپ کی مکمل تاریخ، ہمیشہ کے لیے|مکمل تمغوں کا مجموعہ|ہر ماہ اسٹریک فریز|ہفتہ وار رسید + شیئر کارڈ|تھیمز + مزید';

  @override
  String get paywallFeaturesBodies =>
      'مفت میں صرف 3 ملتے ہیں۔ Pro تمام پانچ کھولتا ہے تاکہ آپ کی مکمل روزانہ رسم یہاں رہ سکے۔|ہر وہ دن براؤز کریں جو آپ نے مکمل کیا — صرف آخری 7 نہیں۔ سالوں کو پیچھے دیکھیں، ہفتوں کو نہیں۔|Legendary ٹائر کے تمغے کھولیں۔ سب سے نادر بیج ان لوگوں کے لیے ہیں جو پوری لگن لگاتے ہیں۔|ہر ماہ 2 اسٹریک فریز تاکہ ایک برا دن آپ کی زنجیر ختم نہ کرے۔|اپنے ہفتے کے خوبصورت شیئر کارڈ۔ اپنی زنجیر پوسٹ کریں، کسی اور کو شروع کرنے کی ترغیب دیں۔|نئے رنگ اور تھیمز کھولیں جیسے ہم شامل کرتے ہیں۔ ہمیشہ مفت اپ ڈیٹس۔';

  @override
  String get paywallYearly => 'سالانہ';

  @override
  String get paywallYearlyCaption => 'بہترین قیمت · تقریباً \$2.50/ماہ';

  @override
  String get paywallYearlyBadge => '35% بچائیں';

  @override
  String get paywallMonthly => 'ماہانہ';

  @override
  String get paywallMonthlyCaption => 'ماہانہ بلنگ · کسی بھی وقت منسوخ کریں';

  @override
  String paywallStartCta(String price) {
    return 'Pro شروع کریں · $price/سال';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Pro شروع کریں · $price/ماہ';
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
  String get paywallAlreadyPro => 'آپ Pro پر ہیں۔ آپ کی حمایت کا شکریہ۔';

  @override
  String get paywallHabitSlotHead =>
      'آپ نے اپنی تمام مفت عادت کی جگہیں استعمال کر لی ہیں۔ مکمل سیٹ کھولیں تاکہ ہر رسم کو لگایا جا سکے۔';

  @override
  String get paywallHistoryHead =>
      'اپنا مکمل تاریخ دیکھیں — ہر کامل دن، ہر تمغہ، ہر واپسی۔';

  @override
  String get paywallMedalHead =>
      'نادر ترین تمغے صرف Pro کے لیے ہیں۔ آگے بڑھتے رہیں — وہ آپ سے زیادہ قریب ہیں جتنا آپ سوچتے ہیں۔';

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
  String get settingsSignOutConfirm => 'Are you sure you want to sign out?';

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
  String get intentionTitle1 => 'آئیے نئی نیت لگائیں!';

  @override
  String get intentionBody1 =>
      'ہر طاقتور جنگل ایک چھوٹے سے انتخاب سے شروع ہوتا ہے۔ مجھے بتائیں آج ہم کیا پال رہے ہیں؟';

  @override
  String get intentionTitle2 => 'آج ہم کیا اگائیں؟';

  @override
  String get intentionBody2 =>
      'چھوٹے بیج، دیکھ بھال سے، لمبے درخت بن جاتے ہیں۔ ابھی سب سے اہم انتخاب کریں۔';

  @override
  String get intentionTitle3 => 'ایک بیج۔ ایک سانس۔ شروع کریں۔';

  @override
  String get intentionBody3 =>
      'آپ کو پورا جنگل ایک ساتھ نہیں لگانا — صرف اگلا صحح کام کریں۔';

  @override
  String get intentionTitle4 => 'اگلے چھوٹے قدم کی پرورش کریں۔';

  @override
  String get intentionBody4 =>
      'مستقبل کا آپ اس پانچ منٹ میں کیے گئے انتخابوں سے بنتا ہے۔ ایک مہربان انتخاب کیا ہے؟';

  @override
  String get intentionTitle5 => 'منتخب کریں آپ کیا بننا چاہتے ہیں۔';

  @override
  String get intentionBody5 =>
      'کام بیج ہیں، عادات پودے ہیں۔ مل کر وہ جنگل بناتے ہیں جس پر آپ کو فخر ہے۔';

  @override
  String get intentionTitle6 => 'کچھ ایسی چیز لگائیں جو یاد رکھنے کے قابل ہو۔';

  @override
  String get intentionBody6 =>
      'ہر دن بڑا محسوس نہیں ہوتا۔ پانی دیا گیا بیج بھی شمار ہوتا ہے۔ آئیے ایک نام دیتے ہیں۔';

  @override
  String get intentionTitle7 => 'آج کو تھوڑا بہادر بنائیں۔';

  @override
  String get intentionBody7 =>
      'ہمت جمع ہوتی ہے۔ وہ بیج چنیں جو آپ ٹال رہے ہیں — اس کا نام لینا بھی اسے آگے بڑھاتا ہے۔';

  @override
  String get intentionTitle8 => 'بیج سے پہلے زمین کی دیکھ بھال کریں۔';

  @override
  String get intentionBody8 =>
      'کون سا ذہنیت، ٹول، یا چھوٹی رسم اس کام کو آسان بنائے گی؟ نوٹس میں شامل کریں۔';

  @override
  String get shareCardSnapshot => 'آپ کے سینکچری کا ایک منظر';

  @override
  String get shareCardBody =>
      'اوپر کا کارڈ PNG کے طور پر ایکسپورٹ ہوتا ہے اور آپ کی شیئر شیٹ میں بھیجا جاتا ہے۔ اسے اپنی اسٹوری پر پوسٹ کریں، دوست کو بھیجیں، یا اسٹکر کے طور پر پرنٹ کریں۔';

  @override
  String get shareCardShareMyBloom => 'اپنا پھول شیئر کریں';

  @override
  String get shareCardCouldNotShare => 'ابھی شیئر نہیں کر سکتے';

  @override
  String shareCardProgressText(String year) {
    return 'میری Daily Stitch پیشرفت — Daily Stitch پر $year۔';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'میں نے ابھی Daily Stitch پر \"$title\" تمغہ کھولا ہے۔ $subtitle';
  }

  @override
  String get howItWorksTitle => 'یہ کیسے کام کرتا ہے';

  @override
  String get howItWorksBody =>
      'Daily Stitch آپ کو نظم و ضبط کی ایک چھوٹی، نہ ٹوٹنے والی زنجیر رکھنے میں مدد کرتا ہے۔ بس۔';

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
  String get howItWorksLeftBehind => 'چھوٹے کام → Left Behind';

  @override
  String get howItWorksLeftBehindBody =>
      'رات 12 بجے، نامکمل کام Left Behind میں چلے جاتے ہیں۔ صرف وہی دوبارہ شامل کریں جو ابھی بھی اہم ہو۔ باقی کو خاموشی سے چھوڑ دیا جاتا ہے۔';

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
  String get commonRetry => 'دوبارہ کوشش کریں';

  @override
  String get commonBack => 'واپس';

  @override
  String get commonDismiss => 'ختم کریں';

  @override
  String get commonCancel => 'منسوخ کریں';

  @override
  String get commonClose => 'بند کریں';

  @override
  String get commonSend => 'بھیجیں';

  @override
  String get commonCopy => 'کاپی کریں';

  @override
  String get commonShowLess => 'کم دکھائیں';

  @override
  String get commonViewFull => 'مکمل نوٹس دیکھیں';

  @override
  String get commonEdit => 'ترمیم کریں';

  @override
  String get commonDelete => 'حذف کریں';

  @override
  String get commonDone => 'مکمل';

  @override
  String get commonError => 'کچھ غلط ہو گیا';

  @override
  String get commonPageNotFound => 'صفحہ نہیں ملا';

  @override
  String get commonHome => 'گھر';

  @override
  String get commonUnknownError => 'نامعلوم راؤٹنگ خرابی';

  @override
  String get commonSettingsTooltip => 'ترتیبات';

  @override
  String get commonHowThisWorks => 'یہ کیسے کام کرتا ہے';

  @override
  String get myDayReminderSet => 'یاد دہانی لگائی گئی';

  @override
  String get myDayPreparationNotes => 'تیاری کے نوٹس';

  @override
  String get onboardingSkip => 'چھوڑیں';

  @override
  String get onboardingNext => 'اگلا';

  @override
  String get onboardingEnterSanctuary => 'سینکچری میں داخل ہوں';

  @override
  String get onboardingIntroduction => 'تعارف';

  @override
  String get onboardingGrowYourForest => 'اپنا جنگل بڑھائیں';

  @override
  String get onboardingPage1Title => 'اپنے نگہبان سے ملیں۔';

  @override
  String get onboardingPage1Body =>
      'آپ کے ذاتی سینکچری میں خوش آمدید۔ یہاں، آپ کی ترقی آپ کے جنگل کی زندگی میں جھلکتی ہے۔';

  @override
  String get onboardingPage2Title => 'بیج لگائیں۔ انہیں بڑھتا دیکھیں۔';

  @override
  String get onboardingPage2Body =>
      'ہر کام ایک چھوٹا بیج ہے۔ ہر عادت ایک پودا ہے جس کی آپ روزانہ دیکھ بھال کرتے ہیں۔ مل کر یہ نظم و ضبط کا جنگل بناتے ہیں۔';

  @override
  String get onboardingPage3Title => 'پانچ کام۔ ایک زنجیر۔';

  @override
  String get onboardingPage3Body =>
      'آپ روزانہ صرف 5 بیج لگا سکتے ہیں۔ یہ حد آپ کو واقعی اہم چیز پر توجہ دینے پر مجبور کرتی ہے — اور آپ کی زنجیر کی حفاظت کرتی ہے۔';

  @override
  String get onboardingPage4Title => 'اپنے پودوں کی روزانہ دیکھ بھال کریں۔';

  @override
  String get onboardingPage4Body =>
      'عادات بڑھانے کے لیے ٹیپ کریں۔ ایک دن چھوڑیں اور زنجیر نہیں بڑھتی۔ نگہبان آپ کے ساتھ بڑھتا ہے۔';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'اپنا پہلا بیج لگائیں۔';

  @override
  String get authWelcomeBack => 'خوش آمدید، نگہبان۔';

  @override
  String get authFiveTasksDaily => 'پانچ کام۔ روزانہ عادات۔ کوئی بہانہ نہیں۔';

  @override
  String get authSanctuaryWaiting => 'آپ کا سینکچری منتظر ہے۔';

  @override
  String get authSignIn => 'سائن ان';

  @override
  String get authSignUp => 'سائن اپ';

  @override
  String get authEmail => 'ای میل';

  @override
  String get authPassword => 'پاس ورڈ';

  @override
  String get authEmailHint => 'you@email.com';

  @override
  String get authCreateAccount => 'اکاؤنٹ بنائیں';

  @override
  String get authSignInCta => 'سائن ان';

  @override
  String get authOrContinueWith => 'یا جاری رکھیں';

  @override
  String get authContinueWithGoogle => 'Google سے جاری رکھیں';

  @override
  String get authEnterEmail => 'اپنا ای میل درج کریں';

  @override
  String get authEnterValidEmail => 'درست ای میل ایڈریس درج کریں';

  @override
  String get authPasswordTooShort => 'پاس ورڈ کم از کم 6 حروف کا ہونا چاہیے';

  @override
  String get authAccountCreated =>
      'اکاؤنٹ بن گیا۔ سائن ان پر جائیں اور اپنا پاس ورڈ استعمال کریں۔';

  @override
  String get authSomethingWentWrong => 'کچھ غلط ہو گیا۔ دوبارہ کوشش کریں۔';

  @override
  String get authCouldNotStartGoogle => 'Google سائن ان شروع نہیں ہو سکا۔';

  @override
  String get authMidnightReset =>
      'سائن ان کر کے، آپ قبول کرتے ہیں کہ آپ کا دن رات 12 بجے ری سیٹ ہوتا ہے۔';

  @override
  String get authSetupRequired => 'سیٹ اپ درکار ہے';

  @override
  String get settingsPersonalSanctuary => 'ذاتی سینکچری';

  @override
  String get settingsHowThisWorks => 'یہ کیسے کام کرتا ہے';

  @override
  String get settingsHowThisWorksSubtitle =>
      'ایپ کیا ہے، حد اور اسٹریک کیسے کام کرتی ہے';

  @override
  String get settingsStreakProtection => 'اسٹریک حفاظت';

  @override
  String get settingsStreakProtectionAvailable => 'اس مہینے 1 فریز دستیاب ہے';

  @override
  String get settingsStreakProtectionUsed => 'اس مہینے استعمال ہو چکا';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription => 'Pro سبسکرپشن کا انتظام کریں';

  @override
  String get settingsProCancelPlay =>
      'Google Play میں منسوخ کریں یا پلان تبدیل کریں';

  @override
  String get settingsProUnlock => 'تمام 5 عادات، مکمل تاریخ، مزید کھولیں';

  @override
  String get settingsTaskAlarms => 'کام کے الارم اور آخری موقع';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'شام کی ترغیب اور رات 12 بجے کی تنبیہ';

  @override
  String get settingsHomeScreenWidget => 'ہوم اسکرین ویجیٹ';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'اپنی زنجیر کی اسٹریک ہوم اسکرین پر شامل کریں';

  @override
  String get settingsShareBloomTracker => 'Daily Stitch شیئر کریں';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'دوست کو زنجیر کے بارے میں بتائیں';

  @override
  String get settingsHelpSupport => 'مدد و معاونت';

  @override
  String get settingsHelpSupportSubtitle => 'FAQ یا مسئلہ رپورٹ کریں';

  @override
  String get settingsSignOutTile => 'سائن آؤٹ';

  @override
  String get settingsAllFeaturesUnlocked => 'تمام فیچرز کھلے ہوئے';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'بیٹا بلڈ — ہم جب تک سب کچھ ٹیست کرتے ہیں سبسکرپشنز رکی ہوئی ہیں۔';

  @override
  String settingsVersion(Object build, Object version) {
    return 'ورژن $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'ورژن 1.0.0';

  @override
  String get settingsHabitMaster => 'عادت ماسٹر';

  @override
  String settingsLevel(Object level) {
    return 'لیول $level · عادت ماسٹر';
  }

  @override
  String get languagePickerTitle => 'زبان';

  @override
  String get youLast7Days => 'آخری 7 دن';

  @override
  String get youLast7DaysSubtitle => 'دن بہ دن کام کی تاریخ';

  @override
  String get youLeftBehindSubtitle =>
      'چھوٹے ہوئے کام جو دوبارہ شامل ہونے کا منتظر ہیں';

  @override
  String get youProTier => 'Pro ٹائر';

  @override
  String get youFreeTier => 'مفت ٹائر';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'مفت';

  @override
  String youLevelLabel(Object level) {
    return 'لیول $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'بہترین $days دن';
  }

  @override
  String get youPlantHabit => 'زنجیر شروع کرنے کے لیے عادت لگائیں۔';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline => 'مکمل نظم و ضبط کا نظام کھولیں۔';

  @override
  String get youProFeatures =>
      '5 عادت کی جگہیں، مکمل تاریخ، Legendary تمغے، ماہانہ اسٹریک فریز، ہفتہ وار شیئر کارڈ۔';

  @override
  String get youSeePlans => 'پلان دیکھیں';

  @override
  String youFromPrice(Object price) {
    return '$price/ماہ سے شروع';
  }

  @override
  String get youBloomTrackerFooter => 'Daily Stitch · عادات اور کام';

  @override
  String get progressMedals => 'تمغے';

  @override
  String get progressLast7Days => 'آخری 7 دن';

  @override
  String get progressSeeAll => 'سب دیکھیں';

  @override
  String get progressSeeDayByDayActivity => 'اپنی دن بہ دن سرگرمی دیکھیں';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done / $total کام مکمل · $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'ابھی تک کوئی تمغے نہیں — شروع کرنے کے لیے کام مکمل کریں یا پودے کی دیکھ بھال کریں۔';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'تمام تمغے دیکھیں · $earned / $total حاصل';
  }

  @override
  String get progressGuardianInsight => 'نگہبان کی بصیرت';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'اگلا بیج · $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return '$days دن کا ہدف';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'مدد و معاونت';

  @override
  String get helpBody =>
      'زیادہ تر جوابات نیچے ہیں۔ اگر نہیں ملے، ہمیں نوٹ بھیجیں اور ہم عام طور پر 2-3 دن میں جواب دیتے ہیں۔';

  @override
  String get helpSectionFAQ => 'عمومی سوالات';

  @override
  String get helpSectionContact => 'ابھی بھی مسئلہ ہے؟';

  @override
  String get helpAddMessage => 'پہلے مختصر پیغام شامل کریں۔';

  @override
  String get helpOpening => 'آپ کا میل ایپ کھل رہا ہے…';

  @override
  String get helpEmailUs => 'ہمیں ای میل کریں';

  @override
  String get helpOpeningAction => 'کھل رہا ہے…';

  @override
  String get helpCopyEmail => 'سپورٹ ای میل کاپی کریں';

  @override
  String get helpCopiedEmail => 'support@dailystitch.app کاپی ہو گیا';

  @override
  String get helpNoMailApp =>
      'کوئی میل ایپ نہیں ملی۔ ہمیں support@dailystitch.app پر ای میل کریں۔';

  @override
  String get helpTopicLabel => 'موضوع';

  @override
  String get helpWhatHappened => 'کیا ہوا؟';

  @override
  String get helpHint => 'مختصر بیان بہت مدد کرتا ہے…';

  @override
  String get helpDisclaimer =>
      '\"ہمیں ای میل کریں\" ٹیپ کرنے سے آپ کا میل ایپ پہلے سے بھرے ہوئے پیغام کے ساتھ کھلتا ہے (بھیجنے تک آپ کے ڈیوائس سے کوئی ڈیٹا نہیں جاتا)۔';

  @override
  String get helpFaqQ1 => '5 کام کی حد کیا ہے؟';

  @override
  String get helpFaqA1 =>
      'آپ فی مقامی دن 5 تک کام شامل کر سکتے ہیں۔ 6واں جان بوجھ کر بند ہے — نظم و ضبط بھاری پر بہتر ہے۔ حد فیچر ہے، رکاوٹ نہیں۔';

  @override
  String get helpFaqQ2 => 'رات 12 بجے کیا ہوتا ہے؟';

  @override
  String get helpFaqA2 =>
      'آپ کے مقامی رات 12 بجے، جو بھی کام ابھی کھلا ہے وہ \"چھوٹا ہوا\" ٹیگ ہوتا ہے اور Left Behind میں چلا جاتا ہے۔ عادت کی اسٹریک ری سیٹ ہوتی ہے اگر عادت کل مکمل نہیں ہوئی۔';

  @override
  String get helpFaqQ3 => 'Left Behind کیا ہے؟';

  @override
  String get helpFaqA3 =>
      'آپ کے نامکمل کاموں کی ایک نرم، ختم کرنے والی فہرست۔ اسے کھولیں، صرف وہی دوبارہ شامل کریں جو ابھی بھی اہم ہو، باقی کو چھوڑ دیں۔ مفت ٹائر آخری 7 دن دیکھتا ہے؛ Pro مکمل تاریخ دیکھتا ہے۔';

  @override
  String get helpFaqQ4 => 'اسٹریک کیسے کام کرتی ہے؟';

  @override
  String get helpFaqA4 =>
      'دن زنجیر بڑھاتا ہے جب آپ کے پاس کم از کم 1 کام تھا اور 0 چھوٹے۔ صفر کاموں والے دن زنجیر نہ بڑھاتے نہ توڑتے۔ اسٹریک فریز ہر ماہ ایک چھوٹے ہوئے دن کو معاف کرتا ہے۔';

  @override
  String get helpFaqQ5 => 'اسٹریک فریز کیا ہے؟';

  @override
  String get helpFaqA5 =>
      'ہر کیلنڈر مہینے ایک \"فریز\"، صرف Pro۔ اسے اس دن استعمال کریں جو آپ نے چھوڑا تاکہ زنجیر زندہ رہے۔ اسے پیشرفت ٹیب پر تلاش کریں۔';

  @override
  String get helpFaqQ6 => 'میرا ڈیٹا کہاں محفوظ ہے؟';

  @override
  String get helpFaqA6 =>
      'تمام ڈیٹا Supabase (Postgres) میں اس اکاؤنٹ کے تحت محفوظ ہے جس سے سائن ان ہوا۔ ہم کبھی بیچتے یا شیئر نہیں کرتے۔ مکمل تفصیلات کے لیے Play Store لسٹنگ میں لکی رازداری پالیسی دیکھیں۔';

  @override
  String get helpFaqQ7 => 'میں اپنا اکاؤنٹ کیسے حذف کروں؟';

  @override
  String get helpFaqA7 =>
      'اکاؤنٹ حذف کرنا اگلی ریلیز میں ترتیبات میں آ رہا ہے۔ فی الحال، ہمیں support@dailystitch.app پر ای میل کریں اور ہم ایک دن میں سنبھال لیں گے۔';

  @override
  String get helpTopicsGeneral => 'عمومی سوال';

  @override
  String get helpTopicsBug => 'بگ رپورٹ';

  @override
  String get helpTopicsStreak => 'اسٹریک / رول اوور مسئلہ';

  @override
  String get helpTopicsBilling => 'بلنگ یا Pro ٹائر';

  @override
  String get helpTopicsAccount => 'اکاؤنٹ اور ڈیٹا';

  @override
  String get helpTopicsFeature => 'فیچر کی درخواست';

  @override
  String get helpAccountAnon => '(سائن ان نہیں)';

  @override
  String get splashTagline => 'چھوٹے بیج پالیں۔ جنگل اگائیں۔';

  @override
  String get priorityStandard => 'معمولی';

  @override
  String get priorityVital => 'ضروری';

  @override
  String get prioritySpark => 'شعلہ';

  @override
  String get settingsDeleteAccount => 'اکاؤنٹ حذف کریں';

  @override
  String get settingsDeleteAccountSubtitle => 'اپنا ڈیٹا مستقل طور پر ہٹائیں';

  @override
  String get settingsDeleteAccountConfirmTitle => 'اپنا اکاؤنٹ حذف کریں؟';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'یہ آپ کی پروفائل، کام، عادات اور پیشرفت کو مستقل طور پر حذف کرتا ہے۔ فعال Play سبسکرپشنز کو الگ سے Google Play میں منسوخ کرنا ہوگا۔ یہ واپس نہیں ہو سکتا۔';

  @override
  String get settingsDeleteAccountConfirmButton => 'ہمیشہ کے لیے حذف کریں';

  @override
  String get settingsDeleteAccountSuccess => 'آپ کا اکاؤنٹ حذف ہو گیا۔';

  @override
  String get settingsDeleteAccountFailed =>
      'اکاؤنٹ حذف نہیں ہو سکا۔ دوبارہ کوشش کریں یا support@dailystitch.app پر ای میل کریں۔';

  @override
  String get referralYouTitle => 'دوستوں کو مہمان بنائیں · مفت Pro کمائیں';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$milestone میں سے $progress دوست شامل ہوئے';
  }

  @override
  String get referralYouShare => 'مہمانی شیئر کریں';

  @override
  String get referralYouDetails => 'تفصیلات دیکھیں';

  @override
  String get referralPaywallTitle => 'مفت Pro مہینہ';

  @override
  String get referralPaywallBody =>
      '5 دستوں کو مہمان بنائیں جو سائن اپ کریں → 1 مہینہ مفت Pro';

  @override
  String get referralPaywallProBody =>
      'مہمان بناتے رہیں — مفت Pro مہینے جمع کریں';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'آپ کی پیشرفت لو نہیں ہو سکی۔ بعد میں دوبارہ کوشش کریں۔';

  @override
  String get insightsMetricCurrentChain => 'موجودہ زنجیر';

  @override
  String get insightsMetricBestEver => 'اب تک کی بہترین';

  @override
  String get insightsMetricTasksDone => 'کام مکمل';

  @override
  String get insightsMetricPerfectDays => 'کامل دن';

  @override
  String get insightsMetricHabits => 'عادات';

  @override
  String get insightsDay => 'دن';

  @override
  String get insightsDays => 'دن';

  @override
  String get insightsSectionThisWeek => 'اس ہفتے';

  @override
  String get insightsShareMyWeek => 'میرا ہفتہ شیئر کریں';

  @override
  String get insightsShareMyWeekPro => 'میرا ہفتہ شیئر کریں · Pro';

  @override
  String get insightsShareReceiptText =>
      'میرا ہفتہ Daily Stitch پر۔ زنجیر نہ توڑیں۔';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'آخری $days دن دکھا رہا ہے';
  }

  @override
  String get insightsHistoryUpsell => 'Pro سے اپنا مکمل تاریخ کھولیں';

  @override
  String get referralScreenTitle => 'دوستوں کو مہمان بنائیں';

  @override
  String get referralLaunchGift => '-launch مہینے کا تحفہ';

  @override
  String get referralRewardTitle => '1 مہینہ مفت Pro حاصل کریں';

  @override
  String get referralRewardBody =>
      'اپنا کوڈ دوستوں کے ساتھ شیئر کریں۔ جب 5 لوگ اس کا استعمال کرتے ہوئے سائن اپ کریں، آپ کو 1 پورا مہینہ Daily Stitch Pro ملتا ہے۔';

  @override
  String get referralYourCode => 'آپ کا ریفرل کوڈ';

  @override
  String get referralCopyCodeTooltip => 'کوڈ کاپی کریں';

  @override
  String get referralCodeCopied => 'ریفرل کوڈ کاپی ہو گیا';

  @override
  String get referralShareWithFriends => 'دوستوں کے ساتھ شیئر کریں';

  @override
  String get referralFooterHint =>
      'دوست اکاؤنٹ بناتے وقت آپ کا کوڈ درج کرتے ہیں۔ ہر دوست آپ کے انعام کی طرف ایک بار شمار ہوتا ہے۔';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count دوست شامل ہو گیا';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count دوست شامل ہوئے';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'آپ نے $count مفت مہینہ Pro حاصل کیا ہے۔';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'آپ نے $count مفت مہینے Pro حاصل کیے ہیں۔';
  }

  @override
  String get referralRewardUnlocked =>
      'انعام کھل گیا — اپنا مفت مہینہ Pro کا لطف اندوز ہوں!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return 'اپنا مفت مہینہ کھولنے کے لیے $remaining مزید';
  }

  @override
  String youProMemberSince(String month) {
    return '$month سے Daily Stitch Pro ممبر';
  }

  @override
  String get youProPerksTitle => 'آپ کے Pro فوائد';

  @override
  String get manageProThankYou => 'Daily Stitch کی حمایت کا شکریہ';

  @override
  String get manageProReferralHint =>
      'اپنا Pro بڑھانے کے لیے مزید دوستوں کو مہمان بنائیں';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nleanspace/.env میں SUPABASE_URL اور SUPABASE_PUBLISHABLE_KEY (یا پرانی SUPABASE_ANON_KEY) شامل کریں، پھر دوبارہ بلڈ کریں:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'سسٹم ڈیفالٹ';

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
  String get onboardingLanguageTitle => 'اپنی زبان منتخب کریں';

  @override
  String get onboardingLanguageBody =>
      'وہ زبان چنیں جو آپ Daily Stitch میں استعمال کرنا چاہتے ہیں۔ آپ اسے کسی بھی وقت ترتیبات میں تبدیل کر سکتے ہیں۔';

  @override
  String get onboardingLanguageContinue => 'جاری رکھیں';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'دوست';

  @override
  String get settingsAppTheme => 'ایپ تھیم';

  @override
  String get settingsAppThemeSubtitle => 'اپنے ذاتی سینکچری کے رنگ منتخب کریں';

  @override
  String get settingsInviteFriendsTitle => 'دوستوں کو مہمان بنائیں · مفت Pro';

  @override
  String get settingsInviteFriendsSubtitle =>
      '5 دوستوں کے شامل ہونے پر 1 مہینہ مفت';

  @override
  String get themePickerTitle => 'ذاتی سینکچری';

  @override
  String get themePickerSubtitle => 'وہ رنگ پیلیٹ چنیں جو آپ کو سکون دے۔';

  @override
  String get themeNameClassicBloom => 'کلاسک بلوم';

  @override
  String get themeNameSolarTerracotta => 'سولر ٹیرا کوٹا';

  @override
  String get themeNameMidnightOasis => 'میڈنائٹ واسطہ';

  @override
  String get themeNameLavenderDream => 'لیونڈر خواب';

  @override
  String get themeNameNordicFrost => 'نارڈک فراست';

  @override
  String get themeNameCyberpunkNeon => 'سائبر پنک نیون';

  @override
  String get reminderTitle => 'یاد دہانیاں';

  @override
  String get reminderBody =>
      'آخری موقع رات 12 بجے سے پہلے آپ کو پنگ کرتا ہے اگر کام ابھی بھی کھلے ہوں۔';

  @override
  String get reminderFinalCall => 'آخری موقع';

  @override
  String get reminderEveningNudge => 'شام کی ترغیب';

  @override
  String get reminderChangeTime => 'وقت تبدیل کریں';

  @override
  String get reminderSave => 'یاد دہانیاں محفوظ کریں';

  @override
  String get notificationChannelReminders => 'Daily Stitch یاد دہانیاں';

  @override
  String get notificationChannelRemindersDesc =>
      'شام کی ترغیب اور آخری موقع کی یاد دہانیاں';

  @override
  String get notificationChannelAlarms => 'Daily Stitch کام کے الارم';

  @override
  String get notificationChannelAlarmsDesc =>
      'کام کی یاد دہانیوں کے لیے بلند الارم';

  @override
  String get notificationTaskReminderTitle => 'کام کی یاد دہانی';

  @override
  String get notificationFinalCallTitle => 'آخری موقع';

  @override
  String notificationFinalCallBody(int count) {
    return 'آج ابھی بھی $count کام کھلے ہیں۔';
  }

  @override
  String get notificationEveningTitle => 'شام کی چیک ان';

  @override
  String get notificationEveningBody => 'آج آپ کا باغ کیسا بڑھا؟';

  @override
  String get widgetSetupTitle => 'زنجیر ویجیٹ شامل کریں';

  @override
  String get widgetSetupBody =>
      'اپنی اسٹریک ہوم اسکرین پر رکھیں — ایپ کھولنے کی ضرورت نہیں۔';

  @override
  String get widgetSetupAdd => 'ہوم اسکرین پر شامل کریں';

  @override
  String get widgetSetupStep1 => 'اپنی ہوم اسکرین پر دیر تک دبائیں';

  @override
  String get widgetSetupStep2 => 'ویجیٹس ٹیپ کریں';

  @override
  String get widgetSetupStep3 => 'Daily Stitch تلاش کریں اور اسے گھسیٹ لائیں';

  @override
  String get widgetSetupPinSuccess =>
      'ویجیٹ رکھنے کے لیے اپنی ہوم اسکرین چیک کریں۔';

  @override
  String get widgetSetupPinFallback =>
      'آپ کا لانچر ایک ٹیپ ایڈ سپورٹ نہیں کر سکتا۔ نیچے دیے گئے دستی مراحل استعمال کریں۔';

  @override
  String get paywallWelcomePro => 'Daily Stitch Pro میں خوش آمدید';

  @override
  String get paywallSavePercent => '~16% بچائیں';

  @override
  String get paywallTermsTitle => 'سبسکرپشن کی شرائط';

  @override
  String get paywallTermsBody =>
      'بلنگ Google Play کے ذریعے سنبھالتی ہے۔ سبسکرپشنز خود بخود تجدید ہوتی ہیں جب تک آپ Play Store → سبسکرپشنز میں موجودہ مدت کے ختم ہونے سے کم از کم 24 گھنٹے پہلے منسوخ نہیں کرتے۔ آپ کسی بھی وقت اپنے Google Play اکاؤنٹ سے اپنی سبسکرپشن کا انتظام یا منسوخ کر سکتے ہیں۔\n\nایپ ان اسٹال کرنے سے آپ کی سبسکرپشن منسوخ نہیں ہوتی۔\n\nدکھائی قیمتیں آپ کی مقامی کرنسی میں ہیں اور علاقے کے مطابق مختلف ہو سکتی ہیں۔ ٹیکس لاگو ہو سکتے ہیں۔';

  @override
  String get paywallPrivacyTitle => 'رازداری';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch آپ کے کام، عادات اور اسٹریک ڈیٹا کو ہمارے Supabase بیک اینڈ پر محفوظ کرتا ہے، جو آپ کے اکاؤنٹ سے جڑا ہوا ہے۔ ہم کبھی آپ کا ڈیٹا نہیں بیچتے۔\n\nسبسکرپشن خریداریاں Google Play کے ذریعے پروسیس ہوتی ہیں۔ ہم آپ کی Pro حیثیت کی تصدیق کے لیے Google سے ایک تصدیق شدہ خریداری ٹوکن ملتے ہیں۔ ہم آپ کی ادائیگی کی تفصیلات نہیں دیکھتے یا محفوظ کرتے۔\n\nآپ ترتیبات → اکاؤنٹ حذف کریں سے مکمل ڈیٹا ایکسپورٹ یا اکاؤنٹ حذف کی درخواست کر سکتے ہیں۔';

  @override
  String get paywallCloseTooltip => 'بند کریں';

  @override
  String get paywallFooterLinks => 'بحال کریں · شرائط · رازداری';

  @override
  String get manageProTitle => 'Pro سبسکرپشن';

  @override
  String get manageProActive => 'فعال';

  @override
  String get manageProNotSubscribed => 'سبسکرائب نہیں';

  @override
  String get manageProFreeTier => 'مفت ٹائر';

  @override
  String manageProRenewsOn(String date) {
    return '$date کو تجدید یا ختم ہوتا ہے۔';
  }

  @override
  String get manageProFreeBody =>
      'آپ Daily Stitch مفت استعمال کر رہے ہیں۔ مکمل نظام کھولنے کے لیے اپ گریڈ کریں۔';

  @override
  String get manageProSectionManage => 'انتظام';

  @override
  String get manageProOpenPlay => 'Google Play سبسکرپشنز کھولیں';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'منسوخ کریں، پلان تبدیل کریں، یا ادائیگی کا طریقہ اپ ڈیٹ کریں';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'اپنی موجودہ سبسکرپشن (اگر ہو) یہاں تلاش کریں';

  @override
  String get manageProShareApp => 'Daily Stitch شیئر کریں';

  @override
  String get manageProShareSubtitle => 'دوست کو زنجیر کے بارے میں بتائیں';

  @override
  String get manageProSectionHelp => 'مدد درکار ہے؟';

  @override
  String get manageProHelpTitle => 'مدد و معاونت';

  @override
  String get manageProHelpSubtitle => 'سبسکرپشن FAQ، رابطہ، بگ رپورٹس';

  @override
  String manageProBillingFooter(String version) {
    return 'بلنگ Google Play کے ذریعے · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Google Play Store ایپ کھولیں → اپنی پروفائل ٹیپ کریں → ادائیگیاں اور سبسکرپشنز → سبسکرپشنز۔';

  @override
  String get addTaskGrowSomething => 'کچھ اگائیں';

  @override
  String get addTaskPlantSprout => 'پودا لگائیں';

  @override
  String get addTaskIntentionName => 'نیت کا نام';

  @override
  String get addTaskSproutName => 'پودے کا نام';

  @override
  String get addTaskHintTask => 'مثلاً، صبح کا سورج نمسکار';

  @override
  String get addTaskHintHabit => 'مثلاً، صبح کا یوگا';

  @override
  String get addTaskWhen => 'کب؟';

  @override
  String get addTaskPriority => 'ترجیح';

  @override
  String get addTaskNotes => 'نوٹس';

  @override
  String get addTaskCadenceDaily => 'روزانہ';

  @override
  String get addTaskCadenceWeekdays => 'ہفتے کے دن';

  @override
  String get addTaskCadence3x => 'ہفتے میں 3 بار';

  @override
  String get addTaskCadenceWeekly => 'ہفتہ وار';

  @override
  String get addTaskPlantIntention => 'نیت لگائیں';

  @override
  String get addTaskPlantSproutCta => 'پودا لگائیں';

  @override
  String get addTaskPlanting => 'لگا رہے ہیں…';

  @override
  String get addTaskNameIntentionError => 'اپنی نیت کا نام دیں';

  @override
  String get addTaskNameSproutError => 'اپنے پودے کا نام دیں';

  @override
  String get addTaskNotesMigrationWarning =>
      'کام محفوظ ہو گیا۔ نوٹس اور ترجیح کو تازہ ترین Supabase مائیگریشن کی ضرورت ہے — supabase/migrations/20260701000000_todos_notes_priority.sql چلائیں۔';

  @override
  String get addTaskNoSproutSlots =>
      'کوئی خالی پودے کی جگہ نہیں — پہلے ایک کی دیکھ بھال کریں۔';

  @override
  String get addTaskSaveSproutError =>
      'پودا محفوظ نہیں ہو سکا — دوبارہ کوشش کریں۔';

  @override
  String get addTaskElementWater => 'پانی';

  @override
  String get addTaskElementLight => 'روشنی';

  @override
  String get addTaskElementSoil => 'زمین';

  @override
  String get addTaskElementBreeze => 'ہوا';

  @override
  String get addTaskCadenceLabel => 'ترتیب';

  @override
  String get addTaskPreparationNotes => 'تیاری کے نوٹس';

  @override
  String get addTaskTendingNotes => 'دیکھ بھال کے نوٹس';

  @override
  String get addTaskNotesHintTask => 'اس کام کے لیے کوئی ٹول یا ذہنیت ٹپس؟';

  @override
  String get addTaskNotesHintHabit => 'اس پودے کی دیکھ بھال کیسا لگتا ہے؟';

  @override
  String get addTaskChooseElement => 'عنصر منتخب کریں';

  @override
  String get addTaskElementsTooltip => 'عناصر کا کیا مطلب ہے؟';

  @override
  String get addTaskTaskSeed => 'کام کا بیج';

  @override
  String get addTaskHabitSprout => 'عادت کا پودا';

  @override
  String get addTaskPickElement => 'صحح عنصر چنیں';

  @override
  String get addTaskPickElementBody =>
      'ہر عنصر مختلف قسم کی محنت سے ملتا ہے۔ نگہبان اس وقت مضبوط ہوتا ہے جب آپ صحح پانی دیتے ہیں۔';

  @override
  String get addTaskClearForm => 'فارم صاف کریں';

  @override
  String get shareCouldNotShare => 'ابھی شیئر نہیں کر سکتے';

  @override
  String get authReferralCodeLabel => 'ریفرل کوڈ (اختیاری)';

  @override
  String get authReferralCodeHint => 'دوست کا کوڈ';

  @override
  String get youPerkHabitSlots => '5 عادت کی جگہیں';

  @override
  String get youPerkFullHistory => 'مکمل تاریخ';

  @override
  String get youPerkAllThemes => 'تمام تھیمز';

  @override
  String get youPerkStreakFreezes => '2 اسٹریک فریز / ماہ';

  @override
  String get youPerkLegendaryMedals => 'Legendary تمغے';

  @override
  String get subscriptionPurchaseFailed =>
      'خریداری ناکام ہوئی۔ دوبارہ کوشش کریں۔';

  @override
  String get subscriptionUnavailable =>
      'اس ڈیوائس پر ان ایپ خریداری دستیاب نہیں۔';

  @override
  String get subscriptionLoadFailed => 'سبسکرپشن آپشنز لو نہیں ہو سکیں۔';

  @override
  String get subscriptionVerifyFailed =>
      'خریداری کی تصدیق نہیں ہو سکی۔ خریداری بحال کریں دوبارہ کوشش کریں۔';

  @override
  String get streakFreezeFailed => 'اسٹریک فریز استعمال نہیں ہو سکا۔';

  @override
  String get streakFreezeAlreadyUsed =>
      'آپ نے اس مہینے اپنا فریز پہلے ہی استعمال کر لیا۔';

  @override
  String get streakFreezeNoMissed =>
      'اس دن فریز کرنے کے لیے کوئی چھوٹا ہوا کام نہیں۔';

  @override
  String get streakFreezeNotPastDay => 'آپ صرف گزشتہ دن فریز کر سکتے ہیں۔';

  @override
  String get myDayLoadError =>
      'میرا دن لو نہیں ہو سکا۔ تازہ کرنے کے لیے کھینچیں۔';

  @override
  String get myDayCapReached => 'آج کی 5 کام کی حد پوری ہو گئی۔';

  @override
  String get myDayRemoveTaskError => 'کام ہٹایا نہیں جا سکا۔';

  @override
  String get shareCardTitle => 'اپنا ہفتہ شیئر کریں';

  @override
  String get shareCardCta => 'تصویر شیئر کریں';

  @override
  String get medalTierSprout => 'پودا';

  @override
  String get medalTierCommon => ' عام';

  @override
  String get medalTierRare => 'نایاب';

  @override
  String get medalTierEpic => 'شاندار';

  @override
  String get medalTierLegendary => ' Legendary';

  @override
  String get medalCategoryTasks => 'کام';

  @override
  String get medalCategoryHabits => 'عادات';

  @override
  String get medalCategoryStreaks => 'اسٹریکس';

  @override
  String get medalCategoryMastery => 'مہارت';

  @override
  String get medalsShareTooltip => 'کامیابیاں شیئر کریں';

  @override
  String get medalsFilterAll => 'سب';

  @override
  String get addHabitTitleNew => 'نیا پودا لگائیں';

  @override
  String get addHabitTitleEdit => 'اپنے پودے کی دیکھ بھال کریں';

  @override
  String get addHabitLabelSproutName => 'پودے کا نام';

  @override
  String get shareCardAppBarTitle => 'شیئر کارڈ';

  @override
  String get shareCardAppBarTitleMedal => 'اپنا تمغہ شیئر کریں';

  @override
  String shareCardDescMedal(Object title) {
    return 'اپنا نیا $title بیج دکھائیں';
  }

  @override
  String get shareCardBodyMedal =>
      'کامیابی اپنے دائرے میں شیئر کریں۔ کارڈ PNG کے طور پر ایکسپورٹ ہوتا ہے اور کسی بھی سوشل ایپ کے لیے تیار ہوتا ہے۔';

  @override
  String get shareCardCtaPreparing => 'تیار ہو رہا ہے…';

  @override
  String get shareCardMilestone => 'نئے سنگ میل کھلے';

  @override
  String get shareCardStatChain => 'دن کی زنجیر';

  @override
  String get shareCardStatSprouts => 'پودے';

  @override
  String get shareCardStatMedals => 'تمغے';

  @override
  String shareCardHeadlineStreak(int days) {
    return '$days دن کی اسٹریک';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count تمغے حاصل';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'پودے کا نگہبان';

  @override
  String get shareCardHeadlineFirstSeeds => 'پہلے بیج لگائے گئے';

  @override
  String get shareCardHeadlineGardenBegins => 'باغ شروع ہوتا ہے';

  @override
  String get shareCardSubheadMonth =>
      'آپ نے کامیابی سے ایک پورا مہینہ اپنی عادات کی پرورش کی ہے۔';

  @override
  String get shareCardSubheadWeek =>
      'ایک پورا ہفتہ ترقی کا — آپ کا جنگل گھنا ہو رہا ہے۔';

  @override
  String get shareCardSubheadProgress =>
      'آپ کا سینکچری اصلی پیشرفت دکھا رہا ہے۔ جاری رکھیں۔';

  @override
  String get shareCardSubheadSprouts =>
      'آپ کے پہلے پودے جڑیں پکڑ رہے ہیں۔ انہیں روزانہ پانی دیں۔';

  @override
  String get shareCardSubheadFirstSeeds =>
      'آپ کے پہلے بیج زمین میں ہیں۔ انہیں کھلتا دیکھیں۔';

  @override
  String get shareCardSubheadFallback =>
      'ہر جنگل ایک چھوٹے سے انتخاب سے شروع ہوتا ہے۔';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — روزانہ پانچ چھوٹے بیج، ایک نہ ٹوٹنے والی زنجیر۔ اپنا بیج لگائیں۔\n\n$url';
  }

  @override
  String get shareAppSubject => 'Daily Stitch آزمائیں';

  @override
  String shareAppReferralText(String code, String url) {
    return 'میں Daily Stitch پر اپنی روزانہ زنجیر بنا رہا ہوں — میرے ریفرل کوڈ $code سے میرے ساتھ شامل ہوں اور ہم دونوں بڑھیں۔\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Daily Stitch پر میرے ساتھ شامل ہوں';

  @override
  String shareCardShareTextProgress(String year) {
    return 'میری Daily Stitch پیشرفت — Daily Stitch پر $year۔';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'میں نے ابھی Daily Stitch پر \"$title\" تمغہ کھولا ہے۔ $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'کام مکمل';

  @override
  String get insightsReceiptPerfectDays => 'کامل دن';

  @override
  String get insightsReceiptCompletion => 'تکمیل';

  @override
  String insightsReceiptDate(String date) {
    return 'ہفتہ $date';
  }

  @override
  String get insightsReceiptFooter => 'زنجیر نہ توڑیں۔';

  @override
  String get elementLabelWater => 'پانی';

  @override
  String get elementLabelLight => 'روشنی';

  @override
  String get elementLabelSoil => 'زمین';

  @override
  String get elementLabelBreeze => 'ہوا';

  @override
  String get elementTaglineWater =>
      'بحال کریں۔ آب پاشی، آرام، جذباتی دیکھ بھال — کچھ بھی جو کنویں کو دوبارہ بھرتا ہے۔';

  @override
  String get elementTaglineLight =>
      'جاگیں۔ صبح کی روشنی، توجہ کے بلاکس، مطالعہ، مراقبہ — توانائی اور وضاحت۔';

  @override
  String get elementTaglineSoil =>
      'بنیاد۔ مطالعہ، جرنلنگ، گہری محنت — سست جڑیں جو طویل مزاحمت بناتی ہیں۔';

  @override
  String get elementTaglineBreeze =>
      'حرکت۔ پیدل، دوڑ، سانس کی مشق — ہلکی، متحرک توانائی جو ذہن صاف کرتی ہے۔';

  @override
  String get elementWhenWater => 'جب آپ تھکے ہوئے یا تحلیل محسوس کریں۔';

  @override
  String get elementWhenLight => 'جب آپ کو دن کا واضح آغاز چاہیے۔';

  @override
  String get elementWhenSoil =>
      'جب کام سست ہے لیکن قابل ہے (مطالعہ، حرفت، دیکھ بھال)۔';

  @override
  String get elementWhenBreeze =>
      'جب آپ کا جسم (یا ذہن) کو حرکت اور سانس کی ضرورت ہو۔';

  @override
  String get bloomTierMastery => 'مہارت';

  @override
  String get bloomTierStrong => 'مضبوط';

  @override
  String get bloomTierGrowing => 'بڑھ رہا ہے';

  @override
  String get bloomTierSprouting => 'پھوت دار ہو رہا ہے';

  @override
  String get bloomTierLocked => 'بند';

  @override
  String habitBloomSubtitle(int count, String element) {
    return '$count دن کی اسٹریک · $element';
  }

  @override
  String get medal_id_first_spark => 'پہلا شعلہ';

  @override
  String get medal_sub_first_spark => 'آپ نے مچھ جلایا۔';

  @override
  String get medal_desc_first_spark =>
      'اپنا پہلا کام مکمل کریں۔ ہر زنجیر یہاں سے شروع ہوتی ہے۔';

  @override
  String get medal_id_triple_seed => 'تین بیج';

  @override
  String get medal_sub_triple_seed => 'تین زمین میں۔';

  @override
  String get medal_desc_triple_seed => 'کل میں 3 کام مکمل کریں۔';

  @override
  String get medal_id_dozen_sower => 'بارہ بیج لگانے والا';

  @override
  String get medal_sub_dozen_sower => 'بارہ کا میدان۔';

  @override
  String get medal_desc_dozen_sower => 'کل میں 12 کام مکمل کریں۔';

  @override
  String get medal_id_quarter_century => 'چوتھائی صدی';

  @override
  String get medal_sub_quarter_century => 'ہاں کہنے کا موسم۔';

  @override
  String get medal_desc_quarter_century => 'کل میں 25 کام مکمل کریں۔';

  @override
  String get medal_id_productivity_titan => 'پیداواریت کا عظیم';

  @override
  String get medal_sub_productivity_titan => 'مسلسلت جمع ہوتی ہے۔';

  @override
  String get medal_desc_productivity_titan =>
      '50 کام مکمل کریں — آپ نے اصلی رفتار بنا لی ہے۔';

  @override
  String get medal_id_century_planter => 'صدی کا لگانے والا';

  @override
  String get medal_sub_century_planter => 'اپنا ایک جنگل۔';

  @override
  String get medal_desc_century_planter =>
      '100 کام مکمل کریں۔ آپ صارفین کے ٹاپ 5% میں ہیں۔';

  @override
  String get medal_id_clean_day => 'صاف تختی';

  @override
  String get medal_sub_clean_day => 'ایک بھی پودا نہیں۔';

  @override
  String get medal_desc_clean_day => 'ایک دن میں لگائے گئے ہر کام مکمل کریں۔';

  @override
  String get medal_id_triple_perfect => 'تین کامل';

  @override
  String get medal_sub_triple_perfect => 'تین بے عیب دوڑ۔';

  @override
  String get medal_desc_triple_perfect => '3 کامل دن حاصل کریں۔';

  @override
  String get medal_id_perfect_week => 'کامل ہفتہ';

  @override
  String get medal_sub_perfect_week => 'سات دن نہ ٹوٹے۔';

  @override
  String get medal_desc_perfect_week => 'مسلسل 7 کامل دن۔';

  @override
  String get medal_id_two_week_chain => 'پندرہ دن کی طاقت';

  @override
  String get medal_sub_two_week_chain => 'دو ہفتے آگ میں۔';

  @override
  String get medal_desc_two_week_chain => '14 دن کی زنجیر برقرار رکھیں۔';

  @override
  String get medal_id_iron_chain => 'لوہے کی زنجیر';

  @override
  String get medal_sub_iron_chain => '30 لنکس دھرے گئے۔';

  @override
  String get medal_desc_iron_chain => '30 دن کی زنجیر۔ سب سے مشکل کام کا تمغہ۔';

  @override
  String get medal_id_quarterly_chain => 'سہ ماہی زنجیر';

  @override
  String get medal_sub_quarterly_chain => 'ایک موسم، نہ ٹوٹا۔';

  @override
  String get medal_desc_quarterly_chain => '90 دن کی زنجیر۔ Legendary حیثیت۔';

  @override
  String get medal_id_vital_priority => 'ضروری شعلہ';

  @override
  String get medal_sub_vital_priority => 'آپ نے مشکل چنے۔';

  @override
  String get medal_desc_vital_priority => 'ضروری ترجیح والے 5 کام مکمل کریں۔';

  @override
  String get medal_id_spark_priority => 'شعلے پر قابو';

  @override
  String get medal_sub_spark_priority => 'تیز کامیابیاں جمع ہوتی ہیں۔';

  @override
  String get medal_desc_spark_priority => 'Spark ترجیح والے 5 کام مکمل کریں۔';

  @override
  String get medal_id_note_taker => 'نوٹ لینے والا';

  @override
  String get medal_sub_note_taker => 'کاغذ پر منصوبے ذہن سے بہتر ہیں۔';

  @override
  String get medal_desc_note_taker =>
      '5 مختلف کاموں میں تیاری کے نوٹس شامل کریں۔';

  @override
  String get medal_id_left_behind_rescuer => 'پیچھے چھوڑے گاؤں کا بچانے والا';

  @override
  String get medal_sub_left_behind_rescuer => 'کوئی کام پیچھے نہ چھوڑا۔';

  @override
  String get medal_desc_left_behind_rescuer =>
      'اگلے دن 3 چھوٹے ہوئے کام دوبارہ شامل کریں۔';

  @override
  String get medal_id_first_sprout => 'پہلا پودا';

  @override
  String get medal_sub_first_sprout => 'نئی روزانہ رسم۔';

  @override
  String get medal_desc_first_sprout => 'اپنی پہلی عادت لگائیں۔';

  @override
  String get medal_id_trio_sprout => 'تین پودے';

  @override
  String get medal_sub_trio_sprout => 'ایک چھوٹا نظام۔';

  @override
  String get medal_desc_trio_sprout => '3 مختلف عادات لگائیں۔';

  @override
  String get medal_id_week_of_growth => 'ترقی کا ہفتہ';

  @override
  String get medal_sub_week_of_growth => 'جڑیں پکڑنا شروع کرتی ہیں۔';

  @override
  String get medal_desc_week_of_growth =>
      '7 دن تک روزانہ عادت کی دیکھ بھال کریں۔';

  @override
  String get medal_id_fortnight_floret => 'پندرہ دن کا پھول';

  @override
  String get medal_sub_fortnight_floret => 'مکمل پھول۔';

  @override
  String get medal_desc_fortnight_floret => '14 دن کی عادت کی اسٹریک۔';

  @override
  String get medal_id_rooted_master => 'جڑیں پکڑنے والا ماہر';

  @override
  String get medal_sub_rooted_master => 'گہری جڑیں، گہری طاقت۔';

  @override
  String get medal_desc_rooted_master => '30 دن کی عادت کی اسٹریک۔';

  @override
  String get medal_id_half_year_bloom => 'آدھے سال کا پھول';

  @override
  String get medal_sub_half_year_bloom => 'اب باغ مستقل ہے۔';

  @override
  String get medal_desc_half_year_bloom => 'ایک عادت کو 180 دن برقرار رکھیں۔';

  @override
  String get medal_id_garden_keeper => 'باغ کا رکھوالا';

  @override
  String get medal_sub_garden_keeper => 'متنوعیت، ساتھ میں۔';

  @override
  String get medal_desc_garden_keeper => 'ایک ساتھ 4 مختلف عادات بڑھائیں۔';

  @override
  String get medal_id_hydration_hero => 'آب پاشی کا ہیرو';

  @override
  String get medal_sub_hydration_hero => 'آپ کنویں کو بھرتے ہیں۔';

  @override
  String get medal_desc_hydration_hero =>
      'آب پاشی کی عادت لگائیں (پانی/مشروب)۔';

  @override
  String get medal_id_mindful_mover => 'mindful حرکت کرنے والا';

  @override
  String get medal_sub_mindful_mover => 'جسم یاد رکھتا ہے۔';

  @override
  String get medal_desc_mindful_mover => 'حرکت کی عادت لگائیں (یوگا/پیدل/دوڑ)۔';

  @override
  String get medal_id_devoted_keeper => 'وقف رکھوالا';

  @override
  String get medal_sub_devoted_keeper => 'ساٹھ دن، ایک مشق۔';

  @override
  String get medal_desc_devoted_keeper =>
      'ایک عادت کو 60 دن تک روزانہ دیکھ بھال کریں۔';

  @override
  String get medal_id_tending_notes => 'دیکھ بھال کے نوٹس';

  @override
  String get medal_sub_tending_notes => 'جاتے جاتے غور کریں۔';

  @override
  String get medal_desc_tending_notes =>
      '3 عادات میں دیکھ بھال کے نوٹس شامل کریں۔';

  @override
  String get medalTierTaglineSprout => 'پہلا بیج لگائیں';

  @override
  String get medalTierTaglineCommon => 'عادت بنا رہے ہیں';

  @override
  String get medalTierTaglineRare => 'اصلی رفتار دکھا رہے ہیں';

  @override
  String get medalTierTaglineEpic => 'آپ قدرت کی طاقت ہیں';

  @override
  String get medalTierTaglineLegendary => '神话ی، تقریباً کوئی یہاں نہیں پہنچتا';

  @override
  String get guardianHeadlineNoTasks =>
      'آج کی زمین تازہ ہے۔\nاپنا پہلا بیج لگائیں\nاور اسے بڑھتا دیکھیں۔';

  @override
  String get guardianHeadlineAllDone =>
      'آپ نے جو ہر بیج لگایا\nوہ پھول میں ہے۔\nآرام کریں، نگہبان — آپ نے کما لیا۔';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count دن\nمسلسل ترقی کے۔\nآپ کا جنگل زندگی سے بھرا ہوا ہے۔';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'ایک پورا ہفتہ پھول میں،\nنگہبان۔\nایک اور کامل دن\nزنجیر بڑھاتا ہے۔';

  @override
  String get guardianHeadlineStreak3 =>
      'آپ کی زنجیر برقرار ہے۔\nابھی بھی کھلے بیجوں کی\nدیکھ بھال کریں۔';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'آپ کاموں کی اچھی دیکھ بھال کر رہے ہیں۔\nایک پودا لگائیں —\nعادات ہیں جو جنگل بڑھاتی ہیں۔';

  @override
  String get guardianHeadlineSomeDone =>
      'کچھ بیج کھلے،\nکچھ نہیں۔ کوئی بات نہیں۔\nکل ایک اور لگانے کا دن ہے۔';

  @override
  String get guardianHeadlineMorning =>
      'صبح بخیر، نگہبان۔\nدن ابھی جوان ہے\nاور زمین تیار ہے۔';

  @override
  String get guardianHeadlineAfternoon =>
      'دوپہر بخیر، نگہبان۔\nآدھی روشنی باقی ہے —\nجاری رکھیں۔';

  @override
  String get guardianHeadlineEvening =>
      'شام بخیر، نگہبان۔\nسورج غروب ہونے سے پہلے\nایک آخری جائزہ۔';

  @override
  String get guardianHeadlineNight =>
      'رات گئی ابھی بھی جاگ رہے ہیں؟\nنگہبان بھی آرام کرتے ہیں۔\nکل کا بیج ابھی لگائیں۔';

  @override
  String get guardianBodyNoTasks =>
      'آپ کا سینکچری ابھی خاموش ہے۔ ایک نیت شامل کریں اور دیکھیں شام تک کیا بدلتا ہے۔';

  @override
  String guardianBodyStreak14(int count) {
    return '$count دن سے چل رہا ہے۔ زنجیر قسمت نہیں — یہ چھوٹے انتخاب جمع ہو رہے ہیں۔ جمع ہونے دیں۔';
  }

  @override
  String guardianBodyStreak3(int count) {
    return '$count دن کی زنجیر اصلی رفتار ہے۔ آج کے کھلے بیج مکمل کریں۔';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'آپ نے ابھی تک $count کام لگائے ہیں۔ ایک عادت کا پودا شامل کرنے سے کام دن بدن جمع ہوتا رہے گا۔';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'آپ اپنے لگائے $pct% مکمل کر رہے ہیں۔ کم، تیز بیج بکھرے ہوئے دس بیجوں سے زیادہ اونچے اگتے ہیں۔';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'آپ کا سینکچری زندہ ہے۔ $tasks کام مکمل، $sprouts پودا(پودے) بڑھ رہا — کام نظر آ رہا ہے۔';
  }

  @override
  String get guardianInsightWaitingTitle => 'آپ کے پہلے قدم کا منتظر';

  @override
  String get guardianInsightWaitingBody =>
      'کام یا عادت شامل کریں اور میں آپ کے باغ میں پیٹرن پڑھنا شروع کروں گا۔ جتنا زیادہ لگائیں، میرے لیے سیکھنے کو اتنا زیادہ ہے۔';

  @override
  String get guardianInsightWaitingCta => 'اپنا پہلا بیج لگائیں';

  @override
  String get guardianInsightChainSuperTitle => 'زنجیر آپ کی طاقت ہے';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'آپ نے $count دن کی زنجیر برقرار رکھی ہے۔ اسٹریکس ہر بار حوصلے سے بہتر ہیں — اسے گرم رکھیں، سست دنوں میں بھی۔';
  }

  @override
  String get guardianInsightChainSuperCta => 'کل کا بیج شامل کریں';

  @override
  String get guardianInsightChainColdTitle => 'زنجیر ٹھنڈی ہے — نئی شروع کریں';

  @override
  String get guardianInsightChainColdBody =>
      'آپ پہلے بھی لگا چکے ہیں، جس کا مطلب ہے آپ دوبارہ لگا سکتے ہیں۔ آج ایک چھوٹا کام مکمل کرنا کل لمبی زنجیر ہے۔';

  @override
  String get guardianInsightChainColdCta => 'بیج لگائیں';

  @override
  String get guardianInsightLessIsMoreTitle => 'اس ہفتے کم زیادہ ہے';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'آپ اپنے لگائے $pct% مکمل کرتے ہیں۔ 5 بکھرے ہوئے کاموں کی بجائے 3 تیز نیتیں آزمائیں — معیار جمع ہوتا ہے۔';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'دن تیز کریں';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'اگلا تمغہ: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'آپ $target میں سے $value $unit تک ہیں۔ چند اور ایمانداری والے دن اور یہ آپ کا ہے۔';
  }

  @override
  String get guardianInsightNextMedalCta => 'تمغہ دکھائیں';

  @override
  String get guardianInsightSteadyTitle => 'آپ ایک مستحکل موسم میں ہیں';

  @override
  String get guardianInsightSteadyBody =>
      'قریب کوئی تمغہ نہیں — ٹھیک ہے۔ جو ہے اس کی دیکھ بھال کریں۔ اگلا پھول رستے میں ہے۔';

  @override
  String get guardianInsightSteadyCta => 'پیشرفت دیکھیں';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      'آپ کی زنجیر پر 1 کام باقی ہے۔ رات قریب ہے۔';

  @override
  String notificationFinalCallBodyMany(int count) {
    return 'آپ کی زنجیر پر $count کام باقی ہیں۔ رات قریب ہے۔';
  }

  @override
  String get notificationEveningBodyOne => 'آج ابھی بھی 1 کام کھلا ہے۔';

  @override
  String notificationEveningBodyMany(int count) {
    return 'آج ابھی بھی $count کام کھلے ہیں۔';
  }

  @override
  String get notificationTickerTaskReminder => 'کام کی یاد دہانی';

  @override
  String get notificationTickerTaskAlarm => 'کام کا الارم';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count دن کی اسٹریک · $element';
  }
}
