import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/local_date.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/growth_widgets.dart';
import '../../../insights/domain/insights.dart';
import '../../../insights/providers/insights_providers.dart';

/// Relocated from the old Profile screen. The Personal Activity calendar
/// with per-day completion shading, month nav, and a legend strip.
class ProgressCalendarCard extends ConsumerStatefulWidget {
  const ProgressCalendarCard({super.key});

  @override
  ConsumerState<ProgressCalendarCard> createState() =>
      _ProgressCalendarCardState();
}

class _ProgressCalendarCardState extends ConsumerState<ProgressCalendarCard> {
  late DateTime _viewedMonth;

  @override
  void initState() {
    super.initState();
    _viewedMonth = DateTime(LocalDate.today.year, LocalDate.today.month);
  }

  void _shiftMonth(int delta) {
    setState(() {
      _viewedMonth = DateTime(_viewedMonth.year, _viewedMonth.month + delta);
    });
  }

  void _shiftYear(int delta) {
    setState(() {
      _viewedMonth = DateTime(
        _viewedMonth.year + delta,
        _viewedMonth.month,
      );
    });
  }

  Future<void> _pickMonth() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(_viewedMonth.year, _viewedMonth.month, 1),
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(LocalDate.today.year + 1, 12, 31),
      initialEntryMode: DatePickerEntryMode.calendar,
      helpText: 'Pick a month to browse',
    );
    if (picked != null) {
      setState(() {
        _viewedMonth = DateTime(picked.year, picked.month);
      });
    }
  }

  void _jumpToToday() {
    setState(() {
      _viewedMonth = DateTime(LocalDate.today.year, LocalDate.today.month);
    });
  }

  @override
  Widget build(BuildContext context) {
    final insightsAsync = ref.watch(insightsProvider);
    final insights = insightsAsync.asData?.value ??
        const InsightsData(
          currentStreak: 0,
          bestStreak: 0,
          last7Days: [],
          tasksCompleted: 0,
          tasksCreated: 0,
          perfectDays: 0,
          activeHabits: 0,
          topHabitStreak: 0,
          windowDays: null,
        );
    final theme = Theme.of(context);
    final today = LocalDate.today;
    final monthLabel = _monthYear(_viewedMonth);
    final isCurrentMonth = _viewedMonth.year == today.year &&
        _viewedMonth.month == today.month;

    final firstOfMonth =
        DateTime(_viewedMonth.year, _viewedMonth.month, 1);
    final startWeekday = firstOfMonth.weekday % 7; // 0 = Sunday
    final daysInMonth =
        DateTime(_viewedMonth.year, _viewedMonth.month + 1, 0).day;
    final cells = <_CalCell>[];
    for (var i = 0; i < startWeekday; i++) {
      cells.add(const _CalCell.empty());
    }
    final dayStats = insights.dayStats;
    for (var d = 1; d <= daysInMonth; d++) {
      final date = DateTime(_viewedMonth.year, _viewedMonth.month, d);
      DayStat? stat;
      for (final entry in dayStats.entries) {
        if (LocalDate.isSameDay(entry.key, date)) {
          stat = entry.value;
          break;
        }
      }
      final ratio = (stat == null || stat.created == 0)
          ? 0.0
          : (stat.done / stat.created).clamp(0.0, 1.0);
      cells.add(_CalCell(
        day: d,
        ratio: ratio,
        isPerfect: stat?.isPerfect ?? false,
        isPartial: stat?.isPartial ?? false,
        isToday: LocalDate.isSameDay(date, today),
        isFuture: date.isAfter(today),
      ));
    }
    while (cells.length % 7 != 0) {
      cells.add(const _CalCell.empty());
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: GlassCard(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Activity',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.onSurface,
              ),
            ),
            const SizedBox(height: 10),
            _MonthSelector(
              monthLabel: monthLabel,
              isCurrentMonth: isCurrentMonth,
              onPrev: () => _shiftMonth(-1),
              onNext: () => _shiftMonth(1),
              onPrevYear: () => _shiftYear(-1),
              onNextYear: () => _shiftYear(1),
              onPick: _pickMonth,
              onToday: _jumpToToday,
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                for (final d in const ['S', 'M', 'T', 'W', 'T', 'F', 'S'])
                  Expanded(
                    child: Center(
                      child: Text(
                        d,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: AppColors.outline,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1,
              children: [for (final c in cells) _CalCellView(cell: c)],
            ),
            const SizedBox(height: 4),
            const SizedBox(height: 12),
            const _CalendarLegend(),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.eco_rounded,
                  color: AppColors.primary,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    isCurrentMonth
                        ? 'Dark green means a perfect day. The shade fades as you skip.'
                        : 'Browsing $monthLabel. Tap "Today" to jump back to '
                            'your live activity.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  String _monthYear(DateTime today) {
    return DateFormat('MMMM yyyy').format(today).toUpperCase();
  }
}

class _CalCell {
  const _CalCell({
    required this.day,
    this.ratio = 0.0,
    this.isPerfect = false,
    this.isPartial = false,
    this.isToday = false,
    this.isFuture = false,
  });
  const _CalCell.empty()
      : day = 0,
        ratio = 0.0,
        isPerfect = false,
        isPartial = false,
        isToday = false,
        isFuture = false;

  final int day;
  final double ratio;
  final bool isPerfect;
  final bool isPartial;
  final bool isToday;
  final bool isFuture;
}

class _CalCellView extends StatelessWidget {
  const _CalCellView({required this.cell});
  final _CalCell cell;

  @override
  Widget build(BuildContext context) {
    if (cell.day == 0) return const SizedBox.shrink();
    final theme = Theme.of(context);
    Color bg;
    Color fg;
    if (cell.isFuture) {
      bg = AppColors.surfaceContainerHigh;
      fg = AppColors.outline;
    } else if (cell.isPerfect) {
      bg = AppColors.primary;
      fg = Colors.white;
    } else if (cell.ratio > 0) {
      final alpha = 0.18 + (0.82 * cell.ratio);
      bg = AppColors.primary.withValues(alpha: alpha);
      fg = cell.ratio >= 0.55 ? Colors.white : AppColors.onSurface;
    } else {
      bg = AppColors.surfaceContainer;
      fg = AppColors.onSurfaceVariant;
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: bg,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${cell.day}',
            style: theme.textTheme.labelSmall?.copyWith(
              color: fg,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (cell.isToday)
          Positioned(
            bottom: 0,
            child: Container(
              width: 12,
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
      ],
    );
  }
}

class _CalendarLegend extends StatelessWidget {
  const _CalendarLegend();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget swatch(double ratio, {bool perfect = false}) {
      final color = perfect
          ? AppColors.primary
          : AppColors.primary.withValues(alpha: 0.18 + (0.82 * ratio));
      return Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );
    }

    return Row(
      children: [
        swatch(0.2),
        const SizedBox(width: 4),
        swatch(0.5),
        const SizedBox(width: 4),
        swatch(0.8),
        const SizedBox(width: 4),
        swatch(1.0, perfect: true),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            'darker = more finished',
            maxLines: 2,
            style: theme.textTheme.labelSmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              fontStyle: FontStyle.italic,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}

class _MonthSelector extends StatelessWidget {
  const _MonthSelector({
    required this.monthLabel,
    required this.isCurrentMonth,
    required this.onPrev,
    required this.onNext,
    required this.onPrevYear,
    required this.onNextYear,
    required this.onPick,
    required this.onToday,
  });
  final String monthLabel;
  final bool isCurrentMonth;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onPrevYear;
  final VoidCallback onNextYear;
  final VoidCallback onPick;
  final VoidCallback onToday;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.outlineVariant, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _MonthArrow(
            icon: Icons.skip_previous_rounded,
            onTap: onPrevYear,
            tooltip: 'Previous year',
          ),
          _MonthArrow(
            icon: Icons.chevron_left_rounded,
            onTap: onPrev,
            tooltip: 'Previous month',
          ),
          GestureDetector(
            onTap: onPick,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    monthLabel,
                    style: TextStyle(
                      color: isCurrentMonth
                          ? AppColors.onSurface
                          : AppColors.primary,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.expand_more_rounded,
                    size: 14,
                    color: isCurrentMonth
                        ? AppColors.onSurfaceVariant
                        : AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
          _MonthArrow(
            icon: Icons.chevron_right_rounded,
            onTap: onNext,
            tooltip: 'Next month',
          ),
          _MonthArrow(
            icon: Icons.skip_next_rounded,
            onTap: onNextYear,
            tooltip: 'Next year',
          ),
          if (!isCurrentMonth)
            Tooltip(
              message: 'Back to today',
              child: InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: onToday,
                child: Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.today_rounded,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _MonthArrow extends StatelessWidget {
  const _MonthArrow({
    required this.icon,
    required this.onTap,
    required this.tooltip,
  });
  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Tooltip(
        message: tooltip,
        child: Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          child: Icon(icon, size: 18, color: AppColors.onSurfaceVariant),
        ),
      ),
    );
  }
}
