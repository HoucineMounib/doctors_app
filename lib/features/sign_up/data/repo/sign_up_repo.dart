import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/networking/api_result.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/features/sign_up/data/models/sign_up_reponse.dart';
import 'package:doctors_app/features/sign_up/data/models/sign_up_request_body.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.seccess(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
