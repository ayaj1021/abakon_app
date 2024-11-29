import 'package:abakon/core/utils/enums.dart';

class SendTokenState {
  SendTokenState({
    required this.inputValid,
    required this.sendTokenState,
   
  });
  factory SendTokenState.initial() {
    return SendTokenState(
      inputValid: false,
      sendTokenState: LoadState.idle,
    );
  }

  final LoadState sendTokenState;
  final bool inputValid;

  SendTokenState copyWith({
    bool? inputValid,
    LoadState? sendTokenState,

  }) {
    return SendTokenState(
      inputValid: inputValid ?? this.inputValid,
      sendTokenState: sendTokenState ?? this.sendTokenState,
    
    );
  }
}
