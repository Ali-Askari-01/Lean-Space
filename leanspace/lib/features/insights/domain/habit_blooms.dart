import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../my_day/domain/habit.dart';
import 'medals.dart';

/// A "Habit Bloom" card on the journal screen — a per-habit streak card.
/// Built from real habit data instead of a static hardcoded list.
class HabitBloom {
  const HabitBloom({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tone,
    required this.streak,
    required this.targetStreak,
    required this.locked,
    required this.badgeLabel,
    required this.badgeColor,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final MedalTone tone;
  final int streak;
  final int targetStreak;
  final bool locked;
  final String badgeLabel;
  final Color badgeColor;

  double get progress {
    if (targetStreak <= 0) return 0;
    return (streak / targetStreak).clamp(0.0, 1.0);
  }
}

/// Picks the bloom tier (Mastery / Strong / Sprouting / Locked) for a given
/// habit based on its streak length.
({String label, Color color}) _bloomTier(int streak) {
  if (streak >= 30) {
    return (label: 'Mastery', color: AppColors.primary);
  }
  if (streak >= 14) {
    return (label: 'Strong', color: AppColors.tertiary);
  }
  if (streak >= 7) {
    return (label: 'Growing', color: AppColors.secondary);
  }
  if (streak >= 1) {
    return (label: 'Sprouting', color: AppColors.primary);
  }
  return (label: 'Locked', color: AppColors.outline);
}

/// Maps a habit to a visual element (water / light / soil / breeze) using
/// the same heuristic the rest of the app uses.
({IconData icon, MedalTone tone, String element}) _elementFor(Habit h) {
  final n = h.name.toLowerCase();
  if (n.contains('water') || n.contains('drink') || n.contains('hydrat')) {
    return (
      icon: Icons.water_drop_rounded,
      tone: const MedalTone(color: AppColors.tertiary, bg: Color(0x3300629F)),
      element: 'Water',
    );
  }
  if (n.contains('yoga') ||
      n.contains('stretch') ||
      n.contains('meditat') ||
      n.contains('breath') ||
      n.contains('sun') ||
      n.contains('morning')) {
    return (
      icon: Icons.wb_sunny_rounded,
      tone: const MedalTone(color: Color(0xFFE8A33D), bg: Color(0x33E8A33D)),
      element: 'Light',
    );
  }
  if (n.contains('read') ||
      n.contains('write') ||
      n.contains('journal') ||
      n.contains('study')) {
    return (
      icon: Icons.grass_rounded,
      tone: const MedalTone(color: Color(0xFF8B5E2B), bg: Color(0x338B5E2B)),
      element: 'Soil',
    );
  }
  if (n.contains('run') ||
      n.contains('walk') ||
      n.contains('bike') ||
      n.contains('wind')) {
    return (
      icon: Icons.air_rounded,
      tone: const MedalTone(color: AppColors.outline, bg: Color(0x336E7A6E)),
      element: 'Breeze',
    );
  }
  return (
    icon: Icons.eco_rounded,
    tone: const MedalTone(color: AppColors.primary, bg: Color(0x33006D36)),
    element: 'Soil',
  );
}

/// Builds the list of Habit Blooms to show on the journal screen.
/// Real blooms first (sorted by streak), then aspirational locked ones.
List<HabitBloom> buildHabitBlooms(List<Habit> habits) {
  final real = <HabitBloom>[];
  for (final h in habits) {
    final el = _elementFor(h);
    final tier = _bloomTier(h.streakCount);
    final target = h.streakCount >= 30 ? 30 : (h.streakCount >= 7 ? 30 : 7);
    real.add(
      HabitBloom(
        id: h.id,
        title: h.name,
        subtitle: '${h.streakCount} day streak · ${el.element}',
        icon: el.icon,
        tone: el.tone,
        streak: h.streakCount,
        targetStreak: target,
        locked: false,
        badgeLabel: tier.label,
        badgeColor: tier.color,
      ),
    );
  }
  real.sort((a, b) => b.streak.compareTo(a.streak));
  return real;
}
