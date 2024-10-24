import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/cable/data/model/verify_cable_request.dart';
import 'package:abakon/presentation/features/cable/data/model/verify_cable_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyCableRepository {
  VerifyCableRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<VerifyCableResponse>> verifyCable(
      VerifyCableRequest verifyCableRequest) async {
    try {
      final response = await _restClient.verifyCable(verifyCableRequest);
      return BaseResponse<VerifyCableResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final verifyCableRepositoryProvider = Provider<VerifyCableRepository>(
  (ref) => VerifyCableRepository(
    ref.read(restClientProvider),
  ),
);
