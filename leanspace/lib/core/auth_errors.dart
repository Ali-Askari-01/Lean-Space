/// Maps auth API errors to clearer copy for the UI.
String friendlyAuthError(String message) {
  final m = message.toLowerCase();

  if (m.contains('rate limit') || m.contains('over_email_send_rate_limit')) {
    return 'Too many sign-up emails were sent. Wait a few minutes and try again.';
  }
  if (m.contains('already registered') ||
      m.contains('user already registered') ||
      m.contains('already exists') ||
      m.contains('email_already_exists')) {
    return 'This email already has an account. Switch to Sign In.';
  }
  if (m.contains('invalid login credentials') ||
      m.contains('invalid email or password') ||
      m.contains('invalid_credentials')) {
    return 'Wrong email or password.';
  }
  if (m.contains('email not confirmed')) {
    return 'Confirm your email first (check inbox/spam), then sign in.';
  }
  if (m.contains('password') && m.contains('least')) {
    return 'Password must be at least 8 characters.';
  }
  if (m.contains('password_too_short')) {
    return 'Password must be at least 8 characters.';
  }
  if (m.contains('use_google_signin')) {
    return 'This account uses Google Sign-In. Tap "Continue with Google" instead.';
  }
  if (m.contains('invalid_google_token') || m.contains('unauthorized')) {
    return 'Google sign-in failed. Make sure you selected the correct account and try again.';
  }
  if (m.contains('google_auth_failed')) {
    return 'Google sign-in failed. Please try again.';
  }
  if (m.contains('cancelled')) {
    return 'Sign-in was cancelled.';
  }
  if (m.contains('no_id_token')) {
    return 'Could not get Google credentials. Try again.';
  }

  return message;
}
