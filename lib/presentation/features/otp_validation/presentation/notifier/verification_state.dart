import 'package:abakon/core/utils/enums.dart';

class OTPVerificationState {
  OTPVerificationState({
    required this.timerRunning,
    required this.verificationState,
    required this.inputValid,
  });
  factory OTPVerificationState.initial() {
    return OTPVerificationState(
      timerRunning: false,
      verificationState: LoadState.idle,
      inputValid: false,
    );
  }

  final bool inputValid;
  final bool timerRunning;
  final LoadState verificationState;
  OTPVerificationState copyWith({
    bool? timerRunning,
    bool? inputValid,
    LoadState? verificationState,
  }) {
    return OTPVerificationState(
      timerRunning: timerRunning ?? this.timerRunning,
      verificationState: verificationState ?? this.verificationState,
      inputValid: inputValid ?? this.inputValid,
    );
  }
}
