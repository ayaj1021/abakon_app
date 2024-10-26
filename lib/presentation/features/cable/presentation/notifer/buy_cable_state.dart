import 'package:abakon/core/utils/enums.dart';

class BuyCableNotiferState {
  BuyCableNotiferState({
    required this.buyCableState,
  });

  final LoadState buyCableState;

  factory BuyCableNotiferState.initial() {
    return BuyCableNotiferState(
      buyCableState: LoadState.idle,
    );
  }
  BuyCableNotiferState copyWith({
    LoadState? buyCableState,
  }) {
    return BuyCableNotiferState(
      buyCableState: buyCableState ?? this.buyCableState,
    );
  }
}
