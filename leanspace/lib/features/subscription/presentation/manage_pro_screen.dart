import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entitlement = ref.watch(entitlementProvider);
    final isPro = entitlement.isPro;
    final proUntil = entitlement.proUntil;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Pro subscription'),
      ),
      body: AmbientBackground(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 80),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1A4D2E), Color(0xFF0F2E1B)],
                ),
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
                        child: const Text(
                          'PRO',
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
                        isPro ? 'Active' : 'Not subscribed',
                        style: TextStyle(
                          color: isPro
                              ? const Color(0xFF66DD8B)
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
                    isPro ? 'You\'re on Pro' : 'Free tier',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isPro && proUntil != null
                        ? 'Renews or expires on '
                            '${_formatDate(proUntil)}.'
                        : 'You\'re using Bloom Tracker Free. '
                            'Upgrade to unlock the full system.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.78),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _SectionLabel('MANAGE'),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.open_in_new_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: 'Open Google Play subscriptions',
                  subtitle: isPro
                      ? 'Cancel, change plan, or update payment method'
                      : 'Find your existing subscription (if any) here',
                  onTap: _openPlaySubscriptions,
                ),
                if (isPro) ...[
                  const _Divider(),
                  _SettingsTile(
                    icon: Icons.ios_share_rounded,
                    iconBg: AppColors.secondary.withValues(alpha: 0.10),
                    iconColor: AppColors.secondary,
                    title: 'Share Bloom Tracker',
                    subtitle: 'Tell a friend about the chain',
                    onTap: () => context.push('/share-card'),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 24),
            _SectionLabel('NEED HELP?'),
            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.help_outline_rounded,
                  iconBg: AppColors.tertiary.withValues(alpha: 0.15),
                  iconColor: AppColors.tertiary,
                  title: 'Help & Support',
                  subtitle: 'Subscription FAQ, contact, bug reports',
                  onTap: () => context.push('/help'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                'Billing handled by Google Play · ${_info?.version ?? '1.0.0'}',
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

  String _formatDate(DateTime d) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }

  Future<void> _openPlaySubscriptions() async {
    // We avoid pulling in url_launcher just for this — the Play app icon
    // is the canonical place to manage Google Play subscriptions. Show
    // a short instruction snackbar.
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Open the Google Play Store app → tap your profile → '
          'Payments & subscriptions → Subscriptions.',
        ),
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
