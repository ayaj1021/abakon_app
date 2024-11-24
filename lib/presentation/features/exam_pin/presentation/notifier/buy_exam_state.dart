import 'package:abakon/core/utils/enums.dart';

class BuyExamNotiferState {
  BuyExamNotiferState({
    required this.buyExamState,
  });

  final LoadState buyExamState;

  factory BuyExamNotiferState.initial() {
    return BuyExamNotiferState(
      buyExamState: LoadState.idle,
    );
  }
  BuyExamNotiferState copyWith({
    LoadState? buyExamState,
  }) {
    return BuyExamNotiferState(
      buyExamState: buyExamState ?? this.buyExamState,
    );
  }
}
