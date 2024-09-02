import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/features/sign_up/presentation/view/register_one.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingDetailsWidget extends StatelessWidget {
  const OnboardingDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                  width: 48.w,
                  child: Image.asset('assets/logo/abakon_text_logo.png'),
                ),
                const VerticalSpacing(26),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    Strings.payAllYourBillsInSeconds,
                    textAlign: TextAlign.right,
                    style: context.textTheme.s20w500.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                const VerticalSpacing(442),
                AbakonSendButton(
                  onTap: () {
                    context.pushNamed(RegisterOne.routeName);
                  },
                  title: 'Register',
                ),
                const VerticalSpacing(20),
                AbakonSendButton(
                  backgroundColor: AppColors.secondaryColor,
                  onTap: () {
                    context.pushNamed(Login.routeName);
                  },
                  title: 'Login',
                  textColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
