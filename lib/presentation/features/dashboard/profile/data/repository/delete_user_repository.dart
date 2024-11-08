import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/dashboard/profile/data/model/delete_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteUserRepository {
  DeleteUserRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<DeleteUserResponse>> deleteUser() async {
    try {
      final response = await _restClient.deleteUser();
      return BaseResponse<DeleteUserResponse>(status: true, data: response);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final deleteUserRepositoryProvider = Provider<DeleteUserRepository>(
  (ref) => DeleteUserRepository(
    ref.read(restClientProvider),
  ),
);
