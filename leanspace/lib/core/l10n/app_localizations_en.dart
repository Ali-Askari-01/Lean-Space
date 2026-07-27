// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Daily Stitch';

  @override
  String get tabToday => 'Today';

  @override
  String get tabProgress => 'Progress';

  @override
  String get tabYou => 'You';

  @override
  String get navMyDay => 'My Day';

  @override
  String get navSettings => 'Settings';

  @override
  String get navHelp => 'Help & Support';

  @override
  String get navHistory => 'Last 7 Days';

  @override
  String get navLeftBehind => 'Left Behind';

  @override
  String get navInsights => 'Your progress';

  @override
  String get navMedals => 'My Medals';

  @override
  String get navManagePro => 'Manage Pro subscription';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight => 'Burning the midnight oil';

  @override
  String get greetingMorning => 'Morning, Sunshine!';

  @override
  String get greetingAfternoon => 'Afternoon, Friend';

  @override
  String get greetingEvening => 'Evening, Champion';

  @override
  String get greetingNight => 'Resting well, Guardian?';

  @override
  String todayTasksCount(String done, String total) {
    return 'Today · $done of $total tasks';
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
  String get tasksHeader => 'Tasks';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Add a task seed';

  @override
  String get tasksCapReached =>
      '5/5 slots used — finish one to plant a new seed.';

  @override
  String get tasksEmptyCta => 'Plant your first seed — what matters today?';

  @override
  String get habitsHeader => 'Habits';

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
  String get habitsPlantFirst => 'Plant a habit';

  @override
  String get habitsLocked => 'Pro habit slot — unlock to plant more sprouts';

  @override
  String get habitsSlotsFull => 'All habit slots are currently full.';

  @override
  String habitsStreakDays(String days) {
    return '${days}d';
  }

  @override
  String get habitsCadence => 'DAILY';

  @override
  String leftBehindBanner(String count) {
    return '$count missed — still in Left Behind';
  }

  @override
  String get leftBehindTap => 'Tap to re-add or let go';

  @override
  String get leftBehindDismiss => 'Dismiss';

  @override
  String get leftBehindTitle => 'Left Behind';

  @override
  String get leftBehindEmpty => 'Nothing left behind';

  @override
  String get leftBehindEmptyBody =>
      'No missed tasks. Every seed you plant is being tended. The garden is clean.';

  @override
  String get leftBehindClearAll => 'Clear all';

  @override
  String get leftBehindClearAllConfirm => 'Clear all left-behind?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'This will permanently remove $count missed task(s). You can\'t undo this.';
  }

  @override
  String get leftBehindReAdd => 'Re-add today';

  @override
  String get leftBehindReAddButton => 'Re-add';

  @override
  String get leftBehindAddedToToday => 'Added to today';

  @override
  String get leftBehindLetGo => 'Let it go';

  @override
  String get leftBehindHeader => 'LEFT BEHIND';

  @override
  String get leftBehindMissedTasks => 'MISSED TASKS';

  @override
  String get leftBehindWaitingOne => '1 task is waiting for you.';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count tasks are waiting for you.';
  }

  @override
  String get leftBehindBody =>
      'Re-add a task to bring it back to today, or let it go. Re-adding keeps your streak alive.';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" is back in your day.';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return 'Removed \"$task\"';
  }

  @override
  String get leftBehindClearedSnack => 'Left-behind cleared';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Yesterday · $date';
  }

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
  String get streakFreezeUse => 'Use freeze';

  @override
  String get streakFreezeUseForYesterday =>
      'Use monthly streak freeze for yesterday';

  @override
  String get streakFreezeAppliedYesterday =>
      'Streak freeze applied for yesterday.';

  @override
  String get chainBrokenTitle => 'The chain broke. That\'s okay.';

  @override
  String get chainBrokenBody =>
      'Every long chain ends once. What matters is what you plant today. One perfect day starts the next one.';

  @override
  String get chainBrokenCta => 'Get back to today';

  @override
  String get chainBrokenPlantFirst => 'Plant today\'s first seed';

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
  String get medalsTitle => 'My Medals';

  @override
  String get medalsTrophyRoom => 'Trophy Room';

  @override
  String get medalsAllMedals => 'All Medals';

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
  String get medalsShareCta => 'Create a shareable card';

  @override
  String get medalsEmptyTitle => 'Nothing in this category yet';

  @override
  String get medalsEmptyBody =>
      'Finish a task or tend a sprout to start your trophy room.';

  @override
  String get medalSheetLocked => 'PRO MEDAL';

  @override
  String medalSheetEarned(String tier) {
    return 'EARNED · $tier';
  }

  @override
  String get medalSheetUnlock => 'Unlock with Pro';

  @override
  String get medalSheetProgress => 'Progress';

  @override
  String medalSheetHint(String n, String unit) {
    return 'Just $n more $unit to unlock.';
  }

  @override
  String get medalSheetAlmost => 'One more step to unlock.';

  @override
  String get medalCategory => 'Category';

  @override
  String get medalShareOnSocials => 'Share on your socials';

  @override
  String get medalShareLater => 'Maybe later';

  @override
  String get medalUnlocked => 'MEDAL UNLOCKED';

  @override
  String get medalProgressTitle => 'Progress';

  @override
  String get historyTitle => 'Last 7 Days';

  @override
  String get historyFullTitle => 'Full history';

  @override
  String get historyLoadError => 'Could not load history.';

  @override
  String get historyFullCalendar => 'Full calendar';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% completed';
  }

  @override
  String historyThisWeek(String days) {
    return 'LAST $days DAYS';
  }

  @override
  String get historyDayByDay => 'DAY BY DAY';

  @override
  String get historyEmpty => 'Plant some seeds to see your week unfold.';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'You finished $done of $total tasks. $perfect perfect day(s).';
  }

  @override
  String get historyUpsellTitle => 'See your full history';

  @override
  String get historyUpsellBody =>
      'Pro unlocks 30 days of history. Free shows 7.';

  @override
  String get historyPerfect => 'PERFECT';

  @override
  String get historyFrozen => 'FROZEN';

  @override
  String get historyToday => 'Today';

  @override
  String get historyEmptyDay => 'No seeds planted that day';

  @override
  String historyLeftBehindCount(String count) {
    return '$count left behind';
  }

  @override
  String get progressVitality => 'TODAY\'S VITALITY';

  @override
  String get progressVitalityEmpty => 'Plant a seed to begin your garden.';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done of $total seeds planted today.';
  }

  @override
  String progressChainPill(String days) {
    return '${days}d chain';
  }

  @override
  String get progressMetricCurrent => 'Current';

  @override
  String get progressMetricBest => 'Best';

  @override
  String get progressMetricDone => 'Done';

  @override
  String get progressMetricPerfect => 'Perfect';

  @override
  String get progressMetricHabits => 'Habits';

  @override
  String get progressHabitBlooms => 'Habit blooms';

  @override
  String get progressHabitBloomsSub =>
      'Streak milestones for the sprouts you water daily.';

  @override
  String get progressNextBadge => 'Next badge';

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
  String get progressJumpToToday => 'Today';

  @override
  String get progressCalendarLegend => 'darker = more finished';

  @override
  String get progressCalendarBody =>
      'Dark green means a perfect day. The shade fades as you skip.';

  @override
  String get paywallTitle => 'Keep the chain unbroken.';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro gives you the full discipline system.';

  @override
  String get paywallFeatures =>
      'All 5 habit slots, not just 3|Your full history, forever|The full medal set|Streak freeze every month|Weekly Receipt + share cards|Themes + more';

  @override
  String get paywallFeaturesBodies =>
      'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.|Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.|Unlock Legendary tier medals. The rarest badges are for the people who go all in.|2 streak freezes a month so a single bad day doesn\'t end your chain.|Beautiful share cards of your week. Post your chain, inspire someone else to start.|Unlock new accent colors and themes as we add them. Always free updates.';

  @override
  String get paywallYearly => 'Yearly';

  @override
  String get paywallYearlyCaption => 'Best value · works out to ~2.50 USD/mo';

  @override
  String get paywallYearlyBadge => 'SAVE 35%';

  @override
  String get paywallMonthly => 'Monthly';

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
  String get paywallRestore => 'Restore purchase';

  @override
  String get paywallTerms => 'Terms';

  @override
  String get paywallPrivacy => 'Privacy';

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
  String get settingsYourActivity => 'YOUR ACTIVITY';

  @override
  String get settingsHelpInfo => 'HELP & INFO';

  @override
  String get settingsAccount => 'ACCOUNT';

  @override
  String get settingsNurturingTools => 'NURTURING TOOLS';

  @override
  String get settingsReminders => 'REMINDERS';

  @override
  String get settingsWidgetSanctuary => 'WIDGET SANCTUARY';

  @override
  String get settingsEcosystemSupport => 'ECOSYSTEM SUPPORT';

  @override
  String get settingsHowItWorks => 'How this works';

  @override
  String get settingsSignOut => 'Sign out';

  @override
  String get settingsSignOutConfirm => 'Are you sure you want to sign out?';

  @override
  String get settingsProActive => 'Active';

  @override
  String get settingsProFree => 'Free tier';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageValue => 'System default';

  @override
  String get firstRunGreeting => '5 tasks. No more. Make them count.';

  @override
  String get firstRunBody => 'Plant your first seed — what matters most today?';

  @override
  String get firstRunCta => 'Plant your first seed';

  @override
  String get emptyStateClearAll => 'Clear all';

  @override
  String get cancel => 'Cancel';

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
  String get shareCardSnapshot => 'A snapshot of your sanctuary';

  @override
  String get shareCardBody =>
      'The card above is exported as a PNG and sent to your share sheet. Post it on your story, send it to a friend, or print it as a sticker.';

  @override
  String get shareCardShareMyBloom => 'Share my bloom';

  @override
  String get shareCardCouldNotShare => 'Could not share right now';

  @override
  String shareCardProgressText(String year) {
    return 'My Daily Stitch progress — $year on Daily Stitch.';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'I just unlocked the \"$title\" medal on Daily Stitch. $subtitle';
  }

  @override
  String get howItWorksTitle => 'How this works';

  @override
  String get howItWorksBody =>
      'Daily Stitch helps you keep a small, unbroken chain of discipline. That\'s it.';

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
  String get authBrand => 'DAILY STITCH';

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
  String get settingsProSubscription => 'Daily Stitch Pro';

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
  String get settingsShareBloomTracker => 'Share Daily Stitch';

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
  String get youBloomTrackerFooter => 'Daily Stitch · Habit & To-Do';

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
  String get helpCopiedEmail => 'Copied support@dailystitch.app';

  @override
  String get helpNoMailApp =>
      'No mail app found. Email us at support@dailystitch.app.';

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
      'Go to Settings → Account → Delete account. This permanently removes your profile, tasks, habits, and subscription data. Active Play subscriptions must be cancelled separately in Google Play.';

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

  @override
  String get settingsDeleteAccount => 'Delete account';

  @override
  String get settingsDeleteAccountSubtitle => 'Permanently remove your data';

  @override
  String get settingsDeleteAccountConfirmTitle => 'Delete your account?';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'This permanently deletes your profile, tasks, habits, and progress. Active subscriptions must be cancelled in Google Play separately. This cannot be undone.';

  @override
  String get settingsDeleteAccountConfirmButton => 'Delete forever';

  @override
  String get settingsDeleteAccountSuccess => 'Your account has been deleted.';

  @override
  String get settingsDeleteAccountFailed =>
      'Could not delete account. Try again or email support@dailystitch.app.';

  @override
  String get referralYouTitle => 'Invite friends · earn free Pro';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$progress of $milestone friends joined';
  }

  @override
  String get referralYouShare => 'Share invite';

  @override
  String get referralYouDetails => 'View details';

  @override
  String get referralPaywallTitle => 'Free Pro month';

  @override
  String get referralPaywallBody =>
      'Invite 5 friends who sign up → 1 month Pro free';

  @override
  String get referralPaywallProBody => 'Keep inviting — stack free Pro months';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'Could not load your progress. Try again later.';

  @override
  String get insightsMetricCurrentChain => 'CURRENT CHAIN';

  @override
  String get insightsMetricBestEver => 'BEST EVER';

  @override
  String get insightsMetricTasksDone => 'TASKS DONE';

  @override
  String get insightsMetricPerfectDays => 'PERFECT DAYS';

  @override
  String get insightsMetricHabits => 'HABITS';

  @override
  String get insightsDay => 'day';

  @override
  String get insightsDays => 'days';

  @override
  String get insightsSectionThisWeek => 'This week';

  @override
  String get insightsShareMyWeek => 'Share my week';

  @override
  String get insightsShareMyWeekPro => 'Share my week · Pro';

  @override
  String get insightsShareReceiptText =>
      'My week on Daily Stitch. Don\'t break the chain.';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Showing the last $days days';
  }

  @override
  String get insightsHistoryUpsell => 'Unlock your full history with Pro';

  @override
  String get referralScreenTitle => 'Invite friends';

  @override
  String get referralLaunchGift => 'Launch month gift';

  @override
  String get referralRewardTitle => 'Get 1 month of Pro free';

  @override
  String get referralRewardBody =>
      'Share your code with friends. When 5 people sign up using it, you unlock Daily Stitch Pro for a full month.';

  @override
  String get referralYourCode => 'Your referral code';

  @override
  String get referralCopyCodeTooltip => 'Copy code';

  @override
  String get referralCodeCopied => 'Referral code copied';

  @override
  String get referralShareWithFriends => 'Share with friends';

  @override
  String get referralFooterHint =>
      'Friends enter your code when they create an account. Each friend counts once toward your reward.';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count friend joined';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count friends joined';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'You have earned $count free month of Pro.';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'You have earned $count free months of Pro.';
  }

  @override
  String get referralRewardUnlocked =>
      'Reward unlocked — enjoy your free month of Pro!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return '$remaining more to unlock your free month';
  }

  @override
  String youProMemberSince(String month) {
    return 'Bloom Pro member since $month';
  }

  @override
  String get youProPerksTitle => 'Your Pro perks';

  @override
  String get manageProThankYou => 'Thank you for supporting Bloom';

  @override
  String get manageProReferralHint => 'Invite more friends to extend your Pro';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nAdd SUPABASE_URL and SUPABASE_PUBLISHABLE_KEY (or legacy SUPABASE_ANON_KEY) to leanspace/.env, then rebuild:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'System default';

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
  String get onboardingLanguageTitle => 'Choose your language';

  @override
  String get onboardingLanguageBody =>
      'Pick the language you\'d like to use throughout Daily Stitch. You can change it anytime in Settings.';

  @override
  String get onboardingLanguageContinue => 'Continue';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Friend';

  @override
  String get settingsAppTheme => 'App Theme';

  @override
  String get settingsAppThemeSubtitle =>
      'Select your personal sanctuary colors';

  @override
  String get settingsInviteFriendsTitle => 'Invite friends · Free Pro';

  @override
  String get settingsInviteFriendsSubtitle =>
      'Get 1 month free when 5 friends join';

  @override
  String get themePickerTitle => 'Personal Sanctuary';

  @override
  String get themePickerSubtitle =>
      'Choose a color palette that brings you peace.';

  @override
  String get themeNameClassicBloom => 'Classic Bloom';

  @override
  String get themeNameSolarTerracotta => 'Solar Terracotta';

  @override
  String get themeNameMidnightOasis => 'Midnight Oasis';

  @override
  String get themeNameLavenderDream => 'Lavender Dream';

  @override
  String get themeNameNordicFrost => 'Nordic Frost';

  @override
  String get themeNameCyberpunkNeon => 'Cyberpunk Neon';

  @override
  String get reminderTitle => 'Reminders';

  @override
  String get reminderBody =>
      'Final Call pings you before midnight if tasks are still open.';

  @override
  String get reminderFinalCall => 'Final Call';

  @override
  String get reminderEveningNudge => 'Evening nudge';

  @override
  String get reminderChangeTime => 'Change time';

  @override
  String get reminderSave => 'Save reminders';

  @override
  String get notificationChannelReminders => 'Daily Stitch reminders';

  @override
  String get notificationChannelRemindersDesc =>
      'Evening nudge and Final Call reminders';

  @override
  String get notificationChannelAlarms => 'Daily Stitch task alarms';

  @override
  String get notificationChannelAlarmsDesc => 'Loud alarms for task reminders';

  @override
  String get notificationTaskReminderTitle => 'Task reminder';

  @override
  String get notificationFinalCallTitle => 'Final Call';

  @override
  String notificationFinalCallBody(int count) {
    return 'You still have $count open task(s) today.';
  }

  @override
  String get notificationEveningTitle => 'Evening check-in';

  @override
  String get notificationEveningBody => 'How did your garden grow today?';

  @override
  String get widgetSetupTitle => 'Add chain widget';

  @override
  String get widgetSetupBody =>
      'Keep your streak on your home screen — no need to open the app.';

  @override
  String get widgetSetupAdd => 'Add to home screen';

  @override
  String get widgetSetupStep1 => 'Long-press your home screen';

  @override
  String get widgetSetupStep2 => 'Tap Widgets';

  @override
  String get widgetSetupStep3 => 'Find Daily Stitch and drag it on';

  @override
  String get widgetSetupPinSuccess =>
      'Check your home screen to place the widget.';

  @override
  String get widgetSetupPinFallback =>
      'Your launcher may not support one-tap add. Use manual steps below.';

  @override
  String get paywallWelcomePro => 'Welcome to Daily Stitch Pro';

  @override
  String get paywallSavePercent => 'SAVE ~16%';

  @override
  String get paywallTermsTitle => 'Subscription terms';

  @override
  String get paywallTermsBody =>
      'Billing is handled by Google Play. Subscriptions renew automatically until you cancel in Play Store → Subscriptions at least 24 hours before the end of the current period. You can manage or cancel your subscription at any time from your Google Play account.\n\nUninstalling the app does not cancel your subscription.\n\nPrices shown are in your local currency and may vary by region. Taxes may apply.';

  @override
  String get paywallPrivacyTitle => 'Privacy';

  @override
  String get paywallPrivacyBody =>
      'LeanSpace stores your tasks, habits, and streak data on our Supabase backend, tied to your account. We never sell your data.\n\nSubscription purchases are processed by Google Play. We receive a verified purchase token from Google to confirm your Pro status. We do not see or store your payment details.\n\nYou can request full data export or account deletion from Settings → Account deletion.';

  @override
  String get paywallCloseTooltip => 'Close';

  @override
  String get paywallFooterLinks => 'Restore · Terms · Privacy';

  @override
  String get manageProTitle => 'Pro subscription';

  @override
  String get manageProActive => 'Active';

  @override
  String get manageProNotSubscribed => 'Not subscribed';

  @override
  String get manageProFreeTier => 'Free tier';

  @override
  String manageProRenewsOn(String date) {
    return 'Renews or expires on $date.';
  }

  @override
  String get manageProFreeBody =>
      'You\'re using Daily Stitch Free. Upgrade to unlock the full system.';

  @override
  String get manageProSectionManage => 'MANAGE';

  @override
  String get manageProOpenPlay => 'Open Google Play subscriptions';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Cancel, change plan, or update payment method';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Find your existing subscription (if any) here';

  @override
  String get manageProShareApp => 'Share Daily Stitch';

  @override
  String get manageProShareSubtitle => 'Tell a friend about the chain';

  @override
  String get manageProSectionHelp => 'NEED HELP?';

  @override
  String get manageProHelpTitle => 'Help & Support';

  @override
  String get manageProHelpSubtitle => 'Subscription FAQ, contact, bug reports';

  @override
  String manageProBillingFooter(String version) {
    return 'Billing handled by Google Play · $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Open the Google Play Store app → tap your profile → Payments & subscriptions → Subscriptions.';

  @override
  String get addTaskGrowSomething => 'Grow Something';

  @override
  String get addTaskPlantSprout => 'Plant a Sprout';

  @override
  String get addTaskIntentionName => 'INTENTION NAME';

  @override
  String get addTaskSproutName => 'SPROUT NAME';

  @override
  String get addTaskHintTask => 'e.g., Morning Sun Salutation';

  @override
  String get addTaskHintHabit => 'e.g. Morning Yoga';

  @override
  String get addTaskWhen => 'WHEN?';

  @override
  String get addTaskPriority => 'PRIORITY';

  @override
  String get addTaskNotes => 'NOTES';

  @override
  String get addTaskCadenceDaily => 'Daily';

  @override
  String get addTaskCadenceWeekdays => 'Weekdays';

  @override
  String get addTaskCadence3x => '3x/week';

  @override
  String get addTaskCadenceWeekly => 'Weekly';

  @override
  String get addTaskPlantIntention => 'Plant Intention';

  @override
  String get addTaskPlantSproutCta => 'Plant Sprout';

  @override
  String get addTaskPlanting => 'Planting…';

  @override
  String get addTaskNameIntentionError => 'Name your intention';

  @override
  String get addTaskNameSproutError => 'Name your sprout';

  @override
  String get addTaskNotesMigrationWarning =>
      'Task saved. Notes & priority need the latest Supabase migration — run supabase/migrations/20260701000000_todos_notes_priority.sql.';

  @override
  String get addTaskNoSproutSlots => 'No empty sprout slots — tend one first.';

  @override
  String get addTaskSaveSproutError => 'Could not save sprout — try again.';

  @override
  String get addTaskElementWater => 'WATER';

  @override
  String get addTaskElementLight => 'LIGHT';

  @override
  String get addTaskElementSoil => 'SOIL';

  @override
  String get addTaskElementBreeze => 'BREEZE';

  @override
  String get addTaskCadenceLabel => 'CADENCE';

  @override
  String get addTaskPreparationNotes => 'PREPARATION NOTES';

  @override
  String get addTaskTendingNotes => 'TENDING NOTES';

  @override
  String get addTaskNotesHintTask => 'Any tools or mindset tips for this task?';

  @override
  String get addTaskNotesHintHabit =>
      'What does tending this sprout look like?';

  @override
  String get addTaskChooseElement => 'CHOOSE ELEMENT';

  @override
  String get addTaskElementsTooltip => 'What do the elements mean?';

  @override
  String get addTaskTaskSeed => 'Task Seed';

  @override
  String get addTaskHabitSprout => 'Habit Sprout';

  @override
  String get addTaskPickElement => 'Pick the right element';

  @override
  String get addTaskPickElementBody =>
      'Each element maps to a different kind of effort. The Guardian grows stronger when you water the right one.';

  @override
  String get addTaskClearForm => 'Clear form';

  @override
  String get shareCouldNotShare => 'Could not share right now';

  @override
  String get authReferralCodeLabel => 'Referral code (optional)';

  @override
  String get authReferralCodeHint => 'Friend\'s code';

  @override
  String get youPerkHabitSlots => '5 habit slots';

  @override
  String get youPerkFullHistory => 'Full history';

  @override
  String get youPerkAllThemes => 'All themes';

  @override
  String get youPerkStreakFreezes => '2 streak freezes / month';

  @override
  String get youPerkLegendaryMedals => 'Legendary medals';

  @override
  String get subscriptionPurchaseFailed => 'Purchase failed. Try again.';

  @override
  String get subscriptionUnavailable =>
      'In-app purchases are unavailable on this device.';

  @override
  String get subscriptionLoadFailed => 'Could not load subscription options.';

  @override
  String get subscriptionVerifyFailed =>
      'Could not verify purchase. Try Restore purchase.';

  @override
  String get streakFreezeFailed => 'Could not use streak freeze.';

  @override
  String get streakFreezeAlreadyUsed =>
      'You already used your freeze this month.';

  @override
  String get streakFreezeNoMissed => 'No missed tasks on that day to freeze.';

  @override
  String get streakFreezeNotPastDay => 'You can only freeze a past day.';

  @override
  String get myDayLoadError => 'Could not load My Day. Pull to refresh.';

  @override
  String get myDayCapReached => 'You\'ve hit today\'s 5-task cap.';

  @override
  String get myDayRemoveTaskError => 'Could not remove task.';

  @override
  String get shareCardTitle => 'Share your week';

  @override
  String get shareCardCta => 'Share image';

  @override
  String get medalTierSprout => 'Sprout';

  @override
  String get medalTierCommon => 'Common';

  @override
  String get medalTierRare => 'Rare';

  @override
  String get medalTierEpic => 'Epic';

  @override
  String get medalTierLegendary => 'Legendary';

  @override
  String get medalCategoryTasks => 'Tasks';

  @override
  String get medalCategoryHabits => 'Habits';

  @override
  String get medalCategoryStreaks => 'Streaks';

  @override
  String get medalCategoryMastery => 'Mastery';

  @override
  String get medalsShareTooltip => 'Share achievements';

  @override
  String get medalsFilterAll => 'All';

  @override
  String get addHabitTitleNew => 'Plant a new sprout';

  @override
  String get addHabitTitleEdit => 'Tend your sprout';

  @override
  String get addHabitLabelSproutName => 'SPROUT NAME';

  @override
  String get shareCardAppBarTitle => 'Share Card';

  @override
  String get shareCardAppBarTitleMedal => 'Share your medal';

  @override
  String shareCardDescMedal(Object title) {
    return 'Show off your new $title badge';
  }

  @override
  String get shareCardBodyMedal =>
      'Share the win with your circle. The card is exported as a PNG and ready for any social app.';

  @override
  String get shareCardCtaPreparing => 'Preparing…';

  @override
  String get shareCardMilestone => 'NEW MILESTONE UNLOCKED';

  @override
  String get shareCardStatChain => 'day chain';

  @override
  String get shareCardStatSprouts => 'sprouts';

  @override
  String get shareCardStatMedals => 'medals';

  @override
  String shareCardHeadlineStreak(int days) {
    return '$days Day Streak';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count Medals Earned';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Sprout Guardian';

  @override
  String get shareCardHeadlineFirstSeeds => 'First Seeds Planted';

  @override
  String get shareCardHeadlineGardenBegins => 'A Garden Begins';

  @override
  String get shareCardSubheadMonth =>
      'You\'ve successfully nurtured your habits for a full month.';

  @override
  String get shareCardSubheadWeek =>
      'A full week of growth — your forest is thickening.';

  @override
  String get shareCardSubheadProgress =>
      'Your sanctuary is showing real progress. Keep tending.';

  @override
  String get shareCardSubheadSprouts =>
      'Your first sprouts are taking root. Water them daily.';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Your first seeds are in the soil. Watch them open.';

  @override
  String get shareCardSubheadFallback =>
      'Every forest begins with one tiny choice.';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch — five small seeds a day, one unbreakable chain. Plant yours.\n\n$url';
  }

  @override
  String get shareAppSubject => 'Try Daily Stitch';

  @override
  String shareAppReferralText(String code, String url) {
    return 'I\'m building my daily chain on Daily Stitch — join me with my referral code $code and we both grow.\n\n$url';
  }

  @override
  String get shareAppReferralSubject => 'Join me on Daily Stitch';

  @override
  String shareCardShareTextProgress(String year) {
    return 'My Daily Stitch progress — $year on Daily Stitch.';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'I just unlocked the \"$title\" medal on Daily Stitch. $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Tasks done';

  @override
  String get insightsReceiptPerfectDays => 'Perfect days';

  @override
  String get insightsReceiptCompletion => 'Completion';

  @override
  String insightsReceiptDate(String date) {
    return 'Week of $date';
  }

  @override
  String get insightsReceiptFooter => 'Don\'t break the chain.';

  @override
  String get elementLabelWater => 'Water';

  @override
  String get elementLabelLight => 'Light';

  @override
  String get elementLabelSoil => 'Soil';

  @override
  String get elementLabelBreeze => 'Breeze';

  @override
  String get elementTaglineWater =>
      'Restore. Hydration, rest, emotional care — anything that refills the well.';

  @override
  String get elementTaglineLight =>
      'Awaken. Morning light, focus blocks, study, meditation — energy and clarity.';

  @override
  String get elementTaglineSoil =>
      'Ground. Reading, journaling, deep work — slow roots that build long-term strength.';

  @override
  String get elementTaglineBreeze =>
      'Move. Walks, runs, breathwork — light, mobile energy that clears the head.';

  @override
  String get elementWhenWater => 'When you feel drained or depleted.';

  @override
  String get elementWhenLight => 'When you need a clear start to your day.';

  @override
  String get elementWhenSoil =>
      'When the work is slow but worth it (study, craft, care).';

  @override
  String get elementWhenBreeze =>
      'When your body (or mind) needs to move and breathe.';

  @override
  String get bloomTierMastery => 'Mastery';

  @override
  String get bloomTierStrong => 'Strong';

  @override
  String get bloomTierGrowing => 'Growing';

  @override
  String get bloomTierSprouting => 'Sprouting';

  @override
  String get bloomTierLocked => 'Locked';

  @override
  String habitBloomSubtitle(int count, String element) {
    return '$count day streak · $element';
  }

  @override
  String get medal_id_first_spark => 'First Spark';

  @override
  String get medal_sub_first_spark => 'You lit the match.';

  @override
  String get medal_desc_first_spark =>
      'Finish your very first task. Every chain starts here.';

  @override
  String get medal_id_triple_seed => 'Triple Seed';

  @override
  String get medal_sub_triple_seed => 'Three into the soil.';

  @override
  String get medal_desc_triple_seed => 'Finish 3 tasks in total.';

  @override
  String get medal_id_dozen_sower => 'Dozen Sower';

  @override
  String get medal_sub_dozen_sower => 'A field of twelve.';

  @override
  String get medal_desc_dozen_sower => 'Finish 12 tasks in total.';

  @override
  String get medal_id_quarter_century => 'Quarter Century';

  @override
  String get medal_sub_quarter_century => 'A season of saying yes.';

  @override
  String get medal_desc_quarter_century => 'Finish 25 tasks in total.';

  @override
  String get medal_id_productivity_titan => 'Productivity Titan';

  @override
  String get medal_sub_productivity_titan => 'Consistency compounds.';

  @override
  String get medal_desc_productivity_titan =>
      'Finish 50 tasks — you\'ve built real momentum.';

  @override
  String get medal_id_century_planter => 'Century Planter';

  @override
  String get medal_sub_century_planter => 'A forest of your own.';

  @override
  String get medal_desc_century_planter =>
      'Finish 100 tasks. You\'re in the top 5% of users.';

  @override
  String get medal_id_clean_day => 'Clean Slate';

  @override
  String get medal_sub_clean_day => 'Not a single weed.';

  @override
  String get medal_desc_clean_day =>
      'Finish every task you plant on a single day.';

  @override
  String get medal_id_triple_perfect => 'Triple Perfect';

  @override
  String get medal_sub_triple_perfect => 'Three flawless runs.';

  @override
  String get medal_desc_triple_perfect => 'Hit 3 perfect days.';

  @override
  String get medal_id_perfect_week => 'Perfect Week';

  @override
  String get medal_sub_perfect_week => 'Seven days unbroken.';

  @override
  String get medal_desc_perfect_week => '7 perfect days in a row.';

  @override
  String get medal_id_two_week_chain => 'Fortnight Force';

  @override
  String get medal_sub_two_week_chain => 'Two weeks on fire.';

  @override
  String get medal_desc_two_week_chain => 'Hold a 14-day chain.';

  @override
  String get medal_id_iron_chain => 'Iron Chain';

  @override
  String get medal_sub_iron_chain => '30 links forged.';

  @override
  String get medal_desc_iron_chain => 'A 30-day chain. The hardest task medal.';

  @override
  String get medal_id_quarterly_chain => 'Quarterly Chain';

  @override
  String get medal_sub_quarterly_chain => 'A season, unbroken.';

  @override
  String get medal_desc_quarterly_chain => 'A 90-day chain. Legendary status.';

  @override
  String get medal_id_vital_priority => 'Vital Spark';

  @override
  String get medal_sub_vital_priority => 'You picked the hard ones.';

  @override
  String get medal_desc_vital_priority =>
      'Finish 5 tasks marked as Vital priority.';

  @override
  String get medal_id_spark_priority => 'Spark Tamer';

  @override
  String get medal_sub_spark_priority => 'Quick wins add up.';

  @override
  String get medal_desc_spark_priority =>
      'Finish 5 tasks marked as Spark priority.';

  @override
  String get medal_id_note_taker => 'Note Taker';

  @override
  String get medal_sub_note_taker => 'Plans on paper beat plans in head.';

  @override
  String get medal_desc_note_taker =>
      'Add preparation notes to 5 different tasks.';

  @override
  String get medal_id_left_behind_rescuer => 'Left-Behind Rescuer';

  @override
  String get medal_sub_left_behind_rescuer => 'No task left behind.';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Re-add 3 missed tasks the next day.';

  @override
  String get medal_id_first_sprout => 'First Sprout';

  @override
  String get medal_sub_first_sprout => 'A new daily ritual.';

  @override
  String get medal_desc_first_sprout => 'Plant your first habit.';

  @override
  String get medal_id_trio_sprout => 'Trio Sprout';

  @override
  String get medal_sub_trio_sprout => 'A small ecosystem.';

  @override
  String get medal_desc_trio_sprout => 'Plant 3 different habits.';

  @override
  String get medal_id_week_of_growth => 'Week of Growth';

  @override
  String get medal_sub_week_of_growth => 'Roots start to hold.';

  @override
  String get medal_desc_week_of_growth => 'Tend a habit every day for 7 days.';

  @override
  String get medal_id_fortnight_floret => 'Fortnight Floret';

  @override
  String get medal_sub_fortnight_floret => 'A full bloom.';

  @override
  String get medal_desc_fortnight_floret => 'A 14-day habit streak.';

  @override
  String get medal_id_rooted_master => 'Rooted Master';

  @override
  String get medal_sub_rooted_master => 'Deep roots, deep strength.';

  @override
  String get medal_desc_rooted_master => 'A 30-day habit streak.';

  @override
  String get medal_id_half_year_bloom => 'Half-Year Bloom';

  @override
  String get medal_sub_half_year_bloom => 'The garden is permanent now.';

  @override
  String get medal_desc_half_year_bloom => 'Hold a single habit for 180 days.';

  @override
  String get medal_id_garden_keeper => 'Garden Keeper';

  @override
  String get medal_sub_garden_keeper => 'Variety, together.';

  @override
  String get medal_desc_garden_keeper =>
      'Grow 4 different habits at the same time.';

  @override
  String get medal_id_hydration_hero => 'Hydration Hero';

  @override
  String get medal_sub_hydration_hero => 'You refill the well.';

  @override
  String get medal_desc_hydration_hero =>
      'Plant a hydration habit (water/drink).';

  @override
  String get medal_id_mindful_mover => 'Mindful Mover';

  @override
  String get medal_sub_mindful_mover => 'The body remembers.';

  @override
  String get medal_desc_mindful_mover =>
      'Plant a movement habit (yoga/walk/run).';

  @override
  String get medal_id_devoted_keeper => 'Devoted Keeper';

  @override
  String get medal_sub_devoted_keeper => 'Sixty days, one practice.';

  @override
  String get medal_desc_devoted_keeper =>
      'Tend a single habit for 60 days straight.';

  @override
  String get medal_id_tending_notes => 'Tending Notes';

  @override
  String get medal_sub_tending_notes => 'Reflect as you go.';

  @override
  String get medal_desc_tending_notes => 'Add tending notes to 3 habits.';

  @override
  String get medalTierTaglineSprout => 'Plant the first seed';

  @override
  String get medalTierTaglineCommon => 'Building the habit';

  @override
  String get medalTierTaglineRare => 'Showing real momentum';

  @override
  String get medalTierTaglineEpic => 'You\'re a force of nature';

  @override
  String get medalTierTaglineLegendary => 'Mythic, almost no one gets here';

  @override
  String get guardianHeadlineNoTasks =>
      'Today\'s soil is fresh.\nPlant your first seed\nand watch it grow.';

  @override
  String get guardianHeadlineAllDone =>
      'Every seed you planted\nis in bloom.\nRest, Guardian — you earned it.';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count days\nof unbroken growth.\nYour forest is thick with life.';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'A full week in bloom,\nGuardian.\nOne more perfect day\nextends the chain.';

  @override
  String get guardianHeadlineStreak3 =>
      'Your chain is holding.\nTend the seeds\nstill waiting to open.';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'You\'re tending tasks well.\nPlant a sprout —\nhabits are how forests grow.';

  @override
  String get guardianHeadlineSomeDone =>
      'Some seeds opened,\nsome didn\'t. That\'s okay.\nTomorrow is another planting.';

  @override
  String get guardianHeadlineMorning =>
      'Good morning, Guardian.\nThe day is young\nand the soil is ready.';

  @override
  String get guardianHeadlineAfternoon =>
      'Good afternoon, Guardian.\nHalf the light remains —\nkeep tending.';

  @override
  String get guardianHeadlineEvening =>
      'Good evening, Guardian.\nOne last sweep\nbefore the sun sets.';

  @override
  String get guardianHeadlineNight =>
      'Burning the midnight oil?\nEven Guardians rest.\nPlant tomorrow\'s seed now.';

  @override
  String get guardianBodyNoTasks =>
      'Your sanctuary is quiet right now. Add one intention and see what shifts by sundown.';

  @override
  String guardianBodyStreak14(int count) {
    return '$count days running. The chain isn\'t luck — it\'s the small choices stacking up. Keep stacking.';
  }

  @override
  String guardianBodyStreak3(int count) {
    return 'A $count-day chain is real momentum. Finish today\'s open seeds before you call it done.';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'You\'ve planted $count tasks so far. Adding even one habit sprout would let the work compound day after day.';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'You\'re finishing $pct% of what you plant. Fewer, sharper seeds tend to grow taller than ten scattered ones.';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Your sanctuary is alive. $tasks tasks done, $sprouts sprout(s) growing — the work is showing.';
  }

  @override
  String get guardianInsightWaitingTitle => 'Waiting for your first move';

  @override
  String get guardianInsightWaitingBody =>
      'Add a task or habit and I\'ll start reading the patterns in your garden. The more you plant, the more I have to learn from.';

  @override
  String get guardianInsightWaitingCta => 'Plant your first seed';

  @override
  String get guardianInsightChainSuperTitle => 'Chain is your superpower';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'You\'ve held a $count-day chain. Streaks beat motivation every time — keep it warm, even on slow days.';
  }

  @override
  String get guardianInsightChainSuperCta => 'Add tomorrow\'s seed';

  @override
  String get guardianInsightChainColdTitle => 'Chain is cold — start a new one';

  @override
  String get guardianInsightChainColdBody =>
      'You\'ve planted before, which means you can plant again. One small task done today is a longer chain tomorrow.';

  @override
  String get guardianInsightChainColdCta => 'Plant a seed';

  @override
  String get guardianInsightLessIsMoreTitle => 'Less is more this week';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'You finish about $pct% of what you plant. Try 3 sharp intentions instead of 5 loose ones — quality compounds.';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Sharpen the day';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Next medal: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'You\'re $value of $target $unit in. A few more honest days and it\'s yours.';
  }

  @override
  String get guardianInsightNextMedalCta => 'Show medal';

  @override
  String get guardianInsightSteadyTitle => 'You\'re in a steady season';

  @override
  String get guardianInsightSteadyBody =>
      'No medal right around the corner — that\'s fine. Tend what you have. The next bloom is on the way.';

  @override
  String get guardianInsightSteadyCta => 'View progress';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      '1 task left on your chain. Midnight is coming.';

  @override
  String notificationFinalCallBodyMany(int count) {
    return '$count tasks left on your chain. Midnight is coming.';
  }

  @override
  String get notificationEveningBodyOne => 'You still have 1 open task today.';

  @override
  String notificationEveningBodyMany(int count) {
    return 'You still have $count open tasks today.';
  }

  @override
  String get notificationTickerTaskReminder => 'Task reminder';

  @override
  String get notificationTickerTaskAlarm => 'Task alarm';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count day streak · $element';
  }
}
