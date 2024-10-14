import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/sign_up/data/models/sign_up_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterRepository {
  RegisterRepository(this._restClient);
  final RestClient _restClient;
  Future<BaseResponse<dynamic>> signUp(SignUpRequest request) async {
    try {
      final res = await _restClient.signUp(request);
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final registerRepositoryProvider = Provider<RegisterRepository>(
  (ref) => RegisterRepository(
    ref.read(restClientProvider),
  ),
);
