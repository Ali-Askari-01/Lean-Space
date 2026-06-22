import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/deep_link_handlers.dart';
import '../../../core/onboarding/onboarding_store.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/widget_setup_sheet.dart';
import '../../onboarding/presentation/onboarding_screen.dart';
import '../../buddy/providers/buddy_providers.dart';
import '../providers/my_day_providers.dart';
import 'widgets/add_task_sheet.dart';
import 'widgets/habit_row.dart';
import 'widgets/left_behind_widgets.dart';
import 'widgets/task_section.dart';

class MyDayScreen extends ConsumerStatefulWidget {
  const MyDayScreen({super.key});

  @override
  ConsumerState<MyDayScreen> createState() => _MyDayScreenState();
}

class _MyDayScreenState extends ConsumerState<MyDayScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowOnboarding());
  }

  Future<void> _maybeShowOnboarding() async {
    if (!mounted) return;
    if (await OnboardingStore.isComplete()) return;
    if (!mounted) return;

    await Navigator.of(context).push<void>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => OnboardingScreen(
          onDone: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  String _midnightCountdown() {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day + 1);
    final diff = midnight.difference(now);
    final h = diff.inHours;
    final m = diff.inMinutes % 60;
    return '${h}h ${m.toString().padLeft(2, '0')}m left';
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(pendingAddTaskProvider, (prev, next) {
      if (next && context.mounted) {
        ref.read(pendingAddTaskProvider.notifier).state = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.mounted) return;
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.bgElev,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            builder: (_) => const AddTaskSheet(),
          );
        });
      }
    });

    ref.listen<bool>(pendingWidgetSetupProvider, (prev, next) {
      if (next && context.mounted) {
        ref.read(pendingWidgetSetupProvider.notifier).state = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) showWidgetSetupSheet(context);
        });
      }
    });

    final state = ref.watch(myDayProvider);
    final buddy = ref.watch(buddyProvider).valueOrNull;
    final theme = Theme.of(context);
    final completed = state.todayTasks.where((t) => t.isDone).length;
    final total = state.todayTasks.length;

    return Scaffold(
      body: AmbientBackground(
        child: SafeArea(
          child: RefreshIndicator(
            color: AppColors.accent,
            onRefresh: () => ref.read(myDayProvider.notifier).refresh(),
            child: state.isLoading &&
                    state.habits.isEmpty &&
                    state.todayTasks.isEmpty
                ? ListView(
                    children: const [
                      SizedBox(height: 200),
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.accent,
                        ),
                      ),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.only(bottom: 24),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 12, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'CURRENT STREAK',
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
                                        '${state.taskStreak}',
                                        style: theme.textTheme.displaySmall
                                            ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          height: 1,
                                          letterSpacing: -1,
                                        ),
                                      ),
                                      if (state.taskStreak > 0) ...[
                                        const SizedBox(width: 6),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            '🔥',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Five tasks. One chain. No mercy at midnight.',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                  if (buddy?.paired == true) ...[
                                    const SizedBox(height: 10),
                                    ActionChip(
                                      avatar: const Icon(
                                        Icons.people_outline,
                                        size: 18,
                                        color: AppColors.accent,
                                      ),
                                      label: Text(
                                        'Buddy chain: ${buddy!.sharedStreak}',
                                      ),
                                      onPressed: () => context.go('/our-space'),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.insights_outlined),
                              color: AppColors.textMuted,
                              tooltip: 'Your progress',
                              onPressed: () => context.push('/insights'),
                            ),
                            IconButton(
                              icon: const Icon(Icons.settings_outlined),
                              color: AppColors.textMuted,
                              onPressed: () => context.push('/settings'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.bgElev,
                                AppColors.bgElev.withValues(alpha: 0.2),
                              ],
                            ),
                            border: const Border(
                              left: BorderSide(
                                color: AppColors.accent,
                                width: 2,
                              ),
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Until midnight reset',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppColors.textMuted,
                                ),
                              ),
                              Text(
                                _midnightCountdown(),
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (state.error != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: MaterialBanner(
                            backgroundColor:
                                AppColors.danger.withValues(alpha: 0.1),
                            content: Text(state.error!),
                            actions: [
                              TextButton(
                                onPressed: () => ref
                                    .read(myDayProvider.notifier)
                                    .refresh(),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      LeftBehindBanner(
                        onTap: () => showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: AppColors.bgElev,
                          builder: (_) => const LeftBehindSheet(),
                        ),
                      ),
                      const SectionLabel('Daily habits'),
                      const HabitRow(),
                      const SectionLabel("Today's chain"),
                      const TaskSection(),
                      const SizedBox(height: 8),
                      CapacityPips(
                        filled: completed,
                        total: 5,
                        label: total > 0
                            ? '$completed of $total done'
                            : '0 of 5 slots used',
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
