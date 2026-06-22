import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/insights.dart';

/// A self-contained, share-ready summary of the user's week.
///
/// Rendered inside a RepaintBoundary so it can be exported as a PNG and shared
/// — a free, organic marketing surface.
class WeeklyReceiptCard extends StatelessWidget {
  const WeeklyReceiptCard({super.key, required this.data});

  final InsightsData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateLabel = DateFormat.MMMd().format(DateTime.now());

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.bgElev, AppColors.surface],
        ),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [AppColors.accent, AppColors.accentDeep],
                  ),
                ),
                child: const Icon(Icons.link_rounded,
                    color: Colors.white, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                'LEANSPACE',
                style: theme.textTheme.labelMedium?.copyWith(
                  letterSpacing: 3,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
              const Spacer(),
              Text(
                'Week of $dateLabel',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'CURRENT CHAIN',
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.textFaint,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${data.currentStreak}',
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  data.currentStreak == 1 ? 'day' : 'days',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ),
              const Spacer(),
              const Text('🔥', style: TextStyle(fontSize: 30)),
            ],
          ),
          const SizedBox(height: 24),
          _ChainStrip(days: data.last7Days),
          const SizedBox(height: 24),
          Row(
            children: [
              _ReceiptStat(
                value: '${data.tasksCompleted}',
                label: 'Tasks done',
              ),
              _ReceiptStat(
                value: '${data.perfectDays}',
                label: 'Perfect days',
              ),
              _ReceiptStat(
                value: '${(data.completionRate * 100).round()}%',
                label: 'Completion',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Don\'t break the chain.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.accentSoft,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChainStrip extends StatelessWidget {
  const _ChainStrip({required this.days});

  final List<DayStat> days;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (i) {
        final day = days[i];
        final color = day.isPerfect
            ? AppColors.accent
            : day.isPartial
                ? AppColors.accent.withValues(alpha: 0.4)
                : AppColors.border;
        return Column(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                border: Border.all(
                  color: day.isPerfect
                      ? AppColors.accent
                      : AppColors.borderStrong,
                ),
              ),
              child: day.isPerfect
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 6),
            Text(
              DateFormat.E().format(day.date).substring(0, 1),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.textFaint,
                  ),
            ),
          ],
        );
      }),
    );
  }
}

class _ReceiptStat extends StatelessWidget {
  const _ReceiptStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
