import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppSmallButtonWidget extends StatelessWidget {
  const AppSmallButtonWidget({
    super.key,
    required this.title,
    required this.buttonColor,
    this.textColor, this.onTap,
  });
  final String title;
  final Color buttonColor;
  final Color? textColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: buttonColor,
        ),
        child: Text(
          title,
          style: context.textTheme.s12w600
              .copyWith(color: textColor ?? AppColors.primary591E0C),
        ),
      ),
    );
  }
}
