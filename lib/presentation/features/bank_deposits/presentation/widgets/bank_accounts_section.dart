import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/bank_deposits/data/model/generate_account_response.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/widgets/bank_deposit_widget.dart';
import 'package:flutter/material.dart';

class BankAccountsSection extends StatelessWidget {
  const BankAccountsSection(
      {super.key, required this.banks, required this.loadState});

  final List<Bank> banks;
  final LoadState loadState;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(banks.length, (index) {
          final bank = banks[index];
      return banks.isEmpty
          ? const Text('No Account Generated')
          :  BankDepositWidget(
              image: 'assets/images/fidelity_bank_image.png',
              bankName: '${bank.bankName}',
              accountName: '${bank.accountName}',
              accountNumber: '${bank.accountNumber}',
            );
    }));
  }
}
