import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/app_actions.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/reveal_animations.dart';
import '../../../providers/service_providers.dart';
import '../../my_day/providers/my_day_providers.dart';
import '../../progress/presentation/how_this_works_sheet.dart';
import '../../referral/providers/referral_providers.dart';
import '../../subscription/providers/entitlement_provider.dart';

class YouScreen extends ConsumerStatefulWidget {
  const YouScreen({super.key});

  @override
  ConsumerState<YouScreen> createState() => _YouScreenState();
}

class _YouScreenState extends ConsumerState<YouScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(referralControllerProvider.notifier).refresh();
    });
  }

  Future<void> _signOut(BuildContext context) async {
    await ref.read(apiClientProvider).signOut();
    if (context.mounted) context.go('/auth');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final user = ref.watch(apiClientProvider).currentUser;
    final myDay = ref.watch(myDayProvider);
    final theme = Theme.of(context);
    final displayName = user?['display_name'] as String? ??
        (user?['email'] as String?)?.split('@').first ??
        l10n.commonFriend;
    final initials = displayName.isNotEmpty
        ? displayName[0].toUpperCase()
        : 'F';
    final isPro = ref.watch(entitlementProvider).isPro;
    final entitlement = ref.watch(entitlementProvider);
    final referral = ref.watch(referralControllerProvider);
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
                email: user?['email'] as String? ?? '',
                level: level,
                isPro: isPro,
                bestHabitStreak: bestHabitStreak,
                activeHabits: activeHabits,
              ),
              if (!isPro) ...[
                const SizedBox(height: 20),
                FadeUp(child: _ProUpgradeCard(l10n: l10n)),
              ] else ...[
                const SizedBox(height: 20),
                FadeUp(child: _ProMemberCard(l10n: l10n, proUntil: entitlement.proUntil)),
              ],
              const SizedBox(height: 20),
              FadeUp(
                delay: const Duration(milliseconds: 60),
                child: _ReferralCard(
                  l10n: l10n,
                  referral: referral,
                  onDetails: () => context.push('/referral'),
                  onShare: () => AppActions.shareAppWithReferral(l10n, referral.code),
                ),
              ),
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
                  if (user?['email'] != null) ...[
                    _SettingsTile(
                      icon: Icons.alternate_email_rounded,
                      iconBg: AppColors.primaryContainer.withValues(alpha: 0.3),
                      iconColor: AppColors.primary,
                      title: user!['email'] as String,
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
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.heroGradient,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.35),
                blurRadius: 22,
                offset: const Offset(0, 10),
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
                      color: AppColors.shareCardAccent,
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
                  Icon(
                    Icons.workspace_premium_rounded,
                    color: AppColors.shareCardAccent,
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
                    l10n.youFromPrice('1.67'),
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

class _ProMemberCard extends StatelessWidget {
  const _ProMemberCard({required this.l10n, this.proUntil});
  final AppLocalizations l10n;
  final DateTime? proUntil;

  String _memberSince(BuildContext context) {
    if (proUntil == null) return '';
    return DateFormat.yMMMM().format(proUntil!);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final since = _memberSince(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.heroGradient,
        ),
        border: Border.all(color: AppColors.shareCardAccent.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shareCardAccent.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.workspace_premium_rounded,
                  color: AppColors.shareCardAccent, size: 20),
              const SizedBox(width: 8),
              Text(
                l10n.youProBadge,
                style: TextStyle(
                  color: AppColors.shareCardAccent,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            since.isNotEmpty
                ? l10n.youProMemberSince(since)
                : l10n.youProTier,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.youProPerksTitle,
            style: theme.textTheme.labelSmall?.copyWith(
              color: Colors.white70,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 8),
          ...[
            l10n.youPerkHabitSlots,
            l10n.youPerkFullHistory,
            l10n.youPerkAllThemes,
            l10n.youPerkStreakFreezes,
            l10n.youPerkLegendaryMedals,
          ].map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(Icons.check_circle_rounded,
                      color: AppColors.primaryContainer, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    p,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReferralCard extends StatelessWidget {
  const _ReferralCard({
    required this.l10n,
    required this.referral,
    required this.onDetails,
    required this.onShare,
  });

  final AppLocalizations l10n;
  final ReferralStats referral;
  final VoidCallback onDetails;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = referral.referralCount % referral.milestone == 0 &&
            referral.referralCount > 0
        ? referral.milestone
        : referral.progress;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onDetails,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.elevatedCardSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.card_giftcard_rounded,
                      color: AppColors.secondary, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      l10n.referralYouTitle,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                l10n.referralYouSubtitle(count, referral.milestone),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  TextButton(
                    onPressed: onShare,
                    child: Text(l10n.referralYouShare),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: onDetails,
                    child: Text(l10n.referralYouDetails),
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
        Icon(Icons.eco_rounded, color: AppColors.primary, size: 22),
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
          icon: Icon(Icons.settings_outlined),
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.cardGradient,
        ),
        border: Border.all(color: AppColors.cardBorder, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gradient header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.heroGradient,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 68,
                  height: 68,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
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
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        email,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.75),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Stats row
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _StatBlock(
                        icon: Icons.local_fire_department_rounded,
                        value: '$level',
                        label: l10n.youLevelLabel(''),
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatBlock(
                        icon: Icons.spa_rounded,
                        value: '$bestHabitStreak',
                        label: l10n.youBestStreakLabel(''),
                        color: AppColors.tertiary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatBlock(
                        icon: Icons.workspace_premium_rounded,
                        value: isPro ? 'PRO' : 'FREE',
                        label: '',
                        color: isPro
                            ? AppColors.shareCardAccent
                            : AppColors.outline,
                      ),
                    ),
                  ],
                ),
                if (activeHabits == 0) ...[
                  const SizedBox(height: 12),
                  Text(
                    l10n.youPlantHabit,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: AppColors.onSurfaceVariant,
                fontSize: 10,
              ),
            ),
          ],
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
        color: AppColors.elevatedCardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
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
    return Divider(
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
                  Icon(Icons.chevron_right_rounded, color: AppColors.outline),
            ],
          ),
        ),
      ),
    );
  }
}
