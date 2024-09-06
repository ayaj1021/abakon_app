import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyInformationWidget extends StatelessWidget {
  const MyInformationWidget(
      {super.key,
      required this.icon,
      required this.information,
      required this.informationHeader});
  final String icon;
  final String information;
  final String informationHeader;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(icon),
      title: RichText(
          text: TextSpan(
              text: informationHeader,
              style: context.textTheme.s16w400.copyWith(
                color: AppColors.black,
              ),
              children: [
            TextSpan(
              text: information,
              style: context.textTheme.s16w600.copyWith(
                color: AppColors.primary010101,
              ),
            )
          ])),
    );
  }
}
