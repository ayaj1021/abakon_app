import 'package:abakon/presentation/features/bank_deposits/presentation/widgets/bank_deposit_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class BankAccountsSection extends StatelessWidget {
  const BankAccountsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BankDepositWidget(
          image: 'assets/images/fidelity_bank_image.png',
          bankName: 'Fidelity Bank',
          accountName: 'Abakon',
          accountNumber: '1122334455',
        ),
        VerticalSpacing(24),
        BankDepositWidget(
          image: 'assets/images/moniepoint_image.png',
          bankName: 'Moniepoint Bank',
          accountName: 'Abakon',
          accountNumber: '1234567890',
        ),
        VerticalSpacing(24),
        BankDepositWidget(
          image: 'assets/images/wema_image.png',
          bankName: 'Wema Bank',
          accountName: 'Abakon',
          accountNumber: '0987654321',
        ),
            VerticalSpacing(24),
        BankDepositWidget(
          image: 'assets/images/sterling_image.png',
          bankName: 'Sterling Bank',
          accountName: 'Abakon',
          accountNumber: '0987654321',
        ),
      ],
    );
  }
}
