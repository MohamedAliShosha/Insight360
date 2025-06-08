part of 'local_storage_cubit.dart';

sealed class LocalStorageState extends Equatable {
  const LocalStorageState();

  @override
  List<Object> get props => [];
}

final class LocalStorageInitial extends LocalStorageState {}
