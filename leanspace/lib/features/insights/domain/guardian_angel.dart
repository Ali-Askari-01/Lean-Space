import '../../../core/l10n/app_localizations.dart';
import 'medals.dart';

/// Pure, on-device "guardian angel" — picks the response that best fits
/// the user's current progress. No LLM, no API key, no network. Easy to
/// reason about and easy to test.
class GuardianAngel {
  const GuardianAngel._();

  /// A short, headline-style line for the journal/sanctuary hero card.
  /// Picks a line whose tone matches the user's actual progress.
  static String headline(MedalContext ctx, AppLocalizations l10n) {
    final insights = ctx.insights;
    final totalDone = ctx.todos.where((t) => t.isDone).length;
    final totalOpen = ctx.todos.where((t) => t.isOpen).length;
    final hasHabits = ctx.habits.isNotEmpty;
    final hour = ctx.today.hour;
    final partOfDay = hour < 5
        ? 'night'
        : hour < 12
            ? 'morning'
            : hour < 17
                ? 'afternoon'
                : hour < 21
                    ? 'evening'
                    : 'night';

    if (totalDone == 0 && totalOpen == 0) {
      return l10n.guardianHeadlineNoTasks;
    }
    if (totalOpen == 0 && totalDone > 0) {
      return l10n.guardianHeadlineAllDone;
    }
    if (insights.currentStreak >= 14) {
      return l10n.guardianHeadlineStreak14(insights.currentStreak);
    }
    if (insights.currentStreak >= 7) {
      return l10n.guardianHeadlineStreak7;
    }
    if (insights.currentStreak >= 3) {
      return l10n.guardianHeadlineStreak3;
    }
    if (!hasHabits && totalDone >= 3) {
      return l10n.guardianHeadlineNoHabitsDone;
    }
    if (insights.perfectDays == 0 && totalDone > 0) {
      return l10n.guardianHeadlineSomeDone;
    }
    return switch (partOfDay) {
      'morning' => l10n.guardianHeadlineMorning,
      'afternoon' => l10n.guardianHeadlineAfternoon,
      'evening' => l10n.guardianHeadlineEvening,
      _ => l10n.guardianHeadlineNight,
    };
  }

  /// Longer body copy for the journal hero card. Two sentences, plain,
  /// specific to what the user has done.
  static String body(MedalContext ctx, AppLocalizations l10n) {
    final insights = ctx.insights;
    final totalDone = ctx.todos.where((t) => t.isDone).length;
    final habitsCount = ctx.habits.length;

    if (totalDone == 0) {
      return l10n.guardianBodyNoTasks;
    }
    if (insights.currentStreak >= 14) {
      return l10n.guardianBodyStreak14(insights.currentStreak);
    }
    if (insights.currentStreak >= 3) {
      return l10n.guardianBodyStreak3(insights.currentStreak);
    }
    if (habitsCount == 0) {
      return l10n.guardianBodyNoHabits(totalDone);
    }
    if (insights.completionRate < 0.6) {
      final pct = (insights.completionRate * 100).round();
      return l10n.guardianBodyLowCompletion(pct);
    }
    return l10n.guardianBodyDefault(totalDone, habitsCount);
  }

  /// Short, focused insight for the dark "Guardian Insights" card.
  /// Returns null when there's nothing meaningful to say yet.
  static GuardianInsight? insight(MedalContext ctx, AppLocalizations l10n) {
    final insights = ctx.insights;
    final hasData = ctx.todos.isNotEmpty || ctx.habits.isNotEmpty;

    if (!hasData) {
      return GuardianInsight(
        title: l10n.guardianInsightWaitingTitle,
        body: l10n.guardianInsightWaitingBody,
        callToAction: l10n.guardianInsightWaitingCta,
      );
    }

    if (insights.currentStreak >= 7) {
      return GuardianInsight(
        title: l10n.guardianInsightChainSuperTitle,
        body: l10n.guardianInsightChainSuperBody(insights.currentStreak),
        callToAction: l10n.guardianInsightChainSuperCta,
      );
    }

    if (insights.currentStreak == 0 && insights.tasksCompleted > 0) {
      return GuardianInsight(
        title: l10n.guardianInsightChainColdTitle,
        body: l10n.guardianInsightChainColdBody,
        callToAction: l10n.guardianInsightChainColdCta,
      );
    }

    if (insights.completionRate < 0.6 && insights.tasksCreated >= 3) {
      final pct = (insights.completionRate * 100).round();
      return GuardianInsight(
        title: l10n.guardianInsightLessIsMoreTitle,
        body: l10n.guardianInsightLessIsMoreBody(pct),
        callToAction: l10n.guardianInsightLessIsMoreCta,
      );
    }

    final next = nextMedal(getMedalCatalogue(), evaluateAll(getMedalCatalogue(), ctx));
    if (next != null) {
      return GuardianInsight(
        title: l10n.guardianInsightNextMedalTitle(next.medal.title),
        body: l10n.guardianInsightNextMedalBody(
            next.progress.value, next.progress.target, next.medal.unit),
        callToAction: l10n.guardianInsightNextMedalCta,
      );
    }

    return GuardianInsight(
      title: l10n.guardianInsightSteadyTitle,
      body: l10n.guardianInsightSteadyBody,
      callToAction: l10n.guardianInsightSteadyCta,
    );
  }
}

class GuardianInsight {
  const GuardianInsight({
    required this.title,
    required this.body,
    required this.callToAction,
  });

  final String title;
  final String body;
  final String callToAction;
}
