import 'package:flutter/material.dart';

import '../../my_day/domain/habit.dart';
import '../../my_day/domain/todo_item.dart';
import 'insights.dart';

enum MedalTier { sprout, common, rare, epic, legendary }

extension MedalTierX on MedalTier {
  String get label => switch (this) {
        MedalTier.sprout => 'Sprout',
        MedalTier.common => 'Common',
        MedalTier.rare => 'Rare',
        MedalTier.epic => 'Epic',
        MedalTier.legendary => 'Legendary',
      };

  String get tagline => switch (this) {
        MedalTier.sprout => 'Plant the first seed',
        MedalTier.common => 'Building the habit',
        MedalTier.rare => 'Showing real momentum',
        MedalTier.epic => 'You\'re a force of nature',
        MedalTier.legendary => 'Mythic, almost no one gets here',
      };

  Color get accent => switch (this) {
        MedalTier.sprout => const Color(0xFF8AA68A),
        MedalTier.common => const Color(0xFF6FB1D8),
        MedalTier.rare => const Color(0xFF9B7BD8),
        MedalTier.epic => const Color(0xFFE8A33D),
        MedalTier.legendary => const Color(0xFFE0598C),
      };

  Color get ribbon => switch (this) {
        MedalTier.sprout => const Color(0xFF4F6F52),
        MedalTier.common => const Color(0xFF4A8AB8),
        MedalTier.rare => const Color(0xFF6E4FB8),
        MedalTier.epic => const Color(0xFFB07019),
        MedalTier.legendary => const Color(0xFFB72E5E),
      };

  IconData get sigil => switch (this) {
        MedalTier.sprout => Icons.eco_rounded,
        MedalTier.common => Icons.spa_rounded,
        MedalTier.rare => Icons.auto_awesome_rounded,
        MedalTier.epic => Icons.local_fire_department_rounded,
        MedalTier.legendary => Icons.workspace_premium_rounded,
      };
}

enum MedalCategory { task, habit, streak, mastery }

extension MedalCategoryX on MedalCategory {
  String get label => switch (this) {
        MedalCategory.task => 'Tasks',
        MedalCategory.habit => 'Habits',
        MedalCategory.streak => 'Streaks',
        MedalCategory.mastery => 'Mastery',
      };

  IconData get icon => switch (this) {
        MedalCategory.task => Icons.flag_rounded,
        MedalCategory.habit => Icons.spa_rounded,
        MedalCategory.streak => Icons.local_fire_department_rounded,
        MedalCategory.mastery => Icons.workspace_premium_rounded,
      };
}

class Medal {
  const Medal({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.tone,
    required this.tier,
    required this.category,
    required this.target,
    required this.unit,
    required this.evaluate,
    this.proOnly = false,
  });

  final String id;
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final MedalTone tone;
  final MedalTier tier;
  final MedalCategory category;
  final int target;
  final String unit;
  final bool proOnly;

  final MedalProgress Function(MedalContext ctx) evaluate;
}

class MedalTone {
  const MedalTone({
    required this.color,
    required this.bg,
  });

  final Color color;
  final Color bg;
}

class MedalProgress {
  const MedalProgress({
    required this.earned,
    required this.value,
    required this.target,
    this.secondaryLabel,
  });

  final bool earned;
  final int value;
  final int target;
  final String? secondaryLabel;

  double get ratio {
    if (target <= 0) return earned ? 1.0 : 0.0;
    return (value / target).clamp(0.0, 1.0);
  }
}

class MedalContext {
  const MedalContext({
    required this.todos,
    required this.habits,
    required this.insights,
    required this.today,
  });

  final List<TodoItem> todos;
  final List<Habit> habits;
  final InsightsData insights;
  final DateTime today;
}

/// Cached medal catalogue — created once and reused across all builds.
final List<Medal> _cachedMedalCatalogue = _buildMedalCatalogue();

List<Medal> getMedalCatalogue() => _cachedMedalCatalogue;

