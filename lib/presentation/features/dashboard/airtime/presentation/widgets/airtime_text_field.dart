import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AirtimeTextField extends StatelessWidget {
  const AirtimeTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.maxLength,
    this.onChanged,
  });
  final String labelText;
  final TextEditingController controller;
  final int? maxLength;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLength: maxLength,
      controller: controller,
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
