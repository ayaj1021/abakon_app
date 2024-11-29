import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/bank_deposits/data/model/generate_account_response.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/widgets/bank_deposit_widget.dart';
import 'package:abakon/presentation/features/dashboard/home/data/model/get_user_details_response.dart';
import 'package:flutter/material.dart';

class BankAccountsSection extends StatelessWidget {
  const BankAccountsSection(
      {super.key,
      required this.banks,
      required this.loadState,
      required this.allDetails,
      required this.status,
      required this.accountNumber});

  final List<Bank> banks;
  final AllDetails allDetails;
  final LoadState loadState;
  final bool status;
  final String accountNumber;

  @override
  Widget build(BuildContext context) {
    return status == false
        ? BankDepositWidget(
            image: 'assets/images/fidelity_bank_image.png',
            bankName: '9Payment Service Bank (9PSB)',
            accountName: 'ABAKON INTEGRATED SERVICES',
            accountNumber: accountNumber,
          )
        : Column(
            children: List.generate(banks.length, (index) {
            final bank = banks[index];
            return banks.isEmpty
                ? const Text('No Account Generated')
                : BankDepositWidget(
                    image: 'assets/images/fidelity_bank_image.png',
                    bankName: '${bank.bankName ?? allDetails.sBankName}',
                    accountName: '${bank.accountName ?? allDetails}',
                    accountNumber: '${bank.accountNumber}',
                  );
          }));
  }
}
