import 'package:abakon/presentation/features/bank_deposits/presentation/widgets/bank_accounts_section.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/widgets/banks_header.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class BankScreen extends StatelessWidget {
  const BankScreen({super.key});
  static const routeName = '/banksScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BanksHeader(),
              VerticalSpacing(24),
              BankAccountsSection(),
            ],
          ),
        ),
      )),
    );
  }
}
