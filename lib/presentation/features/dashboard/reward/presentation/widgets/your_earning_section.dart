import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/app_small_button_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class YourEarningSection extends StatelessWidget {
  const YourEarningSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryBFBCBB,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.yourEarnings,
                style: context.textTheme.s12w400.copyWith(
                  color: AppColors.black,
                ),
              ),
              const VerticalSpacing(8),
              Text(
                'N145',
                style: context.textTheme.s20w700.copyWith(
                  color: AppColors.primary010101,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '',
                style: context.textTheme.s12w400.copyWith(
                  color: AppColors.black,
                ),
              ),
              const VerticalSpacing(8),
              const AppSmallButtonWidget(
                title: 'Withdraw',
                buttonColor: AppColors.primaryColor,
                textColor: AppColors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
