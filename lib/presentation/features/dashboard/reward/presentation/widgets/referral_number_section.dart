import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/general_widgets/app_small_button_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralNumberSection extends StatelessWidget {
  const ReferralNumberSection(
      {super.key, required this.referralNumber, required this.referralLink});
  final String referralNumber;
  final String referralLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryBFBCBB,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.numberOfRefferals,
            style: context.textTheme.s12w400.copyWith(
              color: AppColors.black,
            ),
          ),
          const VerticalSpacing(8),
          Text(
            referralNumber,
            style: context.textTheme.s20w700.copyWith(
              color: AppColors.primary010101,
            ),
          ),
          Column(
            children: [
              const VerticalSpacing(8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryFFF7F3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 202.w,
                          child: Text(referralLink),
                        ),
                        const VerticalSpacing(8),
                      ],
                    ),
                    Column(
                      children: [
                        const VerticalSpacing(28),
                        AppSmallButtonWidget(
                          onTap: () => copyToClipboard(
                              context: context,
                              message: 'Copied successfully',
                              value: ''),
                          title: 'Copy link',
                          buttonColor: AppColors.primaryColor,
                          textColor: AppColors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
      (value) => context.showSuccess(message: message),
    );
  }
}
