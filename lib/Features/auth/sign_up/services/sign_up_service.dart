import 'package:news_app/Features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:news_app/Features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/utils/constants.dart';
import 'package:dio/dio.dart';

part 'sign_up_service.g.dart';

@RestApi(baseUrl: Constants.registrationBaseUrl)
abstract class SignUpService {
  factory SignUpService(Dio dio, {String? baseUrl}) = _SignUpService;

  @POST('/auth/register')
  Future<SignUpResponseModel> signUp(
      @Body() SignUpRequestBody signUpRequestBody);
}
