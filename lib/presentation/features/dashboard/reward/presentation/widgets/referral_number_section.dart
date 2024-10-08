import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/app_small_button_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralNumberSection extends StatelessWidget {
  const ReferralNumberSection({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.numberOfRefferals,
            style: context.textTheme.s12w400.copyWith(
              color: AppColors.black,
            ),
          ),
          const VerticalSpacing(8),
          Text(
            '2',
            style: context.textTheme.s20w700.copyWith(
              color: AppColors.primary010101,
            ),
          ),
          Column(
            children: [
             
              const VerticalSpacing(8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryFFF7F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 202.w,
                          child: const Text(
                              'https://abakon.ng/mobile/register/?referral=08148057082'),
                        ),
                        const VerticalSpacing(8),
                      ],
                    ),
                    const Column(
                      children: [
                        VerticalSpacing(28),
                        AppSmallButtonWidget(
                          title: 'Copy link',
                          buttonColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
