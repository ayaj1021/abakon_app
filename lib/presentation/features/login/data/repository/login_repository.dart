import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/login/data/models/login_request.dart';
import 'package:abakon/presentation/features/login/data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginRepository {
  LoginRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _restClient.login(loginRequest);
      return BaseResponse<LoginResponse>(
          status: response.status!, data: response);
      // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepository(
    ref.read(restClientProvider),
  ),
);
