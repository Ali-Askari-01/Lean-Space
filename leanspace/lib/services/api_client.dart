import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({required this.baseUrl});

  final String baseUrl;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  String? _sessionToken;
  Map<String, dynamic>? _currentUser;

  static const _tokenKey = 'daily_stitch_session_token';

  final StreamController<AuthEvent> _authController =
      StreamController<AuthEvent>.broadcast();
  Stream<AuthEvent> get onAuthStateChange => _authController.stream;

  Future<void> init() async {
    _sessionToken = await _storage.read(key: _tokenKey);
    if (_sessionToken != null) {
      try {
        _currentUser = await get('/api/auth/me');
      } catch (_) {
        _sessionToken = null;
        await _storage.delete(key: _tokenKey);
      }
    }
  }

  bool get isAuthenticated => _sessionToken != null;
  Map<String, dynamic>? get currentUser => _currentUser;
  String? get currentUserId => _currentUser?['id'] as String?;
  String? get currentUserEmail => _currentUser?['email'] as String?;

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        if (_sessionToken != null) 'Authorization': 'Bearer $_sessionToken',
      };

  Future<Map<String, dynamic>?> _request(
    String method,
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('$baseUrl$path');
    final client = http.Client();

    try {
      final request = http.Request(method, uri)
        ..headers.addAll(_headers);

      if (body != null) {
        request.body = jsonEncode(body);
      }

      final streamedResponse = await client.send(request);
      final responseBody = await streamedResponse.stream.bytesToString();

      if (streamedResponse.statusCode == 401) {
        await signOut();
        throw ApiException('unauthorized', 401);
      }

      if (streamedResponse.statusCode >= 400) {
        final error = jsonDecode(responseBody);
        throw ApiException(
            error['error'] ?? error['message'] ?? 'unknown',
            streamedResponse.statusCode);
      }

      return responseBody.isNotEmpty
          ? jsonDecode(responseBody) as Map<String, dynamic>
          : null;
    } finally {
      client.close();
    }
  }

  Future<Map<String, dynamic>> get(String path) async {
    final response = await _request('GET', path);
    return response ?? {};
  }

  Future<Map<String, dynamic>> post(String path,
      [Map<String, dynamic>? body]) async {
    final response = await _request('POST', path, body: body);
    return response ?? {};
  }

  Future<Map<String, dynamic>> put(String path,
      [Map<String, dynamic>? body]) async {
    final response = await _request('PUT', path, body: body);
    return response ?? {};
  }

  Future<Map<String, dynamic>> delete(String path) async {
    final response = await _request('DELETE', path);
    return response ?? {};
  }

  Future<void> setSessionToken(String token) async {
    _sessionToken = token;
    await _storage.write(key: _tokenKey, value: token);
    _currentUser = await get('/api/auth/me');
    _authController.add(AuthEvent.signedIn);
  }

  Future<void> signOut() async {
    try {
      await post('/api/auth/signout');
    } catch (_) {}
    _sessionToken = null;
    _currentUser = null;
    await _storage.delete(key: _tokenKey);
    _authController.add(AuthEvent.signedOut);
  }

  void dispose() {
    _authController.close();
  }
}

enum AuthEvent { signedIn, signedOut }

class ApiException implements Exception {
  ApiException(this.message, this.statusCode);
  final String message;
  final int statusCode;

  @override
  String toString() => message;
}
