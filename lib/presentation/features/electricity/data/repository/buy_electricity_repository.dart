import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/electricity/data/model/buy_electricity_request.dart';
import 'package:abakon/presentation/features/electricity/data/model/buy_electricity_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyElectricityRepository {
  BuyElectricityRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<BuyElectricityResponse>> buyElectricity(
      BuyElectricityRequest buyElectricityRequest) async {
    try {
      final response = await _restClient.buyElectricity(buyElectricityRequest);
      return BaseResponse<BuyElectricityResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final buyElectricityRepositoryProvider = Provider<BuyElectricityRepository>(
  (ref) => BuyElectricityRepository(
    ref.read(restClientProvider),
  ),
);
