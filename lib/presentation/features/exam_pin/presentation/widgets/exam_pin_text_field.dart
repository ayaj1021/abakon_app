import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ExamPinTextField extends StatelessWidget {
  const ExamPinTextField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
  });

  final String labelText;
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
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
