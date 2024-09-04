import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReferAndEarnSection extends StatelessWidget {
  const ReferAndEarnSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.primary3F6AD8),
      child: Row(
        children: [
          SizedBox(
            height: 15.h,
            width: 15.w,
            child: SvgPicture.asset('assets/icons/refer_badge.svg'),
          ),
          const HorizontalSpacing(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.referAndEarn,
                style: context.textTheme.s12w600.copyWith(
                  color: AppColors.primaryFFFDFB,
                ),
              ),
               Text(
                Strings.inviteAFriendGetBonus,
                style: context.textTheme.s8w400.copyWith(
                  color: AppColors.white,
                ),
              ),
             
            ],
          )
        ],
      ),
    );
  }
}
