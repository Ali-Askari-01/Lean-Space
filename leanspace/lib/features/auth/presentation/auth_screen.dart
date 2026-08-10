import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/auth_errors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';
import '../../../core/widgets/growth_widgets.dart';
import '../../../core/widgets/guardian_mascot.dart';
import '../../../providers/service_providers.dart';
import '../../referral/data/referral_store.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _referralController = TextEditingController();
  bool _loading = false;
  String? _error;
  String? _info;
  int _attempts = 0;
  DateTime? _lockedUntil;

  bool get _isSignUp => _tabController.index == 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _error = null;
          _info = null;
        });
      }
    });
    ReferralStore.readPending().then((code) {
      if (!mounted || code == null || code.isEmpty) return;
      _referralController.text = code;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  Future<void> _stashReferralCode() async {
    final code = _referralController.text.trim();
    if (code.isEmpty) {
      await ReferralStore.clearPending();
      return;
    }
    await ReferralStore.savePending(code);
  }

  String? _validateInputs(AppLocalizations l10n) {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty) return l10n.authEnterEmail;
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) return l10n.authEnterValidEmail;
    if (password.length < 8) {
      return l10n.authPasswordTooShort;
    }
    return null;
  }

  Future<void> _submitEmail() async {
    final l10n = AppLocalizations.of(context);
    final authService = ref.read(authServiceProvider);

    if (_lockedUntil != null && DateTime.now().isBefore(_lockedUntil!)) {
      final seconds = _lockedUntil!.difference(DateTime.now()).inSeconds + 1;
      setState(() => _error = 'Too many attempts. Try again in ${seconds}s.');
      return;
    }

    final validation = _validateInputs(l10n);
    if (validation != null) {
      setState(() {
        _error = validation;
        _info = null;
      });
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
      _info = null;
    });

    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      if (_isSignUp) {
        await _stashReferralCode();
        final referralCode = _referralController.text.trim();
        
        await authService.signUpWithEmail(
          email: email,
          password: password,
          referralCode: referralCode.isNotEmpty ? referralCode : null,
        );

        if (!mounted) return;
        context.go('/my-day');
      } else {
        await authService.signInWithEmail(
          email: email,
          password: password,
        );

        if (mounted) context.go('/my-day');
        _attempts = 0;
      }
    } on Exception catch (e) {
      setState(() => _error = friendlyAuthError(e.toString()));
      _attempts++;
      if (_attempts >= 5) {
        _lockedUntil = DateTime.now().add(const Duration(seconds: 30));
        _attempts = 0;
      }
    } catch (e) {
      setState(() => _error = l10n.authSomethingWentWrong);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    final l10n = AppLocalizations.of(context);
    final authService = ref.read(authServiceProvider);
    
    setState(() {
      _loading = true;
      _error = null;
      _info = null;
    });

    try {
      await _stashReferralCode();
      final referralCode = _referralController.text.trim();
      
      await authService.signInWithGoogle(
        referralCode: referralCode.isNotEmpty ? referralCode : null,
      );
      
      if (mounted) context.go('/my-day');
    } on Exception catch (e) {
      setState(() => _error = friendlyAuthError(e.toString()));
    } catch (e) {
      setState(() => _error = l10n.authCouldNotStartGoogle);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: AmbientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    l10n.authBrand,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: AppColors.primary,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          blurRadius: 28,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        width: 1.4,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: const GuardianMascot(
                      size: 160,
                      expression: GuardianExpression.happy,
                      variant: GuardianMascotVariant.potStitch,
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  _isSignUp ? l10n.authPlantFirstSeed : l10n.authWelcomeBack,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _isSignUp
                      ? l10n.authFiveTasksDaily
                      : l10n.authSanctuaryWaiting,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: AppColors.outlineVariant),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    onTap: (_) => setState(() {}),
                    indicator: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelColor: AppColors.onPrimary,
                    unselectedLabelColor: AppColors.onSurfaceVariant,
                    labelStyle: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: [
                      Tab(text: l10n.authSignIn),
                      Tab(text: l10n.authSignUp),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                BlueprintLabel(l10n.authEmail, color: AppColors.onSurfaceVariant),
                const SizedBox(height: 6),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: l10n.authEmailHint,
                  ),
                ),
                const SizedBox(height: 16),
                BlueprintLabel(
                    l10n.authPassword, color: AppColors.onSurfaceVariant),
                const SizedBox(height: 6),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submitEmail(),
                  decoration: const InputDecoration(
                    hintText: '••••••••',
                  ),
                ),
                if (_isSignUp) ...[
                  const SizedBox(height: 16),
                  BlueprintLabel(
                    l10n.authReferralCodeLabel,
                    color: AppColors.onSurfaceVariant,
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: _referralController,
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: l10n.authReferralCodeHint,
                    ),
                  ),
                ],
                if (_error != null) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.error.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Text(
                      _error!,
                      style: TextStyle(
                        color: AppColors.error,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
                if (_info != null) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Text(
                      _info!,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                CtaPill(
                  label: _isSignUp ? l10n.authCreateAccount : l10n.authSignInCta,
                  icon: _isSignUp ? Icons.eco_rounded : Icons.login_rounded,
                  onPressed: _loading ? null : _submitEmail,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        l10n.authOrContinueWith,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: _loading ? null : _signInWithGoogle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _GoogleGlyph(),
                      const SizedBox(width: 10),
                      Text(l10n.authContinueWithGoogle),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  l10n.authMidnightReset,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GoogleGlyph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: CustomPaint(painter: _GooglePainter()),
    );
  }
}

class _GooglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / 2;
    final center = Offset(r, r);
    const stroke = 3.0;

    void arc(Color color, double start, double sweep) {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: r - stroke),
        start,
        sweep,
        false,
        paint,
      );
    }

    arc(const Color(0xFFEA4335), -0.4, 1.2);
    arc(const Color(0xFFFBBC05), 0.8, 1.1);
    arc(const Color(0xFF34A853), 1.9, 1.1);
    arc(const Color(0xFF4285F4), 3.0, 1.1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
