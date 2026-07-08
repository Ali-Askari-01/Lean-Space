import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../my_day/providers/my_day_providers.dart';
import '../../progress/presentation/how_this_works_sheet.dart';
import '../../subscription/providers/entitlement_provider.dart';

class YouScreen extends ConsumerWidget {
  const YouScreen({super.key});

  Future<void> _signOut(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();
    if (context.mounted) context.go('/auth');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final user = Supabase.instance.client.auth.currentUser;
    final myDay = ref.watch(myDayProvider);
    final theme = Theme.of(context);
    final displayName = user?.userMetadata?['display_name'] as String? ??
        user?.email?.split('@').first ??
        'Friend';
    final initials = displayName.isNotEmpty
        ? displayName[0].toUpperCase()
        : 'F';
    final isPro = ref.watch(entitlementProvider).tier == Tier.pro;
    final taskStreak = myDay.taskStreak;
    final level = (taskStreak / 5).floor().clamp(1, 99);
    final bestHabitStreak = myDay.habits.isEmpty
        ? 0
        : myDay.habits
            .map((h) => h.streakCount)
            .reduce((a, b) => a > b ? a : b);
    final activeHabits = myDay.habits.length;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AmbientBackground(
        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
            children: [
              _Header(
                onSettings: () => context.push('/settings'),
              ),
              const SizedBox(height: 20),
              _IdentityCard(
                initials: initials,
                displayName: displayName,
                email: user?.email ?? '',
                level: level,
                isPro: isPro,
                bestHabitStreak: bestHabitStreak,
                activeHabits: activeHabits,
              ),
              if (!isPro) ...[
                const SizedBox(height: 20),
                _ProUpgradeCard(l10n: l10n),
              ],
              const SizedBox(height: 28),
              _SectionLabel(l10n.settingsYourActivity),
              _SettingsCard(
                children: [
                  _SettingsTile(
                    icon: Icons.history_rounded,
                    iconBg: AppColors.primary.withValues(alpha: 0.15),
                    iconColor: AppColors.primary,
                    title: l10n.youLast7Days,
                    subtitle: l10n.youLast7DaysSubtitle,
                    onTap: () => context.push('/history'),
                  ),
                  const _Divider(),
                  _SettingsTile(
                    icon: Icons.archive_outlined,
                    iconBg: AppColors.secondary.withValues(alpha: 0.12),
                    iconColor: AppColors.secondary,
                    title: l10n.navLeftBehind,
                    subtitle: l10n.youLeftBehindSubtitle,
                    onTap: () => context.push('/left-behind'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _SectionLabel(l10n.settingsHelpInfo),
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
              _SectionLabel(l10n.settingsAccount),
              _SettingsCard(
                children: [
                  if (user?.email != null) ...[
                    _SettingsTile(
                      icon: Icons.alternate_email_rounded,
                      iconBg: AppColors.primaryContainer.withValues(alpha: 0.3),
                      iconColor: AppColors.primary,
                      title: user!.email!,
                      subtitle: isPro ? l10n.youProTier : l10n.youFreeTier,
                      onTap: null,
                    ),
                    const _Divider(),
                  ],
                  _SettingsTile(
                    icon: Icons.logout_rounded,
                    iconBg: AppColors.secondary.withValues(alpha: 0.12),
                    iconColor: AppColors.secondary,
                    title: l10n.settingsSignOut,
                    titleColor: AppColors.secondary,
                    onTap: () => _signOut(context),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(
                  l10n.youBloomTrackerFooter,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProUpgradeCard extends StatelessWidget {
  const _ProUpgradeCard({required this.l10n});
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => context.push('/paywall?from=you_tab'),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1A4D2E), Color(0xFF0F2E1B)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.30),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8A33D),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      l10n.youProBadge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.workspace_premium_rounded,
                    color: Color(0xFFE8A33D),
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                l10n.youUnlockDiscipline,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.youProFeatures,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.78),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      l10n.youSeePlans,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.youFromPrice('2.50'),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.onSettings});
  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        const Icon(Icons.eco_rounded, color: AppColors.primary, size: 22),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            l10n.tabYou,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.4,
            ),
          ),
        ),
        IconButton(
          onPressed: onSettings,
          icon: const Icon(Icons.settings_outlined),
          color: AppColors.onSurfaceVariant,
          tooltip: l10n.commonSettingsTooltip,
        ),
      ],
    );
  }
}

class _IdentityCard extends StatelessWidget {
  const _IdentityCard({
    required this.initials,
    required this.displayName,
    required this.email,
    required this.level,
    required this.isPro,
    required this.bestHabitStreak,
    required this.activeHabits,
  });
  final String initials;
  final String displayName;
  final String email;
  final int level;
  final bool isPro;
  final int bestHabitStreak;
  final int activeHabits;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return GlassCard(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: AppColors.gradientHabit,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Text(
                  initials,
                  style: theme.textTheme.headlineMedium?.copyWith(
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
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      email,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _Pill(
                icon: Icons.local_fire_department_rounded,
                label: l10n.youLevelLabel('$level'),
                color: AppColors.secondary,
              ),
              const SizedBox(width: 8),
              _Pill(
                icon: Icons.spa_rounded,
                label: l10n.youBestStreakLabel('$bestHabitStreak'),
                color: AppColors.tertiary,
              ),
              const SizedBox(width: 8),
              _Pill(
                icon: Icons.workspace_premium_rounded,
                label: isPro ? l10n.youPro : l10n.youFree,
                color: isPro ? AppColors.primary : AppColors.outline,
              ),
            ],
          ),
          if (activeHabits == 0)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                l10n.youPlantHabit,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.icon,
    required this.label,
    required this.color,
  });
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 13),
          const SizedBox(width: 5),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: 11,
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
        text,
        style: TextStyle(
          color: AppColors.onSurfaceVariant,
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
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
    this.iconColor,
    this.iconBg,
    this.titleColor,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
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
                child:
                    Icon(icon, color: iconColor ?? AppColors.primary, size: 20),
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
              if (onTap != null)
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
