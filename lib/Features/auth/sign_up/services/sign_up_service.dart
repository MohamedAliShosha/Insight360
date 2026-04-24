import '../data/models/sign_up_request_body.dart';
import '../data/models/sign_up_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:news_app/core/utils/api_endpoints.dart';
import 'package:dio/dio.dart';

part 'sign_up_service.g.dart';

@RestApi()
abstract class SignUpService {
  factory SignUpService(Dio dio, {String? baseUrl}) = _SignUpService;

  @POST(ApiEndpoints.register)
  Future<SignUpResponseModel> signUp(
      @Body() SignUpRequestBody signUpRequestBody);
}
