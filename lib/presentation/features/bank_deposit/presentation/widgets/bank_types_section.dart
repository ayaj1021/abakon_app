import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class BankTypesSection extends StatelessWidget {
  const BankTypesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BankWidget(
          bankName: 'Fidelity Bank',
        ),
        VerticalSpacing(24),
        BankWidget(
          bankName: 'Moniepoint Bank',
        ),
        BankWidget(
          bankName: 'Wema Bank',
        ),
        BankWidget(
          bankName: 'Sterling Bank',
        ),
      ],
    );
  }
}

class BankWidget extends StatelessWidget {
  const BankWidget({super.key, required this.bankName});
  final String bankName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(
        color: AppColors.primaryColor,
      )),
      child: Row(
        children: [
          Row(
            children: [
              //bank logo,

              Column(
                children: [Text(bankName)],
              )
            ],
          )
        ],
      ),
    );
  }
}
