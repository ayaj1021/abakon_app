import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OtherServicesWidgets extends StatelessWidget {
  const OtherServicesWidgets(
      {super.key, required this.icon, required this.title});
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 75.w,
        height: 80.h,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryBFBCBB),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.primaryFFEEE9,
              child: SvgPicture.asset(icon),
            ),
            const VerticalSpacing(8),
            Text(
              title,
              style: context.textTheme.s10w400.copyWith(
                color: AppColors.primary010101,
              ),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
