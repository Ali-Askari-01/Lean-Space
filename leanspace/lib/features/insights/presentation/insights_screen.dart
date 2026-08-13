import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/haptics.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../subscription/providers/entitlement_provider.dart';
import '../providers/insights_providers.dart';
import 'widgets/weekly_receipt_card.dart';

class InsightsScreen extends ConsumerStatefulWidget {
  const InsightsScreen({super.key});

  @override
  ConsumerState<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends ConsumerState<InsightsScreen> {
  final _receiptKey = GlobalKey();
  bool _sharing = false;

  Future<void> _shareReceipt() async {
    if (_sharing) return;
    setState(() => _sharing = true);
    try {
      final boundary = _receiptKey.currentContext?.findRenderObject()
          as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: 3);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;
      final bytes = byteData.buffer.asUint8List();

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/leanspace_receipt.png');
      await file.writeAsBytes(bytes);

      AppHaptics.light();
      if (!mounted) return;
      final l10n = AppLocalizations.of(context);
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          text: l10n.insightsShareReceiptText,
        ),
      );
    } catch (_) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.shareCardCouldNotShare)),
        );
      }
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final asyncInsights = ref.watch(insightsProvider);
    final entitlement = ref.watch(entitlementProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.navInsights),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: AmbientBackground(
        child: SafeArea(
          child: asyncInsights.when(
            loading: () => Center(
              child: CircularProgressIndicator(color: AppColors.accent),
            ),
            error: (error, stackTrace) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l10n.insightsLoadError,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textMuted),
                ),
              ),
            ),
            data: (data) => ListView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _MetricTile(
                        label: l10n.insightsMetricCurrentChain,
                        value: '${data.currentStreak}',
                        suffix: data.currentStreak == 1
                            ? l10n.insightsDay
                            : l10n.insightsDays,
                        emphasized: true,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _MetricTile(
                        label: l10n.insightsMetricBestEver,
                        value: '${data.bestStreak}',
                        suffix: data.bestStreak == 1
                            ? l10n.insightsDay
                            : l10n.insightsDays,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _MetricTile(
                        label: l10n.insightsMetricTasksDone,
                        value: '${data.tasksCompleted}',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _MetricTile(
                        label: l10n.insightsMetricPerfectDays,
                        value: '${data.perfectDays}',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _MetricTile(
                        label: l10n.insightsMetricHabits,
                        value: '${data.activeHabits}',
                      ),
                    ),
                  ],
                ),
                if (data.coachingLine != null) ...[
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.accent.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: AppColors.accent,
                          size: 22,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            data.coachingLine!,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.45,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                _SectionLabel(l10n.insightsSectionThisWeek),
                RepaintBoundary(
                  key: _receiptKey,
                  child: WeeklyReceiptCard(data: data),
                ),
                const SizedBox(height: 16),
                if (entitlement.isPro)
                  OutlinedButton.icon(
                    onPressed: _sharing ? null : _shareReceipt,
                    icon: _sharing
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.ios_share, size: 18),
                    label: Text(l10n.insightsShareMyWeek),
                  )
                else
                  OutlinedButton.icon(
                    onPressed: () => context.push('/paywall?from=weekly_receipt'),
                    icon: const Icon(Icons.lock_outline_rounded, size: 18),
                    label: Text(l10n.insightsShareMyWeekPro),
                  ),
                if (!entitlement.isPro) ...[
                  const SizedBox(height: 24),
                  _UnlockHistoryCard(
                    title: l10n.insightsHistoryWindowTitle(data.windowDays ?? 7),
                    subtitle: l10n.insightsHistoryUpsell,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.label,
    required this.value,
    this.suffix,
    this.emphasized = false,
  });

  final String label;
  final String value;
  final String? suffix;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: emphasized
              ? AppColors.accent.withValues(alpha: 0.4)
              : AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.textFaint,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1,
                  color: emphasized ? AppColors.accentSoft : AppColors.text,
                ),
              ),
              if (suffix != null) ...[
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    suffix!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ],
            ],
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
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        text.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textFaint,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

class _UnlockHistoryCard extends StatelessWidget {
  const _UnlockHistoryCard({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.push('/paywall'),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.accent.withValues(alpha: 0.35)),
        ),
        child: Row(
          children: [
            Icon(Icons.lock_outline, color: AppColors.accent),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }
}
