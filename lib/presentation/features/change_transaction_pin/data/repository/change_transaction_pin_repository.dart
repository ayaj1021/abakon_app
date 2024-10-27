import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/change_transaction_pin/data/model/change_transaction_pin_request.dart';
import 'package:abakon/presentation/features/change_transaction_pin/data/model/change_transaction_pin_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeTransactionPinRepository {
  ChangeTransactionPinRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<ChangeTransactionPinResponse>> changeTransactionPin(
      ChangeTransactionPinRequest changePasswordRequest) async {
    try {
      final response = await _restClient.changeTransactionPin(changePasswordRequest);
      return BaseResponse<ChangeTransactionPinResponse>(status: true, data: response);
      // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final changeTransactionPinRepositoryProvider = Provider<ChangeTransactionPinRepository>(
  (ref) => ChangeTransactionPinRepository(
    ref.read(restClientProvider),
  ),
);
