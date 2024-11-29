import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/firebase_token/data/model/send_token_request.dart';
import 'package:abakon/presentation/features/firebase_token/data/model/send_token_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SendTokenRepository {
  SendTokenRepository(this._client);
  final RestClient _client;

  Future<BaseResponse<SendTokenResponse>> sendToken(
    SendTokenRequest sendTokenRequest,
  ) async {
    try {
      final response = await _client.sendToken(sendTokenRequest);
      return BaseResponse<SendTokenResponse>(
          status: response.status, msg: response.msg);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final sendTokenRepositoryProvider = Provider<SendTokenRepository>(
  (ref) => SendTokenRepository(
    ref.read(restClientProvider),
  ),
);
