import 'package:flutter/material.dart';

import '../../../../core/haptics.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/guardian_mascot.dart';
import 'add_task_sheet.dart';

/// Shown on the Today tab when the user has 0 tasks AND 0 habits.
///
/// Single CTA, one-line subtitle, mascot. Designed so a new user opens the
/// app and immediately sees what to do.
class FirstRunEmptyState extends StatelessWidget {
  const FirstRunEmptyState({super.key});

  Future<void> _openAddTask(BuildContext context) async {
    AppHaptics.light();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      builder: (_) => const AddTaskSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: GuardianMascot(
              size: 140,
              expression: GuardianExpression.happy,
              withHalo: true,
              variant: GuardianMascotVariant.potStitch,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '5 tasks. No more. Make them count.',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.4,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Plant your first seed — what matters most today?',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),
          Material(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(28),
            child: InkWell(
              onTap: () => _openAddTask(context),
              borderRadius: BorderRadius.circular(28),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_rounded, color: Colors.white, size: 22),
                    SizedBox(width: 10),
                    Text(
                      'Plant your first seed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
