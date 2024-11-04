import 'package:abakon/core/config/base_response/base_response.dart';
import 'package:abakon/core/config/exception/app_exception.dart';
import 'package:abakon/data/remote_data_source/rest_client.dart';
import 'package:abakon/presentation/features/notification/data/model/notification_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllNotificationServiceRepository {
  GetAllNotificationServiceRepository(this._restClient);
  final RestClient _restClient;

  Future<BaseResponse<NotificationResponse>> getAllNotificationService() async {
    try {
      final res = await _restClient.getAllNotifications();
      return BaseResponse(status: true, data: res);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }
}

final getAlNotificationServiceRepositoryProvider = Provider<GetAllNotificationServiceRepository>(
  (ref) => GetAllNotificationServiceRepository(
    ref.read(restClientProvider),
  ),
);
