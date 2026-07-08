import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/deep_link_handlers.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/local_date.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../../core/widgets/guardian_mascot.dart';
import '../../../core/widgets/intention_quotes.dart';
import '../../../core/widgets/reveal_animations.dart';
import '../../../core/widgets/widget_setup_sheet.dart';
import '../../insights/domain/medals.dart';
import '../../medals/presentation/medal_celebration_sheet.dart';
import '../domain/habit.dart';
import '../providers/my_day_providers.dart';
import 'widgets/add_task_sheet.dart';
import 'widgets/first_run_empty_state.dart';
import 'widgets/habit_row.dart';
import 'widgets/left_behind_widgets.dart';
import 'widgets/streak_at_risk_banner.dart';
import 'widgets/task_section.dart';
import 'widgets/today_hero_strip.dart';

class MyDayScreen extends ConsumerStatefulWidget {
  const MyDayScreen({super.key});

  @override
  ConsumerState<MyDayScreen> createState() => _MyDayScreenState();
}

class _MyDayScreenState extends ConsumerState<MyDayScreen> {
  ProviderSubscription<bool>? _addTaskSub;
  ProviderSubscription<bool>? _widgetSetupSub;
  ProviderSubscription<bool>? _chainBrokenSub;

  @override
  void initState() {
    super.initState();

    _addTaskSub = ref.listenManual<bool>(pendingAddTaskProvider, (prev, next) {
      if (!next || !mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ref.read(pendingAddTaskProvider.notifier).state = false;
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.surface,
          builder: (_) => const AddTaskSheet(),
        );
      });
    });

    _widgetSetupSub =
        ref.listenManual<bool>(pendingWidgetSetupProvider, (prev, next) {
      if (!next || !mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ref.read(pendingWidgetSetupProvider.notifier).state = false;
        showWidgetSetupSheet(context);
      });
    });

    _chainBrokenSub =
        ref.listenManual<bool>(chainBrokenProvider, (prev, next) {
      if (!next || prev == true || !mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ref.read(chainBrokenProvider.notifier).state = false;
        context.push('/chain-recovery');
      });
    });

    // New-medal celebration listener. We don't need to keep the
    // subscription because Riverpod auto-disposes with the WidgetRef.
    ref.listenManual<List<String>>(
      myDayProvider.select((s) => s.newlyEarnedMedalIds),
      (prev, next) {
        if (next.isEmpty || !mounted) return;
        // Show the first new medal; queue the rest behind it. The
        // sheet close → popCelebration() cycle surfaces the next id.
        final id = next.first;
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!mounted) return;
          ref.read(myDayProvider.notifier).popCelebration();
          final medal = getMedalCatalogue().firstWhere(
                (m) => m.id == id,
                orElse: () => getMedalCatalogue().first,
              );
          await showMedalCelebration(context, medal: medal);
        });
      },
    );
  }

  @override
  void dispose() {
    _addTaskSub?.close();
    _widgetSetupSub?.close();
    _chainBrokenSub?.close();
    super.dispose();
  }

  String _greeting(AppLocalizations l10n) {
    final hour = DateTime.now().hour;
    if (hour < 5) return l10n.greetingLateNight;
    if (hour < 12) return l10n.greetingMorning;
    if (hour < 17) return l10n.greetingAfternoon;
    if (hour < 21) return l10n.greetingEvening;
    return l10n.greetingNight;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(myDayProvider);
    final theme = Theme.of(context);
    final completed = state.todayTasks.where((t) => t.isDone).length;
    final total = state.todayTasks.length;
    final habitsTotal = state.habitSlots.whereType<Habit>().length;
    final habitsDone =
        state.habits.where((h) => h.isCompletedToday()).length;
    final isFirstRun = state.todayTasks.isEmpty && state.habits.isEmpty;
    final hasLoaded = !state.isLoading;

    Widget child;
    if (!hasLoaded) {
      child = const _MyDayLoadingSkeleton();
    } else if (isFirstRun) {
      child = ListView(
        children: [
          _GreetingBar(
            greeting: _greeting(l10n),
            onSettings: () => context.push('/settings'),
          ),
          const SizedBox(height: 12),
          const FirstRunEmptyState(),
          const SizedBox(height: 80),
        ],
      );
    } else {
      child = ListView(
        padding: const EdgeInsets.only(bottom: 120),
        children: [
          FadeUp(
            child: _GreetingBar(
              greeting: _greeting(l10n),
              onSettings: () => context.push('/settings'),
            ),
          ),
          FadeUp(
            delay: const Duration(milliseconds: 60),
            child: TodayHeroStrip(
              tasksDone: completed,
              tasksTotal: total,
              taskCap: 5,
              habitsDone: habitsDone,
              habitsTotal: habitsTotal,
            ),
          ),
          if (state.error != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GlassCard(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline,
                        color: AppColors.error),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        state.error!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          ref.read(myDayProvider.notifier).refresh(),
                      child: Text(l10n.commonRetry),
                    ),
                  ],
                ),
              ),
            ),
          ],
          FadeUp(
            delay: const Duration(milliseconds: 90),
            child: _DailyIntentionCard(
              quote: IntentionQuotes.pick(
                seed: LocalDateHash.today,
              ),
            ),
          ),
          const FadeUp(
            delay: Duration(milliseconds: 120),
            child: StreakAtRiskBanner(),
          ),
          const FadeUp(
            delay: Duration(milliseconds: 150),
            child: LeftBehindBanner(),
          ),
          const SizedBox(height: 8),
          const FadeUp(
            delay: Duration(milliseconds: 180),
            child: TaskSection(),
          ),
          const SizedBox(height: 18),
          FadeUp(
            delay: const Duration(milliseconds: 240),
            child: _HabitHeader(
              total: habitsTotal,
              bestStreak: state.habits.isEmpty
                  ? 0
                  : state.habits
                      .map((h) => h.streakCount)
                      .reduce((a, b) => a > b ? a : b),
            ),
          ),
          const FadeUp(
            delay: Duration(milliseconds: 300),
            child: HabitRow(),
          ),
          const SizedBox(height: 24),
        ],
      );
    }

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AmbientBackground(
        child: SafeArea(
          bottom: false,
          child: RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () => ref.read(myDayProvider.notifier).refresh(),
            child: child,
          ),
        ),
      ),
      floatingActionButton: isFirstRun || !hasLoaded
          ? null
          : _AddSeedFab(
              onTap: () => showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.surface,
                builder: (_) => const AddTaskSheet(),
              ),
            ),
    );
  }
}

