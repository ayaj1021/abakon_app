import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/digit_send_form_field.dart';
import 'package:abakon/presentation/general_widgets/ds_bottom_sheet.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmTransactionsWidget extends StatelessWidget {
  const ConfirmTransactionsWidget(
      {super.key,
      required this.onTap,
      required this.pinController,
      required this.isEnabled});
  final Function() onTap;
  final TextEditingController pinController;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return AbakonBottomSheet(
      content: Center(
        child: Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(top: 20, left: 28, right: 28, bottom: 54),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Confirm Transaction',
                style: context.textTheme.s20w600.copyWith(
                  color: AppColors.black,
                ),
              ),
              const VerticalSpacing(16),
              SizedBox(
                  width: 280.w,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Kindly enter your ',
                      style: context.textTheme.s12w400.copyWith(
                        color: AppColors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '4-digits Transaction pin ',
                          style: context.textTheme.s12w400.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'to confirm this transaction',
                          style: context.textTheme.s12w400.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  )),
              const VerticalSpacing(24),
              AbakonFormfield(
               // validateFunction: Validators.pin(),
                controller: pinController,
                hintText: 'Enter transaction pin',
                obscureText: true,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                maxLength: 5,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/pin_icon.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpacing(50),
              SizedBox(
                child: AbakonSendButton(
                    onTap: onTap, title: 'Confirm'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//   