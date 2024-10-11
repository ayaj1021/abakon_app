import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_notifier.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/home_header_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/recent_transactions_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/refer_and_earn_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/services_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/wallet_balance_section.dart';
import 'package:abakon/presentation/features/transactions/presentation/notifier/get_all_transactions_notifier.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.wait([
        ref.read(getUserDetailsNotifierProvider.notifier).getAllUserDetails(),
      ]);
      await ref
          .read(getAllTransactionsNotifierProvider.notifier)
          .getAllTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: () async {
          await Future.wait([
            ref
                .read(getUserDetailsNotifierProvider.notifier)
                .getAllUserDetails(),
          ]);
        },
        child: Consumer(builder: (context, ref, child) {
          final loadState = ref.watch(
              getAllTransactionsNotifierProvider.select((v) => v.loadState));

          final transactionHistory = ref.watch(
              getAllTransactionsNotifierProvider
                  .select((v) => v.getAllTransactions.data?.data));
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  const HomeHeaderSection(),
                  const VerticalSpacing(20),
                  const WalletBalanceSection(),
                  const VerticalSpacing(16),
                  const ReferAndEarnSection(),
                  const VerticalSpacing(20),
                  const ServicesSection(),
                  const VerticalSpacing(32),
                  RecentTransactionsSection(
                    transactionHistory: transactionHistory ?? [],
                    loadState: loadState,
                  ),
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
