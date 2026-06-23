import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../data/buddy_repository.dart';
import '../providers/buddy_providers.dart';

class BuddyScreen extends ConsumerStatefulWidget {
  const BuddyScreen({super.key});

  @override
  ConsumerState<BuddyScreen> createState() => _BuddyScreenState();
}

class _BuddyScreenState extends ConsumerState<BuddyScreen> {
  final _codeController = TextEditingController();
  String? _message;
  bool _busy = false;
  ProviderSubscription<String?>? _buddyInviteSub;

  @override
  void initState() {
    super.initState();
    _buddyInviteSub =
        ref.listenManual<String?>(pendingBuddyInviteProvider, (prev, next) {
      if (next == null || !mounted) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        _codeController.text = next;
        ref.read(pendingBuddyInviteProvider.notifier).state = null;
        _accept();
      });
    });
  }

  @override
  void dispose() {
    _buddyInviteSub?.close();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _invite() async {
    setState(() {
      _busy = true;
      _message = null;
    });
    try {
      final code = await ref.read(buddyProvider.notifier).createInvite();
      if (code == null) {
        setState(() => _message = 'You are already paired.');
        return;
      }
      final link = 'leanspace://buddy/join?code=$code';
      await SharePlus.instance.share(
        ShareParams(
          text: 'Join me on LeanSpace as my accountability buddy. One shared chain.\n\n$link',
          subject: 'LeanSpace buddy invite',
        ),
      );
    } catch (_) {
      setState(() => _message = 'Could not create invite. Try again.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _accept() async {
    final code = _codeController.text.trim();
    if (code.isEmpty) {
      setState(() => _message = 'Paste an invite code.');
      return;
    }
    setState(() {
      _busy = true;
      _message = null;
    });
    final error = await ref.read(buddyProvider.notifier).acceptInvite(code);
    if (!mounted) return;
    setState(() {
      _busy = false;
      _message = error;
      if (error == null) _codeController.clear();
    });
  }

  Future<void> _unpair() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Unpair buddy?'),
        content: const Text(
          'Your shared streak will reset. You can pair again later.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Unpair')),
        ],
      ),
    );
    if (confirm != true || !mounted) return;
    final error = await ref.read(buddyProvider.notifier).unpair();
    if (mounted && error != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    }
  }

  Future<void> _nudge() async {
    final error = await ref.read(buddyProvider.notifier).sendNudge();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error ?? 'Nudge sent.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buddyAsync = ref.watch(buddyProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: AmbientBackground(
        child: SafeArea(
          child: buddyAsync.when(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.accent),
            ),
            error: (error, _) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Could not load buddy status.'),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () => ref.read(buddyProvider.notifier).refresh(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
            data: (buddy) => RefreshIndicator(
              color: AppColors.accent,
              onRefresh: () => ref.read(buddyProvider.notifier).refresh(),
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Text(
                    'ACCOUNTABILITY BUDDY',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.textFaint,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    buddy.paired
                        ? 'Buddy chain: ${buddy.sharedStreak}'
                        : 'One friend.\nOne shared streak.',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (buddy.paired) ...[
                    _StatusCard(buddy: buddy),
                    const SizedBox(height: 16),
                    if (buddy.buddyMissedYesterday && !buddy.buddyPerfectYesterday)
                      OutlinedButton.icon(
                        onPressed: _nudge,
                        icon: const Icon(Icons.notifications_active_outlined),
                        label: Text('Nudge ${buddy.buddyDisplayName}'),
                      ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: _unpair,
                      child: const Text(
                        'Unpair buddy',
                        style: TextStyle(color: AppColors.danger),
                      ),
                    ),
                  ] else ...[
                    Text(
                      'When you both complete your daily chain, your shared '
                      'streak grows. Miss a day and you both feel it.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textMuted,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 28),
                    FilledButton.icon(
                      onPressed: _busy ? null : _invite,
                      icon: _busy
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.link),
                      label: const Text('Invite a buddy'),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Have a code?',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _codeController,
                      decoration: const InputDecoration(
                        hintText: 'Paste invite code',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton(
                      onPressed: _busy ? null : _accept,
                      child: const Text('Join buddy'),
                    ),
                  ],
                  if (_message != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      _message!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.accentSoft,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({required this.buddy});

  final BuddyState buddy;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            buddy.buddyDisplayName,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _RowStatus(
            label: 'You yesterday',
            ok: buddy.youPerfectYesterday,
          ),
          const SizedBox(height: 8),
          _RowStatus(
            label: '${buddy.buddyDisplayName} yesterday',
            ok: buddy.buddyPerfectYesterday,
          ),
          const SizedBox(height: 12),
          Text(
            'Shared streak only grows when you both complete your chain.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _RowStatus extends StatelessWidget {
  const _RowStatus({required this.label, required this.ok});

  final String label;
  final bool ok;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          ok ? Icons.check_circle : Icons.radio_button_unchecked,
          size: 18,
          color: ok ? AppColors.accent : AppColors.textFaint,
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
