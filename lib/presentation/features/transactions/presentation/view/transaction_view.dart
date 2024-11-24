import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/transactions/data/model/get_all_transactions_response.dart';
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
  List<AllTransactionsData> allTransactionList = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getAllTransactions();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getAllTransactionsNotifierProvider.notifier)
          .getAllTransactions();
    });
    _searchController.addListener(_filterTransactions);
    super.initState();
  }

  List<AllTransactionsData>? filteredTransactions = [];

  void _filterTransactions() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      filteredTransactions = allTransactionList.where((transaction) {
        bool matchesSearch =
            (transaction.amount?.toLowerCase().contains(query) ?? false) ||
                (transaction.servicename?.toLowerCase().contains(query) ??
                    false);

        return matchesSearch;
      }).toList();
    });
  }

  getAllTransactions() async {
    allTransactionList = await SecureStorage().getTransactions() ?? [];

    setState(() {
      filteredTransactions = allTransactionList;
    });
  }

  void filterAllTransactions({required String selectedStatus}) {
    final List<AllTransactionsData> allDataTransactions =
        allTransactionList.where((transaction) {
      bool allTransactions =
          (transaction.servicename!.toLowerCase().contains(selectedStatus));

      return allTransactions;
    }).toList();

    setState(() {
      filteredTransactions = allDataTransactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loadState = ref
        .watch(getAllTransactionsNotifierProvider.select((v) => v.loadState));

    // final transactionHistory = ref.watch(getAllTransactionsNotifierProvider
    //     .select((v) => v.getAllTransactions.data?.data));
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
                onChanged: (p) {
                  filterAllTransactions(selectedStatus: p.toString());
                },
              ),
              const VerticalSpacing(24),
              TransactionListSection(
                transactionHistory: filteredTransactions ?? [],
                loadState: loadState,
              )
            ],
          ),
        ),
      )),
    );
  }
}
