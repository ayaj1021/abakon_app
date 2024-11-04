import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/notification/data/model/notification_response.dart';

class GetAllNotificationsServiceState {
  final bool isLoading;

  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<NotificationResponse> getAllNotificationService;

  GetAllNotificationsServiceState({
    required this.isLoading,
    this.error,
    this.message,
    required this.loadState,
    required this.getAllNotificationService,
  });

  factory GetAllNotificationsServiceState.initial() {
    return GetAllNotificationsServiceState(
      isLoading: false,

      error: null,
      message: '',
      loadState: LoadState.loading,
      getAllNotificationService: AsyncResponse.loading(),
     
    );
  }

  GetAllNotificationsServiceState copyWith({
    bool? isLoading,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<NotificationResponse>? getAllNotificationService,
  
  }) {
    return GetAllNotificationsServiceState(
      isLoading: isLoading ?? this.isLoading,
      error: message,
      loadState: loadState ?? this.loadState,
      getAllNotificationService:
          getAllNotificationService ?? this.getAllNotificationService,
    );
  }
}
