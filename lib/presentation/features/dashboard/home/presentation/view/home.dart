import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_notifier.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/home_header_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/recent_transactions_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/refer_and_earn_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/services_section.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/wallet_balance_section.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/notifier/log_out_notifier.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/features/transactions/data/model/get_all_transactions_response.dart';
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

  List<AllTransactionsData> allTransactionList = [];

  @override
  void initState() {
    getAllTransactions();
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

  getAllTransactions() async {
    final transactions = await SecureStorage().getTransactions();

    setState(() {
      allTransactionList = transactions?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(logOutNotifer, (previous, next) {
      if (next.homeSessionState == HomeSessionState.logout) {
        context
          ..replaceNamed(Login.routeName)
          ..showSuccess(
            title: 'Session ended',
            message: 'Kindly login to continue',
          );
      }
    });
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

          // final transactionHistory = ref.watch(
          //     getAllTransactionsNotifierProvider
          //         .select((v) => v.getAllTransactions.data?.data));
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
                    transactionHistory: allTransactionList,
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
