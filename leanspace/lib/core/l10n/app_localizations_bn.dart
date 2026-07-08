// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'ব্লুম ট্র্যাকার';

  @override
  String get tabToday => 'আজ';

  @override
  String get tabProgress => 'অগ্রগতি';

  @override
  String get tabYou => 'আপনি';

  @override
  String get navMyDay => 'আমার দিন';

  @override
  String get navSettings => 'সেটিংস';

  @override
  String get navHelp => 'Help & Support';

  @override
  String get navHistory => 'গত ৭ দিন';

  @override
  String get navLeftBehind => 'ফেলে রাখা';

  @override
  String get navInsights => 'Your progress';

  @override
  String get navMedals => 'আমার পদক';

  @override
  String get navManagePro => 'Manage Pro subscription';

  @override
  String get navPaywall => 'ব্লুম ট্র্যাকার Pro';

  @override
  String get greetingLateNight => 'Burning the midnight oil';

  @override
  String get greetingMorning => 'সুপ্রভাত, সূর্য!';

  @override
  String get greetingAfternoon => 'নমস্কার, বন্ধু';

  @override
  String get greetingEvening => 'শুভ সন্ধ্যা, চ্যাম্পিয়ন';

  @override
  String get greetingNight => 'ভালো ঘুমাচ্ছেন, রক্ষক?';

  @override
  String todayTasksCount(String done, String total) {
    return 'আজ · $total টির মধ্যে $done টি কাজ';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done of $total habits';
  }

  @override
  String get todayChainGrows => 'CHAIN GROWS AS YOU FINISH';

  @override
  String get todayChainComplete => 'CHAIN COMPLETE · TEND THE GARDEN TOMORROW';

  @override
  String get taskCapInfo => 'Why a 5-task cap?';

  @override
  String get taskCapDiscipline => 'DISCIPLINE-FIRST BY DESIGN';

  @override
  String get taskCapTitle => 'We cap your day at 5 tasks on purpose.';

  @override
  String get taskCapBody =>
      'Small chains beat long ones. You\'re more likely to finish 3 of 5 and feel the win than to abandon 8 of 10 and feel the loss.';

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
  String get tasksHeader => 'কাজ';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'একটি কাজের বীজ যোগ করুন';

  @override
  String get tasksCapReached =>
      '5/5 slots used — finish one to plant a new seed.';

  @override
  String get tasksEmptyCta => 'Plant your first seed — what matters today?';

  @override
  String get habitsHeader => 'অভ্যাস';

  @override
  String habitsGrowing(String count) {
    return '$count growing';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Best $days d';
  }

  @override
  String get habitsPlantNew => 'Plant a new habit sprout';

  @override
  String get habitsPlantFirst => 'অভ্যাস রোপণ করুন';

  @override
  String get habitsLocked => 'Pro habit slot — unlock to plant more sprouts';

  @override
  String get habitsCadence => 'দৈনিক';

  @override
  String leftBehindBanner(String count) {
    return '$count missed — still in Left Behind';
  }

  @override
  String get leftBehindTap => 'Tap to re-add or let go';

  @override
  String get leftBehindDismiss => 'বাতিল';

  @override
  String get leftBehindTitle => 'ফেলে রাখা';

  @override
  String get leftBehindEmpty => 'কিছুই ফেলে রাখা হয়নি';

  @override
  String get leftBehindEmptyBody =>
      'No missed tasks. Every seed you plant is being tended. The garden is clean.';

  @override
  String get leftBehindClearAll => 'সব মুছুন';

  @override
  String get leftBehindClearAllConfirm => 'Clear all left-behind?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'This will permanently remove $count missed task(s). You can\'t undo this.';
  }

  @override
  String get leftBehindReAdd => 'Re-add today';

  @override
  String get leftBehindLetGo => 'ছেড়ে দিন';

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
  String get medalsTitle => 'আমার পদক';

  @override
  String get medalsTrophyRoom => 'ট্রফি রুম';

  @override
  String get medalsAllMedals => 'সব পদক';

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
    return 'Progress to all $total medals';
  }

  @override
  String get medalsShareCta => 'ভাগযোগ্য কার্ড তৈরি করুন';

  @override
  String get medalsEmptyTitle => 'Nothing in this category yet';

  @override
  String get medalsEmptyBody =>
      'Finish a task or tend a sprout to start your trophy room.';

  @override
  String get medalSheetLocked => 'Pro পদক';

  @override
  String medalSheetEarned(String tier) {
    return 'EARNED · $tier';
  }

  @override
  String get medalSheetUnlock => 'Pro দিয়ে আনলক করুন';

  @override
  String get medalSheetProgress => 'Progress';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Just $n more $unit to unlock.';
  }

  @override
  String get medalSheetAlmost => 'One more step to unlock.';

  @override
  String get medalCategory => 'বিভাগ';

  @override
  String get medalShareOnSocials => 'সোশ্যালে শেয়ার করুন';

  @override
  String get medalShareLater => 'পরে হবে';

  @override
  String get medalUnlocked => 'পদক আনলক হয়েছে';

  @override
  String get medalProgressTitle => 'Progress';

  @override
  String get historyTitle => 'গত ৭ দিন';

  @override
  String historyThisWeek(String days) {
    return 'LAST $days DAYS';
  }

  @override
  String get historyDayByDay => 'দিন-প্রতি-দিন';

  @override
  String get historyEmpty => 'Plant some seeds to see your week unfold.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'You finished $done of $total tasks. $perfect perfect day(s).';
  }

  @override
  String get historyUpsellTitle => 'আপনার সম্পূর্ণ ইতিহাস দেখুন';

  @override
  String get historyUpsellBody =>
      'Pro ৩০ দিনের ইতিহাস আনলক করে। ফ্রি ৭ দেখায়।';

  @override
  String get historyPerfect => 'নিখুঁত';

  @override
  String get historyFrozen => 'FROZEN';

  @override
  String get historyToday => 'আজ';

  @override
  String get historyEmptyDay => 'No seeds planted that day';

  @override
  String historyLeftBehindCount(String count) {
    return '$count left behind';
  }

  @override
  String get progressVitality => 'আজকের প্রাণশক্তি';

  @override
  String get progressVitalityEmpty => 'Plant a seed to begin your garden.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done of $total seeds planted today.';
  }

  @override
  String progressChainPill(String days) {
    return '$days দিনের চেইন';
  }

  @override
  String get progressMetricCurrent => 'বর্তমান';

  @override
  String get progressMetricBest => 'সেরা';

  @override
  String get progressMetricDone => 'সম্পন্ন';

  @override
  String get progressMetricPerfect => 'নিখুঁত';

  @override
  String get progressMetricHabits => 'অভ্যাস';

  @override
  String get progressHabitBlooms => 'Habit blooms';

  @override
  String get progressHabitBloomsSub =>
      'Streak milestones for the sprouts you water daily.';

  @override
  String get progressNextBadge => 'পরবর্তী ব্যাজ';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned of $total';
  }

  @override
  String get progressPersonalActivity => 'Personal Activity';

  @override
  String progressBrowseMonth(String month) {
    return 'Browsing $month. Tap \"Today\" to jump back to your live activity.';
  }

  @override
  String get progressJumpToToday => 'আজ';

  @override
  String get progressCalendarLegend => 'গাঢ় = বেশি সম্পন্ন';

  @override
  String get progressCalendarBody =>
      'Dark green means a perfect day. The shade fades as you skip.';

  @override
  String get paywallTitle => 'Keep the chain unbroken.';

  @override
  String get paywallSubtitle =>
      'Bloom Tracker Pro gives you the full discipline system.';

  @override
  String get paywallFeatures =>
      'All 5 habit slots, not just 3|Your full history, forever|The full medal set|Streak freeze every month|Weekly Receipt + share cards|Themes + more';

  @override
  String get paywallFeaturesBodies =>
      'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.|Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.|Unlock Legendary tier medals. The rarest badges are for the people who go all in.|2 streak freezes a month so a single bad day doesn\'t end your chain.|Beautiful share cards of your week. Post your chain, inspire someone else to start.|Unlock new accent colors and themes as we add them. Always free updates.';

  @override
  String get paywallYearly => 'বার্ষিক';

  @override
  String get paywallYearlyCaption => 'Best value · works out to ~2.50 USD/mo';

  @override
  String get paywallYearlyBadge => 'SAVE 35%';

  @override
  String get paywallMonthly => 'মাসিক';

  @override
  String get paywallMonthlyCaption => 'Billed every month · cancel anytime';

  @override
  String paywallStartCta(String price) {
    return 'Start Pro · $price/yr';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Start Pro · $price/mo';
  }

  @override
  String get paywallRestore => 'ক্রয় পুনরুদ্ধার';

  @override
  String get paywallTerms => 'শর্তাবলী';

  @override
  String get paywallPrivacy => 'গোপনীয়তা';

  @override
  String get paywallNoRestore => 'No previous purchase found on this account.';

  @override
  String get paywallRestoreLater =>
      'We\'ll restore your purchase on the next sync.';

  @override
  String get paywallAlreadyPro => 'You\'re on Pro. Thank you for the support.';

  @override
  String get paywallHabitSlotHead =>
      'You\'ve used all your free habit slots. Unlock the full set to plant every ritual you care about.';

  @override
  String get paywallHistoryHead =>
      'See your full history — every perfect day, every medal, every comeback.';

  @override
  String get paywallMedalHead =>
      'The rarest medals are Pro-only. Keep going — they\'re closer than you think.';

  @override
  String get settingsYourActivity => 'আপনার কার্যকলাপ';

  @override
  String get settingsHelpInfo => 'সাহায্য ও তথ্য';

  @override
  String get settingsAccount => 'অ্যাকাউন্ট';

  @override
  String get settingsNurturingTools => 'NURTURING TOOLS';

  @override
  String get settingsReminders => 'REMINDERS';

  @override
  String get settingsWidgetSanctuary => 'WIDGET SANCTUARY';

  @override
  String get settingsEcosystemSupport => 'ECOSYSTEM SUPPORT';

  @override
  String get settingsHowItWorks => 'এটি কীভাবে কাজ করে';

  @override
  String get settingsSignOut => 'সাইন আউট';

  @override
  String get settingsProActive => 'Active';

  @override
  String get settingsProFree => 'Free tier';

  @override
  String get settingsLanguage => 'ভাষা';

  @override
  String get settingsLanguageValue => 'সিস্টেম ডিফল্ট';

  @override
  String get firstRunGreeting =>
      '৫টি কাজ। এর বেশি নয়। সেগুলোকে গুরুত্বপূর্ণ করুন।';

  @override
  String get firstRunBody => 'Plant your first seed — what matters most today?';

  @override
  String get firstRunCta => 'আমার প্রথম বীজ রোপণ করুন';

  @override
  String get emptyStateClearAll => 'Clear all';

  @override
  String get cancel => 'বাতিল';

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
  String get shareCardSnapshot => 'আপনার আশ্রয়ের একটি ঝলক';

  @override
  String get shareCardBody =>
      'The card above is exported as a PNG and sent to your share sheet. Post it on your story, send it to a friend, or print it as a sticker.';

  @override
  String get shareCardShareMyBloom => 'আমার ফুল ভাগ করুন';

  @override
  String get shareCardCouldNotShare => 'Could not share right now';

  @override
  String shareCardProgressText(String year) {
    return 'My Bloom Tracker progress — $year on Bloom Tracker.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'I just unlocked the \"$title\" medal on Bloom Tracker. $subtitle';
  }

  @override
  String get howItWorksTitle => 'How this works';

  @override
  String get howItWorksBody =>
      'Bloom Tracker helps you keep a small, unbroken chain of discipline. That\'s it.';

  @override
  String get howItWorksToday => 'The Today tab';

  @override
  String get howItWorksTodayBody =>
      'This is your home. It shows the 5 tasks and the habits you set for today. Finish them by midnight, the chain extends.';

  @override
  String get howItWorksCap => 'The 5-task cap is the feature';

  @override
  String get howItWorksCapBody =>
      'We don\'t let you add a 6th. That\'s the whole point. Small chains beat long ones. Tap the \"?\" on the home screen for the full reasoning.';

  @override
  String get howItWorksHabits => 'Habits are daily, the chain is forever';

  @override
  String get howItWorksHabitsBody =>
      'Habits (Morning yoga, Drink water) live forever. Tasks are one-shot. Both feed the same streak.';

  @override
  String get howItWorksLeftBehind => 'Missed tasks → Left Behind';

  @override
  String get howItWorksLeftBehindBody =>
      'At midnight, unfinished tasks move to Left Behind. Re-add only what still matters. The rest gets a quiet let-go.';

  @override
  String get howItWorksProgress => 'The Progress tab';

  @override
  String get howItWorksProgressBody =>
      'Streak, calendar, medals, history — everything about how you\'re doing over time. Nothing urgent lives here.';

  @override
  String get howItWorksYou => 'The You tab';

  @override
  String get howItWorksYouBody =>
      'Your account, settings, sign out. That\'s all.';

  @override
  String get howItWorksRule =>
      'The rule: 5 small things, every day, no excuses.';

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
