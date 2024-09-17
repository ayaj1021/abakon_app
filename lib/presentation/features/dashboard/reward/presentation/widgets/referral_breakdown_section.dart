import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/widgets/referral_breakdown_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ReferralBreakdownSection extends StatelessWidget {
  const ReferralBreakdownSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.referralEarningsBreakdown,
          style: context.textTheme.s20w700.copyWith(
            color: AppColors.black,
          ),
        ),
        const VerticalSpacing(20),
        const ReferralBreakDownWidget(
          title: 'Account Upgrade',
          amount: '100',
        ),
        const VerticalSpacing(16),
        const ReferralBreakDownWidget(
          title: 'Airtime Bonus',
          amount: '2',
        ),
        const VerticalSpacing(16),
        const ReferralBreakDownWidget(
          title: 'Data Bonus',
          amount: '2',
        ),
        const VerticalSpacing(16),
        const ReferralBreakDownWidget(
          title: 'Cable TV Bonus',
          amount: '2',
        ),
        const VerticalSpacing(16),
        const ReferralBreakDownWidget(
          title: 'Electricity Bonus',
          amount: '2',
        ),
        const VerticalSpacing(16),
        const ReferralBreakDownWidget(
          title: 'Exam Pin Bonus',
          amount: '2',
        ),
      ],
    );
  }
}

