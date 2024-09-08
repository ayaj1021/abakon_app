import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/domain/models/auth_response.dart';
import 'package:abakon/domain/repository/user_auth_repository.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/verify_otp_request.dart';
import 'package:abakon/presentation/features/otp_validation/data/repository/verification_repository.dart';
import 'package:abakon/presentation/features/otp_validation/presentation/notifier/verification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPVerificationNotifier<T>
    extends AutoDisposeNotifier<OTPVerificationState> {
  OTPVerificationNotifier();
  late OTPVerificationRepository _verificationRepository;
  @override
  OTPVerificationState build() {
    _verificationRepository = ref.read(otpVerificationRepositoryProvider);
    return OTPVerificationState.initial();
  }

  Future<void> verifyOtp({
    required VerifyOtpRequest request,
    required void Function(String error) onError,
    required void Function() onSuccess,
  }) async {
    state = state.copyWith(verificationState: LoadState.loading);

    try {
      final value = await _verificationRepository.validateSignUpOtp(
        request,
      );
      if (!value.status!) throw value.message.toException;
      await Future.wait(
        [
          _saveToken(value.data!.tokens!),
        ],
      );

      state = state.copyWith(
        verificationState: LoadState.idle,
      );
      // onSuccess(value.data! as T);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(
        verificationState: LoadState.idle,
      );
    }
  }

  Future<void> _saveToken(Tokens token) async {
    await ref.read(userAuthRepositoryProvider).saveToken(token);
  }

  // Future<void> resendOtp({
  //   required ResendOtpRequest request,
  //   required void Function(String error) onError,
  // }) async {
  //   state = state.copyWith(timerRunning: true);

  //   try {
  //     final value = await _verificationRepository.resendOtp(
  //       request,
  //     );
  //     if (!value.status) throw value.message.toException;
  //   } catch (e) {
  //     onError(e.toString());
  //     state = state.copyWith(timerRunning: false);
  //   }
  // }

  void stopTimer() {
    state = state.copyWith(
      timerRunning: false,
    );
  }
}

final otpVerificationNotifierProvider =
    NotifierProvider.autoDispose<OTPVerificationNotifier, OTPVerificationState>(
  OTPVerificationNotifier.new,
);
