import 'medals.dart';

/// Pure, on-device "guardian angel" — picks the response that best fits
/// the user's current progress. No LLM, no API key, no network. Easy to
/// reason about and easy to test.
class GuardianAngel {
  const GuardianAngel._();

  /// A short, headline-style line for the journal/sanctuary hero card.
  /// Picks a line whose tone matches the user's actual progress.
  static String headline(MedalContext ctx) {
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
      return "Today's soil is fresh.\nPlant your first seed\nand watch it grow.";
    }
    if (totalOpen == 0 && totalDone > 0) {
      return "Every seed you planted\nis in bloom.\nRest, Guardian — you earned it.";
    }
    if (insights.currentStreak >= 14) {
      return "$insights.currentStreak days\nof unbroken growth.\nYour forest is thick with life.";
    }
    if (insights.currentStreak >= 7) {
      return "A full week in bloom,\nGuardian.\nOne more perfect day\nextends the chain.";
    }
    if (insights.currentStreak >= 3) {
      return "Your chain is holding.\nTend the seeds\nstill waiting to open.";
    }
    if (!hasHabits && totalDone >= 3) {
      return "You're tending tasks well.\nPlant a sprout —\nhabits are how forests grow.";
    }
    if (insights.perfectDays == 0 && totalDone > 0) {
      return "Some seeds opened,\nsome didn't. That's okay.\nTomorrow is another planting.";
    }
    return switch (partOfDay) {
      'morning' =>
        "Good $partOfDay, Guardian.\nThe day is young\nand the soil is ready.",
      'afternoon' =>
        "Good $partOfDay, Guardian.\nHalf the light remains —\nkeep tending.",
      'evening' =>
        "Good $partOfDay, Guardian.\nOne last sweep\nbefore the sun sets.",
      _ =>
        "Burning the midnight oil?\nEven Guardians rest.\nPlant tomorrow's seed now.",
    };
  }

  /// Longer body copy for the journal hero card. Two sentences, plain,
  /// specific to what the user has done.
  static String body(MedalContext ctx) {
    final insights = ctx.insights;
    final totalDone = ctx.todos.where((t) => t.isDone).length;
    final habitsCount = ctx.habits.length;

    if (totalDone == 0) {
      return "Your sanctuary is quiet right now. Add one intention and "
          "see what shifts by sundown.";
    }
    if (insights.currentStreak >= 14) {
      return "$insights.currentStreak days running. The chain isn't luck — "
          "it's the small choices stacking up. Keep stacking.";
    }
    if (insights.currentStreak >= 3) {
      return "A $insights.currentStreak-day chain is real momentum. "
          "Finish today's open seeds before you call it done.";
    }
    if (habitsCount == 0) {
      return "You've planted $totalDone tasks so far. Adding even one "
          "habit sprout would let the work compound day after day.";
    }
    if (insights.completionRate < 0.6) {
      final pct = (insights.completionRate * 100).round();
      return "You're finishing $pct% of what you plant. Fewer, sharper "
          "seeds tend to grow taller than ten scattered ones.";
    }
    return "Your sanctuary is alive. $totalDone tasks done, "
        "$habitsCount sprout${habitsCount == 1 ? '' : 's'} growing — "
        "the work is showing.";
  }

  /// Short, focused insight for the dark "Guardian Insights" card.
  /// Returns null when there's nothing meaningful to say yet.
  static GuardianInsight? insight(MedalContext ctx) {
    final insights = ctx.insights;
    final hasData = ctx.todos.isNotEmpty || ctx.habits.isNotEmpty;

    if (!hasData) {
      return const GuardianInsight(
        title: 'Waiting for your first move',
        body:
            'Add a task or habit and I\'ll start reading the patterns in your garden. '
            'The more you plant, the more I have to learn from.',
        callToAction: 'Plant your first seed',
      );
    }

    if (insights.currentStreak >= 7) {
      return GuardianInsight(
        title: 'Chain is your superpower',
        body:
            'You\'ve held a ${insights.currentStreak}-day chain. Streaks beat motivation '
            'every time — keep it warm, even on slow days.',
        callToAction: 'Add tomorrow\'s seed',
      );
    }

    if (insights.currentStreak == 0 && insights.tasksCompleted > 0) {
      return const GuardianInsight(
        title: 'Chain is cold — start a new one',
        body:
            'You\'ve planted before, which means you can plant again. One small '
            'task done today is a longer chain tomorrow.',
        callToAction: 'Plant a seed',
      );
    }

    if (insights.completionRate < 0.6 && insights.tasksCreated >= 3) {
      final pct = (insights.completionRate * 100).round();
      return GuardianInsight(
        title: 'Less is more this week',
        body:
            'You finish about $pct% of what you plant. Try 3 sharp intentions '
            'instead of 5 loose ones — quality compounds.',
        callToAction: 'Sharpen the day',
      );
    }

    final next = nextMedal(getMedalCatalogue(), evaluateAll(getMedalCatalogue(), ctx));
    if (next != null) {
      return GuardianInsight(
        title: 'Next medal: ${next.medal.title}',
        body:
            'You\'re ${next.progress.value} of ${next.progress.target} ${next.medal.unit} in. '
            'A few more honest days and it\'s yours.',
        callToAction: 'Show medal',
      );
    }

    return const GuardianInsight(
      title: 'You\'re in a steady season',
      body:
          'No medal right around the corner — that\'s fine. Tend what you have. '
          'The next bloom is on the way.',
      callToAction: 'View progress',
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
