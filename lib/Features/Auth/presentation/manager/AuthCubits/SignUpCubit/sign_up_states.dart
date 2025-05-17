part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final User? user;
  SignUpSuccess(this.user);
}

final class SignUpError extends SignUpState {
  final String errorMessage;

  SignUpError(this.errorMessage);
}
