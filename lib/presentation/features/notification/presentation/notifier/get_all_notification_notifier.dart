import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/notification/data/repository/get_all_notification_repository.dart';
import 'package:abakon/presentation/features/notification/presentation/notifier/get_all_notifications_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetAllNotificationServiceNotifier
    extends AutoDisposeNotifier<GetAllNotificationsServiceState> {
  GetAllNotificationServiceNotifier();

  late GetAllNotificationServiceRepository _getAllNotificationServiceRepository;

  @override
  GetAllNotificationsServiceState build() {
    _getAllNotificationServiceRepository =
        ref.read(getAlNotificationServiceRepositoryProvider);

    return GetAllNotificationsServiceState.initial();
  }

  Future<void> getAllNotificationService() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value = await _getAllNotificationServiceRepository
          .getAllNotificationService();

      if (!value.status) throw value.msg.toException;

      state = state.copyWith(
          loadState: LoadState.idle,
          getAllNotificationService: AsyncResponse.success(value.data!));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getAllNotificationServiceNotifierProvider = NotifierProvider.autoDispose<
    GetAllNotificationServiceNotifier,
    GetAllNotificationsServiceState>(GetAllNotificationServiceNotifier.new);
