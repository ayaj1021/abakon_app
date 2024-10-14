import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_request.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyAirtimeRepository {
  BuyAirtimeRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<BuyAirtimeResponse>> buyData(
      BuyAirtimeRequest buyAirtimeRequest) async {
    try {
      final response = await _restClient.buyAirtime(buyAirtimeRequest);
      return BaseResponse<BuyAirtimeResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final buyAirtimeRepositoryProvider = Provider<BuyAirtimeRepository>(
  (ref) => BuyAirtimeRepository(
    ref.read(restClientProvider),
  ),
);
