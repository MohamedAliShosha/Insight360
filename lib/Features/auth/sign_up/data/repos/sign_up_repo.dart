import 'package:dartz/dartz.dart';
import 'package:news_app/Features/auth/sign_up/data/models/sign_up_api_error_model.dart';
import 'package:news_app/Features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:news_app/Features/auth/sign_up/data/models/sign_up_response_model.dart';

abstract class SignUpRepo {
  Future<Either<SignUpErrorModel, SignUpResponseModel>> signUp(
      {required SignUpRequestBody signUpRequestBody});
}
