import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/reset_password/data/model/reset_password_response.dart';

class ResetPasswordState {
  ResetPasswordState({
    required this.inputValid,
    required this.resetPasswordState,
    this.resetPasswordResponse,
  });
  factory ResetPasswordState.initial() {
    return ResetPasswordState(
      inputValid: false,
      resetPasswordState: LoadState.idle,
    );
  }

  final LoadState resetPasswordState;
  final bool inputValid;
  final ResetPasswordResponse? resetPasswordResponse;
  ResetPasswordState copyWith({
    bool? inputValid,
    LoadState? resetPasswordState,
    ResetPasswordResponse? resetPasswordResponse,
  }) {
    return ResetPasswordState(
      inputValid: inputValid ?? this.inputValid,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resetPasswordResponse:
          resetPasswordResponse ?? this.resetPasswordResponse,
    );
  }
}
