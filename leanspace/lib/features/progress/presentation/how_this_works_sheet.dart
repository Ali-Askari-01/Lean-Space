import 'package:flutter/material.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';

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
    final l10n = AppLocalizations.of(context);
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
                l10n.howItWorksTitle,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.howItWorksBody,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 24),
              const _Section(
                number: '1',
                titleKey: _SectionKey.howItWorksToday,
                bodyKey: _SectionKey.howItWorksTodayBody,
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '2',
                titleKey: _SectionKey.howItWorksCap,
                bodyKey: _SectionKey.howItWorksCapBody,
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '3',
                titleKey: _SectionKey.howItWorksHabits,
                bodyKey: _SectionKey.howItWorksHabitsBody,
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '4',
                titleKey: _SectionKey.howItWorksLeftBehind,
                bodyKey: _SectionKey.howItWorksLeftBehindBody,
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '5',
                titleKey: _SectionKey.howItWorksProgress,
                bodyKey: _SectionKey.howItWorksProgressBody,
              ),
              const SizedBox(height: 16),
              const _Section(
                number: '6',
                titleKey: _SectionKey.howItWorksYou,
                bodyKey: _SectionKey.howItWorksYouBody,
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
                    Icon(
                      Icons.flag_outlined,
                      color: AppColors.primary,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _LocalizedText(
                        sectionKey: _SectionKey.howItWorksRule,
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

enum _SectionKey {
  howItWorksToday,
  howItWorksTodayBody,
  howItWorksCap,
  howItWorksCapBody,
  howItWorksHabits,
  howItWorksHabitsBody,
  howItWorksLeftBehind,
  howItWorksLeftBehindBody,
  howItWorksProgress,
  howItWorksProgressBody,
  howItWorksYou,
  howItWorksYouBody,
  howItWorksRule,
}

extension _SectionKeyX on _SectionKey {
  String resolve(AppLocalizations l10n) => switch (this) {
        _SectionKey.howItWorksToday => l10n.howItWorksToday,
        _SectionKey.howItWorksTodayBody => l10n.howItWorksTodayBody,
        _SectionKey.howItWorksCap => l10n.howItWorksCap,
        _SectionKey.howItWorksCapBody => l10n.howItWorksCapBody,
        _SectionKey.howItWorksHabits => l10n.howItWorksHabits,
        _SectionKey.howItWorksHabitsBody => l10n.howItWorksHabitsBody,
        _SectionKey.howItWorksLeftBehind => l10n.howItWorksLeftBehind,
        _SectionKey.howItWorksLeftBehindBody => l10n.howItWorksLeftBehindBody,
        _SectionKey.howItWorksProgress => l10n.howItWorksProgress,
        _SectionKey.howItWorksProgressBody => l10n.howItWorksProgressBody,
        _SectionKey.howItWorksYou => l10n.howItWorksYou,
        _SectionKey.howItWorksYouBody => l10n.howItWorksYouBody,
        _SectionKey.howItWorksRule => l10n.howItWorksRule,
      };
}

class _LocalizedText extends StatelessWidget {
  const _LocalizedText({required this.sectionKey, required this.style});
  final _SectionKey sectionKey;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Text(
      sectionKey.resolve(l10n),
      style: style,
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.number,
    required this.titleKey,
    required this.bodyKey,
  });
  final String number;
  final _SectionKey titleKey;
  final _SectionKey bodyKey;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
                titleKey.resolve(l10n),
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                bodyKey.resolve(l10n),
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
