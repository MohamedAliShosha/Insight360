import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/sign_up/data/models/sign_up_api_error_model.dart';
import 'package:news_app/Features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:news_app/Features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:news_app/Features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:news_app/core/utils/shared_pref_helper.dart';
import 'package:news_app/core/utils/shared_pref_keys.dart';

part 'sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  final SignUpRepo signUpRepo;

  Future<void> signUp(SignUpRequestBody signUpRequestBody) async {
    emit(SignUpLoading());

    final result =
        await signUpRepo.signUp(signUpRequestBody: signUpRequestBody);
    result.fold(
      (signUpErrorModel) {
        emit(
          SignUpFailure(
            signUpErrorModel,
          ),
        );
      },
      (signUpResponseModel) {
        emit(
          SignUpSuccess(signUpResponseModel),
        );
        saveUserAccessToken(signUpResponseModel.data.token);
        saveUserName(signUpResponseModel.data.username);
        saveUserEmail(signUpRequestBody.email);
      },
    );
  }
}

/// Method that saves user access token
Future<void> saveUserAccessToken(String? accessToken) async {
  if (accessToken != null) {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken, accessToken); // save userToken

    debugPrint('User access token saved: $accessToken');
  } else {
    debugPrint('Access token is null, not saved.');
  }
}

/// Method that saves user refresh token
Future<void> saveUserName(String? userName) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userName, userName!); // save userName

  debugPrint('User name saved: $userName');
}

/// Method that saves user email
Future<void> saveUserEmail(String? userEmail) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userEmail, userEmail!); // save userEmail

  debugPrint('User email saved: $userEmail');
}
