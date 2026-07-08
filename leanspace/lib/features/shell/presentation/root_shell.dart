import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/growth_widgets.dart';

class RootShell extends StatelessWidget {
  const RootShell({super.key, required this.child});

  final Widget child;

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/progress')) return 1;
    if (location.startsWith('/you')) return 2;
    return 0;
  }

  void _onSelect(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/my-day');
      case 1:
        context.go('/progress');
      case 2:
        context.go('/you');
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = _selectedIndex(context);
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(
            top: BorderSide(color: AppColors.outlineVariant, width: 0.5),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                _NavItem(
                  icon: Icons.eco_outlined,
                  activeIcon: Icons.eco_rounded,
                  label: l10n.tabToday,
                  selected: selected == 0,
                  onTap: () => _onSelect(context, 0),
                ),
                _NavItem(
                  icon: Icons.insights_outlined,
                  activeIcon: Icons.insights_rounded,
                  label: l10n.tabProgress,
                  selected: selected == 1,
                  onTap: () => _onSelect(context, 1),
                ),
                _NavItem(
                  icon: Icons.person_outline_rounded,
                  activeIcon: Icons.person_rounded,
                  label: l10n.tabYou,
                  selected: selected == 2,
                  onTap: () => _onSelect(context, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? AppColors.primaryContainer.withValues(alpha: 0.35)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selected ? activeIcon : icon,
                color: selected
                    ? AppColors.primary
                    : AppColors.onSurfaceVariant,
                size: 22,
              ),
              const SizedBox(height: 4),
              BlueprintLabel(
                label,
                color: selected
                    ? AppColors.primary
                    : AppColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
