import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/cable/data/model/buy_cable_request.dart';
import 'package:abakon/presentation/features/cable/data/model/buy_cable_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyCableRepository {
  BuyCableRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<BuyCableResponse>> buyCable(
      BuyCableRequest buyCableRequest) async {
    try {
      final response = await _restClient.buyCable(buyCableRequest);
      return BaseResponse<BuyCableResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final buyCableRepositoryProvider = Provider<BuyCableRepository>(
  (ref) => BuyCableRepository(
    ref.read(restClientProvider),
  ),
);
