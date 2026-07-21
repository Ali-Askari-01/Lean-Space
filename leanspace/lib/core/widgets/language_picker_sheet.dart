import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import 'locale_provider.dart';

/// Shared language picker used in Settings and onboarding.
class LanguagePickerSheet extends ConsumerWidget {
  const LanguagePickerSheet({
    super.key,
    this.includeSystemDefault = true,
    this.onSelected,
  });

  final bool includeSystemDefault;
  final ValueChanged<Locale?>? onSelected;

  static Future<void> show(
    BuildContext context, {
    bool includeSystemDefault = true,
    ValueChanged<Locale?>? onSelected,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => LanguagePickerSheet(
        includeSystemDefault: includeSystemDefault,
        onSelected: onSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final current = ref.watch(localeProvider);
    final notifier = ref.read(localeProvider.notifier);
    final locales = includeSystemDefault
        ? const <Locale?>[null, ...supportedAppLocales]
        : supportedAppLocales.map<Locale?>((l) => l).toList();

    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.outlineVariant,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 18, 24, 8),
            child: Text(
              l10n.languagePickerTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          for (final locale in locales)
            ListTile(
              leading: Icon(
                locale == null
                    ? Icons.smartphone_rounded
                    : Icons.translate_rounded,
                color: AppColors.primary,
              ),
              title: Text(notifier.labelFor(locale, l10n)),
              trailing: (locale?.languageCode ?? '') ==
                      (current?.languageCode ?? '')
                  ? Icon(Icons.check_rounded, color: AppColors.primary)
                  : null,
              onTap: () {
                notifier.set(locale);
                onSelected?.call(locale);
                Navigator.of(context).pop();
              },
            ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

/// Inline language list for onboarding page 0.
class OnboardingLanguagePicker extends ConsumerWidget {
  const OnboardingLanguagePicker({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final Locale? selected;
  final ValueChanged<Locale> onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final notifier = ref.read(localeProvider.notifier);

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: supportedAppLocales.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final locale = supportedAppLocales[index];
        final isSelected = selected?.languageCode == locale.languageCode;
        return Material(
          color: isSelected
              ? AppColors.primaryContainer.withValues(alpha: 0.35)
              : AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onSelected(locale),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Icon(
                    Icons.translate_rounded,
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.onSurfaceVariant,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      notifier.labelFor(locale, l10n),
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: AppColors.onSurface,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(Icons.check_circle_rounded, color: AppColors.primary),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
