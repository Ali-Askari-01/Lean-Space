import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/app_actions.dart';
import '../../../core/haptics.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../providers/referral_providers.dart';

class ReferralScreen extends ConsumerWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final stats = ref.watch(referralControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Invite friends'),
      ),
      body: AmbientBackground(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
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
                  const Text(
                    'Launch month gift',
                    style: TextStyle(
                      color: Color(0xFFE8A33D),
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Get 1 month of Pro free',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Share your code with friends. When 5 people sign up '
                    'using it, you unlock Bloom Tracker Pro for a full month.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.85),
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Your referral code',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 10),
            if (stats.isLoading)
              const Center(child: CircularProgressIndicator())
            else ...[
              _CodeCard(code: stats.code),
              if (stats.error != null) ...[
                const SizedBox(height: 12),
                Text(
                  stats.error!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
            const SizedBox(height: 24),
            _ProgressCard(stats: stats),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.icon(
                onPressed: stats.code.isEmpty
                    ? null
                    : () {
                        AppHaptics.confirm();
                        AppActions.shareAppWithReferral(stats.code);
                      },
                icon: const Icon(Icons.ios_share_rounded),
                label: const Text('Share with friends'),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Friends enter your code when they create an account. '
              'Each friend counts once toward your reward.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CodeCard extends StatelessWidget {
  const _CodeCard({required this.code});
  final String code;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              code.isEmpty ? '—' : code,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
                color: AppColors.primary,
              ),
            ),
          ),
          IconButton(
            tooltip: 'Copy code',
            onPressed: code.isEmpty
                ? null
                : () {
                    AppHaptics.light();
                    Clipboard.setData(ClipboardData(text: code));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Referral code copied')),
                    );
                  },
            icon: const Icon(Icons.copy_rounded),
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.stats});
  final ReferralStats stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final milestone = stats.milestone;
    final modulo = stats.referralCount % milestone;
    final atMilestone =
        stats.referralCount > 0 && modulo == 0;
    final displayProgress = atMilestone ? milestone : modulo;
    final remaining = atMilestone ? 0 : milestone - modulo;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.people_rounded, color: AppColors.primary, size: 22),
              const SizedBox(width: 8),
              Text(
                '${stats.referralCount} friend${stats.referralCount == 1 ? '' : 's'} joined',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: milestone == 0 ? 0 : displayProgress / milestone,
              minHeight: 10,
              backgroundColor: AppColors.outlineVariant,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            stats.rewardsEarned > 0
                ? 'You have earned ${stats.rewardsEarned} free month${stats.rewardsEarned == 1 ? '' : 's'} of Pro.'
                : atMilestone
                    ? 'Reward unlocked — enjoy your free month of Pro!'
                    : '$remaining more to unlock your free month',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
