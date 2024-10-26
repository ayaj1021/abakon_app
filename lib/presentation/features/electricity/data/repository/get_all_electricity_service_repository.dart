import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/electricity/data/model/get_all_electricity_service_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllElectricityServiceRepository {
  GetAllElectricityServiceRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<ElectricityResponse>> getAllElectricityService() async {
    try {
      final res = await _restClient.getAllElectricityService();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getAllElectricityServiceRepositoryProvider = Provider<GetAllElectricityServiceRepository>(
  (ref) => GetAllElectricityServiceRepository(
    ref.read(restClientProvider),
  ),
);
