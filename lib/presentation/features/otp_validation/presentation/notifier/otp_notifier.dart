import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/otp_validation/data/models/resend_otp_request.dart';
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
    required void Function(String message) onSuccess,
  }) async {
    state = state.copyWith(verificationState: LoadState.loading);

    try {
      final value = await _verificationRepository.validateSignUpOtp(
        request,
      );
      if (!value.status) throw value.msg.toException;

      state = state.copyWith(verificationState: LoadState.idle);

      onSuccess(value.msg.toString());
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(
        verificationState: LoadState.idle,
      );
    }
  }

  // Future<void> _saveToken(String token) async {
  //   await ref.read(userAuthRepositoryProvider).saveToken(token);
  // }

  Future<void> resendOtp({
    required void Function() onSuccess,
    required ResendOtpRequest request,
    required void Function(String error) onError,
  }) async {
    // state = state.copyWith(timerRunning: true);
    state = state.copyWith(otpVerificationState: LoadState.loading);

    try {
      final value = await _verificationRepository.resendOtp(
        request,
      );
      if (!value.status) throw value.msg.toException;
      state = state.copyWith(otpVerificationState: LoadState.idle);
      onSuccess();
    } catch (e) {
      onError(e.toString());
      state = state.copyWith(otpVerificationState: LoadState.idle);
      // state = state.copyWith(timerRunning: false);
    }
  }

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
