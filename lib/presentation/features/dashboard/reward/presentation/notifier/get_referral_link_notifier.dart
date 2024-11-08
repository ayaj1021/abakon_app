import 'package:abakon/core/config/exception/message_exception.dart';
import 'package:abakon/core/config/network_utils/async_response.dart';
import 'package:abakon/core/database/data_base.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/reward/data/repository/get_referral_link_repository.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/notifier/get_referral_link_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetReferralLinkServiceNotifier
    extends AutoDisposeNotifier<GetReferralLinkServiceState> {
  GetReferralLinkServiceNotifier();

  late GetReferralLinkServiceRepository _getReferralLinkServiceRepository;

  @override
  GetReferralLinkServiceState build() {
    _getReferralLinkServiceRepository =
        ref.read(getReferralLinkServiceRepositoryProvider);

    return GetReferralLinkServiceState.initial();
  }

  Future<void> getReferralLinkService() async {
    state = state.copyWith(loadState: LoadState.loading);

    try {
      final value =
          await _getReferralLinkServiceRepository.getReferralLinkService();

      if (!value.status) throw value.msg.toException;
      await SecureStorage().saveUserReferralLink(value.data!.data.toString());
      state = state.copyWith(
          loadState: LoadState.idle,
          getReferralLinkService: AsyncResponse.success(value.data!));
    } catch (e) {
      state = state.copyWith(loadState: LoadState.idle);
    }
  }
}

final getReferralLinkServiceNotifierProvider = NotifierProvider.autoDispose<
    GetReferralLinkServiceNotifier,
    GetReferralLinkServiceState>(GetReferralLinkServiceNotifier.new);
