import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/bank_deposits/data/model/generate_account_response.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/notifier/generate_account_notifier.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/widgets/bank_accounts_section.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/widgets/banks_header.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BankScreen extends ConsumerStatefulWidget {
  const BankScreen({super.key});
  static const routeName = '/banksScreen';

  @override
  ConsumerState<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends ConsumerState<BankScreen> {
  List<Bank> bankList = [];

  @override
  void initState() {
    getUserBankAccountDetails();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(generateAccountNotifierProvider.notifier)
          .generateAccount();
    });
    super.initState();
  }

  getUserBankAccountDetails() async {
    final banks = await SecureStorage().getBankAccountDetails();
    setState(() {
      bankList = banks?.banks ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    // final banksList = ref.watch(generateAccountNotifierProvider
    //     .select((state) => state.generateAccountState.data?.data?.banks));

    final serverMessage = ref.watch(generateAccountNotifierProvider
        .select((state) => state.generateAccountState.data?.message));
    final loadState =
        ref.watch(generateAccountNotifierProvider.select((v) => v.loadState));
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BanksHeader(),
              const VerticalSpacing(24),
              SizedBox(
                  child: switch (loadState) {
                LoadState.loading => const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )),
                LoadState.error =>
                  Center(child: Text(serverMessage.toString())),
                _ => BankAccountsSection(
                    banks: bankList,
                    loadState: loadState,
                  ),
              }),
            ],
          ),
        ),
      )),
    );
  }
}
