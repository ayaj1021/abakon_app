import 'package:abakon/presentation/features/change_transaction_pin/presentation/widgets/change_transaction_pin_header.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/widgets/change_transaction_pin_section.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ChangeTransactionPinView extends StatelessWidget {
  const ChangeTransactionPinView({super.key});
  static const routeName = '/changeTransactionPin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          child: Column(
            children: [
              const ChangeTransactionPinHeader(),
              const VerticalSpacing(32),
              const ChangeTransactionPinSection(),
              const VerticalSpacing(300),
              AbakonSendButton(
                onTap: () {},
                title: 'Update Transaction Pin',
              )
            ],
          ),
        ),
      ),
    );
  }
}
