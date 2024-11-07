import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/profile/data/model/logout_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutRepository {
  LogoutRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<LogoutResponse>> logOut() async {
    try {
      final response = await _restClient.logout();
      return BaseResponse<LogoutResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final logOutRepositoryProvider = Provider<LogoutRepository>(
  (ref) => LogoutRepository(
    ref.read(restClientProvider),
  ),
);
