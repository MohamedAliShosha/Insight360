abstract class SignUpRepo {
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signUpWithGoogle();
  Future<void> signUpWithFacebook();
}
