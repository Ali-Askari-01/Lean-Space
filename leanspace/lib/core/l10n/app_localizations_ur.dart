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
  String get tabToday => 'Ø¢Ø¬';

  @override
  String get tabProgress => 'Ù¾ÛŒØ´Ø±ÙØª';

  @override
  String get tabYou => 'Ø¢Ù¾';

  @override
  String get navMyDay => 'Ù…ÛŒØ±Ø§ Ø¯Ù†';

  @override
  String get navSettings => 'ØªØ±ØªÛŒØ¨Ø§Øª';

  @override
  String get navHelp => 'Ù…Ø¯Ø¯ Ùˆ Ù…Ø¹Ø§ÙˆÙ†Øª';

  @override
  String get navHistory => 'Ø¢Ø®Ø±ÛŒ 7 Ø¯Ù†';

  @override
  String get navLeftBehind => 'Ù¾ÛŒÚ†Ú¾Û’ Ú†Ú¾ÙˆÚ‘Û’ Ú¯Ø¦Û’';

  @override
  String get navInsights => 'Ø¢Ù¾ Ú©ÛŒ Ù¾ÛŒØ´Ø±ÙØª';

  @override
  String get navMedals => 'Ù…ÛŒØ±Û’ ØªÙ…ØºÛ’';

  @override
  String get navManagePro => 'Pro Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† Ú©Ø§ Ø§Ù†ØªØ¸Ø§Ù… Ú©Ø±ÛŒÚº';

  @override
  String get navPaywall => 'Daily Stitch Pro';

  @override
  String get greetingLateNight =>
      'Ø±Ø§Øª Ú¯Ø¦ÛŒØŒ Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ø¬Ø§Ú¯ Ø±ÛÛ’ ÛÛŒÚº';

  @override
  String get greetingMorning => 'ØµØ¨Ø­ Ø¨Ø®ÛŒØ±ØŒ Ø³ÙˆØ±Ø¬!';

  @override
  String get greetingAfternoon => 'Ø¯ÙˆÙ¾ÛØ± Ø¨Ø®ÛŒØ±ØŒ Ø¯ÙˆØ³Øª';

  @override
  String get greetingEvening => 'Ø´Ø§Ù… Ø¨Ø®ÛŒØ±ØŒ Ú†ÛŒÙ…Ù¾Ø¦Ù†';

  @override
  String get greetingNight =>
      'Ø¢Ø±Ø§Ù… Ø³Û’ Ø³Ùˆ Ø±ÛÛ’ ÛÛŒÚºØŒ Ù†Ú¯ÛØ¨Ø§Ù†ØŸ';

  @override
  String todayTasksCount(String done, String total) {
    return 'Ø¢Ø¬ Â· $done / $total Ú©Ø§Ù… Ù…Ú©Ù…Ù„';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$done / $total Ø¹Ø§Ø¯Ø§Øª';
  }

  @override
  String get todayChainGrows =>
      'Ø²Ù†Ø¬ÛŒØ± Ø¢Ù¾ Ú©Û’ Ù…Ú©Ù…Ù„ Ú©Ø±Ù†Û’ Ø³Û’ Ø¨Ú‘Ú¾ØªÛŒ ÛÛ’';

  @override
  String get todayChainComplete =>
      'Ø²Ù†Ø¬ÛŒØ± Ù…Ú©Ù…Ù„ Â· Ú©Ù„ Ø¨Ø§Øº Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get taskCapInfo => '5 Ú©Ø§Ù… Ú©ÛŒ Ø­Ø¯ Ú©ÛŒÙˆÚºØŸ';

  @override
  String get taskCapDiscipline => 'ÚˆÛŒØ²Ø§Ø¦Ù† Ø³Û’ Ù¾ÛÙ„Û’ Ù†Ø¸Ù… Ùˆ Ø¶Ø¨Ø·';

  @override
  String get taskCapTitle =>
      'ÛÙ… Ø¢Ù¾ Ú©Û’ Ø¯Ù† Ú©Ùˆ Ø¬Ø§Ù† Ø¨ÙˆØ¬Ú¾ Ú©Ø± 5 Ú©Ø§Ù… ØªÚ© Ù…Ø­Ø¯ÙˆØ¯ Ø±Ú©Ú¾ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get taskCapBody =>
      'Ú†Ú¾ÙˆÙ¹ÛŒ Ø²Ù†Ø¬ÛŒØ±ÛŒÚº Ù„Ù…Ø¨ÛŒ Ø²Ù†Ø¬ÛŒØ±ÙˆÚº Ø³Û’ Ø¨ÛØªØ± ÛÛŒÚºÛ” Ø¢Ù¾ 5 Ù…ÛŒÚº Ø³Û’ 3 Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø± Ú©Û’ Ø¬ÛŒØªÙ†Û’ Ú©Ø§ Ø§Ø­Ø³Ø§Ø³ Ù…Ø­Ø³ÙˆØ³ Ú©Ø±Ù†Û’ Ú©Ø§ Ø§Ù…Ú©Ø§Ù† 10 Ù…ÛŒÚº Ø³Û’ 8 Ú©Ùˆ Ú†Ú¾ÙˆÚ‘ Ú©Ø± ÛØ§Ø±Ù†Û’ Ú©Û’ Ø§Ø­Ø³Ø§Ø³ Ø³Û’ Ø²ÛŒØ§Ø¯Û ÛÛ’Û”';

  @override
  String get taskCapBulletDone =>
      'Ù…Ú©Ù…Ù„ Ø´Ø¯Û Ú©Ø§Ù… Ø¢Ù¾ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ù…ÛŒÚº Ø´Ø§Ù…Ù„ ÛÙˆØªÛ’ ÛÛŒÚº';

  @override
  String get taskCapBulletDoneBody =>
      'ÙˆÛ Ø¯Ù† Ø¬Ø¨ ØªÙ…Ø§Ù… 5 Ù…Ú©Ù…Ù„ ÛÙˆ Ø¬Ø§Ø¦ÛŒÚº Ø¢Ù¾ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ù…ÛŒÚº Ø§ÛŒÚ© Ø¯Ù† Ú©Ø§ Ø§Ø¶Ø§ÙÛ Ú©Ø±ØªØ§ ÛÛ’Û”';

  @override
  String get taskCapBulletMissed =>
      'Ú†Ú¾ÙˆÙ¹Û’ ÛÙˆØ¦Û’ Ú©Ø§Ù… Left Behind Ù…ÛŒÚº Ú†Ù„Û’ Ø¬Ø§ØªÛ’ ÛÛŒÚº';

  @override
  String get taskCapBulletMissedBody =>
      'Ø±Ø§Øª 12 Ø¨Ø¬Û’ØŒ Ù†Ø§Ù…Ú©Ù…Ù„ Ú©Ø§Ù… Left Behind Ù…ÛŒÚº Ø¢ Ø¬Ø§ØªÛ’ ÛÛŒÚºÛ” ØµØ±Ù ÙˆÛÛŒ Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº Ø¬Ùˆ Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ø§ÛÙ… ÛÙˆÚºÛ”';

  @override
  String get taskCapBulletFreeze =>
      'Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹ Ú©ÛŒ Ù…Ø¹Ø§ÙÛŒ Ø¯ÛŒØªØ§ ÛÛ’';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro Ø¢Ù¾ Ú©Ùˆ Ù…Ø§ÛØ§Ù†Û 2 Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² Ø¯ÛŒØªØ§ ÛÛ’ â€” ÙˆÛ Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹Û’ ÛÙˆØ¦Û’ Ø¯Ù† Ú©Ùˆ ÚˆÚ¾Ø§Ù†Ù¾ØªÛ’ ÛÛŒÚº ØªØ§Ú©Û Ø¢Ù¾ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø²Ù†Ø¯Û Ø±ÛÛ’Û”';

  @override
  String get tasksHeader => 'Ú©Ø§Ù…';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'Ú©Ø§Ù… Ú©Ø§ Ø¨ÛŒØ¬ Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get tasksCapReached =>
      '5/5 Ø¬Ú¯ÛÛŒÚº Ø§Ø³ØªØ¹Ù…Ø§Ù„ ÛÙˆØ¦ÛŒÚº â€” Ù†ÛŒØ§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ø§ÛŒÚ© Ú©Ùˆ Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get tasksEmptyCta =>
      'Ø§Ù¾Ù†Ø§ Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚº â€” Ø¢Ø¬ Ú©ÛŒØ§ Ø§ÛÙ… ÛÛ’ØŸ';

  @override
  String get habitsHeader => 'Ø¹Ø§Ø¯Ø§Øª';

  @override
  String habitsGrowing(String count) {
    return '$count Ø¨Ú‘Ú¾ Ø±ÛÛŒ ÛÛŒÚº';
  }

  @override
  String habitsBestStreak(String days) {
    return 'Ø¨ÛØªØ±ÛŒÙ† $days Ø¯Ù†';
  }

  @override
  String get habitsPlantNew => 'Ù†Ø¦ÛŒ Ø¹Ø§Ø¯Øª Ú©Ø§ Ù¾ÙˆØ¯Ø§ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get habitsPlantFirst => 'Ø¹Ø§Ø¯Øª Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get habitsLocked =>
      'Pro Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø¬Ú¯Û â€” Ù…Ø²ÛŒØ¯ Ù¾ÙˆØ¯Û’ Ù„Ú¯Ø§Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ú©Ú¾ÙˆÙ„ÛŒÚº';

  @override
  String get habitsSlotsFull =>
      'ØªÙ…Ø§Ù… Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø¬Ú¯ÛÛŒÚº ÙÙ„ ÛÛŒÚºÛ”';

  @override
  String habitsStreakDays(String days) {
    return '$daysØ¯Ù†';
  }

  @override
  String get habitsCadence => 'Ø±ÙˆØ²Ø§Ù†Û';

  @override
  String leftBehindBanner(String count) {
    return '$count Ú†Ú¾ÙˆÙ¹Û’ Ú¯Ø¦Û’ â€” Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Left Behind Ù…ÛŒÚº ÛÛŒÚº';
  }

  @override
  String get leftBehindTap =>
      'Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±Ù†Û’ ÛŒØ§ Ú†Ú¾ÙˆÚ‘Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ù¹ÛŒÙ¾ Ú©Ø±ÛŒÚº';

  @override
  String get leftBehindDismiss => 'Ø®ØªÙ… Ú©Ø±ÛŒÚº';

  @override
  String get leftBehindTitle => 'Ù¾ÛŒÚ†Ú¾Û’ Ú†Ú¾ÙˆÚ‘Û’ Ú¯Ø¦Û’';

  @override
  String get leftBehindEmpty => 'Ú©Ú†Ú¾ Ø¨Ú¾ÛŒ Ù¾ÛŒÚ†Ú¾Û’ Ù†ÛÛŒÚº Ú†Ú¾ÙˆÚ‘Ø§';

  @override
  String get leftBehindEmptyBody =>
      'Ú©ÙˆØ¦ÛŒ Ú†Ú¾ÙˆÙ¹Ø§ ÛÙˆØ§ Ú©Ø§Ù… Ù†ÛÛŒÚºÛ” ÛØ± Ø¨ÛŒØ¬ Ø¬Ùˆ Ø¢Ù¾ Ù„Ú¯Ø§ØªÛ’ ÛÛŒÚº Ø§Ø³ Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ ÛÙˆ Ø±ÛÛŒ ÛÛ’Û” Ø¨Ø§Øº ØµØ§Ù ÛÛ’Û”';

  @override
  String get leftBehindClearAll => 'Ø³Ø¨ ØµØ§Ù Ú©Ø±ÛŒÚº';

  @override
  String get leftBehindClearAllConfirm => 'Ø³Ø¨ Ú©Ú†Ú¾ ØµØ§Ù Ú©Ø±ÛŒÚºØŸ';

  @override
  String leftBehindClearAllBody(String count) {
    return 'ÛŒÛ $count Ú†Ú¾ÙˆÙ¹Û’ ÛÙˆØ¦Û’ Ú©Ø§Ù… Ú©Ùˆ Ù…Ø³ØªÙ‚Ù„ Ø·ÙˆØ± Ù¾Ø± ÛÙ¹Ø§ Ø¯Û’ Ú¯Ø§Û” Ø¢Ù¾ Ø§Ø³Û’ ÙˆØ§Ù¾Ø³ Ù†ÛÛŒÚº Ú©Ø± Ø³Ú©ØªÛ’Û”';
  }

  @override
  String get leftBehindReAdd => 'Ø¢Ø¬ Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get leftBehindReAddButton => 'Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get leftBehindAddedToToday => 'Ø¢Ø¬ Ø´Ø§Ù…Ù„ Ú©Ø± Ø¯ÛŒØ§ Ú¯ÛŒØ§';

  @override
  String get leftBehindLetGo => 'Ú†Ú¾ÙˆÚ‘ Ø¯Ùˆ';

  @override
  String get leftBehindHeader => 'LEFT BEHIND';

  @override
  String get leftBehindMissedTasks => 'Ú†Ú¾ÙˆÙ¹Û’ ÛÙˆØ¦Û’ Ú©Ø§Ù…';

  @override
  String get leftBehindWaitingOne => '1 Ú©Ø§Ù… Ø¢Ù¾ Ú©Ø§ Ù…Ù†ØªØ¸Ø± ÛÛ’Û”';

  @override
  String leftBehindWaitingMany(String count) {
    return '$count Ú©Ø§Ù… Ø¢Ù¾ Ú©Ø§ Ù…Ù†ØªØ¸Ø± ÛÛŒÚºÛ”';
  }

  @override
  String get leftBehindBody =>
      'Ú©Ø§Ù… Ú©Ùˆ Ø¢Ø¬ ÙˆØ§Ù¾Ø³ Ù„Ø§Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚºØŒ ÛŒØ§ Ú†Ú¾ÙˆÚ‘ Ø¯ÛŒÚºÛ” Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±Ù†Û’ Ø³Û’ Ø¢Ù¾ Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ© Ø²Ù†Ø¯Û Ø±ÛØªÛŒ ÛÛ’Û”';

  @override
  String leftBehindReAddedSnack(String task) {
    return '\"$task\" Ø¢Ù¾ Ú©Û’ Ø¯Ù† Ù…ÛŒÚº ÙˆØ§Ù¾Ø³ Ø¢ Ú¯ÛŒØ§Û”';
  }

  @override
  String leftBehindRemovedSnack(String task) {
    return '\"$task\" ÛÙ¹Ø§ Ø¯ÛŒØ§ Ú¯ÛŒØ§';
  }

  @override
  String get leftBehindClearedSnack => 'Left Behind ØµØ§Ù ÛÙˆ Ú¯ÛŒØ§';

  @override
  String leftBehindYesterdayDate(String date) {
    return 'Ú©Ù„ Â· $date';
  }

  @override
  String streakAtRisk(String count) {
    return 'Ø¢Ø¬ Ú©Û’ Ù„ÛŒÛ’ $count Ú©Ø§Ù… Ø¨Ø§Ù‚ÛŒ ÛÛŒÚº';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'Ø¢Ø®Ø±ÛŒ Ù…ÙˆÙ‚Ø¹ â€” $count Ú©Ø§Ù… Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ú©Ú¾Ù„Û’ ÛÛŒÚº';
  }

  @override
  String get streakAtRiskBody =>
      'Ø±Ø§Øª Ù‚Ø±ÛŒØ¨ ÛÛ’Û” Ø²Ù†Ø¬ÛŒØ± Ø§Ù† Ù¾Ø± Ù…Ù†Ø­ØµØ± ÛÛ’Û”';

  @override
  String get streakAtRiskBodyLow =>
      'Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ ÙˆÙ‚Øª ÛÛ’Û” ØµØ§Ù Ø¯Ù† Ø¢Ù¾ Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ© Ø¨Ú‘Ú¾Ø§ØªØ§ ÛÛ’Û”';

  @override
  String get streakAtRiskFreeze =>
      'Ú©Ù„ Ú†Ú¾ÙˆÙ¹ Ú¯ÛŒØ§ â€” Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø±ÛŒÚºØŸ';

  @override
  String get streakFreezeUse => 'ÙØ±ÛŒØ² Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get streakFreezeUseForYesterday =>
      'Ú©Ù„ Ú©Û’ Ù„ÛŒÛ’ Ù…Ø§ÛØ§Ù†Û Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get streakFreezeAppliedYesterday =>
      'Ú©Ù„ Ú©Û’ Ù„ÛŒÛ’ Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² Ù„Ø§Ú¯Ùˆ ÛÙˆ Ú¯ÛŒØ§Û”';

  @override
  String get chainBrokenTitle =>
      'Ø²Ù†Ø¬ÛŒØ± Ù¹ÙˆÙ¹ Ú¯Ø¦ÛŒÛ” Ú©ÙˆØ¦ÛŒ Ø¨Ø§Øª Ù†ÛÛŒÚºÛ”';

  @override
  String get chainBrokenBody =>
      'ÛØ± Ù„Ù…Ø¨ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø§ÛŒÚ© Ø¨Ø§Ø± Ù¹ÙˆÙ¹ØªÛŒ ÛÛ’Û” Ø¬Ùˆ Ø§ÛÙ… ÛÛ’ ÙˆÛ ÛÛ’ Ø¢Ø¬ Ø¢Ù¾ Ú©ÛŒØ§ Ù„Ú¯Ø§ØªÛ’ ÛÛŒÚºÛ” Ø§ÛŒÚ© Ú©Ø§Ù…Ù„ Ø¯Ù† Ø§Ú¯Ù„ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø´Ø±ÙˆØ¹ Ú©Ø±ØªØ§ ÛÛ’Û”';

  @override
  String get chainBrokenCta => 'Ø¢Ø¬ Ù¾Ø± ÙˆØ§Ù¾Ø³ Ø¢Ø¦ÛŒÚº';

  @override
  String get chainBrokenPlantFirst => 'Ø¢Ø¬ Ú©Ø§ Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get chainBrokenCheck => 'Ù¾ÛÙ„Û’ Left Behind Ú†ÛŒÚ© Ú©Ø±ÛŒÚº';

  @override
  String get chainBrokenBestChain => 'Ø¨ÛØªØ±ÛŒÙ† Ø²Ù†Ø¬ÛŒØ±';

  @override
  String get chainBrokenTasksDone => 'Ú©Ø§Ù… Ù…Ú©Ù…Ù„';

  @override
  String get chainBrokenSprouts => 'Ù¾ÙˆØ¯Û’';

  @override
  String get chainRecoveryFreshStart => 'Ù†Ø¦ÛŒ Ø´Ø±ÙˆØ¹Ø§Øª';

  @override
  String get medalsTitle => 'Ù…ÛŒØ±Û’ ØªÙ…ØºÛ’';

  @override
  String get medalsTrophyRoom => 'Ù¹Ø±Ø§ÙÛŒ Ø±ÙˆÙ…';

  @override
  String get medalsAllMedals => 'ØªÙ…Ø§Ù… ØªÙ…ØºÛ’';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$earned / $total ØªÙ…ØºÛ’ Ø­Ø§ØµÙ„';
  }

  @override
  String get medalsTrophyEmpty =>
      'Ø¢Ù¾ Ú©Ø§ Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ø§ÛŒÚ© Ú©Ø§Ù… Ø¯ÙˆØ± ÛÛ’';

  @override
  String get medalsTrophyFirst =>
      'Ø¢Ù¾ Ù†Û’ Ø§Ù¾Ù†Ø§ Ù¾ÛÙ„Ø§ ØªÙ…ØºÛ Ø­Ø§ØµÙ„ Ú©Ø± Ù„ÛŒØ§ â€” Ø¬Ø§Ø±ÛŒ Ø±Ú©Ú¾ÛŒÚº';

  @override
  String medalsTrophyMany(String earned) {
    return 'Ø¢Ù¾ Ú©Û’ Ù¹Ø±Ø§ÙÛŒ Ø±ÙˆÙ… Ù…ÛŒÚº $earned ØªÙ…ØºÛ’';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'ØªÙ…Ø§Ù… $total ØªÙ…ØºÙˆÚº Ú©ÛŒ Ø·Ø±Ù Ù¾ÛŒØ´Ø±ÙØª';
  }

  @override
  String get medalsShareCta =>
      'Ø´ÛŒØ¦Ø± Ú©Ø±Ù†Û’ Ú©Û’ Ù‚Ø§Ø¨Ù„ Ú©Ø§Ø±Úˆ Ø¨Ù†Ø§Ø¦ÛŒÚº';

  @override
  String get medalsEmptyTitle =>
      'Ø§Ø³ Ø²Ù…Ø±Û’ Ù…ÛŒÚº Ø§Ø¨Ú¾ÛŒ Ú©Ú†Ú¾ Ù†ÛÛŒÚº ÛÛ’';

  @override
  String get medalsEmptyBody =>
      'Ù¹Ø±Ø§ÙÛŒ Ø±ÙˆÙ… Ø´Ø±ÙˆØ¹ Ú©Ø±Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ú©ÙˆØ¦ÛŒ Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚº ÛŒØ§ Ù¾ÙˆØ¯Û’ Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medalSheetLocked => 'Pro ØªÙ…ØºÛ';

  @override
  String medalSheetEarned(String tier) {
    return 'Ø­Ø§ØµÙ„ Â· $tier';
  }

  @override
  String get medalSheetUnlock => 'Pro Ø³Û’ Ú©Ú¾ÙˆÙ„ÛŒÚº';

  @override
  String get medalSheetProgress => 'Ù¾ÛŒØ´Ø±ÙØª';

  @override
  String medalSheetHint(String n, String unit) {
    return 'ØµØ±Ù $n Ù…Ø²ÛŒØ¯ $unit Ú©Ú¾ÙˆÙ„Ù†Û’ Ú©Û’ Ù„ÛŒÛ’Û”';
  }

  @override
  String get medalSheetAlmost =>
      'Ú©Ú¾ÙˆÙ„Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ø§ÛŒÚ© Ø§ÙˆØ± Ù‚Ø¯Ù…Û”';

  @override
  String get medalCategory => 'Ø²Ù…Ø±Û';

  @override
  String get medalShareOnSocials =>
      'Ø³ÙˆØ´Ù„ Ù…ÛŒÚˆÛŒØ§ Ù¾Ø± Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get medalShareLater => 'Ø¨Ø¹Ø¯ Ù…ÛŒÚº';

  @override
  String get medalUnlocked => 'ØªÙ…ØºÛ Ú©Ú¾Ù„Ø§';

  @override
  String get medalProgressTitle => 'Ù¾ÛŒØ´Ø±ÙØª';

  @override
  String get historyTitle => 'Ø¢Ø®Ø±ÛŒ 7 Ø¯Ù†';

  @override
  String get historyFullTitle => 'Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ®';

  @override
  String get historyLoadError => 'ØªØ§Ø±ÛŒØ® Ù„Ùˆ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©ÛŒÛ”';

  @override
  String get historyFullCalendar => 'Ù…Ú©Ù…Ù„ Ú©ÛŒÙ„Ù†ÚˆØ±';

  @override
  String historyCompletedPercent(String percent) {
    return '$percent% Ù…Ú©Ù…Ù„';
  }

  @override
  String historyThisWeek(String days) {
    return 'Ø¢Ø®Ø±ÛŒ $days Ø¯Ù†';
  }

  @override
  String get historyDayByDay => 'Ø¯Ù† Ø¨Û Ø¯Ù†';

  @override
  String get historyEmpty =>
      'Ø§Ù¾Ù†Ø§ ÛÙØªÛ Ø¯ÛŒÚ©Ú¾Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ú©Ú†Ú¾ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚºÛ”';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'Ø¢Ù¾ Ù†Û’ $total Ù…ÛŒÚº Ø³Û’ $done Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©ÛŒÛ’Û” $perfect Ú©Ø§Ù…Ù„ Ø¯Ù†Û”';
  }

  @override
  String get historyUpsellTitle => 'Ø§Ù¾Ù†Ø§ Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ® Ø¯ÛŒÚ©Ú¾ÛŒÚº';

  @override
  String get historyUpsellBody =>
      'Pro 30 Ø¯Ù† Ú©ÛŒ ØªØ§Ø±ÛŒØ® Ú©Ú¾ÙˆÙ„ØªØ§ ÛÛ’Û” Ù…ÙØª 7 Ø¯Ú©Ú¾Ø§ØªØ§ ÛÛ’Û”';

  @override
  String get historyPerfect => 'Ú©Ø§Ù…Ù„';

  @override
  String get historyFrozen => 'Ù…Ù†Ø¬Ù…Ø¯';

  @override
  String get historyToday => 'Ø¢Ø¬';

  @override
  String get historyEmptyDay =>
      'Ø§Ø³ Ø¯Ù† Ú©ÙˆØ¦ÛŒ Ø¨ÛŒØ¬ Ù†ÛÛŒÚº Ù„Ú¯Ø§ÛŒØ§ Ú¯ÛŒØ§';

  @override
  String historyLeftBehindCount(String count) {
    return '$count Ù¾ÛŒÚ†Ú¾Û’ Ú†Ú¾ÙˆÚ‘Û’ Ú¯Ø¦Û’';
  }

  @override
  String get progressVitality => 'Ø¢Ø¬ Ú©ÛŒ Ø¬Ø§Ù†';

  @override
  String get progressVitalityEmpty =>
      'Ø¨Ø§Øº Ø´Ø±ÙˆØ¹ Ú©Ø±Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ø§ÛŒÚ© Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚºÛ”';

  @override
  String progressVitalitySeeds(String done, String total) {
    return '$done / $total Ø¨ÛŒØ¬ Ø¢Ø¬ Ù„Ú¯Ø§Ø¦Û’ Ú¯Ø¦Û’Û”';
  }

  @override
  String progressChainPill(String days) {
    return '$days Ø¯Ù† Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ±';
  }

  @override
  String get progressMetricCurrent => 'Ø­Ø§Ù„ÛŒÛ';

  @override
  String get progressMetricBest => 'Ø¨ÛØªØ±ÛŒÙ†';

  @override
  String get progressMetricDone => 'Ù…Ú©Ù…Ù„';

  @override
  String get progressMetricPerfect => 'Ú©Ø§Ù…Ù„';

  @override
  String get progressMetricHabits => 'Ø¹Ø§Ø¯Ø§Øª';

  @override
  String get progressHabitBlooms => 'Ø¹Ø§Ø¯Øª Ú©Û’ Ù¾Ú¾ÙˆÙ„';

  @override
  String get progressHabitBloomsSub =>
      'Ø±ÙˆØ²Ø§Ù†Û Ù¾Ø§Ù†ÛŒ Ø¯ÛŒÛ’ Ø¬Ø§Ù†Û’ ÙˆØ§Ù„Û’ Ù¾ÙˆØ¯ÙˆÚº Ú©Û’ Ù„ÛŒÛ’ Ø§Ø³Ù¹Ø±ÛŒÚ© Ø³Ù†Ú¯ Ù…ÛŒÙ„Ø²Û”';

  @override
  String get progressNextBadge => 'Ø§Ú¯Ù„Ø§ Ø¨ÛŒØ¬';

  @override
  String progressMedalCount(String earned, String total) {
    return '$earned / $total';
  }

  @override
  String get progressPersonalActivity => 'Ø°Ø§ØªÛŒ Ø³Ø±Ú¯Ø±Ù…ÛŒ';

  @override
  String progressBrowseMonth(String month) {
    return '$month Ø¨Ø±Ø§Ø¤Ø² Ú©Ø± Ø±ÛÛ’ ÛÛŒÚºÛ” Ø§Ù¾Ù†ÛŒ Ù„Ø§Ø¦ÛŒÙˆ Ø³Ø±Ú¯Ø±Ù…ÛŒ Ù¾Ø± ÙˆØ§Ù¾Ø³ Ø¬Ø§Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ \"Ø¢Ø¬\" Ù¹ÛŒÙ¾ Ú©Ø±ÛŒÚºÛ”';
  }

  @override
  String get progressJumpToToday => 'Ø¢Ø¬';

  @override
  String get progressCalendarLegend => 'Ú¯ÛØ±Ø§ = Ø²ÛŒØ§Ø¯Û Ù…Ú©Ù…Ù„';

  @override
  String get progressCalendarBody =>
      'Ú¯ÛØ±Ø§ Ø³Ø¨Ø² Ø§ÛŒÚ© Ú©Ø§Ù…Ù„ Ø¯Ù† Ú©Ø§ Ù…Ø·Ù„Ø¨ ÛÛ’Û” Ø¬ÛŒØ³Û’ Ø¬ÛŒØ³Û’ Ø¢Ù¾ Ú†Ú¾ÙˆÚ‘ØªÛ’ ÛÛŒÚº Ø±Ù†Ú¯ ÛÙ„Ú©Ø§ ÛÙˆØªØ§ Ø¬Ø§ØªØ§ ÛÛ’Û”';

  @override
  String get paywallTitle => 'Ø²Ù†Ø¬ÛŒØ± Ú©Ùˆ Ù†Û Ù¹ÙˆÙ¹Ù†Û’ Ø¯ÛŒÚºÛ”';

  @override
  String get paywallSubtitle =>
      'Daily Stitch Pro Ø¢Ù¾ Ú©Ùˆ Ù…Ú©Ù…Ù„ Ù†Ø¸Ù… Ùˆ Ø¶Ø¨Ø· Ú©Ø§ Ù†Ø¸Ø§Ù… Ø¯ÛŒØªØ§ ÛÛ’Û”';

  @override
  String get paywallFeatures =>
      'ØªÙ…Ø§Ù… 5 Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø¬Ú¯ÛÛŒÚºØŒ ØµØ±Ù 3 Ù†ÛÛŒÚº|Ø¢Ù¾ Ú©ÛŒ Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ®ØŒ ÛÙ…ÛŒØ´Û Ú©Û’ Ù„ÛŒÛ’|Ù…Ú©Ù…Ù„ ØªÙ…ØºÙˆÚº Ú©Ø§ Ù…Ø¬Ù…ÙˆØ¹Û|ÛØ± Ù…Ø§Û Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ²|ÛÙØªÛ ÙˆØ§Ø± Ø±Ø³ÛŒØ¯ + Ø´ÛŒØ¦Ø± Ú©Ø§Ø±Úˆ|ØªÚ¾ÛŒÙ…Ø² + Ù…Ø²ÛŒØ¯';

  @override
  String get paywallFeaturesBodies =>
      'Ù…ÙØª Ù…ÛŒÚº ØµØ±Ù 3 Ù…Ù„ØªÛ’ ÛÛŒÚºÛ” Pro ØªÙ…Ø§Ù… Ù¾Ø§Ù†Ú† Ú©Ú¾ÙˆÙ„ØªØ§ ÛÛ’ ØªØ§Ú©Û Ø¢Ù¾ Ú©ÛŒ Ù…Ú©Ù…Ù„ Ø±ÙˆØ²Ø§Ù†Û Ø±Ø³Ù… ÛŒÛØ§Úº Ø±Û Ø³Ú©Û’Û”|ÛØ± ÙˆÛ Ø¯Ù† Ø¨Ø±Ø§Ø¤Ø² Ú©Ø±ÛŒÚº Ø¬Ùˆ Ø¢Ù¾ Ù†Û’ Ù…Ú©Ù…Ù„ Ú©ÛŒØ§ â€” ØµØ±Ù Ø¢Ø®Ø±ÛŒ 7 Ù†ÛÛŒÚºÛ” Ø³Ø§Ù„ÙˆÚº Ú©Ùˆ Ù¾ÛŒÚ†Ú¾Û’ Ø¯ÛŒÚ©Ú¾ÛŒÚºØŒ ÛÙØªÙˆÚº Ú©Ùˆ Ù†ÛÛŒÚºÛ”|Legendary Ù¹Ø§Ø¦Ø± Ú©Û’ ØªÙ…ØºÛ’ Ú©Ú¾ÙˆÙ„ÛŒÚºÛ” Ø³Ø¨ Ø³Û’ Ù†Ø§Ø¯Ø± Ø¨ÛŒØ¬ Ø§Ù† Ù„ÙˆÚ¯ÙˆÚº Ú©Û’ Ù„ÛŒÛ’ ÛÛŒÚº Ø¬Ùˆ Ù¾ÙˆØ±ÛŒ Ù„Ú¯Ù† Ù„Ú¯Ø§ØªÛ’ ÛÛŒÚºÛ”|ÛØ± Ù…Ø§Û 2 Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² ØªØ§Ú©Û Ø§ÛŒÚ© Ø¨Ø±Ø§ Ø¯Ù† Ø¢Ù¾ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø®ØªÙ… Ù†Û Ú©Ø±Û’Û”|Ø§Ù¾Ù†Û’ ÛÙØªÛ’ Ú©Û’ Ø®ÙˆØ¨ØµÙˆØ±Øª Ø´ÛŒØ¦Ø± Ú©Ø§Ø±ÚˆÛ” Ø§Ù¾Ù†ÛŒ Ø²Ù†Ø¬ÛŒØ± Ù¾ÙˆØ³Ù¹ Ú©Ø±ÛŒÚºØŒ Ú©Ø³ÛŒ Ø§ÙˆØ± Ú©Ùˆ Ø´Ø±ÙˆØ¹ Ú©Ø±Ù†Û’ Ú©ÛŒ ØªØ±ØºÛŒØ¨ Ø¯ÛŒÚºÛ”|Ù†Ø¦Û’ Ø±Ù†Ú¯ Ø§ÙˆØ± ØªÚ¾ÛŒÙ…Ø² Ú©Ú¾ÙˆÙ„ÛŒÚº Ø¬ÛŒØ³Û’ ÛÙ… Ø´Ø§Ù…Ù„ Ú©Ø±ØªÛ’ ÛÛŒÚºÛ” ÛÙ…ÛŒØ´Û Ù…ÙØª Ø§Ù¾ ÚˆÛŒÙ¹Ø³Û”';

  @override
  String get paywallYearly => 'Ø³Ø§Ù„Ø§Ù†Û';

  @override
  String get paywallYearlyCaption =>
      'Ø¨ÛØªØ±ÛŒÙ† Ù‚ÛŒÙ…Øª Â· ØªÙ‚Ø±ÛŒØ¨Ø§Ù‹ \$2.50/Ù…Ø§Û';

  @override
  String get paywallYearlyBadge => '35% Ø¨Ú†Ø§Ø¦ÛŒÚº';

  @override
  String get paywallMonthly => 'Ù…Ø§ÛØ§Ù†Û';

  @override
  String get paywallMonthlyCaption =>
      'Ù…Ø§ÛØ§Ù†Û Ø¨Ù„Ù†Ú¯ Â· Ú©Ø³ÛŒ Ø¨Ú¾ÛŒ ÙˆÙ‚Øª Ù…Ù†Ø³ÙˆØ® Ú©Ø±ÛŒÚº';

  @override
  String paywallStartCta(String price) {
    return 'Pro Ø´Ø±ÙˆØ¹ Ú©Ø±ÛŒÚº Â· $price/Ø³Ø§Ù„';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Pro Ø´Ø±ÙˆØ¹ Ú©Ø±ÛŒÚº Â· $price/Ù…Ø§Û';
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
  String get paywallRestore => 'Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒ Ø¨Ø­Ø§Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get paywallTerms => 'Ø´Ø±Ø§Ø¦Ø·';

  @override
  String get paywallPrivacy => 'Ø±Ø§Ø²Ø¯Ø§Ø±ÛŒ';

  @override
  String get paywallNoRestore =>
      'Ø§Ø³ Ø§Ú©Ø§Ø¤Ù†Ù¹ Ù¾Ø± Ú©ÙˆØ¦ÛŒ Ù¾Ú†Ú¾Ù„ÛŒ Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒ Ù†ÛÛŒÚº Ù…Ù„ÛŒÛ”';

  @override
  String get paywallRestoreLater =>
      'ÛÙ… Ø§Ú¯Ù„Û’ Ø³Ù†Ú© Ù¾Ø± Ø¢Ù¾ Ú©ÛŒ Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒ Ø¨Ø­Ø§Ù„ Ú©Ø± Ø¯ÛŒÚº Ú¯Û’Û”';

  @override
  String get paywallAlreadyPro =>
      'Ø¢Ù¾ Pro Ù¾Ø± ÛÛŒÚºÛ” Ø¢Ù¾ Ú©ÛŒ Ø­Ù…Ø§ÛŒØª Ú©Ø§ Ø´Ú©Ø±ÛŒÛÛ”';

  @override
  String get paywallHabitSlotHead =>
      'Ø¢Ù¾ Ù†Û’ Ø§Ù¾Ù†ÛŒ ØªÙ…Ø§Ù… Ù…ÙØª Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø¬Ú¯ÛÛŒÚº Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø± Ù„ÛŒ ÛÛŒÚºÛ” Ù…Ú©Ù…Ù„ Ø³ÛŒÙ¹ Ú©Ú¾ÙˆÙ„ÛŒÚº ØªØ§Ú©Û ÛØ± Ø±Ø³Ù… Ú©Ùˆ Ù„Ú¯Ø§ÛŒØ§ Ø¬Ø§ Ø³Ú©Û’Û”';

  @override
  String get paywallHistoryHead =>
      'Ø§Ù¾Ù†Ø§ Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ® Ø¯ÛŒÚ©Ú¾ÛŒÚº â€” ÛØ± Ú©Ø§Ù…Ù„ Ø¯Ù†ØŒ ÛØ± ØªÙ…ØºÛØŒ ÛØ± ÙˆØ§Ù¾Ø³ÛŒÛ”';

  @override
  String get paywallMedalHead =>
      'Ù†Ø§Ø¯Ø± ØªØ±ÛŒÙ† ØªÙ…ØºÛ’ ØµØ±Ù Pro Ú©Û’ Ù„ÛŒÛ’ ÛÛŒÚºÛ” Ø¢Ú¯Û’ Ø¨Ú‘Ú¾ØªÛ’ Ø±ÛÛŒÚº â€” ÙˆÛ Ø¢Ù¾ Ø³Û’ Ø²ÛŒØ§Ø¯Û Ù‚Ø±ÛŒØ¨ ÛÛŒÚº Ø¬ØªÙ†Ø§ Ø¢Ù¾ Ø³ÙˆÚ†ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get settingsYourActivity => 'Ø¢Ù¾ Ú©ÛŒ Ø³Ø±Ú¯Ø±Ù…ÛŒ';

  @override
  String get settingsHelpInfo => 'Ù…Ø¯Ø¯ Ø§ÙˆØ± Ù…Ø¹Ù„ÙˆÙ…Ø§Øª';

  @override
  String get settingsAccount => 'Ø§Ú©Ø§Ø¤Ù†Ù¹';

  @override
  String get settingsNurturingTools => 'Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Û’ Ø§ÙˆØ²Ø§Ø±';

  @override
  String get settingsReminders => 'ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒØ§Úº';

  @override
  String get settingsWidgetSanctuary => 'ÙˆÛŒØ¬ÛŒÙ¹ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ';

  @override
  String get settingsEcosystemSupport => 'Ù…Ø§Ø­ÙˆÙ„ÛŒØ§ØªÛŒ Ù…Ø¹Ø§ÙˆÙ†Øª';

  @override
  String get settingsHowItWorks => 'ÛŒÛ Ú©ÛŒØ³Û’ Ú©Ø§Ù… Ú©Ø±ØªØ§ ÛÛ’';

  @override
  String get settingsSignOut => 'Ø³Ø§Ø¦Ù† Ø¢Ø¤Ù¹';

  @override
  String get settingsSignOutConfirm =>
      'Ú©ÛŒØ§ Ø¢Ù¾ ÙˆØ§Ù‚Ø¹ÛŒ Ø³Ø§Ø¦Ù† Ø¢Ø¤Ù¹ Ú©Ø±Ù†Ø§ Ú†Ø§ÛØªÛ’ ÛÛŒÚºØŸ';

  @override
  String get settingsProActive => 'ÙØ¹Ø§Ù„';

  @override
  String get settingsProFree => 'Ù…ÙØª Ù¹Ø§Ø¦Ø±';

  @override
  String get settingsLanguage => 'Ø²Ø¨Ø§Ù†';

  @override
  String get settingsLanguageValue => 'Ø³Ø³Ù¹Ù… ÚˆÛŒÙØ§Ù„Ù¹';

  @override
  String get firstRunGreeting =>
      '5 Ú©Ø§Ù…Û” Ø¨Ø³Û” Ø§Ù† Ú©ÛŒ Ù‚Ø¯Ø± Ø±Ú©Ú¾ÛŒÚºÛ”';

  @override
  String get firstRunBody =>
      'Ø§Ù¾Ù†Ø§ Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚº â€” Ø¢Ø¬ Ø³Ø¨ Ø³Û’ Ø²ÛŒØ§Ø¯Û Ø§ÛÙ… Ú©ÛŒØ§ ÛÛ’ØŸ';

  @override
  String get firstRunCta => 'Ø§Ù¾Ù†Ø§ Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get emptyStateClearAll => 'Ø³Ø¨ ØµØ§Ù Ú©Ø±ÛŒÚº';

  @override
  String get cancel => 'Ù…Ù†Ø³ÙˆØ® Ú©Ø±ÛŒÚº';

  @override
  String get intentionTitle1 => 'Ø¢Ø¦ÛŒÛ’ Ù†Ø¦ÛŒ Ù†ÛŒØª Ù„Ú¯Ø§Ø¦ÛŒÚº!';

  @override
  String get intentionBody1 =>
      'ÛØ± Ø·Ø§Ù‚ØªÙˆØ± Ø¬Ù†Ú¯Ù„ Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹Û’ Ø³Û’ Ø§Ù†ØªØ®Ø§Ø¨ Ø³Û’ Ø´Ø±ÙˆØ¹ ÛÙˆØªØ§ ÛÛ’Û” Ù…Ø¬Ú¾Û’ Ø¨ØªØ§Ø¦ÛŒÚº Ø¢Ø¬ ÛÙ… Ú©ÛŒØ§ Ù¾Ø§Ù„ Ø±ÛÛ’ ÛÛŒÚºØŸ';

  @override
  String get intentionTitle2 => 'Ø¢Ø¬ ÛÙ… Ú©ÛŒØ§ Ø§Ú¯Ø§Ø¦ÛŒÚºØŸ';

  @override
  String get intentionBody2 =>
      'Ú†Ú¾ÙˆÙ¹Û’ Ø¨ÛŒØ¬ØŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ø³Û’ØŒ Ù„Ù…Ø¨Û’ Ø¯Ø±Ø®Øª Ø¨Ù† Ø¬Ø§ØªÛ’ ÛÛŒÚºÛ” Ø§Ø¨Ú¾ÛŒ Ø³Ø¨ Ø³Û’ Ø§ÛÙ… Ø§Ù†ØªØ®Ø§Ø¨ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get intentionTitle3 =>
      'Ø§ÛŒÚ© Ø¨ÛŒØ¬Û” Ø§ÛŒÚ© Ø³Ø§Ù†Ø³Û” Ø´Ø±ÙˆØ¹ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get intentionBody3 =>
      'Ø¢Ù¾ Ú©Ùˆ Ù¾ÙˆØ±Ø§ Ø¬Ù†Ú¯Ù„ Ø§ÛŒÚ© Ø³Ø§ØªÚ¾ Ù†ÛÛŒÚº Ù„Ú¯Ø§Ù†Ø§ â€” ØµØ±Ù Ø§Ú¯Ù„Ø§ ØµØ­Ø­ Ú©Ø§Ù… Ú©Ø±ÛŒÚºÛ”';

  @override
  String get intentionTitle4 =>
      'Ø§Ú¯Ù„Û’ Ú†Ú¾ÙˆÙ¹Û’ Ù‚Ø¯Ù… Ú©ÛŒ Ù¾Ø±ÙˆØ±Ø´ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get intentionBody4 =>
      'Ù…Ø³ØªÙ‚Ø¨Ù„ Ú©Ø§ Ø¢Ù¾ Ø§Ø³ Ù¾Ø§Ù†Ú† Ù…Ù†Ù¹ Ù…ÛŒÚº Ú©ÛŒÛ’ Ú¯Ø¦Û’ Ø§Ù†ØªØ®Ø§Ø¨ÙˆÚº Ø³Û’ Ø¨Ù†ØªØ§ ÛÛ’Û” Ø§ÛŒÚ© Ù…ÛØ±Ø¨Ø§Ù† Ø§Ù†ØªØ®Ø§Ø¨ Ú©ÛŒØ§ ÛÛ’ØŸ';

  @override
  String get intentionTitle5 =>
      'Ù…Ù†ØªØ®Ø¨ Ú©Ø±ÛŒÚº Ø¢Ù¾ Ú©ÛŒØ§ Ø¨Ù†Ù†Ø§ Ú†Ø§ÛØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get intentionBody5 =>
      'Ú©Ø§Ù… Ø¨ÛŒØ¬ ÛÛŒÚºØŒ Ø¹Ø§Ø¯Ø§Øª Ù¾ÙˆØ¯Û’ ÛÛŒÚºÛ” Ù…Ù„ Ú©Ø± ÙˆÛ Ø¬Ù†Ú¯Ù„ Ø¨Ù†Ø§ØªÛ’ ÛÛŒÚº Ø¬Ø³ Ù¾Ø± Ø¢Ù¾ Ú©Ùˆ ÙØ®Ø± ÛÛ’Û”';

  @override
  String get intentionTitle6 =>
      'Ú©Ú†Ú¾ Ø§ÛŒØ³ÛŒ Ú†ÛŒØ² Ù„Ú¯Ø§Ø¦ÛŒÚº Ø¬Ùˆ ÛŒØ§Ø¯ Ø±Ú©Ú¾Ù†Û’ Ú©Û’ Ù‚Ø§Ø¨Ù„ ÛÙˆÛ”';

  @override
  String get intentionBody6 =>
      'ÛØ± Ø¯Ù† Ø¨Ú‘Ø§ Ù…Ø­Ø³ÙˆØ³ Ù†ÛÛŒÚº ÛÙˆØªØ§Û” Ù¾Ø§Ù†ÛŒ Ø¯ÛŒØ§ Ú¯ÛŒØ§ Ø¨ÛŒØ¬ Ø¨Ú¾ÛŒ Ø´Ù…Ø§Ø± ÛÙˆØªØ§ ÛÛ’Û” Ø¢Ø¦ÛŒÛ’ Ø§ÛŒÚ© Ù†Ø§Ù… Ø¯ÛŒØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get intentionTitle7 =>
      'Ø¢Ø¬ Ú©Ùˆ ØªÚ¾ÙˆÚ‘Ø§ Ø¨ÛØ§Ø¯Ø± Ø¨Ù†Ø§Ø¦ÛŒÚºÛ”';

  @override
  String get intentionBody7 =>
      'ÛÙ…Øª Ø¬Ù…Ø¹ ÛÙˆØªÛŒ ÛÛ’Û” ÙˆÛ Ø¨ÛŒØ¬ Ú†Ù†ÛŒÚº Ø¬Ùˆ Ø¢Ù¾ Ù¹Ø§Ù„ Ø±ÛÛ’ ÛÛŒÚº â€” Ø§Ø³ Ú©Ø§ Ù†Ø§Ù… Ù„ÛŒÙ†Ø§ Ø¨Ú¾ÛŒ Ø§Ø³Û’ Ø¢Ú¯Û’ Ø¨Ú‘Ú¾Ø§ØªØ§ ÛÛ’Û”';

  @override
  String get intentionTitle8 =>
      'Ø¨ÛŒØ¬ Ø³Û’ Ù¾ÛÙ„Û’ Ø²Ù…ÛŒÙ† Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get intentionBody8 =>
      'Ú©ÙˆÙ† Ø³Ø§ Ø°ÛÙ†ÛŒØªØŒ Ù¹ÙˆÙ„ØŒ ÛŒØ§ Ú†Ú¾ÙˆÙ¹ÛŒ Ø±Ø³Ù… Ø§Ø³ Ú©Ø§Ù… Ú©Ùˆ Ø¢Ø³Ø§Ù† Ø¨Ù†Ø§Ø¦Û’ Ú¯ÛŒØŸ Ù†ÙˆÙ¹Ø³ Ù…ÛŒÚº Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get shareCardSnapshot =>
      'Ø¢Ù¾ Ú©Û’ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ Ú©Ø§ Ø§ÛŒÚ© Ù…Ù†Ø¸Ø±';

  @override
  String get shareCardBody =>
      'Ø§ÙˆÙ¾Ø± Ú©Ø§ Ú©Ø§Ø±Úˆ PNG Ú©Û’ Ø·ÙˆØ± Ù¾Ø± Ø§ÛŒÚ©Ø³Ù¾ÙˆØ±Ù¹ ÛÙˆØªØ§ ÛÛ’ Ø§ÙˆØ± Ø¢Ù¾ Ú©ÛŒ Ø´ÛŒØ¦Ø± Ø´ÛŒÙ¹ Ù…ÛŒÚº Ø¨Ú¾ÛŒØ¬Ø§ Ø¬Ø§ØªØ§ ÛÛ’Û” Ø§Ø³Û’ Ø§Ù¾Ù†ÛŒ Ø§Ø³Ù¹ÙˆØ±ÛŒ Ù¾Ø± Ù¾ÙˆØ³Ù¹ Ú©Ø±ÛŒÚºØŒ Ø¯ÙˆØ³Øª Ú©Ùˆ Ø¨Ú¾ÛŒØ¬ÛŒÚºØŒ ÛŒØ§ Ø§Ø³Ù¹Ú©Ø± Ú©Û’ Ø·ÙˆØ± Ù¾Ø± Ù¾Ø±Ù†Ù¹ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get shareCardShareMyBloom => 'Ø§Ù¾Ù†Ø§ Ù¾Ú¾ÙˆÙ„ Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get shareCardCouldNotShare =>
      'Ø§Ø¨Ú¾ÛŒ Ø´ÛŒØ¦Ø± Ù†ÛÛŒÚº Ú©Ø± Ø³Ú©ØªÛ’';

  @override
  String shareCardProgressText(String year) {
    return 'Ù…ÛŒØ±ÛŒ Daily Stitch Ù¾ÛŒØ´Ø±ÙØª â€” Daily Stitch Ù¾Ø± $yearÛ”';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'Ù…ÛŒÚº Ù†Û’ Ø§Ø¨Ú¾ÛŒ Daily Stitch Ù¾Ø± \"$title\" ØªÙ…ØºÛ Ú©Ú¾ÙˆÙ„Ø§ ÛÛ’Û” $subtitle';
  }

  @override
  String get howItWorksTitle => 'ÛŒÛ Ú©ÛŒØ³Û’ Ú©Ø§Ù… Ú©Ø±ØªØ§ ÛÛ’';

  @override
  String get howItWorksBody =>
      'Daily Stitch Ø¢Ù¾ Ú©Ùˆ Ù†Ø¸Ù… Ùˆ Ø¶Ø¨Ø· Ú©ÛŒ Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹ÛŒØŒ Ù†Û Ù¹ÙˆÙ¹Ù†Û’ ÙˆØ§Ù„ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø±Ú©Ú¾Ù†Û’ Ù…ÛŒÚº Ù…Ø¯Ø¯ Ú©Ø±ØªØ§ ÛÛ’Û” Ø¨Ø³Û”';

  @override
  String get howItWorksToday => 'Ø¢Ø¬ Ú©Ø§ Ù¹ÛŒØ¨';

  @override
  String get howItWorksTodayBody =>
      'ÛŒÛ Ø¢Ù¾ Ú©Ø§ Ú¯Ú¾Ø± ÛÛ’Û” ÛŒÛ 5 Ú©Ø§Ù… Ø§ÙˆØ± Ø¢Ø¬ Ú©Û’ Ù„ÛŒÛ’ Ù…Ù‚Ø±Ø± Ú©Ø±Ø¯Û Ø¹Ø§Ø¯Ø§Øª Ø¯Ú©Ú¾Ø§ØªØ§ ÛÛ’Û” Ø±Ø§Øª 12 Ø¨Ø¬Û’ ØªÚ© Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºØŒ Ø²Ù†Ø¬ÛŒØ± Ø¨Ú‘Ú¾ØªÛŒ ÛÛ’Û”';

  @override
  String get howItWorksCap => '5 Ú©Ø§Ù… Ú©ÛŒ Ø­Ø¯ ÛÛŒ ÙÛŒÚ†Ø± ÛÛ’';

  @override
  String get howItWorksCapBody =>
      'ÛÙ… Ø¢Ù¾ Ú©Ùˆ 6ÙˆØ§Úº Ø´Ø§Ù…Ù„ Ù†ÛÛŒÚº Ú©Ø±Ù†Û’ Ø¯ÛŒØªÛ’Û” ÛŒÛÛŒ Ù¾ÙˆØ±Ø§ Ù…Ù‚ØµØ¯ ÛÛ’Û” Ú†Ú¾ÙˆÙ¹ÛŒ Ø²Ù†Ø¬ÛŒØ±ÛŒÚº Ù„Ù…Ø¨ÛŒ Ø²Ù†Ø¬ÛŒØ±ÙˆÚº Ø³Û’ Ø¨ÛØªØ± ÛÛŒÚºÛ” Ù…Ú©Ù…Ù„ ÙˆØ¬Û Ú©Û’ Ù„ÛŒÛ’ ÛÙˆÙ… Ø§Ø³Ú©Ø±ÛŒÙ† Ù¾Ø± \"?\" Ù¹ÛŒÙ¾ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get howItWorksHabits =>
      'Ø¹Ø§Ø¯Ø§Øª Ø±ÙˆØ²Ø§Ù†Û ÛÛŒÚºØŒ Ø²Ù†Ø¬ÛŒØ± ÛÙ…ÛŒØ´Û Ú©Û’ Ù„ÛŒÛ’';

  @override
  String get howItWorksHabitsBody =>
      'Ø¹Ø§Ø¯Ø§Øª (ØµØ¨Ø­ ÛŒÙˆÚ¯Ø§ØŒ Ù¾Ø§Ù†ÛŒ Ù¾ÛŒÙ†Ø§) ÛÙ…ÛŒØ´Û Ø±ÛØªÛŒ ÛÛŒÚºÛ” Ú©Ø§Ù… Ø§ÛŒÚ© Ø¨Ø§Ø± Ú©Û’ ÛÙˆØªÛ’ ÛÛŒÚºÛ” Ø¯ÙˆÙ†ÙˆÚº Ø§ÛŒÚ© ÛÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ© Ú©Ùˆ Ø¨Ú‘Ú¾Ø§ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get howItWorksLeftBehind => 'Ú†Ú¾ÙˆÙ¹Û’ Ú©Ø§Ù… â†’ Left Behind';

  @override
  String get howItWorksLeftBehindBody =>
      'Ø±Ø§Øª 12 Ø¨Ø¬Û’ØŒ Ù†Ø§Ù…Ú©Ù…Ù„ Ú©Ø§Ù… Left Behind Ù…ÛŒÚº Ú†Ù„Û’ Ø¬Ø§ØªÛ’ ÛÛŒÚºÛ” ØµØ±Ù ÙˆÛÛŒ Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº Ø¬Ùˆ Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ø§ÛÙ… ÛÙˆÛ” Ø¨Ø§Ù‚ÛŒ Ú©Ùˆ Ø®Ø§Ù…ÙˆØ´ÛŒ Ø³Û’ Ú†Ú¾ÙˆÚ‘ Ø¯ÛŒØ§ Ø¬Ø§ØªØ§ ÛÛ’Û”';

  @override
  String get howItWorksProgress => 'Ù¾ÛŒØ´Ø±ÙØª Ú©Ø§ Ù¹ÛŒØ¨';

  @override
  String get howItWorksProgressBody =>
      'Ø§Ø³Ù¹Ø±ÛŒÚ©ØŒ Ú©ÛŒÙ„Ù†ÚˆØ±ØŒ ØªÙ…ØºÛ’ØŒ ØªØ§Ø±ÛŒØ® â€” ÙˆÙ‚Øª Ú©Û’ Ø³Ø§ØªÚ¾ Ø¢Ù¾ Ú©ÛŒØ³Ø§ Ú©Ø± Ø±ÛÛ’ ÛÛŒÚº Ø§Ø³ Ú©Ø§ Ø³Ø¨ Ú©Ú†Ú¾Û” ÛŒÛØ§Úº Ú©ÙˆØ¦ÛŒ ÙÙˆØ±ÛŒ Ú©Ø§Ù… Ù†ÛÛŒÚº ÛÛ’Û”';

  @override
  String get howItWorksYou => 'Ø¢Ù¾ Ú©Ø§ Ù¹ÛŒØ¨';

  @override
  String get howItWorksYouBody =>
      'Ø¢Ù¾ Ú©Ø§ Ø§Ú©Ø§Ø¤Ù†Ù¹ØŒ ØªØ±ØªÛŒØ¨Ø§ØªØŒ Ø³Ø§Ø¦Ù† Ø¢Ø¤Ù¹Û” Ø¨Ø³Û”';

  @override
  String get howItWorksRule =>
      'Ø§ØµÙˆÙ„: 5 Ú†Ú¾ÙˆÙ¹ÛŒ Ú†ÛŒØ²ÛŒÚºØŒ ÛØ± Ø±ÙˆØ²ØŒ Ú©ÙˆØ¦ÛŒ Ø¨ÛØ§Ù†Û Ù†ÛÛŒÚºÛ”';

  @override
  String get commonRetry => 'Ø¯ÙˆØ¨Ø§Ø±Û Ú©ÙˆØ´Ø´ Ú©Ø±ÛŒÚº';

  @override
  String get commonBack => 'ÙˆØ§Ù¾Ø³';

  @override
  String get commonDismiss => 'Ø®ØªÙ… Ú©Ø±ÛŒÚº';

  @override
  String get commonCancel => 'Ù…Ù†Ø³ÙˆØ® Ú©Ø±ÛŒÚº';

  @override
  String get commonClose => 'Ø¨Ù†Ø¯ Ú©Ø±ÛŒÚº';

  @override
  String get commonSend => 'Ø¨Ú¾ÛŒØ¬ÛŒÚº';

  @override
  String get commonCopy => 'Ú©Ø§Ù¾ÛŒ Ú©Ø±ÛŒÚº';

  @override
  String get commonShowLess => 'Ú©Ù… Ø¯Ú©Ú¾Ø§Ø¦ÛŒÚº';

  @override
  String get commonViewFull => 'Ù…Ú©Ù…Ù„ Ù†ÙˆÙ¹Ø³ Ø¯ÛŒÚ©Ú¾ÛŒÚº';

  @override
  String get commonEdit => 'ØªØ±Ù…ÛŒÙ… Ú©Ø±ÛŒÚº';

  @override
  String get commonDelete => 'Ø­Ø°Ù Ú©Ø±ÛŒÚº';

  @override
  String get commonDone => 'Ù…Ú©Ù…Ù„';

  @override
  String get commonError => 'Ú©Ú†Ú¾ ØºÙ„Ø· ÛÙˆ Ú¯ÛŒØ§';

  @override
  String get commonPageNotFound => 'ØµÙØ­Û Ù†ÛÛŒÚº Ù…Ù„Ø§';

  @override
  String get commonHome => 'Ú¯Ú¾Ø±';

  @override
  String get commonUnknownError => 'Ù†Ø§Ù…Ø¹Ù„ÙˆÙ… Ø±Ø§Ø¤Ù¹Ù†Ú¯ Ø®Ø±Ø§Ø¨ÛŒ';

  @override
  String get commonSettingsTooltip => 'ØªØ±ØªÛŒØ¨Ø§Øª';

  @override
  String get commonHowThisWorks => 'ÛŒÛ Ú©ÛŒØ³Û’ Ú©Ø§Ù… Ú©Ø±ØªØ§ ÛÛ’';

  @override
  String get myDayReminderSet => 'ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒ Ù„Ú¯Ø§Ø¦ÛŒ Ú¯Ø¦ÛŒ';

  @override
  String get myDayPreparationNotes => 'ØªÛŒØ§Ø±ÛŒ Ú©Û’ Ù†ÙˆÙ¹Ø³';

  @override
  String get onboardingSkip => 'Ú†Ú¾ÙˆÚ‘ÛŒÚº';

  @override
  String get onboardingNext => 'Ø§Ú¯Ù„Ø§';

  @override
  String get onboardingEnterSanctuary =>
      'Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ Ù…ÛŒÚº Ø¯Ø§Ø®Ù„ ÛÙˆÚº';

  @override
  String get onboardingIntroduction => 'ØªØ¹Ø§Ø±Ù';

  @override
  String get onboardingGrowYourForest => 'Ø§Ù¾Ù†Ø§ Ø¬Ù†Ú¯Ù„ Ø¨Ú‘Ú¾Ø§Ø¦ÛŒÚº';

  @override
  String get onboardingPage1Title => 'Ø§Ù¾Ù†Û’ Ù†Ú¯ÛØ¨Ø§Ù† Ø³Û’ Ù…Ù„ÛŒÚºÛ”';

  @override
  String get onboardingPage1Body =>
      'Ø¢Ù¾ Ú©Û’ Ø°Ø§ØªÛŒ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ Ù…ÛŒÚº Ø®ÙˆØ´ Ø¢Ù…Ø¯ÛŒØ¯Û” ÛŒÛØ§ÚºØŒ Ø¢Ù¾ Ú©ÛŒ ØªØ±Ù‚ÛŒ Ø¢Ù¾ Ú©Û’ Ø¬Ù†Ú¯Ù„ Ú©ÛŒ Ø²Ù†Ø¯Ú¯ÛŒ Ù…ÛŒÚº Ø¬Ú¾Ù„Ú©ØªÛŒ ÛÛ’Û”';

  @override
  String get onboardingPage2Title =>
      'Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚºÛ” Ø§Ù†ÛÛŒÚº Ø¨Ú‘Ú¾ØªØ§ Ø¯ÛŒÚ©Ú¾ÛŒÚºÛ”';

  @override
  String get onboardingPage2Body =>
      'ÛØ± Ú©Ø§Ù… Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹Ø§ Ø¨ÛŒØ¬ ÛÛ’Û” ÛØ± Ø¹Ø§Ø¯Øª Ø§ÛŒÚ© Ù¾ÙˆØ¯Ø§ ÛÛ’ Ø¬Ø³ Ú©ÛŒ Ø¢Ù¾ Ø±ÙˆØ²Ø§Ù†Û Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ØªÛ’ ÛÛŒÚºÛ” Ù…Ù„ Ú©Ø± ÛŒÛ Ù†Ø¸Ù… Ùˆ Ø¶Ø¨Ø· Ú©Ø§ Ø¬Ù†Ú¯Ù„ Ø¨Ù†Ø§ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get onboardingPage3Title => 'Ù¾Ø§Ù†Ú† Ú©Ø§Ù…Û” Ø§ÛŒÚ© Ø²Ù†Ø¬ÛŒØ±Û”';

  @override
  String get onboardingPage3Body =>
      'Ø¢Ù¾ Ø±ÙˆØ²Ø§Ù†Û ØµØ±Ù 5 Ø¨ÛŒØ¬ Ù„Ú¯Ø§ Ø³Ú©ØªÛ’ ÛÛŒÚºÛ” ÛŒÛ Ø­Ø¯ Ø¢Ù¾ Ú©Ùˆ ÙˆØ§Ù‚Ø¹ÛŒ Ø§ÛÙ… Ú†ÛŒØ² Ù¾Ø± ØªÙˆØ¬Û Ø¯ÛŒÙ†Û’ Ù¾Ø± Ù…Ø¬Ø¨ÙˆØ± Ú©Ø±ØªÛŒ ÛÛ’ â€” Ø§ÙˆØ± Ø¢Ù¾ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ú©ÛŒ Ø­ÙØ§Ø¸Øª Ú©Ø±ØªÛŒ ÛÛ’Û”';

  @override
  String get onboardingPage4Title =>
      'Ø§Ù¾Ù†Û’ Ù¾ÙˆØ¯ÙˆÚº Ú©ÛŒ Ø±ÙˆØ²Ø§Ù†Û Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get onboardingPage4Body =>
      'Ø¹Ø§Ø¯Ø§Øª Ø¨Ú‘Ú¾Ø§Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ù¹ÛŒÙ¾ Ú©Ø±ÛŒÚºÛ” Ø§ÛŒÚ© Ø¯Ù† Ú†Ú¾ÙˆÚ‘ÛŒÚº Ø§ÙˆØ± Ø²Ù†Ø¬ÛŒØ± Ù†ÛÛŒÚº Ø¨Ú‘Ú¾ØªÛŒÛ” Ù†Ú¯ÛØ¨Ø§Ù† Ø¢Ù¾ Ú©Û’ Ø³Ø§ØªÚ¾ Ø¨Ú‘Ú¾ØªØ§ ÛÛ’Û”';

  @override
  String get authBrand => 'DAILY STITCH';

  @override
  String get authPlantFirstSeed => 'Ø§Ù¾Ù†Ø§ Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚºÛ”';

  @override
  String get authWelcomeBack => 'Ø®ÙˆØ´ Ø¢Ù…Ø¯ÛŒØ¯ØŒ Ù†Ú¯ÛØ¨Ø§Ù†Û”';

  @override
  String get authFiveTasksDaily =>
      'Ù¾Ø§Ù†Ú† Ú©Ø§Ù…Û” Ø±ÙˆØ²Ø§Ù†Û Ø¹Ø§Ø¯Ø§ØªÛ” Ú©ÙˆØ¦ÛŒ Ø¨ÛØ§Ù†Û Ù†ÛÛŒÚºÛ”';

  @override
  String get authSanctuaryWaiting =>
      'Ø¢Ù¾ Ú©Ø§ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ Ù…Ù†ØªØ¸Ø± ÛÛ’Û”';

  @override
  String get authSignIn => 'Ø³Ø§Ø¦Ù† Ø§Ù†';

  @override
  String get authSignUp => 'Ø³Ø§Ø¦Ù† Ø§Ù¾';

  @override
  String get authEmail => 'Ø§ÛŒ Ù…ÛŒÙ„';

  @override
  String get authPassword => 'Ù¾Ø§Ø³ ÙˆØ±Úˆ';

  @override
  String get authEmailHint => 'you@email.com';

  @override
  String get authCreateAccount => 'Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø¨Ù†Ø§Ø¦ÛŒÚº';

  @override
  String get authSignInCta => 'Ø³Ø§Ø¦Ù† Ø§Ù†';

  @override
  String get authOrContinueWith => 'ÛŒØ§ Ø¬Ø§Ø±ÛŒ Ø±Ú©Ú¾ÛŒÚº';

  @override
  String get authContinueWithGoogle => 'Google Ø³Û’ Ø¬Ø§Ø±ÛŒ Ø±Ú©Ú¾ÛŒÚº';

  @override
  String get authEnterEmail => 'Ø§Ù¾Ù†Ø§ Ø§ÛŒ Ù…ÛŒÙ„ Ø¯Ø±Ø¬ Ú©Ø±ÛŒÚº';

  @override
  String get authEnterValidEmail =>
      'Ø¯Ø±Ø³Øª Ø§ÛŒ Ù…ÛŒÙ„ Ø§ÛŒÚˆØ±ÛŒØ³ Ø¯Ø±Ø¬ Ú©Ø±ÛŒÚº';

  @override
  String get authPasswordTooShort =>
      'Ù¾Ø§Ø³ ÙˆØ±Úˆ Ú©Ù… Ø§Ø² Ú©Ù… 8 Ø­Ø±ÙˆÙ Ú©Ø§ ÛÙˆÙ†Ø§ Ú†Ø§ÛÛŒÛ’';

  @override
  String get authAccountCreated =>
      'Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø¨Ù† Ú¯ÛŒØ§Û” Ø³Ø§Ø¦Ù† Ø§Ù† Ù¾Ø± Ø¬Ø§Ø¦ÛŒÚº Ø§ÙˆØ± Ø§Ù¾Ù†Ø§ Ù¾Ø§Ø³ ÙˆØ±Úˆ Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get authSomethingWentWrong =>
      'Ú©Ú†Ú¾ ØºÙ„Ø· ÛÙˆ Ú¯ÛŒØ§Û” Ø¯ÙˆØ¨Ø§Ø±Û Ú©ÙˆØ´Ø´ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get authCouldNotStartGoogle =>
      'Google Ø³Ø§Ø¦Ù† Ø§Ù† Ø´Ø±ÙˆØ¹ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©Ø§Û”';

  @override
  String get authMidnightReset =>
      'Ø³Ø§Ø¦Ù† Ø§Ù† Ú©Ø± Ú©Û’ØŒ Ø¢Ù¾ Ù‚Ø¨ÙˆÙ„ Ú©Ø±ØªÛ’ ÛÛŒÚº Ú©Û Ø¢Ù¾ Ú©Ø§ Ø¯Ù† Ø±Ø§Øª 12 Ø¨Ø¬Û’ Ø±ÛŒ Ø³ÛŒÙ¹ ÛÙˆØªØ§ ÛÛ’Û”';

  @override
  String get authSetupRequired => 'Ø³ÛŒÙ¹ Ø§Ù¾ Ø¯Ø±Ú©Ø§Ø± ÛÛ’';

  @override
  String get settingsPersonalSanctuary => 'Ø°Ø§ØªÛŒ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ';

  @override
  String get settingsHowThisWorks => 'ÛŒÛ Ú©ÛŒØ³Û’ Ú©Ø§Ù… Ú©Ø±ØªØ§ ÛÛ’';

  @override
  String get settingsHowThisWorksSubtitle =>
      'Ø§ÛŒÙ¾ Ú©ÛŒØ§ ÛÛ’ØŒ Ø­Ø¯ Ø§ÙˆØ± Ø§Ø³Ù¹Ø±ÛŒÚ© Ú©ÛŒØ³Û’ Ú©Ø§Ù… Ú©Ø±ØªÛŒ ÛÛ’';

  @override
  String get settingsStreakProtection => 'Ø§Ø³Ù¹Ø±ÛŒÚ© Ø­ÙØ§Ø¸Øª';

  @override
  String get settingsStreakProtectionAvailable =>
      'Ø§Ø³ Ù…ÛÛŒÙ†Û’ 1 ÙØ±ÛŒØ² Ø¯Ø³ØªÛŒØ§Ø¨ ÛÛ’';

  @override
  String get settingsStreakProtectionUsed =>
      'Ø§Ø³ Ù…ÛÛŒÙ†Û’ Ø§Ø³ØªØ¹Ù…Ø§Ù„ ÛÙˆ Ú†Ú©Ø§';

  @override
  String get settingsProSubscription => 'Daily Stitch Pro';

  @override
  String get settingsManageProSubscription =>
      'Pro Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† Ú©Ø§ Ø§Ù†ØªØ¸Ø§Ù… Ú©Ø±ÛŒÚº';

  @override
  String get settingsProCancelPlay =>
      'Google Play Ù…ÛŒÚº Ù…Ù†Ø³ÙˆØ® Ú©Ø±ÛŒÚº ÛŒØ§ Ù¾Ù„Ø§Ù† ØªØ¨Ø¯ÛŒÙ„ Ú©Ø±ÛŒÚº';

  @override
  String get settingsProUnlock =>
      'ØªÙ…Ø§Ù… 5 Ø¹Ø§Ø¯Ø§ØªØŒ Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ®ØŒ Ù…Ø²ÛŒØ¯ Ú©Ú¾ÙˆÙ„ÛŒÚº';

  @override
  String get settingsTaskAlarms =>
      'Ú©Ø§Ù… Ú©Û’ Ø§Ù„Ø§Ø±Ù… Ø§ÙˆØ± Ø¢Ø®Ø±ÛŒ Ù…ÙˆÙ‚Ø¹';

  @override
  String get settingsTaskAlarmsSubtitle =>
      'Ø´Ø§Ù… Ú©ÛŒ ØªØ±ØºÛŒØ¨ Ø§ÙˆØ± Ø±Ø§Øª 12 Ø¨Ø¬Û’ Ú©ÛŒ ØªÙ†Ø¨ÛŒÛ';

  @override
  String get settingsHomeScreenWidget => 'ÛÙˆÙ… Ø§Ø³Ú©Ø±ÛŒÙ† ÙˆÛŒØ¬ÛŒÙ¹';

  @override
  String get settingsHomeScreenWidgetSubtitle =>
      'Ø§Ù¾Ù†ÛŒ Ø²Ù†Ø¬ÛŒØ± Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ© ÛÙˆÙ… Ø§Ø³Ú©Ø±ÛŒÙ† Ù¾Ø± Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get settingsShareBloomTracker => 'Daily Stitch Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get settingsShareBloomTrackerSubtitle =>
      'Ø¯ÙˆØ³Øª Ú©Ùˆ Ø²Ù†Ø¬ÛŒØ± Ú©Û’ Ø¨Ø§Ø±Û’ Ù…ÛŒÚº Ø¨ØªØ§Ø¦ÛŒÚº';

  @override
  String get settingsHelpSupport => 'Ù…Ø¯Ø¯ Ùˆ Ù…Ø¹Ø§ÙˆÙ†Øª';

  @override
  String get settingsHelpSupportSubtitle =>
      'FAQ ÛŒØ§ Ù…Ø³Ø¦Ù„Û Ø±Ù¾ÙˆØ±Ù¹ Ú©Ø±ÛŒÚº';

  @override
  String get settingsSignOutTile => 'Ø³Ø§Ø¦Ù† Ø¢Ø¤Ù¹';

  @override
  String get settingsAllFeaturesUnlocked =>
      'ØªÙ…Ø§Ù… ÙÛŒÚ†Ø±Ø² Ú©Ú¾Ù„Û’ ÛÙˆØ¦Û’';

  @override
  String get settingsAllFeaturesUnlockedSubtitle =>
      'Ø¨ÛŒÙ¹Ø§ Ø¨Ù„Úˆ â€” ÛÙ… Ø¬Ø¨ ØªÚ© Ø³Ø¨ Ú©Ú†Ú¾ Ù¹ÛŒØ³Øª Ú©Ø±ØªÛ’ ÛÛŒÚº Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù†Ø² Ø±Ú©ÛŒ ÛÙˆØ¦ÛŒ ÛÛŒÚºÛ”';

  @override
  String settingsVersion(Object build, Object version) {
    return 'ÙˆØ±Ú˜Ù† $version ($build)';
  }

  @override
  String get settingsVersionUnknown => 'ÙˆØ±Ú˜Ù† 1.0.0';

  @override
  String get settingsHabitMaster => 'Ø¹Ø§Ø¯Øª Ù…Ø§Ø³Ù¹Ø±';

  @override
  String settingsLevel(Object level) {
    return 'Ù„ÛŒÙˆÙ„ $level Â· Ø¹Ø§Ø¯Øª Ù…Ø§Ø³Ù¹Ø±';
  }

  @override
  String get languagePickerTitle => 'Ø²Ø¨Ø§Ù†';

  @override
  String get youLast7Days => 'Ø¢Ø®Ø±ÛŒ 7 Ø¯Ù†';

  @override
  String get youLast7DaysSubtitle => 'Ø¯Ù† Ø¨Û Ø¯Ù† Ú©Ø§Ù… Ú©ÛŒ ØªØ§Ø±ÛŒØ®';

  @override
  String get youLeftBehindSubtitle =>
      'Ú†Ú¾ÙˆÙ¹Û’ ÛÙˆØ¦Û’ Ú©Ø§Ù… Ø¬Ùˆ Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ ÛÙˆÙ†Û’ Ú©Ø§ Ù…Ù†ØªØ¸Ø± ÛÛŒÚº';

  @override
  String get youProTier => 'Pro Ù¹Ø§Ø¦Ø±';

  @override
  String get youFreeTier => 'Ù…ÙØª Ù¹Ø§Ø¦Ø±';

  @override
  String get youPro => 'Pro';

  @override
  String get youFree => 'Ù…ÙØª';

  @override
  String youLevelLabel(Object level) {
    return 'Ù„ÛŒÙˆÙ„ $level';
  }

  @override
  String youBestStreakLabel(Object days) {
    return 'Ø¨ÛØªØ±ÛŒÙ† $days Ø¯Ù†';
  }

  @override
  String get youPlantHabit =>
      'Ø²Ù†Ø¬ÛŒØ± Ø´Ø±ÙˆØ¹ Ú©Ø±Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ø¹Ø§Ø¯Øª Ù„Ú¯Ø§Ø¦ÛŒÚºÛ”';

  @override
  String get youProBadge => 'PRO';

  @override
  String get youUnlockDiscipline =>
      'Ù…Ú©Ù…Ù„ Ù†Ø¸Ù… Ùˆ Ø¶Ø¨Ø· Ú©Ø§ Ù†Ø¸Ø§Ù… Ú©Ú¾ÙˆÙ„ÛŒÚºÛ”';

  @override
  String get youProFeatures =>
      '5 Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø¬Ú¯ÛÛŒÚºØŒ Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ®ØŒ Legendary ØªÙ…ØºÛ’ØŒ Ù…Ø§ÛØ§Ù†Û Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ²ØŒ ÛÙØªÛ ÙˆØ§Ø± Ø´ÛŒØ¦Ø± Ú©Ø§Ø±ÚˆÛ”';

  @override
  String get youSeePlans => 'Ù¾Ù„Ø§Ù† Ø¯ÛŒÚ©Ú¾ÛŒÚº';

  @override
  String youFromPrice(Object price) {
    return '$price/Ù…Ø§Û Ø³Û’ Ø´Ø±ÙˆØ¹';
  }

  @override
  String get youBloomTrackerFooter =>
      'Daily Stitch Â· Ø¹Ø§Ø¯Ø§Øª Ø§ÙˆØ± Ú©Ø§Ù…';

  @override
  String get progressMedals => 'ØªÙ…ØºÛ’';

  @override
  String get progressLast7Days => 'Ø¢Ø®Ø±ÛŒ 7 Ø¯Ù†';

  @override
  String get progressSeeAll => 'Ø³Ø¨ Ø¯ÛŒÚ©Ú¾ÛŒÚº';

  @override
  String get progressSeeDayByDayActivity =>
      'Ø§Ù¾Ù†ÛŒ Ø¯Ù† Ø¨Û Ø¯Ù† Ø³Ø±Ú¯Ø±Ù…ÛŒ Ø¯ÛŒÚ©Ú¾ÛŒÚº';

  @override
  String progressTasksFinishedPct(Object done, Object pct, Object total) {
    return '$done / $total Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Â· $pct%';
  }

  @override
  String get progressNoMedalsYet =>
      'Ø§Ø¨Ú¾ÛŒ ØªÚ© Ú©ÙˆØ¦ÛŒ ØªÙ…ØºÛ’ Ù†ÛÛŒÚº â€” Ø´Ø±ÙˆØ¹ Ú©Ø±Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚº ÛŒØ§ Ù¾ÙˆØ¯Û’ Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String progressSeeAllMedals(Object earned, Object total) {
    return 'ØªÙ…Ø§Ù… ØªÙ…ØºÛ’ Ø¯ÛŒÚ©Ú¾ÛŒÚº Â· $earned / $total Ø­Ø§ØµÙ„';
  }

  @override
  String get progressGuardianInsight => 'Ù†Ú¯ÛØ¨Ø§Ù† Ú©ÛŒ Ø¨ØµÛŒØ±Øª';

  @override
  String progressNextBadgeTier(Object tier) {
    return 'Ø§Ú¯Ù„Ø§ Ø¨ÛŒØ¬ Â· $tier';
  }

  @override
  String progressDaysTarget(Object days) {
    return '$days Ø¯Ù† Ú©Ø§ ÛØ¯Ù';
  }

  @override
  String progressOfTotal(Object target, Object value) {
    return '$value/$target';
  }

  @override
  String get helpTitle => 'Ù…Ø¯Ø¯ Ùˆ Ù…Ø¹Ø§ÙˆÙ†Øª';

  @override
  String get helpBody =>
      'Ø²ÛŒØ§Ø¯Û ØªØ± Ø¬ÙˆØ§Ø¨Ø§Øª Ù†ÛŒÚ†Û’ ÛÛŒÚºÛ” Ø§Ú¯Ø± Ù†ÛÛŒÚº Ù…Ù„Û’ØŒ ÛÙ…ÛŒÚº Ù†ÙˆÙ¹ Ø¨Ú¾ÛŒØ¬ÛŒÚº Ø§ÙˆØ± ÛÙ… Ø¹Ø§Ù… Ø·ÙˆØ± Ù¾Ø± 2-3 Ø¯Ù† Ù…ÛŒÚº Ø¬ÙˆØ§Ø¨ Ø¯ÛŒØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get helpSectionFAQ => 'Ø¹Ù…ÙˆÙ…ÛŒ Ø³ÙˆØ§Ù„Ø§Øª';

  @override
  String get helpSectionContact => 'Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ù…Ø³Ø¦Ù„Û ÛÛ’ØŸ';

  @override
  String get helpAddMessage =>
      'Ù¾ÛÙ„Û’ Ù…Ø®ØªØµØ± Ù¾ÛŒØºØ§Ù… Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get helpOpening => 'Ø¢Ù¾ Ú©Ø§ Ù…ÛŒÙ„ Ø§ÛŒÙ¾ Ú©Ú¾Ù„ Ø±ÛØ§ ÛÛ’â€¦';

  @override
  String get helpEmailUs => 'ÛÙ…ÛŒÚº Ø§ÛŒ Ù…ÛŒÙ„ Ú©Ø±ÛŒÚº';

  @override
  String get helpOpeningAction => 'Ú©Ú¾Ù„ Ø±ÛØ§ ÛÛ’â€¦';

  @override
  String get helpCopyEmail => 'Ø³Ù¾ÙˆØ±Ù¹ Ø§ÛŒ Ù…ÛŒÙ„ Ú©Ø§Ù¾ÛŒ Ú©Ø±ÛŒÚº';

  @override
  String get helpCopiedEmail => 'support@dailystitch.app Ú©Ø§Ù¾ÛŒ ÛÙˆ Ú¯ÛŒØ§';

  @override
  String get helpNoMailApp =>
      'Ú©ÙˆØ¦ÛŒ Ù…ÛŒÙ„ Ø§ÛŒÙ¾ Ù†ÛÛŒÚº Ù…Ù„ÛŒÛ” ÛÙ…ÛŒÚº support@dailystitch.app Ù¾Ø± Ø§ÛŒ Ù…ÛŒÙ„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get helpTopicLabel => 'Ù…ÙˆØ¶ÙˆØ¹';

  @override
  String get helpWhatHappened => 'Ú©ÛŒØ§ ÛÙˆØ§ØŸ';

  @override
  String get helpHint => 'Ù…Ø®ØªØµØ± Ø¨ÛŒØ§Ù† Ø¨ÛØª Ù…Ø¯Ø¯ Ú©Ø±ØªØ§ ÛÛ’â€¦';

  @override
  String get helpDisclaimer =>
      '\"ÛÙ…ÛŒÚº Ø§ÛŒ Ù…ÛŒÙ„ Ú©Ø±ÛŒÚº\" Ù¹ÛŒÙ¾ Ú©Ø±Ù†Û’ Ø³Û’ Ø¢Ù¾ Ú©Ø§ Ù…ÛŒÙ„ Ø§ÛŒÙ¾ Ù¾ÛÙ„Û’ Ø³Û’ Ø¨Ú¾Ø±Û’ ÛÙˆØ¦Û’ Ù¾ÛŒØºØ§Ù… Ú©Û’ Ø³Ø§ØªÚ¾ Ú©Ú¾Ù„ØªØ§ ÛÛ’ (Ø¨Ú¾ÛŒØ¬Ù†Û’ ØªÚ© Ø¢Ù¾ Ú©Û’ ÚˆÛŒÙˆØ§Ø¦Ø³ Ø³Û’ Ú©ÙˆØ¦ÛŒ ÚˆÛŒÙ¹Ø§ Ù†ÛÛŒÚº Ø¬Ø§ØªØ§)Û”';

  @override
  String get helpFaqQ1 => '5 Ú©Ø§Ù… Ú©ÛŒ Ø­Ø¯ Ú©ÛŒØ§ ÛÛ’ØŸ';

  @override
  String get helpFaqA1 =>
      'Ø¢Ù¾ ÙÛŒ Ù…Ù‚Ø§Ù…ÛŒ Ø¯Ù† 5 ØªÚ© Ú©Ø§Ù… Ø´Ø§Ù…Ù„ Ú©Ø± Ø³Ú©ØªÛ’ ÛÛŒÚºÛ” 6ÙˆØ§Úº Ø¬Ø§Ù† Ø¨ÙˆØ¬Ú¾ Ú©Ø± Ø¨Ù†Ø¯ ÛÛ’ â€” Ù†Ø¸Ù… Ùˆ Ø¶Ø¨Ø· Ø¨Ú¾Ø§Ø±ÛŒ Ù¾Ø± Ø¨ÛØªØ± ÛÛ’Û” Ø­Ø¯ ÙÛŒÚ†Ø± ÛÛ’ØŒ Ø±Ú©Ø§ÙˆÙ¹ Ù†ÛÛŒÚºÛ”';

  @override
  String get helpFaqQ2 => 'Ø±Ø§Øª 12 Ø¨Ø¬Û’ Ú©ÛŒØ§ ÛÙˆØªØ§ ÛÛ’ØŸ';

  @override
  String get helpFaqA2 =>
      'Ø¢Ù¾ Ú©Û’ Ù…Ù‚Ø§Ù…ÛŒ Ø±Ø§Øª 12 Ø¨Ø¬Û’ØŒ Ø¬Ùˆ Ø¨Ú¾ÛŒ Ú©Ø§Ù… Ø§Ø¨Ú¾ÛŒ Ú©Ú¾Ù„Ø§ ÛÛ’ ÙˆÛ \"Ú†Ú¾ÙˆÙ¹Ø§ ÛÙˆØ§\" Ù¹ÛŒÚ¯ ÛÙˆØªØ§ ÛÛ’ Ø§ÙˆØ± Left Behind Ù…ÛŒÚº Ú†Ù„Ø§ Ø¬Ø§ØªØ§ ÛÛ’Û” Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ© Ø±ÛŒ Ø³ÛŒÙ¹ ÛÙˆØªÛŒ ÛÛ’ Ø§Ú¯Ø± Ø¹Ø§Ø¯Øª Ú©Ù„ Ù…Ú©Ù…Ù„ Ù†ÛÛŒÚº ÛÙˆØ¦ÛŒÛ”';

  @override
  String get helpFaqQ3 => 'Left Behind Ú©ÛŒØ§ ÛÛ’ØŸ';

  @override
  String get helpFaqA3 =>
      'Ø¢Ù¾ Ú©Û’ Ù†Ø§Ù…Ú©Ù…Ù„ Ú©Ø§Ù…ÙˆÚº Ú©ÛŒ Ø§ÛŒÚ© Ù†Ø±Ù…ØŒ Ø®ØªÙ… Ú©Ø±Ù†Û’ ÙˆØ§Ù„ÛŒ ÙÛØ±Ø³ØªÛ” Ø§Ø³Û’ Ú©Ú¾ÙˆÙ„ÛŒÚºØŒ ØµØ±Ù ÙˆÛÛŒ Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº Ø¬Ùˆ Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ø§ÛÙ… ÛÙˆØŒ Ø¨Ø§Ù‚ÛŒ Ú©Ùˆ Ú†Ú¾ÙˆÚ‘ Ø¯ÛŒÚºÛ” Ù…ÙØª Ù¹Ø§Ø¦Ø± Ø¢Ø®Ø±ÛŒ 7 Ø¯Ù† Ø¯ÛŒÚ©Ú¾ØªØ§ ÛÛ’Ø› Pro Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ® Ø¯ÛŒÚ©Ú¾ØªØ§ ÛÛ’Û”';

  @override
  String get helpFaqQ4 => 'Ø§Ø³Ù¹Ø±ÛŒÚ© Ú©ÛŒØ³Û’ Ú©Ø§Ù… Ú©Ø±ØªÛŒ ÛÛ’ØŸ';

  @override
  String get helpFaqA4 =>
      'Ø¯Ù† Ø²Ù†Ø¬ÛŒØ± Ø¨Ú‘Ú¾Ø§ØªØ§ ÛÛ’ Ø¬Ø¨ Ø¢Ù¾ Ú©Û’ Ù¾Ø§Ø³ Ú©Ù… Ø§Ø² Ú©Ù… 1 Ú©Ø§Ù… ØªÚ¾Ø§ Ø§ÙˆØ± 0 Ú†Ú¾ÙˆÙ¹Û’Û” ØµÙØ± Ú©Ø§Ù…ÙˆÚº ÙˆØ§Ù„Û’ Ø¯Ù† Ø²Ù†Ø¬ÛŒØ± Ù†Û Ø¨Ú‘Ú¾Ø§ØªÛ’ Ù†Û ØªÙˆÚ‘ØªÛ’Û” Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² ÛØ± Ù…Ø§Û Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹Û’ ÛÙˆØ¦Û’ Ø¯Ù† Ú©Ùˆ Ù…Ø¹Ø§Ù Ú©Ø±ØªØ§ ÛÛ’Û”';

  @override
  String get helpFaqQ5 => 'Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² Ú©ÛŒØ§ ÛÛ’ØŸ';

  @override
  String get helpFaqA5 =>
      'ÛØ± Ú©ÛŒÙ„Ù†ÚˆØ± Ù…ÛÛŒÙ†Û’ Ø§ÛŒÚ© \"ÙØ±ÛŒØ²\"ØŒ ØµØ±Ù ProÛ” Ø§Ø³Û’ Ø§Ø³ Ø¯Ù† Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø±ÛŒÚº Ø¬Ùˆ Ø¢Ù¾ Ù†Û’ Ú†Ú¾ÙˆÚ‘Ø§ ØªØ§Ú©Û Ø²Ù†Ø¬ÛŒØ± Ø²Ù†Ø¯Û Ø±ÛÛ’Û” Ø§Ø³Û’ Ù¾ÛŒØ´Ø±ÙØª Ù¹ÛŒØ¨ Ù¾Ø± ØªÙ„Ø§Ø´ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get helpFaqQ6 => 'Ù…ÛŒØ±Ø§ ÚˆÛŒÙ¹Ø§ Ú©ÛØ§Úº Ù…Ø­ÙÙˆØ¸ ÛÛ’ØŸ';

  @override
  String get helpFaqA6 =>
      'ØªÙ…Ø§Ù… ÚˆÛŒÙ¹Ø§ ÛÙ…Ø§Ø±Û’ Ù…Ø­ÙÙˆØ¸ Ú©Ù„Ø§Ø¤Úˆ Ø¨ÛŒÚ© Ø§ÛŒÙ†Úˆ Ù…ÛŒÚº Ø§Ø³ Ø§Ú©Ø§Ø¤Ù†Ù¹ Ú©Û’ ØªØ­Øª Ù…Ø­ÙÙˆØ¸ ÛÛ’ Ø¬Ø³ Ø³Û’ Ø³Ø§Ø¦Ù† Ø§Ù† ÛÙˆØ§Û” ÛÙ… Ú©Ø¨Ú¾ÛŒ Ø¨ÛŒÚ†ØªÛ’ ÛŒØ§ Ø´ÛŒØ¦Ø± Ù†ÛÛŒÚº Ú©Ø±ØªÛ’Û” Ù…Ú©Ù…Ù„ ØªÙØµÛŒÙ„Ø§Øª Ú©Û’ Ù„ÛŒÛ’ Play Store Ù„Ø³Ù¹Ù†Ú¯ Ù…ÛŒÚº Ù„Ú©ÛŒ Ø±Ø§Ø²Ø¯Ø§Ø±ÛŒ Ù¾Ø§Ù„ÛŒØ³ÛŒ Ø¯ÛŒÚ©Ú¾ÛŒÚºÛ”';

  @override
  String get helpFaqQ7 =>
      'Ù…ÛŒÚº Ø§Ù¾Ù†Ø§ Ø§Ú©Ø§Ø¤Ù†Ù¹ Ú©ÛŒØ³Û’ Ø­Ø°Ù Ú©Ø±ÙˆÚºØŸ';

  @override
  String get helpFaqA7 =>
      'Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø­Ø°Ù Ú©Ø±Ù†Ø§ Ø§Ú¯Ù„ÛŒ Ø±ÛŒÙ„ÛŒØ² Ù…ÛŒÚº ØªØ±ØªÛŒØ¨Ø§Øª Ù…ÛŒÚº Ø¢ Ø±ÛØ§ ÛÛ’Û” ÙÛŒ Ø§Ù„Ø­Ø§Ù„ØŒ ÛÙ…ÛŒÚº support@dailystitch.app Ù¾Ø± Ø§ÛŒ Ù…ÛŒÙ„ Ú©Ø±ÛŒÚº Ø§ÙˆØ± ÛÙ… Ø§ÛŒÚ© Ø¯Ù† Ù…ÛŒÚº Ø³Ù†Ø¨Ú¾Ø§Ù„ Ù„ÛŒÚº Ú¯Û’Û”';

  @override
  String get helpTopicsGeneral => 'Ø¹Ù…ÙˆÙ…ÛŒ Ø³ÙˆØ§Ù„';

  @override
  String get helpTopicsBug => 'Ø¨Ú¯ Ø±Ù¾ÙˆØ±Ù¹';

  @override
  String get helpTopicsStreak => 'Ø§Ø³Ù¹Ø±ÛŒÚ© / Ø±ÙˆÙ„ Ø§ÙˆÙˆØ± Ù…Ø³Ø¦Ù„Û';

  @override
  String get helpTopicsBilling => 'Ø¨Ù„Ù†Ú¯ ÛŒØ§ Pro Ù¹Ø§Ø¦Ø±';

  @override
  String get helpTopicsAccount => 'Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø§ÙˆØ± ÚˆÛŒÙ¹Ø§';

  @override
  String get helpTopicsFeature => 'ÙÛŒÚ†Ø± Ú©ÛŒ Ø¯Ø±Ø®ÙˆØ§Ø³Øª';

  @override
  String get helpAccountAnon => '(Ø³Ø§Ø¦Ù† Ø§Ù† Ù†ÛÛŒÚº)';

  @override
  String get splashTagline =>
      'Ú†Ú¾ÙˆÙ¹Û’ Ø¨ÛŒØ¬ Ù¾Ø§Ù„ÛŒÚºÛ” Ø¬Ù†Ú¯Ù„ Ø§Ú¯Ø§Ø¦ÛŒÚºÛ”';

  @override
  String get priorityStandard => 'Ù…Ø¹Ù…ÙˆÙ„ÛŒ';

  @override
  String get priorityVital => 'Ø¶Ø±ÙˆØ±ÛŒ';

  @override
  String get prioritySpark => 'Ø´Ø¹Ù„Û';

  @override
  String get settingsDeleteAccount => 'Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø­Ø°Ù Ú©Ø±ÛŒÚº';

  @override
  String get settingsDeleteAccountSubtitle =>
      'Ø§Ù¾Ù†Ø§ ÚˆÛŒÙ¹Ø§ Ù…Ø³ØªÙ‚Ù„ Ø·ÙˆØ± Ù¾Ø± ÛÙ¹Ø§Ø¦ÛŒÚº';

  @override
  String get settingsDeleteAccountConfirmTitle =>
      'Ø§Ù¾Ù†Ø§ Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø­Ø°Ù Ú©Ø±ÛŒÚºØŸ';

  @override
  String get settingsDeleteAccountConfirmBody =>
      'ÛŒÛ Ø¢Ù¾ Ú©ÛŒ Ù¾Ø±ÙˆÙØ§Ø¦Ù„ØŒ Ú©Ø§Ù…ØŒ Ø¹Ø§Ø¯Ø§Øª Ø§ÙˆØ± Ù¾ÛŒØ´Ø±ÙØª Ú©Ùˆ Ù…Ø³ØªÙ‚Ù„ Ø·ÙˆØ± Ù¾Ø± Ø­Ø°Ù Ú©Ø±ØªØ§ ÛÛ’Û” ÙØ¹Ø§Ù„ Play Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù†Ø² Ú©Ùˆ Ø§Ù„Ú¯ Ø³Û’ Google Play Ù…ÛŒÚº Ù…Ù†Ø³ÙˆØ® Ú©Ø±Ù†Ø§ ÛÙˆÚ¯Ø§Û” ÛŒÛ ÙˆØ§Ù¾Ø³ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©ØªØ§Û”';

  @override
  String get settingsDeleteAccountConfirmButton =>
      'ÛÙ…ÛŒØ´Û Ú©Û’ Ù„ÛŒÛ’ Ø­Ø°Ù Ú©Ø±ÛŒÚº';

  @override
  String get settingsDeleteAccountSuccess =>
      'Ø¢Ù¾ Ú©Ø§ Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø­Ø°Ù ÛÙˆ Ú¯ÛŒØ§Û”';

  @override
  String get settingsDeleteAccountFailed =>
      'Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø­Ø°Ù Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©Ø§Û” Ø¯ÙˆØ¨Ø§Ø±Û Ú©ÙˆØ´Ø´ Ú©Ø±ÛŒÚº ÛŒØ§ support@dailystitch.app Ù¾Ø± Ø§ÛŒ Ù…ÛŒÙ„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get referralYouTitle =>
      'Ø¯ÙˆØ³ØªÙˆÚº Ú©Ùˆ Ù…ÛÙ…Ø§Ù† Ø¨Ù†Ø§Ø¦ÛŒÚº Â· Ù…ÙØª Pro Ú©Ù…Ø§Ø¦ÛŒÚº';

  @override
  String referralYouSubtitle(int progress, int milestone) {
    return '$milestone Ù…ÛŒÚº Ø³Û’ $progress Ø¯ÙˆØ³Øª Ø´Ø§Ù…Ù„ ÛÙˆØ¦Û’';
  }

  @override
  String get referralYouShare => 'Ù…ÛÙ…Ø§Ù†ÛŒ Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get referralYouDetails => 'ØªÙØµÛŒÙ„Ø§Øª Ø¯ÛŒÚ©Ú¾ÛŒÚº';

  @override
  String get referralPaywallTitle => 'Ù…ÙØª Pro Ù…ÛÛŒÙ†Û';

  @override
  String get referralPaywallBody =>
      '5 Ø¯Ø³ØªÙˆÚº Ú©Ùˆ Ù…ÛÙ…Ø§Ù† Ø¨Ù†Ø§Ø¦ÛŒÚº Ø¬Ùˆ Ø³Ø§Ø¦Ù† Ø§Ù¾ Ú©Ø±ÛŒÚº â†’ 1 Ù…ÛÛŒÙ†Û Ù…ÙØª Pro';

  @override
  String get referralPaywallProBody =>
      'Ù…ÛÙ…Ø§Ù† Ø¨Ù†Ø§ØªÛ’ Ø±ÛÛŒÚº â€” Ù…ÙØª Pro Ù…ÛÛŒÙ†Û’ Ø¬Ù…Ø¹ Ú©Ø±ÛŒÚº';

  @override
  String referralPaywallProgress(Object count, Object milestone) {
    return '$count / $milestone';
  }

  @override
  String get insightsLoadError =>
      'Ø¢Ù¾ Ú©ÛŒ Ù¾ÛŒØ´Ø±ÙØª Ù„Ùˆ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©ÛŒÛ” Ø¨Ø¹Ø¯ Ù…ÛŒÚº Ø¯ÙˆØ¨Ø§Ø±Û Ú©ÙˆØ´Ø´ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get insightsMetricCurrentChain => 'Ù…ÙˆØ¬ÙˆØ¯Û Ø²Ù†Ø¬ÛŒØ±';

  @override
  String get insightsMetricBestEver => 'Ø§Ø¨ ØªÚ© Ú©ÛŒ Ø¨ÛØªØ±ÛŒÙ†';

  @override
  String get insightsMetricTasksDone => 'Ú©Ø§Ù… Ù…Ú©Ù…Ù„';

  @override
  String get insightsMetricPerfectDays => 'Ú©Ø§Ù…Ù„ Ø¯Ù†';

  @override
  String get insightsMetricHabits => 'Ø¹Ø§Ø¯Ø§Øª';

  @override
  String get insightsDay => 'Ø¯Ù†';

  @override
  String get insightsDays => 'Ø¯Ù†';

  @override
  String get insightsSectionThisWeek => 'Ø§Ø³ ÛÙØªÛ’';

  @override
  String get insightsShareMyWeek => 'Ù…ÛŒØ±Ø§ ÛÙØªÛ Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get insightsShareMyWeekPro =>
      'Ù…ÛŒØ±Ø§ ÛÙØªÛ Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº Â· Pro';

  @override
  String get insightsShareReceiptText =>
      'Ù…ÛŒØ±Ø§ ÛÙØªÛ Daily Stitch Ù¾Ø±Û” Ø²Ù†Ø¬ÛŒØ± Ù†Û ØªÙˆÚ‘ÛŒÚºÛ”';

  @override
  String insightsHistoryWindowTitle(int days) {
    return 'Ø¢Ø®Ø±ÛŒ $days Ø¯Ù† Ø¯Ú©Ú¾Ø§ Ø±ÛØ§ ÛÛ’';
  }

  @override
  String get insightsHistoryUpsell =>
      'Pro Ø³Û’ Ø§Ù¾Ù†Ø§ Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ® Ú©Ú¾ÙˆÙ„ÛŒÚº';

  @override
  String get referralScreenTitle => 'Ø¯ÙˆØ³ØªÙˆÚº Ú©Ùˆ Ù…ÛÙ…Ø§Ù† Ø¨Ù†Ø§Ø¦ÛŒÚº';

  @override
  String get referralLaunchGift => '-launch Ù…ÛÛŒÙ†Û’ Ú©Ø§ ØªØ­ÙÛ';

  @override
  String get referralRewardTitle => '1 Ù…ÛÛŒÙ†Û Ù…ÙØª Pro Ø­Ø§ØµÙ„ Ú©Ø±ÛŒÚº';

  @override
  String get referralRewardBody =>
      'Ø§Ù¾Ù†Ø§ Ú©ÙˆÚˆ Ø¯ÙˆØ³ØªÙˆÚº Ú©Û’ Ø³Ø§ØªÚ¾ Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚºÛ” Ø¬Ø¨ 5 Ù„ÙˆÚ¯ Ø§Ø³ Ú©Ø§ Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø±ØªÛ’ ÛÙˆØ¦Û’ Ø³Ø§Ø¦Ù† Ø§Ù¾ Ú©Ø±ÛŒÚºØŒ Ø¢Ù¾ Ú©Ùˆ 1 Ù¾ÙˆØ±Ø§ Ù…ÛÛŒÙ†Û Daily Stitch Pro Ù…Ù„ØªØ§ ÛÛ’Û”';

  @override
  String get referralYourCode => 'Ø¢Ù¾ Ú©Ø§ Ø±ÛŒÙØ±Ù„ Ú©ÙˆÚˆ';

  @override
  String get referralCopyCodeTooltip => 'Ú©ÙˆÚˆ Ú©Ø§Ù¾ÛŒ Ú©Ø±ÛŒÚº';

  @override
  String get referralCodeCopied => 'Ø±ÛŒÙØ±Ù„ Ú©ÙˆÚˆ Ú©Ø§Ù¾ÛŒ ÛÙˆ Ú¯ÛŒØ§';

  @override
  String get referralShareWithFriends =>
      'Ø¯ÙˆØ³ØªÙˆÚº Ú©Û’ Ø³Ø§ØªÚ¾ Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get referralFooterHint =>
      'Ø¯ÙˆØ³Øª Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø¨Ù†Ø§ØªÛ’ ÙˆÙ‚Øª Ø¢Ù¾ Ú©Ø§ Ú©ÙˆÚˆ Ø¯Ø±Ø¬ Ú©Ø±ØªÛ’ ÛÛŒÚºÛ” ÛØ± Ø¯ÙˆØ³Øª Ø¢Ù¾ Ú©Û’ Ø§Ù†Ø¹Ø§Ù… Ú©ÛŒ Ø·Ø±Ù Ø§ÛŒÚ© Ø¨Ø§Ø± Ø´Ù…Ø§Ø± ÛÙˆØªØ§ ÛÛ’Û”';

  @override
  String referralFriendsJoinedOne(int count) {
    return '$count Ø¯ÙˆØ³Øª Ø´Ø§Ù…Ù„ ÛÙˆ Ú¯ÛŒØ§';
  }

  @override
  String referralFriendsJoinedMany(int count) {
    return '$count Ø¯ÙˆØ³Øª Ø´Ø§Ù…Ù„ ÛÙˆØ¦Û’';
  }

  @override
  String referralRewardsEarnedOne(int count) {
    return 'Ø¢Ù¾ Ù†Û’ $count Ù…ÙØª Ù…ÛÛŒÙ†Û Pro Ø­Ø§ØµÙ„ Ú©ÛŒØ§ ÛÛ’Û”';
  }

  @override
  String referralRewardsEarnedMany(int count) {
    return 'Ø¢Ù¾ Ù†Û’ $count Ù…ÙØª Ù…ÛÛŒÙ†Û’ Pro Ø­Ø§ØµÙ„ Ú©ÛŒÛ’ ÛÛŒÚºÛ”';
  }

  @override
  String get referralRewardUnlocked =>
      'Ø§Ù†Ø¹Ø§Ù… Ú©Ú¾Ù„ Ú¯ÛŒØ§ â€” Ø§Ù¾Ù†Ø§ Ù…ÙØª Ù…ÛÛŒÙ†Û Pro Ú©Ø§ Ù„Ø·Ù Ø§Ù†Ø¯ÙˆØ² ÛÙˆÚº!';

  @override
  String referralRemainingToUnlock(int remaining) {
    return 'Ø§Ù¾Ù†Ø§ Ù…ÙØª Ù…ÛÛŒÙ†Û Ú©Ú¾ÙˆÙ„Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ $remaining Ù…Ø²ÛŒØ¯';
  }

  @override
  String youProMemberSince(String month) {
    return '$month Ø³Û’ Daily Stitch Pro Ù…Ù…Ø¨Ø±';
  }

  @override
  String get youProPerksTitle => 'Ø¢Ù¾ Ú©Û’ Pro ÙÙˆØ§Ø¦Ø¯';

  @override
  String get manageProThankYou =>
      'Daily Stitch Ú©ÛŒ Ø­Ù…Ø§ÛŒØª Ú©Ø§ Ø´Ú©Ø±ÛŒÛ';

  @override
  String get manageProReferralHint =>
      'Ø§Ù¾Ù†Ø§ Pro Ø¨Ú‘Ú¾Ø§Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ù…Ø²ÛŒØ¯ Ø¯ÙˆØ³ØªÙˆÚº Ú©Ùˆ Ù…ÛÙ…Ø§Ù† Ø¨Ù†Ø§Ø¦ÛŒÚº';

  @override
  String bootstrapConfigErrorBody(String detail) {
    return '$detail\n\nleanspace/.env Ù…ÛŒÚº API_BASE_URL Ø§ÙˆØ± GOOGLE_CLIENT_ID (ÛŒØ§ Ù¾Ø±Ø§Ù†ÛŒ GOOGLE_CLIENT_ID) Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚºØŒ Ù¾Ú¾Ø± Ø¯ÙˆØ¨Ø§Ø±Û Ø¨Ù„Úˆ Ú©Ø±ÛŒÚº:\n\nflutter build apk --debug';
  }

  @override
  String get languageSystemDefault => 'Ø³Ø³Ù¹Ù… ÚˆÛŒÙØ§Ù„Ù¹';

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
  String get onboardingLanguageTitle => 'Ø§Ù¾Ù†ÛŒ Ø²Ø¨Ø§Ù† Ù…Ù†ØªØ®Ø¨ Ú©Ø±ÛŒÚº';

  @override
  String get onboardingLanguageBody =>
      'ÙˆÛ Ø²Ø¨Ø§Ù† Ú†Ù†ÛŒÚº Ø¬Ùˆ Ø¢Ù¾ Daily Stitch Ù…ÛŒÚº Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø±Ù†Ø§ Ú†Ø§ÛØªÛ’ ÛÛŒÚºÛ” Ø¢Ù¾ Ø§Ø³Û’ Ú©Ø³ÛŒ Ø¨Ú¾ÛŒ ÙˆÙ‚Øª ØªØ±ØªÛŒØ¨Ø§Øª Ù…ÛŒÚº ØªØ¨Ø¯ÛŒÙ„ Ú©Ø± Ø³Ú©ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get onboardingLanguageContinue => 'Ø¬Ø§Ø±ÛŒ Ø±Ú©Ú¾ÛŒÚº';

  @override
  String get commonPro => 'PRO';

  @override
  String get commonFriend => 'Ø¯ÙˆØ³Øª';

  @override
  String get settingsAppTheme => 'Ø§ÛŒÙ¾ ØªÚ¾ÛŒÙ…';

  @override
  String get settingsAppThemeSubtitle =>
      'Ø§Ù¾Ù†Û’ Ø°Ø§ØªÛŒ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ Ú©Û’ Ø±Ù†Ú¯ Ù…Ù†ØªØ®Ø¨ Ú©Ø±ÛŒÚº';

  @override
  String get settingsInviteFriendsTitle =>
      'Ø¯ÙˆØ³ØªÙˆÚº Ú©Ùˆ Ù…ÛÙ…Ø§Ù† Ø¨Ù†Ø§Ø¦ÛŒÚº Â· Ù…ÙØª Pro';

  @override
  String get settingsInviteFriendsSubtitle =>
      '5 Ø¯ÙˆØ³ØªÙˆÚº Ú©Û’ Ø´Ø§Ù…Ù„ ÛÙˆÙ†Û’ Ù¾Ø± 1 Ù…ÛÛŒÙ†Û Ù…ÙØª';

  @override
  String get themePickerTitle => 'Ø°Ø§ØªÛŒ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ';

  @override
  String get themePickerSubtitle =>
      'ÙˆÛ Ø±Ù†Ú¯ Ù¾ÛŒÙ„ÛŒÙ¹ Ú†Ù†ÛŒÚº Ø¬Ùˆ Ø¢Ù¾ Ú©Ùˆ Ø³Ú©ÙˆÙ† Ø¯Û’Û”';

  @override
  String get themeNameClassicBloom => 'Ú©Ù„Ø§Ø³Ú© Ø¨Ù„ÙˆÙ…';

  @override
  String get themeNameSolarTerracotta => 'Ø³ÙˆÙ„Ø± Ù¹ÛŒØ±Ø§ Ú©ÙˆÙ¹Ø§';

  @override
  String get themeNameMidnightOasis => 'Ù…ÛŒÚˆÙ†Ø§Ø¦Ù¹ ÙˆØ§Ø³Ø·Û';

  @override
  String get themeNameLavenderDream => 'Ù„ÛŒÙˆÙ†ÚˆØ± Ø®ÙˆØ§Ø¨';

  @override
  String get themeNameNordicFrost => 'Ù†Ø§Ø±ÚˆÚ© ÙØ±Ø§Ø³Øª';

  @override
  String get themeNameCyberpunkNeon => 'Ø³Ø§Ø¦Ø¨Ø± Ù¾Ù†Ú© Ù†ÛŒÙˆÙ†';

  @override
  String get reminderTitle => 'ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒØ§Úº';

  @override
  String get reminderBody =>
      'Ø¢Ø®Ø±ÛŒ Ù…ÙˆÙ‚Ø¹ Ø±Ø§Øª 12 Ø¨Ø¬Û’ Ø³Û’ Ù¾ÛÙ„Û’ Ø¢Ù¾ Ú©Ùˆ Ù¾Ù†Ú¯ Ú©Ø±ØªØ§ ÛÛ’ Ø§Ú¯Ø± Ú©Ø§Ù… Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ú©Ú¾Ù„Û’ ÛÙˆÚºÛ”';

  @override
  String get reminderFinalCall => 'Ø¢Ø®Ø±ÛŒ Ù…ÙˆÙ‚Ø¹';

  @override
  String get reminderEveningNudge => 'Ø´Ø§Ù… Ú©ÛŒ ØªØ±ØºÛŒØ¨';

  @override
  String get reminderChangeTime => 'ÙˆÙ‚Øª ØªØ¨Ø¯ÛŒÙ„ Ú©Ø±ÛŒÚº';

  @override
  String get reminderSave => 'ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒØ§Úº Ù…Ø­ÙÙˆØ¸ Ú©Ø±ÛŒÚº';

  @override
  String get notificationChannelReminders =>
      'Daily Stitch ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒØ§Úº';

  @override
  String get notificationChannelRemindersDesc =>
      'Ø´Ø§Ù… Ú©ÛŒ ØªØ±ØºÛŒØ¨ Ø§ÙˆØ± Ø¢Ø®Ø±ÛŒ Ù…ÙˆÙ‚Ø¹ Ú©ÛŒ ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒØ§Úº';

  @override
  String get notificationChannelAlarms => 'Daily Stitch Ú©Ø§Ù… Ú©Û’ Ø§Ù„Ø§Ø±Ù…';

  @override
  String get notificationChannelAlarmsDesc =>
      'Ú©Ø§Ù… Ú©ÛŒ ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒÙˆÚº Ú©Û’ Ù„ÛŒÛ’ Ø¨Ù„Ù†Ø¯ Ø§Ù„Ø§Ø±Ù…';

  @override
  String get notificationTaskReminderTitle => 'Ú©Ø§Ù… Ú©ÛŒ ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒ';

  @override
  String get notificationFinalCallTitle => 'Ø¢Ø®Ø±ÛŒ Ù…ÙˆÙ‚Ø¹';

  @override
  String notificationFinalCallBody(int count) {
    return 'Ø¢Ø¬ Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ $count Ú©Ø§Ù… Ú©Ú¾Ù„Û’ ÛÛŒÚºÛ”';
  }

  @override
  String get notificationEveningTitle => 'Ø´Ø§Ù… Ú©ÛŒ Ú†ÛŒÚ© Ø§Ù†';

  @override
  String get notificationEveningBody =>
      'Ø¢Ø¬ Ø¢Ù¾ Ú©Ø§ Ø¨Ø§Øº Ú©ÛŒØ³Ø§ Ø¨Ú‘Ú¾Ø§ØŸ';

  @override
  String get widgetSetupTitle => 'Ø²Ù†Ø¬ÛŒØ± ÙˆÛŒØ¬ÛŒÙ¹ Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get widgetSetupBody =>
      'Ø§Ù¾Ù†ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ© ÛÙˆÙ… Ø§Ø³Ú©Ø±ÛŒÙ† Ù¾Ø± Ø±Ú©Ú¾ÛŒÚº â€” Ø§ÛŒÙ¾ Ú©Ú¾ÙˆÙ„Ù†Û’ Ú©ÛŒ Ø¶Ø±ÙˆØ±Øª Ù†ÛÛŒÚºÛ”';

  @override
  String get widgetSetupAdd => 'ÛÙˆÙ… Ø§Ø³Ú©Ø±ÛŒÙ† Ù¾Ø± Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get widgetSetupStep1 =>
      'Ø§Ù¾Ù†ÛŒ ÛÙˆÙ… Ø§Ø³Ú©Ø±ÛŒÙ† Ù¾Ø± Ø¯ÛŒØ± ØªÚ© Ø¯Ø¨Ø§Ø¦ÛŒÚº';

  @override
  String get widgetSetupStep2 => 'ÙˆÛŒØ¬ÛŒÙ¹Ø³ Ù¹ÛŒÙ¾ Ú©Ø±ÛŒÚº';

  @override
  String get widgetSetupStep3 =>
      'Daily Stitch ØªÙ„Ø§Ø´ Ú©Ø±ÛŒÚº Ø§ÙˆØ± Ø§Ø³Û’ Ú¯Ú¾Ø³ÛŒÙ¹ Ù„Ø§Ø¦ÛŒÚº';

  @override
  String get widgetSetupPinSuccess =>
      'ÙˆÛŒØ¬ÛŒÙ¹ Ø±Ú©Ú¾Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ø§Ù¾Ù†ÛŒ ÛÙˆÙ… Ø§Ø³Ú©Ø±ÛŒÙ† Ú†ÛŒÚ© Ú©Ø±ÛŒÚºÛ”';

  @override
  String get widgetSetupPinFallback =>
      'Ø¢Ù¾ Ú©Ø§ Ù„Ø§Ù†Ú†Ø± Ø§ÛŒÚ© Ù¹ÛŒÙ¾ Ø§ÛŒÚˆ Ø³Ù¾ÙˆØ±Ù¹ Ù†ÛÛŒÚº Ú©Ø± Ø³Ú©ØªØ§Û” Ù†ÛŒÚ†Û’ Ø¯ÛŒÛ’ Ú¯Ø¦Û’ Ø¯Ø³ØªÛŒ Ù…Ø±Ø§Ø­Ù„ Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get paywallWelcomePro => 'Daily Stitch Pro Ù…ÛŒÚº Ø®ÙˆØ´ Ø¢Ù…Ø¯ÛŒØ¯';

  @override
  String get paywallSavePercent => '~16% Ø¨Ú†Ø§Ø¦ÛŒÚº';

  @override
  String get paywallTermsTitle => 'Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† Ú©ÛŒ Ø´Ø±Ø§Ø¦Ø·';

  @override
  String get paywallTermsBody =>
      'Ø¨Ù„Ù†Ú¯ Google Play Ú©Û’ Ø°Ø±ÛŒØ¹Û’ Ø³Ù†Ø¨Ú¾Ø§Ù„ØªÛŒ ÛÛ’Û” Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù†Ø² Ø®ÙˆØ¯ Ø¨Ø®ÙˆØ¯ ØªØ¬Ø¯ÛŒØ¯ ÛÙˆØªÛŒ ÛÛŒÚº Ø¬Ø¨ ØªÚ© Ø¢Ù¾ Play Store â†’ Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù†Ø² Ù…ÛŒÚº Ù…ÙˆØ¬ÙˆØ¯Û Ù…Ø¯Øª Ú©Û’ Ø®ØªÙ… ÛÙˆÙ†Û’ Ø³Û’ Ú©Ù… Ø§Ø² Ú©Ù… 24 Ú¯Ú¾Ù†Ù¹Û’ Ù¾ÛÙ„Û’ Ù…Ù†Ø³ÙˆØ® Ù†ÛÛŒÚº Ú©Ø±ØªÛ’Û” Ø¢Ù¾ Ú©Ø³ÛŒ Ø¨Ú¾ÛŒ ÙˆÙ‚Øª Ø§Ù¾Ù†Û’ Google Play Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø³Û’ Ø§Ù¾Ù†ÛŒ Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† Ú©Ø§ Ø§Ù†ØªØ¸Ø§Ù… ÛŒØ§ Ù…Ù†Ø³ÙˆØ® Ú©Ø± Ø³Ú©ØªÛ’ ÛÛŒÚºÛ”\n\nØ§ÛŒÙ¾ Ø§Ù† Ø§Ø³Ù¹Ø§Ù„ Ú©Ø±Ù†Û’ Ø³Û’ Ø¢Ù¾ Ú©ÛŒ Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† Ù…Ù†Ø³ÙˆØ® Ù†ÛÛŒÚº ÛÙˆØªÛŒÛ”\n\nØ¯Ú©Ú¾Ø§Ø¦ÛŒ Ù‚ÛŒÙ…ØªÛŒÚº Ø¢Ù¾ Ú©ÛŒ Ù…Ù‚Ø§Ù…ÛŒ Ú©Ø±Ù†Ø³ÛŒ Ù…ÛŒÚº ÛÛŒÚº Ø§ÙˆØ± Ø¹Ù„Ø§Ù‚Û’ Ú©Û’ Ù…Ø·Ø§Ø¨Ù‚ Ù…Ø®ØªÙ„Ù ÛÙˆ Ø³Ú©ØªÛŒ ÛÛŒÚºÛ” Ù¹ÛŒÚ©Ø³ Ù„Ø§Ú¯Ùˆ ÛÙˆ Ø³Ú©ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get paywallPrivacyTitle => 'Ø±Ø§Ø²Ø¯Ø§Ø±ÛŒ';

  @override
  String get paywallPrivacyBody =>
      'Daily Stitch Ø¢Ù¾ Ú©Û’ Ú©Ø§Ù…ØŒ Ø¹Ø§Ø¯Ø§Øª Ø§ÙˆØ± Ø§Ø³Ù¹Ø±ÛŒÚ© ÚˆÛŒÙ¹Ø§ Ú©Ùˆ ÛÙ…Ø§Ø±Û’ Ù…Ø­ÙÙˆØ¸ Ø¨ÛŒÚ© Ø§ÛŒÙ†Úˆ Ù¾Ø± Ù…Ø­ÙÙˆØ¸ Ú©Ø±ØªØ§ ÛÛ’ØŒ Ø¬Ùˆ Ø¢Ù¾ Ú©Û’ Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø³Û’ Ø¬Ú‘Ø§ ÛÙˆØ§ ÛÛ’Û” ÛÙ… Ú©Ø¨Ú¾ÛŒ Ø¢Ù¾ Ú©Ø§ ÚˆÛŒÙ¹Ø§ Ù†ÛÛŒÚº Ø¨ÛŒÚ†ØªÛ’Û”\n\nØ³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒØ§Úº Google Play Ú©Û’ Ø°Ø±ÛŒØ¹Û’ Ù¾Ø±ÙˆØ³ÛŒØ³ ÛÙˆØªÛŒ ÛÛŒÚºÛ” ÛÙ… Ø¢Ù¾ Ú©ÛŒ Pro Ø­ÛŒØ«ÛŒØª Ú©ÛŒ ØªØµØ¯ÛŒÙ‚ Ú©Û’ Ù„ÛŒÛ’ Google Ø³Û’ Ø§ÛŒÚ© ØªØµØ¯ÛŒÙ‚ Ø´Ø¯Û Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒ Ù¹ÙˆÚ©Ù† Ù…Ù„ØªÛ’ ÛÛŒÚºÛ” ÛÙ… Ø¢Ù¾ Ú©ÛŒ Ø§Ø¯Ø§Ø¦ÛŒÚ¯ÛŒ Ú©ÛŒ ØªÙØµÛŒÙ„Ø§Øª Ù†ÛÛŒÚº Ø¯ÛŒÚ©Ú¾ØªÛ’ ÛŒØ§ Ù…Ø­ÙÙˆØ¸ Ú©Ø±ØªÛ’Û”\n\nØ¢Ù¾ ØªØ±ØªÛŒØ¨Ø§Øª â†’ Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø­Ø°Ù Ú©Ø±ÛŒÚº Ø³Û’ Ù…Ú©Ù…Ù„ ÚˆÛŒÙ¹Ø§ Ø§ÛŒÚ©Ø³Ù¾ÙˆØ±Ù¹ ÛŒØ§ Ø§Ú©Ø§Ø¤Ù†Ù¹ Ø­Ø°Ù Ú©ÛŒ Ø¯Ø±Ø®ÙˆØ§Ø³Øª Ú©Ø± Ø³Ú©ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get paywallCloseTooltip => 'Ø¨Ù†Ø¯ Ú©Ø±ÛŒÚº';

  @override
  String get paywallFooterLinks =>
      'Ø¨Ø­Ø§Ù„ Ú©Ø±ÛŒÚº Â· Ø´Ø±Ø§Ø¦Ø· Â· Ø±Ø§Ø²Ø¯Ø§Ø±ÛŒ';

  @override
  String get manageProTitle => 'Pro Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù†';

  @override
  String get manageProActive => 'ÙØ¹Ø§Ù„';

  @override
  String get manageProNotSubscribed => 'Ø³Ø¨Ø³Ú©Ø±Ø§Ø¦Ø¨ Ù†ÛÛŒÚº';

  @override
  String get manageProFreeTier => 'Ù…ÙØª Ù¹Ø§Ø¦Ø±';

  @override
  String manageProRenewsOn(String date) {
    return '$date Ú©Ùˆ ØªØ¬Ø¯ÛŒØ¯ ÛŒØ§ Ø®ØªÙ… ÛÙˆØªØ§ ÛÛ’Û”';
  }

  @override
  String get manageProFreeBody =>
      'Ø¢Ù¾ Daily Stitch Ù…ÙØª Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø± Ø±ÛÛ’ ÛÛŒÚºÛ” Ù…Ú©Ù…Ù„ Ù†Ø¸Ø§Ù… Ú©Ú¾ÙˆÙ„Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ø§Ù¾ Ú¯Ø±ÛŒÚˆ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get manageProSectionManage => 'Ø§Ù†ØªØ¸Ø§Ù…';

  @override
  String get manageProOpenPlay => 'Google Play Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù†Ø² Ú©Ú¾ÙˆÙ„ÛŒÚº';

  @override
  String get manageProOpenPlaySubtitlePro =>
      'Ù…Ù†Ø³ÙˆØ® Ú©Ø±ÛŒÚºØŒ Ù¾Ù„Ø§Ù† ØªØ¨Ø¯ÛŒÙ„ Ú©Ø±ÛŒÚºØŒ ÛŒØ§ Ø§Ø¯Ø§Ø¦ÛŒÚ¯ÛŒ Ú©Ø§ Ø·Ø±ÛŒÙ‚Û Ø§Ù¾ ÚˆÛŒÙ¹ Ú©Ø±ÛŒÚº';

  @override
  String get manageProOpenPlaySubtitleFree =>
      'Ø§Ù¾Ù†ÛŒ Ù…ÙˆØ¬ÙˆØ¯Û Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† (Ø§Ú¯Ø± ÛÙˆ) ÛŒÛØ§Úº ØªÙ„Ø§Ø´ Ú©Ø±ÛŒÚº';

  @override
  String get manageProShareApp => 'Daily Stitch Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get manageProShareSubtitle =>
      'Ø¯ÙˆØ³Øª Ú©Ùˆ Ø²Ù†Ø¬ÛŒØ± Ú©Û’ Ø¨Ø§Ø±Û’ Ù…ÛŒÚº Ø¨ØªØ§Ø¦ÛŒÚº';

  @override
  String get manageProSectionHelp => 'Ù…Ø¯Ø¯ Ø¯Ø±Ú©Ø§Ø± ÛÛ’ØŸ';

  @override
  String get manageProHelpTitle => 'Ù…Ø¯Ø¯ Ùˆ Ù…Ø¹Ø§ÙˆÙ†Øª';

  @override
  String get manageProHelpSubtitle =>
      'Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† FAQØŒ Ø±Ø§Ø¨Ø·ÛØŒ Ø¨Ú¯ Ø±Ù¾ÙˆØ±Ù¹Ø³';

  @override
  String manageProBillingFooter(String version) {
    return 'Ø¨Ù„Ù†Ú¯ Google Play Ú©Û’ Ø°Ø±ÛŒØ¹Û’ Â· $version';
  }

  @override
  String get manageProPlayInstructions =>
      'Google Play Store Ø§ÛŒÙ¾ Ú©Ú¾ÙˆÙ„ÛŒÚº â†’ Ø§Ù¾Ù†ÛŒ Ù¾Ø±ÙˆÙØ§Ø¦Ù„ Ù¹ÛŒÙ¾ Ú©Ø±ÛŒÚº â†’ Ø§Ø¯Ø§Ø¦ÛŒÚ¯ÛŒØ§Úº Ø§ÙˆØ± Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù†Ø² â†’ Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù†Ø²Û”';

  @override
  String get addTaskGrowSomething => 'Ú©Ú†Ú¾ Ø§Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get addTaskPlantSprout => 'Ù¾ÙˆØ¯Ø§ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get addTaskIntentionName => 'Ù†ÛŒØª Ú©Ø§ Ù†Ø§Ù…';

  @override
  String get addTaskSproutName => 'Ù¾ÙˆØ¯Û’ Ú©Ø§ Ù†Ø§Ù…';

  @override
  String get addTaskHintTask =>
      'Ù…Ø«Ù„Ø§Ù‹ØŒ ØµØ¨Ø­ Ú©Ø§ Ø³ÙˆØ±Ø¬ Ù†Ù…Ø³Ú©Ø§Ø±';

  @override
  String get addTaskHintHabit => 'Ù…Ø«Ù„Ø§Ù‹ØŒ ØµØ¨Ø­ Ú©Ø§ ÛŒÙˆÚ¯Ø§';

  @override
  String get addTaskWhen => 'Ú©Ø¨ØŸ';

  @override
  String get addTaskPriority => 'ØªØ±Ø¬ÛŒØ­';

  @override
  String get addTaskNotes => 'Ù†ÙˆÙ¹Ø³';

  @override
  String get addTaskCadenceDaily => 'Ø±ÙˆØ²Ø§Ù†Û';

  @override
  String get addTaskCadenceWeekdays => 'ÛÙØªÛ’ Ú©Û’ Ø¯Ù†';

  @override
  String get addTaskCadence3x => 'ÛÙØªÛ’ Ù…ÛŒÚº 3 Ø¨Ø§Ø±';

  @override
  String get addTaskCadenceWeekly => 'ÛÙØªÛ ÙˆØ§Ø±';

  @override
  String get addTaskPlantIntention => 'Ù†ÛŒØª Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get addTaskPlantSproutCta => 'Ù¾ÙˆØ¯Ø§ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get addTaskPlanting => 'Ù„Ú¯Ø§ Ø±ÛÛ’ ÛÛŒÚºâ€¦';

  @override
  String get addTaskNameIntentionError => 'Ø§Ù¾Ù†ÛŒ Ù†ÛŒØª Ú©Ø§ Ù†Ø§Ù… Ø¯ÛŒÚº';

  @override
  String get addTaskNameSproutError => 'Ø§Ù¾Ù†Û’ Ù¾ÙˆØ¯Û’ Ú©Ø§ Ù†Ø§Ù… Ø¯ÛŒÚº';

  @override
  String get addTaskNotesMigrationWarning =>
      'Ú©Ø§Ù… Ù…Ø­ÙÙˆØ¸ ÛÙˆ Ú¯ÛŒØ§Û” Ù†ÙˆÙ¹Ø³ Ø§ÙˆØ± ØªØ±Ø¬ÛŒØ­ Ú©Ùˆ ØªØ§Ø²Û ØªØ±ÛŒÙ† Ø¨ÛŒÚ© Ø§ÛŒÙ†Úˆ Ù…Ø§Ø¦ÛŒÚ¯Ø±ÛŒØ´Ù† Ú©ÛŒ Ø¶Ø±ÙˆØ±Øª ÛÛ’Û”';

  @override
  String get addTaskNoSproutSlots =>
      'Ú©ÙˆØ¦ÛŒ Ø®Ø§Ù„ÛŒ Ù¾ÙˆØ¯Û’ Ú©ÛŒ Ø¬Ú¯Û Ù†ÛÛŒÚº â€” Ù¾ÛÙ„Û’ Ø§ÛŒÚ© Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get addTaskSaveSproutError =>
      'Ù¾ÙˆØ¯Ø§ Ù…Ø­ÙÙˆØ¸ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©Ø§ â€” Ø¯ÙˆØ¨Ø§Ø±Û Ú©ÙˆØ´Ø´ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get addTaskElementWater => 'Ù¾Ø§Ù†ÛŒ';

  @override
  String get addTaskElementLight => 'Ø±ÙˆØ´Ù†ÛŒ';

  @override
  String get addTaskElementSoil => 'Ø²Ù…ÛŒÙ†';

  @override
  String get addTaskElementBreeze => 'ÛÙˆØ§';

  @override
  String get addTaskCadenceLabel => 'ØªØ±ØªÛŒØ¨';

  @override
  String get addTaskPreparationNotes => 'ØªÛŒØ§Ø±ÛŒ Ú©Û’ Ù†ÙˆÙ¹Ø³';

  @override
  String get addTaskTendingNotes => 'Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Û’ Ù†ÙˆÙ¹Ø³';

  @override
  String get addTaskNotesHintTask =>
      'Ø§Ø³ Ú©Ø§Ù… Ú©Û’ Ù„ÛŒÛ’ Ú©ÙˆØ¦ÛŒ Ù¹ÙˆÙ„ ÛŒØ§ Ø°ÛÙ†ÛŒØª Ù¹Ù¾Ø³ØŸ';

  @override
  String get addTaskNotesHintHabit =>
      'Ø§Ø³ Ù¾ÙˆØ¯Û’ Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©ÛŒØ³Ø§ Ù„Ú¯ØªØ§ ÛÛ’ØŸ';

  @override
  String get addTaskChooseElement => 'Ø¹Ù†ØµØ± Ù…Ù†ØªØ®Ø¨ Ú©Ø±ÛŒÚº';

  @override
  String get addTaskElementsTooltip => 'Ø¹Ù†Ø§ØµØ± Ú©Ø§ Ú©ÛŒØ§ Ù…Ø·Ù„Ø¨ ÛÛ’ØŸ';

  @override
  String get addTaskTaskSeed => 'Ú©Ø§Ù… Ú©Ø§ Ø¨ÛŒØ¬';

  @override
  String get addTaskHabitSprout => 'Ø¹Ø§Ø¯Øª Ú©Ø§ Ù¾ÙˆØ¯Ø§';

  @override
  String get addTaskPickElement => 'ØµØ­Ø­ Ø¹Ù†ØµØ± Ú†Ù†ÛŒÚº';

  @override
  String get addTaskPickElementBody =>
      'ÛØ± Ø¹Ù†ØµØ± Ù…Ø®ØªÙ„Ù Ù‚Ø³Ù… Ú©ÛŒ Ù…Ø­Ù†Øª Ø³Û’ Ù…Ù„ØªØ§ ÛÛ’Û” Ù†Ú¯ÛØ¨Ø§Ù† Ø§Ø³ ÙˆÙ‚Øª Ù…Ø¶Ø¨ÙˆØ· ÛÙˆØªØ§ ÛÛ’ Ø¬Ø¨ Ø¢Ù¾ ØµØ­Ø­ Ù¾Ø§Ù†ÛŒ Ø¯ÛŒØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get addTaskClearForm => 'ÙØ§Ø±Ù… ØµØ§Ù Ú©Ø±ÛŒÚº';

  @override
  String get shareCouldNotShare => 'Ø§Ø¨Ú¾ÛŒ Ø´ÛŒØ¦Ø± Ù†ÛÛŒÚº Ú©Ø± Ø³Ú©ØªÛ’';

  @override
  String get authReferralCodeLabel => 'Ø±ÛŒÙØ±Ù„ Ú©ÙˆÚˆ (Ø§Ø®ØªÛŒØ§Ø±ÛŒ)';

  @override
  String get authReferralCodeHint => 'Ø¯ÙˆØ³Øª Ú©Ø§ Ú©ÙˆÚˆ';

  @override
  String get youPerkHabitSlots => '5 Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø¬Ú¯ÛÛŒÚº';

  @override
  String get youPerkFullHistory => 'Ù…Ú©Ù…Ù„ ØªØ§Ø±ÛŒØ®';

  @override
  String get youPerkAllThemes => 'ØªÙ…Ø§Ù… ØªÚ¾ÛŒÙ…Ø²';

  @override
  String get youPerkStreakFreezes => '2 Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² / Ù…Ø§Û';

  @override
  String get youPerkLegendaryMedals => 'Legendary ØªÙ…ØºÛ’';

  @override
  String get subscriptionPurchaseFailed =>
      'Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒ Ù†Ø§Ú©Ø§Ù… ÛÙˆØ¦ÛŒÛ” Ø¯ÙˆØ¨Ø§Ø±Û Ú©ÙˆØ´Ø´ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get subscriptionUnavailable =>
      'Ø§Ø³ ÚˆÛŒÙˆØ§Ø¦Ø³ Ù¾Ø± Ø§Ù† Ø§ÛŒÙ¾ Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒ Ø¯Ø³ØªÛŒØ§Ø¨ Ù†ÛÛŒÚºÛ”';

  @override
  String get subscriptionLoadFailed =>
      'Ø³Ø¨Ø³Ú©Ø±Ù¾Ø´Ù† Ø¢Ù¾Ø´Ù†Ø² Ù„Ùˆ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©ÛŒÚºÛ”';

  @override
  String get subscriptionVerifyFailed =>
      'Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒ Ú©ÛŒ ØªØµØ¯ÛŒÙ‚ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©ÛŒÛ” Ø®Ø±ÛŒØ¯Ø§Ø±ÛŒ Ø¨Ø­Ø§Ù„ Ú©Ø±ÛŒÚº Ø¯ÙˆØ¨Ø§Ø±Û Ú©ÙˆØ´Ø´ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get streakFreezeFailed =>
      'Ø§Ø³Ù¹Ø±ÛŒÚ© ÙØ±ÛŒØ² Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©Ø§Û”';

  @override
  String get streakFreezeAlreadyUsed =>
      'Ø¢Ù¾ Ù†Û’ Ø§Ø³ Ù…ÛÛŒÙ†Û’ Ø§Ù¾Ù†Ø§ ÙØ±ÛŒØ² Ù¾ÛÙ„Û’ ÛÛŒ Ø§Ø³ØªØ¹Ù…Ø§Ù„ Ú©Ø± Ù„ÛŒØ§Û”';

  @override
  String get streakFreezeNoMissed =>
      'Ø§Ø³ Ø¯Ù† ÙØ±ÛŒØ² Ú©Ø±Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ú©ÙˆØ¦ÛŒ Ú†Ú¾ÙˆÙ¹Ø§ ÛÙˆØ§ Ú©Ø§Ù… Ù†ÛÛŒÚºÛ”';

  @override
  String get streakFreezeNotPastDay =>
      'Ø¢Ù¾ ØµØ±Ù Ú¯Ø²Ø´ØªÛ Ø¯Ù† ÙØ±ÛŒØ² Ú©Ø± Ø³Ú©ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get myDayLoadError =>
      'Ù…ÛŒØ±Ø§ Ø¯Ù† Ù„Ùˆ Ù†ÛÛŒÚº ÛÙˆ Ø³Ú©Ø§Û” ØªØ§Ø²Û Ú©Ø±Ù†Û’ Ú©Û’ Ù„ÛŒÛ’ Ú©Ú¾ÛŒÙ†Ú†ÛŒÚºÛ”';

  @override
  String get myDayCapReached =>
      'Ø¢Ø¬ Ú©ÛŒ 5 Ú©Ø§Ù… Ú©ÛŒ Ø­Ø¯ Ù¾ÙˆØ±ÛŒ ÛÙˆ Ú¯Ø¦ÛŒÛ”';

  @override
  String get myDayRemoveTaskError => 'Ú©Ø§Ù… ÛÙ¹Ø§ÛŒØ§ Ù†ÛÛŒÚº Ø¬Ø§ Ø³Ú©Ø§Û”';

  @override
  String get shareCardTitle => 'Ø§Ù¾Ù†Ø§ ÛÙØªÛ Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get shareCardCta => 'ØªØµÙˆÛŒØ± Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get medalTierSprout => 'Ù¾ÙˆØ¯Ø§';

  @override
  String get medalTierCommon => ' Ø¹Ø§Ù…';

  @override
  String get medalTierRare => 'Ù†Ø§ÛŒØ§Ø¨';

  @override
  String get medalTierEpic => 'Ø´Ø§Ù†Ø¯Ø§Ø±';

  @override
  String get medalTierLegendary => ' Legendary';

  @override
  String get medalCategoryTasks => 'Ú©Ø§Ù…';

  @override
  String get medalCategoryHabits => 'Ø¹Ø§Ø¯Ø§Øª';

  @override
  String get medalCategoryStreaks => 'Ø§Ø³Ù¹Ø±ÛŒÚ©Ø³';

  @override
  String get medalCategoryMastery => 'Ù…ÛØ§Ø±Øª';

  @override
  String get medalsShareTooltip => 'Ú©Ø§Ù…ÛŒØ§Ø¨ÛŒØ§Úº Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String get medalsFilterAll => 'Ø³Ø¨';

  @override
  String get addHabitTitleNew => 'Ù†ÛŒØ§ Ù¾ÙˆØ¯Ø§ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get addHabitTitleEdit =>
      'Ø§Ù¾Ù†Û’ Ù¾ÙˆØ¯Û’ Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get addHabitLabelSproutName => 'Ù¾ÙˆØ¯Û’ Ú©Ø§ Ù†Ø§Ù…';

  @override
  String get shareCardAppBarTitle => 'Ø´ÛŒØ¦Ø± Ú©Ø§Ø±Úˆ';

  @override
  String get shareCardAppBarTitleMedal => 'Ø§Ù¾Ù†Ø§ ØªÙ…ØºÛ Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚº';

  @override
  String shareCardDescMedal(Object title) {
    return 'Ø§Ù¾Ù†Ø§ Ù†ÛŒØ§ $title Ø¨ÛŒØ¬ Ø¯Ú©Ú¾Ø§Ø¦ÛŒÚº';
  }

  @override
  String get shareCardBodyMedal =>
      'Ú©Ø§Ù…ÛŒØ§Ø¨ÛŒ Ø§Ù¾Ù†Û’ Ø¯Ø§Ø¦Ø±Û’ Ù…ÛŒÚº Ø´ÛŒØ¦Ø± Ú©Ø±ÛŒÚºÛ” Ú©Ø§Ø±Úˆ PNG Ú©Û’ Ø·ÙˆØ± Ù¾Ø± Ø§ÛŒÚ©Ø³Ù¾ÙˆØ±Ù¹ ÛÙˆØªØ§ ÛÛ’ Ø§ÙˆØ± Ú©Ø³ÛŒ Ø¨Ú¾ÛŒ Ø³ÙˆØ´Ù„ Ø§ÛŒÙ¾ Ú©Û’ Ù„ÛŒÛ’ ØªÛŒØ§Ø± ÛÙˆØªØ§ ÛÛ’Û”';

  @override
  String get shareCardCtaPreparing => 'ØªÛŒØ§Ø± ÛÙˆ Ø±ÛØ§ ÛÛ’â€¦';

  @override
  String get shareCardMilestone => 'Ù†Ø¦Û’ Ø³Ù†Ú¯ Ù…ÛŒÙ„ Ú©Ú¾Ù„Û’';

  @override
  String get shareCardStatChain => 'Ø¯Ù† Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ±';

  @override
  String get shareCardStatSprouts => 'Ù¾ÙˆØ¯Û’';

  @override
  String get shareCardStatMedals => 'ØªÙ…ØºÛ’';

  @override
  String shareCardHeadlineStreak(int days) {
    return '$days Ø¯Ù† Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ©';
  }

  @override
  String shareCardHeadlineMedals(int count) {
    return '$count ØªÙ…ØºÛ’ Ø­Ø§ØµÙ„';
  }

  @override
  String get shareCardHeadlineSproutGuardian => 'Ù¾ÙˆØ¯Û’ Ú©Ø§ Ù†Ú¯ÛØ¨Ø§Ù†';

  @override
  String get shareCardHeadlineFirstSeeds => 'Ù¾ÛÙ„Û’ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦Û’ Ú¯Ø¦Û’';

  @override
  String get shareCardHeadlineGardenBegins => 'Ø¨Ø§Øº Ø´Ø±ÙˆØ¹ ÛÙˆØªØ§ ÛÛ’';

  @override
  String get shareCardSubheadMonth =>
      'Ø¢Ù¾ Ù†Û’ Ú©Ø§Ù…ÛŒØ§Ø¨ÛŒ Ø³Û’ Ø§ÛŒÚ© Ù¾ÙˆØ±Ø§ Ù…ÛÛŒÙ†Û Ø§Ù¾Ù†ÛŒ Ø¹Ø§Ø¯Ø§Øª Ú©ÛŒ Ù¾Ø±ÙˆØ±Ø´ Ú©ÛŒ ÛÛ’Û”';

  @override
  String get shareCardSubheadWeek =>
      'Ø§ÛŒÚ© Ù¾ÙˆØ±Ø§ ÛÙØªÛ ØªØ±Ù‚ÛŒ Ú©Ø§ â€” Ø¢Ù¾ Ú©Ø§ Ø¬Ù†Ú¯Ù„ Ú¯Ú¾Ù†Ø§ ÛÙˆ Ø±ÛØ§ ÛÛ’Û”';

  @override
  String get shareCardSubheadProgress =>
      'Ø¢Ù¾ Ú©Ø§ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ Ø§ØµÙ„ÛŒ Ù¾ÛŒØ´Ø±ÙØª Ø¯Ú©Ú¾Ø§ Ø±ÛØ§ ÛÛ’Û” Ø¬Ø§Ø±ÛŒ Ø±Ú©Ú¾ÛŒÚºÛ”';

  @override
  String get shareCardSubheadSprouts =>
      'Ø¢Ù¾ Ú©Û’ Ù¾ÛÙ„Û’ Ù¾ÙˆØ¯Û’ Ø¬Ú‘ÛŒÚº Ù¾Ú©Ú‘ Ø±ÛÛ’ ÛÛŒÚºÛ” Ø§Ù†ÛÛŒÚº Ø±ÙˆØ²Ø§Ù†Û Ù¾Ø§Ù†ÛŒ Ø¯ÛŒÚºÛ”';

  @override
  String get shareCardSubheadFirstSeeds =>
      'Ø¢Ù¾ Ú©Û’ Ù¾ÛÙ„Û’ Ø¨ÛŒØ¬ Ø²Ù…ÛŒÙ† Ù…ÛŒÚº ÛÛŒÚºÛ” Ø§Ù†ÛÛŒÚº Ú©Ú¾Ù„ØªØ§ Ø¯ÛŒÚ©Ú¾ÛŒÚºÛ”';

  @override
  String get shareCardSubheadFallback =>
      'ÛØ± Ø¬Ù†Ú¯Ù„ Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹Û’ Ø³Û’ Ø§Ù†ØªØ®Ø§Ø¨ Ø³Û’ Ø´Ø±ÙˆØ¹ ÛÙˆØªØ§ ÛÛ’Û”';

  @override
  String shareAppText(String url) {
    return 'Daily Stitch â€” Ø±ÙˆØ²Ø§Ù†Û Ù¾Ø§Ù†Ú† Ú†Ú¾ÙˆÙ¹Û’ Ø¨ÛŒØ¬ØŒ Ø§ÛŒÚ© Ù†Û Ù¹ÙˆÙ¹Ù†Û’ ÙˆØ§Ù„ÛŒ Ø²Ù†Ø¬ÛŒØ±Û” Ø§Ù¾Ù†Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚºÛ”\n\n$url';
  }

  @override
  String get shareAppSubject => 'Daily Stitch Ø¢Ø²Ù…Ø§Ø¦ÛŒÚº';

  @override
  String shareAppReferralText(String code, String url) {
    return 'Ù…ÛŒÚº Daily Stitch Ù¾Ø± Ø§Ù¾Ù†ÛŒ Ø±ÙˆØ²Ø§Ù†Û Ø²Ù†Ø¬ÛŒØ± Ø¨Ù†Ø§ Ø±ÛØ§ ÛÙˆÚº â€” Ù…ÛŒØ±Û’ Ø±ÛŒÙØ±Ù„ Ú©ÙˆÚˆ $code Ø³Û’ Ù…ÛŒØ±Û’ Ø³Ø§ØªÚ¾ Ø´Ø§Ù…Ù„ ÛÙˆÚº Ø§ÙˆØ± ÛÙ… Ø¯ÙˆÙ†ÙˆÚº Ø¨Ú‘Ú¾ÛŒÚºÛ”\n\n$url';
  }

  @override
  String get shareAppReferralSubject =>
      'Daily Stitch Ù¾Ø± Ù…ÛŒØ±Û’ Ø³Ø§ØªÚ¾ Ø´Ø§Ù…Ù„ ÛÙˆÚº';

  @override
  String shareCardShareTextProgress(String year) {
    return 'Ù…ÛŒØ±ÛŒ Daily Stitch Ù¾ÛŒØ´Ø±ÙØª â€” Daily Stitch Ù¾Ø± $yearÛ”';
  }

  @override
  String shareCardShareTextMedal(String title, String subtitle) {
    return 'Ù…ÛŒÚº Ù†Û’ Ø§Ø¨Ú¾ÛŒ Daily Stitch Ù¾Ø± \"$title\" ØªÙ…ØºÛ Ú©Ú¾ÙˆÙ„Ø§ ÛÛ’Û” $subtitle';
  }

  @override
  String get insightsReceiptTasksDone => 'Ú©Ø§Ù… Ù…Ú©Ù…Ù„';

  @override
  String get insightsReceiptPerfectDays => 'Ú©Ø§Ù…Ù„ Ø¯Ù†';

  @override
  String get insightsReceiptCompletion => 'ØªÚ©Ù…ÛŒÙ„';

  @override
  String insightsReceiptDate(String date) {
    return 'ÛÙØªÛ $date';
  }

  @override
  String get insightsReceiptFooter => 'Ø²Ù†Ø¬ÛŒØ± Ù†Û ØªÙˆÚ‘ÛŒÚºÛ”';

  @override
  String get elementLabelWater => 'Ù¾Ø§Ù†ÛŒ';

  @override
  String get elementLabelLight => 'Ø±ÙˆØ´Ù†ÛŒ';

  @override
  String get elementLabelSoil => 'Ø²Ù…ÛŒÙ†';

  @override
  String get elementLabelBreeze => 'ÛÙˆØ§';

  @override
  String get elementTaglineWater =>
      'Ø¨Ø­Ø§Ù„ Ú©Ø±ÛŒÚºÛ” Ø¢Ø¨ Ù¾Ø§Ø´ÛŒØŒ Ø¢Ø±Ø§Ù…ØŒ Ø¬Ø°Ø¨Ø§ØªÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ â€” Ú©Ú†Ú¾ Ø¨Ú¾ÛŒ Ø¬Ùˆ Ú©Ù†ÙˆÛŒÚº Ú©Ùˆ Ø¯ÙˆØ¨Ø§Ø±Û Ø¨Ú¾Ø±ØªØ§ ÛÛ’Û”';

  @override
  String get elementTaglineLight =>
      'Ø¬Ø§Ú¯ÛŒÚºÛ” ØµØ¨Ø­ Ú©ÛŒ Ø±ÙˆØ´Ù†ÛŒØŒ ØªÙˆØ¬Û Ú©Û’ Ø¨Ù„Ø§Ú©Ø³ØŒ Ù…Ø·Ø§Ù„Ø¹ÛØŒ Ù…Ø±Ø§Ù‚Ø¨Û â€” ØªÙˆØ§Ù†Ø§Ø¦ÛŒ Ø§ÙˆØ± ÙˆØ¶Ø§Ø­ØªÛ”';

  @override
  String get elementTaglineSoil =>
      'Ø¨Ù†ÛŒØ§Ø¯Û” Ù…Ø·Ø§Ù„Ø¹ÛØŒ Ø¬Ø±Ù†Ù„Ù†Ú¯ØŒ Ú¯ÛØ±ÛŒ Ù…Ø­Ù†Øª â€” Ø³Ø³Øª Ø¬Ú‘ÛŒÚº Ø¬Ùˆ Ø·ÙˆÛŒÙ„ Ù…Ø²Ø§Ø­Ù…Øª Ø¨Ù†Ø§ØªÛŒ ÛÛŒÚºÛ”';

  @override
  String get elementTaglineBreeze =>
      'Ø­Ø±Ú©ØªÛ” Ù¾ÛŒØ¯Ù„ØŒ Ø¯ÙˆÚ‘ØŒ Ø³Ø§Ù†Ø³ Ú©ÛŒ Ù…Ø´Ù‚ â€” ÛÙ„Ú©ÛŒØŒ Ù…ØªØ­Ø±Ú© ØªÙˆØ§Ù†Ø§Ø¦ÛŒ Ø¬Ùˆ Ø°ÛÙ† ØµØ§Ù Ú©Ø±ØªÛŒ ÛÛ’Û”';

  @override
  String get elementWhenWater =>
      'Ø¬Ø¨ Ø¢Ù¾ ØªÚ¾Ú©Û’ ÛÙˆØ¦Û’ ÛŒØ§ ØªØ­Ù„ÛŒÙ„ Ù…Ø­Ø³ÙˆØ³ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get elementWhenLight =>
      'Ø¬Ø¨ Ø¢Ù¾ Ú©Ùˆ Ø¯Ù† Ú©Ø§ ÙˆØ§Ø¶Ø­ Ø¢ØºØ§Ø² Ú†Ø§ÛÛŒÛ’Û”';

  @override
  String get elementWhenSoil =>
      'Ø¬Ø¨ Ú©Ø§Ù… Ø³Ø³Øª ÛÛ’ Ù„ÛŒÚ©Ù† Ù‚Ø§Ø¨Ù„ ÛÛ’ (Ù…Ø·Ø§Ù„Ø¹ÛØŒ Ø­Ø±ÙØªØŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„)Û”';

  @override
  String get elementWhenBreeze =>
      'Ø¬Ø¨ Ø¢Ù¾ Ú©Ø§ Ø¬Ø³Ù… (ÛŒØ§ Ø°ÛÙ†) Ú©Ùˆ Ø­Ø±Ú©Øª Ø§ÙˆØ± Ø³Ø§Ù†Ø³ Ú©ÛŒ Ø¶Ø±ÙˆØ±Øª ÛÙˆÛ”';

  @override
  String get bloomTierMastery => 'Ù…ÛØ§Ø±Øª';

  @override
  String get bloomTierStrong => 'Ù…Ø¶Ø¨ÙˆØ·';

  @override
  String get bloomTierGrowing => 'Ø¨Ú‘Ú¾ Ø±ÛØ§ ÛÛ’';

  @override
  String get bloomTierSprouting => 'Ù¾Ú¾ÙˆØª Ø¯Ø§Ø± ÛÙˆ Ø±ÛØ§ ÛÛ’';

  @override
  String get bloomTierLocked => 'Ø¨Ù†Ø¯';

  @override
  String habitBloomSubtitle(int count, String element) {
    return '$count Ø¯Ù† Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ© Â· $element';
  }

  @override
  String get medal_id_first_spark => 'Ù¾ÛÙ„Ø§ Ø´Ø¹Ù„Û';

  @override
  String get medal_sub_first_spark => 'Ø¢Ù¾ Ù†Û’ Ù…Ú†Ú¾ Ø¬Ù„Ø§ÛŒØ§Û”';

  @override
  String get medal_desc_first_spark =>
      'Ø§Ù¾Ù†Ø§ Ù¾ÛÙ„Ø§ Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ” ÛØ± Ø²Ù†Ø¬ÛŒØ± ÛŒÛØ§Úº Ø³Û’ Ø´Ø±ÙˆØ¹ ÛÙˆØªÛŒ ÛÛ’Û”';

  @override
  String get medal_id_triple_seed => 'ØªÛŒÙ† Ø¨ÛŒØ¬';

  @override
  String get medal_sub_triple_seed => 'ØªÛŒÙ† Ø²Ù…ÛŒÙ† Ù…ÛŒÚºÛ”';

  @override
  String get medal_desc_triple_seed =>
      'Ú©Ù„ Ù…ÛŒÚº 3 Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_dozen_sower => 'Ø¨Ø§Ø±Û Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ù†Û’ ÙˆØ§Ù„Ø§';

  @override
  String get medal_sub_dozen_sower => 'Ø¨Ø§Ø±Û Ú©Ø§ Ù…ÛŒØ¯Ø§Ù†Û”';

  @override
  String get medal_desc_dozen_sower =>
      'Ú©Ù„ Ù…ÛŒÚº 12 Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_quarter_century => 'Ú†ÙˆØªÚ¾Ø§Ø¦ÛŒ ØµØ¯ÛŒ';

  @override
  String get medal_sub_quarter_century => 'ÛØ§Úº Ú©ÛÙ†Û’ Ú©Ø§ Ù…ÙˆØ³Ù…Û”';

  @override
  String get medal_desc_quarter_century =>
      'Ú©Ù„ Ù…ÛŒÚº 25 Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_productivity_titan => 'Ù¾ÛŒØ¯Ø§ÙˆØ§Ø±ÛŒØª Ú©Ø§ Ø¹Ø¸ÛŒÙ…';

  @override
  String get medal_sub_productivity_titan =>
      'Ù…Ø³Ù„Ø³Ù„Øª Ø¬Ù…Ø¹ ÛÙˆØªÛŒ ÛÛ’Û”';

  @override
  String get medal_desc_productivity_titan =>
      '50 Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚº â€” Ø¢Ù¾ Ù†Û’ Ø§ØµÙ„ÛŒ Ø±ÙØªØ§Ø± Ø¨Ù†Ø§ Ù„ÛŒ ÛÛ’Û”';

  @override
  String get medal_id_century_planter => 'ØµØ¯ÛŒ Ú©Ø§ Ù„Ú¯Ø§Ù†Û’ ÙˆØ§Ù„Ø§';

  @override
  String get medal_sub_century_planter => 'Ø§Ù¾Ù†Ø§ Ø§ÛŒÚ© Ø¬Ù†Ú¯Ù„Û”';

  @override
  String get medal_desc_century_planter =>
      '100 Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ” Ø¢Ù¾ ØµØ§Ø±ÙÛŒÙ† Ú©Û’ Ù¹Ø§Ù¾ 5% Ù…ÛŒÚº ÛÛŒÚºÛ”';

  @override
  String get medal_id_clean_day => 'ØµØ§Ù ØªØ®ØªÛŒ';

  @override
  String get medal_sub_clean_day => 'Ø§ÛŒÚ© Ø¨Ú¾ÛŒ Ù¾ÙˆØ¯Ø§ Ù†ÛÛŒÚºÛ”';

  @override
  String get medal_desc_clean_day =>
      'Ø§ÛŒÚ© Ø¯Ù† Ù…ÛŒÚº Ù„Ú¯Ø§Ø¦Û’ Ú¯Ø¦Û’ ÛØ± Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_triple_perfect => 'ØªÛŒÙ† Ú©Ø§Ù…Ù„';

  @override
  String get medal_sub_triple_perfect => 'ØªÛŒÙ† Ø¨Û’ Ø¹ÛŒØ¨ Ø¯ÙˆÚ‘Û”';

  @override
  String get medal_desc_triple_perfect => '3 Ú©Ø§Ù…Ù„ Ø¯Ù† Ø­Ø§ØµÙ„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_perfect_week => 'Ú©Ø§Ù…Ù„ ÛÙØªÛ';

  @override
  String get medal_sub_perfect_week => 'Ø³Ø§Øª Ø¯Ù† Ù†Û Ù¹ÙˆÙ¹Û’Û”';

  @override
  String get medal_desc_perfect_week => 'Ù…Ø³Ù„Ø³Ù„ 7 Ú©Ø§Ù…Ù„ Ø¯Ù†Û”';

  @override
  String get medal_id_two_week_chain => 'Ù¾Ù†Ø¯Ø±Û Ø¯Ù† Ú©ÛŒ Ø·Ø§Ù‚Øª';

  @override
  String get medal_sub_two_week_chain => 'Ø¯Ùˆ ÛÙØªÛ’ Ø¢Ú¯ Ù…ÛŒÚºÛ”';

  @override
  String get medal_desc_two_week_chain =>
      '14 Ø¯Ù† Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø¨Ø±Ù‚Ø±Ø§Ø± Ø±Ú©Ú¾ÛŒÚºÛ”';

  @override
  String get medal_id_iron_chain => 'Ù„ÙˆÛÛ’ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ±';

  @override
  String get medal_sub_iron_chain => '30 Ù„Ù†Ú©Ø³ Ø¯Ú¾Ø±Û’ Ú¯Ø¦Û’Û”';

  @override
  String get medal_desc_iron_chain =>
      '30 Ø¯Ù† Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ±Û” Ø³Ø¨ Ø³Û’ Ù…Ø´Ú©Ù„ Ú©Ø§Ù… Ú©Ø§ ØªÙ…ØºÛÛ”';

  @override
  String get medal_id_quarterly_chain => 'Ø³Û Ù…Ø§ÛÛŒ Ø²Ù†Ø¬ÛŒØ±';

  @override
  String get medal_sub_quarterly_chain => 'Ø§ÛŒÚ© Ù…ÙˆØ³Ù…ØŒ Ù†Û Ù¹ÙˆÙ¹Ø§Û”';

  @override
  String get medal_desc_quarterly_chain =>
      '90 Ø¯Ù† Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ±Û” Legendary Ø­ÛŒØ«ÛŒØªÛ”';

  @override
  String get medal_id_vital_priority => 'Ø¶Ø±ÙˆØ±ÛŒ Ø´Ø¹Ù„Û';

  @override
  String get medal_sub_vital_priority => 'Ø¢Ù¾ Ù†Û’ Ù…Ø´Ú©Ù„ Ú†Ù†Û’Û”';

  @override
  String get medal_desc_vital_priority =>
      'Ø¶Ø±ÙˆØ±ÛŒ ØªØ±Ø¬ÛŒØ­ ÙˆØ§Ù„Û’ 5 Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_spark_priority => 'Ø´Ø¹Ù„Û’ Ù¾Ø± Ù‚Ø§Ø¨Ùˆ';

  @override
  String get medal_sub_spark_priority =>
      'ØªÛŒØ² Ú©Ø§Ù…ÛŒØ§Ø¨ÛŒØ§Úº Ø¬Ù…Ø¹ ÛÙˆØªÛŒ ÛÛŒÚºÛ”';

  @override
  String get medal_desc_spark_priority =>
      'Spark ØªØ±Ø¬ÛŒØ­ ÙˆØ§Ù„Û’ 5 Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_note_taker => 'Ù†ÙˆÙ¹ Ù„ÛŒÙ†Û’ ÙˆØ§Ù„Ø§';

  @override
  String get medal_sub_note_taker =>
      'Ú©Ø§ØºØ° Ù¾Ø± Ù…Ù†ØµÙˆØ¨Û’ Ø°ÛÙ† Ø³Û’ Ø¨ÛØªØ± ÛÛŒÚºÛ”';

  @override
  String get medal_desc_note_taker =>
      '5 Ù…Ø®ØªÙ„Ù Ú©Ø§Ù…ÙˆÚº Ù…ÛŒÚº ØªÛŒØ§Ø±ÛŒ Ú©Û’ Ù†ÙˆÙ¹Ø³ Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_left_behind_rescuer =>
      'Ù¾ÛŒÚ†Ú¾Û’ Ú†Ú¾ÙˆÚ‘Û’ Ú¯Ø§Ø¤Úº Ú©Ø§ Ø¨Ú†Ø§Ù†Û’ ÙˆØ§Ù„Ø§';

  @override
  String get medal_sub_left_behind_rescuer =>
      'Ú©ÙˆØ¦ÛŒ Ú©Ø§Ù… Ù¾ÛŒÚ†Ú¾Û’ Ù†Û Ú†Ú¾ÙˆÚ‘Ø§Û”';

  @override
  String get medal_desc_left_behind_rescuer =>
      'Ø§Ú¯Ù„Û’ Ø¯Ù† 3 Ú†Ú¾ÙˆÙ¹Û’ ÛÙˆØ¦Û’ Ú©Ø§Ù… Ø¯ÙˆØ¨Ø§Ø±Û Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_first_sprout => 'Ù¾ÛÙ„Ø§ Ù¾ÙˆØ¯Ø§';

  @override
  String get medal_sub_first_sprout => 'Ù†Ø¦ÛŒ Ø±ÙˆØ²Ø§Ù†Û Ø±Ø³Ù…Û”';

  @override
  String get medal_desc_first_sprout =>
      'Ø§Ù¾Ù†ÛŒ Ù¾ÛÙ„ÛŒ Ø¹Ø§Ø¯Øª Ù„Ú¯Ø§Ø¦ÛŒÚºÛ”';

  @override
  String get medal_id_trio_sprout => 'ØªÛŒÙ† Ù¾ÙˆØ¯Û’';

  @override
  String get medal_sub_trio_sprout => 'Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹Ø§ Ù†Ø¸Ø§Ù…Û”';

  @override
  String get medal_desc_trio_sprout => '3 Ù…Ø®ØªÙ„Ù Ø¹Ø§Ø¯Ø§Øª Ù„Ú¯Ø§Ø¦ÛŒÚºÛ”';

  @override
  String get medal_id_week_of_growth => 'ØªØ±Ù‚ÛŒ Ú©Ø§ ÛÙØªÛ';

  @override
  String get medal_sub_week_of_growth =>
      'Ø¬Ú‘ÛŒÚº Ù¾Ú©Ú‘Ù†Ø§ Ø´Ø±ÙˆØ¹ Ú©Ø±ØªÛŒ ÛÛŒÚºÛ”';

  @override
  String get medal_desc_week_of_growth =>
      '7 Ø¯Ù† ØªÚ© Ø±ÙˆØ²Ø§Ù†Û Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_fortnight_floret => 'Ù¾Ù†Ø¯Ø±Û Ø¯Ù† Ú©Ø§ Ù¾Ú¾ÙˆÙ„';

  @override
  String get medal_sub_fortnight_floret => 'Ù…Ú©Ù…Ù„ Ù¾Ú¾ÙˆÙ„Û”';

  @override
  String get medal_desc_fortnight_floret =>
      '14 Ø¯Ù† Ú©ÛŒ Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ©Û”';

  @override
  String get medal_id_rooted_master => 'Ø¬Ú‘ÛŒÚº Ù¾Ú©Ú‘Ù†Û’ ÙˆØ§Ù„Ø§ Ù…Ø§ÛØ±';

  @override
  String get medal_sub_rooted_master =>
      'Ú¯ÛØ±ÛŒ Ø¬Ú‘ÛŒÚºØŒ Ú¯ÛØ±ÛŒ Ø·Ø§Ù‚ØªÛ”';

  @override
  String get medal_desc_rooted_master =>
      '30 Ø¯Ù† Ú©ÛŒ Ø¹Ø§Ø¯Øª Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ©Û”';

  @override
  String get medal_id_half_year_bloom => 'Ø¢Ø¯Ú¾Û’ Ø³Ø§Ù„ Ú©Ø§ Ù¾Ú¾ÙˆÙ„';

  @override
  String get medal_sub_half_year_bloom => 'Ø§Ø¨ Ø¨Ø§Øº Ù…Ø³ØªÙ‚Ù„ ÛÛ’Û”';

  @override
  String get medal_desc_half_year_bloom =>
      'Ø§ÛŒÚ© Ø¹Ø§Ø¯Øª Ú©Ùˆ 180 Ø¯Ù† Ø¨Ø±Ù‚Ø±Ø§Ø± Ø±Ú©Ú¾ÛŒÚºÛ”';

  @override
  String get medal_id_garden_keeper => 'Ø¨Ø§Øº Ú©Ø§ Ø±Ú©Ú¾ÙˆØ§Ù„Ø§';

  @override
  String get medal_sub_garden_keeper => 'Ù…ØªÙ†ÙˆØ¹ÛŒØªØŒ Ø³Ø§ØªÚ¾ Ù…ÛŒÚºÛ”';

  @override
  String get medal_desc_garden_keeper =>
      'Ø§ÛŒÚ© Ø³Ø§ØªÚ¾ 4 Ù…Ø®ØªÙ„Ù Ø¹Ø§Ø¯Ø§Øª Ø¨Ú‘Ú¾Ø§Ø¦ÛŒÚºÛ”';

  @override
  String get medal_id_hydration_hero => 'Ø¢Ø¨ Ù¾Ø§Ø´ÛŒ Ú©Ø§ ÛÛŒØ±Ùˆ';

  @override
  String get medal_sub_hydration_hero =>
      'Ø¢Ù¾ Ú©Ù†ÙˆÛŒÚº Ú©Ùˆ Ø¨Ú¾Ø±ØªÛ’ ÛÛŒÚºÛ”';

  @override
  String get medal_desc_hydration_hero =>
      'Ø¢Ø¨ Ù¾Ø§Ø´ÛŒ Ú©ÛŒ Ø¹Ø§Ø¯Øª Ù„Ú¯Ø§Ø¦ÛŒÚº (Ù¾Ø§Ù†ÛŒ/Ù…Ø´Ø±ÙˆØ¨)Û”';

  @override
  String get medal_id_mindful_mover => 'mindful Ø­Ø±Ú©Øª Ú©Ø±Ù†Û’ ÙˆØ§Ù„Ø§';

  @override
  String get medal_sub_mindful_mover => 'Ø¬Ø³Ù… ÛŒØ§Ø¯ Ø±Ú©Ú¾ØªØ§ ÛÛ’Û”';

  @override
  String get medal_desc_mindful_mover =>
      'Ø­Ø±Ú©Øª Ú©ÛŒ Ø¹Ø§Ø¯Øª Ù„Ú¯Ø§Ø¦ÛŒÚº (ÛŒÙˆÚ¯Ø§/Ù¾ÛŒØ¯Ù„/Ø¯ÙˆÚ‘)Û”';

  @override
  String get medal_id_devoted_keeper => 'ÙˆÙ‚Ù Ø±Ú©Ú¾ÙˆØ§Ù„Ø§';

  @override
  String get medal_sub_devoted_keeper => 'Ø³Ø§Ù¹Ú¾ Ø¯Ù†ØŒ Ø§ÛŒÚ© Ù…Ø´Ù‚Û”';

  @override
  String get medal_desc_devoted_keeper =>
      'Ø§ÛŒÚ© Ø¹Ø§Ø¯Øª Ú©Ùˆ 60 Ø¯Ù† ØªÚ© Ø±ÙˆØ²Ø§Ù†Û Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_id_tending_notes => 'Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Û’ Ù†ÙˆÙ¹Ø³';

  @override
  String get medal_sub_tending_notes => 'Ø¬Ø§ØªÛ’ Ø¬Ø§ØªÛ’ ØºÙˆØ± Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medal_desc_tending_notes =>
      '3 Ø¹Ø§Ø¯Ø§Øª Ù…ÛŒÚº Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Û’ Ù†ÙˆÙ¹Ø³ Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get medalTierTaglineSprout => 'Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get medalTierTaglineCommon => 'Ø¹Ø§Ø¯Øª Ø¨Ù†Ø§ Ø±ÛÛ’ ÛÛŒÚº';

  @override
  String get medalTierTaglineRare =>
      'Ø§ØµÙ„ÛŒ Ø±ÙØªØ§Ø± Ø¯Ú©Ú¾Ø§ Ø±ÛÛ’ ÛÛŒÚº';

  @override
  String get medalTierTaglineEpic => 'Ø¢Ù¾ Ù‚Ø¯Ø±Øª Ú©ÛŒ Ø·Ø§Ù‚Øª ÛÛŒÚº';

  @override
  String get medalTierTaglineLegendary =>
      'ç¥žè¯ÛŒØŒ ØªÙ‚Ø±ÛŒØ¨Ø§Ù‹ Ú©ÙˆØ¦ÛŒ ÛŒÛØ§Úº Ù†ÛÛŒÚº Ù¾ÛÙ†Ú†ØªØ§';

  @override
  String get guardianHeadlineNoTasks =>
      'Ø¢Ø¬ Ú©ÛŒ Ø²Ù…ÛŒÙ† ØªØ§Ø²Û ÛÛ’Û”\nØ§Ù¾Ù†Ø§ Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚº\nØ§ÙˆØ± Ø§Ø³Û’ Ø¨Ú‘Ú¾ØªØ§ Ø¯ÛŒÚ©Ú¾ÛŒÚºÛ”';

  @override
  String get guardianHeadlineAllDone =>
      'Ø¢Ù¾ Ù†Û’ Ø¬Ùˆ ÛØ± Ø¨ÛŒØ¬ Ù„Ú¯Ø§ÛŒØ§\nÙˆÛ Ù¾Ú¾ÙˆÙ„ Ù…ÛŒÚº ÛÛ’Û”\nØ¢Ø±Ø§Ù… Ú©Ø±ÛŒÚºØŒ Ù†Ú¯ÛØ¨Ø§Ù† â€” Ø¢Ù¾ Ù†Û’ Ú©Ù…Ø§ Ù„ÛŒØ§Û”';

  @override
  String guardianHeadlineStreak14(int count) {
    return '$count Ø¯Ù†\nÙ…Ø³Ù„Ø³Ù„ ØªØ±Ù‚ÛŒ Ú©Û’Û”\nØ¢Ù¾ Ú©Ø§ Ø¬Ù†Ú¯Ù„ Ø²Ù†Ø¯Ú¯ÛŒ Ø³Û’ Ø¨Ú¾Ø±Ø§ ÛÙˆØ§ ÛÛ’Û”';
  }

  @override
  String get guardianHeadlineStreak7 =>
      'Ø§ÛŒÚ© Ù¾ÙˆØ±Ø§ ÛÙØªÛ Ù¾Ú¾ÙˆÙ„ Ù…ÛŒÚºØŒ\nÙ†Ú¯ÛØ¨Ø§Ù†Û”\nØ§ÛŒÚ© Ø§ÙˆØ± Ú©Ø§Ù…Ù„ Ø¯Ù†\nØ²Ù†Ø¬ÛŒØ± Ø¨Ú‘Ú¾Ø§ØªØ§ ÛÛ’Û”';

  @override
  String get guardianHeadlineStreak3 =>
      'Ø¢Ù¾ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø¨Ø±Ù‚Ø±Ø§Ø± ÛÛ’Û”\nØ§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ú©Ú¾Ù„Û’ Ø¨ÛŒØ¬ÙˆÚº Ú©ÛŒ\nØ¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ”';

  @override
  String get guardianHeadlineNoHabitsDone =>
      'Ø¢Ù¾ Ú©Ø§Ù…ÙˆÚº Ú©ÛŒ Ø§Ú†Ú¾ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø± Ø±ÛÛ’ ÛÛŒÚºÛ”\nØ§ÛŒÚ© Ù¾ÙˆØ¯Ø§ Ù„Ú¯Ø§Ø¦ÛŒÚº â€”\nØ¹Ø§Ø¯Ø§Øª ÛÛŒÚº Ø¬Ùˆ Ø¬Ù†Ú¯Ù„ Ø¨Ú‘Ú¾Ø§ØªÛŒ ÛÛŒÚºÛ”';

  @override
  String get guardianHeadlineSomeDone =>
      'Ú©Ú†Ú¾ Ø¨ÛŒØ¬ Ú©Ú¾Ù„Û’ØŒ\nÚ©Ú†Ú¾ Ù†ÛÛŒÚºÛ” Ú©ÙˆØ¦ÛŒ Ø¨Ø§Øª Ù†ÛÛŒÚºÛ”\nÚ©Ù„ Ø§ÛŒÚ© Ø§ÙˆØ± Ù„Ú¯Ø§Ù†Û’ Ú©Ø§ Ø¯Ù† ÛÛ’Û”';

  @override
  String get guardianHeadlineMorning =>
      'ØµØ¨Ø­ Ø¨Ø®ÛŒØ±ØŒ Ù†Ú¯ÛØ¨Ø§Ù†Û”\nØ¯Ù† Ø§Ø¨Ú¾ÛŒ Ø¬ÙˆØ§Ù† ÛÛ’\nØ§ÙˆØ± Ø²Ù…ÛŒÙ† ØªÛŒØ§Ø± ÛÛ’Û”';

  @override
  String get guardianHeadlineAfternoon =>
      'Ø¯ÙˆÙ¾ÛØ± Ø¨Ø®ÛŒØ±ØŒ Ù†Ú¯ÛØ¨Ø§Ù†Û”\nØ¢Ø¯Ú¾ÛŒ Ø±ÙˆØ´Ù†ÛŒ Ø¨Ø§Ù‚ÛŒ ÛÛ’ â€”\nØ¬Ø§Ø±ÛŒ Ø±Ú©Ú¾ÛŒÚºÛ”';

  @override
  String get guardianHeadlineEvening =>
      'Ø´Ø§Ù… Ø¨Ø®ÛŒØ±ØŒ Ù†Ú¯ÛØ¨Ø§Ù†Û”\nØ³ÙˆØ±Ø¬ ØºØ±ÙˆØ¨ ÛÙˆÙ†Û’ Ø³Û’ Ù¾ÛÙ„Û’\nØ§ÛŒÚ© Ø¢Ø®Ø±ÛŒ Ø¬Ø§Ø¦Ø²ÛÛ”';

  @override
  String get guardianHeadlineNight =>
      'Ø±Ø§Øª Ú¯Ø¦ÛŒ Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ Ø¬Ø§Ú¯ Ø±ÛÛ’ ÛÛŒÚºØŸ\nÙ†Ú¯ÛØ¨Ø§Ù† Ø¨Ú¾ÛŒ Ø¢Ø±Ø§Ù… Ú©Ø±ØªÛ’ ÛÛŒÚºÛ”\nÚ©Ù„ Ú©Ø§ Ø¨ÛŒØ¬ Ø§Ø¨Ú¾ÛŒ Ù„Ú¯Ø§Ø¦ÛŒÚºÛ”';

  @override
  String get guardianBodyNoTasks =>
      'Ø¢Ù¾ Ú©Ø§ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ Ø§Ø¨Ú¾ÛŒ Ø®Ø§Ù…ÙˆØ´ ÛÛ’Û” Ø§ÛŒÚ© Ù†ÛŒØª Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº Ø§ÙˆØ± Ø¯ÛŒÚ©Ú¾ÛŒÚº Ø´Ø§Ù… ØªÚ© Ú©ÛŒØ§ Ø¨Ø¯Ù„ØªØ§ ÛÛ’Û”';

  @override
  String guardianBodyStreak14(int count) {
    return '$count Ø¯Ù† Ø³Û’ Ú†Ù„ Ø±ÛØ§ ÛÛ’Û” Ø²Ù†Ø¬ÛŒØ± Ù‚Ø³Ù…Øª Ù†ÛÛŒÚº â€” ÛŒÛ Ú†Ú¾ÙˆÙ¹Û’ Ø§Ù†ØªØ®Ø§Ø¨ Ø¬Ù…Ø¹ ÛÙˆ Ø±ÛÛ’ ÛÛŒÚºÛ” Ø¬Ù…Ø¹ ÛÙˆÙ†Û’ Ø¯ÛŒÚºÛ”';
  }

  @override
  String guardianBodyStreak3(int count) {
    return '$count Ø¯Ù† Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø§ØµÙ„ÛŒ Ø±ÙØªØ§Ø± ÛÛ’Û” Ø¢Ø¬ Ú©Û’ Ú©Ú¾Ù„Û’ Ø¨ÛŒØ¬ Ù…Ú©Ù…Ù„ Ú©Ø±ÛŒÚºÛ”';
  }

  @override
  String guardianBodyNoHabits(int count) {
    return 'Ø¢Ù¾ Ù†Û’ Ø§Ø¨Ú¾ÛŒ ØªÚ© $count Ú©Ø§Ù… Ù„Ú¯Ø§Ø¦Û’ ÛÛŒÚºÛ” Ø§ÛŒÚ© Ø¹Ø§Ø¯Øª Ú©Ø§ Ù¾ÙˆØ¯Ø§ Ø´Ø§Ù…Ù„ Ú©Ø±Ù†Û’ Ø³Û’ Ú©Ø§Ù… Ø¯Ù† Ø¨Ø¯Ù† Ø¬Ù…Ø¹ ÛÙˆØªØ§ Ø±ÛÛ’ Ú¯Ø§Û”';
  }

  @override
  String guardianBodyLowCompletion(int pct) {
    return 'Ø¢Ù¾ Ø§Ù¾Ù†Û’ Ù„Ú¯Ø§Ø¦Û’ $pct% Ù…Ú©Ù…Ù„ Ú©Ø± Ø±ÛÛ’ ÛÛŒÚºÛ” Ú©Ù…ØŒ ØªÛŒØ² Ø¨ÛŒØ¬ Ø¨Ú©Ú¾Ø±Û’ ÛÙˆØ¦Û’ Ø¯Ø³ Ø¨ÛŒØ¬ÙˆÚº Ø³Û’ Ø²ÛŒØ§Ø¯Û Ø§ÙˆÙ†Ú†Û’ Ø§Ú¯ØªÛ’ ÛÛŒÚºÛ”';
  }

  @override
  String guardianBodyDefault(int tasks, int sprouts) {
    return 'Ø¢Ù¾ Ú©Ø§ Ø³ÛŒÙ†Ú©Ú†Ø±ÛŒ Ø²Ù†Ø¯Û ÛÛ’Û” $tasks Ú©Ø§Ù… Ù…Ú©Ù…Ù„ØŒ $sprouts Ù¾ÙˆØ¯Ø§(Ù¾ÙˆØ¯Û’) Ø¨Ú‘Ú¾ Ø±ÛØ§ â€” Ú©Ø§Ù… Ù†Ø¸Ø± Ø¢ Ø±ÛØ§ ÛÛ’Û”';
  }

  @override
  String get guardianInsightWaitingTitle =>
      'Ø¢Ù¾ Ú©Û’ Ù¾ÛÙ„Û’ Ù‚Ø¯Ù… Ú©Ø§ Ù…Ù†ØªØ¸Ø±';

  @override
  String get guardianInsightWaitingBody =>
      'Ú©Ø§Ù… ÛŒØ§ Ø¹Ø§Ø¯Øª Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº Ø§ÙˆØ± Ù…ÛŒÚº Ø¢Ù¾ Ú©Û’ Ø¨Ø§Øº Ù…ÛŒÚº Ù¾ÛŒÙ¹Ø±Ù† Ù¾Ú‘Ú¾Ù†Ø§ Ø´Ø±ÙˆØ¹ Ú©Ø±ÙˆÚº Ú¯Ø§Û” Ø¬ØªÙ†Ø§ Ø²ÛŒØ§Ø¯Û Ù„Ú¯Ø§Ø¦ÛŒÚºØŒ Ù…ÛŒØ±Û’ Ù„ÛŒÛ’ Ø³ÛŒÚ©Ú¾Ù†Û’ Ú©Ùˆ Ø§ØªÙ†Ø§ Ø²ÛŒØ§Ø¯Û ÛÛ’Û”';

  @override
  String get guardianInsightWaitingCta =>
      'Ø§Ù¾Ù†Ø§ Ù¾ÛÙ„Ø§ Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get guardianInsightChainSuperTitle =>
      'Ø²Ù†Ø¬ÛŒØ± Ø¢Ù¾ Ú©ÛŒ Ø·Ø§Ù‚Øª ÛÛ’';

  @override
  String guardianInsightChainSuperBody(int count) {
    return 'Ø¢Ù¾ Ù†Û’ $count Ø¯Ù† Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ø¨Ø±Ù‚Ø±Ø§Ø± Ø±Ú©Ú¾ÛŒ ÛÛ’Û” Ø§Ø³Ù¹Ø±ÛŒÚ©Ø³ ÛØ± Ø¨Ø§Ø± Ø­ÙˆØµÙ„Û’ Ø³Û’ Ø¨ÛØªØ± ÛÛŒÚº â€” Ø§Ø³Û’ Ú¯Ø±Ù… Ø±Ú©Ú¾ÛŒÚºØŒ Ø³Ø³Øª Ø¯Ù†ÙˆÚº Ù…ÛŒÚº Ø¨Ú¾ÛŒÛ”';
  }

  @override
  String get guardianInsightChainSuperCta =>
      'Ú©Ù„ Ú©Ø§ Ø¨ÛŒØ¬ Ø´Ø§Ù…Ù„ Ú©Ø±ÛŒÚº';

  @override
  String get guardianInsightChainColdTitle =>
      'Ø²Ù†Ø¬ÛŒØ± Ù¹Ú¾Ù†ÚˆÛŒ ÛÛ’ â€” Ù†Ø¦ÛŒ Ø´Ø±ÙˆØ¹ Ú©Ø±ÛŒÚº';

  @override
  String get guardianInsightChainColdBody =>
      'Ø¢Ù¾ Ù¾ÛÙ„Û’ Ø¨Ú¾ÛŒ Ù„Ú¯Ø§ Ú†Ú©Û’ ÛÛŒÚºØŒ Ø¬Ø³ Ú©Ø§ Ù…Ø·Ù„Ø¨ ÛÛ’ Ø¢Ù¾ Ø¯ÙˆØ¨Ø§Ø±Û Ù„Ú¯Ø§ Ø³Ú©ØªÛ’ ÛÛŒÚºÛ” Ø¢Ø¬ Ø§ÛŒÚ© Ú†Ú¾ÙˆÙ¹Ø§ Ú©Ø§Ù… Ù…Ú©Ù…Ù„ Ú©Ø±Ù†Ø§ Ú©Ù„ Ù„Ù…Ø¨ÛŒ Ø²Ù†Ø¬ÛŒØ± ÛÛ’Û”';

  @override
  String get guardianInsightChainColdCta => 'Ø¨ÛŒØ¬ Ù„Ú¯Ø§Ø¦ÛŒÚº';

  @override
  String get guardianInsightLessIsMoreTitle =>
      'Ø§Ø³ ÛÙØªÛ’ Ú©Ù… Ø²ÛŒØ§Ø¯Û ÛÛ’';

  @override
  String guardianInsightLessIsMoreBody(int pct) {
    return 'Ø¢Ù¾ Ø§Ù¾Ù†Û’ Ù„Ú¯Ø§Ø¦Û’ $pct% Ù…Ú©Ù…Ù„ Ú©Ø±ØªÛ’ ÛÛŒÚºÛ” 5 Ø¨Ú©Ú¾Ø±Û’ ÛÙˆØ¦Û’ Ú©Ø§Ù…ÙˆÚº Ú©ÛŒ Ø¨Ø¬Ø§Ø¦Û’ 3 ØªÛŒØ² Ù†ÛŒØªÛŒÚº Ø¢Ø²Ù…Ø§Ø¦ÛŒÚº â€” Ù…Ø¹ÛŒØ§Ø± Ø¬Ù…Ø¹ ÛÙˆØªØ§ ÛÛ’Û”';
  }

  @override
  String get guardianInsightLessIsMoreCta => 'Ø¯Ù† ØªÛŒØ² Ú©Ø±ÛŒÚº';

  @override
  String guardianInsightNextMedalTitle(String title) {
    return 'Ø§Ú¯Ù„Ø§ ØªÙ…ØºÛ: $title';
  }

  @override
  String guardianInsightNextMedalBody(int value, int target, String unit) {
    return 'Ø¢Ù¾ $target Ù…ÛŒÚº Ø³Û’ $value $unit ØªÚ© ÛÛŒÚºÛ” Ú†Ù†Ø¯ Ø§ÙˆØ± Ø§ÛŒÙ…Ø§Ù†Ø¯Ø§Ø±ÛŒ ÙˆØ§Ù„Û’ Ø¯Ù† Ø§ÙˆØ± ÛŒÛ Ø¢Ù¾ Ú©Ø§ ÛÛ’Û”';
  }

  @override
  String get guardianInsightNextMedalCta => 'ØªÙ…ØºÛ Ø¯Ú©Ú¾Ø§Ø¦ÛŒÚº';

  @override
  String get guardianInsightSteadyTitle =>
      'Ø¢Ù¾ Ø§ÛŒÚ© Ù…Ø³ØªØ­Ú©Ù„ Ù…ÙˆØ³Ù… Ù…ÛŒÚº ÛÛŒÚº';

  @override
  String get guardianInsightSteadyBody =>
      'Ù‚Ø±ÛŒØ¨ Ú©ÙˆØ¦ÛŒ ØªÙ…ØºÛ Ù†ÛÛŒÚº â€” Ù¹Ú¾ÛŒÚ© ÛÛ’Û” Ø¬Ùˆ ÛÛ’ Ø§Ø³ Ú©ÛŒ Ø¯ÛŒÚ©Ú¾ Ø¨Ú¾Ø§Ù„ Ú©Ø±ÛŒÚºÛ” Ø§Ú¯Ù„Ø§ Ù¾Ú¾ÙˆÙ„ Ø±Ø³ØªÛ’ Ù…ÛŒÚº ÛÛ’Û”';

  @override
  String get guardianInsightSteadyCta => 'Ù¾ÛŒØ´Ø±ÙØª Ø¯ÛŒÚ©Ú¾ÛŒÚº';

  @override
  String notificationTaskReminderBody(String label) {
    return '$label';
  }

  @override
  String get notificationFinalCallBodyOne =>
      'Ø¢Ù¾ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ù¾Ø± 1 Ú©Ø§Ù… Ø¨Ø§Ù‚ÛŒ ÛÛ’Û” Ø±Ø§Øª Ù‚Ø±ÛŒØ¨ ÛÛ’Û”';

  @override
  String notificationFinalCallBodyMany(int count) {
    return 'Ø¢Ù¾ Ú©ÛŒ Ø²Ù†Ø¬ÛŒØ± Ù¾Ø± $count Ú©Ø§Ù… Ø¨Ø§Ù‚ÛŒ ÛÛŒÚºÛ” Ø±Ø§Øª Ù‚Ø±ÛŒØ¨ ÛÛ’Û”';
  }

  @override
  String get notificationEveningBodyOne =>
      'Ø¢Ø¬ Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ 1 Ú©Ø§Ù… Ú©Ú¾Ù„Ø§ ÛÛ’Û”';

  @override
  String notificationEveningBodyMany(int count) {
    return 'Ø¢Ø¬ Ø§Ø¨Ú¾ÛŒ Ø¨Ú¾ÛŒ $count Ú©Ø§Ù… Ú©Ú¾Ù„Û’ ÛÛŒÚºÛ”';
  }

  @override
  String get notificationTickerTaskReminder => 'Ú©Ø§Ù… Ú©ÛŒ ÛŒØ§Ø¯ Ø¯ÛØ§Ù†ÛŒ';

  @override
  String get notificationTickerTaskAlarm => 'Ú©Ø§Ù… Ú©Ø§ Ø§Ù„Ø§Ø±Ù…';

  @override
  String habitBloomSubtitleL10n(int count, String element) {
    return '$count Ø¯Ù† Ú©ÛŒ Ø§Ø³Ù¹Ø±ÛŒÚ© Â· $element';
  }
}
