import 'package:dio/dio.dart';
import 'package:doctors_app/core/networking/api_constants.dart';
import 'package:doctors_app/features/login/data/models/login_request_body.dart';
import 'package:doctors_app/features/login/data/models/login_response.dart';
import 'package:doctors_app/features/sign_up/data/models/sign_up_reponse.dart';
import 'package:doctors_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signUp)
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);
}