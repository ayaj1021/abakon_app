import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/cable/data/model/get_all_cable_data_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllCableDataRepository {
  GetAllCableDataRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<GetAllCableData>> getAllCableData() async {
    try {
      final res = await _restClient.getAllCableData();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getAllCableDataRepositoryProvider = Provider<GetAllCableDataRepository>(
  (ref) => GetAllCableDataRepository(
    ref.read(restClientProvider),
  ),
);
