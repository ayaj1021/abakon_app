import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BanksHeader extends StatelessWidget {
  const BanksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
            Text(
              Strings.bankDeposit,
              style: context.textTheme.s20w700.copyWith(
                color: AppColors.black,
              ),
            ),
            SvgPicture.asset('assets/icons/recent_icon.svg')
          ],
        ),
        const VerticalSpacing(8),
        Text(
          Strings.fundsTransferredToThisAccounts,
          style: context.textTheme.s12w500.copyWith(
            color: AppColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
