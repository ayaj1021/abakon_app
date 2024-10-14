import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:flutter/material.dart';

class DisableNumberValidatorCheckbox extends StatelessWidget {
  const DisableNumberValidatorCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (p) {},
          activeColor: AppColors.primaryColor,
        ),
        Text(
          Strings.disableNumberValidator,
          style: context.textTheme.s12w400.copyWith(
            color: AppColors.black,
          ),
        )
      ],
    );
  }
}
