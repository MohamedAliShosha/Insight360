import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_cubit_state.dart';

class SignInCubit extends Cubit<SignInCubitState> {
  SignInCubit() : super(SignInCubitInitial());

  Future<void> signInMethod(String email, String password) async {
    emit(SignInLoading());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(SignInSuccess(userCredential.user));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(
          SignInError('No user found for that email.'),
        );
      } else if (e.code == 'wrong-password') {
        emit(
          SignInError('Wrong password provided.'),
        );
      } else {
        emit(
          SignInError(e.message ?? 'An unknown error occurred.'),
        );
      }
    } catch (e) {
      emit(
        SignInError('Something went wrong. Please try again.'),
      );
    }
  }
}
