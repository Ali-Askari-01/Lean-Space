import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import '../../features/subscription/providers/entitlement_provider.dart';

/// Wraps any Pro-only UI block. When the user is on the free tier the
/// child is replaced by a tasteful teaser card that opens the paywall.
class ProFeatureGate extends ConsumerWidget {
  const ProFeatureGate({
    super.key,
    required this.child,
    required this.feature,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  /// The full, gated child. Rendered as-is when the user is Pro.
  final Widget child;

  /// Identifier for analytics / debugging.
  final String feature;

  /// Headline on the teaser card.
  final String title;

  /// One-line value prop under the title.
  final String subtitle;

  /// Icon shown on the teaser card.
  final IconData icon;

  /// Layout of the child when the user is Pro.
  final Alignment alignment;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPro = ref.watch(entitlementProvider).isPro;
    if (isPro) return Align(alignment: alignment, child: child);
    return Padding(
      padding: padding,
      child: _ProTeaserCard(
        icon: icon,
        title: title,
        subtitle: subtitle,
        onTap: () => context.push('/paywall?from=$feature'),
      ),
    );
  }
}

class _ProTeaserCard extends StatelessWidget {
  const _ProTeaserCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary.withValues(alpha: 0.10),
                AppColors.tertiary.withValues(alpha: 0.08),
              ],
            ),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.30),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.18),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.primary, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: AppColors.tertiary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'PRO',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 12.5,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Unlock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
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
