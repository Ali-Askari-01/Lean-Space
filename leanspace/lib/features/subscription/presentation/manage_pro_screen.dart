import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../referral/providers/referral_providers.dart';
import '../providers/entitlement_provider.dart';

/// Settings → Pro → "Manage subscription" landing page. For Android, the
/// only place to truly cancel a subscription is Google Play. We deep-link
/// to Play's subscription management and show useful context here.
class ManageProScreen extends ConsumerStatefulWidget {
  const ManageProScreen({super.key});

  @override
  ConsumerState<ManageProScreen> createState() => _ManageProScreenState();
}

class _ManageProScreenState extends ConsumerState<ManageProScreen> {
  PackageInfo? _info;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((value) {
      if (!mounted) return;
      setState(() => _info = value);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(referralControllerProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final entitlement = ref.watch(entitlementProvider);
    final referral = ref.watch(referralControllerProvider);
    final isPro = entitlement.isPro;
    final proUntil = entitlement.proUntil;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.manageProTitle),
      ),
      body: AmbientBackground(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 80),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.heroGradient,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    blurRadius: 20,
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
                          color: AppColors.shareCardAccent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          l10n.commonPro,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        isPro ? l10n.manageProActive : l10n.manageProNotSubscribed,
                        style: TextStyle(
                          color: isPro
                              ? AppColors.primaryContainer
                              : Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    isPro ? l10n.manageProThankYou : l10n.manageProFreeTier,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isPro && proUntil != null
                        ? l10n.manageProRenewsOn(_formatDate(context, proUntil))
                        : l10n.manageProFreeBody,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.78),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _SectionLabel(l10n.manageProSectionManage),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.open_in_new_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: l10n.manageProOpenPlay,
                  subtitle: isPro
                      ? l10n.manageProOpenPlaySubtitlePro
                      : l10n.manageProOpenPlaySubtitleFree,
                  onTap: _openPlaySubscriptions,
                ),
                if (isPro) ...[
                  const _Divider(),
                  _SettingsTile(
                    icon: Icons.ios_share_rounded,
                    iconBg: AppColors.secondary.withValues(alpha: 0.10),
                    iconColor: AppColors.secondary,
                    title: l10n.manageProShareApp,
                    subtitle: l10n.manageProShareSubtitle,
                    onTap: () => context.push('/share-card'),
                  ),
                  const _Divider(),
                  _SettingsTile(
                    icon: Icons.card_giftcard_rounded,
                    iconBg: AppColors.primary.withValues(alpha: 0.12),
                    iconColor: AppColors.primary,
                    title: l10n.referralYouTitle,
                    subtitle:
                        '${l10n.manageProReferralHint} · ${referral.progress}/${referral.milestone}',
                    onTap: () => context.push('/referral'),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 24),
            _SectionLabel(l10n.manageProSectionHelp),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.help_outline_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: l10n.manageProHelpTitle,
                  subtitle: l10n.manageProHelpSubtitle,
                  onTap: () => context.push('/help'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                l10n.manageProBillingFooter(_info?.version ?? '1.0.0'),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(BuildContext context, DateTime d) {
    return MaterialLocalizations.of(context).formatMediumDate(d);
  }

  Future<void> _openPlaySubscriptions() async {
    if (!mounted) return;
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.manageProPlayInstructions),
        duration: Duration(seconds: 6),
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
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? iconBg;

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
                        color: AppColors.onSurface,
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
                Icon(
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
