import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SmallButtonWidget extends StatelessWidget {
  const SmallButtonWidget({
    super.key,
    required this.title,
    required this.buttonColor,
    this.textColor,
    this.iconData,
  });
  final String title;
  final Color buttonColor;
  final Color? textColor;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: buttonColor,
      ),
      child: Row(
        children: [
          Icon(
            iconData ?? Icons.add,
            color: AppColors.primary591E0C,
            size: 14,
          ),
          Text(
            title,
            style: context.textTheme.s12w600
                .copyWith(color: textColor ?? AppColors.primary591E0C),
          ),
        ],
      ),
    );
  }
}
