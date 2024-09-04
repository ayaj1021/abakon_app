import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/home_header_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/recent_transactions_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/refer_and_earn_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/services_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/wallet_balance_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical:40),
          child: Column(
            children: [
              HomeHeaderSection(),
              VerticalSpacing(20),
              WalletBalanceSection(),
              VerticalSpacing(16),
              ReferAndEarnSection(),
              VerticalSpacing(20),
              ServicesSection(),
              VerticalSpacing(32),
              RecentTransactionsSection(),
            ],
          ),
        ),
      )),
    );
  }
}