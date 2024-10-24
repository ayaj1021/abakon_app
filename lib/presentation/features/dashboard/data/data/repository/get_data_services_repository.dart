import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/get_all_data_service_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllDataServicesRepository {
  GetAllDataServicesRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<DataResponse>> getAllDataServices() async {
    try {
      final res = await _restClient.getAllDataServices();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getAllDataServicesRepositoryProvider = Provider<GetAllDataServicesRepository>(
  (ref) => GetAllDataServicesRepository(
    ref.read(restClientProvider),
  ),
);