class _GreetingBar extends StatelessWidget {
  const _GreetingBar({
    required this.greeting,
    required this.onSettings,
  });

  final String greeting;
  final VoidCallback onSettings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 0),
      child: Row(
        children: [
          const GuardianMascot(
            size: 36,
            expression: GuardianExpression.happy,
            variant: GuardianMascotVariant.koalaBasic,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              greeting,
              style: theme.textTheme.titleLarge?.copyWith(
                color: AppColors.onSurface,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.4,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            color: AppColors.onSurfaceVariant,
            onPressed: onSettings,
            tooltip: AppLocalizations.of(context).commonSettingsTooltip,
          ),
        ],
      ),
    );
  }
}

class _DailyIntentionCard extends StatelessWidget {
  const _DailyIntentionCard({required this.quote});
  final ({String title, String body}) quote;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.20),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.18),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.format_quote_rounded,
                color: AppColors.primary,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quote.title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    quote.body,
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
      ),
    );
  }
}

class _HabitHeader extends StatelessWidget {
  const _HabitHeader({
    required this.total,
    required this.bestStreak,
  });

  final int total;
  final int bestStreak;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Row(
        children: [
          Text(
            l10n.habitsHeader,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(width: 8),
          if (total > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                l10n.habitsGrowing('$total'),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
              ),
            ),
          const Spacer(),
          if (total > 0)
            Row(
              children: [
                const Icon(
                  Icons.local_fire_department_rounded,
                  size: 12,
                  color: AppColors.secondary,
                ),
                const SizedBox(width: 3),
                Text(
                  l10n.habitsBestStreak('$bestStreak'),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                      ),
                ),
              ],
            ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}

class _AddSeedFab extends StatelessWidget {
  const _AddSeedFab({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FloatingActionButton(
        onPressed: onTap,
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.onSecondary,
        elevation: 2,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, size: 28),
      ),
    );
  }
}

/// Skeleton shown while the first My Day refresh is in flight. Avoids the
/// "blank then content pops in" jank by reserving the layout space
/// immediately.
class _MyDayLoadingSkeleton extends StatefulWidget {
  const _MyDayLoadingSkeleton();

  @override
  State<_MyDayLoadingSkeleton> createState() => _MyDayLoadingSkeletonState();
}

class _MyDayLoadingSkeletonState extends State<_MyDayLoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmer = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _shimmer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmer,
      builder: (_, __) {
        final t = _shimmer.value;
        Color bar(double opacity) =>
            AppColors.outlineVariant.withValues(alpha: opacity);
        final base = 0.18 + 0.18 * t;
        return ListView(
          padding: const EdgeInsets.only(bottom: 120),
          children: [
            _SkeletonBar(width: 220, height: 22, color: bar(base)),
            const SizedBox(height: 18),
            _SkeletonBar(width: double.infinity, height: 64, color: bar(base)),
            const SizedBox(height: 12),
            _SkeletonBar(width: double.infinity, height: 56, color: bar(base)),
            const SizedBox(height: 12),
            _SkeletonBar(width: double.infinity, height: 56, color: bar(base)),
            const SizedBox(height: 12),
            _SkeletonBar(width: double.infinity, height: 56, color: bar(base)),
            const SizedBox(height: 24),
            _SkeletonBar(width: 120, height: 18, color: bar(base)),
            const SizedBox(height: 12),
            _SkeletonBar(width: double.infinity, height: 64, color: bar(base)),
            const SizedBox(height: 10),
            _SkeletonBar(width: double.infinity, height: 64, color: bar(base)),
          ],
        );
      },
    );
  }
}

class _SkeletonBar extends StatelessWidget {
  const _SkeletonBar({
    required this.width,
    required this.height,
    required this.color,
  });
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: width.isFinite ? width : null,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
