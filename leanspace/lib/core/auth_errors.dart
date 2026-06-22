/// Maps Supabase Auth API errors to clearer copy for the UI.
String friendlyAuthError(String message) {
  final m = message.toLowerCase();

  if (m.contains('rate limit') || m.contains('over_email_send_rate_limit')) {
    return 'Too many sign-up emails were sent. Wait about an hour, use '
        'Continue with Google, or in Supabase disable "Confirm email" '
        '(Auth → Providers → Email).';
  }
  if (m.contains('already registered') ||
      m.contains('user already registered') ||
      m.contains('already exists')) {
    return 'This email already has an account. Switch to Sign In.';
  }
  if (m.contains('invalid login credentials') ||
      m.contains('invalid email or password')) {
    return 'Wrong email or password.';
  }
  if (m.contains('email not confirmed')) {
    return 'Confirm your email first (check inbox/spam), then sign in.';
  }
  if (m.contains('password') && m.contains('least')) {
    return 'Password must be at least 6 characters.';
  }

  return message;
}
