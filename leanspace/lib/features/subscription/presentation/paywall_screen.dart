import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/haptics.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../providers/entitlement_provider.dart';
import '../providers/subscription_providers.dart';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key, this.source = 'unknown'});
  final String source;

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  bool _annual = true;
  bool _restoreMessageShown = false;

  static const _features = <(IconData, String, String)>[
    (
      Icons.spa_rounded,
      'All 5 habit slots',
      'Free gives you 3. Pro unlocks all five so your full daily ritual can live here.'
    ),
    (
      Icons.history_rounded,
      'Your full history',
      'Browse every day you\'ve completed — not just the last 7. Look back years, not weeks.'
    ),
    (
      Icons.emoji_events_rounded,
      'The full medal set',
      'Unlock Legendary tier medals. The rarest badges are for the people who go all in.'
    ),
    (
      Icons.ac_unit_rounded,
      'Streak freeze every month',
      '2 streak freezes a month so a single bad day doesn\'t end your chain.'
    ),
    (
      Icons.auto_awesome_rounded,
      'Weekly Receipt + share cards',
      'Beautiful share cards of your week. Post your chain, inspire someone else to start.'
    ),
    (
      Icons.palette_rounded,
      'Themes + more',
      'Unlock new accent colors and themes as we add them. Always free updates.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sub = ref.watch(subscriptionControllerProvider);
    final isPro = ref.watch(entitlementProvider).isPro;

    ref.listen(entitlementProvider, (prev, next) {
      if (next.isPro && (prev == null || !prev.isPro) && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Welcome to Bloom Tracker Pro'),
            duration: Duration(seconds: 3),
          ),
        );
        context.pop();
      }
    });

    final monthly = sub.monthly;
    final yearly = sub.yearly;
    final selected = _annual ? yearly : monthly;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AmbientBackground(
        child: SafeArea(
          child: Column(
            children: [
              _HeaderBar(
                onClose: () => context.pop(),
                isPro: isPro,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
                  children: [
                    const SizedBox(height: 8),
                    _HeroBlock(source: widget.source),
                    const SizedBox(height: 22),
                    ..._features.map(
                      (f) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: _FeatureRow(
                          icon: f.$1,
                          title: f.$2,
                          body: f.$3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    if (!isPro) _PricingBlock(
                      annual: _annual,
                      monthlyPrice: monthly?.price ?? r'$3.99',
                      monthlyPeriod: monthly?.price,
                      yearlyPrice: yearly?.price ?? r'$29.99',
                      yearlyPeriod: yearly?.price,
                      onSelect: (a) {
                        AppHaptics.light();
                        setState(() => _annual = a);
                      },
                    ),
                    if (sub.error != null && !isPro) ...[
                      const SizedBox(height: 12),
                      Text(
                        sub.error!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    const SizedBox(height: 18),
                  ],
                ),
              ),
              if (!isPro)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border(
                      top: BorderSide(
                        color: AppColors.outlineVariant,
                        width: 0.5,
                      ),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 16,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _PrimaryCta(
                        pending: sub.purchasePending,
                        enabled: selected != null,
                        onTap: selected == null
                            ? null
                            : () {
                                AppHaptics.confirm();
                                ref
                                    .read(subscriptionControllerProvider.notifier)
                                    .buy(selected);
                              },
                        label: _annual
                            ? 'Start Pro · ${yearly?.price ?? r'$29.99'}/yr'
                            : 'Start Pro · ${monthly?.price ?? r'$3.99'}/mo',
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: sub.purchasePending
                                ? null
                                : () async {
                                    setState(
                                        () => _restoreMessageShown = true);
                                    await ref
                                        .read(subscriptionControllerProvider
                                            .notifier)
                                        .restore();
                                  },
                            child: Text(
                              'Restore purchase',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '·',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.outlineVariant,
                            ),
                          ),
                          TextButton(
                            onPressed: () => _showTerms(context),
                            child: Text(
                              'Terms',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            '·',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppColors.outlineVariant,
                            ),
                          ),
                          TextButton(
                            onPressed: () => _showPrivacy(context),
                            child: Text(
                              'Privacy',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_restoreMessageShown && !sub.purchasePending) ...[
                        const SizedBox(height: 4),
                        Text(
                          sub.available
                              ? 'No previous purchase found on this account.'
                              : 'We\'ll restore your purchase on the next sync.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTerms(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => const _LegalSheet(
        title: 'Subscription terms',
        body:
            'Billing is handled by Google Play. Subscriptions renew automatically '
            'until you cancel in Play Store → Subscriptions at least 24 hours '
            'before the end of the current period. You can manage or cancel '
            'your subscription at any time from your Google Play account.\n\n'
            'Uninstalling the app does not cancel your subscription.\n\n'
            'Prices shown are in your local currency and may vary by region. '
            'Taxes may apply.',
      ),
    );
  }

  void _showPrivacy(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => const _LegalSheet(
        title: 'Privacy',
        body:
            'Bloom Tracker stores your tasks, habits, and streak data on our '
            'Supabase backend, tied to your account. We never sell your data.\n\n'
            'Subscription purchases are processed by Google Play. We receive a '
            'verified purchase token from Google to confirm your Pro status. We '
            'do not see or store your payment details.\n\n'
            'You can request full data export or account deletion from '
            'Settings → Account deletion.',
      ),
    );
  }
}

class _HeaderBar extends StatelessWidget {
  const _HeaderBar({required this.onClose, required this.isPro});
  final VoidCallback onClose;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close_rounded),
            color: AppColors.onSurfaceVariant,
            onPressed: onClose,
            tooltip: 'Close',
          ),
          const Spacer(),
          if (!isPro)
            Text(
              'Restore · Terms · Privacy',
              style: TextStyle(
                color: AppColors.onSurfaceVariant,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}

class _HeroBlock extends StatelessWidget {
  const _HeroBlock({required this.source});
  final String source;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFE8A33D), Color(0xFFA53B22)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: 0.30),
                blurRadius: 24,
                spreadRadius: 1,
              ),
            ],
          ),
          child: const Icon(
            Icons.workspace_premium_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Keep the chain unbroken.',
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          source == 'habit_slot'
              ? 'You\'ve used all your free habit slots. Unlock the full set to plant every ritual you care about.'
              : source == 'history'
                  ? 'See your full history — every perfect day, every medal, every comeback.'
                  : source == 'medal'
                      ? 'The rarest medals are Pro-only. Keep going — they\'re closer than you think.'
                      : 'Bloom Tracker Pro gives you the full discipline system. Less friction, more growth.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: AppColors.onSurfaceVariant,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({
    required this.icon,
    required this.title,
    required this.body,
  });
  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary.withValues(alpha: 0.12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  body,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    height: 1.4,
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

class _PricingBlock extends StatelessWidget {
  const _PricingBlock({
    required this.annual,
    required this.monthlyPrice,
    required this.monthlyPeriod,
    required this.yearlyPrice,
    required this.yearlyPeriod,
    required this.onSelect,
  });
  final bool annual;
  final String monthlyPrice;
  final dynamic monthlyPeriod;
  final String yearlyPrice;
  final dynamic yearlyPeriod;
  final ValueChanged<bool> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PlanOption(
          title: 'Yearly',
          price: yearlyPrice,
          caption: 'Best value · works out to ~\$2.50/mo',
          badge: 'SAVE 35%',
          selected: annual,
          onTap: () => onSelect(true),
        ),
        const SizedBox(height: 10),
        _PlanOption(
          title: 'Monthly',
          price: monthlyPrice,
          caption: 'Billed every month · cancel anytime',
          badge: null,
          selected: !annual,
          onTap: () => onSelect(false),
        ),
      ],
    );
  }
}

class _PlanOption extends StatelessWidget {
  const _PlanOption({
    required this.title,
    required this.price,
    required this.caption,
    required this.selected,
    required this.onTap,
    this.badge,
  });
  final String title;
  final String price;
  final String caption;
  final bool selected;
  final VoidCallback onTap;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withValues(alpha: 0.08)
              : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? AppColors.primary
                : AppColors.outlineVariant,
            width: selected ? 2 : 0.8,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selected ? AppColors.primary : AppColors.outline,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.onSurface,
                        ),
                      ),
                      if (badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            badge!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    caption,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryCta extends StatelessWidget {
  const _PrimaryCta({
    required this.pending,
    required this.enabled,
    required this.onTap,
    required this.label,
  });
  final bool pending;
  final bool enabled;
  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: Material(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(28),
        child: InkWell(
          onTap: (pending || !enabled) ? null : onTap,
          borderRadius: BorderRadius.circular(28),
          child: Center(
            child: pending
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _LegalSheet extends StatelessWidget {
  const _LegalSheet({required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(height: 18),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 12),
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
    );
  }
}
