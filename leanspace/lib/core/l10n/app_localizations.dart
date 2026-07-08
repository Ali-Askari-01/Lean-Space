import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_ps.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_sd.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('pa'),
    Locale('ps'),
    Locale('pt'),
    Locale('sd'),
    Locale('tr'),
    Locale('ur')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Bloom Tracker'**
  String get appTitle;

  /// No description provided for @tabToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get tabToday;

  /// No description provided for @tabProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get tabProgress;

  /// No description provided for @tabYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get tabYou;

  /// No description provided for @navMyDay.
  ///
  /// In en, this message translates to:
  /// **'My Day'**
  String get navMyDay;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @navHelp.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get navHelp;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days'**
  String get navHistory;

  /// No description provided for @navLeftBehind.
  ///
  /// In en, this message translates to:
  /// **'Left Behind'**
  String get navLeftBehind;

  /// No description provided for @navInsights.
  ///
  /// In en, this message translates to:
  /// **'Your progress'**
  String get navInsights;

  /// No description provided for @navMedals.
  ///
  /// In en, this message translates to:
  /// **'My Medals'**
  String get navMedals;

  /// No description provided for @navManagePro.
  ///
  /// In en, this message translates to:
  /// **'Manage Pro subscription'**
  String get navManagePro;

  /// No description provided for @navPaywall.
  ///
  /// In en, this message translates to:
  /// **'Bloom Tracker Pro'**
  String get navPaywall;

  /// No description provided for @greetingLateNight.
  ///
  /// In en, this message translates to:
  /// **'Burning the midnight oil'**
  String get greetingLateNight;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Morning, Sunshine!'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon, Friend'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Evening, Champion'**
  String get greetingEvening;

  /// No description provided for @greetingNight.
  ///
  /// In en, this message translates to:
  /// **'Resting well, Guardian?'**
  String get greetingNight;

  /// No description provided for @todayTasksCount.
  ///
  /// In en, this message translates to:
  /// **'Today · {done} of {total} tasks'**
  String todayTasksCount(String done, String total);

  /// No description provided for @todayHabitsCount.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} habits'**
  String todayHabitsCount(String done, String total);

  /// No description provided for @todayChainGrows.
  ///
  /// In en, this message translates to:
  /// **'CHAIN GROWS AS YOU FINISH'**
  String get todayChainGrows;

  /// No description provided for @todayChainComplete.
  ///
  /// In en, this message translates to:
  /// **'CHAIN COMPLETE · TEND THE GARDEN TOMORROW'**
  String get todayChainComplete;

  /// No description provided for @taskCapInfo.
  ///
  /// In en, this message translates to:
  /// **'Why a 5-task cap?'**
  String get taskCapInfo;

  /// No description provided for @taskCapDiscipline.
  ///
  /// In en, this message translates to:
  /// **'DISCIPLINE-FIRST BY DESIGN'**
  String get taskCapDiscipline;

  /// No description provided for @taskCapTitle.
  ///
  /// In en, this message translates to:
  /// **'We cap your day at 5 tasks on purpose.'**
  String get taskCapTitle;

  /// No description provided for @taskCapBody.
  ///
  /// In en, this message translates to:
  /// **'Small chains beat long ones. You\'re more likely to finish 3 of 5 and feel the win than to abandon 8 of 10 and feel the loss.'**
  String get taskCapBody;

  /// No description provided for @taskCapBulletDone.
  ///
  /// In en, this message translates to:
  /// **'Done tasks count toward your chain'**
  String get taskCapBulletDone;

  /// No description provided for @taskCapBulletDoneBody.
  ///
  /// In en, this message translates to:
  /// **'A day where all 5 are done extends your streak by one.'**
  String get taskCapBulletDoneBody;

  /// No description provided for @taskCapBulletMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed tasks roll to Left Behind'**
  String get taskCapBulletMissed;

  /// No description provided for @taskCapBulletMissedBody.
  ///
  /// In en, this message translates to:
  /// **'At midnight, unfinished tasks surface in Left Behind. Re-add only what still matters.'**
  String get taskCapBulletMissedBody;

  /// No description provided for @taskCapBulletFreeze.
  ///
  /// In en, this message translates to:
  /// **'Streak freeze forgives a miss'**
  String get taskCapBulletFreeze;

  /// No description provided for @taskCapBulletFreezeBody.
  ///
  /// In en, this message translates to:
  /// **'Pro gives you 2 streak freezes a month — they cover a missed day so your chain survives.'**
  String get taskCapBulletFreezeBody;

  /// No description provided for @tasksHeader.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get tasksHeader;

  /// No description provided for @tasksProgressCount.
  ///
  /// In en, this message translates to:
  /// **'{done} / {total}'**
  String tasksProgressCount(String done, String total);

  /// No description provided for @tasksAddSeed.
  ///
  /// In en, this message translates to:
  /// **'Add a task seed'**
  String get tasksAddSeed;

  /// No description provided for @tasksCapReached.
  ///
  /// In en, this message translates to:
  /// **'5/5 slots used — finish one to plant a new seed.'**
  String get tasksCapReached;

  /// No description provided for @tasksEmptyCta.
  ///
  /// In en, this message translates to:
  /// **'Plant your first seed — what matters today?'**
  String get tasksEmptyCta;

  /// No description provided for @habitsHeader.
  ///
  /// In en, this message translates to:
  /// **'Habits'**
  String get habitsHeader;

  /// No description provided for @habitsGrowing.
  ///
  /// In en, this message translates to:
  /// **'{count} growing'**
  String habitsGrowing(String count);

  /// No description provided for @habitsBestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best {days} d'**
  String habitsBestStreak(String days);

  /// No description provided for @habitsPlantNew.
  ///
  /// In en, this message translates to:
  /// **'Plant a new habit sprout'**
  String get habitsPlantNew;

  /// No description provided for @habitsPlantFirst.
  ///
  /// In en, this message translates to:
  /// **'Plant a habit'**
  String get habitsPlantFirst;

  /// No description provided for @habitsLocked.
  ///
  /// In en, this message translates to:
  /// **'Pro habit slot — unlock to plant more sprouts'**
  String get habitsLocked;

  /// No description provided for @habitsCadence.
  ///
  /// In en, this message translates to:
  /// **'DAILY'**
  String get habitsCadence;

  /// No description provided for @leftBehindBanner.
  ///
  /// In en, this message translates to:
  /// **'{count} missed — still in Left Behind'**
  String leftBehindBanner(String count);

  /// No description provided for @leftBehindTap.
  ///
  /// In en, this message translates to:
  /// **'Tap to re-add or let go'**
  String get leftBehindTap;

  /// No description provided for @leftBehindDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get leftBehindDismiss;

  /// No description provided for @leftBehindTitle.
  ///
  /// In en, this message translates to:
  /// **'Left Behind'**
  String get leftBehindTitle;

  /// No description provided for @leftBehindEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing left behind'**
  String get leftBehindEmpty;

  /// No description provided for @leftBehindEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'No missed tasks. Every seed you plant is being tended. The garden is clean.'**
  String get leftBehindEmptyBody;

  /// No description provided for @leftBehindClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get leftBehindClearAll;

  /// No description provided for @leftBehindClearAllConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear all left-behind?'**
  String get leftBehindClearAllConfirm;

  /// No description provided for @leftBehindClearAllBody.
  ///
  /// In en, this message translates to:
  /// **'This will permanently remove {count} missed task(s). You can\'t undo this.'**
  String leftBehindClearAllBody(String count);

  /// No description provided for @leftBehindReAdd.
  ///
  /// In en, this message translates to:
  /// **'Re-add today'**
  String get leftBehindReAdd;

  /// No description provided for @leftBehindLetGo.
  ///
  /// In en, this message translates to:
  /// **'Let it go'**
  String get leftBehindLetGo;

  /// No description provided for @streakAtRisk.
  ///
  /// In en, this message translates to:
  /// **'{count} task(s) left for today'**
  String streakAtRisk(String count);

  /// No description provided for @streakAtRiskLastCall.
  ///
  /// In en, this message translates to:
  /// **'Last call — {count} task(s) still open'**
  String streakAtRiskLastCall(String count);

  /// No description provided for @streakAtRiskBody.
  ///
  /// In en, this message translates to:
  /// **'Midnight is close. The chain depends on these.'**
  String get streakAtRiskBody;

  /// No description provided for @streakAtRiskBodyLow.
  ///
  /// In en, this message translates to:
  /// **'You still have time. A clean day extends your streak.'**
  String get streakAtRiskBodyLow;

  /// No description provided for @streakAtRiskFreeze.
  ///
  /// In en, this message translates to:
  /// **'Yesterday missed — use a streak freeze?'**
  String get streakAtRiskFreeze;

  /// No description provided for @chainBrokenTitle.
  ///
  /// In en, this message translates to:
  /// **'The chain broke. That\'s okay.'**
  String get chainBrokenTitle;

  /// No description provided for @chainBrokenBody.
  ///
  /// In en, this message translates to:
  /// **'Every long chain ends once. What matters is what you plant today. One perfect day starts the next one.'**
  String get chainBrokenBody;

  /// No description provided for @chainBrokenCta.
  ///
  /// In en, this message translates to:
  /// **'Get back to today'**
  String get chainBrokenCta;

  /// No description provided for @chainBrokenCheck.
  ///
  /// In en, this message translates to:
  /// **'Check Left Behind first'**
  String get chainBrokenCheck;

  /// No description provided for @chainBrokenBestChain.
  ///
  /// In en, this message translates to:
  /// **'best chain'**
  String get chainBrokenBestChain;

  /// No description provided for @chainBrokenTasksDone.
  ///
  /// In en, this message translates to:
  /// **'tasks done'**
  String get chainBrokenTasksDone;

  /// No description provided for @chainBrokenSprouts.
  ///
  /// In en, this message translates to:
  /// **'sprouts'**
  String get chainBrokenSprouts;

  /// No description provided for @chainRecoveryFreshStart.
  ///
  /// In en, this message translates to:
  /// **'A fresh start'**
  String get chainRecoveryFreshStart;

  /// No description provided for @medalsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Medals'**
  String get medalsTitle;

  /// No description provided for @medalsTrophyRoom.
  ///
  /// In en, this message translates to:
  /// **'Trophy Room'**
  String get medalsTrophyRoom;

  /// No description provided for @medalsAllMedals.
  ///
  /// In en, this message translates to:
  /// **'All Medals'**
  String get medalsAllMedals;

  /// No description provided for @medalsTrophyEarned.
  ///
  /// In en, this message translates to:
  /// **'{earned} of {total} medals earned'**
  String medalsTrophyEarned(String earned, String total);

  /// No description provided for @medalsTrophyEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your first badge is one task away'**
  String get medalsTrophyEmpty;

  /// No description provided for @medalsTrophyFirst.
  ///
  /// In en, this message translates to:
  /// **'You earned your first medal — keep going'**
  String get medalsTrophyFirst;

  /// No description provided for @medalsTrophyMany.
  ///
  /// In en, this message translates to:
  /// **'{earned} medals in your trophy room'**
  String medalsTrophyMany(String earned);

  /// No description provided for @medalsProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Progress to all {total} medals'**
  String medalsProgressLabel(String total);

  /// No description provided for @medalsShareCta.
  ///
  /// In en, this message translates to:
  /// **'Create a shareable card'**
  String get medalsShareCta;

  /// No description provided for @medalsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing in this category yet'**
  String get medalsEmptyTitle;

  /// No description provided for @medalsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Finish a task or tend a sprout to start your trophy room.'**
  String get medalsEmptyBody;

  /// No description provided for @medalSheetLocked.
  ///
  /// In en, this message translates to:
  /// **'PRO MEDAL'**
  String get medalSheetLocked;

  /// No description provided for @medalSheetEarned.
  ///
  /// In en, this message translates to:
  /// **'EARNED · {tier}'**
  String medalSheetEarned(String tier);

  /// No description provided for @medalSheetUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock with Pro'**
  String get medalSheetUnlock;

  /// No description provided for @medalSheetProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get medalSheetProgress;

  /// No description provided for @medalSheetHint.
  ///
  /// In en, this message translates to:
  /// **'Just {n} more {unit} to unlock.'**
  String medalSheetHint(String n, String unit);

  /// No description provided for @medalSheetAlmost.
  ///
  /// In en, this message translates to:
  /// **'One more step to unlock.'**
  String get medalSheetAlmost;

  /// No description provided for @medalCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get medalCategory;

  /// No description provided for @medalShareOnSocials.
  ///
  /// In en, this message translates to:
  /// **'Share on your socials'**
  String get medalShareOnSocials;

  /// No description provided for @medalShareLater.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get medalShareLater;

  /// No description provided for @medalUnlocked.
  ///
  /// In en, this message translates to:
  /// **'MEDAL UNLOCKED'**
  String get medalUnlocked;

  /// No description provided for @medalProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get medalProgressTitle;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days'**
  String get historyTitle;

  /// No description provided for @historyThisWeek.
  ///
  /// In en, this message translates to:
  /// **'LAST {days} DAYS'**
  String historyThisWeek(String days);

  /// No description provided for @historyDayByDay.
  ///
  /// In en, this message translates to:
  /// **'DAY BY DAY'**
  String get historyDayByDay;

  /// No description provided for @historyEmpty.
  ///
  /// In en, this message translates to:
  /// **'Plant some seeds to see your week unfold.'**
  String get historyEmpty;

  /// No description provided for @historyDoneCount.
  ///
  /// In en, this message translates to:
  /// **'You finished {done} of {total} tasks. {perfect} perfect day(s).'**
  String historyDoneCount(String done, String total, String perfect);

  /// No description provided for @historyUpsellTitle.
  ///
  /// In en, this message translates to:
  /// **'See your full history'**
  String get historyUpsellTitle;

  /// No description provided for @historyUpsellBody.
  ///
  /// In en, this message translates to:
  /// **'Pro unlocks 30 days of history. Free shows 7.'**
  String get historyUpsellBody;

  /// No description provided for @historyPerfect.
  ///
  /// In en, this message translates to:
  /// **'PERFECT'**
  String get historyPerfect;

  /// No description provided for @historyFrozen.
  ///
  /// In en, this message translates to:
  /// **'FROZEN'**
  String get historyFrozen;

  /// No description provided for @historyToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get historyToday;

  /// No description provided for @historyEmptyDay.
  ///
  /// In en, this message translates to:
  /// **'No seeds planted that day'**
  String get historyEmptyDay;

  /// No description provided for @historyLeftBehindCount.
  ///
  /// In en, this message translates to:
  /// **'{count} left behind'**
  String historyLeftBehindCount(String count);

  /// No description provided for @progressVitality.
  ///
  /// In en, this message translates to:
  /// **'TODAY\'S VITALITY'**
  String get progressVitality;

  /// No description provided for @progressVitalityEmpty.
  ///
  /// In en, this message translates to:
  /// **'Plant a seed to begin your garden.'**
  String get progressVitalityEmpty;

  /// No description provided for @progressVitalitySeeds.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} seeds planted today.'**
  String progressVitalitySeeds(String done, String total);

  /// No description provided for @progressChainPill.
  ///
  /// In en, this message translates to:
  /// **'{days}d chain'**
  String progressChainPill(String days);

  /// No description provided for @progressMetricCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get progressMetricCurrent;

  /// No description provided for @progressMetricBest.
  ///
  /// In en, this message translates to:
  /// **'Best'**
  String get progressMetricBest;

  /// No description provided for @progressMetricDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get progressMetricDone;

  /// No description provided for @progressMetricPerfect.
  ///
  /// In en, this message translates to:
  /// **'Perfect'**
  String get progressMetricPerfect;

  /// No description provided for @progressMetricHabits.
  ///
  /// In en, this message translates to:
  /// **'Habits'**
  String get progressMetricHabits;

  /// No description provided for @progressHabitBlooms.
  ///
  /// In en, this message translates to:
  /// **'Habit blooms'**
  String get progressHabitBlooms;

  /// No description provided for @progressHabitBloomsSub.
  ///
  /// In en, this message translates to:
  /// **'Streak milestones for the sprouts you water daily.'**
  String get progressHabitBloomsSub;

  /// No description provided for @progressNextBadge.
  ///
  /// In en, this message translates to:
  /// **'Next badge'**
  String get progressNextBadge;

  /// No description provided for @progressMedalCount.
  ///
  /// In en, this message translates to:
  /// **'{earned} of {total}'**
  String progressMedalCount(String earned, String total);

  /// No description provided for @progressPersonalActivity.
  ///
  /// In en, this message translates to:
  /// **'Personal Activity'**
  String get progressPersonalActivity;

  /// No description provided for @progressBrowseMonth.
  ///
  /// In en, this message translates to:
  /// **'Browsing {month}. Tap \"Today\" to jump back to your live activity.'**
  String progressBrowseMonth(String month);

  /// No description provided for @progressJumpToToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get progressJumpToToday;

  /// No description provided for @progressCalendarLegend.
  ///
  /// In en, this message translates to:
  /// **'darker = more finished'**
  String get progressCalendarLegend;

  /// No description provided for @progressCalendarBody.
  ///
  /// In en, this message translates to:
  /// **'Dark green means a perfect day. The shade fades as you skip.'**
  String get progressCalendarBody;

  /// No description provided for @paywallTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep the chain unbroken.'**
  String get paywallTitle;

  /// No description provided for @paywallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Bloom Tracker Pro gives you the full discipline system.'**
  String get paywallSubtitle;

  /// No description provided for @paywallFeatures.
  ///
  /// In en, this message translates to:
  /// **'All 5 habit slots, not just 3|Your full history, forever|The full medal set|Streak freeze every month|Weekly Receipt + share cards|Themes + more'**
  String get paywallFeatures;

  /// No description provided for @paywallFeaturesBodies.
  ///
  /// In en, this message translates to:
  /// **'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.|Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.|Unlock Legendary tier medals. The rarest badges are for the people who go all in.|2 streak freezes a month so a single bad day doesn\'t end your chain.|Beautiful share cards of your week. Post your chain, inspire someone else to start.|Unlock new accent colors and themes as we add them. Always free updates.'**
  String get paywallFeaturesBodies;

  /// No description provided for @paywallYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get paywallYearly;

  /// No description provided for @paywallYearlyCaption.
  ///
  /// In en, this message translates to:
  /// **'Best value · works out to ~2.50 USD/mo'**
  String get paywallYearlyCaption;

  /// No description provided for @paywallYearlyBadge.
  ///
  /// In en, this message translates to:
  /// **'SAVE 35%'**
  String get paywallYearlyBadge;

  /// No description provided for @paywallMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get paywallMonthly;

  /// No description provided for @paywallMonthlyCaption.
  ///
  /// In en, this message translates to:
  /// **'Billed every month · cancel anytime'**
  String get paywallMonthlyCaption;

  /// No description provided for @paywallStartCta.
  ///
  /// In en, this message translates to:
  /// **'Start Pro · {price}/yr'**
  String paywallStartCta(String price);

  /// No description provided for @paywallStartCtaMonthly.
  ///
  /// In en, this message translates to:
  /// **'Start Pro · {price}/mo'**
  String paywallStartCtaMonthly(String price);

  /// No description provided for @paywallRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore purchase'**
  String get paywallRestore;

  /// No description provided for @paywallTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get paywallTerms;

  /// No description provided for @paywallPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get paywallPrivacy;

  /// No description provided for @paywallNoRestore.
  ///
  /// In en, this message translates to:
  /// **'No previous purchase found on this account.'**
  String get paywallNoRestore;

  /// No description provided for @paywallRestoreLater.
  ///
  /// In en, this message translates to:
  /// **'We\'ll restore your purchase on the next sync.'**
  String get paywallRestoreLater;

  /// No description provided for @paywallAlreadyPro.
  ///
  /// In en, this message translates to:
  /// **'You\'re on Pro. Thank you for the support.'**
  String get paywallAlreadyPro;

  /// No description provided for @paywallHabitSlotHead.
  ///
  /// In en, this message translates to:
  /// **'You\'ve used all your free habit slots. Unlock the full set to plant every ritual you care about.'**
  String get paywallHabitSlotHead;

  /// No description provided for @paywallHistoryHead.
  ///
  /// In en, this message translates to:
  /// **'See your full history — every perfect day, every medal, every comeback.'**
  String get paywallHistoryHead;

  /// No description provided for @paywallMedalHead.
  ///
  /// In en, this message translates to:
  /// **'The rarest medals are Pro-only. Keep going — they\'re closer than you think.'**
  String get paywallMedalHead;

  /// No description provided for @settingsYourActivity.
  ///
  /// In en, this message translates to:
  /// **'YOUR ACTIVITY'**
  String get settingsYourActivity;

  /// No description provided for @settingsHelpInfo.
  ///
  /// In en, this message translates to:
  /// **'HELP & INFO'**
  String get settingsHelpInfo;

  /// No description provided for @settingsAccount.
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get settingsAccount;

  /// No description provided for @settingsNurturingTools.
  ///
  /// In en, this message translates to:
  /// **'NURTURING TOOLS'**
  String get settingsNurturingTools;

  /// No description provided for @settingsReminders.
  ///
  /// In en, this message translates to:
  /// **'REMINDERS'**
  String get settingsReminders;

  /// No description provided for @settingsWidgetSanctuary.
  ///
  /// In en, this message translates to:
  /// **'WIDGET SANCTUARY'**
  String get settingsWidgetSanctuary;

  /// No description provided for @settingsEcosystemSupport.
  ///
  /// In en, this message translates to:
  /// **'ECOSYSTEM SUPPORT'**
  String get settingsEcosystemSupport;

  /// No description provided for @settingsHowItWorks.
  ///
  /// In en, this message translates to:
  /// **'How this works'**
  String get settingsHowItWorks;

  /// No description provided for @settingsSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get settingsSignOut;

  /// No description provided for @settingsProActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get settingsProActive;

  /// No description provided for @settingsProFree.
  ///
  /// In en, this message translates to:
  /// **'Free tier'**
  String get settingsProFree;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageValue.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get settingsLanguageValue;

  /// No description provided for @firstRunGreeting.
  ///
  /// In en, this message translates to:
  /// **'5 tasks. No more. Make them count.'**
  String get firstRunGreeting;

  /// No description provided for @firstRunBody.
  ///
  /// In en, this message translates to:
  /// **'Plant your first seed — what matters most today?'**
  String get firstRunBody;

  /// No description provided for @firstRunCta.
  ///
  /// In en, this message translates to:
  /// **'Plant your first seed'**
  String get firstRunCta;

  /// No description provided for @emptyStateClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get emptyStateClearAll;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @intentionTitle1.
  ///
  /// In en, this message translates to:
  /// **'Let\'s plant a new intention!'**
  String get intentionTitle1;

  /// No description provided for @intentionBody1.
  ///
  /// In en, this message translates to:
  /// **'Every mighty forest begins with a single tiny choice. Tell me what we\'re nurturing today?'**
  String get intentionBody1;

  /// No description provided for @intentionTitle2.
  ///
  /// In en, this message translates to:
  /// **'What shall we grow today?'**
  String get intentionTitle2;

  /// No description provided for @intentionBody2.
  ///
  /// In en, this message translates to:
  /// **'Tiny seeds, tended with care, become tall trees. Pick the one that matters most right now.'**
  String get intentionBody2;

  /// No description provided for @intentionTitle3.
  ///
  /// In en, this message translates to:
  /// **'One seed. One breath. Begin.'**
  String get intentionTitle3;

  /// No description provided for @intentionBody3.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have to plant the whole forest at once — just the next right thing.'**
  String get intentionBody3;

  /// No description provided for @intentionTitle4.
  ///
  /// In en, this message translates to:
  /// **'Nurture the next small step.'**
  String get intentionTitle4;

  /// No description provided for @intentionBody4.
  ///
  /// In en, this message translates to:
  /// **'Future-you is built from the choices you make in the next five minutes. What\'s one kind one?'**
  String get intentionBody4;

  /// No description provided for @intentionTitle5.
  ///
  /// In en, this message translates to:
  /// **'Choose what you want to become.'**
  String get intentionTitle5;

  /// No description provided for @intentionBody5.
  ///
  /// In en, this message translates to:
  /// **'Tasks are seeds, habits are sprouts. Together they form a forest you\'re proud of.'**
  String get intentionBody5;

  /// No description provided for @intentionTitle6.
  ///
  /// In en, this message translates to:
  /// **'Plant something worth remembering.'**
  String get intentionTitle6;

  /// No description provided for @intentionBody6.
  ///
  /// In en, this message translates to:
  /// **'Not every day will feel huge. A watered seed still counts. Let\'s name one.'**
  String get intentionBody6;

  /// No description provided for @intentionTitle7.
  ///
  /// In en, this message translates to:
  /// **'Make today a little braver.'**
  String get intentionTitle7;

  /// No description provided for @intentionBody7.
  ///
  /// In en, this message translates to:
  /// **'Courage compounds. Pick the seed you\'ve been postponing — even naming it moves it forward.'**
  String get intentionBody7;

  /// No description provided for @intentionTitle8.
  ///
  /// In en, this message translates to:
  /// **'Tend the soil before the seed.'**
  String get intentionTitle8;

  /// No description provided for @intentionBody8.
  ///
  /// In en, this message translates to:
  /// **'What mindset, tool, or small ritual will make this task easier? Add it to the notes.'**
  String get intentionBody8;

  /// No description provided for @shareCardSnapshot.
  ///
  /// In en, this message translates to:
  /// **'A snapshot of your sanctuary'**
  String get shareCardSnapshot;

  /// No description provided for @shareCardBody.
  ///
  /// In en, this message translates to:
  /// **'The card above is exported as a PNG and sent to your share sheet. Post it on your story, send it to a friend, or print it as a sticker.'**
  String get shareCardBody;

  /// No description provided for @shareCardShareMyBloom.
  ///
  /// In en, this message translates to:
  /// **'Share my bloom'**
  String get shareCardShareMyBloom;

  /// No description provided for @shareCardCouldNotShare.
  ///
  /// In en, this message translates to:
  /// **'Could not share right now'**
  String get shareCardCouldNotShare;

  /// No description provided for @shareCardProgressText.
  ///
  /// In en, this message translates to:
  /// **'My Bloom Tracker progress — {year} on Bloom Tracker.'**
  String shareCardProgressText(String year);

  /// No description provided for @shareCardMedalText.
  ///
  /// In en, this message translates to:
  /// **'I just unlocked the \"{title}\" medal on Bloom Tracker. {subtitle}'**
  String shareCardMedalText(String title, String subtitle);

  /// No description provided for @howItWorksTitle.
  ///
  /// In en, this message translates to:
  /// **'How this works'**
  String get howItWorksTitle;

  /// No description provided for @howItWorksBody.
  ///
  /// In en, this message translates to:
  /// **'Bloom Tracker helps you keep a small, unbroken chain of discipline. That\'s it.'**
  String get howItWorksBody;

  /// No description provided for @howItWorksToday.
  ///
  /// In en, this message translates to:
  /// **'The Today tab'**
  String get howItWorksToday;

  /// No description provided for @howItWorksTodayBody.
  ///
  /// In en, this message translates to:
  /// **'This is your home. It shows the 5 tasks and the habits you set for today. Finish them by midnight, the chain extends.'**
  String get howItWorksTodayBody;

  /// No description provided for @howItWorksCap.
  ///
  /// In en, this message translates to:
  /// **'The 5-task cap is the feature'**
  String get howItWorksCap;

  /// No description provided for @howItWorksCapBody.
  ///
  /// In en, this message translates to:
  /// **'We don\'t let you add a 6th. That\'s the whole point. Small chains beat long ones. Tap the \"?\" on the home screen for the full reasoning.'**
  String get howItWorksCapBody;

  /// No description provided for @howItWorksHabits.
  ///
  /// In en, this message translates to:
  /// **'Habits are daily, the chain is forever'**
  String get howItWorksHabits;

  /// No description provided for @howItWorksHabitsBody.
  ///
  /// In en, this message translates to:
  /// **'Habits (Morning yoga, Drink water) live forever. Tasks are one-shot. Both feed the same streak.'**
  String get howItWorksHabitsBody;

  /// No description provided for @howItWorksLeftBehind.
  ///
  /// In en, this message translates to:
  /// **'Missed tasks → Left Behind'**
  String get howItWorksLeftBehind;

  /// No description provided for @howItWorksLeftBehindBody.
  ///
  /// In en, this message translates to:
  /// **'At midnight, unfinished tasks move to Left Behind. Re-add only what still matters. The rest gets a quiet let-go.'**
  String get howItWorksLeftBehindBody;

  /// No description provided for @howItWorksProgress.
  ///
  /// In en, this message translates to:
  /// **'The Progress tab'**
  String get howItWorksProgress;

  /// No description provided for @howItWorksProgressBody.
  ///
  /// In en, this message translates to:
  /// **'Streak, calendar, medals, history — everything about how you\'re doing over time. Nothing urgent lives here.'**
  String get howItWorksProgressBody;

  /// No description provided for @howItWorksYou.
  ///
  /// In en, this message translates to:
  /// **'The You tab'**
  String get howItWorksYou;

  /// No description provided for @howItWorksYouBody.
  ///
  /// In en, this message translates to:
  /// **'Your account, settings, sign out. That\'s all.'**
  String get howItWorksYouBody;

  /// No description provided for @howItWorksRule.
  ///
  /// In en, this message translates to:
  /// **'The rule: 5 small things, every day, no excuses.'**
  String get howItWorksRule;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get commonDismiss;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get commonSend;

  /// No description provided for @commonCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get commonCopy;

  /// No description provided for @commonShowLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get commonShowLess;

  /// No description provided for @commonViewFull.
  ///
  /// In en, this message translates to:
  /// **'View full notes'**
  String get commonViewFull;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get commonError;

  /// No description provided for @commonPageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get commonPageNotFound;

  /// No description provided for @commonHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get commonHome;

  /// No description provided for @commonUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown routing error'**
  String get commonUnknownError;

  /// No description provided for @commonSettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get commonSettingsTooltip;

  /// No description provided for @commonHowThisWorks.
  ///
  /// In en, this message translates to:
  /// **'How this works'**
  String get commonHowThisWorks;

  /// No description provided for @myDayReminderSet.
  ///
  /// In en, this message translates to:
  /// **'Reminder set'**
  String get myDayReminderSet;

  /// No description provided for @myDayPreparationNotes.
  ///
  /// In en, this message translates to:
  /// **'PREPARATION NOTES'**
  String get myDayPreparationNotes;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'SKIP'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingEnterSanctuary.
  ///
  /// In en, this message translates to:
  /// **'Enter Sanctuary'**
  String get onboardingEnterSanctuary;

  /// No description provided for @onboardingIntroduction.
  ///
  /// In en, this message translates to:
  /// **'INTRODUCTION'**
  String get onboardingIntroduction;

  /// No description provided for @onboardingGrowYourForest.
  ///
  /// In en, this message translates to:
  /// **'GROW YOUR FOREST'**
  String get onboardingGrowYourForest;

  /// No description provided for @onboardingPage1Title.
  ///
  /// In en, this message translates to:
  /// **'Meet your Guardian.'**
  String get onboardingPage1Title;

  /// No description provided for @onboardingPage1Body.
  ///
  /// In en, this message translates to:
  /// **'Welcome to your Personal Sanctuary. Here, your growth is mirrored in the life of your forest.'**
  String get onboardingPage1Body;

  /// No description provided for @onboardingPage2Title.
  ///
  /// In en, this message translates to:
  /// **'Plant seeds. Watch them grow.'**
  String get onboardingPage2Title;

  /// No description provided for @onboardingPage2Body.
  ///
  /// In en, this message translates to:
  /// **'Each task is a tiny seed. Each habit is a sprout you tend daily. Together they form a forest of discipline.'**
  String get onboardingPage2Body;

  /// No description provided for @onboardingPage3Title.
  ///
  /// In en, this message translates to:
  /// **'Five tasks. One chain.'**
  String get onboardingPage3Title;

  /// No description provided for @onboardingPage3Body.
  ///
  /// In en, this message translates to:
  /// **'You can only plant 5 seeds per day. That cap forces you to focus on what actually matters — and protect your chain.'**
  String get onboardingPage3Body;

  /// No description provided for @onboardingPage4Title.
  ///
  /// In en, this message translates to:
  /// **'Tend your sprouts daily.'**
  String get onboardingPage4Title;

  /// No description provided for @onboardingPage4Body.
  ///
  /// In en, this message translates to:
  /// **'Tap habits to grow them. Skip a day and the chain doesn\'t extend. The Guardian grows with you.'**
  String get onboardingPage4Body;

  /// No description provided for @authBrand.
  ///
  /// In en, this message translates to:
  /// **'BLOOM TRACKER'**
  String get authBrand;

  /// No description provided for @authPlantFirstSeed.
  ///
  /// In en, this message translates to:
  /// **'Plant your first seed.'**
  String get authPlantFirstSeed;

  /// No description provided for @authWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, Guardian.'**
  String get authWelcomeBack;

  /// No description provided for @authFiveTasksDaily.
  ///
  /// In en, this message translates to:
  /// **'Five tasks. Daily habits. No excuses.'**
  String get authFiveTasksDaily;

  /// No description provided for @authSanctuaryWaiting.
  ///
  /// In en, this message translates to:
  /// **'Your sanctuary is waiting.'**
  String get authSanctuaryWaiting;

  /// No description provided for @authSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get authSignIn;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get authSignUp;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'EMAIL'**
  String get authEmail;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get authPassword;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'you@email.com'**
  String get authEmailHint;

  /// No description provided for @authCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get authCreateAccount;

  /// No description provided for @authSignInCta.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignInCta;

  /// No description provided for @authOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get authOrContinueWith;

  /// No description provided for @authContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueWithGoogle;

  /// No description provided for @authEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get authEnterEmail;

  /// No description provided for @authEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get authEnterValidEmail;

  /// No description provided for @authPasswordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get authPasswordTooShort;

  /// No description provided for @authAccountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created. Switch to Sign In and use your password.'**
  String get authAccountCreated;

  /// No description provided for @authSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again.'**
  String get authSomethingWentWrong;

  /// No description provided for @authCouldNotStartGoogle.
  ///
  /// In en, this message translates to:
  /// **'Could not start Google sign-in.'**
  String get authCouldNotStartGoogle;

  /// No description provided for @authMidnightReset.
  ///
  /// In en, this message translates to:
  /// **'By signing in, you accept that your day resets at midnight.'**
  String get authMidnightReset;

  /// No description provided for @authSetupRequired.
  ///
  /// In en, this message translates to:
  /// **'Setup required'**
  String get authSetupRequired;

  /// No description provided for @settingsPersonalSanctuary.
  ///
  /// In en, this message translates to:
  /// **'PERSONAL SANCTUARY'**
  String get settingsPersonalSanctuary;

  /// No description provided for @settingsHowThisWorks.
  ///
  /// In en, this message translates to:
  /// **'How this works'**
  String get settingsHowThisWorks;

  /// No description provided for @settingsHowThisWorksSubtitle.
  ///
  /// In en, this message translates to:
  /// **'What the app is, how the cap and streak work'**
  String get settingsHowThisWorksSubtitle;

  /// No description provided for @settingsStreakProtection.
  ///
  /// In en, this message translates to:
  /// **'Streak Protection'**
  String get settingsStreakProtection;

  /// No description provided for @settingsStreakProtectionAvailable.
  ///
  /// In en, this message translates to:
  /// **'1 freeze available this month'**
  String get settingsStreakProtectionAvailable;

  /// No description provided for @settingsStreakProtectionUsed.
  ///
  /// In en, this message translates to:
  /// **'Used for this month'**
  String get settingsStreakProtectionUsed;

  /// No description provided for @settingsProSubscription.
  ///
  /// In en, this message translates to:
  /// **'Bloom Tracker Pro'**
  String get settingsProSubscription;

  /// No description provided for @settingsManageProSubscription.
  ///
  /// In en, this message translates to:
  /// **'Manage Pro subscription'**
  String get settingsManageProSubscription;

  /// No description provided for @settingsProCancelPlay.
  ///
  /// In en, this message translates to:
  /// **'Cancel or change plan in Google Play'**
  String get settingsProCancelPlay;

  /// No description provided for @settingsProUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock all 5 habits, full history, more'**
  String get settingsProUnlock;

  /// No description provided for @settingsTaskAlarms.
  ///
  /// In en, this message translates to:
  /// **'Task alarms & Final Call'**
  String get settingsTaskAlarms;

  /// No description provided for @settingsTaskAlarmsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Evening nudge and midnight warning'**
  String get settingsTaskAlarmsSubtitle;

  /// No description provided for @settingsHomeScreenWidget.
  ///
  /// In en, this message translates to:
  /// **'Home-screen widget'**
  String get settingsHomeScreenWidget;

  /// No description provided for @settingsHomeScreenWidgetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add your chain streak to the home screen'**
  String get settingsHomeScreenWidgetSubtitle;

  /// No description provided for @settingsShareBloomTracker.
  ///
  /// In en, this message translates to:
  /// **'Share Bloom Tracker'**
  String get settingsShareBloomTracker;

  /// No description provided for @settingsShareBloomTrackerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell a friend about the chain'**
  String get settingsShareBloomTrackerSubtitle;

  /// No description provided for @settingsHelpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get settingsHelpSupport;

  /// No description provided for @settingsHelpSupportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'FAQ or report a problem'**
  String get settingsHelpSupportSubtitle;

  /// No description provided for @settingsSignOutTile.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get settingsSignOutTile;

  /// No description provided for @settingsAllFeaturesUnlocked.
  ///
  /// In en, this message translates to:
  /// **'All features unlocked'**
  String get settingsAllFeaturesUnlocked;

  /// No description provided for @settingsAllFeaturesUnlockedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Beta build — subscriptions paused while we test everything.'**
  String get settingsAllFeaturesUnlockedSubtitle;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version} ({build})'**
  String settingsVersion(Object build, Object version);

  /// No description provided for @settingsVersionUnknown.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get settingsVersionUnknown;

  /// No description provided for @settingsHabitMaster.
  ///
  /// In en, this message translates to:
  /// **'Habit Master'**
  String get settingsHabitMaster;

  /// No description provided for @settingsLevel.
  ///
  /// In en, this message translates to:
  /// **'Level {level} · Habit Master'**
  String settingsLevel(Object level);

  /// No description provided for @languagePickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languagePickerTitle;

  /// No description provided for @youLast7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get youLast7Days;

  /// No description provided for @youLast7DaysSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Day-by-day task history'**
  String get youLast7DaysSubtitle;

  /// No description provided for @youLeftBehindSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Missed tasks waiting to be re-added'**
  String get youLeftBehindSubtitle;

  /// No description provided for @youProTier.
  ///
  /// In en, this message translates to:
  /// **'Pro tier'**
  String get youProTier;

  /// No description provided for @youFreeTier.
  ///
  /// In en, this message translates to:
  /// **'Free tier'**
  String get youFreeTier;

  /// No description provided for @youPro.
  ///
  /// In en, this message translates to:
  /// **'Pro'**
  String get youPro;

  /// No description provided for @youFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get youFree;

  /// No description provided for @youLevelLabel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String youLevelLabel(Object level);

  /// No description provided for @youBestStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'Best {days} d'**
  String youBestStreakLabel(Object days);

  /// No description provided for @youPlantHabit.
  ///
  /// In en, this message translates to:
  /// **'Plant a habit to start a chain.'**
  String get youPlantHabit;

  /// No description provided for @youProBadge.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get youProBadge;

  /// No description provided for @youUnlockDiscipline.
  ///
  /// In en, this message translates to:
  /// **'Unlock the full discipline system.'**
  String get youUnlockDiscipline;

  /// No description provided for @youProFeatures.
  ///
  /// In en, this message translates to:
  /// **'5 habit slots, full history, legendary medals, monthly streak freezes, weekly share cards.'**
  String get youProFeatures;

  /// No description provided for @youSeePlans.
  ///
  /// In en, this message translates to:
  /// **'See plans'**
  String get youSeePlans;

  /// No description provided for @youFromPrice.
  ///
  /// In en, this message translates to:
  /// **'from {price}/mo'**
  String youFromPrice(Object price);

  /// No description provided for @youBloomTrackerFooter.
  ///
  /// In en, this message translates to:
  /// **'Bloom Tracker · Habit & To-Do'**
  String get youBloomTrackerFooter;

  /// No description provided for @progressMedals.
  ///
  /// In en, this message translates to:
  /// **'Medals'**
  String get progressMedals;

  /// No description provided for @progressLast7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 days'**
  String get progressLast7Days;

  /// No description provided for @progressSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get progressSeeAll;

  /// No description provided for @progressSeeDayByDayActivity.
  ///
  /// In en, this message translates to:
  /// **'See your day-by-day activity'**
  String get progressSeeDayByDayActivity;

  /// No description provided for @progressTasksFinishedPct.
  ///
  /// In en, this message translates to:
  /// **'{done} of {total} tasks finished · {pct}%'**
  String progressTasksFinishedPct(Object done, Object pct, Object total);

  /// No description provided for @progressNoMedalsYet.
  ///
  /// In en, this message translates to:
  /// **'No medals yet — finish a task or tend a sprout to get started.'**
  String get progressNoMedalsYet;

  /// No description provided for @progressSeeAllMedals.
  ///
  /// In en, this message translates to:
  /// **'See all medals · {earned} of {total} earned'**
  String progressSeeAllMedals(Object earned, Object total);

  /// No description provided for @progressGuardianInsight.
  ///
  /// In en, this message translates to:
  /// **'Guardian insight'**
  String get progressGuardianInsight;

  /// No description provided for @progressNextBadgeTier.
  ///
  /// In en, this message translates to:
  /// **'NEXT BADGE · {tier}'**
  String progressNextBadgeTier(Object tier);

  /// No description provided for @progressDaysTarget.
  ///
  /// In en, this message translates to:
  /// **'{days} day target'**
  String progressDaysTarget(Object days);

  /// No description provided for @progressOfTotal.
  ///
  /// In en, this message translates to:
  /// **'{value}/{target}'**
  String progressOfTotal(Object target, Object value);

  /// No description provided for @helpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpTitle;

  /// No description provided for @helpBody.
  ///
  /// In en, this message translates to:
  /// **'Most answers are below. If not, send us a note and we usually reply within 2–3 days.'**
  String get helpBody;

  /// No description provided for @helpSectionFAQ.
  ///
  /// In en, this message translates to:
  /// **'FREQUENT QUESTIONS'**
  String get helpSectionFAQ;

  /// No description provided for @helpSectionContact.
  ///
  /// In en, this message translates to:
  /// **'STILL STUCK?'**
  String get helpSectionContact;

  /// No description provided for @helpAddMessage.
  ///
  /// In en, this message translates to:
  /// **'Add a short message first.'**
  String get helpAddMessage;

  /// No description provided for @helpOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening your mail app…'**
  String get helpOpening;

  /// No description provided for @helpEmailUs.
  ///
  /// In en, this message translates to:
  /// **'Email us'**
  String get helpEmailUs;

  /// No description provided for @helpOpeningAction.
  ///
  /// In en, this message translates to:
  /// **'Opening…'**
  String get helpOpeningAction;

  /// No description provided for @helpCopyEmail.
  ///
  /// In en, this message translates to:
  /// **'Copy support email'**
  String get helpCopyEmail;

  /// No description provided for @helpCopiedEmail.
  ///
  /// In en, this message translates to:
  /// **'Copied support@bloomtracker.app'**
  String get helpCopiedEmail;

  /// No description provided for @helpNoMailApp.
  ///
  /// In en, this message translates to:
  /// **'No mail app found. Email us at support@bloomtracker.app.'**
  String get helpNoMailApp;

  /// No description provided for @helpTopicLabel.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get helpTopicLabel;

  /// No description provided for @helpWhatHappened.
  ///
  /// In en, this message translates to:
  /// **'What happened?'**
  String get helpWhatHappened;

  /// No description provided for @helpHint.
  ///
  /// In en, this message translates to:
  /// **'A short description goes a long way…'**
  String get helpHint;

  /// No description provided for @helpDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Tapping \"Email us\" opens your mail app with a pre-filled message (no data leaves your device until you send).'**
  String get helpDisclaimer;

  /// No description provided for @helpFaqQ1.
  ///
  /// In en, this message translates to:
  /// **'What is the 5-task cap?'**
  String get helpFaqQ1;

  /// No description provided for @helpFaqA1.
  ///
  /// In en, this message translates to:
  /// **'You can add up to 5 tasks per local day. The 6th is blocked on purpose — discipline beats overload. The cap is the feature, not a limitation.'**
  String get helpFaqA1;

  /// No description provided for @helpFaqQ2.
  ///
  /// In en, this message translates to:
  /// **'What happens at midnight?'**
  String get helpFaqQ2;

  /// No description provided for @helpFaqA2.
  ///
  /// In en, this message translates to:
  /// **'At your local midnight, any task still marked open is stamped \"missed\" and moves to Left Behind. Habit streaks reset if the habit was not completed the day before.'**
  String get helpFaqA2;

  /// No description provided for @helpFaqQ3.
  ///
  /// In en, this message translates to:
  /// **'What is Left Behind?'**
  String get helpFaqQ3;

  /// No description provided for @helpFaqA3.
  ///
  /// In en, this message translates to:
  /// **'A gentle, dismissible list of tasks you didn\'t finish. Open it, re-add only what still matters, and let the rest go. Free tier sees the last 7 days; Pro sees full history.'**
  String get helpFaqA3;

  /// No description provided for @helpFaqQ4.
  ///
  /// In en, this message translates to:
  /// **'How do streaks work?'**
  String get helpFaqQ4;

  /// No description provided for @helpFaqA4.
  ///
  /// In en, this message translates to:
  /// **'A day extends the chain when you had at least 1 task and 0 were missed. Days with zero tasks neither extend nor break the chain. A streak freeze forgives one missed day per month.'**
  String get helpFaqA4;

  /// No description provided for @helpFaqQ5.
  ///
  /// In en, this message translates to:
  /// **'What is the streak freeze?'**
  String get helpFaqQ5;

  /// No description provided for @helpFaqA5.
  ///
  /// In en, this message translates to:
  /// **'One \"freeze\" per calendar month, Pro only. Spend it on a day you missed to keep your chain alive. Find it on the Progress tab.'**
  String get helpFaqA5;

  /// No description provided for @helpFaqQ6.
  ///
  /// In en, this message translates to:
  /// **'Where is my data stored?'**
  String get helpFaqQ6;

  /// No description provided for @helpFaqA6.
  ///
  /// In en, this message translates to:
  /// **'All data lives in Supabase (Postgres) under the account that signed in. We never sell or share it. See the privacy policy linked in the Play Store listing for the full details.'**
  String get helpFaqA6;

  /// No description provided for @helpFaqQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I delete my account?'**
  String get helpFaqQ7;

  /// No description provided for @helpFaqA7.
  ///
  /// In en, this message translates to:
  /// **'Account deletion is coming to Settings in the next release. For now, email support@bloomtracker.app and we\'ll handle it within a day.'**
  String get helpFaqA7;

  /// No description provided for @helpTopicsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General question'**
  String get helpTopicsGeneral;

  /// No description provided for @helpTopicsBug.
  ///
  /// In en, this message translates to:
  /// **'Bug report'**
  String get helpTopicsBug;

  /// No description provided for @helpTopicsStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak / rollover issue'**
  String get helpTopicsStreak;

  /// No description provided for @helpTopicsBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing or Pro tier'**
  String get helpTopicsBilling;

  /// No description provided for @helpTopicsAccount.
  ///
  /// In en, this message translates to:
  /// **'Account & data'**
  String get helpTopicsAccount;

  /// No description provided for @helpTopicsFeature.
  ///
  /// In en, this message translates to:
  /// **'Feature request'**
  String get helpTopicsFeature;

  /// No description provided for @helpAccountAnon.
  ///
  /// In en, this message translates to:
  /// **'(not signed in)'**
  String get helpAccountAnon;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Nurture small seeds. Grow a forest.'**
  String get splashTagline;

  /// No description provided for @priorityStandard.
  ///
  /// In en, this message translates to:
  /// **'STANDARD'**
  String get priorityStandard;

  /// No description provided for @priorityVital.
  ///
  /// In en, this message translates to:
  /// **'VITAL'**
  String get priorityVital;

  /// No description provided for @prioritySpark.
  ///
  /// In en, this message translates to:
  /// **'SPARK'**
  String get prioritySpark;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bn',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'it',
        'pa',
        'ps',
        'pt',
        'sd',
        'tr',
        'ur'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'pa':
      return AppLocalizationsPa();
    case 'ps':
      return AppLocalizationsPs();
    case 'pt':
      return AppLocalizationsPt();
    case 'sd':
      return AppLocalizationsSd();
    case 'tr':
      return AppLocalizationsTr();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
