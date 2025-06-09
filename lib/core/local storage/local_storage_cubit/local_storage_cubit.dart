import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_state.dart';
import 'package:news_app/core/local%20storage/local_storage_services/local_storage_service.dart';

class LocalStorageCubit extends Cubit<LocalStorageState> {
  final LocalStorageService _localStorageService;

  LocalStorageCubit(this._localStorageService) : super(LocalStorageInitial());

  Future<void> saveUserData(
      {required String userName,
      required String email,
      required String phoneNumber}) async {
    try {
      emit(LocalStorageLoading());
      await _localStorageService.saveUserData(userName, email, phoneNumber);
      emit(const LocalStorageSuccess());
    } catch (e) {
      emit(LocalStorageError('Failed to save user data: $e'));
    }
  }

  Future<void> getUserData() async {
    try {
      emit(LocalStorageLoading());
      final data = await _localStorageService.getUserData();
      emit(LocalStorageSuccess(userData: data));
    } catch (e) {
      emit(LocalStorageError('Failed to load user data: $e'));
    }
  }

  Future<void> clearUserData() async {
    try {
      emit(LocalStorageLoading());
      await _localStorageService.clearUserData();
      emit(const LocalStorageSuccess());
    } catch (e) {
      emit(LocalStorageError('Failed to clear user data: $e'));
    }
  }
}
