import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/bank_deposits/data/model/generate_account_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenerateAccountRepository {
  GenerateAccountRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<GenerateAccountResponse>> generateAccount() async {
    try {
      final res = await _restClient.generateAccount();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final generateAccountRepositoryProvider = Provider<GenerateAccountRepository>(
  (ref) => GenerateAccountRepository(
    ref.read(restClientProvider),
  ),
);
