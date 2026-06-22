import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/auth_constants.dart';
import '../../../core/auth_errors.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/ambient_background.dart';

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
  bool _loading = false;
  String? _error;
  String? _info;

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
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateInputs() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty) return 'Enter your email';
    if (!email.contains('@')) return 'Enter a valid email address';
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _submitEmail() async {
    final validation = _validateInputs();
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
      final client = Supabase.instance.client;

      if (_isSignUp) {
        final response = await client.auth.signUp(
          email: email,
          password: password,
        );

        if (!mounted) return;

        if (response.session != null) {
          context.go('/my-day');
          return;
        }

        setState(() {
          _info =
              'Account created. Switch to Sign In and use your password.';
          _passwordController.clear();
        });
        _tabController.animateTo(0);
        return;
      }

      await client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (mounted) context.go('/my-day');
    } on AuthException catch (e) {
      setState(() => _error = friendlyAuthError(e.message));
    } catch (e) {
      setState(() => _error = 'Something went wrong. Try again.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _loading = true;
      _error = null;
      _info = null;
    });

    try {
      await Supabase.instance.client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: authRedirectUri,
        authScreenLaunchMode: LaunchMode.externalApplication,
      );
    } on AuthException catch (e) {
      setState(() => _error = friendlyAuthError(e.message));
    } catch (e) {
      setState(() => _error = 'Could not start Google sign-in.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: AmbientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BrandMark(),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LEANSPACE',
                        style: theme.textTheme.labelLarge?.copyWith(
                          letterSpacing: 3,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Don't break the chain",
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                _isSignUp ? 'Create your account.' : 'Welcome back.',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _isSignUp
                    ? 'Five tasks. Daily habits. No excuses.'
                    : 'Your streak is waiting.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 28),
              TabBar(
                controller: _tabController,
                onTap: (_) => setState(() {}),
                tabs: const [
                  Tab(text: 'Sign In'),
                  Tab(text: 'Sign Up'),
                ],
              ),
              const SizedBox(height: 24),
              Text('EMAIL', style: theme.inputDecorationTheme.labelStyle),
              const SizedBox(height: 6),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: AppColors.text),
                decoration: const InputDecoration(
                  hintText: 'you@email.com',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Text('PASSWORD', style: theme.inputDecorationTheme.labelStyle),
              const SizedBox(height: 6),
              TextField(
                controller: _passwordController,
                obscureText: true,
                autofillHints: const [AutofillHints.password],
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submitEmail(),
                style: const TextStyle(color: AppColors.text),
                decoration: const InputDecoration(
                  hintText: '••••••••',
                  border: OutlineInputBorder(),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.danger.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.danger.withValues(alpha: 0.35),
                    ),
                  ),
                  child: Text(
                    _error!,
                    style: const TextStyle(
                      color: AppColors.danger,
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
                    color: AppColors.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.accent.withValues(alpha: 0.35),
                    ),
                  ),
                  child: Text(
                    _info!,
                    style: const TextStyle(
                      color: AppColors.accentSoft,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _loading ? null : _submitEmail,
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(_isSignUp ? 'Create account' : 'Sign in'),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'or continue with',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.textFaint,
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
                    const Text('Continue with Google'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'By signing in, you accept that your day resets at midnight.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.textFaint,
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

class _BrandMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.accent, AppColors.accentDeep],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Icon(Icons.link_rounded, color: Colors.white, size: 26),
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
