import 'package:abakon/core/database/data_base.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_notifier.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/notifier/get_referral_link_notifier.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/widgets/referral_number_section.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/widgets/reward_title_section.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/widgets/your_earning_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Reward extends ConsumerStatefulWidget {
  const Reward({super.key});

  @override
  ConsumerState<Reward> createState() => _RewardState();
}

class _RewardState extends ConsumerState<Reward> {
  SecureStorage secureStorage = SecureStorage();
  String _referallLink = '';
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final link = await secureStorage.getUserReferralLink();
      getReferralLink(link.toString());
      await ref
          .read(getUserDetailsNotifierProvider.notifier)
          .getAllUserDetails();

      await ref
          .read(getReferralLinkServiceNotifierProvider.notifier)
          .getReferralLinkService();
    });

    super.initState();
  }

  getReferralLink(String link) {
    setState(() {
      _referallLink = link;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loadState =
        ref.watch(getUserDetailsNotifierProvider.select((v) => v.loadState));

    final data = ref.watch(getUserDetailsNotifierProvider
        .select((v) => v.getAllDetails.data?.allDetails));

    // final referralLinkLoadState = ref.watch(
    //     getReferralLinkServiceNotifierProvider.select((v) => v.loadState));

    // final referralLink = ref.watch(getReferralLinkServiceNotifierProvider
    //     .select((v) => v.getReferralLinkService.data?.data));
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: switch (loadState) {
              LoadState.loading => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )),
              LoadState.error => const Text('Error'),
              _ => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RewardTitleSection(),
                    const VerticalSpacing(20),
                    YourEarningSection(
                      referralAmount: "${data?.sRefWallet}",
                    ),
                    const VerticalSpacing(16),
                    ReferralNumberSection(
                      referralNumber: "${data?.sReferal ?? 0}",
                      referralLink: _referallLink.toString(),
                    ),
                    const VerticalSpacing(32),
                    // const ReferralBreakdownSection(),
                  ],
                ),
            }),
      ),
    );
  }
}
