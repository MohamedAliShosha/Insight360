import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/sign_up_api_error_model.dart';
import '../../../data/models/sign_up_request_body.dart';
import '../../../data/models/sign_up_response_model.dart';
import '../../../data/repos/sign_up_repo.dart';
import '../../../../../../core/functions/save_user_access_token.dart';
import '../../../../../../core/functions/save_user_name.dart';
import '../../../../../../core/functions/save_user_email.dart';

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
