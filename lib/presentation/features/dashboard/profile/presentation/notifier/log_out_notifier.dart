import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/profile/data/repository/logout_repository.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/notifier/logout_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogOutNotifer extends AutoDisposeNotifier<LogoutNotiferState> {
  LogOutNotifer();
  late final LogoutRepository _logOutRepository;
  @override
  LogoutNotiferState build() {
    _logOutRepository = ref.read(logOutRepositoryProvider);
    return LogoutNotiferState.initial();
  }

  Future<void> logOut({
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(logOut: LoadState.loading);
      final value = await _logOutRepository.logOut();
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(logOut: LoadState.idle);
      onSuccess(value.data!.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(logOut: LoadState.idle);
    }
  }

  Future<void> expireLogOut() async {
   // _userRepository.saveCurrentState(CurrentState.onboarded);
    state = state.copyWith(homeSessionState: HomeSessionState.logout);
  }


  // Future<void> logout() async {
  //   _userRepository.saveCurrentState(CurrentState.onboarded);
  //   state = state.copyWith(homeSessionState: HomeSessionState.logout);
  // }
}

final logOutNotifer =
    NotifierProvider.autoDispose<LogOutNotifer, LogoutNotiferState>(
  LogOutNotifer.new,
);
