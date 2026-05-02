import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_errors.dart';


class SupabaseAuthConfig {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  Future<void> forgetPassword({required String email, required String password}) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }

  Future<void> logOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      throw SupaFailure.fromException(e);
    }
  }
}
