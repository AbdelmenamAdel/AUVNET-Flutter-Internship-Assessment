import 'package:auvnet_internship_task/core/database/remote/supabase_config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  Future<AuthResponse> signUp(String email, String password) async {
    final res = await SupabaseConfig.client.auth.signUp(
      email: email,
      password: password,
    );
    if (res.user == null) throw Exception('SignUp Failed');
    return res;
  }

  Future<AuthResponse> login(String email, String password) async {
    final res = await SupabaseConfig.client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (res.user == null) throw Exception('Login Failed');
    return res;
  }

  Future<void> logout() async {
    await SupabaseConfig.client.auth.signOut();
  }

  Stream<bool> get authStateChanges => SupabaseConfig
      .client
      .auth
      .onAuthStateChange
      .map((event) => event.session != null);
}
