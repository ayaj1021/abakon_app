import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        bottom: 51,
        top: 85,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/success_image.png'),
        ),
      ),
      child: Column(
        children: [
          Text(
            Strings.successfulTransaction,
            style: context.textTheme.s20w600.copyWith(
              color: AppColors.black,
            ),
          ),
          const VerticalSpacing(12),
          Text(
            Strings.thisIsToConfirmTransactionSuccessful,
            style: context.textTheme.s12w400.copyWith(
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const VerticalSpacing(60),
          AbakonSendButton(
            backgroundColor: AppColors.primaryFFCBBA,
            textColor: AppColors.primary010101,
            onTap: () {
              Navigator.pop(context);
            },
            title: 'Make Another Transaction',
          ),
          const VerticalSpacing(24),
          AbakonSendButton(
            onTap: () {},
            title: 'Go to Homepage',
          ),
        ],
      ),
    );
  }
}
