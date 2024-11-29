import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/firebase_token/data/model/send_token_request.dart';
import 'package:abakon/presentation/features/firebase_token/data/repository/send_token_repository.dart';
import 'package:abakon/presentation/features/firebase_token/notifier/send_token_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordNotifier extends AutoDisposeNotifier<SendTokenState> {
  ResetPasswordNotifier();

  late final SendTokenRepository _sendTokenRepository;

  @override
  SendTokenState build() {
    _sendTokenRepository = ref.read(sendTokenRepositoryProvider);
    return SendTokenState.initial();
  }

  Future<void> sendToken(
      //   {
      //   required ResetPasswordRequest data,
      //   required void Function(String error) onError,
      //   required void Function(String message) onSuccess,
      // }
      ) async {
    state = state.copyWith(sendTokenState: LoadState.loading);
    final token = await SecureStorage().getUserFirebaseToken();
    final userFirebaseToken = token;
    final data = SendTokenRequest(firebaseToken: '$userFirebaseToken');
    try {
      final value = await _sendTokenRepository.sendToken(
        data,
      );
      if (value.status == false) throw value.msg.toException;

      state = state.copyWith(
        sendTokenState: LoadState.success,
      );
      // onSuccess(value.msg.toString());
    } catch (e) {
      //  onError(e.toString());
      state = state.copyWith(sendTokenState: LoadState.idle);
    }
  }
}

final sendTokenNotifier =
    NotifierProvider.autoDispose<ResetPasswordNotifier, SendTokenState>(
  ResetPasswordNotifier.new,
);
