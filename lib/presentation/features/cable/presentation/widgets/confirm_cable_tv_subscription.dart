import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmCableTvSubscription extends StatelessWidget {
  const ConfirmCableTvSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, left: 28, right: 28, bottom: 54),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/information_icon.svg'),
          const VerticalSpacing(16),
          Text(
            Strings.areYouSure,
            style: context.textTheme.s20w600.copyWith(
              color: AppColors.black,
            ),
          ),
          const VerticalSpacing(16),
          SizedBox(
            width: 280.w,
            child: Text(
              'You are about to purchase an "DSTV" subscription of "N2950" for the IUC number "222-333-444-67" Do you wish to continue?',
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const VerticalSpacing(77),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 144.w,
                  child: AbakonSendButton(
                    hasBorder: true,
                    onTap: () {},
                    title: 'No',
                    backgroundColor: AppColors.white,
                    textColor: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                  )),
              SizedBox(
                  width: 144.w,
                  child: AbakonSendButton(onTap: () {}, title: 'Yes')),
            ],
          )
        ],
      ),
    );
  }
}
