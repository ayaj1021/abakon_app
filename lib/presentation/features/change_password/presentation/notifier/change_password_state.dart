import 'package:abakon/core/utils/enums.dart';

class ChangePasswordState {
  ChangePasswordState({
    required this.changePasswordState,
  });

  final LoadState changePasswordState;

  factory ChangePasswordState.initial() {
    return ChangePasswordState(
      changePasswordState: LoadState.idle,
    );
  }
  ChangePasswordState copyWith({
    LoadState? changePasswordState,
    LoadState? logoutState,
  }) {
    return ChangePasswordState(
      changePasswordState: changePasswordState ?? this.changePasswordState,
    );
  }
}
