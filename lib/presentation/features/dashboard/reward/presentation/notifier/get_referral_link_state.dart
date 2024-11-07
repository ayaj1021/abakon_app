import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/reward/data/model/referral_link_response.dart';

class GetReferralLinkServiceState {
  final bool isLoading;

  final String? error;
  final String? message;
  final LoadState loadState;
  final AsyncResponse<ReferralResponse> getReferralLinkService;

  GetReferralLinkServiceState({
    required this.isLoading,
    this.error,
    this.message,
    required this.loadState,
    required this.getReferralLinkService,
  });

  factory GetReferralLinkServiceState.initial() {
    return GetReferralLinkServiceState(
      isLoading: false,
      error: null,
      message: '',
      loadState: LoadState.loading,
      getReferralLinkService: AsyncResponse.loading(),
    );
  }

  GetReferralLinkServiceState copyWith({
    bool? isLoading,
    String? error,
    String? message,
    LoadState? loadState,
    AsyncResponse<ReferralResponse>? getReferralLinkService,
  }) {
    return GetReferralLinkServiceState(
      isLoading: isLoading ?? this.isLoading,
      error: message,
      loadState: loadState ?? this.loadState,
      getReferralLinkService:
          getReferralLinkService ?? this.getReferralLinkService,
    );
  }
}
