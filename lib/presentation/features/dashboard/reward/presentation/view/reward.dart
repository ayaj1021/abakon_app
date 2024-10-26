import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_notifier.dart';
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
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getUserDetailsNotifierProvider.notifier)
          .getAllUserDetails();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadState =
        ref.watch(getUserDetailsNotifierProvider.select((v) => v.loadState));

    final data = ref.watch(getUserDetailsNotifierProvider
        .select((v) => v.getAllDetails.data?.allDetails));
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
