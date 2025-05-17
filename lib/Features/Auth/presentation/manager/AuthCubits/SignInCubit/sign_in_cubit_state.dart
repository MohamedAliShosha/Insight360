part of 'sign_in_cubit_cubit.dart';

abstract class SignInCubitState {}

final class SignInCubitInitial extends SignInCubitState {}

final class SignInLoading extends SignInCubitState {}

final class SignInSuccess extends SignInCubitState {
  final User? user;
  SignInSuccess(this.user);
}

final class SignInError extends SignInCubitState {
  final String errorMessage;

  SignInError(this.errorMessage);
}