List<Medal> _buildMedalCatalogue() => [
      // ── TASK ACHIEVEMENTS (rising through tiers) ─────────────────
      Medal(
        id: 'first_spark',
        title: 'First Spark',
        subtitle: 'You lit the match.',
        description: 'Finish your very first task. Every chain starts here.',
        icon: Icons.local_fire_department_rounded,
        tone: MedalTone(color: const Color(0xFFE8A33D), bg: const Color(0x33E8A33D)),
        tier: MedalTier.sprout,
        category: MedalCategory.task,
        target: 1,
        unit: 'task',
        evaluate: (c) {
          final done = c.todos.where((t) => t.isDone).length;
          return MedalProgress(earned: done >= 1, value: done, target: 1);
        },
      ),
      Medal(
        id: 'triple_seed',
        title: 'Triple Seed',
        subtitle: 'Three into the soil.',
        description: 'Finish 3 tasks in total.',
        icon: Icons.eco_rounded,
        tone: MedalTone(color: const Color(0xFF50C878), bg: const Color(0x3350C878)),
        tier: MedalTier.common,
        category: MedalCategory.task,
        target: 3,
        unit: 'tasks',
        evaluate: (c) {
          final done = c.todos.where((t) => t.isDone).length;
          return MedalProgress(earned: done >= 3, value: done, target: 3);
        },
      ),
      Medal(
        id: 'dozen_sower',
        title: 'Dozen Sower',
        subtitle: 'A field of twelve.',
        description: 'Finish 12 tasks in total.',
        icon: Icons.grass_rounded,
        tone: MedalTone(color: const Color(0xFF006D36), bg: const Color(0x33006D36)),
        tier: MedalTier.rare,
        category: MedalCategory.task,
        target: 12,
        unit: 'tasks',
        evaluate: (c) {
          final done = c.todos.where((t) => t.isDone).length;
          return MedalProgress(earned: done >= 12, value: done, target: 12);
        },
      ),
      Medal(
        id: 'quarter_century',
        title: 'Quarter Century',
        subtitle: 'A season of saying yes.',
        description: 'Finish 25 tasks in total.',
        icon: Icons.local_florist_rounded,
        tone: MedalTone(color: const Color(0xFFA53B22), bg: const Color(0x33A53B22)),
        tier: MedalTier.rare,
        category: MedalCategory.task,
        target: 25,
        unit: 'tasks',
        evaluate: (c) {
          final done = c.todos.where((t) => t.isDone).length;
          return MedalProgress(earned: done >= 25, value: done, target: 25);
        },
      ),
      Medal(
        id: 'productivity_titan',
        title: 'Productivity Titan',
        subtitle: 'Consistency compounds.',
        description: 'Finish 50 tasks — you\'ve built real momentum.',
        icon: Icons.star_rounded,
        tone: MedalTone(color: const Color(0xFFE8A33D), bg: const Color(0x33E8A33D)),
        tier: MedalTier.epic,
        category: MedalCategory.task,
        target: 50,
        unit: 'tasks',
        proOnly: true,
        evaluate: (c) {
          final done = c.todos.where((t) => t.isDone).length;
          return MedalProgress(earned: done >= 50, value: done, target: 50);
        },
      ),
      Medal(
        id: 'century_planter',
        title: 'Century Planter',
        subtitle: 'A forest of your own.',
        description: 'Finish 100 tasks. You\'re in the top 5% of users.',
        icon: Icons.workspace_premium_rounded,
        tone: MedalTone(color: const Color(0xFFE0598C), bg: const Color(0x33E0598C)),
        tier: MedalTier.legendary,
        category: MedalCategory.task,
        target: 100,
        unit: 'tasks',
        proOnly: true,
        evaluate: (c) {
          final done = c.todos.where((t) => t.isDone).length;
          return MedalProgress(earned: done >= 100, value: done, target: 100);
        },
      ),

      // ── PERFECT DAYS (climbing) ─────────────────────────────────
      Medal(
        id: 'clean_day',
        title: 'Clean Slate',
        subtitle: 'Not a single weed.',
        description: 'Finish every task you plant on a single day.',
        icon: Icons.task_alt_rounded,
        tone: MedalTone(color: const Color(0xFF50C878), bg: const Color(0x3350C878)),
        tier: MedalTier.sprout,
        category: MedalCategory.streak,
        target: 1,
        unit: 'perfect day',
        evaluate: (c) => MedalProgress(
          earned: c.insights.perfectDays >= 1,
          value: c.insights.perfectDays,
          target: 1,
        ),
      ),
      Medal(
        id: 'triple_perfect',
        title: 'Triple Perfect',
        subtitle: 'Three flawless runs.',
        description: 'Hit 3 perfect days.',
        icon: Icons.bolt_rounded,
        tone: MedalTone(color: const Color(0xFF6FB1D8), bg: const Color(0x336FB1D8)),
        tier: MedalTier.common,
        category: MedalCategory.streak,
        target: 3,
        unit: 'perfect days',
        evaluate: (c) => MedalProgress(
          earned: c.insights.perfectDays >= 3,
          value: c.insights.perfectDays,
          target: 3,
        ),
      ),
      Medal(
        id: 'perfect_week',
        title: 'Perfect Week',
        subtitle: 'Seven days unbroken.',
        description: '7 perfect days in a row.',
        icon: Icons.workspace_premium_rounded,
        tone: MedalTone(color: const Color(0xFF9B7BD8), bg: const Color(0x339B7BD8)),
        tier: MedalTier.epic,
        category: MedalCategory.streak,
        target: 7,
        unit: 'days',
        proOnly: true,
        evaluate: (c) => MedalProgress(
          earned: c.insights.bestStreak >= 7,
          value: c.insights.bestStreak,
          target: 7,
        ),
      ),

      // ── STREAK CHAIN MEDALS ─────────────────────────────────────
      Medal(
        id: 'two_week_chain',
        title: 'Fortnight Force',
        subtitle: 'Two weeks on fire.',
        description: 'Hold a 14-day chain.',
        icon: Icons.cyclone_rounded,
        tone: MedalTone(color: const Color(0xFF6FB1D8), bg: const Color(0x336FB1D8)),
        tier: MedalTier.rare,
        category: MedalCategory.streak,
        target: 14,
        unit: 'days',
        evaluate: (c) => MedalProgress(
          earned: c.insights.currentStreak >= 14,
          value: c.insights.currentStreak,
          target: 14,
        ),
      ),
      Medal(
        id: 'iron_chain',
        title: 'Iron Chain',
        subtitle: '30 links forged.',
        description: 'A 30-day chain. The hardest task medal.',
        icon: Icons.link_rounded,
        tone: MedalTone(color: const Color(0xFF9B7BD8), bg: const Color(0x339B7BD8)),
        tier: MedalTier.epic,
        category: MedalCategory.streak,
        target: 30,
        unit: 'days',
        proOnly: true,
        evaluate: (c) => MedalProgress(
          earned: c.insights.currentStreak >= 30,
          value: c.insights.currentStreak,
          target: 30,
        ),
      ),
      Medal(
        id: 'quarterly_chain',
        title: 'Quarterly Chain',
        subtitle: 'A season, unbroken.',
        description: 'A 90-day chain. Legendary status.',
        icon: Icons.shield_rounded,
        tone: MedalTone(color: const Color(0xFFE8A33D), bg: const Color(0x33E8A33D)),
        tier: MedalTier.legendary,
        category: MedalCategory.streak,
        target: 90,
        unit: 'days',
        proOnly: true,
        evaluate: (c) => MedalProgress(
          earned: c.insights.currentStreak >= 90,
          value: c.insights.currentStreak,
          target: 90,
        ),
      ),

      // ── PRIORITY MASTERY ────────────────────────────────────────
      Medal(
        id: 'vital_priority',
        title: 'Vital Spark',
        subtitle: 'You picked the hard ones.',
        description: 'Finish 5 tasks marked as Vital priority.',
        icon: Icons.priority_high_rounded,
        tone: MedalTone(color: const Color(0xFFA53B22), bg: const Color(0x33A53B22)),
        tier: MedalTier.common,
        category: MedalCategory.mastery,
        target: 5,
        unit: 'vital tasks',
        evaluate: (c) {
          final done = c.todos
              .where((t) => t.isDone && t.priority == TodoPriority.vital)
              .length;
          return MedalProgress(earned: done >= 5, value: done, target: 5);
        },
      ),
      Medal(
        id: 'spark_priority',
        title: 'Spark Tamer',
        subtitle: 'Quick wins add up.',
        description: 'Finish 5 tasks marked as Spark priority.',
        icon: Icons.flash_on_rounded,
        tone: MedalTone(color: const Color(0xFF6FB1D8), bg: const Color(0x336FB1D8)),
        tier: MedalTier.common,
        category: MedalCategory.mastery,
        target: 5,
        unit: 'spark tasks',
        evaluate: (c) {
          final done = c.todos
              .where((t) => t.isDone && t.priority == TodoPriority.spark)
              .length;
          return MedalProgress(earned: done >= 5, value: done, target: 5);
        },
      ),
      Medal(
        id: 'note_taker',
        title: 'Note Taker',
        subtitle: 'Plans on paper beat plans in head.',
        description: 'Add preparation notes to 5 different tasks.',
        icon: Icons.sticky_note_2_outlined,
        tone: MedalTone(color: const Color(0xFFE8A33D), bg: const Color(0x33E8A33D)),
        tier: MedalTier.rare,
        category: MedalCategory.mastery,
        target: 5,
        unit: 'notes',
        evaluate: (c) {
          final withNotes = c.todos
              .where((t) => t.notes != null && t.notes!.trim().isNotEmpty)
              .length;
          return MedalProgress(earned: withNotes >= 5, value: withNotes, target: 5);
        },
      ),
      Medal(
        id: 'left_behind_rescuer',
        title: 'Left-Behind Rescuer',
        subtitle: 'No task left behind.',
        description: 'Re-add 3 missed tasks the next day.',
        icon: Icons.history_rounded,
        tone: MedalTone(color: const Color(0xFF8B5E2B), bg: const Color(0x338B5E2B)),
        tier: MedalTier.rare,
        category: MedalCategory.mastery,
        target: 3,
        unit: 're-adds',
        evaluate: (c) {
          final carried = c.todos.where((t) => t.isCarriedForward).length;
          return MedalProgress(earned: carried >= 3, value: carried, target: 3);
        },
      ),

      // ── HABIT ACHIEVEMENTS ──────────────────────────────────────
      Medal(
        id: 'first_sprout',
        title: 'First Sprout',
        subtitle: 'A new daily ritual.',
        description: 'Plant your first habit.',
        icon: Icons.spa_rounded,
        tone: MedalTone(color: const Color(0xFF50C878), bg: const Color(0x3350C878)),
        tier: MedalTier.sprout,
        category: MedalCategory.habit,
        target: 1,
        unit: 'habit',
        evaluate: (c) => MedalProgress(
          earned: c.habits.isNotEmpty,
          value: c.habits.length,
          target: 1,
        ),
      ),
      Medal(
        id: 'trio_sprout',
        title: 'Trio Sprout',
        subtitle: 'A small ecosystem.',
        description: 'Plant 3 different habits.',
        icon: Icons.eco_rounded,
        tone: MedalTone(color: const Color(0xFF6FB1D8), bg: const Color(0x336FB1D8)),
        tier: MedalTier.common,
        category: MedalCategory.habit,
        target: 3,
        unit: 'habits',
        evaluate: (c) => MedalProgress(
          earned: c.habits.length >= 3,
          value: c.habits.length,
          target: 3,
        ),
      ),
      Medal(
        id: 'week_of_growth',
        title: 'Week of Growth',
        subtitle: 'Roots start to hold.',
        description: 'Tend a habit every day for 7 days.',
        icon: Icons.calendar_view_week_rounded,
        tone: MedalTone(color: const Color(0xFF9B7BD8), bg: const Color(0x339B7BD8)),
        tier: MedalTier.rare,
        category: MedalCategory.habit,
        target: 7,
        unit: 'streak',
        evaluate: (c) {
          final best = c.habits.isEmpty
              ? 0
              : c.habits.map((h) => h.streakCount).reduce((a, b) => a > b ? a : b);
          return MedalProgress(earned: best >= 7, value: best, target: 7);
        },
      ),
      Medal(
        id: 'fortnight_floret',
        title: 'Fortnight Floret',
        subtitle: 'A full bloom.',
        description: 'A 14-day habit streak.',
        icon: Icons.local_florist_rounded,
        tone: MedalTone(color: const Color(0xFFE8A33D), bg: const Color(0x33E8A33D)),
        tier: MedalTier.rare,
        category: MedalCategory.habit,
        target: 14,
        unit: 'streak',
        evaluate: (c) {
          final best = c.habits.isEmpty
              ? 0
              : c.habits.map((h) => h.streakCount).reduce((a, b) => a > b ? a : b);
          return MedalProgress(earned: best >= 14, value: best, target: 14);
        },
      ),
      Medal(
        id: 'rooted_master',
        title: 'Rooted Master',
        subtitle: 'Deep roots, deep strength.',
        description: 'A 30-day habit streak.',
        icon: Icons.park_rounded,
        tone: MedalTone(color: const Color(0xFFA53B22), bg: const Color(0x33A53B22)),
        tier: MedalTier.epic,
        category: MedalCategory.habit,
        target: 30,
        unit: 'streak',
        proOnly: true,
        evaluate: (c) {
          final best = c.habits.isEmpty
              ? 0
              : c.habits.map((h) => h.streakCount).reduce((a, b) => a > b ? a : b);
          return MedalProgress(earned: best >= 30, value: best, target: 30);
        },
      ),
      Medal(
        id: 'half_year_bloom',
        title: 'Half-Year Bloom',
        subtitle: 'The garden is permanent now.',
        description: 'Hold a single habit for 180 days.',
        icon: Icons.celebration_rounded,
        tone: MedalTone(color: const Color(0xFFE0598C), bg: const Color(0x33E0598C)),
        tier: MedalTier.legendary,
        category: MedalCategory.habit,
        target: 180,
        unit: 'streak',
        proOnly: true,
        evaluate: (c) {
          final best = c.habits.isEmpty
              ? 0
              : c.habits.map((h) => h.streakCount).reduce((a, b) => a > b ? a : b);
          return MedalProgress(earned: best >= 180, value: best, target: 180);
        },
      ),
      Medal(
        id: 'garden_keeper',
        title: 'Garden Keeper',
        subtitle: 'Variety, together.',
        description: 'Grow 4 different habits at the same time.',
        icon: Icons.forest_rounded,
        tone: MedalTone(color: const Color(0xFF006D36), bg: const Color(0x33006D36)),
        tier: MedalTier.rare,
        category: MedalCategory.habit,
        target: 4,
        unit: 'habits',
        evaluate: (c) => MedalProgress(
          earned: c.habits.length >= 4,
          value: c.habits.length,
          target: 4,
        ),
      ),
      Medal(
        id: 'hydration_hero',
        title: 'Hydration Hero',
        subtitle: 'You refill the well.',
        description: 'Plant a hydration habit (water/drink).',
        icon: Icons.water_drop_rounded,
        tone: MedalTone(color: const Color(0xFF00629F), bg: const Color(0x3300629F)),
        tier: MedalTier.sprout,
        category: MedalCategory.habit,
        target: 1,
        unit: 'habit',
        evaluate: (c) {
          final has = c.habits.any((h) {
            final n = h.name.toLowerCase();
            return n.contains('water') || n.contains('drink') || n.contains('hydrat');
          });
          return MedalProgress(earned: has, value: has ? 1 : 0, target: 1);
        },
      ),
      Medal(
        id: 'mindful_mover',
        title: 'Mindful Mover',
        subtitle: 'The body remembers.',
        description: 'Plant a movement habit (yoga/walk/run).',
        icon: Icons.directions_run_rounded,
        tone: MedalTone(color: const Color(0xFFA53B22), bg: const Color(0x33A53B22)),
        tier: MedalTier.sprout,
        category: MedalCategory.habit,
        target: 1,
        unit: 'habit',
        evaluate: (c) {
          final has = c.habits.any((h) {
            final n = h.name.toLowerCase();
            return n.contains('yoga') ||
                n.contains('walk') ||
                n.contains('run') ||
                n.contains('stretch') ||
                n.contains('breath');
          });
          return MedalProgress(earned: has, value: has ? 1 : 0, target: 1);
        },
      ),
      Medal(
        id: 'devoted_keeper',
        title: 'Devoted Keeper',
        subtitle: 'Sixty days, one practice.',
        description: 'Tend a single habit for 60 days straight.',
        icon: Icons.diamond_rounded,
        tone: MedalTone(color: const Color(0xFF006D36), bg: const Color(0x33006D36)),
        tier: MedalTier.epic,
        category: MedalCategory.habit,
        target: 60,
        unit: 'streak',
        proOnly: true,
        evaluate: (c) {
          final best = c.habits.isEmpty
              ? 0
              : c.habits.map((h) => h.streakCount).reduce((a, b) => a > b ? a : b);
          return MedalProgress(earned: best >= 60, value: best, target: 60);
        },
      ),
      Medal(
        id: 'tending_notes',
        title: 'Tending Notes',
        subtitle: 'Reflect as you go.',
        description: 'Add tending notes to 3 habits.',
        icon: Icons.edit_note_rounded,
        tone: MedalTone(color: const Color(0xFF50C878), bg: const Color(0x3350C878)),
        tier: MedalTier.common,
        category: MedalCategory.habit,
        target: 3,
        unit: 'notes',
        evaluate: (c) {
          final withNotes = c.habits
              .where((h) => h.notes != null && h.notes!.trim().isNotEmpty)
              .length;
          return MedalProgress(
              earned: withNotes >= 3, value: withNotes, target: 3);
        },
      ),
    ];

List<MedalProgress> evaluateAll(
  List<Medal> catalogue,
  MedalContext ctx,
) {
  return [for (final m in catalogue) m.evaluate(ctx)];
}

({Medal medal, MedalProgress progress})? nextMedal(
  List<Medal> catalogue,
  List<MedalProgress> progress,
) {
  Medal? best;
  MedalProgress? bestProgress;
  var bestRatio = -1.0;
  for (var i = 0; i < catalogue.length; i++) {
    final p = progress[i];
    if (p.earned) continue;
    if (p.ratio > bestRatio) {
      best = catalogue[i];
      bestProgress = p;
      bestRatio = p.ratio;
    }
  }
  if (best == null || bestProgress == null) return null;
  return (medal: best, progress: bestProgress);
}

int earnedCount(List<MedalProgress> progress) =>
    progress.where((p) => p.earned).length;
