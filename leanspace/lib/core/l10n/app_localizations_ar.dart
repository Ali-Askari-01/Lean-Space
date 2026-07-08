// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'بلوم تراكر';

  @override
  String get tabToday => 'اليوم';

  @override
  String get tabProgress => 'التقدم';

  @override
  String get tabYou => 'أنت';

  @override
  String get navMyDay => 'يومي';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get navHelp => 'المساعدة والدعم';

  @override
  String get navHistory => 'آخر 7 أيام';

  @override
  String get navLeftBehind => 'المتروكة';

  @override
  String get navInsights => 'تقدمك';

  @override
  String get navMedals => 'ميدالياتي';

  @override
  String get navManagePro => 'إدارة اشتراك Pro';

  @override
  String get navPaywall => 'بلوم تراكر Pro';

  @override
  String get greetingLateNight => 'تسهر حتى منتصف الليل';

  @override
  String get greetingMorning => 'صباح الخير، أيتها الشمس!';

  @override
  String get greetingAfternoon => 'مساء الخير، يا صديق';

  @override
  String get greetingEvening => 'مساء الخير، أيها البطل';

  @override
  String get greetingNight => 'ترتاح جيداً، أيها الحارس؟';

  @override
  String todayTasksCount(String done, String total) {
    return 'اليوم · $done من $total مهمة';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done من $total عادات';
  }

  @override
  String get todayChainGrows => 'السلسلة تنمو كلما أنهيت';

  @override
  String get todayChainComplete => 'السلسلة مكتملة · اعتنِ بالحديقة غداً';

  @override
  String get taskCapInfo => 'لماذا حد 5 مهام؟';

  @override
  String get taskCapDiscipline => 'الانضباط أولاً';

  @override
  String get taskCapTitle => 'نحدد يومك بـ 5 مهام عمداً.';

  @override
  String get taskCapBody =>
      'السلاسل الصغيرة أفضل من الطويلة. من المرجح أن تنهي 3 من 5 وتشعر بالانتصار بدلاً من أن تتخلى عن 8 من 10 وتشعر بالخسارة.';

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
  String get tasksHeader => 'المهام';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'أضف بذرة مهمة';

  @override
  String get tasksCapReached =>
      'تم استخدام 5/5 خانات — أنهِ واحدة لزرع بذرة جديدة.';

  @override
  String get tasksEmptyCta => 'ازرع أول بذرة — ما الذي يهم اليوم؟';

  @override
  String get habitsHeader => 'العادات';

  @override
  String habitsGrowing(String count) {
    return '$count growing';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Best $days d';
  }

  @override
  String get habitsPlantNew => 'ازرع عادة جديدة';

  @override
  String get habitsPlantFirst => 'ازرع عادة';

  @override
  String get habitsLocked => 'خانة عادة Pro — افتح لزرع المزيد';

  @override
  String get habitsCadence => 'يومي';

  @override
  String leftBehindBanner(String count) {
    return '$count missed — still in Left Behind';
  }

  @override
  String get leftBehindTap => 'انقر للإضافة مرة أخرى أو اتركها';

  @override
  String get leftBehindDismiss => 'تجاهل';

  @override
  String get leftBehindTitle => 'المتروكة';

  @override
  String get leftBehindEmpty => 'لا شيء متروك';

  @override
  String get leftBehindEmptyBody =>
      'لا توجد مهام فائتة. كل بذرة تزرعها يتم الاعتناء بها. الحديقة نظيفة.';

  @override
  String get leftBehindClearAll => 'مسح الكل';

  @override
  String get leftBehindClearAllConfirm => 'مسح كل المتروك؟';

  @override
  String leftBehindClearAllBody(String count) {
    return 'This will permanently remove $count missed task(s). You can\'t undo this.';
  }

  @override
  String get leftBehindReAdd => 'Re-add today';

  @override
  String get leftBehindLetGo => 'اتركها';

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
  String get medalsTitle => 'ميدالياتي';

  @override
  String get medalsTrophyRoom => 'غرفة الكؤوس';

  @override
  String get medalsAllMedals => 'كل الميداليات';

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
    return 'التقدم نحو $total ميدالية';
  }

  @override
  String get medalsShareCta => 'أنشئ بطاقة قابلة للمشاركة';

  @override
  String get medalsEmptyTitle => 'لا شيء في هذه الفئة بعد';

  @override
  String get medalsEmptyBody => 'أنهِ مهمة أو اعتنِ ببرعم لبدء غرفة الكؤوس.';

  @override
  String get medalSheetLocked => 'ميدالية PRO';

  @override
  String medalSheetEarned(String tier) {
    return 'مُكتسبة · $tier';
  }

  @override
  String get medalSheetUnlock => 'افتح مع Pro';

  @override
  String get medalSheetProgress => 'التقدم';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Just $n more $unit to unlock.';
  }

  @override
  String get medalSheetAlmost => 'خطوة واحدة للفتح.';

  @override
  String get medalCategory => 'الفئة';

  @override
  String get medalShareOnSocials => 'شارك على وسائل التواصل';

  @override
  String get medalShareLater => 'لاحقاً';

  @override
  String get medalUnlocked => 'تم فتح الميدالية';

  @override
  String get medalProgressTitle => 'التقدم';

  @override
  String get historyTitle => 'آخر 7 أيام';

  @override
  String historyThisWeek(String days) {
    return 'LAST $days DAYS';
  }

  @override
  String get historyDayByDay => 'يوم بيوم';

  @override
  String get historyEmpty => 'Plant some seeds to see your week unfold.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'You finished $done of $total tasks. $perfect perfect day(s).';
  }

  @override
  String get historyUpsellTitle => 'اعرض سجلك الكامل';

  @override
  String get historyUpsellBody => 'يفتح Pro 30 يوماً من السجل. المجاني يعرض 7.';

  @override
  String get historyPerfect => 'مثالي';

  @override
  String get historyFrozen => 'مجمد';

  @override
  String get historyToday => 'اليوم';

  @override
  String get historyEmptyDay => 'لم تزرع أي بذرة في ذلك اليوم';

  @override
  String historyLeftBehindCount(String count) {
    return '$count left behind';
  }

  @override
  String get progressVitality => 'حيوية اليوم';

  @override
  String get progressVitalityEmpty => 'ازرع بذرة لبدء حديقتك.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done of $total seeds planted today.';
  }

  @override
  String progressChainPill(String days) {
    return 'سلسلة $daysي';
  }

  @override
  String get progressMetricCurrent => 'الحالية';

  @override
  String get progressMetricBest => 'الأفضل';

  @override
  String get progressMetricDone => 'منجزة';

  @override
  String get progressMetricPerfect => 'مثالية';

  @override
  String get progressMetricHabits => 'العادات';

  @override
  String get progressHabitBlooms => 'إزهار العادات';

  @override
  String get progressHabitBloomsSub =>
      'معالم السلسلة للبراعم التي تسقيها يومياً.';

  @override
  String get progressNextBadge => 'الشارة التالية';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned of $total';
  }

  @override
  String get progressPersonalActivity => 'النشاط الشخصي';

  @override
  String progressBrowseMonth(String month) {
    return 'Browsing $month. Tap \"Today\" to jump back to your live activity.';
  }

  @override
  String get progressJumpToToday => 'اليوم';

  @override
  String get progressCalendarLegend => 'الأغمق = الأكثر إنجازاً';

  @override
  String get progressCalendarBody =>
      'الأخضر الغامق يعني يوماً مثالياً. يتلاشى اللون كلما تخطيت.';

  @override
  String get paywallTitle => 'لا تكسر السلسلة.';

  @override
  String get paywallSubtitle => 'يمنحك Bloom Tracker Pro نظام الانضباط الكامل.';

  @override
  String get paywallFeatures =>
      'All 5 habit slots, not just 3|Your full history, forever|The full medal set|Streak freeze every month|Weekly Receipt + share cards|Themes + more';

  @override
  String get paywallFeaturesBodies =>
      'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.|Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.|Unlock Legendary tier medals. The rarest badges are for the people who go all in.|2 streak freezes a month so a single bad day doesn\'t end your chain.|Beautiful share cards of your week. Post your chain, inspire someone else to start.|Unlock new accent colors and themes as we add them. Always free updates.';

  @override
  String get paywallYearly => 'سنوي';

  @override
  String get paywallYearlyCaption => 'أفضل قيمة · ~2.50\$/شهر';

  @override
  String get paywallYearlyBadge => 'وفر 35%';

  @override
  String get paywallMonthly => 'شهري';

  @override
  String get paywallMonthlyCaption => 'فوتر شهري · إلغاء في أي وقت';

  @override
  String paywallStartCta(String price) {
    return 'ابدأ Pro · $price/سنة';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'ابدأ Pro · $price/شهر';
  }

  @override
  String get paywallRestore => 'استعادة الشراء';

  @override
  String get paywallTerms => 'الشروط';

  @override
  String get paywallPrivacy => 'الخصوصية';

  @override
  String get paywallNoRestore =>
      'لم يتم العثور على عملية شراء سابقة على هذا الحساب.';

  @override
  String get paywallRestoreLater =>
      'سنستعيد عملية الشراء عند المزامنة التالية.';

  @override
  String get paywallAlreadyPro => 'أنت على Pro. شكراً لدعمك.';

  @override
  String get paywallHabitSlotHead =>
      'لقد استخدمت كل خانات العادات المجانية. افتح المجموعة الكاملة.';

  @override
  String get paywallHistoryHead =>
      'اعرض سجلك الكامل — كل يوم مثالي، كل ميدالية، كل عودة.';

  @override
  String get paywallMedalHead =>
      'ال ميداليات النادرة حصرية لـ Pro. استمر — أنت أقرب مما تظن.';

  @override
  String get settingsYourActivity => 'نشاطك';

  @override
  String get settingsHelpInfo => 'مساعدة ومعلومات';

  @override
  String get settingsAccount => 'الحساب';

  @override
  String get settingsNurturingTools => 'أدوات';

  @override
  String get settingsReminders => 'التذكيرات';

  @override
  String get settingsWidgetSanctuary => 'الودجة';

  @override
  String get settingsEcosystemSupport => 'الدعم';

  @override
  String get settingsHowItWorks => 'كيف يعمل';

  @override
  String get settingsSignOut => 'تسجيل الخروج';

  @override
  String get settingsProActive => 'نشط';

  @override
  String get settingsProFree => 'المستوى المجاني';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsLanguageValue => 'افتراضي النظام';

  @override
  String get firstRunGreeting => '5 مهام. لا أكثر. اجعلها ذات قيمة.';

  @override
  String get firstRunBody => 'ازرع أول بذرة — ما الذي يهم اليوم؟';

  @override
  String get firstRunCta => 'ازرع أول بذرة';

  @override
  String get emptyStateClearAll => 'مسح الكل';

  @override
  String get cancel => 'إلغاء';

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
  String get shareCardSnapshot => 'لقطة من محرابك';

  @override
  String get shareCardBody =>
      'The card above is exported as a PNG and sent to your share sheet. Post it on your story, send it to a friend, or print it as a sticker.';

  @override
  String get shareCardShareMyBloom => 'شارك إزهارتي';

  @override
  String get shareCardCouldNotShare => 'لا يمكن المشاركة الآن';

  @override
  String shareCardProgressText(String year) {
    return 'تقدمي في Bloom Tracker — $year على Bloom Tracker.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'لقد فتحت للتو ميدالية \"$title\" في Bloom Tracker. $subtitle';
  }

  @override
  String get howItWorksTitle => 'كيف يعمل';

  @override
  String get howItWorksBody =>
      'يساعدك Bloom Tracker في الحفاظ على سلسلة انضباط صغيرة لا تنكسر. هذا كل شيء.';

  @override
  String get howItWorksToday => 'علامة تبويب اليوم';

  @override
  String get howItWorksTodayBody =>
      'هذا هو منزلك. يعرض 5 المهام والعادات التي حددتها لليوم. أنهها قبل منتصف الليل، السلسلة تتمدد.';

  @override
  String get howItWorksCap => 'حد الـ 5 مهام هو الميزة';

  @override
  String get howItWorksCapBody =>
      'لا نسمح لك بإضافة السادس. هذه هي النقطة. انقر \"?\" على الشاشة الرئيسية للشرح الكامل.';

  @override
  String get howItWorksHabits => 'العادات يومية، السلسلة للأبد';

  @override
  String get howItWorksHabitsBody =>
      'العادات (يوغا الصباح، شرب الماء) تعيش للأبد. المهام لمرة واحدة. كلاهما يغذي نفس السلسلة.';

  @override
  String get howItWorksLeftBehind => 'المهام الفائتة → المتروكة';

  @override
  String get howItWorksLeftBehindBody =>
      'عند منتصف الليل، المهام غير المكتملة تنتقل إلى المتروكة. أعد إضافة ما يهم فقط.';

  @override
  String get howItWorksProgress => 'علامة تبويب التقدم';

  @override
  String get howItWorksProgressBody =>
      'السلسلة، التقويم، الميداليات، السجل — كل شيء عن تقدمك مع الوقت. لا شيء عاجل هنا.';

  @override
  String get howItWorksYou => 'علامة تبويب أنت';

  @override
  String get howItWorksYouBody => 'حسابك، الإعدادات، تسجيل الخروج. هذا كل شيء.';

  @override
  String get howItWorksRule => 'القاعدة: 5 أشياء صغيرة، كل يوم، بدون أعذار.';

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
