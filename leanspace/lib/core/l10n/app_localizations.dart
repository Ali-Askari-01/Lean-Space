import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';
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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('id'),
    Locale('it'),
    Locale('pt'),
    Locale('tr'),
    Locale('ur')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Stitch'**
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
  /// **'Daily Stitch Pro'**
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

  /// No description provided for @habitsSlotsFull.
  ///
  /// In en, this message translates to:
  /// **'All habit slots are currently full.'**
  String get habitsSlotsFull;

  /// No description provided for @habitsStreakDays.
  ///
  /// In en, this message translates to:
  /// **'{days}d'**
  String habitsStreakDays(String days);

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

  /// No description provided for @leftBehindReAddButton.
  ///
  /// In en, this message translates to:
  /// **'Re-add'**
  String get leftBehindReAddButton;

  /// No description provided for @leftBehindAddedToToday.
  ///
  /// In en, this message translates to:
  /// **'Added to today'**
  String get leftBehindAddedToToday;

  /// No description provided for @leftBehindLetGo.
  ///
  /// In en, this message translates to:
  /// **'Let it go'**
  String get leftBehindLetGo;

  /// No description provided for @leftBehindHeader.
  ///
  /// In en, this message translates to:
  /// **'LEFT BEHIND'**
  String get leftBehindHeader;

  /// No description provided for @leftBehindMissedTasks.
  ///
  /// In en, this message translates to:
  /// **'MISSED TASKS'**
  String get leftBehindMissedTasks;

  /// No description provided for @leftBehindWaitingOne.
  ///
  /// In en, this message translates to:
  /// **'1 task is waiting for you.'**
  String get leftBehindWaitingOne;

  /// No description provided for @leftBehindWaitingMany.
  ///
  /// In en, this message translates to:
  /// **'{count} tasks are waiting for you.'**
  String leftBehindWaitingMany(String count);

  /// No description provided for @leftBehindBody.
  ///
  /// In en, this message translates to:
  /// **'Re-add a task to bring it back to today, or let it go. Re-adding keeps your streak alive.'**
  String get leftBehindBody;

  /// No description provided for @leftBehindReAddedSnack.
  ///
  /// In en, this message translates to:
  /// **'\"{task}\" is back in your day.'**
  String leftBehindReAddedSnack(String task);

  /// No description provided for @leftBehindRemovedSnack.
  ///
  /// In en, this message translates to:
  /// **'Removed \"{task}\"'**
  String leftBehindRemovedSnack(String task);

  /// No description provided for @leftBehindClearedSnack.
  ///
  /// In en, this message translates to:
  /// **'Left-behind cleared'**
  String get leftBehindClearedSnack;

  /// No description provided for @leftBehindYesterdayDate.
  ///
  /// In en, this message translates to:
  /// **'Yesterday · {date}'**
  String leftBehindYesterdayDate(String date);

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

  /// No description provided for @streakFreezeUse.
  ///
  /// In en, this message translates to:
  /// **'Use freeze'**
  String get streakFreezeUse;

  /// No description provided for @streakFreezeUseForYesterday.
  ///
  /// In en, this message translates to:
  /// **'Use monthly streak freeze for yesterday'**
  String get streakFreezeUseForYesterday;

  /// No description provided for @streakFreezeAppliedYesterday.
  ///
  /// In en, this message translates to:
  /// **'Streak freeze applied for yesterday.'**
  String get streakFreezeAppliedYesterday;

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

  /// No description provided for @chainBrokenPlantFirst.
  ///
  /// In en, this message translates to:
  /// **'Plant today\'s first seed'**
  String get chainBrokenPlantFirst;

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

  /// No description provided for @historyFullTitle.
  ///
  /// In en, this message translates to:
  /// **'Full history'**
  String get historyFullTitle;

  /// No description provided for @historyLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load history.'**
  String get historyLoadError;

  /// No description provided for @historyFullCalendar.
  ///
  /// In en, this message translates to:
  /// **'Full calendar'**
  String get historyFullCalendar;

  /// No description provided for @historyCompletedPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% completed'**
  String historyCompletedPercent(String percent);

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
  /// **'Daily Stitch Pro gives you the full discipline system.'**
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
  /// **'Best value · works out to ~\$0.67/mo'**
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

  /// No description provided for @paywallLifetime.
  ///
  /// In en, this message translates to:
  /// **'Lifetime'**
  String get paywallLifetime;

  /// No description provided for @paywallLifetimeCaption.
  ///
  /// In en, this message translates to:
  /// **'One-time payment · yours forever'**
  String get paywallLifetimeCaption;

  /// No description provided for @paywallLifetimeBadge.
  ///
  /// In en, this message translates to:
  /// **'BEST DEAL'**
  String get paywallLifetimeBadge;

  /// No description provided for @paywallStartCtaLifetime.
  ///
  /// In en, this message translates to:
  /// **'Start Pro · {price} forever'**
  String paywallStartCtaLifetime(String price);

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

  /// No description provided for @settingsSignOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get settingsSignOutConfirm;

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
  /// **'My Daily Stitch progress — {year} on Daily Stitch.'**
  String shareCardProgressText(String year);

  /// No description provided for @shareCardMedalText.
  ///
  /// In en, this message translates to:
  /// **'I just unlocked the \"{title}\" medal on Daily Stitch. {subtitle}'**
  String shareCardMedalText(String title, String subtitle);

  /// No description provided for @howItWorksTitle.
  ///
  /// In en, this message translates to:
  /// **'How this works'**
  String get howItWorksTitle;

  /// No description provided for @howItWorksBody.
  ///
  /// In en, this message translates to:
  /// **'Daily Stitch helps you keep a small, unbroken chain of discipline. That\'s it.'**
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
  /// **'Missed tasks ? Left Behind'**
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
  /// **'DAILY STITCH'**
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
  /// **'Password must be at least 8 characters'**
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
  /// **'Daily Stitch Pro'**
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
  /// **'Share Daily Stitch'**
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
  /// **'Daily Stitch · Habit & To-Do'**
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
  /// **'Copied support@dailystitch.app'**
  String get helpCopiedEmail;

  /// No description provided for @helpNoMailApp.
  ///
  /// In en, this message translates to:
  /// **'No mail app found. Email us at support@dailystitch.app.'**
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
  /// **'All data lives in our secure cloud backend under the account that signed in. We never sell or share it. See the privacy policy linked in the Play Store listing for the full details.'**
  String get helpFaqA6;

  /// No description provided for @helpFaqQ7.
  ///
  /// In en, this message translates to:
  /// **'How do I delete my account?'**
  String get helpFaqQ7;

  /// No description provided for @helpFaqA7.
  ///
  /// In en, this message translates to:
  /// **'Go to Settings ? Account ? Delete account. This permanently removes your profile, tasks, habits, and subscription data. Active Play subscriptions must be cancelled separately in Google Play.'**
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

  /// No description provided for @settingsDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingsDeleteAccount;

  /// No description provided for @settingsDeleteAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Permanently remove your data'**
  String get settingsDeleteAccountSubtitle;

  /// No description provided for @settingsDeleteAccountConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete your account?'**
  String get settingsDeleteAccountConfirmTitle;

  /// No description provided for @settingsDeleteAccountConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes your profile, tasks, habits, and progress. Active subscriptions must be cancelled in Google Play separately. This cannot be undone.'**
  String get settingsDeleteAccountConfirmBody;

  /// No description provided for @settingsDeleteAccountConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Delete forever'**
  String get settingsDeleteAccountConfirmButton;

  /// No description provided for @settingsDeleteAccountSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your account has been deleted.'**
  String get settingsDeleteAccountSuccess;

  /// No description provided for @settingsDeleteAccountFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not delete account. Try again or email support@dailystitch.app.'**
  String get settingsDeleteAccountFailed;

  /// No description provided for @referralYouTitle.
  ///
  /// In en, this message translates to:
  /// **'Invite friends · earn free Pro'**
  String get referralYouTitle;

  /// No description provided for @referralYouSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{progress} of {milestone} friends joined'**
  String referralYouSubtitle(int progress, int milestone);

  /// No description provided for @referralYouShare.
  ///
  /// In en, this message translates to:
  /// **'Share invite'**
  String get referralYouShare;

  /// No description provided for @referralYouDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get referralYouDetails;

  /// No description provided for @referralPaywallTitle.
  ///
  /// In en, this message translates to:
  /// **'Free Pro month'**
  String get referralPaywallTitle;

  /// No description provided for @referralPaywallBody.
  ///
  /// In en, this message translates to:
  /// **'Invite 5 friends who sign up ? 1 month Pro free'**
  String get referralPaywallBody;

  /// No description provided for @referralPaywallProBody.
  ///
  /// In en, this message translates to:
  /// **'Keep inviting — stack free Pro months'**
  String get referralPaywallProBody;

  /// No description provided for @referralPaywallProgress.
  ///
  /// In en, this message translates to:
  /// **'{count} / {milestone}'**
  String referralPaywallProgress(Object count, Object milestone);

  /// No description provided for @insightsLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load your progress. Try again later.'**
  String get insightsLoadError;

  /// No description provided for @insightsMetricCurrentChain.
  ///
  /// In en, this message translates to:
  /// **'CURRENT CHAIN'**
  String get insightsMetricCurrentChain;

  /// No description provided for @insightsMetricBestEver.
  ///
  /// In en, this message translates to:
  /// **'BEST EVER'**
  String get insightsMetricBestEver;

  /// No description provided for @insightsMetricTasksDone.
  ///
  /// In en, this message translates to:
  /// **'TASKS DONE'**
  String get insightsMetricTasksDone;

  /// No description provided for @insightsMetricPerfectDays.
  ///
  /// In en, this message translates to:
  /// **'PERFECT DAYS'**
  String get insightsMetricPerfectDays;

  /// No description provided for @insightsMetricHabits.
  ///
  /// In en, this message translates to:
  /// **'HABITS'**
  String get insightsMetricHabits;

  /// No description provided for @insightsDay.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get insightsDay;

  /// No description provided for @insightsDays.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get insightsDays;

  /// No description provided for @insightsSectionThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get insightsSectionThisWeek;

  /// No description provided for @insightsShareMyWeek.
  ///
  /// In en, this message translates to:
  /// **'Share my week'**
  String get insightsShareMyWeek;

  /// No description provided for @insightsShareMyWeekPro.
  ///
  /// In en, this message translates to:
  /// **'Share my week · Pro'**
  String get insightsShareMyWeekPro;

  /// No description provided for @insightsShareReceiptText.
  ///
  /// In en, this message translates to:
  /// **'My week on Daily Stitch. Don\'t break the chain.'**
  String get insightsShareReceiptText;

  /// No description provided for @insightsHistoryWindowTitle.
  ///
  /// In en, this message translates to:
  /// **'Showing the last {days} days'**
  String insightsHistoryWindowTitle(int days);

  /// No description provided for @insightsHistoryUpsell.
  ///
  /// In en, this message translates to:
  /// **'Unlock your full history with Pro'**
  String get insightsHistoryUpsell;

  /// No description provided for @referralScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Invite friends'**
  String get referralScreenTitle;

  /// No description provided for @referralLaunchGift.
  ///
  /// In en, this message translates to:
  /// **'Launch month gift'**
  String get referralLaunchGift;

  /// No description provided for @referralRewardTitle.
  ///
  /// In en, this message translates to:
  /// **'Get 1 month of Pro free'**
  String get referralRewardTitle;

  /// No description provided for @referralRewardBody.
  ///
  /// In en, this message translates to:
  /// **'Share your code with friends. When 5 people sign up using it, you unlock Daily Stitch Pro for a full month.'**
  String get referralRewardBody;

  /// No description provided for @referralYourCode.
  ///
  /// In en, this message translates to:
  /// **'Your referral code'**
  String get referralYourCode;

  /// No description provided for @referralCopyCodeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy code'**
  String get referralCopyCodeTooltip;

  /// No description provided for @referralCodeCopied.
  ///
  /// In en, this message translates to:
  /// **'Referral code copied'**
  String get referralCodeCopied;

  /// No description provided for @referralShareWithFriends.
  ///
  /// In en, this message translates to:
  /// **'Share with friends'**
  String get referralShareWithFriends;

  /// No description provided for @referralFooterHint.
  ///
  /// In en, this message translates to:
  /// **'Friends enter your code when they create an account. Each friend counts once toward your reward.'**
  String get referralFooterHint;

  /// No description provided for @referralFriendsJoinedOne.
  ///
  /// In en, this message translates to:
  /// **'{count} friend joined'**
  String referralFriendsJoinedOne(int count);

  /// No description provided for @referralFriendsJoinedMany.
  ///
  /// In en, this message translates to:
  /// **'{count} friends joined'**
  String referralFriendsJoinedMany(int count);

  /// No description provided for @referralRewardsEarnedOne.
  ///
  /// In en, this message translates to:
  /// **'You have earned {count} free month of Pro.'**
  String referralRewardsEarnedOne(int count);

  /// No description provided for @referralRewardsEarnedMany.
  ///
  /// In en, this message translates to:
  /// **'You have earned {count} free months of Pro.'**
  String referralRewardsEarnedMany(int count);

  /// No description provided for @referralRewardUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Reward unlocked — enjoy your free month of Pro!'**
  String get referralRewardUnlocked;

  /// No description provided for @referralRemainingToUnlock.
  ///
  /// In en, this message translates to:
  /// **'{remaining} more to unlock your free month'**
  String referralRemainingToUnlock(int remaining);

  /// No description provided for @youProMemberSince.
  ///
  /// In en, this message translates to:
  /// **'Bloom Pro member since {month}'**
  String youProMemberSince(String month);

  /// No description provided for @youProPerksTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Pro perks'**
  String get youProPerksTitle;

  /// No description provided for @manageProThankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank you for supporting Bloom'**
  String get manageProThankYou;

  /// No description provided for @manageProReferralHint.
  ///
  /// In en, this message translates to:
  /// **'Invite more friends to extend your Pro'**
  String get manageProReferralHint;

  /// No description provided for @bootstrapConfigErrorBody.
  ///
  /// In en, this message translates to:
  /// **'{detail}\n\nAdd API_BASE_URL and GOOGLE_CLIENT_ID to leanspace/.env, then rebuild:\n\nflutter build apk --debug'**
  String bootstrapConfigErrorBody(String detail);

  /// No description provided for @languageSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystemDefault;

  /// No description provided for @languageNameEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageNameEn;

  /// No description provided for @languageNameUr.
  ///
  /// In en, this message translates to:
  /// **'???? (Urdu)'**
  String get languageNameUr;

  /// No description provided for @languageNameEs.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageNameEs;

  /// No description provided for @languageNamePt.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get languageNamePt;

  /// No description provided for @languageNameFr.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageNameFr;

  /// No description provided for @languageNameDe.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get languageNameDe;

  /// No description provided for @languageNameIt.
  ///
  /// In en, this message translates to:
  /// **'Italiano'**
  String get languageNameIt;

  /// No description provided for @languageNameAr.
  ///
  /// In en, this message translates to:
  /// **'???????'**
  String get languageNameAr;

  /// No description provided for @languageNameTr.
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get languageNameTr;

  /// No description provided for @languageNameId.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Indonesia'**
  String get languageNameId;

  /// No description provided for @onboardingLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get onboardingLanguageTitle;

  /// No description provided for @onboardingLanguageBody.
  ///
  /// In en, this message translates to:
  /// **'Pick the language you\'d like to use throughout Daily Stitch. You can change it anytime in Settings.'**
  String get onboardingLanguageBody;

  /// No description provided for @onboardingLanguageContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingLanguageContinue;

  /// No description provided for @commonPro.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get commonPro;

  /// No description provided for @commonFriend.
  ///
  /// In en, this message translates to:
  /// **'Friend'**
  String get commonFriend;

  /// No description provided for @settingsAppTheme.
  ///
  /// In en, this message translates to:
  /// **'App Theme'**
  String get settingsAppTheme;

  /// No description provided for @settingsAppThemeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your personal sanctuary colors'**
  String get settingsAppThemeSubtitle;

  /// No description provided for @settingsInviteFriendsTitle.
  ///
  /// In en, this message translates to:
  /// **'Invite friends · Free Pro'**
  String get settingsInviteFriendsTitle;

  /// No description provided for @settingsInviteFriendsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get 1 month free when 5 friends join'**
  String get settingsInviteFriendsSubtitle;

  /// No description provided for @themePickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Sanctuary'**
  String get themePickerTitle;

  /// No description provided for @themePickerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a color palette that brings you peace.'**
  String get themePickerSubtitle;

  /// No description provided for @themeNameClassicBloom.
  ///
  /// In en, this message translates to:
  /// **'Classic Bloom'**
  String get themeNameClassicBloom;

  /// No description provided for @themeNameSolarTerracotta.
  ///
  /// In en, this message translates to:
  /// **'Solar Terracotta'**
  String get themeNameSolarTerracotta;

  /// No description provided for @themeNameMidnightOasis.
  ///
  /// In en, this message translates to:
  /// **'Midnight Oasis'**
  String get themeNameMidnightOasis;

  /// No description provided for @themeNameLavenderDream.
  ///
  /// In en, this message translates to:
  /// **'Lavender Dream'**
  String get themeNameLavenderDream;

  /// No description provided for @themeNameNordicFrost.
  ///
  /// In en, this message translates to:
  /// **'Nordic Frost'**
  String get themeNameNordicFrost;

  /// No description provided for @themeNameCyberpunkNeon.
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk Neon'**
  String get themeNameCyberpunkNeon;

  /// No description provided for @reminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminderTitle;

  /// No description provided for @reminderBody.
  ///
  /// In en, this message translates to:
  /// **'Final Call pings you before midnight if tasks are still open.'**
  String get reminderBody;

  /// No description provided for @reminderFinalCall.
  ///
  /// In en, this message translates to:
  /// **'Final Call'**
  String get reminderFinalCall;

  /// No description provided for @reminderEveningNudge.
  ///
  /// In en, this message translates to:
  /// **'Evening nudge'**
  String get reminderEveningNudge;

  /// No description provided for @reminderChangeTime.
  ///
  /// In en, this message translates to:
  /// **'Change time'**
  String get reminderChangeTime;

  /// No description provided for @reminderSave.
  ///
  /// In en, this message translates to:
  /// **'Save reminders'**
  String get reminderSave;

  /// No description provided for @notificationChannelReminders.
  ///
  /// In en, this message translates to:
  /// **'Daily Stitch reminders'**
  String get notificationChannelReminders;

  /// No description provided for @notificationChannelRemindersDesc.
  ///
  /// In en, this message translates to:
  /// **'Evening nudge and Final Call reminders'**
  String get notificationChannelRemindersDesc;

  /// No description provided for @notificationChannelAlarms.
  ///
  /// In en, this message translates to:
  /// **'Daily Stitch task alarms'**
  String get notificationChannelAlarms;

  /// No description provided for @notificationChannelAlarmsDesc.
  ///
  /// In en, this message translates to:
  /// **'Loud alarms for task reminders'**
  String get notificationChannelAlarmsDesc;

  /// No description provided for @notificationTaskReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Task reminder'**
  String get notificationTaskReminderTitle;

  /// No description provided for @notificationFinalCallTitle.
  ///
  /// In en, this message translates to:
  /// **'Final Call'**
  String get notificationFinalCallTitle;

  /// No description provided for @notificationFinalCallBody.
  ///
  /// In en, this message translates to:
  /// **'You still have {count} open task(s) today.'**
  String notificationFinalCallBody(int count);

  /// No description provided for @notificationEveningTitle.
  ///
  /// In en, this message translates to:
  /// **'Evening check-in'**
  String get notificationEveningTitle;

  /// No description provided for @notificationEveningBody.
  ///
  /// In en, this message translates to:
  /// **'How did your garden grow today?'**
  String get notificationEveningBody;

  /// No description provided for @widgetSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Add chain widget'**
  String get widgetSetupTitle;

  /// No description provided for @widgetSetupBody.
  ///
  /// In en, this message translates to:
  /// **'Keep your streak on your home screen — no need to open the app.'**
  String get widgetSetupBody;

  /// No description provided for @widgetSetupAdd.
  ///
  /// In en, this message translates to:
  /// **'Add to home screen'**
  String get widgetSetupAdd;

  /// No description provided for @widgetSetupStep1.
  ///
  /// In en, this message translates to:
  /// **'Long-press your home screen'**
  String get widgetSetupStep1;

  /// No description provided for @widgetSetupStep2.
  ///
  /// In en, this message translates to:
  /// **'Tap Widgets'**
  String get widgetSetupStep2;

  /// No description provided for @widgetSetupStep3.
  ///
  /// In en, this message translates to:
  /// **'Find Daily Stitch and drag it on'**
  String get widgetSetupStep3;

  /// No description provided for @widgetSetupPinSuccess.
  ///
  /// In en, this message translates to:
  /// **'Check your home screen to place the widget.'**
  String get widgetSetupPinSuccess;

  /// No description provided for @widgetSetupPinFallback.
  ///
  /// In en, this message translates to:
  /// **'Your launcher may not support one-tap add. Use manual steps below.'**
  String get widgetSetupPinFallback;

  /// No description provided for @paywallWelcomePro.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Daily Stitch Pro'**
  String get paywallWelcomePro;

  /// No description provided for @paywallSavePercent.
  ///
  /// In en, this message translates to:
  /// **'SAVE ~16%'**
  String get paywallSavePercent;

  /// No description provided for @paywallTermsTitle.
  ///
  /// In en, this message translates to:
  /// **'Subscription terms'**
  String get paywallTermsTitle;

  /// No description provided for @paywallTermsBody.
  ///
  /// In en, this message translates to:
  /// **'Billing is handled by Google Play. Subscriptions renew automatically until you cancel in Play Store ? Subscriptions at least 24 hours before the end of the current period. You can manage or cancel your subscription at any time from your Google Play account.\n\nUninstalling the app does not cancel your subscription.\n\nPrices shown are in your local currency and may vary by region. Taxes may apply.'**
  String get paywallTermsBody;

  /// No description provided for @paywallPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get paywallPrivacyTitle;

  /// No description provided for @paywallPrivacyBody.
  ///
  /// In en, this message translates to:
  /// **'Daily Stitch stores your tasks, habits, and streak data on our secure backend, tied to your account. We never sell your data.\n\nSubscription purchases are processed by Google Play. We receive a verified purchase token from Google to confirm your Pro status. We do not see or store your payment details.\n\nYou can request full data export or account deletion from Settings ? Account deletion.'**
  String get paywallPrivacyBody;

  /// No description provided for @paywallCloseTooltip.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get paywallCloseTooltip;

  /// No description provided for @paywallFooterLinks.
  ///
  /// In en, this message translates to:
  /// **'Restore · Terms · Privacy'**
  String get paywallFooterLinks;

  /// No description provided for @manageProTitle.
  ///
  /// In en, this message translates to:
  /// **'Pro subscription'**
  String get manageProTitle;

  /// No description provided for @manageProActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get manageProActive;

  /// No description provided for @manageProNotSubscribed.
  ///
  /// In en, this message translates to:
  /// **'Not subscribed'**
  String get manageProNotSubscribed;

  /// No description provided for @manageProFreeTier.
  ///
  /// In en, this message translates to:
  /// **'Free tier'**
  String get manageProFreeTier;

  /// No description provided for @manageProRenewsOn.
  ///
  /// In en, this message translates to:
  /// **'Renews or expires on {date}.'**
  String manageProRenewsOn(String date);

  /// No description provided for @manageProFreeBody.
  ///
  /// In en, this message translates to:
  /// **'You\'re using Daily Stitch Free. Upgrade to unlock the full system.'**
  String get manageProFreeBody;

  /// No description provided for @manageProSectionManage.
  ///
  /// In en, this message translates to:
  /// **'MANAGE'**
  String get manageProSectionManage;

  /// No description provided for @manageProOpenPlay.
  ///
  /// In en, this message translates to:
  /// **'Open Google Play subscriptions'**
  String get manageProOpenPlay;

  /// No description provided for @manageProOpenPlaySubtitlePro.
  ///
  /// In en, this message translates to:
  /// **'Cancel, change plan, or update payment method'**
  String get manageProOpenPlaySubtitlePro;

  /// No description provided for @manageProOpenPlaySubtitleFree.
  ///
  /// In en, this message translates to:
  /// **'Find your existing subscription (if any) here'**
  String get manageProOpenPlaySubtitleFree;

  /// No description provided for @manageProShareApp.
  ///
  /// In en, this message translates to:
  /// **'Share Daily Stitch'**
  String get manageProShareApp;

  /// No description provided for @manageProShareSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell a friend about the chain'**
  String get manageProShareSubtitle;

  /// No description provided for @manageProSectionHelp.
  ///
  /// In en, this message translates to:
  /// **'NEED HELP?'**
  String get manageProSectionHelp;

  /// No description provided for @manageProHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get manageProHelpTitle;

  /// No description provided for @manageProHelpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Subscription FAQ, contact, bug reports'**
  String get manageProHelpSubtitle;

  /// No description provided for @manageProBillingFooter.
  ///
  /// In en, this message translates to:
  /// **'Billing handled by Google Play · {version}'**
  String manageProBillingFooter(String version);

  /// No description provided for @manageProPlayInstructions.
  ///
  /// In en, this message translates to:
  /// **'Open the Google Play Store app ? tap your profile ? Payments & subscriptions ? Subscriptions.'**
  String get manageProPlayInstructions;

  /// No description provided for @addTaskGrowSomething.
  ///
  /// In en, this message translates to:
  /// **'Grow Something'**
  String get addTaskGrowSomething;

  /// No description provided for @addTaskPlantSprout.
  ///
  /// In en, this message translates to:
  /// **'Plant a Sprout'**
  String get addTaskPlantSprout;

  /// No description provided for @addTaskIntentionName.
  ///
  /// In en, this message translates to:
  /// **'INTENTION NAME'**
  String get addTaskIntentionName;

  /// No description provided for @addTaskSproutName.
  ///
  /// In en, this message translates to:
  /// **'SPROUT NAME'**
  String get addTaskSproutName;

  /// No description provided for @addTaskHintTask.
  ///
  /// In en, this message translates to:
  /// **'e.g., Morning Sun Salutation'**
  String get addTaskHintTask;

  /// No description provided for @addTaskHintHabit.
  ///
  /// In en, this message translates to:
  /// **'e.g. Morning Yoga'**
  String get addTaskHintHabit;

  /// No description provided for @addTaskWhen.
  ///
  /// In en, this message translates to:
  /// **'WHEN?'**
  String get addTaskWhen;

  /// No description provided for @addTaskPriority.
  ///
  /// In en, this message translates to:
  /// **'PRIORITY'**
  String get addTaskPriority;

  /// No description provided for @addTaskNotes.
  ///
  /// In en, this message translates to:
  /// **'NOTES'**
  String get addTaskNotes;

  /// No description provided for @addTaskCadenceDaily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get addTaskCadenceDaily;

  /// No description provided for @addTaskCadenceWeekdays.
  ///
  /// In en, this message translates to:
  /// **'Weekdays'**
  String get addTaskCadenceWeekdays;

  /// No description provided for @addTaskCadence3x.
  ///
  /// In en, this message translates to:
  /// **'3x/week'**
  String get addTaskCadence3x;

  /// No description provided for @addTaskCadenceWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get addTaskCadenceWeekly;

  /// No description provided for @addTaskPlantIntention.
  ///
  /// In en, this message translates to:
  /// **'Plant Intention'**
  String get addTaskPlantIntention;

  /// No description provided for @addTaskPlantSproutCta.
  ///
  /// In en, this message translates to:
  /// **'Plant Sprout'**
  String get addTaskPlantSproutCta;

  /// No description provided for @addTaskPlanting.
  ///
  /// In en, this message translates to:
  /// **'Planting…'**
  String get addTaskPlanting;

  /// No description provided for @addTaskNameIntentionError.
  ///
  /// In en, this message translates to:
  /// **'Name your intention'**
  String get addTaskNameIntentionError;

  /// No description provided for @addTaskNameSproutError.
  ///
  /// In en, this message translates to:
  /// **'Name your sprout'**
  String get addTaskNameSproutError;

  /// No description provided for @addTaskNotesMigrationWarning.
  ///
  /// In en, this message translates to:
  /// **'Task saved. Notes & priority require the latest backend migration.'**
  String get addTaskNotesMigrationWarning;

  /// No description provided for @addTaskNoSproutSlots.
  ///
  /// In en, this message translates to:
  /// **'No empty sprout slots — tend one first.'**
  String get addTaskNoSproutSlots;

  /// No description provided for @addTaskSaveSproutError.
  ///
  /// In en, this message translates to:
  /// **'Could not save sprout — try again.'**
  String get addTaskSaveSproutError;

  /// No description provided for @addTaskElementWater.
  ///
  /// In en, this message translates to:
  /// **'WATER'**
  String get addTaskElementWater;

  /// No description provided for @addTaskElementLight.
  ///
  /// In en, this message translates to:
  /// **'LIGHT'**
  String get addTaskElementLight;

  /// No description provided for @addTaskElementSoil.
  ///
  /// In en, this message translates to:
  /// **'SOIL'**
  String get addTaskElementSoil;

  /// No description provided for @addTaskElementBreeze.
  ///
  /// In en, this message translates to:
  /// **'BREEZE'**
  String get addTaskElementBreeze;

  /// No description provided for @addTaskCadenceLabel.
  ///
  /// In en, this message translates to:
  /// **'CADENCE'**
  String get addTaskCadenceLabel;

  /// No description provided for @addTaskPreparationNotes.
  ///
  /// In en, this message translates to:
  /// **'PREPARATION NOTES'**
  String get addTaskPreparationNotes;

  /// No description provided for @addTaskTendingNotes.
  ///
  /// In en, this message translates to:
  /// **'TENDING NOTES'**
  String get addTaskTendingNotes;

  /// No description provided for @addTaskNotesHintTask.
  ///
  /// In en, this message translates to:
  /// **'Any tools or mindset tips for this task?'**
  String get addTaskNotesHintTask;

  /// No description provided for @addTaskNotesHintHabit.
  ///
  /// In en, this message translates to:
  /// **'What does tending this sprout look like?'**
  String get addTaskNotesHintHabit;

  /// No description provided for @addTaskChooseElement.
  ///
  /// In en, this message translates to:
  /// **'CHOOSE ELEMENT'**
  String get addTaskChooseElement;

  /// No description provided for @addTaskElementsTooltip.
  ///
  /// In en, this message translates to:
  /// **'What do the elements mean?'**
  String get addTaskElementsTooltip;

  /// No description provided for @addTaskTaskSeed.
  ///
  /// In en, this message translates to:
  /// **'Task Seed'**
  String get addTaskTaskSeed;

  /// No description provided for @addTaskHabitSprout.
  ///
  /// In en, this message translates to:
  /// **'Habit Sprout'**
  String get addTaskHabitSprout;

  /// No description provided for @addTaskPickElement.
  ///
  /// In en, this message translates to:
  /// **'Pick the right element'**
  String get addTaskPickElement;

  /// No description provided for @addTaskPickElementBody.
  ///
  /// In en, this message translates to:
  /// **'Each element maps to a different kind of effort. The Guardian grows stronger when you water the right one.'**
  String get addTaskPickElementBody;

  /// No description provided for @addTaskClearForm.
  ///
  /// In en, this message translates to:
  /// **'Clear form'**
  String get addTaskClearForm;

  /// No description provided for @shareCouldNotShare.
  ///
  /// In en, this message translates to:
  /// **'Could not share right now'**
  String get shareCouldNotShare;

  /// No description provided for @authReferralCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Referral code (optional)'**
  String get authReferralCodeLabel;

  /// No description provided for @authReferralCodeHint.
  ///
  /// In en, this message translates to:
  /// **'Friend\'s code'**
  String get authReferralCodeHint;

  /// No description provided for @youPerkHabitSlots.
  ///
  /// In en, this message translates to:
  /// **'5 habit slots'**
  String get youPerkHabitSlots;

  /// No description provided for @youPerkFullHistory.
  ///
  /// In en, this message translates to:
  /// **'Full history'**
  String get youPerkFullHistory;

  /// No description provided for @youPerkAllThemes.
  ///
  /// In en, this message translates to:
  /// **'All themes'**
  String get youPerkAllThemes;

  /// No description provided for @youPerkStreakFreezes.
  ///
  /// In en, this message translates to:
  /// **'2 streak freezes / month'**
  String get youPerkStreakFreezes;

  /// No description provided for @youPerkLegendaryMedals.
  ///
  /// In en, this message translates to:
  /// **'Legendary medals'**
  String get youPerkLegendaryMedals;

  /// No description provided for @subscriptionPurchaseFailed.
  ///
  /// In en, this message translates to:
  /// **'Purchase failed. Try again.'**
  String get subscriptionPurchaseFailed;

  /// No description provided for @subscriptionUnavailable.
  ///
  /// In en, this message translates to:
  /// **'In-app purchases are unavailable on this device.'**
  String get subscriptionUnavailable;

  /// No description provided for @subscriptionLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load subscription options.'**
  String get subscriptionLoadFailed;

  /// No description provided for @subscriptionVerifyFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not verify purchase. Try Restore purchase.'**
  String get subscriptionVerifyFailed;

  /// No description provided for @streakFreezeFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not use streak freeze.'**
  String get streakFreezeFailed;

  /// No description provided for @streakFreezeAlreadyUsed.
  ///
  /// In en, this message translates to:
  /// **'You already used your freeze this month.'**
  String get streakFreezeAlreadyUsed;

  /// No description provided for @streakFreezeNoMissed.
  ///
  /// In en, this message translates to:
  /// **'No missed tasks on that day to freeze.'**
  String get streakFreezeNoMissed;

  /// No description provided for @streakFreezeNotPastDay.
  ///
  /// In en, this message translates to:
  /// **'You can only freeze a past day.'**
  String get streakFreezeNotPastDay;

  /// No description provided for @myDayLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load My Day. Pull to refresh.'**
  String get myDayLoadError;

  /// No description provided for @myDayCapReached.
  ///
  /// In en, this message translates to:
  /// **'You\'ve hit today\'s 5-task cap.'**
  String get myDayCapReached;

  /// No description provided for @myDayRemoveTaskError.
  ///
  /// In en, this message translates to:
  /// **'Could not remove task.'**
  String get myDayRemoveTaskError;

  /// No description provided for @shareCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Share your week'**
  String get shareCardTitle;

  /// No description provided for @shareCardCta.
  ///
  /// In en, this message translates to:
  /// **'Share image'**
  String get shareCardCta;

  /// No description provided for @medalTierSprout.
  ///
  /// In en, this message translates to:
  /// **'Sprout'**
  String get medalTierSprout;

  /// No description provided for @medalTierCommon.
  ///
  /// In en, this message translates to:
  /// **'Common'**
  String get medalTierCommon;

  /// No description provided for @medalTierRare.
  ///
  /// In en, this message translates to:
  /// **'Rare'**
  String get medalTierRare;

  /// No description provided for @medalTierEpic.
  ///
  /// In en, this message translates to:
  /// **'Epic'**
  String get medalTierEpic;

  /// No description provided for @medalTierLegendary.
  ///
  /// In en, this message translates to:
  /// **'Legendary'**
  String get medalTierLegendary;

  /// No description provided for @medalCategoryTasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get medalCategoryTasks;

  /// No description provided for @medalCategoryHabits.
  ///
  /// In en, this message translates to:
  /// **'Habits'**
  String get medalCategoryHabits;

  /// No description provided for @medalCategoryStreaks.
  ///
  /// In en, this message translates to:
  /// **'Streaks'**
  String get medalCategoryStreaks;

  /// No description provided for @medalCategoryMastery.
  ///
  /// In en, this message translates to:
  /// **'Mastery'**
  String get medalCategoryMastery;

  /// No description provided for @medalsShareTooltip.
  ///
  /// In en, this message translates to:
  /// **'Share achievements'**
  String get medalsShareTooltip;

  /// No description provided for @medalsFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get medalsFilterAll;

  /// No description provided for @addHabitTitleNew.
  ///
  /// In en, this message translates to:
  /// **'Plant a new sprout'**
  String get addHabitTitleNew;

  /// No description provided for @addHabitTitleEdit.
  ///
  /// In en, this message translates to:
  /// **'Tend your sprout'**
  String get addHabitTitleEdit;

  /// No description provided for @addHabitLabelSproutName.
  ///
  /// In en, this message translates to:
  /// **'SPROUT NAME'**
  String get addHabitLabelSproutName;

  /// No description provided for @shareCardAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Share Card'**
  String get shareCardAppBarTitle;

  /// No description provided for @shareCardAppBarTitleMedal.
  ///
  /// In en, this message translates to:
  /// **'Share your medal'**
  String get shareCardAppBarTitleMedal;

  /// No description provided for @shareCardDescMedal.
  ///
  /// In en, this message translates to:
  /// **'Show off your new {title} badge'**
  String shareCardDescMedal(Object title);

  /// No description provided for @shareCardBodyMedal.
  ///
  /// In en, this message translates to:
  /// **'Share the win with your circle. The card is exported as a PNG and ready for any social app.'**
  String get shareCardBodyMedal;

  /// No description provided for @shareCardCtaPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing…'**
  String get shareCardCtaPreparing;

  /// No description provided for @shareCardMilestone.
  ///
  /// In en, this message translates to:
  /// **'NEW MILESTONE UNLOCKED'**
  String get shareCardMilestone;

  /// No description provided for @shareCardStatChain.
  ///
  /// In en, this message translates to:
  /// **'day chain'**
  String get shareCardStatChain;

  /// No description provided for @shareCardStatSprouts.
  ///
  /// In en, this message translates to:
  /// **'sprouts'**
  String get shareCardStatSprouts;

  /// No description provided for @shareCardStatMedals.
  ///
  /// In en, this message translates to:
  /// **'medals'**
  String get shareCardStatMedals;

  /// No description provided for @shareCardHeadlineStreak.
  ///
  /// In en, this message translates to:
  /// **'{days} Day Streak'**
  String shareCardHeadlineStreak(int days);

  /// No description provided for @shareCardHeadlineMedals.
  ///
  /// In en, this message translates to:
  /// **'{count} Medals Earned'**
  String shareCardHeadlineMedals(int count);

  /// No description provided for @shareCardHeadlineSproutGuardian.
  ///
  /// In en, this message translates to:
  /// **'Sprout Guardian'**
  String get shareCardHeadlineSproutGuardian;

  /// No description provided for @shareCardHeadlineFirstSeeds.
  ///
  /// In en, this message translates to:
  /// **'First Seeds Planted'**
  String get shareCardHeadlineFirstSeeds;

  /// No description provided for @shareCardHeadlineGardenBegins.
  ///
  /// In en, this message translates to:
  /// **'A Garden Begins'**
  String get shareCardHeadlineGardenBegins;

  /// No description provided for @shareCardSubheadMonth.
  ///
  /// In en, this message translates to:
  /// **'You\'ve successfully nurtured your habits for a full month.'**
  String get shareCardSubheadMonth;

  /// No description provided for @shareCardSubheadWeek.
  ///
  /// In en, this message translates to:
  /// **'A full week of growth — your forest is thickening.'**
  String get shareCardSubheadWeek;

  /// No description provided for @shareCardSubheadProgress.
  ///
  /// In en, this message translates to:
  /// **'Your sanctuary is showing real progress. Keep tending.'**
  String get shareCardSubheadProgress;

  /// No description provided for @shareCardSubheadSprouts.
  ///
  /// In en, this message translates to:
  /// **'Your first sprouts are taking root. Water them daily.'**
  String get shareCardSubheadSprouts;

  /// No description provided for @shareCardSubheadFirstSeeds.
  ///
  /// In en, this message translates to:
  /// **'Your first seeds are in the soil. Watch them open.'**
  String get shareCardSubheadFirstSeeds;

  /// No description provided for @shareCardSubheadFallback.
  ///
  /// In en, this message translates to:
  /// **'Every forest begins with one tiny choice.'**
  String get shareCardSubheadFallback;

  /// No description provided for @shareAppText.
  ///
  /// In en, this message translates to:
  /// **'Daily Stitch — five small seeds a day, one unbreakable chain. Plant yours.\n\n{url}'**
  String shareAppText(String url);

  /// No description provided for @shareAppSubject.
  ///
  /// In en, this message translates to:
  /// **'Try Daily Stitch'**
  String get shareAppSubject;

  /// No description provided for @shareAppReferralText.
  ///
  /// In en, this message translates to:
  /// **'I\'m building my daily chain on Daily Stitch — join me with my referral code {code} and we both grow.\n\n{url}'**
  String shareAppReferralText(String code, String url);

  /// No description provided for @shareAppReferralSubject.
  ///
  /// In en, this message translates to:
  /// **'Join me on Daily Stitch'**
  String get shareAppReferralSubject;

  /// No description provided for @shareCardShareTextProgress.
  ///
  /// In en, this message translates to:
  /// **'My Daily Stitch progress — {year} on Daily Stitch.'**
  String shareCardShareTextProgress(String year);

  /// No description provided for @shareCardShareTextMedal.
  ///
  /// In en, this message translates to:
  /// **'I just unlocked the \"{title}\" medal on Daily Stitch. {subtitle}'**
  String shareCardShareTextMedal(String title, String subtitle);

  /// No description provided for @insightsReceiptTasksDone.
  ///
  /// In en, this message translates to:
  /// **'Tasks done'**
  String get insightsReceiptTasksDone;

  /// No description provided for @insightsReceiptPerfectDays.
  ///
  /// In en, this message translates to:
  /// **'Perfect days'**
  String get insightsReceiptPerfectDays;

  /// No description provided for @insightsReceiptCompletion.
  ///
  /// In en, this message translates to:
  /// **'Completion'**
  String get insightsReceiptCompletion;

  /// No description provided for @insightsReceiptDate.
  ///
  /// In en, this message translates to:
  /// **'Week of {date}'**
  String insightsReceiptDate(String date);

  /// No description provided for @insightsReceiptFooter.
  ///
  /// In en, this message translates to:
  /// **'Don\'t break the chain.'**
  String get insightsReceiptFooter;

  /// No description provided for @elementLabelWater.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get elementLabelWater;

  /// No description provided for @elementLabelLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get elementLabelLight;

  /// No description provided for @elementLabelSoil.
  ///
  /// In en, this message translates to:
  /// **'Soil'**
  String get elementLabelSoil;

  /// No description provided for @elementLabelBreeze.
  ///
  /// In en, this message translates to:
  /// **'Breeze'**
  String get elementLabelBreeze;

  /// No description provided for @elementTaglineWater.
  ///
  /// In en, this message translates to:
  /// **'Restore. Hydration, rest, emotional care — anything that refills the well.'**
  String get elementTaglineWater;

  /// No description provided for @elementTaglineLight.
  ///
  /// In en, this message translates to:
  /// **'Awaken. Morning light, focus blocks, study, meditation — energy and clarity.'**
  String get elementTaglineLight;

  /// No description provided for @elementTaglineSoil.
  ///
  /// In en, this message translates to:
  /// **'Ground. Reading, journaling, deep work — slow roots that build long-term strength.'**
  String get elementTaglineSoil;

  /// No description provided for @elementTaglineBreeze.
  ///
  /// In en, this message translates to:
  /// **'Move. Walks, runs, breathwork — light, mobile energy that clears the head.'**
  String get elementTaglineBreeze;

  /// No description provided for @elementWhenWater.
  ///
  /// In en, this message translates to:
  /// **'When you feel drained or depleted.'**
  String get elementWhenWater;

  /// No description provided for @elementWhenLight.
  ///
  /// In en, this message translates to:
  /// **'When you need a clear start to your day.'**
  String get elementWhenLight;

  /// No description provided for @elementWhenSoil.
  ///
  /// In en, this message translates to:
  /// **'When the work is slow but worth it (study, craft, care).'**
  String get elementWhenSoil;

  /// No description provided for @elementWhenBreeze.
  ///
  /// In en, this message translates to:
  /// **'When your body (or mind) needs to move and breathe.'**
  String get elementWhenBreeze;

  /// No description provided for @bloomTierMastery.
  ///
  /// In en, this message translates to:
  /// **'Mastery'**
  String get bloomTierMastery;

  /// No description provided for @bloomTierStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get bloomTierStrong;

  /// No description provided for @bloomTierGrowing.
  ///
  /// In en, this message translates to:
  /// **'Growing'**
  String get bloomTierGrowing;

  /// No description provided for @bloomTierSprouting.
  ///
  /// In en, this message translates to:
  /// **'Sprouting'**
  String get bloomTierSprouting;

  /// No description provided for @bloomTierLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get bloomTierLocked;

  /// No description provided for @habitBloomSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count} day streak · {element}'**
  String habitBloomSubtitle(int count, String element);

  /// No description provided for @medal_id_first_spark.
  ///
  /// In en, this message translates to:
  /// **'First Spark'**
  String get medal_id_first_spark;

  /// No description provided for @medal_sub_first_spark.
  ///
  /// In en, this message translates to:
  /// **'You lit the match.'**
  String get medal_sub_first_spark;

  /// No description provided for @medal_desc_first_spark.
  ///
  /// In en, this message translates to:
  /// **'Finish your very first task. Every chain starts here.'**
  String get medal_desc_first_spark;

  /// No description provided for @medal_id_triple_seed.
  ///
  /// In en, this message translates to:
  /// **'Triple Seed'**
  String get medal_id_triple_seed;

  /// No description provided for @medal_sub_triple_seed.
  ///
  /// In en, this message translates to:
  /// **'Three into the soil.'**
  String get medal_sub_triple_seed;

  /// No description provided for @medal_desc_triple_seed.
  ///
  /// In en, this message translates to:
  /// **'Finish 3 tasks in total.'**
  String get medal_desc_triple_seed;

  /// No description provided for @medal_id_dozen_sower.
  ///
  /// In en, this message translates to:
  /// **'Dozen Sower'**
  String get medal_id_dozen_sower;

  /// No description provided for @medal_sub_dozen_sower.
  ///
  /// In en, this message translates to:
  /// **'A field of twelve.'**
  String get medal_sub_dozen_sower;

  /// No description provided for @medal_desc_dozen_sower.
  ///
  /// In en, this message translates to:
  /// **'Finish 12 tasks in total.'**
  String get medal_desc_dozen_sower;

  /// No description provided for @medal_id_quarter_century.
  ///
  /// In en, this message translates to:
  /// **'Quarter Century'**
  String get medal_id_quarter_century;

  /// No description provided for @medal_sub_quarter_century.
  ///
  /// In en, this message translates to:
  /// **'A season of saying yes.'**
  String get medal_sub_quarter_century;

  /// No description provided for @medal_desc_quarter_century.
  ///
  /// In en, this message translates to:
  /// **'Finish 25 tasks in total.'**
  String get medal_desc_quarter_century;

  /// No description provided for @medal_id_productivity_titan.
  ///
  /// In en, this message translates to:
  /// **'Productivity Titan'**
  String get medal_id_productivity_titan;

  /// No description provided for @medal_sub_productivity_titan.
  ///
  /// In en, this message translates to:
  /// **'Consistency compounds.'**
  String get medal_sub_productivity_titan;

  /// No description provided for @medal_desc_productivity_titan.
  ///
  /// In en, this message translates to:
  /// **'Finish 50 tasks — you\'ve built real momentum.'**
  String get medal_desc_productivity_titan;

  /// No description provided for @medal_id_century_planter.
  ///
  /// In en, this message translates to:
  /// **'Century Planter'**
  String get medal_id_century_planter;

  /// No description provided for @medal_sub_century_planter.
  ///
  /// In en, this message translates to:
  /// **'A forest of your own.'**
  String get medal_sub_century_planter;

  /// No description provided for @medal_desc_century_planter.
  ///
  /// In en, this message translates to:
  /// **'Finish 100 tasks. You\'re in the top 5% of users.'**
  String get medal_desc_century_planter;

  /// No description provided for @medal_id_clean_day.
  ///
  /// In en, this message translates to:
  /// **'Clean Slate'**
  String get medal_id_clean_day;

  /// No description provided for @medal_sub_clean_day.
  ///
  /// In en, this message translates to:
  /// **'Not a single weed.'**
  String get medal_sub_clean_day;

  /// No description provided for @medal_desc_clean_day.
  ///
  /// In en, this message translates to:
  /// **'Finish every task you plant on a single day.'**
  String get medal_desc_clean_day;

  /// No description provided for @medal_id_triple_perfect.
  ///
  /// In en, this message translates to:
  /// **'Triple Perfect'**
  String get medal_id_triple_perfect;

  /// No description provided for @medal_sub_triple_perfect.
  ///
  /// In en, this message translates to:
  /// **'Three flawless runs.'**
  String get medal_sub_triple_perfect;

  /// No description provided for @medal_desc_triple_perfect.
  ///
  /// In en, this message translates to:
  /// **'Hit 3 perfect days.'**
  String get medal_desc_triple_perfect;

  /// No description provided for @medal_id_perfect_week.
  ///
  /// In en, this message translates to:
  /// **'Perfect Week'**
  String get medal_id_perfect_week;

  /// No description provided for @medal_sub_perfect_week.
  ///
  /// In en, this message translates to:
  /// **'Seven days unbroken.'**
  String get medal_sub_perfect_week;

  /// No description provided for @medal_desc_perfect_week.
  ///
  /// In en, this message translates to:
  /// **'7 perfect days in a row.'**
  String get medal_desc_perfect_week;

  /// No description provided for @medal_id_two_week_chain.
  ///
  /// In en, this message translates to:
  /// **'Fortnight Force'**
  String get medal_id_two_week_chain;

  /// No description provided for @medal_sub_two_week_chain.
  ///
  /// In en, this message translates to:
  /// **'Two weeks on fire.'**
  String get medal_sub_two_week_chain;

  /// No description provided for @medal_desc_two_week_chain.
  ///
  /// In en, this message translates to:
  /// **'Hold a 14-day chain.'**
  String get medal_desc_two_week_chain;

  /// No description provided for @medal_id_iron_chain.
  ///
  /// In en, this message translates to:
  /// **'Iron Chain'**
  String get medal_id_iron_chain;

  /// No description provided for @medal_sub_iron_chain.
  ///
  /// In en, this message translates to:
  /// **'30 links forged.'**
  String get medal_sub_iron_chain;

  /// No description provided for @medal_desc_iron_chain.
  ///
  /// In en, this message translates to:
  /// **'A 30-day chain. The hardest task medal.'**
  String get medal_desc_iron_chain;

  /// No description provided for @medal_id_quarterly_chain.
  ///
  /// In en, this message translates to:
  /// **'Quarterly Chain'**
  String get medal_id_quarterly_chain;

  /// No description provided for @medal_sub_quarterly_chain.
  ///
  /// In en, this message translates to:
  /// **'A season, unbroken.'**
  String get medal_sub_quarterly_chain;

  /// No description provided for @medal_desc_quarterly_chain.
  ///
  /// In en, this message translates to:
  /// **'A 90-day chain. Legendary status.'**
  String get medal_desc_quarterly_chain;

  /// No description provided for @medal_id_vital_priority.
  ///
  /// In en, this message translates to:
  /// **'Vital Spark'**
  String get medal_id_vital_priority;

  /// No description provided for @medal_sub_vital_priority.
  ///
  /// In en, this message translates to:
  /// **'You picked the hard ones.'**
  String get medal_sub_vital_priority;

  /// No description provided for @medal_desc_vital_priority.
  ///
  /// In en, this message translates to:
  /// **'Finish 5 tasks marked as Vital priority.'**
  String get medal_desc_vital_priority;

  /// No description provided for @medal_id_spark_priority.
  ///
  /// In en, this message translates to:
  /// **'Spark Tamer'**
  String get medal_id_spark_priority;

  /// No description provided for @medal_sub_spark_priority.
  ///
  /// In en, this message translates to:
  /// **'Quick wins add up.'**
  String get medal_sub_spark_priority;

  /// No description provided for @medal_desc_spark_priority.
  ///
  /// In en, this message translates to:
  /// **'Finish 5 tasks marked as Spark priority.'**
  String get medal_desc_spark_priority;

  /// No description provided for @medal_id_note_taker.
  ///
  /// In en, this message translates to:
  /// **'Note Taker'**
  String get medal_id_note_taker;

  /// No description provided for @medal_sub_note_taker.
  ///
  /// In en, this message translates to:
  /// **'Plans on paper beat plans in head.'**
  String get medal_sub_note_taker;

  /// No description provided for @medal_desc_note_taker.
  ///
  /// In en, this message translates to:
  /// **'Add preparation notes to 5 different tasks.'**
  String get medal_desc_note_taker;

  /// No description provided for @medal_id_left_behind_rescuer.
  ///
  /// In en, this message translates to:
  /// **'Left-Behind Rescuer'**
  String get medal_id_left_behind_rescuer;

  /// No description provided for @medal_sub_left_behind_rescuer.
  ///
  /// In en, this message translates to:
  /// **'No task left behind.'**
  String get medal_sub_left_behind_rescuer;

  /// No description provided for @medal_desc_left_behind_rescuer.
  ///
  /// In en, this message translates to:
  /// **'Re-add 3 missed tasks the next day.'**
  String get medal_desc_left_behind_rescuer;

  /// No description provided for @medal_id_first_sprout.
  ///
  /// In en, this message translates to:
  /// **'First Sprout'**
  String get medal_id_first_sprout;

  /// No description provided for @medal_sub_first_sprout.
  ///
  /// In en, this message translates to:
  /// **'A new daily ritual.'**
  String get medal_sub_first_sprout;

  /// No description provided for @medal_desc_first_sprout.
  ///
  /// In en, this message translates to:
  /// **'Plant your first habit.'**
  String get medal_desc_first_sprout;

  /// No description provided for @medal_id_trio_sprout.
  ///
  /// In en, this message translates to:
  /// **'Trio Sprout'**
  String get medal_id_trio_sprout;

  /// No description provided for @medal_sub_trio_sprout.
  ///
  /// In en, this message translates to:
  /// **'A small ecosystem.'**
  String get medal_sub_trio_sprout;

  /// No description provided for @medal_desc_trio_sprout.
  ///
  /// In en, this message translates to:
  /// **'Plant 3 different habits.'**
  String get medal_desc_trio_sprout;

  /// No description provided for @medal_id_week_of_growth.
  ///
  /// In en, this message translates to:
  /// **'Week of Growth'**
  String get medal_id_week_of_growth;

  /// No description provided for @medal_sub_week_of_growth.
  ///
  /// In en, this message translates to:
  /// **'Roots start to hold.'**
  String get medal_sub_week_of_growth;

  /// No description provided for @medal_desc_week_of_growth.
  ///
  /// In en, this message translates to:
  /// **'Tend a habit every day for 7 days.'**
  String get medal_desc_week_of_growth;

  /// No description provided for @medal_id_fortnight_floret.
  ///
  /// In en, this message translates to:
  /// **'Fortnight Floret'**
  String get medal_id_fortnight_floret;

  /// No description provided for @medal_sub_fortnight_floret.
  ///
  /// In en, this message translates to:
  /// **'A full bloom.'**
  String get medal_sub_fortnight_floret;

  /// No description provided for @medal_desc_fortnight_floret.
  ///
  /// In en, this message translates to:
  /// **'A 14-day habit streak.'**
  String get medal_desc_fortnight_floret;

  /// No description provided for @medal_id_rooted_master.
  ///
  /// In en, this message translates to:
  /// **'Rooted Master'**
  String get medal_id_rooted_master;

  /// No description provided for @medal_sub_rooted_master.
  ///
  /// In en, this message translates to:
  /// **'Deep roots, deep strength.'**
  String get medal_sub_rooted_master;

  /// No description provided for @medal_desc_rooted_master.
  ///
  /// In en, this message translates to:
  /// **'A 30-day habit streak.'**
  String get medal_desc_rooted_master;

  /// No description provided for @medal_id_half_year_bloom.
  ///
  /// In en, this message translates to:
  /// **'Half-Year Bloom'**
  String get medal_id_half_year_bloom;

  /// No description provided for @medal_sub_half_year_bloom.
  ///
  /// In en, this message translates to:
  /// **'The garden is permanent now.'**
  String get medal_sub_half_year_bloom;

  /// No description provided for @medal_desc_half_year_bloom.
  ///
  /// In en, this message translates to:
  /// **'Hold a single habit for 180 days.'**
  String get medal_desc_half_year_bloom;

  /// No description provided for @medal_id_garden_keeper.
  ///
  /// In en, this message translates to:
  /// **'Garden Keeper'**
  String get medal_id_garden_keeper;

  /// No description provided for @medal_sub_garden_keeper.
  ///
  /// In en, this message translates to:
  /// **'Variety, together.'**
  String get medal_sub_garden_keeper;

  /// No description provided for @medal_desc_garden_keeper.
  ///
  /// In en, this message translates to:
  /// **'Grow 4 different habits at the same time.'**
  String get medal_desc_garden_keeper;

  /// No description provided for @medal_id_hydration_hero.
  ///
  /// In en, this message translates to:
  /// **'Hydration Hero'**
  String get medal_id_hydration_hero;

  /// No description provided for @medal_sub_hydration_hero.
  ///
  /// In en, this message translates to:
  /// **'You refill the well.'**
  String get medal_sub_hydration_hero;

  /// No description provided for @medal_desc_hydration_hero.
  ///
  /// In en, this message translates to:
  /// **'Plant a hydration habit (water/drink).'**
  String get medal_desc_hydration_hero;

  /// No description provided for @medal_id_mindful_mover.
  ///
  /// In en, this message translates to:
  /// **'Mindful Mover'**
  String get medal_id_mindful_mover;

  /// No description provided for @medal_sub_mindful_mover.
  ///
  /// In en, this message translates to:
  /// **'The body remembers.'**
  String get medal_sub_mindful_mover;

  /// No description provided for @medal_desc_mindful_mover.
  ///
  /// In en, this message translates to:
  /// **'Plant a movement habit (yoga/walk/run).'**
  String get medal_desc_mindful_mover;

  /// No description provided for @medal_id_devoted_keeper.
  ///
  /// In en, this message translates to:
  /// **'Devoted Keeper'**
  String get medal_id_devoted_keeper;

  /// No description provided for @medal_sub_devoted_keeper.
  ///
  /// In en, this message translates to:
  /// **'Sixty days, one practice.'**
  String get medal_sub_devoted_keeper;

  /// No description provided for @medal_desc_devoted_keeper.
  ///
  /// In en, this message translates to:
  /// **'Tend a single habit for 60 days straight.'**
  String get medal_desc_devoted_keeper;

  /// No description provided for @medal_id_tending_notes.
  ///
  /// In en, this message translates to:
  /// **'Tending Notes'**
  String get medal_id_tending_notes;

  /// No description provided for @medal_sub_tending_notes.
  ///
  /// In en, this message translates to:
  /// **'Reflect as you go.'**
  String get medal_sub_tending_notes;

  /// No description provided for @medal_desc_tending_notes.
  ///
  /// In en, this message translates to:
  /// **'Add tending notes to 3 habits.'**
  String get medal_desc_tending_notes;

  /// No description provided for @medalTierTaglineSprout.
  ///
  /// In en, this message translates to:
  /// **'Plant the first seed'**
  String get medalTierTaglineSprout;

  /// No description provided for @medalTierTaglineCommon.
  ///
  /// In en, this message translates to:
  /// **'Building the habit'**
  String get medalTierTaglineCommon;

  /// No description provided for @medalTierTaglineRare.
  ///
  /// In en, this message translates to:
  /// **'Showing real momentum'**
  String get medalTierTaglineRare;

  /// No description provided for @medalTierTaglineEpic.
  ///
  /// In en, this message translates to:
  /// **'You\'re a force of nature'**
  String get medalTierTaglineEpic;

  /// No description provided for @medalTierTaglineLegendary.
  ///
  /// In en, this message translates to:
  /// **'Mythic, almost no one gets here'**
  String get medalTierTaglineLegendary;

  /// No description provided for @guardianHeadlineNoTasks.
  ///
  /// In en, this message translates to:
  /// **'Today\'s soil is fresh.\nPlant your first seed\nand watch it grow.'**
  String get guardianHeadlineNoTasks;

  /// No description provided for @guardianHeadlineAllDone.
  ///
  /// In en, this message translates to:
  /// **'Every seed you planted\nis in bloom.\nRest, Guardian — you earned it.'**
  String get guardianHeadlineAllDone;

  /// No description provided for @guardianHeadlineStreak14.
  ///
  /// In en, this message translates to:
  /// **'{count} days\nof unbroken growth.\nYour forest is thick with life.'**
  String guardianHeadlineStreak14(int count);

  /// No description provided for @guardianHeadlineStreak7.
  ///
  /// In en, this message translates to:
  /// **'A full week in bloom,\nGuardian.\nOne more perfect day\nextends the chain.'**
  String get guardianHeadlineStreak7;

  /// No description provided for @guardianHeadlineStreak3.
  ///
  /// In en, this message translates to:
  /// **'Your chain is holding.\nTend the seeds\nstill waiting to open.'**
  String get guardianHeadlineStreak3;

  /// No description provided for @guardianHeadlineNoHabitsDone.
  ///
  /// In en, this message translates to:
  /// **'You\'re tending tasks well.\nPlant a sprout —\nhabits are how forests grow.'**
  String get guardianHeadlineNoHabitsDone;

  /// No description provided for @guardianHeadlineSomeDone.
  ///
  /// In en, this message translates to:
  /// **'Some seeds opened,\nsome didn\'t. That\'s okay.\nTomorrow is another planting.'**
  String get guardianHeadlineSomeDone;

  /// No description provided for @guardianHeadlineMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning, Guardian.\nThe day is young\nand the soil is ready.'**
  String get guardianHeadlineMorning;

  /// No description provided for @guardianHeadlineAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, Guardian.\nHalf the light remains —\nkeep tending.'**
  String get guardianHeadlineAfternoon;

  /// No description provided for @guardianHeadlineEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening, Guardian.\nOne last sweep\nbefore the sun sets.'**
  String get guardianHeadlineEvening;

  /// No description provided for @guardianHeadlineNight.
  ///
  /// In en, this message translates to:
  /// **'Burning the midnight oil?\nEven Guardians rest.\nPlant tomorrow\'s seed now.'**
  String get guardianHeadlineNight;

  /// No description provided for @guardianBodyNoTasks.
  ///
  /// In en, this message translates to:
  /// **'Your sanctuary is quiet right now. Add one intention and see what shifts by sundown.'**
  String get guardianBodyNoTasks;

  /// No description provided for @guardianBodyStreak14.
  ///
  /// In en, this message translates to:
  /// **'{count} days running. The chain isn\'t luck — it\'s the small choices stacking up. Keep stacking.'**
  String guardianBodyStreak14(int count);

  /// No description provided for @guardianBodyStreak3.
  ///
  /// In en, this message translates to:
  /// **'A {count}-day chain is real momentum. Finish today\'s open seeds before you call it done.'**
  String guardianBodyStreak3(int count);

  /// No description provided for @guardianBodyNoHabits.
  ///
  /// In en, this message translates to:
  /// **'You\'ve planted {count} tasks so far. Adding even one habit sprout would let the work compound day after day.'**
  String guardianBodyNoHabits(int count);

  /// No description provided for @guardianBodyLowCompletion.
  ///
  /// In en, this message translates to:
  /// **'You\'re finishing {pct}% of what you plant. Fewer, sharper seeds tend to grow taller than ten scattered ones.'**
  String guardianBodyLowCompletion(int pct);

  /// No description provided for @guardianBodyDefault.
  ///
  /// In en, this message translates to:
  /// **'Your sanctuary is alive. {tasks} tasks done, {sprouts} sprout(s) growing — the work is showing.'**
  String guardianBodyDefault(int tasks, int sprouts);

  /// No description provided for @guardianInsightWaitingTitle.
  ///
  /// In en, this message translates to:
  /// **'Waiting for your first move'**
  String get guardianInsightWaitingTitle;

  /// No description provided for @guardianInsightWaitingBody.
  ///
  /// In en, this message translates to:
  /// **'Add a task or habit and I\'ll start reading the patterns in your garden. The more you plant, the more I have to learn from.'**
  String get guardianInsightWaitingBody;

  /// No description provided for @guardianInsightWaitingCta.
  ///
  /// In en, this message translates to:
  /// **'Plant your first seed'**
  String get guardianInsightWaitingCta;

  /// No description provided for @guardianInsightChainSuperTitle.
  ///
  /// In en, this message translates to:
  /// **'Chain is your superpower'**
  String get guardianInsightChainSuperTitle;

  /// No description provided for @guardianInsightChainSuperBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve held a {count}-day chain. Streaks beat motivation every time — keep it warm, even on slow days.'**
  String guardianInsightChainSuperBody(int count);

  /// No description provided for @guardianInsightChainSuperCta.
  ///
  /// In en, this message translates to:
  /// **'Add tomorrow\'s seed'**
  String get guardianInsightChainSuperCta;

  /// No description provided for @guardianInsightChainColdTitle.
  ///
  /// In en, this message translates to:
  /// **'Chain is cold — start a new one'**
  String get guardianInsightChainColdTitle;

  /// No description provided for @guardianInsightChainColdBody.
  ///
  /// In en, this message translates to:
  /// **'You\'ve planted before, which means you can plant again. One small task done today is a longer chain tomorrow.'**
  String get guardianInsightChainColdBody;

  /// No description provided for @guardianInsightChainColdCta.
  ///
  /// In en, this message translates to:
  /// **'Plant a seed'**
  String get guardianInsightChainColdCta;

  /// No description provided for @guardianInsightLessIsMoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Less is more this week'**
  String get guardianInsightLessIsMoreTitle;

  /// No description provided for @guardianInsightLessIsMoreBody.
  ///
  /// In en, this message translates to:
  /// **'You finish about {pct}% of what you plant. Try 3 sharp intentions instead of 5 loose ones — quality compounds.'**
  String guardianInsightLessIsMoreBody(int pct);

  /// No description provided for @guardianInsightLessIsMoreCta.
  ///
  /// In en, this message translates to:
  /// **'Sharpen the day'**
  String get guardianInsightLessIsMoreCta;

  /// No description provided for @guardianInsightNextMedalTitle.
  ///
  /// In en, this message translates to:
  /// **'Next medal: {title}'**
  String guardianInsightNextMedalTitle(String title);

  /// No description provided for @guardianInsightNextMedalBody.
  ///
  /// In en, this message translates to:
  /// **'You\'re {value} of {target} {unit} in. A few more honest days and it\'s yours.'**
  String guardianInsightNextMedalBody(int value, int target, String unit);

  /// No description provided for @guardianInsightNextMedalCta.
  ///
  /// In en, this message translates to:
  /// **'Show medal'**
  String get guardianInsightNextMedalCta;

  /// No description provided for @guardianInsightSteadyTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re in a steady season'**
  String get guardianInsightSteadyTitle;

  /// No description provided for @guardianInsightSteadyBody.
  ///
  /// In en, this message translates to:
  /// **'No medal right around the corner — that\'s fine. Tend what you have. The next bloom is on the way.'**
  String get guardianInsightSteadyBody;

  /// No description provided for @guardianInsightSteadyCta.
  ///
  /// In en, this message translates to:
  /// **'View progress'**
  String get guardianInsightSteadyCta;

  /// No description provided for @notificationTaskReminderBody.
  ///
  /// In en, this message translates to:
  /// **'{label}'**
  String notificationTaskReminderBody(String label);

  /// No description provided for @notificationFinalCallBodyOne.
  ///
  /// In en, this message translates to:
  /// **'1 task left on your chain. Midnight is coming.'**
  String get notificationFinalCallBodyOne;

  /// No description provided for @notificationFinalCallBodyMany.
  ///
  /// In en, this message translates to:
  /// **'{count} tasks left on your chain. Midnight is coming.'**
  String notificationFinalCallBodyMany(int count);

  /// No description provided for @notificationEveningBodyOne.
  ///
  /// In en, this message translates to:
  /// **'You still have 1 open task today.'**
  String get notificationEveningBodyOne;

  /// No description provided for @notificationEveningBodyMany.
  ///
  /// In en, this message translates to:
  /// **'You still have {count} open tasks today.'**
  String notificationEveningBodyMany(int count);

  /// No description provided for @notificationTickerTaskReminder.
  ///
  /// In en, this message translates to:
  /// **'Task reminder'**
  String get notificationTickerTaskReminder;

  /// No description provided for @notificationTickerTaskAlarm.
  ///
  /// In en, this message translates to:
  /// **'Task alarm'**
  String get notificationTickerTaskAlarm;

  /// No description provided for @habitBloomSubtitleL10n.
  ///
  /// In en, this message translates to:
  /// **'{count} day streak · {element}'**
  String habitBloomSubtitleL10n(int count, String element);
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
        'de',
        'en',
        'es',
        'fr',
        'id',
        'it',
        'pt',
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
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
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
