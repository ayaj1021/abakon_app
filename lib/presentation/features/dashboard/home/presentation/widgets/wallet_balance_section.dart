import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/small_button_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class WalletBalanceSection extends StatelessWidget {
  const WalletBalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          left: 22,
          right: 22,
          top: 20,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Total balance',
                      style: context.textTheme.s12w400
                          .copyWith(color: AppColors.white),
                    ),
                    const HorizontalSpacing(5),
                    const Icon(
                      Icons.visibility_off,
                      color: AppColors.white,
                      size: 14,
                    )
                  ],
                ),
                const VerticalSpacing(8),
                Text(
                  'N35,000,000.00',
                  style: context.textTheme.s14w600.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalSpacing(61),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SmallButtonWidget(
                    title: 'Fund wallet',
                    buttonColor: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
