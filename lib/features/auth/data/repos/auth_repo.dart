import 'package:dartz/dartz.dart';
import '../../../../core/network/supabase_errors.dart';

import '../models/signin_input_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, Unit>> signIn(SigninInputModel signinInputModel);
  Future<Either<Failure, Unit>> forgetPassword({required String email, required String password});
  Future<Either<Failure, Unit>> logOut();
}
