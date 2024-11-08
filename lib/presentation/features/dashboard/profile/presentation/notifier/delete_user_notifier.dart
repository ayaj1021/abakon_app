import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/profile/data/repository/delete_user_repository.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/notifier/delete_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteUserNotifer extends AutoDisposeNotifier<DeleteNotiferState> {
  DeleteUserNotifer();
  late final DeleteUserRepository _deleteUserRepository;
  @override
  DeleteNotiferState build() {
    _deleteUserRepository = ref.read(deleteUserRepositoryProvider);
    return DeleteNotiferState.initial();
  }

  Future<void> deleteUser({
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(deleteUser: LoadState.loading);
      final value = await _deleteUserRepository.deleteUser();
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(deleteUser: LoadState.idle);
      onSuccess(value.data!.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(deleteUser: LoadState.idle);
    }
  }


  // Future<void> logout() async {
  //   _userRepository.saveCurrentState(CurrentState.onboarded);
  //   state = state.copyWith(homeSessionState: HomeSessionState.logout);
  // }
}

final deleteUserNotifer =
    NotifierProvider.autoDispose<DeleteUserNotifer, DeleteNotiferState>(
  DeleteUserNotifer.new,
);
