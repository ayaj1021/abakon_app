import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/get_all_airtime_service_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllAirtimeServicesRepository {
  GetAllAirtimeServicesRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<AirtimeResponse>> getAllAirtimeServices() async {
    try {
      final res = await _restClient.getAllAirtimeServices();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getAllAirtimeServicesRepositoryProvider = Provider<GetAllAirtimeServicesRepository>(
  (ref) => GetAllAirtimeServicesRepository(
    ref.read(restClientProvider),
  ),
);
