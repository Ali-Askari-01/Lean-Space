import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Env {
  static String get supabaseUrl =>
      _fromDefine('SUPABASE_URL') ??
      _fromDotenv('SUPABASE_URL') ??
      '';

  /// New Supabase publishable key (`sb_publishable_...`) or legacy JWT anon key.
  static String get supabaseKey {
    final publishable =
        _fromDefine('SUPABASE_PUBLISHABLE_KEY') ??
            _fromDotenv('SUPABASE_PUBLISHABLE_KEY');
    if (publishable != null && publishable.isNotEmpty) return publishable;
    return _fromDefine('SUPABASE_ANON_KEY') ??
        _fromDotenv('SUPABASE_ANON_KEY') ??
        '';
  }

  static bool get isConfigured {
    final url = supabaseUrl;
    final key = supabaseKey;
    return url.isNotEmpty &&
        key.isNotEmpty &&
        !url.contains('your-project-ref') &&
        !key.contains('your-anon-key') &&
        !key.startsWith('sb_publishable_YOUR') &&
        !key.startsWith('sb_publishable_xxx');
  }

  /// Human-readable hint when [isConfigured] is false (no secrets).
  static String get configProblem {
    if (supabaseUrl.isEmpty) {
      return 'SUPABASE_URL missing — rebuild with: flutter build apk --debug --dart-define-from-file=env.json';
    }
    if (supabaseKey.isEmpty) {
      return 'Supabase key missing — add SUPABASE_PUBLISHABLE_KEY to env.json and rebuild';
    }
    if (!isConfigured) return 'Supabase values still look like placeholders';
    return '';
  }

  static String? _fromDefine(String name) {
    final value = String.fromEnvironment(name);
    return value.isNotEmpty ? value.trim() : null;
  }

  static String? _fromDotenv(String name) {
    final value = dotenv.env[name]?.trim();
    return (value != null && value.isNotEmpty) ? value : null;
  }
}
