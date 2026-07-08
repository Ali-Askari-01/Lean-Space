import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/app_actions.dart';
import '../../../core/feature_flags.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../../core/widgets/guardian_mascot.dart';
import '../../../core/widgets/locale_provider.dart';
import '../../../core/widgets/widget_setup_sheet.dart';
import '../../reminders/presentation/reminder_settings_sheet.dart';
import '../../streak_freeze/providers/streak_freeze_providers.dart';
import '../../subscription/providers/entitlement_provider.dart';
import '../../progress/presentation/how_this_works_sheet.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  PackageInfo? _info;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((value) {
      if (!mounted) return;
      setState(() => _info = value);
    });
  }

  Future<void> _signOut(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    if (context.mounted) context.go('/auth');
  }

  void _showLanguagePicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (sheetCtx) {
        final l10n = AppLocalizations.of(sheetCtx);
        final current = ref.read(localeProvider);
        final notifier = ref.read(localeProvider.notifier);
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
              for (final l in const [null, ...supportedAppLocales])
                ListTile(
                  leading: Icon(
                    l == null
                        ? Icons.smartphone_rounded
                        : Icons.translate_rounded,
                    color: AppColors.primary,
                  ),
                  title: Text(notifier.labelFor(l)),
                  trailing: (l?.languageCode ?? '') ==
                          (current?.languageCode ?? '')
                      ? const Icon(Icons.check_rounded, color: AppColors.primary)
                      : null,
                  onTap: () {
                    notifier.set(l);
                    Navigator.of(sheetCtx).pop();
                  },
                ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final user = Supabase.instance.client.auth.currentUser;
    final freeze = ref.watch(streakFreezeProvider);
    final theme = Theme.of(context);
    final displayName = user?.userMetadata?['display_name'] as String? ??
        user?.email?.split('@').first ??
        'Friend';
    final isPro = ref.watch(entitlementProvider).tier == Tier.pro;
    final level = isPro ? 12 : 3;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navSettings),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 1.5),
              ),
              child: const GuardianMascot(
                size: 44,
                expression: GuardianExpression.calm,
                variant: GuardianMascotVariant.koalaAdventure,
              ),
            ),
          ),
        ],
      ),
      body: AmbientBackground(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            GlassCard(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: AppColors.gradientHabit,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      displayName.isNotEmpty
                          ? displayName[0].toUpperCase()
                          : 'F',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryContainer
                                .withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            l10n.settingsLevel('$level'),
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 64,
                    height: 64,
                    alignment: Alignment.bottomCenter,
                    child: const Icon(
                      Icons.eco_rounded,
                      color: AppColors.outlineVariant,
                      size: 80,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _SectionLabel(l10n.settingsPersonalSanctuary),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.help_outline_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: l10n.settingsHowItWorks,
                  subtitle: l10n.settingsHowThisWorksSubtitle,
                  onTap: () => showHowThisWorksSheet(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionLabel(l10n.settingsNurturingTools),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.ac_unit_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: l10n.settingsStreakProtection,
                  subtitle: freeze.canUseFreeze
                      ? l10n.settingsStreakProtectionAvailable
                      : l10n.settingsStreakProtectionUsed,
                  trailing: Switch(
                    value: freeze.canUseFreeze,
                    onChanged: (_) {},
                    activeThumbColor: AppColors.primary,
                  ),
                ),
                const _Divider(),
                _SettingsTile(
                  icon: Icons.workspace_premium_rounded,
                  iconBg: AppColors.secondary.withValues(alpha: 0.10),
                  iconColor: AppColors.secondary,
                  title: isPro
                      ? l10n.settingsManageProSubscription
                      : l10n.settingsProSubscription,
                  subtitle: isPro
                      ? l10n.settingsProCancelPlay
                      : l10n.settingsProUnlock,
                  onTap: () => context.push(
                    isPro ? '/settings/manage-pro' : '/paywall?from=settings',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionLabel(l10n.settingsReminders),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.notifications_active_outlined,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: l10n.settingsTaskAlarms,
                  subtitle: l10n.settingsTaskAlarmsSubtitle,
                  onTap: () => showReminderSettingsSheet(context),
                ),
                const _Divider(),
                _SettingsTile(
                  icon: Icons.language_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: l10n.settingsLanguage,
                  subtitle: ref.watch(localeProvider.notifier)
                          .labelFor(ref.watch(localeProvider)),
                  onTap: () => _showLanguagePicker(context, ref),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionLabel(l10n.settingsWidgetSanctuary),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.widgets_outlined,
                  iconBg: AppColors.primaryContainer.withValues(alpha: 0.3),
                  iconColor: AppColors.primary,
                  title: l10n.settingsHomeScreenWidget,
                  subtitle: l10n.settingsHomeScreenWidgetSubtitle,
                  onTap: () => showWidgetSetupSheet(context),
                ),
                const _Divider(),
                _SettingsTile(
                  icon: Icons.ios_share_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: l10n.settingsShareBloomTracker,
                  subtitle: l10n.settingsShareBloomTrackerSubtitle,
                  onTap: () => AppActions.shareApp(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionLabel(l10n.settingsEcosystemSupport),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.help_outline_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: l10n.settingsHelpSupport,
                  subtitle: l10n.settingsHelpSupportSubtitle,
                  onTap: () => context.push('/help'),
                ),
                const _Divider(),
                _SettingsTile(
                  icon: Icons.logout_rounded,
                  iconBg: AppColors.secondary.withValues(alpha: 0.12),
                  iconColor: AppColors.secondary,
                  title: l10n.settingsSignOutTile,
                  titleColor: AppColors.secondary,
                  onTap: () => _signOut(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (FeatureFlags.unlockAllFeatures) _BetaCard(l10n: l10n),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  BlueprintLabel(
                    l10n.appTitle.toUpperCase(),
                    color: AppColors.onSurfaceVariant,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _info == null
                        ? l10n.settingsVersionUnknown
                        : l10n.settingsVersion(
                            _info!.version, _info!.buildNumber),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BetaCard extends StatelessWidget {
  const _BetaCard({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.primary.withValues(alpha: 0.08),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.science_outlined, color: AppColors.primary, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.settingsAllFeaturesUnlocked,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  l10n.settingsAllFeaturesUnlockedSubtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 4),
      child: BlueprintLabel(text, color: AppColors.onSurfaceVariant),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outlineVariant, width: 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 0.5,
      color: AppColors.outlineVariant,
      indent: 64,
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.iconColor,
    this.iconBg,
    this.titleColor,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? iconColor;
  final Color? iconBg;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: iconBg ?? AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor ?? AppColors.primary, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: titleColor ?? AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else
                const Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.outline,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
