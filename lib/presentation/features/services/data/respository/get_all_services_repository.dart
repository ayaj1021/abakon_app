import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/services/data/model/get_all_services_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllServicesRepository {
  GetAllServicesRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<GetAllServicesResponse>> getAllServices() async {
    try {
      final res = await _restClient.getAllServices();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getAllServicesRepositoryProvider = Provider<GetAllServicesRepository>(
  (ref) => GetAllServicesRepository(
    ref.read(restClientProvider),
  ),
);
