import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/login/data/models/forgot_password_request.dart';
import 'package:abakon/presentation/features/login/data/models/forgot_password_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordRepository {
  ForgotPasswordRepository(this._client);
  final RestClient _client;

  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    try {
      final response = await _client.forgotPassword(forgotPasswordRequest);
      return BaseResponse<ForgotPasswordResponse>(
          status: response.status!, msg: response.msg);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final forgotPasswordRepositoryProvider = Provider<ForgotPasswordRepository>(
  (ref) => ForgotPasswordRepository(
    ref.read(restClientProvider),
  ),
);
