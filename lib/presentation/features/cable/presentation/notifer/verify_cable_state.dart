import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/cable/data/model/verify_cable_response.dart';

class VerifyCableNotiferState {
  VerifyCableNotiferState({
    required this.verifyCableState,
    required this.verifyCable,
  });

  final LoadState verifyCableState;
  final AsyncResponse<VerifyCableResponse> verifyCable;

  factory VerifyCableNotiferState.initial() {
    return VerifyCableNotiferState(
      verifyCableState: LoadState.idle,
      verifyCable: AsyncResponse.loading(),
    );
  }
  VerifyCableNotiferState copyWith({
    LoadState? verifyCableState,
    final AsyncResponse<VerifyCableResponse>? verifyCable,
  }) {
    return VerifyCableNotiferState(
        verifyCableState: verifyCableState ?? this.verifyCableState,
        verifyCable: verifyCable ?? this.verifyCable);
  }
}
