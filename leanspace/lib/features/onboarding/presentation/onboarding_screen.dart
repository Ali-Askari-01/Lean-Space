import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/app_localizations.dart';
import '../../../core/l10n/locale_resolution.dart';
import '../../../core/onboarding/onboarding_store.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../../core/widgets/guardian_mascot.dart';
import '../../../core/widgets/language_picker_sheet.dart';
import '../../../core/widgets/locale_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key, required this.onDone});

  final VoidCallback onDone;

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;
  Locale? _selectedLanguage;

  static const _storyPages = <_OnboardingPage>[
    _OnboardingPage(
      titleKey: 'p1Title',
      bodyKey: 'p1Body',
      showMascot: true,
    ),
    _OnboardingPage(
      icon: Icons.water_drop_rounded,
      titleKey: 'p2Title',
      bodyKey: 'p2Body',
    ),
    _OnboardingPage(
      icon: Icons.eco_rounded,
      titleKey: 'p3Title',
      bodyKey: 'p3Body',
    ),
    _OnboardingPage(
      icon: Icons.local_fire_department_rounded,
      titleKey: 'p4Title',
      bodyKey: 'p4Body',
    ),
  ];

  int get _totalPages => 1 + _storyPages.length;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _seedLanguage());
  }

  void _seedLanguage() {
    final saved = ref.read(localeProvider);
    if (saved != null) {
      setState(() => _selectedLanguage = saved);
      return;
    }
    final device = WidgetsBinding.instance.platformDispatcher.locale;
    final resolved = resolveAppLocale(null, device);
    setState(() => _selectedLanguage = resolved);
  }

  ({String title, String body}) _resolve(
    AppLocalizations l10n,
    String titleKey,
    String bodyKey,
  ) {
    switch (titleKey) {
      case 'p1Title':
        return (
          title: l10n.onboardingPage1Title,
          body: l10n.onboardingPage1Body,
        );
      case 'p2Title':
        return (
          title: l10n.onboardingPage2Title,
          body: l10n.onboardingPage2Body,
        );
      case 'p3Title':
        return (
          title: l10n.onboardingPage3Title,
          body: l10n.onboardingPage3Body,
        );
      case 'p4Title':
        return (
          title: l10n.onboardingPage4Title,
          body: l10n.onboardingPage4Body,
        );
      default:
        return (title: '', body: '');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await ref.read(onboardingGateProvider.notifier).markComplete();
    if (!mounted) return;
    widget.onDone();
  }

  Future<void> _persistLanguage(Locale locale) async {
    setState(() => _selectedLanguage = locale);
    await ref.read(localeProvider.notifier).set(locale);
  }

  void _next() {
    if (_page == 0) {
      final locale = _selectedLanguage;
      if (locale != null) {
        ref.read(localeProvider.notifier).set(locale);
      }
    }
    if (_page < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
      );
    } else {
      _finish();
    }
  }

  void _skip() {
    if (_page == 0) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
      );
      return;
    }
    _finish();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isLast = _page == _totalPages - 1;
    final isLanguagePage = _page == 0;

    return Material(
      color: AppColors.surface,
      child: AmbientBackground(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _skip,
                  child: BlueprintLabel(
                    l10n.onboardingSkip,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _totalPages,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _OnboardingLanguagePage(
                        selected: _selectedLanguage,
                        onSelected: _persistLanguage,
                      );
                    }
                    final p = _storyPages[index - 1];
                    final resolved = _resolve(l10n, p.titleKey, p.bodyKey);
                    return _OnboardingPageView(
                      key: ValueKey(index),
                      title: resolved.title,
                      body: resolved.body,
                      icon: p.icon,
                      showMascot: p.showMascot,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Semantics(
                label: 'Page ${_page + 1} of $_totalPages',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _totalPages,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: i == _page ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: i == _page
                            ? AppColors.primary
                            : AppColors.outlineVariant,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (!isLanguagePage)
                BlueprintLabel(
                  _page == 1
                      ? l10n.onboardingIntroduction
                      : l10n.onboardingGrowYourForest,
                  color: AppColors.onSurfaceVariant,
                ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: CtaPill(
                  label: isLanguagePage
                      ? l10n.onboardingLanguageContinue
                      : isLast
                          ? l10n.onboardingEnterSanctuary
                          : l10n.onboardingNext,
                  icon: Icons.arrow_forward_rounded,
                  onPressed: _selectedLanguage == null && isLanguagePage
                      ? null
                      : _next,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingLanguagePage extends StatelessWidget {
  const _OnboardingLanguagePage({
    required this.selected,
    required this.onSelected,
  });

  final Locale? selected;
  final ValueChanged<Locale> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
          child: Column(
            children: [
              Text(
                l10n.onboardingLanguageTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.onboardingLanguageBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: OnboardingLanguagePicker(
            selected: selected,
            onSelected: onSelected,
          ),
        ),
      ],
    );
  }
}

class _OnboardingPage {
  const _OnboardingPage({
    required this.titleKey,
    required this.bodyKey,
    this.icon,
    this.showMascot = false,
  });

  final String titleKey;
  final String bodyKey;
  final IconData? icon;
  final bool showMascot;
}

class _OnboardingPageView extends StatefulWidget {
  const _OnboardingPageView({
    super.key,
    required this.title,
    required this.body,
    this.icon,
    this.showMascot = false,
  });
  final String title;
  final String body;
  final IconData? icon;
  final bool showMascot;

  @override
  State<_OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<_OnboardingPageView>
    with TickerProviderStateMixin {
  late final AnimationController _mascotCtrl;
  late final Animation<double> _mascotFloat;
  late final Animation<double> _haloPulse;
  late final AnimationController _iconPopCtrl;
  late final Animation<double> _iconPop;
  late final AnimationController _titleSlideCtrl;
  late final Animation<double> _titleSlide;
  late final AnimationController _bodyFadeCtrl;
  late final Animation<double> _bodyFade;

  @override
  void initState() {
    super.initState();
    _mascotCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat(reverse: true);

    _mascotFloat = Tween<double>(begin: -6, end: 6).animate(
      CurvedAnimation(parent: _mascotCtrl, curve: Curves.easeInOut),
    );
    _haloPulse = Tween<double>(begin: 0.92, end: 1.08).animate(
      CurvedAnimation(parent: _mascotCtrl, curve: Curves.easeInOut),
    );

    _iconPopCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    _iconPop = CurvedAnimation(
      parent: _iconPopCtrl,
      curve: Curves.elasticOut,
    );

    _titleSlideCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    _titleSlide = CurvedAnimation(
      parent: _titleSlideCtrl,
      curve: Curves.easeOutCubic,
    );

    _bodyFadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
    _bodyFade = CurvedAnimation(
      parent: _bodyFadeCtrl,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _mascotCtrl.dispose();
    _iconPopCtrl.dispose();
    _titleSlideCtrl.dispose();
    _bodyFadeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _mascotCtrl,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, widget.showMascot ? _mascotFloat.value : 0),
                child: child,
              );
            },
            child: ScaleTransition(
              scale: _iconPop,
              child: widget.showMascot
                  ? ScaleTransition(
                      scale: _haloPulse,
                      child: const GuardianMascot(
                        size: 220,
                        expression: GuardianExpression.happy,
                        withHalo: true,
                        variant: GuardianMascotVariant.potStitch,
                      ),
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer
                            .withValues(alpha: 0.25),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.icon,
                        color: AppColors.primary,
                        size: 48,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 28),
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            ).animate(_titleSlide),
            child: FadeTransition(
              opacity: _titleSlide,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.displaySmall?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6,
                  height: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FadeTransition(
            opacity: _bodyFade,
            child: Text(
              widget.body,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.onSurfaceVariant,
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
