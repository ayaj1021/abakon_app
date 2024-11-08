import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/presentation/features/transactions/presentation/widgets/transaction_details_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView(
      {super.key,
      required this.transactionNo,
      required this.service,
      required this.transactionDescription,
      required this.amount,
      required this.status,
      required this.date});
  final String transactionNo;
  final String service;
  final String transactionDescription;
  final String amount;
  final int status;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 14,
                ),
              ),
              const VerticalSpacing(32),
              TransactionDetailsWidget(
                transactionNo: transactionNo,
                service: service,
                transactionDescription: transactionDescription,
                amount: amount,
                status: status,
                date: date,
              ),
              const VerticalSpacing(48),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //       width: 150.w,
              //       child: AbakonSendButton(
              //         onTap: () {},
              //         title: 'Share',
              //         textColor: AppColors.primaryColor,
              //         borderColor: AppColors.primaryColor,
              //       hasBorder: true,
              //        backgroundColor: AppColors.white,
              //       ),
              //     ),
              //      SizedBox(
              //       width: 150.w,
              //       child: AbakonSendButton(
              //         onTap: () {},
              //         title: 'Download',
                    
              //       ),
              //     )
              //   ],
              // )
           
           
            ],
          ),
        ),
      ),
    );
  }
}
