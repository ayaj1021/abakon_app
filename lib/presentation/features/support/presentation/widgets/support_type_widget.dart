import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SupportTypeWidget extends StatelessWidget {
  const SupportTypeWidget(
      {super.key,
      required this.supportType,
      required this.supportTypeImage,
      required this.supportTypeContent,
      this.onTap});

  final String supportType;
  final String supportTypeImage;
  final String supportTypeContent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              supportType,
              style: context.textTheme.s16w500.copyWith(
                color: AppColors.black,
              ),
            ),
            const VerticalSpacing(8),
            Row(
              children: [
                SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: SvgPicture.asset(supportTypeImage),
                ),
                const HorizontalSpacing(9),
                Text(
                  supportTypeContent,
                  style: context.textTheme.s16w500.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
