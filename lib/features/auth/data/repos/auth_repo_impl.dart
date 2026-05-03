import 'package:dartz/dartz.dart';

import '../../../../core/network/supabase_errors.dart';
import '../../../../core/network/supabase_auth_config.dart';
import '../models/signin_input_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseAuthConfig _authService;

  AuthRepoImpl(this._authService);

  @override
  Future<Either<Failure, Unit>> signIn(SigninInputModel signinInputModel) async {
    try {
      await _authService.signIn(email: signinInputModel.email, password: signinInputModel.password);
      return const Right(unit);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _authService.forgetPassword(email: email, password: password);
      return const Right(unit);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await _authService.logOut();
      return const Right(unit);
    } catch (e) {
      return Left(SupaFailure.fromException(e));
    }
  }
}
