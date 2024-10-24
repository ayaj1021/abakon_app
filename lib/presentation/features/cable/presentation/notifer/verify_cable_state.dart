import 'package:abakon/core/utils/enums.dart';

class VerifyCableNotiferState {
  VerifyCableNotiferState({
    required this.verifyCableState,
  });

  final LoadState verifyCableState;

  factory VerifyCableNotiferState.initial() {
    return VerifyCableNotiferState(
      verifyCableState: LoadState.idle,
    );
  }
  VerifyCableNotiferState copyWith({
    LoadState? verifyCableState,
  }) {
    return VerifyCableNotiferState(
      verifyCableState: verifyCableState ?? this.verifyCableState,
    );
  }
}
