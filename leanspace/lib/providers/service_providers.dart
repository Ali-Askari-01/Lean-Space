import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_client.dart';
import '../services/auth_service.dart';
import '../core/env.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final client = ApiClient(baseUrl: Env.apiBaseUrl);
  ref.onDispose(client.dispose);
  return client;
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.watch(apiClientProvider));
});
