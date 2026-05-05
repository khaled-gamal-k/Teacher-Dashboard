import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/signin_input_model.dart';
import '../../data/repos/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(const AuthState.initial());
  final AuthRepo _authRepo;

  void signIn({required String email, required String password}) async {
    emit(const AuthState.loading());
    final res = await _authRepo.signIn(SigninInputModel(email: email, password: password));
    res.fold((l) => emit(AuthState.failure(l.message)), (r) => emit(const AuthState.succses()));
  }
}
