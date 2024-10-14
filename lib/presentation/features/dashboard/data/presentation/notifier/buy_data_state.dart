
import 'package:abakon/core/utils/enums.dart';


class BuyDataNotiferState {
  BuyDataNotiferState({
    required this.buyDataState,
   // required this.logoutState,
  });

  final LoadState buyDataState;
 // final LoadState logoutState;
  
  factory BuyDataNotiferState.initial() {
    return BuyDataNotiferState(
      buyDataState: LoadState.idle,  
     // logoutState: LoadState.idle,
    );
  }
  BuyDataNotiferState copyWith({
    LoadState? buyDataState,
   // LoadState? logoutState,
  }) {
    return BuyDataNotiferState(
      buyDataState: buyDataState ?? this.buyDataState,
      //logoutState: logoutState?? this.logoutState,
    );
  }
}
