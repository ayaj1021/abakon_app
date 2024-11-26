
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CableTextField extends StatelessWidget {
  const CableTextField({
    super.key,
    required this.labelText,
    required this.maxLength,
    required this.controller,
  });
  final String labelText;
  final int maxLength;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      maxLength: maxLength,
      decoration: InputDecoration(
        counterText: '',
        labelStyle: context.textTheme.s10w500.copyWith(
          color: AppColors.primary595857,
        ),
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
