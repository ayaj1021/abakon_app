import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/airtime/data/model/buy_airtime_response.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/buy_exam_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyExamRepository {
  BuyExamRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<BuyAirtimeResponse>> buyExam(
      BuyExamRequest buyExamRequest) async {
    try {
      final response = await _restClient.buyExam(buyExamRequest);
      return BaseResponse<BuyAirtimeResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final buyExamRepositoryProvider = Provider<BuyExamRepository>(
  (ref) => BuyExamRepository(
    ref.read(restClientProvider),
  ),
);
