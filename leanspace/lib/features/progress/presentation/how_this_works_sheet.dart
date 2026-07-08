import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// One-page "what is this app" walkthrough. Lives in the Progress tab and
/// linked from You → Settings. Designed to onboard a new user without
/// re-running the multi-page onboarding flow.
Future<void> showHowThisWorksSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (_) => const _HowThisWorksSheet(),
  );
}

class _HowThisWorksSheet extends StatelessWidget {
  const _HowThisWorksSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return SafeArea(
          top: false,
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.outline,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'How this works',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Bloom Tracker helps you keep a small, unbroken chain of '
                'discipline. That\'s it.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 24),
              const _Section(
                number: '1',
                title: 'The Today tab',
                body: 'This is your home. It shows the 5 tasks and the habits '
                    'you set for today. Finish them by midnight, the chain '
                    'extends.',
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '2',
                title: 'The 5-task cap is the feature',
                body: 'We don\'t let you add a 6th. That\'s the whole point. '
                    'Small chains beat long ones. Tap the "?" on the home '
                    'screen for the full reasoning.',
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '3',
                title: 'Habits are daily, the chain is forever',
                body: 'Habits (Morning yoga, Drink water) live forever. '
                    'Tasks are one-shot. Both feed the same streak.',
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '4',
                title: 'Missed tasks → Left Behind',
                body: 'At midnight, unfinished tasks move to Left Behind. '
                    'Re-add only what still matters. The rest gets a quiet '
                    'let-go.',
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '5',
                title: 'The Progress tab',
                body: 'Streak, calendar, medals, history — everything '
                    'about how you\'re doing over time. Nothing urgent lives '
                    'here.',
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '6',
                title: 'The You tab',
                body: 'Your account, settings, sign out. That\'s all.',
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.25),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.flag_outlined,
                      color: AppColors.primary,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'The rule: 5 small things, every day, no excuses.',
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w800,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.number,
    required this.title,
    required this.body,
  });
  final String number;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
          child: Text(
            number,
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                body,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
