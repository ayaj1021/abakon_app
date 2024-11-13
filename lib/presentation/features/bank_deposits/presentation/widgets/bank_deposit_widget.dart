import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${Strings.accountName}:",
                        style: context.textTheme.s12w500.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const HorizontalSpacing(10),
                      SizedBox(
                        width: 140.w,
                        child: Text(
                          accountName,
                          style: context.textTheme.s12w600.copyWith(
                            color: AppColors.black,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.justify,
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
                      const HorizontalSpacing(5),
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
            child: GestureDetector(
                onTap: () => copyToClipboard(
                    value: accountNumber,
                    message: 'Copied successfully',
                    context: context),
                child: SvgPicture.asset('assets/icons/copy_icon.svg')),
          )
        ],
      ),
    );
  }

  void copyToClipboard(
      {required String value,
      required String message,
      required BuildContext context}) {
    Clipboard.setData(ClipboardData(text: value)).then(
      // ignore: use_build_context_synchronously
      (value) => context.showSuccess(message: message),
    );
  }
}
