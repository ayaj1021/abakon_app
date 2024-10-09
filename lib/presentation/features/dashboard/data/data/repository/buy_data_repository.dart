import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_request.dart';
import 'package:abakon/presentation/features/dashboard/data/data/models/buy_data_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyDataRepository {
  BuyDataRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<BuyDataResponse>> buyData(
      BuyDataRequest buyDataRequest) async {
    try {
      final response = await _restClient.buyData(buyDataRequest);
      return BaseResponse<BuyDataResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final buyDataRepositoryProvider = Provider<BuyDataRepository>(
  (ref) => BuyDataRepository(
    ref.read(restClientProvider),
  ),
);
