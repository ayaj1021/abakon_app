import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:flutter/material.dart';

class BankAccountHeaderSection extends StatelessWidget {
  const BankAccountHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                context.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.primary591E0C,
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            Text(Strings.bankAccount, style: context.textTheme.s20w600),
            const SizedBox(
              width: 80,
            ),
            const Icon(Icons.alarm_outlined),
          ],
        ),
        Text(
          'Funds transferred to this bank accounts are instantly\n credited to your Abakon wallet!',
          textAlign: TextAlign.center,
          style: context.textTheme.s12w500,
        ),
      ],
    );
  }
}
