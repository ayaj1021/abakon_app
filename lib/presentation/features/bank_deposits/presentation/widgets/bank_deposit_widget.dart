import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BankDepositWidget extends StatelessWidget {
  const BankDepositWidget({
    super.key,
    required this.image,
    required this.bankName,
    required this.accountName,
    required this.accountNumber,
  });
  final String image;
  final String bankName;
  final String accountName;
  final String accountNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primaryColor,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: Image.asset(image),
              ),
              const HorizontalSpacing(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bankName,
                    style: context.textTheme.s16w600.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const VerticalSpacing(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${Strings.accountName}:",
                        style: context.textTheme.s12w500.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const HorizontalSpacing(10),
                      Text(
                        accountName,
                        style: context.textTheme.s14w600.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${Strings.accountNumberText}:",
                        style: context.textTheme.s12w500.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const HorizontalSpacing(10),
                      Text(
                        accountNumber,
                        style: context.textTheme.s14w600.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
            width: 40.w,
            child: SvgPicture.asset('assets/icons/copy_icon.svg'),
          )
        ],
      ),
    );
  }
}
