import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/change_password/data/model/change_password_request.dart';
import 'package:abakon/presentation/features/change_password/data/model/change_password_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordRepository {
  ChangePasswordRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<ChangePasswordResponse>> changePassword(ChangePasswordRequest changePasswordRequest) async {
    try {
      final response = await _restClient.changePassword(changePasswordRequest);
      return BaseResponse<ChangePasswordResponse>(status: true, data: response);
     // return response;
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  // Future<BaseResponse> logout() async {
  //   try {
  //   //  return await _restClient.logout();
  //   } on DioException catch (e) {
  //     return AppException.handleError(e);
  //   }
  // }
}

final changePasswordRepositoryProvider = Provider<ChangePasswordRepository>(
  (ref) => ChangePasswordRepository(
    ref.read(restClientProvider),
  ),
);
