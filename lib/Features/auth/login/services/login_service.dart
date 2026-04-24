import 'package:retrofit/retrofit.dart';
import 'package:news_app/core/utils/api_endpoints.dart';

import '../data/models/login_request_body.dart';
import '../data/models/login_response.dart';
import 'package:dio/dio.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio, {String? baseUrl}) = _LoginService;

  @POST(ApiEndpoints.login)
  Future<LoginResponseModel> login(@Body() LoginRequestBody loginRequestBody);
}
