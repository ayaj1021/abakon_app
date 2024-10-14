import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class SupportPageHeader extends StatelessWidget {
  const SupportPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 14,
          ),
        ),
        const VerticalSpacing(8),
        Text(
          Strings.contactUs,
          style: context.textTheme.s20w700.copyWith(
            color: AppColors.black,
          ),
        ),
        const VerticalSpacing(4),
        Text(
          Strings.getInTouch,
          style: context.textTheme.s14w400.copyWith(
            color: AppColors.black,
          ),
        )
      ],
    );
  }
}
