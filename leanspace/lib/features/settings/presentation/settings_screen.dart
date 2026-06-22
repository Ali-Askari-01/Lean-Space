import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/app_actions.dart';
import '../../../core/feature_flags.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/widget_setup_sheet.dart';
import '../../reminders/presentation/reminder_settings_sheet.dart';
import '../../streak_freeze/providers/streak_freeze_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _signOut(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    if (context.mounted) context.go('/auth');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = Supabase.instance.client.auth.currentUser;
    final freeze = ref.watch(streakFreezeProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: AmbientBackground(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          children: [
            if (FeatureFlags.unlockAllFeatures) const _BetaCard(),
            if (!FeatureFlags.unlockAllFeatures) ...[
              // Pro card hidden while subscriptions are disabled.
            ],
            if (FeatureFlags.unlockAllFeatures) const SizedBox(height: 24),
            const _SectionLabel('Account'),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.alternate_email,
                  title: 'Signed in as',
                  subtitle: user?.email ?? 'Not signed in',
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.insights_outlined,
                  title: 'Your progress',
                  subtitle: 'Streaks, weekly receipt and history',
                  onTap: () => context.push('/insights'),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.textFaint,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _SectionLabel('Chain'),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.ac_unit_outlined,
                  title: 'Streak freeze',
                  subtitle: freeze.canUseFreeze
                      ? '1 freeze available this month'
                      : 'Used for this month',
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _SectionLabel('Reminders'),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.notifications_active_outlined,
                  title: 'Task alarms & Final Call',
                  subtitle: 'Evening nudge and midnight warning',
                  onTap: () => showReminderSettingsSheet(context),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.textFaint,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _SectionLabel('App'),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.widgets_outlined,
                  title: 'Home-screen widget',
                  subtitle: 'Add your chain streak to the home screen',
                  onTap: () => showWidgetSetupSheet(context),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.textFaint,
                  ),
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.ios_share,
                  title: 'Share LeanSpace',
                  subtitle: 'Tell a friend about the chain',
                  onTap: () => AppActions.shareApp(),
                ),
                const Divider(height: 1),
                _SettingsTile(
                  icon: Icons.info_outline,
                  title: 'App info & uninstall',
                  subtitle: 'Permissions, storage, remove app',
                  onTap: () => AppActions.openAppInfo(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const _SectionLabel('Danger zone'),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.logout,
                  title: 'Sign out',
                  iconColor: AppColors.danger,
                  onTap: () => _signOut(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'LeanSpace · Don\'t break the chain',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.textFaint,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BetaCard extends StatelessWidget {
  const _BetaCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.accent.withValues(alpha: 0.1),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          const Icon(Icons.science_outlined, color: AppColors.accent, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All features unlocked',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Beta build — subscriptions paused while we test everything.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
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
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textFaint,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
      ),
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
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(children: children),
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
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor ?? AppColors.textMuted),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: iconColor ?? AppColors.text,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
              ),
            )
          : null,
      trailing: trailing,
    );
  }
}
