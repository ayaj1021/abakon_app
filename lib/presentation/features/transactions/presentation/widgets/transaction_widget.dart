import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.serviceName,
    required this.amount,
    required this.serviceDescription,
    required this.date,
  });
  final String serviceName;
  final String serviceDescription;
  final String amount;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primary4A89DC),
                  child: SvgPicture.asset('assets/icons/data.svg'),
                ),
                const HorizontalSpacing(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceName,
                      style: context.textTheme.s12w600.copyWith(
                        color: AppColors.primary010101,
                      ),
                    ),
                    SizedBox(
                      width: 143,
                      child: Text(
                        serviceDescription,
                        style: context.textTheme.s8w500.copyWith(
                          color: AppColors.primary010101,
                        ),
                        //maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'N$amount',
                  style: context.textTheme.s14w500.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      date,
                      style: context.textTheme.s8w500.copyWith(
                        color: AppColors.green,
                      ),
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.green,
                      size: 12,
                    )
                  ],
                )
              ],
            )
          ],
        ),
        const VerticalSpacing(8),
        const Divider(
          color: AppColors.primaryBFBCBB,
        ),
        const VerticalSpacing(12),
      ],
    );
  }
}
