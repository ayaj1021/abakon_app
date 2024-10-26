import 'package:abakon/core/utils/enums.dart';

class VerifyElectricityNotiferState {
  VerifyElectricityNotiferState({
    required this.verifyElectricityState,
  });

  final LoadState verifyElectricityState;

  factory VerifyElectricityNotiferState.initial() {
    return VerifyElectricityNotiferState(
      verifyElectricityState: LoadState.idle,
    );
  }
  VerifyElectricityNotiferState copyWith({
    LoadState? verifyElectricityState,
  }) {
    return VerifyElectricityNotiferState(
      verifyElectricityState:
          verifyElectricityState ?? this.verifyElectricityState,
    );
  }
}
