import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class OtherServicesHeaderSection extends StatelessWidget {
  const OtherServicesHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primary010101,
            size: 16,
          ),
        ),
        const VerticalSpacing(8),
        Text(
          Strings.otherServices,
          style: context.textTheme.s20w700.copyWith(
            color: AppColors.primary010101,
          ),
        ),
        const VerticalSpacing(4),
        Text(
          Strings.lifeEssentials,
          style: context.textTheme.s12w400.copyWith(
            color: AppColors.primary010101,
          ),
        ),
      ],
    );
  }
}
