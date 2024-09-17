import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:flutter/material.dart';

class AirtimeTitleSection extends StatelessWidget {
  const AirtimeTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      Strings.buyAirtime,
      style: context.textTheme.s20w700.copyWith(
        color: AppColors.black,
      ),
    );
  }
}
