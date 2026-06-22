import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../providers/entitlement_provider.dart';
import '../providers/subscription_providers.dart';

class PaywallScreen extends ConsumerStatefulWidget {
  const PaywallScreen({super.key});

  @override
  ConsumerState<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends ConsumerState<PaywallScreen> {
  bool _annual = true;

  static const _features = <(IconData, String)>[
    (Icons.all_inclusive, 'All 5 habit slots, not just 3'),
    (Icons.history, 'Your full history, forever'),
    (Icons.insights, 'Weekly Receipt & deep insights'),
    (Icons.widgets_outlined, 'Home-screen chain widget'),
    (Icons.palette_outlined, 'Extra themes'),
    (Icons.block, 'No ads, ever'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sub = ref.watch(subscriptionControllerProvider);
    final isPro = ref.watch(entitlementProvider).isPro;

    ref.listen(entitlementProvider, (prev, next) {
      if (next.isPro && (prev == null || !prev.isPro) && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Welcome to LeanSpace Pro')),
        );
        context.pop();
      }
    });

    final monthly = sub.monthly;
    final yearly = sub.yearly;
    final selected = _annual ? yearly : monthly;

    return Scaffold(
      body: AmbientBackground(
        child: SafeArea(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 140),
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: AppColors.textMuted),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [AppColors.accent, AppColors.accentDeep],
                        ),
                      ),
                      child: const Icon(Icons.workspace_premium,
                          color: Colors.white, size: 32),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Keep the chain unbroken.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'LeanSpace Pro gives you the full discipline system.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 28),
                  ..._features.map((f) => _FeatureRow(icon: f.$1, label: f.$2)),
                  const SizedBox(height: 28),
                  if (isPro)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.accent.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Text(
                        'You\'re on Pro. Thank you for the support.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.accentSoft,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else ...[
                    _PlanOption(
                      title: 'Yearly',
                      price: yearly?.price ?? '\$29.99',
                      caption: 'Best value · ~\$2.50/mo',
                      selected: _annual,
                      onTap: () => setState(() => _annual = true),
                    ),
                    const SizedBox(height: 12),
                    _PlanOption(
                      title: 'Monthly',
                      price: monthly?.price ?? '\$3.99',
                      caption: 'Billed every month',
                      selected: !_annual,
                      onTap: () => setState(() => _annual = false),
                    ),
                  ],
                  if (sub.error != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      sub.error!,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.danger,
                      ),
                    ),
                  ],
                ],
              ),
              if (!isPro)
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 20,
                  child: _PurchaseBar(
                    pending: sub.purchasePending,
                    canBuy: selected != null,
                    onBuy: selected == null
                        ? null
                        : () => ref
                            .read(subscriptionControllerProvider.notifier)
                            .buy(selected),
                    onRestore: () => ref
                        .read(subscriptionControllerProvider.notifier)
                        .restore(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.accent.withValues(alpha: 0.12),
            ),
            child: Icon(icon, color: AppColors.accent, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
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
  });

  final String title;
  final String price;
  final String caption;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accent.withValues(alpha: 0.1)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.accent : AppColors.border,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selected ? AppColors.accent : AppColors.textFaint,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    caption,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PurchaseBar extends StatelessWidget {
  const _PurchaseBar({
    required this.pending,
    required this.canBuy,
    required this.onBuy,
    required this.onRestore,
  });

  final bool pending;
  final bool canBuy;
  final VoidCallback? onBuy;
  final VoidCallback onRestore;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: (pending || !canBuy) ? null : onBuy,
            child: pending
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text('Start Pro'),
          ),
        ),
        TextButton(
          onPressed: pending ? null : onRestore,
          child: Text(
            'Restore purchase',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textMuted,
                ),
          ),
        ),
      ],
    );
  }
}
