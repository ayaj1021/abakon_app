import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CablePlansDown extends StatelessWidget {
  const CablePlansDown({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      elevation: 0,
      decoration: InputDecoration(
        labelText: 'Plan',
        labelStyle: context.textTheme.s12w500.copyWith(
          color: AppColors.primary595857,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
              color: Colors.white,
              strokeAlign: BorderSide.strokeAlignCenter,
              style: BorderStyle.none),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.white,
            style: BorderStyle.none,
          ),
        ),
      ),
      // dropdownColor: Colors.transparent,
      items: plans.map((plans) {
        return DropdownMenuItem<String>(
          value: plans['title'],
          child: Text(
            plans['title'],
            style: context.textTheme.s12w500.copyWith(
              color: AppColors.black,
            ),
          ),
        );
      }).toList(),
      onChanged: (newValue) {},
    );
  }
}

List plans = [
  {"title": "Dstv premium Asia"},
  {"title": "Dstv Padi"},
  {"title": "Dstv compact plus"},
];
