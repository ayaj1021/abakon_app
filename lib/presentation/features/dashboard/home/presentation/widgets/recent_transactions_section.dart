import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/features/transactions/data/model/get_all_transactions_response.dart';
import 'package:abakon/presentation/features/transactions/presentation/view/transaction_details_view.dart';
import 'package:abakon/presentation/features/transactions/presentation/view/transaction_view.dart';
import 'package:abakon/presentation/features/transactions/presentation/widgets/transaction_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class RecentTransactionsSection extends StatelessWidget {
  const RecentTransactionsSection({
    super.key,
    required this.transactionHistory,
    required this.loadState,
  });
  final List<AllTransactionsData> transactionHistory;
  final LoadState loadState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.recentTransactions,
                style: context.textTheme.s16w600.copyWith(
                  color: AppColors.primary010101,
                ),
              ),
              GestureDetector(
                onTap: () => context.pushNamed(TransactionView.routeName),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryE6E2E0,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    Strings.viewAll,
                    style: context.textTheme.s10w600.copyWith(
                      color: AppColors.primary010101,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpacing(12),
          Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
              ),
              child: switch (loadState) {
                LoadState.loading => const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )),
                LoadState.error => const Text('Error'),
                _ => transactionHistory.isEmpty
                    ? Center(
                        child: Column(
                        children: [
                          SizedBox(
                              height: 120.h,
                              width: 120.w,
                              child: Image.asset(
                                'assets/images/emptylist.png',
                                fit: BoxFit.cover,
                              )),
                          Text(
                            'No transactions found',
                            style: context.textTheme.s12w400.copyWith(
                              color: AppColors.primary010101,
                            ),
                          ),
                        ],
                      ))
                    : Column(
                        children: List.generate(
                            transactionHistory.isNotEmpty
                                ? transactionHistory.length
                                : 0, (index) {
                          final data = transactionHistory[index];
                          String dateTime = '${data.date}';

                          DateTime parsedDate = DateTime.parse(dateTime);

                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(parsedDate);
                          return SingleChildScrollView(
                            child: GestureDetector(
                         onTap: () => Navigator.push(
                            context,
                            (MaterialPageRoute(
                              builder: (_) => TransactionDetailsView(
                                transactionNo: '${data.transref}',
                                service: '${data.servicename}',
                                transactionDescription: '${data.servicedesc}',
                                amount: '${data.amount}',
                                status: data.status!.toInt(),
                                date: formattedDate,
                              ),
                            )),
                          ),
                              child: TransactionWidget(
                                serviceName: "${data.servicename}",
                                amount: '${data.amount}',
                                serviceDescription: '${data.servicedesc}',
                                date: formattedDate,
                                status: data.status!.toInt(),
                              ),
                            ),
                          );
                        }),
                      ),
              })
        ],
      ),
    );
  }
}
