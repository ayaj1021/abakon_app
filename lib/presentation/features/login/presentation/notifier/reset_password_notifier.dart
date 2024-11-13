import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/login/data/models/reset_password_request.dart';
import 'package:abakon/presentation/features/login/data/repository/reset_password_repository.dart';
import 'package:abakon/presentation/features/login/presentation/notifier/reset_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ResetPasswordNotifier extends AutoDisposeNotifier<ResetPasswordState> {
  ResetPasswordNotifier();

  late final ResetPasswordRepository _resetPasswordRepository;

  @override
  ResetPasswordState build() {
    _resetPasswordRepository = ref.read(resetPasswordRepositoryProvider);
    return ResetPasswordState.initial();
  }

  Future<void> resetPassword({
    required ResetPasswordRequest data,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    state = state.copyWith(resetPasswordState: LoadState.loading);
    try {
      final value = await _resetPasswordRepository.resetPassword(
        data,
      );
      if (value.status == false) throw value.msg.toException;

      state = state.copyWith(
        resetPasswordState: LoadState.idle,
        resetPasswordResponse: value.data,
      );
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(resetPasswordState: LoadState.idle);
    }
  }
}

final resetPasswordNotifier =
    NotifierProvider.autoDispose<ResetPasswordNotifier, ResetPasswordState>(
  ResetPasswordNotifier.new,
);
