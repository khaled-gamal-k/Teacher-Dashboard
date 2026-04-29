import 'package:supabase_flutter/supabase_flutter.dart';

import 'errors.dart';

import '../services/auth_service.dart';

class SupabaseAuthConfig extends AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  @override
  Future<void> forgetPassword({required String email, required String password}) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }
}
