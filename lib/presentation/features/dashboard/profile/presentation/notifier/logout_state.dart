import 'package:abakon/core/utils/enums.dart';

class LogoutNotiferState {
  LogoutNotiferState({
    required this.logOut,
  });

  final LoadState logOut;

  factory LogoutNotiferState.initial() {
    return LogoutNotiferState(
      logOut: LoadState.idle,
    );
  }
  LogoutNotiferState copyWith({
    LoadState? logOut,
  }) {
    return LogoutNotiferState(
      logOut: logOut ?? this.logOut,
    );
  }
}
