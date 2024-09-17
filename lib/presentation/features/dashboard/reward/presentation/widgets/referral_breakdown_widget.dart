import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ReferralBreakDownWidget extends StatelessWidget {
  const ReferralBreakDownWidget(
      {super.key, required this.title, required this.amount});
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 3,
              backgroundColor: AppColors.primary999795,
            ),
            const HorizontalSpacing(4),
            Text(
              title,
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.primary010101,
              ),
            ),
          ],
        ),
        Text(
          'N$amount',
          style: context.textTheme.s14w700.copyWith(
            color: AppColors.primary010101,
          ),
        ),
      ],
    );
  }
}
