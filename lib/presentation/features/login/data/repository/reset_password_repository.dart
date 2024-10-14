import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/login/data/models/reset_password_request.dart';
import 'package:abakon/presentation/features/login/data/models/reset_password_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ResetPasswordRepository {
  ResetPasswordRepository(this._client);
  final RestClient _client;

  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    try {
      // await Future<void>.delayed(const Duration(seconds: 2));
      //await _client.resetPassword(resetPasswordRequest);
      return const BaseResponse(status: false);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final resetPasswordRepositoryProvider = Provider<ResetPasswordRepository>(
  (ref) => ResetPasswordRepository(
    ref.read(restClientProvider),
  ),
);
