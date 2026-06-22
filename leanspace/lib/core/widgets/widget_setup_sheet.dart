import 'package:flutter/material.dart';

import '../app_actions.dart';
import '../theme/app_colors.dart';

/// Shown when the user taps "Add widget" from settings or the app shortcut.
class WidgetSetupSheet extends StatefulWidget {
  const WidgetSetupSheet({super.key});

  @override
  State<WidgetSetupSheet> createState() => _WidgetSetupSheetState();
}

class _WidgetSetupSheetState extends State<WidgetSetupSheet> {
  bool _pinning = false;
  String? _message;

  Future<void> _tryPin() async {
    setState(() {
      _pinning = true;
      _message = null;
    });
    final pinned = await AppActions.requestPinWidget();
    if (!mounted) return;
    setState(() {
      _pinning = false;
      _message = pinned
          ? 'Check your home screen to place the widget.'
          : 'Your launcher may not support one-tap add. Use manual steps below.';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottom = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(24, 16, 24, 24 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderStrong,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Add chain widget',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Keep your streak on your home screen — no need to open the app.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _pinning ? null : _tryPin,
            icon: _pinning
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.widgets_outlined),
            label: const Text('Add to home screen'),
          ),
          const SizedBox(height: 16),
          _Step(number: '1', text: 'Long-press your home screen'),
          _Step(number: '2', text: 'Tap Widgets'),
          _Step(number: '3', text: 'Find LeanSpace Chain and drag it on'),
          if (_message != null) ...[
            const SizedBox(height: 12),
            Text(
              _message!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.accentSoft,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              number,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

void showWidgetSetupSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.bgElev,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
    ),
    builder: (_) => const WidgetSetupSheet(),
  );
}
