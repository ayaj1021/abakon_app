import 'package:abakon/presentation/features/transactions/presentation/notifier/get_all_transactions_notifier.dart';
import 'package:abakon/presentation/features/transactions/presentation/widgets/transaction_list_section.dart';
import 'package:abakon/presentation/features/transactions/presentation/widgets/transaction_search_section.dart';
import 'package:abakon/presentation/features/transactions/presentation/widgets/transactions_header_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionView extends ConsumerStatefulWidget {
  const TransactionView({super.key});
  static const routeName = '/transactionView';

  @override
  ConsumerState<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends ConsumerState<TransactionView> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getAllTransactionsNotifierProvider.notifier)
          .getAllTransactions();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadState = ref
        .watch(getAllTransactionsNotifierProvider.select((v) => v.loadState));

    final transactionHistory = ref.watch(getAllTransactionsNotifierProvider
        .select((v) => v.getAllTransactions.data?.data));
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TransactionsHeaderSection(),
              const VerticalSpacing(24),
              TransactionSearchSection(
                labelText: 'Search',
                controller: _searchController,
              ),
              const VerticalSpacing(24),
              TransactionListSection(
                transactionHistory: transactionHistory ?? [],
                loadState: loadState,
              )
            ],
          ),
        ),
      )),
    );
  }
}
