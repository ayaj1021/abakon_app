import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DataTextField extends StatelessWidget {
  const DataTextField({
    super.key,
    required this.labelText, required this.controller,
  });
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 11,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelStyle: context.textTheme.s10w500.copyWith(
          color: AppColors.primary595857,
        ),
        counterText: '',
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
