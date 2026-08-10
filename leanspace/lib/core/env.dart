import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Env {
  static String get apiBaseUrl =>
      _fromDefine('API_BASE_URL') ??
      _fromDotenv('API_BASE_URL') ??
      '';

  static String get googleClientId =>
      _fromDefine('GOOGLE_CLIENT_ID') ??
      _fromDotenv('GOOGLE_CLIENT_ID') ??
      '';

  static bool get isConfigured {
    final url = apiBaseUrl;
    return url.isNotEmpty && !url.contains('your-worker');
  }

  static String get configProblem {
    if (apiBaseUrl.isEmpty) {
      return 'API_BASE_URL missing — rebuild with: flutter build apk --debug --dart-define=API_BASE_URL=https://daily-stitch-api.your-subdomain.workers.dev';
    }
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
