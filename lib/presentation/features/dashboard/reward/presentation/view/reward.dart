import 'package:abakon/presentation/features/dashboard/reward/presentation/widgets/referral_breakdown_section.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/widgets/referral_number_section.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/widgets/reward_title_section.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/widgets/your_earning_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class Reward extends StatelessWidget {
  const Reward({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RewardTitleSection(),
              VerticalSpacing(20),
              YourEarningSection(),
              VerticalSpacing(16),
              ReferralNumberSection(),
              VerticalSpacing(32),
              ReferralBreakdownSection(),
            ],
          ),
        ),
      ),
    );
  }
}
