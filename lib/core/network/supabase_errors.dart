import 'package:supabase_flutter/supabase_flutter.dart';

/// 🔴 Base Failure
class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => message;
}

/// 🟣 Supabase Failure
class SupaFailure extends Failure {
  final int? statusCode;
  final String? code;
  final Object? rawError;

  const SupaFailure(
    super.message, {
    this.statusCode,
    this.code,
    this.rawError,
  });

  // =========================
  // 🧠 Main Factory
  // =========================
  factory SupaFailure.fromException(Object error) {
    /// 🔐 Auth
    if (error is AuthException) {
      return SupaFailure._fromAuth(error);
    }

    /// 🟡 Database (Postgres)
    if (error is PostgrestException) {
      return SupaFailure._fromPostgrest(error);
    }

    /// 🌐 Network / unknown
    return SupaFailure(
      'حدث خطأ غير متوقع، حاول مرة أخرى',
      rawError: error,
    );
  }

  // =========================
  // 🔐 Auth Handling
  // =========================
  factory SupaFailure._fromAuth(AuthException e) {
    switch (e.message) {
      case 'Invalid login credentials':
        return const SupaFailure(
          'البريد الإلكتروني أو كلمة المرور غير صحيحة',
          code: 'INVALID_CREDENTIALS',
        );

      case 'Email not confirmed':
        return const SupaFailure(
          'يجب تأكيد البريد الإلكتروني أولاً',
          code: 'EMAIL_NOT_CONFIRMED',
        );

      default:
        return SupaFailure(
          e.message,
          code: e.statusCode?.toString(),
          rawError: e,
        );
    }
  }

  // =========================
  // 🟡 Database Handling
  // =========================
  factory SupaFailure._fromPostgrest(PostgrestException e) {
    switch (e.code) {
      case '23505': // unique_violation
        return const SupaFailure(
          'البيانات دي موجودة بالفعل',
          code: 'DUPLICATE_ENTRY',
        );

      case '23503': // foreign_key_violation
        return const SupaFailure(
          'في مشكلة في الربط بين البيانات',
          code: 'FOREIGN_KEY_ERROR',
        );

      default:
        return SupaFailure(
          e.message,
          code: e.code,
          rawError: e,
        );
    }
  }

  // =========================
  // 🎯 User Friendly Message
  // =========================
  String get userMessage {
    switch (code) {
      case 'INVALID_CREDENTIALS':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة';

      case 'EMAIL_NOT_CONFIRMED':
        return 'يجب تأكيد البريد الإلكتروني أولاً';

      case 'DUPLICATE_ENTRY':
        return 'العنصر موجود بالفعل';

      case 'FOREIGN_KEY_ERROR':
        return 'لا يمكن تنفيذ العملية بسبب ارتباط بيانات';

      default:
        return message;
    }
  }
}