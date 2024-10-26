import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/electricity/data/model/verify_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/data/model/verify_electricity_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyElectricityRepository {
  VerifyElectricityRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<VerifyElectricityResponse>> verifyElectricity(
      VerifyElectricityRequest verifyElectricityRequest) async {
    try {
      final response = await _restClient.verifyElectricity(verifyElectricityRequest);
      return BaseResponse<VerifyElectricityResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final verifyElectricityRepositoryProvider = Provider<VerifyElectricityRepository>(
  (ref) => VerifyElectricityRepository(
    ref.read(restClientProvider),
  ),
);
