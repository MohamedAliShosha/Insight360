import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpMethod(String email, String password) async {
    emit(SignUpLoading());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emit(
        SignUpSuccess(userCredential.user),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          SignUpError('The password provided is too weak.'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignUpError('The account already exists for that email.'),
        );
      } else if (e.code == 'invalid-email') {
        emit(
          SignUpError('The email address is badly formatted.'),
        );
      } else {
        emit(
          SignUpError('An unknown error occurred.'),
        );
      }
    }
  }
}
