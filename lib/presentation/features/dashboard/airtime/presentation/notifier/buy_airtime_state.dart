
import 'package:abakon/core/utils/enums.dart';


class BuyAirtimeNotiferState {
  BuyAirtimeNotiferState({
    required this.buyAirtimeState,
   // required this.logoutState,
  });

  final LoadState buyAirtimeState;
 // final LoadState logoutState;
  
  factory BuyAirtimeNotiferState.initial() {
    return BuyAirtimeNotiferState(
      buyAirtimeState: LoadState.idle,  
     // logoutState: LoadState.idle,
    );
  }
  BuyAirtimeNotiferState copyWith({
    LoadState? buyAirtimeState,
   // LoadState? logoutState,
  }) {
    return BuyAirtimeNotiferState(
      buyAirtimeState: buyAirtimeState ?? this.buyAirtimeState,
      //logoutState: logoutState?? this.logoutState,
    );
  }
}
