
import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/change_password/data/model/change_password_request.dart';
import 'package:abakon/presentation/features/change_password/data/respository/change_password_repository.dart';
import 'package:abakon/presentation/features/change_password/presentation/notifier/change_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordNotifer extends AutoDisposeNotifier<ChangePasswordState> {
  ChangePasswordNotifer();
  late final ChangePasswordRepository _changePasswordRepository;
  @override
  ChangePasswordState build() {
    _changePasswordRepository = ref.read(changePasswordRepositoryProvider);
    return ChangePasswordState.initial();
  }

  Future<void> changePassword({
    required ChangePasswordRequest data,
    required void Function(String error) onError,
    required void Function(String message) onSuccess,
  }) async {
    try {
      state = state.copyWith(changePasswordState: LoadState.loading);
      final value = await _changePasswordRepository.changePassword(
        data,
      );
      if (!value.status) throw value.msg.toException;


      state = state.copyWith(changePasswordState: LoadState.idle);
      onSuccess(value.data!.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(changePasswordState: LoadState.idle);
    }
  }

  Future<void> logout({
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    try {
      state = state.copyWith(logoutState: LoadState.loading);

      state = state.copyWith(logoutState: LoadState.success);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(changePasswordState: LoadState.idle);
    }
  }
}

final changePasswordNotifer =
    NotifierProvider.autoDispose<ChangePasswordNotifer, ChangePasswordState>(
  ChangePasswordNotifer.new,
);
