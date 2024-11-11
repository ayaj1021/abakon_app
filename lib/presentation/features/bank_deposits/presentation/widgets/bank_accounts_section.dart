import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/bank_deposits/data/model/generate_account_response.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/widgets/bank_deposit_widget.dart';
import 'package:abakon/presentation/features/dashboard/home/data/model/get_user_details_response.dart';
import 'package:flutter/material.dart';

class BankAccountsSection extends StatelessWidget {
  const BankAccountsSection(
      {super.key, required this.banks, required this.loadState, required this.allDetails});

  final List<Bank> banks;
   final AllDetails allDetails;
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
              bankName: '${bank.bankName ?? allDetails.sBankName}',
              accountName: '${bank.accountName ?? allDetails}',
              accountNumber: '${bank.accountNumber}',
            );
    }));
  }
}
