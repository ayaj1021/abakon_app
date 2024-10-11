import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/features/transactions/data/model/get_all_transactions_response.dart';
import 'package:abakon/presentation/features/transactions/presentation/widgets/transaction_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionListSection extends StatelessWidget {
  const TransactionListSection({
    super.key,
    required this.transactionHistory,
    required this.loadState,
  });
  final List<AllTransactionsData> transactionHistory;
  final LoadState loadState;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryE6E2E0,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Next 10',
                style: context.textTheme.s10w600.copyWith(
                  color: AppColors.primary010101,
                ),
              ),
            ),
          ],
        ),
        const VerticalSpacing(12),
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: switch (loadState) {
              LoadState.loading => const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )),
              LoadState.error => const Text('Error'),
              _ => ListView.builder(
                  shrinkWrap: true,
                  itemCount: transactionHistory.length,
                  itemBuilder: (_, index) {
                    final data = transactionHistory[index];
                    String dateTime = '${data.date}';

                    DateTime parsedDate = DateTime.parse(dateTime);

                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(parsedDate);
                    return TransactionWidget(
                      serviceName: "${data.servicename}",
                      amount: '${data.amount}',
                      serviceDescription: '${data.servicedesc}',
                      date: formattedDate,
                    );
                  }),
            })
      ],
    );
  }
}
