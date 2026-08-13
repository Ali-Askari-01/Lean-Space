import 'package:google_sign_in/google_sign_in.dart';
import '../core/env.dart';
import 'api_client.dart';

class AuthService {
  AuthService(this._api);

  final ApiClient _api;
  
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: Env.googleClientId,
    scopes: ['email', 'profile'],
  );

  Future<Map<String, dynamic>> signInWithGoogle({String? referralCode}) async {
    final account = await _googleSignIn.signIn();
    if (account == null) {
      throw AuthException('cancelled');
    }

    final auth = await account.authentication;
    final idToken = auth.idToken;
    
    if (idToken == null) {
      throw AuthException('no_id_token');
    }

    final response = await _api.post('/api/auth/google', {
      'id_token': idToken,
      if (referralCode != null && referralCode.isNotEmpty) 'referral_code': referralCode,
    });

    await _api.setSessionToken(response['session_token'] as String);
    return response;
  }

  Future<Map<String, dynamic>> signUpWithEmail({
    required String email,
    required String password,
    String? referralCode,
  }) async {
    final response = await _api.post('/api/auth/signup', {
      'email': email,
      'password': password,
      if (referralCode != null && referralCode.isNotEmpty) 'referral_code': referralCode,
    });

    await _api.setSessionToken(response['session_token'] as String);
    return response;
  }

  Future<Map<String, dynamic>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await _api.post('/api/auth/signin', {
      'email': email,
      'password': password,
    });

    await _api.setSessionToken(response['session_token'] as String);
    return response;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _api.signOut();
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    return await _api.get('/api/auth/me');
  }
}

class AuthException implements Exception {
  AuthException(this.message);
  final String message;
  
  @override
  String toString() => message;
}
