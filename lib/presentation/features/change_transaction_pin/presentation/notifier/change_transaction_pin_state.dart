import 'package:abakon/core/utils/enums.dart';

class ChangeTransactionPinState {
  ChangeTransactionPinState({
    required this.changeTransactionPinState,
  });

  final LoadState changeTransactionPinState;

  factory ChangeTransactionPinState.initial() {
    return ChangeTransactionPinState(
      changeTransactionPinState: LoadState.idle,
    );
  }
  ChangeTransactionPinState copyWith({
    LoadState? changeTransactionPinState,
  }) {
    return ChangeTransactionPinState(
      changeTransactionPinState:
          changeTransactionPinState ?? this.changeTransactionPinState,
    );
  }
}
