import 'package:equatable/equatable.dart';

class LocalStorageState extends Equatable {
  const LocalStorageState();

  @override
  List<Object> get props => [];
}

final class LocalStorageInitial extends LocalStorageState {}

final class LocalStorageLoading extends LocalStorageState {}

final class LocalStorageSuccess extends LocalStorageState {
  final Map<String, String?>? userData;

  const LocalStorageSuccess({this.userData});
}

final class LocalStorageError extends LocalStorageState {
  final String errorMessage;

  const LocalStorageError(this.errorMessage);
}
