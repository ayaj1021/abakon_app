import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentTransactionsSection extends StatelessWidget {
  const RecentTransactionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
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
                Strings.viewAll,
                style: context.textTheme.s10w600.copyWith(
                  color: AppColors.primary010101,
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
          child: Column(
            children: List.generate(3, (index) {
              return SingleChildScrollView(
                child: Column(
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
                              child:  SvgPicture.asset('assets/icons/data.svg'),
                            ),
                            const HorizontalSpacing(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Data',
                                  style: context.textTheme.s12w600.copyWith(
                                    color: AppColors.primary010101,
                                  ),
                                ),
                                SizedBox(
                                  width: 143,
                                  child: Text(
                                    'Purchase of MTN 500MB SME 30 days plan for phone number 09022334455',
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
                              'N145',
                              style: context.textTheme.s14w500.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '19/01/2024',
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
                ),
              );
            }),
          ),
        )
      ]),
    );
  }
}
