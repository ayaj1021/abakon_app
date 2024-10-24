import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/exam_pin/data/model/get_all_exam_data_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllExamDataRepository {
  GetAllExamDataRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<GetAllExamData>> getAllExamData() async {
    try {
      final res = await _restClient.getAllExamData();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getAllExamDataRepositoryProvider = Provider<GetAllExamDataRepository>(
  (ref) => GetAllExamDataRepository(
    ref.read(restClientProvider),
  ),
);
