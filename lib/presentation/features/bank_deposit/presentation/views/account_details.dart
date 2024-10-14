import 'package:abakon/presentation/features/bank_deposit/presentation/widgets/bank_account_header_section.dart';
import 'package:abakon/presentation/features/bank_deposit/presentation/widgets/bank_types_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({super.key});
  static const routeName = '/bankDeposit';

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          child: Column(
            children: [
              BankAccountHeaderSection(),
              VerticalSpacing(
                24,
              ),
              BankTypesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
