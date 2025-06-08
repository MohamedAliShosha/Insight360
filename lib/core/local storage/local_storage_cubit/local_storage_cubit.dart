import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'local_storage_state.dart';

class LocalStorageCubit extends Cubit<LocalStorageState> {
  LocalStorageCubit() : super(LocalStorageInitial());
}
