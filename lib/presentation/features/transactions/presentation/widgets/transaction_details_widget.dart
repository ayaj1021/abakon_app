import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TransactionDetailsWidget extends StatelessWidget {
  const TransactionDetailsWidget(
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
    return Stack(
      children: [
        SizedBox(
          height: 408.h,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/images/details_receipt_image.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            children: [
              status == 0
                  ? const Icon(
                      Icons.check_circle,
                      color: AppColors.green,
                      size: 30,
                    )
                  : const Icon(
                      Icons.cancel,
                      color: AppColors.red,
                      size: 30,
                    ),
              const VerticalSpacing(16),
              Text(
                status == 0 ? 'Payment Successful' : 'Payment Failed',
                style: context.textTheme.s16w700.copyWith(
                  color: AppColors.primary010101,
                ),
              ),
              const VerticalSpacing(8),
              SvgPicture.asset('assets/icons/divider_line.svg'),
              const VerticalSpacing(16),
              Text(
                transactionDescription,
                style: context.textTheme.s12w400.copyWith(
                  color: AppColors.primary010101,
                ),
                textAlign: TextAlign.center,
              ),
              TransactionDetailsRowWidget(
                title: 'Transaction No',
                subtitle: transactionNo,
              ),
              const VerticalSpacing(16),
              TransactionDetailsRowWidget(
                title: 'Service',
                subtitle: service,
              ),
              const VerticalSpacing(16),
              TransactionDetailsRowWidget(
                title: 'Amount',
                subtitle: amount,
              ),
              const VerticalSpacing(16),
              TransactionDetailsRowWidget(
                title: 'Status',
                subtitle: status == 0 ? 'Success' : 'Failed',
              ),
              const VerticalSpacing(16),
              TransactionDetailsRowWidget(
                title: 'Date',
                subtitle: amount,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TransactionDetailsRowWidget extends StatelessWidget {
  const TransactionDetailsRowWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.s12w400.copyWith(
            color: AppColors.primary010101,
          ),
        ),
        Text(
          subtitle,
          style: context.textTheme.s12w700.copyWith(
            color: AppColors.primary010101,
          ),
        ),
      ],
    );
  }
}
