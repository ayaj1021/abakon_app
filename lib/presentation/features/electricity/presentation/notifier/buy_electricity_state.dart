import 'package:abakon/core/utils/enums.dart';

class BuyElectricityNotiferState {
  BuyElectricityNotiferState({
    required this.buyElectricityState,
  });

  final LoadState buyElectricityState;

  factory BuyElectricityNotiferState.initial() {
    return BuyElectricityNotiferState(
      buyElectricityState: LoadState.idle,
    );
  }
  BuyElectricityNotiferState copyWith({
    LoadState? buyElectricityState,
  }) {
    return BuyElectricityNotiferState(
      buyElectricityState:
          buyElectricityState ?? this.buyElectricityState,
    );
  }
}
