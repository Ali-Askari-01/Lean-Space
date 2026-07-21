import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/haptics.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/reveal_animations.dart';
import '../../referral/providers/referral_providers.dart';
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

  static const _featureIcons = <IconData>[
    Icons.spa_rounded,
    Icons.history_rounded,
    Icons.emoji_events_rounded,
    Icons.ac_unit_rounded,
    Icons.auto_awesome_rounded,
    Icons.palette_rounded,
  ];

  List<(IconData, String, String)> _features(AppLocalizations l10n) {
    final titles = l10n.paywallFeatures.split('|');
    final bodies = l10n.paywallFeaturesBodies.split('|');
    final count = titles.length < bodies.length ? titles.length : bodies.length;
    return [
      for (var i = 0; i < _featureIcons.length && i < count; i++)
        (_featureIcons[i], titles[i], bodies[i]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final sub = ref.watch(subscriptionControllerProvider);
    final referral = ref.watch(referralControllerProvider);
    final isPro = ref.watch(entitlementProvider).isPro;

    ref.listen(entitlementProvider, (prev, next) {
      if (next.isPro && (prev == null || !prev.isPro) && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.paywallWelcomePro),
            duration: Duration(seconds: 3),
          ),
        );
        context.pop();
      }
    });

    final monthly = sub.monthly;
    final yearly = sub.yearly;
    final preferAnnual = _annual && yearly != null;
    final selected = preferAnnual
        ? yearly
        : (!preferAnnual && monthly != null)
            ? monthly
            : yearly ?? monthly;

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
                    ..._features(l10n).asMap().entries.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: FadeUp(
                          delay: Duration(milliseconds: 40 * e.key),
                          child: _FeatureRow(
                            icon: e.value.$1,
                            title: e.value.$2,
                            body: e.value.$3,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    if (!isPro) _PricingBlock(
                      annual: _annual && yearly != null,
                      monthlyPrice: monthly?.price ?? r'$1.99',
                      monthlyPeriod: monthly?.price,
                      yearlyPrice: yearly?.price ?? r'$19.99',
                      yearlyPeriod: yearly?.price,
                      showMonthly: monthly != null,
                      showYearly: yearly != null,
                      onSelect: (a) {
                        AppHaptics.light();
                        setState(() => _annual = a);
                      },
                    ),
                    if (!isPro) ...[
                      const SizedBox(height: 12),
                      _ReferralPlanCard(
                        isPro: false,
                        progress: referral.progress,
                        milestone: referral.milestone,
                        title: l10n.referralPaywallTitle,
                        body: l10n.referralPaywallBody,
                        progressLabel: l10n.referralPaywallProgress(
                          referral.progress,
                          referral.milestone,
                        ),
                        onTap: () => context.push('/referral'),
                      ),
                    ] else ...[
                      const SizedBox(height: 12),
                      _ReferralPlanCard(
                        isPro: true,
                        progress: referral.progress,
                        milestone: referral.milestone,
                        title: l10n.referralPaywallTitle,
                        body: l10n.referralPaywallProBody,
                        progressLabel: l10n.referralPaywallProgress(
                          referral.progress,
                          referral.milestone,
                        ),
                        onTap: () => context.push('/referral'),
                      ),
                    ],
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
                            ? l10n.paywallStartCta(yearly?.price ?? r'$19.99')
                            : l10n.paywallStartCtaMonthly(
                                monthly?.price ?? r'$1.99',
                              ),
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
                              l10n.paywallRestore,
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
                              l10n.paywallTerms,
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
                              l10n.paywallPrivacy,
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
                              ? l10n.paywallNoRestore
                              : l10n.paywallRestoreLater,
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
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => _LegalSheet(
        title: l10n.paywallTermsTitle,
        body: l10n.paywallTermsBody,
      ),
    );
  }

  void _showPrivacy(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => _LegalSheet(
        title: l10n.paywallPrivacyTitle,
        body: l10n.paywallPrivacyBody,
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
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close_rounded),
            color: AppColors.onSurfaceVariant,
            onPressed: onClose,
            tooltip: l10n.paywallCloseTooltip,
          ),
          const Spacer(),
          if (!isPro)
            Text(
              l10n.paywallFooterLinks,
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
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final subtitle = switch (source) {
      'habit_slot' => l10n.paywallHabitSlotHead,
      'history' => l10n.paywallHistoryHead,
      'medal' => l10n.paywallMedalHead,
      _ => l10n.paywallSubtitle,
    };
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.gradientCta,
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
          l10n.paywallTitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
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
    required this.showMonthly,
    required this.showYearly,
    required this.onSelect,
  });
  final bool annual;
  final String monthlyPrice;
  final dynamic monthlyPeriod;
  final String yearlyPrice;
  final dynamic yearlyPeriod;
  final bool showMonthly;
  final bool showYearly;
  final ValueChanged<bool> onSelect;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        if (showYearly)
          _PlanOption(
            title: l10n.paywallYearly,
            price: yearlyPrice,
            caption: l10n.paywallYearlyCaption,
            badge: l10n.paywallSavePercent,
            selected: annual,
            onTap: () => onSelect(true),
          ),
        if (showYearly && showMonthly) const SizedBox(height: 10),
        if (showMonthly)
          _PlanOption(
            title: l10n.paywallMonthly,
            price: monthlyPrice,
            caption: l10n.paywallMonthlyCaption,
            badge: null,
            selected: !annual || !showYearly,
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
              : AppColors.elevatedCardSurface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? AppColors.primary
                : AppColors.cardBorder,
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

class _ReferralPlanCard extends StatelessWidget {
  const _ReferralPlanCard({
    required this.isPro,
    required this.progress,
    required this.milestone,
    required this.title,
    required this.body,
    required this.progressLabel,
    required this.onTap,
  });

  final bool isPro;
  final int progress;
  final int milestone;
  final String title;
  final String body;
  final String progressLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fraction = milestone == 0 ? 0.0 : progress / milestone;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: 0.35),
              width: 1.2,
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.secondary.withValues(alpha: 0.08),
                AppColors.tertiary.withValues(alpha: 0.06),
              ],
            ),
          ),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(
                      value: fraction.clamp(0.0, 1.0),
                      strokeWidth: 3,
                      color: AppColors.secondary,
                      backgroundColor:
                          AppColors.outlineVariant.withValues(alpha: 0.4),
                    ),
                  ),
                  Icon(
                    Icons.card_giftcard_rounded,
                    color: AppColors.secondary,
                    size: 22,
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          progressLabel,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      body,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: AppColors.outline),
            ],
          ),
        ),
      ),
    );
  }
}
