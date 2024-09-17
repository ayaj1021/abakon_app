import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AirtimeTextField extends StatelessWidget {
  const AirtimeTextField({
    super.key,
    required this.labelText,
  });
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelStyle: context.textTheme.s10w500.copyWith(
          color: AppColors.primary595857,
        ),
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
