import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/login_api_error_model.dart';
import '../../../../../../core/functions/save_user_access_token.dart';
import '../../../../../../core/functions/save_user_name.dart';
import '../../../../../../core/functions/save_user_email.dart';
import '../../../data/models/login_request_body.dart';
import '../../../data/models/login_response.dart';
import '../../../data/repos/login_repo.dart';
import 'package:flutter/material.dart';

part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;
  Future<void> login(LoginRequestBody loginRequestBody) async {
    emit(LoginLoading());

    final result = await loginRepo.login(loginRequestBody: loginRequestBody);
    result.fold(
      (loginApiErrorModel) {
        emit(
          LoginFailure(
            loginApiErrorModel,
          ),
        );
      },
      (loginResponse) {
        emit(
          LoginSuccess(loginResponse),
        );
        saveUserAccessToken(loginResponse.data.token);
        saveUserName(loginResponse.data.username);
        saveUserEmail(loginRequestBody.email);
      },
    );
  }
}
