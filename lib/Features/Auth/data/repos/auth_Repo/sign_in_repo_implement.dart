import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/Features/Auth/data/repos/auth_Repo/sign_in_repo.dart';

class SignInRepoImplement implements SignInRepo {
  final FirebaseAuth firebaseAuth;

  SignInRepoImplement({required this.firebaseAuth});
  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print('User signed in with email: ${userCredential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Error signing in with email: $e');
      }
    }
  }

  // @override
  // Future<void> signInWithFacebook() {
  //   return firebaseAuth
  //       .signInWithCredential(FacebookAuthProvider.credential('accessToken'))
  //       .then((value) {
  //     print('User signed in with Facebook: ${value.user?.uid}');
  //   }).catchError((error) {
  //     print('Error signing in with Facebook: $error');
  //   });
  // }

  // @override
  // Future<void> signInWithGoogle() {
  //   return firebaseAuth
  //       .signInWithCredential(GoogleAuthProvider.credential())
  //       .then((value) {
  //     print('User signed in with Google: ${value.user?.uid}');
  //   }).catchError((error) {
  //     print('Error signing in with Google: $error');
  //   });
  // }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      print('User signed out');
    } catch (error) {
      print('Error signing out: $error');
      rethrow;
    }
  }
}
