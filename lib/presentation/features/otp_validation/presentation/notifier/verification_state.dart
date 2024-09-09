import 'package:abakon/core/utils/enums.dart';

class OTPVerificationState {
  OTPVerificationState({
    required this.timerRunning,
    required this.verificationState,
    required this.otpVerificationState,
    required this.inputValid,
  });
  factory OTPVerificationState.initial() {
    return OTPVerificationState(
      timerRunning: false,
      verificationState: LoadState.idle,
      otpVerificationState: LoadState.idle,
      inputValid: false,
    );
  }

  final bool inputValid;
  final bool timerRunning;
  final LoadState verificationState;
  final LoadState otpVerificationState;
  OTPVerificationState copyWith({
    bool? timerRunning,
    bool? inputValid,
    LoadState? verificationState,
    LoadState? otpVerificationState,
  }) {
    return OTPVerificationState(
      timerRunning: timerRunning ?? this.timerRunning,
      verificationState: verificationState ?? this.verificationState,
      inputValid: inputValid ?? this.inputValid,
      otpVerificationState: otpVerificationState ?? this.otpVerificationState,
    );
  }
}
