import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/home/data/model/get_user_details_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetUserDetailsRepository {
  GetUserDetailsRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<GetAllUserDetailsResponse>> getAllUserDetails() async {
    try {
      final res = await _restClient.getAllUserDetails();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getUserDetailsRepositoryProvider = Provider<GetUserDetailsRepository>(
  (ref) => GetUserDetailsRepository(
    ref.read(restClientProvider),
  ),
);
