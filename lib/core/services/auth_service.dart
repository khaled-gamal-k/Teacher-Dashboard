abstract class AuthService {
  Future<void> signIn({required String email, required String password});
  Future<void> forgetPassword({required String email, required String password});
  Future<void> logOut();
}
