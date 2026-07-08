// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਬਲੂਮ ਟਰੈਕਰ';

  @override
  String get tabToday => 'ਅੱਜ';

  @override
  String get tabProgress => 'ਤਰੱਕੀ';

  @override
  String get tabYou => 'ਤੁਸੀਂ';

  @override
  String get navMyDay => 'ਮੇਰਾ ਦਿਨ';

  @override
  String get navSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get navHelp => 'ਮਦਦ ਅਤੇ ਸਹਾਇਤਾ';

  @override
  String get navHistory => 'ਪਿਛਲੇ 7 ਦਿਨ';

  @override
  String get navLeftBehind => 'ਪਿੱਛੇ ਛੱਡੇ';

  @override
  String get navInsights => 'ਤੁਹਾਡੀ ਤਰੱਕੀ';

  @override
  String get navMedals => 'ਮੇਰੇ ਤਗਮੇ';

  @override
  String get navManagePro => 'Pro ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਦਾ ਪ੍ਰਬੰਧਨ';

  @override
  String get navPaywall => 'ਬਲੂਮ ਟਰੈਕਰ Pro';

  @override
  String get greetingLateNight => 'ਅੱਧੀ ਰਾਤ ਨੂੰ ਜਾਗਦੇ ਹੋ';

  @override
  String get greetingMorning => 'ਸ਼ੁਭ ਸਵੇਰ, ਸੂਰਜ!';

  @override
  String get greetingAfternoon => 'ਸ਼ੁਭ ਦੁਪਹਿਰ, ਦੋਸਤ';

  @override
  String get greetingEvening => 'ਸ਼ੁਭ ਸ਼ਾਮ, ਚੈਂਪੀਅਨ';

  @override
  String get greetingNight => 'ਚੰਗੀ ਨੀਂਦ, ਸਰਪ੍ਰਸਤ?';

  @override
  String todayTasksCount(String done, String total) {
    return 'ਅੱਜ · $total ਵਿੱਚੋਂ $done ਕੰਮ';
  }

  @override
  String todayHabitsCount(String done, String total) {
    return '$total ਵਿੱਚੋਂ $done ਆਦਤਾਂ';
  }

  @override
  String get todayChainGrows => 'ਚੇਨ ਤੁਹਾਡੇ ਪੂਰਾ ਕਰਨ ਨਾਲ ਵਧਦੀ ਹੈ';

  @override
  String get todayChainComplete => 'ਚੇਨ ਪੂਰੀ · ਕੱਲ ਬਗੀਚੇ ਦੀ ਦੇਖਭਾਲ ਕਰੋ';

  @override
  String get taskCapInfo => '5-ਕੰਮ ਦੀ ਸੀਮਾ ਕਿਉਂ?';

  @override
  String get taskCapDiscipline => 'ਅਨੁਸ਼ਾਸਨ ਪਹਿਲਾਂ, ਡਿਜ਼ਾਈਨ ਅਨੁਸਾਰ';

  @override
  String get taskCapTitle =>
      'ਅਸੀਂ ਜਾਣਬੁੱਝ ਕੇ ਤੁਹਾਡਾ ਦਿਨ 5 ਕੰਮਾਂ ਤੱਕ ਸੀਮਿਤ ਕਰਦੇ ਹਾਂ।';

  @override
  String get taskCapBody =>
      'ਛੋਟੀਆਂ ਚੇਨਾਂ ਲੰਬੀਆਂ ਨਾਲੋਂ ਬਿਹਤਰ ਹਨ। 5 ਵਿੱਚੋਂ 3 ਪੂਰੇ ਕਰਨ ਦੀ ਜਿੱਤ ਮਹਿਸੂਸ ਕਰਨਾ 10 ਵਿੱਚੋਂ 8 ਛੱਡਣ ਦੇ ਨੁਕਸਾਨ ਨਾਲੋਂ ਵੱਧ ਸੰਭਵ ਹੈ।';

  @override
  String get taskCapBulletDone => 'ਪੂਰੇ ਕੰਮ ਤੁਹਾਡੀ ਚੇਨ ਵਿੱਚ ਗਿਣੇ ਜਾਂਦੇ ਹਨ';

  @override
  String get taskCapBulletDoneBody =>
      'ਜਿਸ ਦਿਨ ਸਾਰੇ 5 ਪੂਰੇ ਹੋ ਜਾਂਦੇ ਹਨ, ਤੁਹਾਡੀ ਸਟ੍ਰੀਕ ਇੱਕ ਦਿਨ ਵਧ ਜਾਂਦੀ ਹੈ।';

  @override
  String get taskCapBulletMissed => 'ਛੁਟੇ ਕੰਮ ਪਿੱਛੇ ਛੱਡੇ ਵਿੱਚ ਜਾਂਦੇ ਹਨ';

  @override
  String get taskCapBulletMissedBody =>
      'ਅੱਧੀ ਰਾਤ ਨੂੰ, ਬਕਾਇਆ ਕੰਮ ਪਿੱਛੇ ਛੱਡੇ ਵਿੱਚ ਸਤਹ ਤੇ ਆ ਜਾਂਦੇ ਹਨ। ਸਿਰਫ਼ ਉਹ ਨੂੰ ਹੀ ਮੁੜ ਜੋੜੋ ਜੋ ਅਜੇ ਵੀ ਮਹੱਤਵਪੂਰਨ ਹਨ।';

  @override
  String get taskCapBulletFreeze => 'ਸਟ੍ਰੀਕ ਫ੍ਰੀਜ਼ ਇੱਕ ਛੁਟ ਨੂੰ ਮਾਫ਼ ਕਰਦੀ ਹੈ';

  @override
  String get taskCapBulletFreezeBody =>
      'Pro ਤੁਹਾਨੂੰ ਮਹੀਨੇ ਵਿੱਚ 2 ਸਟ੍ਰੀਕ ਫ੍ਰੀਜ਼ ਦਿੰਦਾ ਹੈ — ਇਹ ਇੱਕ ਛੁੱਟੇ ਦਿਨ ਨੂੰ ਕਵਰ ਕਰਦੇ ਹਨ ਤਾਂ ਕਿ ਤੁਹਾਡੀ ਚੇਨ ਜ਼ਿੰਦਾ ਰਹੇ।';

  @override
  String get tasksHeader => 'ਕੰਮ';

  @override
  String tasksProgressCount(String done, String total) {
    return '$done / $total';
  }

  @override
  String get tasksAddSeed => 'ਕੰਮ ਦਾ ਬੀਜ ਜੋੜੋ';

  @override
  String get tasksCapReached =>
      '5/5 ਸਲਾਟ ਵਰਤੇ ਗਏ — ਨਵਾਂ ਬੀਜ ਲਗਾਉਣ ਲਈ ਇੱਕ ਪੂਰਾ ਕਰੋ।';

  @override
  String get tasksEmptyCta => 'ਆਪਣਾ ਪਹਿਲਾ ਬੀਜ ਲਗਾਓ — ਅੱਜ ਕੀ ਮਹੱਤਵਪੂਰਨ ਹੈ?';

  @override
  String get habitsHeader => 'ਆਦਤਾਂ';

  @override
  String habitsGrowing(String count) {
    return '$count ਵਧ ਰਹੇ ਹਨ';
  }

  @override
  String habitsBestStreak(String days) {
    return 'ਵਧੀਆ $days ਦਿਨ';
  }

  @override
  String get habitsPlantNew => 'ਨਵੀਂ ਆਦਤ ਦਾ ਅੰਕੁਰ ਲਗਾਓ';

  @override
  String get habitsPlantFirst => 'ਆਦਤ ਲਗਾਓ';

  @override
  String get habitsLocked => 'Pro ਆਦਤ ਸਲਾਟ — ਹੋਰ ਅੰਕੁਰ ਲਗਾਉਣ ਲਈ ਅਨਲੌਕ ਕਰੋ';

  @override
  String get habitsCadence => 'ਰੋਜ਼ਾਨਾ';

  @override
  String leftBehindBanner(String count) {
    return '$count ਛੁੱਟੇ — ਅਜੇ ਵੀ ਪਿੱਛੇ ਛੱਡੇ ਵਿੱਚ';
  }

  @override
  String get leftBehindTap => 'ਮੁੜ ਜੋੜਨ ਜਾਂ ਛੱਡਣ ਲਈ ਟੈਪ ਕਰੋ';

  @override
  String get leftBehindDismiss => 'ਖਾਰਜ ਕਰੋ';

  @override
  String get leftBehindTitle => 'ਪਿੱਛੇ ਛੱਡੇ';

  @override
  String get leftBehindEmpty => 'ਕੁਝ ਵੀ ਪਿੱਛੇ ਨਹੀਂ ਛੱਡਿਆ';

  @override
  String get leftBehindEmptyBody =>
      'ਕੋਈ ਛੁੱਟਿਆ ਕੰਮ ਨਹੀਂ। ਤੁਸੀਂ ਜੋ ਬੀਜ ਲਗਾਉਂਦੇ ਹੋ ਉਹ ਸਾਰੇ ਸੰਭਾਲੇ ਜਾ ਰਹੇ ਹਨ। ਬਗੀਚਾ ਸਾਫ਼ ਹੈ।';

  @override
  String get leftBehindClearAll => 'ਸਭ ਸਾਫ਼ ਕਰੋ';

  @override
  String get leftBehindClearAllConfirm => 'ਸਾਰੇ ਪਿੱਛੇ ਛੱਡੇ ਸਾਫ਼ ਕਰੋ?';

  @override
  String leftBehindClearAllBody(String count) {
    return 'ਇਹ ਸਥਾਈ ਤੌਰ ਤੇ $count ਛੁੱਟੇ ਕੰਮ ਹਟਾ ਦੇਵੇਗਾ। ਤੁਸੀਂ ਇਸਨੂੰ ਅਣਡੋਲ ਨਹੀਂ ਕਰ ਸਕਦੇ।';
  }

  @override
  String get leftBehindReAdd => 'ਅੱਜ ਮੁੜ ਜੋੜੋ';

  @override
  String get leftBehindLetGo => 'ਛੱਡ ਦਿਓ';

  @override
  String streakAtRisk(String count) {
    return 'ਅੱਜ ਲਈ $count ਕੰਮ ਬਾਕੀ';
  }

  @override
  String streakAtRiskLastCall(String count) {
    return 'ਆਖਰੀ ਮੌਕਾ — $count ਕੰਮ ਅਜੇ ਵੀ ਖੁੱਲ੍ਹੇ ਹਨ';
  }

  @override
  String get streakAtRiskBody =>
      'ਅੱਧੀ ਰਾਤ ਨੇੜੇ ਹੈ। ਚੇਨ ਇਨ੍ਹਾਂ ਤੇ ਨਿਰਭਰ ਕਰਦੀ ਹੈ।';

  @override
  String get streakAtRiskBodyLow =>
      'ਤੁਹਾਡੇ ਕੋਲ ਅਜੇ ਵੀ ਸਮਾਂ ਹੈ। ਸਾਫ਼ ਦਿਨ ਤੁਹਾਡੀ ਸਟ੍ਰੀਕ ਵਧਾਉਂਦਾ ਹੈ।';

  @override
  String get streakAtRiskFreeze => 'ਕੱਲ੍ਹ ਛੁੱਟਿਆ — ਸਟ੍ਰੀਕ ਫ੍ਰੀਜ਼ ਵਰਤੋਂ?';

  @override
  String get chainBrokenTitle => 'ਚੇਨ ਟੁੱਟ ਗਈ। ਇਹ ਠੀਕ ਹੈ।';

  @override
  String get chainBrokenBody =>
      'ਹਰ ਲੰਬੀ ਚੇਨ ਇੱਕ ਵਾਰ ਖਤਮ ਹੁੰਦੀ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਇਹ ਹੈ ਕਿ ਤੁਸੀਂ ਅੱਜ ਕੀ ਲਗਾਉਂਦੇ ਹੋ। ਇੱਕ ਸੰਪੂਰਨ ਦਿਨ ਅਗਲੇ ਦੀ ਸ਼ੁਰੂਆਤ ਹੈ।';

  @override
  String get chainBrokenCta => 'ਅੱਜ ਵਾਪਸ ਜਾਓ';

  @override
  String get chainBrokenCheck => 'ਪਹਿਲਾਂ ਪਿੱਛੇ ਛੱਡੇ ਚੈੱਕ ਕਰੋ';

  @override
  String get chainBrokenBestChain => 'ਵਧੀਆ ਚੇਨ';

  @override
  String get chainBrokenTasksDone => 'ਕੰਮ ਪੂਰੇ ਕੀਤੇ';

  @override
  String get chainBrokenSprouts => 'ਅੰਕੁਰ';

  @override
  String get chainRecoveryFreshStart => 'ਨਵੀਂ ਸ਼ੁਰੂਆਤ';

  @override
  String get medalsTitle => 'ਮੇਰੇ ਤਗਮੇ';

  @override
  String get medalsTrophyRoom => 'ਟਰਾਫੀ ਕਮਰਾ';

  @override
  String get medalsAllMedals => 'ਸਾਰੇ ਤਗਮੇ';

  @override
  String medalsTrophyEarned(String earned, String total) {
    return '$total ਵਿੱਚੋਂ $earned ਤਮਗੇ ਜਿੱਤੇ';
  }

  @override
  String get medalsTrophyEmpty => 'ਤੁਹਾਡਾ ਪਹਿਲਾ ਬੈਜ ਸਿਰਫ਼ ਇੱਕ ਕੰਮ ਦੂਰ ਹੈ';

  @override
  String get medalsTrophyFirst => 'ਤੁਸੀਂ ਆਪਣਾ ਪਹਿਲਾ ਤਮਗਾ ਜਿੱਤਿਆ — ਜਾਰੀ ਰੱਖੋ';

  @override
  String medalsTrophyMany(String earned) {
    return 'ਤੁਹਾਡੇ ਟਰਾਫੀ ਕਮਰੇ ਵਿੱਚ $earned ਤਮਗੇ';
  }

  @override
  String medalsProgressLabel(String total) {
    return 'ਸਾਰੇ $total ਤਮਗਿਆਂ ਵੱਲ ਤਰੱਕੀ';
  }

  @override
  String get medalsShareCta => 'ਸ਼ੇਅਰ ਕਰਨ ਯੋਗ ਕਾਰਡ ਬਣਾਓ';

  @override
  String get medalsEmptyTitle => 'ਇਸ ਸ਼੍ਰੇਣੀ ਵਿੱਚ ਅਜੇ ਕੁਝ ਨਹੀਂ ਹੈ';

  @override
  String get medalsEmptyBody =>
      'ਆਪਣਾ ਟਰਾਫੀ ਕਮਰਾ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਕੋਈ ਕੰਮ ਪੂਰਾ ਕਰੋ ਜਾਂ ਕੋਈ ਅੰਕੁਰ ਸੰਭਾਲੋ।';

  @override
  String get medalSheetLocked => 'Pro ਤਗਮਾ';

  @override
  String medalSheetEarned(String tier) {
    return 'ਜਿੱਤਿਆ · $tier';
  }

  @override
  String get medalSheetUnlock => 'Pro ਨਾਲ ਅਨਲੌਕ ਕਰੋ';

  @override
  String get medalSheetProgress => 'ਤਰੱਕੀ';

  @override
  String medalSheetHint(String n, String unit) {
    return 'ਅਨਲੌਕ ਕਰਨ ਲਈ $n ਹੋਰ $unit।';
  }

  @override
  String get medalSheetAlmost => 'ਅਨਲੌਕ ਕਰਨ ਲਈ ਇੱਕ ਹੋਰ ਕਦਮ।';

  @override
  String get medalCategory => 'ਸ਼੍ਰੇਣੀ';

  @override
  String get medalShareOnSocials => 'ਸੋਸ਼ਲ ਉੱਤੇ ਸ਼ੇਅਰ ਕਰੋ';

  @override
  String get medalShareLater => 'ਬਾਅਦ ਵਿੱਚ';

  @override
  String get medalUnlocked => 'ਤਗਮਾ ਅਨਲੌਕ ਹੋਇਆ';

  @override
  String get medalProgressTitle => 'ਤਰੱਕੀ';

  @override
  String get historyTitle => 'ਪਿਛਲੇ 7 ਦਿਨ';

  @override
  String historyThisWeek(String days) {
    return 'ਪਿਛਲੇ $days ਦਿਨ';
  }

  @override
  String get historyDayByDay => 'ਦਿਨ ਬਾ ਦਿਨ';

  @override
  String get historyEmpty => 'ਆਪਣਾ ਹਫ਼ਤਾ ਖੁੱਲ੍ਹਦਾ ਦੇਖਣ ਲਈ ਕੁਝ ਬੀਜ ਲਗਾਓ।';

  @override
  String historyDoneCount(String done, String total, String perfect) {
    return 'ਤੁਸੀਂ $total ਵਿੱਚੋਂ $done ਕੰਮ ਪੂਰੇ ਕੀਤੇ। $perfect ਸੰਪੂਰਨ ਦਿਨ।';
  }

  @override
  String get historyUpsellTitle => 'ਆਪਣਾ ਪੂਰਾ ਇਤਿਹਾਸ ਵੇਖੋ';

  @override
  String get historyUpsellBody => 'Pro 30 ਦਿਨਾਂ ਦਾ ਇਤਿਹਾਸ ਅਨਲੌਕ ਕਰਦਾ ਹੈ।';

  @override
  String get historyPerfect => 'ਸੰਪੂਰਨ';

  @override
  String get historyFrozen => 'ਜੰਮਿਆ';

  @override
  String get historyToday => 'ਅੱਜ';

  @override
  String get historyEmptyDay => 'ਉਸ ਦਿਨ ਕੋਈ ਬੀਜ ਨਹੀਂ ਲਗਾਇਆ ਗਿਆ';

  @override
  String historyLeftBehindCount(String count) {
    return '$count ਪਿੱਛੇ ਛੱਡੇ';
  }

  @override
  String get progressVitality => 'ਅੱਜ ਦੀ ਜੀਵਨ ਸ਼ਕਤੀ';

  @override
  String get progressVitalityEmpty => 'ਆਪਣਾ ਬਗੀਚਾ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਇੱਕ ਬੀਜ ਲਗਾਓ।';

  @override
  String progressVitalitySeeds(String done, String total) {
    return 'ਅੱਜ $total ਵਿੱਚੋਂ $done ਬੀਜ ਲਗਾਏ ਗਏ।';
  }

  @override
  String progressChainPill(String days) {
    return '$daysਦਿਨ ਦੀ ਜੰਜੀਰ';
  }

  @override
  String get progressMetricCurrent => 'ਮੌਜੂਦਾ';

  @override
  String get progressMetricBest => 'ਵਧੀਆ';

  @override
  String get progressMetricDone => 'ਪੂਰਾ';

  @override
  String get progressMetricPerfect => 'ਸੰਪੂਰਨ';

  @override
  String get progressMetricHabits => 'ਆਦਤਾਂ';

  @override
  String get progressHabitBlooms => 'Habit blooms';

  @override
  String get progressHabitBloomsSub =>
      'Streak milestones for the sprouts you water daily.';

  @override
  String get progressNextBadge => 'ਅਗਲਾ ਬੈਜ';

  @override
  String progressMedalCount(String earned, String total) {
    return '$total ਵਿੱਚੋਂ $earned';
  }

  @override
  String get progressPersonalActivity => 'ਨਿੱਜੀ ਗਤੀਵਿਧੀ';

  @override
  String progressBrowseMonth(String month) {
    return '$month ਵੇਖ ਰਹੇ ਹੋ। ਆਪਣੀ ਲਾਈਵ ਗਤੀਵਿਧੀ ਤੇ ਵਾਪਸ ਜਾਣ ਲਈ \"ਅੱਜ\" ਟੈਪ ਕਰੋ।';
  }

  @override
  String get progressJumpToToday => 'ਅੱਜ';

  @override
  String get progressCalendarLegend => 'ਗੂੜ੍ਹਾ = ਵੱਧ ਪੂਰੇ';

  @override
  String get progressCalendarBody =>
      'ਗੂੜ੍ਹਾ ਹਰਾ ਸੰਪੂਰਨ ਦਿਨ ਦਰਸਾਉਂਦਾ ਹੈ। ਛੁਟਣ ਨਾਲ ਰੰਗ ਫਿੱਕਾ ਹੁੰਦਾ ਜਾਂਦਾ ਹੈ।';

  @override
  String get paywallTitle => 'ਚੇਨ ਨੂੰ ਅਟੁੱਟ ਰੱਖੋ।';

  @override
  String get paywallSubtitle =>
      'Bloom Tracker Pro ਤੁਹਾਨੂੰ ਪੂਰੀ ਅਨੁਸ਼ਾਸਨ ਪ੍ਰਣਾਲੀ ਦਿੰਦਾ ਹੈ।';

  @override
  String get paywallFeatures =>
      'ਸਾਰੇ 5 ਆਦਤ ਸਲਾਟ, ਸਿਰਫ਼ 3 ਨਹੀਂ|ਤੁਹਾਡਾ ਪੂਰਾ ਇਤਿਹਾਸ, ਹਮੇਸ਼ਾ|ਪੂਰਾ ਤਮਗਾ ਸੈੱਟ|ਹਰ ਮਹੀਨੇ ਸਟ੍ਰੀਕ ਫ੍ਰੀਜ਼|ਹਫਤਾਵਾਰੀ ਰਸੀਦ + ਸ਼ੇਅਰ ਕਾਰਡ|ਥੀਮ + ਹੋਰ';

  @override
  String get paywallFeaturesBodies =>
      'Free ਵਿੱਚ 3 ਹਨ। Pro ਸਾਰੇ 5 ਅਨਲੌਕ ਕਰਦਾ ਹੈ ਤਾਂ ਕਿ ਤੁਹਾਡੀ ਪੂਰੀ ਰੋਜ਼ਾਨਾ ਰਸਮ ਇੱਥੇ ਰਹਿ ਸਕੇ।|ਤੁਸੀਂ ਜੋ ਵੀ ਦਿਨ ਪੂਰੇ ਕੀਤੇ ਹਨ — ਸਿਰਫ਼ ਪਿਛਲੇ 7 ਹੀ ਨਹੀਂ। ਸਾਲਾਂ ਪਿੱਛੇ ਵੇਖੋ, ਹਫ਼ਤੇ ਨਹੀਂ।|Legendary ਪੱਧਰ ਦੇ ਤਮਗੇ ਅਨਲੌਕ ਕਰੋ। ਸਭ ਤੋਂ ਦੁਰਲੱਭ ਬੈਜ ਉਨ੍ਹਾਂ ਲਈ ਹਨ ਜੋ ਪੂਰੀ ਤਰ੍ਹਾਂ ਜਾਂਦੇ ਹਨ।|ਮਹੀਨੇ ਵਿੱਚ 2 ਸਟ੍ਰੀਕ ਫ੍ਰੀਜ਼ ਤਾਂ ਕਿ ਇੱਕ ਮਾੜਾ ਦਿਨ ਤੁਹਾਡੀ ਚੇਨ ਖਤਮ ਨਾ ਕਰੇ।|ਤੁਹਾਡੇ ਹਫ਼ਤੇ ਦੇ ਸੁੰਦਰ ਸ਼ੇਅਰ ਕਾਰਡ। ਆਪਣੀ ਚੇਨ ਪੋਸਟ ਕਰੋ, ਕਿਸੇ ਹੋਰ ਨੂੰ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਪ੍ਰੇਰਿਤ ਕਰੋ।|ਜਿਵੇਂ ਜਿਵੇਂ ਅਸੀਂ ਨਵੇਂ ਰੰਗ ਅਤੇ ਥੀਮ ਜੋੜਦੇ ਹਾਂ ਉਨ੍ਹਾਂ ਨੂੰ ਅਨਲੌਕ ਕਰੋ। ਹਮੇਸ਼ਾ ਮੁਫ਼ਤ ਅਪਡੇਟ।';

  @override
  String get paywallYearly => 'ਸਾਲਾਨਾ';

  @override
  String get paywallYearlyCaption => 'ਵਧੀਆ ਕੀਮਤ · ਲਗਭਗ ~2.50 USD/ਮਹੀਨਾ';

  @override
  String get paywallYearlyBadge => '35% ਬਚਤ';

  @override
  String get paywallMonthly => 'ਮਾਸਿਕ';

  @override
  String get paywallMonthlyCaption => 'ਹਰ ਮਹੀਨੇ ਬਿੱਲ · ਕਦੇ ਵੀ ਰੱਦ ਕਰੋ';

  @override
  String paywallStartCta(String price) {
    return 'Pro ਸ਼ੁਰੂ ਕਰੋ · $price/ਸਾਲ';
  }

  @override
  String paywallStartCtaMonthly(String price) {
    return 'Pro ਸ਼ੁਰੂ ਕਰੋ · $price/ਮਹੀਨਾ';
  }

  @override
  String get paywallRestore => 'ਖਰੀਦ ਮੁੜ ਬਹਾਲ ਕਰੋ';

  @override
  String get paywallTerms => 'ਨਿਯਮ';

  @override
  String get paywallPrivacy => 'ਨਿੱਜਤਾ';

  @override
  String get paywallNoRestore => 'ਇਸ ਖਾਤੇ ਤੇ ਕੋਈ ਪਿਛਲੀ ਖਰੀਦ ਨਹੀਂ ਮਿਲੀ।';

  @override
  String get paywallRestoreLater =>
      'ਅਸੀਂ ਅਗਲੀ ਸਿੰਕ ਤੇ ਤੁਹਾਡੀ ਖਰੀਦ ਮੁੜ ਬਹਾਲ ਕਰਾਂਗੇ।';

  @override
  String get paywallAlreadyPro => 'ਤੁਸੀਂ Pro ਤੇ ਹੋ। ਸਹਿਯੋਗ ਲਈ ਧੰਨਵਾਦ।';

  @override
  String get paywallHabitSlotHead =>
      'ਤੁਸੀਂ ਆਪਣੇ ਸਾਰੇ ਮੁਫ਼ਤ ਆਦਤ ਸਲਾਟ ਵਰਤ ਲਏ ਹਨ। ਹਰ ਉਸ ਰਸਮ ਨੂੰ ਲਗਾਉਣ ਲਈ ਪੂਰਾ ਸੈੱਟ ਅਨਲੌਕ ਕਰੋ ਜੋ ਤੁਹਾਡੇ ਲਈ ਮਹੱਤਵਪੂਰਨ ਹੈ।';

  @override
  String get paywallHistoryHead =>
      'ਆਪਣਾ ਪੂਰਾ ਇਤਿਹਾਸ ਵੇਖੋ — ਹਰ ਸੰਪੂਰਨ ਦਿਨ, ਹਰ ਤਮਗਾ, ਹਰ ਵਾਪਸੀ।';

  @override
  String get paywallMedalHead =>
      'ਸਭ ਤੋਂ ਦੁਰਲੱਭ ਤਮਗੇ Pro-ਮਾਤਰ ਹਨ। ਜਾਰੀ ਰੱਖੋ — ਉਹ ਜਿੰਨਾ ਤੁਸੀਂ ਸੋਚਦੇ ਹੋ ਉਸ ਤੋਂ ਕਿ ਨੇੜੇ ਹਨ।';

  @override
  String get settingsYourActivity => 'ਤੁਹਾਡੀ ਗਤੀਵਿਧੀ';

  @override
  String get settingsHelpInfo => 'ਮਦਦ ਅਤੇ ਜਾਣਕਾਰੀ';

  @override
  String get settingsAccount => 'ਖਾਤਾ';

  @override
  String get settingsNurturingTools => 'ਸੰਭਾਲ ਸੰਦ';

  @override
  String get settingsReminders => 'ਰਿਮਾਈਂਡਰ';

  @override
  String get settingsWidgetSanctuary => 'ਵਿਜੇਟ ਅਸ਼ਰਮ';

  @override
  String get settingsEcosystemSupport => 'ਈਕੋਸਿਸਟਮ ਸਹਾਇਤਾ';

  @override
  String get settingsHowItWorks => 'ਇਹ ਕਿਵੇਂ ਕੰਮ ਕਰਦਾ ਹੈ';

  @override
  String get settingsSignOut => 'ਸਾਈਨ ਆਉਟ';

  @override
  String get settingsProActive => 'ਸਰਗਰਮ';

  @override
  String get settingsProFree => 'Free ਪੱਧਰ';

  @override
  String get settingsLanguage => 'ਭਾਸ਼ਾ';

  @override
  String get settingsLanguageValue => 'ਸਿਸਟਮ ਡਿਫਾਲਟ';

  @override
  String get firstRunGreeting =>
      '5 ਕੰਮ। ਇਸ ਤੋਂ ਵੱਧ ਨਹੀਂ। ਇਨ੍ਹਾਂ ਨੂੰ ਮਹੱਤਵ ਦਿਓ।';

  @override
  String get firstRunBody =>
      'ਆਪਣਾ ਪਹਿਲਾ ਬੀਜ ਲਗਾਓ — ਅੱਜ ਸਭ ਤੋਂ ਮਹੱਤਵਪੂਰਨ ਕੀ ਹੈ?';

  @override
  String get firstRunCta => 'ਆਪਣਾ ਪਹਿਲਾ ਬੀਜ ਲਗਾਓ';

  @override
  String get emptyStateClearAll => 'ਸਭ ਸਾਫ਼ ਕਰੋ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get intentionTitle1 => 'ਆਓ ਨਵੀਂ ਇੱਛਾ ਲਗਾਈਏ!';

  @override
  String get intentionBody1 =>
      'ਹਰ ਵੱਡਾ ਜੰਗਲ ਇੱਕ ਛੋਟੇ ਚੋਣ ਤੋਂ ਸ਼ੁਰੂ ਹੁੰਦਾ ਹੈ। ਦੱਸੋ ਅੱਜ ਅਸੀਂ ਕੀ ਸੰਭਾਲ ਰਹੇ ਹਾਂ?';

  @override
  String get intentionTitle2 => 'ਅੱਜ ਕੀ ਉਗਾਈਏ?';

  @override
  String get intentionBody2 =>
      'ਛੋਟੇ ਬੀਜ, ਧਿਆਨ ਨਾਲ ਸੰਭਾਲੇ ਜਾਣ ਤਾਂ ਉੱਚੇ ਦਰੱਖਤ ਬਣਦੇ ਹਨ। ਇਸ ਵੇਲੇ ਸਭ ਤੋਂ ਮਹੱਤਵਪੂਰਨ ਇੱਕ ਚੁਣੋ।';

  @override
  String get intentionTitle3 => 'ਇੱਕ ਬੀਜ। ਇੱਕ ਸਾਹ। ਸ਼ੁਰੂ ਕਰੋ।';

  @override
  String get intentionBody3 =>
      'ਤੁਹਾਨੂੰ ਇੱਕੋ ਵਾਰ ਪੂਰਾ ਜੰਗਲ ਨਹੀਂ ਲਗਾਉਣਾ — ਸਿਰਫ਼ ਅਗਲਾ ਸਹੀ ਕੰਮ।';

  @override
  String get intentionTitle4 => 'ਅਗਲਾ ਛੋਟਾ ਕਦਮ ਸੰਭਾਲੋ।';

  @override
  String get intentionBody4 =>
      'ਅਗਲੇ 5 ਮਿੰਟ ਵਿੱਚ ਤੁਸੀਂ ਜੋ ਚੋਣਾਂ ਕਰਦੇ ਹੋ ਉਨ੍ਹਾਂ ਤੋਂ ਭਵਿੱਖ ਦੀ ਤੁਹਾਡੀ ਸ਼ਖਸੀਅਤ ਬਣਦੀ ਹੈ। ਇੱਕ ਦਰਿਆਵਰ ਵਾਲੀ ਕੋਈ ਇੱਕ ਚੋਣ ਕਿਹੜੀ ਹੈ?';

  @override
  String get intentionTitle5 => 'ਚੁਣੋ ਕਿ ਤੁਸੀਂ ਕੀ ਬਣਨਾ ਚਾਹੁੰਦੇ ਹੋ।';

  @override
  String get intentionBody5 =>
      'ਕੰਮ ਬੀਜ ਹਨ, ਆਦਤਾਂ ਅੰਕੁਰ ਹਨ। ਮਿਲ ਕੇ ਉਹ ਜੰਗਲ ਬਣਾਉਂਦੇ ਹਨ ਜਿਸ ਤੇ ਤੁਸੀਂ ਮਾਣ ਕਰੋ।';

  @override
  String get intentionTitle6 => 'ਯਾਦ ਰੱਖਣ ਯੋਗ ਕੁਝ ਲਗਾਓ।';

  @override
  String get intentionBody6 =>
      'ਹਰ ਦਿਨ ਵੱਡਾ ਨਹੀਂ ਲੱਗੇਗਾ। ਪਾਣੀ ਪਿਲਾਇਆ ਬੀਜ ਵੀ ਗਿਣਦਾ ਹੈ। ਆਓ ਇੱਕ ਨਾਮ ਦੇਈਏ।';

  @override
  String get intentionTitle7 => 'ਅੱਜ ਨੂੰ ਥੋੜਾ ਹਿੰਮਤ ਬਣਾਓ।';

  @override
  String get intentionBody7 =>
      'ਹਿੰਮਤ ਸੰਚਿਤ ਹੁੰਦੀ ਹੈ। ਉਹ ਬੀਜ ਚੁਣੋ ਜੋ ਤੁਸੀਂ ਟਾਲ ਰਹੇ ਹੋ — ਇਸ ਨੂੰ ਨਾਮ ਦੇਣਾ ਵੀ ਅੱਗੇ ਵਧਾਉਂਦਾ ਹੈ।';

  @override
  String get intentionTitle8 => 'ਬੀਜ ਤੋਂ ਪਹਿਲਾਂ ਮਿੱਟੀ ਸੰਭਾਲੋ।';

  @override
  String get intentionBody8 =>
      'ਕਿਹੜੀ ਮਾਨਸਿਕਤਾ, ਸੰਦ ਜਾਂ ਛੋਟੀ ਰਸਮ ਇਸ ਕੰਮ ਨੂੰ ਆਸਾਨ ਬਣਾਏਗੀ? ਇਸ ਨੂੰ ਨੋਟਸ ਵਿੱਚ ਜੋੜੋ।';

  @override
  String get shareCardSnapshot => 'ਤੁਹਾਡੇ ਅਸ਼ਰਮ ਦੀ ਇੱਕ ਝਲਕ';

  @override
  String get shareCardBody =>
      'ਉੱਪਰ ਦਾ ਕਾਰਡ PNG ਵਜੋਂ ਐਕਸਪੋਰਟ ਕੀਤਾ ਗਿਆ ਹੈ ਅਤੇ ਤੁਹਾਡੀ ਸ਼ੇਅਰ ਸ਼ੀਟ ਤੇ ਭੇਜਿਆ ਗਿਆ ਹੈ। ਆਪਣੀ ਸਟੋਰੀ ਤੇ ਪੋਸਟ ਕਰੋ, ਕਿਸੇ ਦੋਸਤ ਨੂੰ ਭੇਜੋ, ਜਾਂ ਸਟਿੱਕਰ ਦੇ ਤੌਰ ਤੇ ਪ੍ਰਿੰਟ ਕਰੋ।';

  @override
  String get shareCardShareMyBloom => 'ਮੇਰਾ ਬਲੂਮ ਸ਼ੇਅਰ ਕਰੋ';

  @override
  String get shareCardCouldNotShare => 'ਹੁਣ ਸ਼ੇਅਰ ਨਹੀਂ ਕਰ ਸਕਿਆ';

  @override
  String shareCardProgressText(String year) {
    return 'ਮੇਰੀ Bloom Tracker ਤਰੱਕੀ — Bloom Tracker ਤੇ $year ਸਾਲ।';
  }

  @override
  String shareCardMedalText(String title, String subtitle) {
    return 'ਮੈਂ ਹੁਣੇ Bloom Tracker ਤੇ \"$title\" ਤਮਗਾ ਅਨਲੌਕ ਕੀਤਾ। $subtitle';
  }

  @override
  String get howItWorksTitle => 'ਇਹ ਕਿਵੇਂ ਕੰਮ ਕਰਦਾ ਹੈ';

  @override
  String get howItWorksBody =>
      'Bloom Tracker ਤੁਹਾਡੀ ਛੋਟੀ, ਅਟੁੱਟ ਅਨੁਸ਼ਾਸਨ ਦੀ ਚੇਨ ਬਣਾਈ ਰੱਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ। ਬੱਸ ਇਹੀ।';

  @override
  String get howItWorksToday => 'ਅੱਜ ਟੈਬ';

  @override
  String get howItWorksTodayBody =>
      'ਇਹ ਤੁਹਾਡਾ ਘਰ ਹੈ। ਇਹ ਅੱਜ ਦੇ 5 ਕੰਮ ਅਤੇ ਆਦਤਾਂ ਦਿਖਾਉਂਦਾ ਹੈ। ਅੱਧੀ ਰਾਤ ਤੱਕ ਪੂਰੇ ਕਰੋ, ਚੇਨ ਵਧੇਗੀ।';

  @override
  String get howItWorksCap => '5-ਕੰਮ ਦੀ ਸੀਮਾ ਹੀ ਫੀਚਰ ਹੈ';

  @override
  String get howItWorksCapBody =>
      'ਅਸੀਂ 6ਵਾਂ ਨਹੀਂ ਜੋੜਨ ਦਿੰਦੇ। ਇਹੀ ਪੂਰੀ ਗੱਲ ਹੈ। ਛੋਟੀਆਂ ਚੇਨਾਂ ਲੰਬੀਆਂ ਨਾਲੋਂ ਬਿਹਤਰ ਹਨ। ਪੂਰੇ ਕਾਰਨ ਲਈ ਹੋਮ ਸਕ੍ਰੀਨ ਤੇ \"?\" ਟੈਪ ਕਰੋ।';

  @override
  String get howItWorksHabits => 'ਆਦਤਾਂ ਰੋਜ਼ਾਨਾ ਹੁੰਦੀਆਂ ਹਨ, ਚੇਨ ਹਮੇਸ਼ਾ ਲਈ';

  @override
  String get howItWorksHabitsBody =>
      'ਆਦਤਾਂ (ਸਵੇਰ ਦੀ ਯੋਗਾ, ਪਾਣੀ ਪੀਣਾ) ਹਮੇਸ਼ਾ ਲਈ ਰਹਿੰਦੀਆਂ ਹਨ। ਕੰਮ ਇੱਕ ਵਾਰ ਦੇ ਹੁੰਦੇ ਹਨ। ਦੋਵੇਂ ਇੱਕੋ ਸਟ੍ਰੀਕ ਨੂੰ ਭਰਦੇ ਹਨ।';

  @override
  String get howItWorksLeftBehind => 'ਛੁੱਟੇ ਕੰਮ → ਪਿੱਛੇ ਛੱਡੇ';

  @override
  String get howItWorksLeftBehindBody =>
      'ਅੱਧੀ ਰਾਤ, ਬਕਾਇਆ ਕੰਮ ਪਿੱਛੇ ਛੱਡੇ ਵਿੱਚ ਚਲੇ ਜਾਂਦੇ ਹਨ। ਸਿਰਫ਼ ਉਹ ਨੂੰ ਮੁੜ ਜੋੜੋ ਜੋ ਅਜੇ ਵੀ ਮਹੱਤਵਪੂਰਨ ਹਨ। ਬਾਕੀ ਨੂੰ ਚੁੱਪਚਾਪ ਛੱਡ ਦਿਓ।';

  @override
  String get howItWorksProgress => 'ਤਰੱਕੀ ਟੈਬ';

  @override
  String get howItWorksProgressBody =>
      'ਸਟ੍ਰੀਕ, ਕੈਲੰਡਰ, ਤਮਗੇ, ਇਤਿਹਾਸ — ਸਮੇਂ ਨਾਲ ਤੁਸੀਂ ਕਿੰਨਾ ਕਰ ਰਹੇ ਹੋ ਇਸ ਬਾਰੇ ਸਭ ਕੁਝ। ਕੋਈ ਜ਼ਰੂਰੀ ਕੰਮ ਇੱਥੇ ਨਹੀਂ ਰਹਿੰਦਾ।';

  @override
  String get howItWorksYou => 'ਤੁਸੀਂ ਟੈਬ';

  @override
  String get howItWorksYouBody => 'ਤੁਹਾਡਾ ਖਾਤਾ, ਸੈਟਿੰਗਾਂ, ਸਾਈਨ ਆਊਟ। ਬੱਸ ਇਹੀ।';

  @override
  String get howItWorksRule =>
      'ਨਿਯਮ: 5 ਛੋਟੀਆਂ ਚੀਜ਼ਾਂ, ਹਰ ਰੋਜ਼, ਕੋਈ ਬਹਾਨੇ ਨਹੀਂ।';

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
