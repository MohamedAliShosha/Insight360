part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess(this.message);
}

final class SignUpError extends SignUpState {
  final String errorMessage;

  SignUpError(this.errorMessage);
}
