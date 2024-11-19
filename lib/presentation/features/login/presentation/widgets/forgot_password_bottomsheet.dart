import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/features/login/presentation/notifier/forgot_password_notifier.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/digit_send_email_field.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {

    final ValueNotifier<bool> _isLoginEnabled = ValueNotifier(false);
 
  late TextEditingController _emailAddressController;


  @override
  void initState() {
    _emailAddressController = TextEditingController()..addListener(_listener);
 

   
    super.initState();
  }

  void _listener() {
    _isLoginEnabled.value = _emailAddressController.text.isNotEmpty 
    
    ;}

  @override
  void dispose() {
    _isLoginEnabled.dispose();
    _emailAddressController.dispose();
   
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                size: 16,
                Icons.arrow_back_ios,
                color: AppColors.primary591E0C,
              ),
            ),
            const VerticalSpacing(8),
            Text(
              Strings.resetPassword,
              style: context.textTheme.s20w900.copyWith(
                color: AppColors.primary591E0C,
              ),
            ),
            const VerticalSpacing(8),
            Text(
              Strings.forgotPasswordSub,
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.primary010101,
              ),
            ),
            const VerticalSpacing(40),
            DSEmailField(
              validateFunction: Validators.email(),
              controller: _emailAddressController,
              hintText: Strings.emailAddress,
              prefixIcon: SvgPicture.asset(
                'assets/icons/email_icon.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            const VerticalSpacing(90),
            ValueListenableBuilder(
               valueListenable: _isLoginEnabled,
              builder: (context, r, c) {
                return Consumer(builder: (context, ref, _) {
                   final isLoading = ref.watch(
                          forgotPasswordNotifer.select((v) => v.forgotPasswordState.isLoading),
                        );
                  return AbakonSendButton(
                   isLoading: isLoading,
                          isEnabled: r && !isLoading,
                    onTap: () => Navigator.pop(context),
                    title: Strings.continueRegister,
                  );
                });
              }
            ),
          ],
        ),
      )),
    );
  }
}

Future<dynamic> forgotPasswordBottomSheet({
  required BuildContext context,
  required TextEditingController emailAddressController,
}) {
  validateInput() {
    if (Validators.email()(emailAddressController.text) == null) {
      return true;
    } else {
      return false;
    }
  }

  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 90,
          left: 20,
          right: 20,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                size: 16,
                Icons.arrow_back_ios,
                color: AppColors.primary591E0C,
              ),
            ),
            const VerticalSpacing(8),
            Text(
              Strings.resetPassword,
              style: context.textTheme.s20w900.copyWith(
                color: AppColors.primary591E0C,
              ),
            ),
            const VerticalSpacing(8),
            Text(
              Strings.forgotPasswordSub,
              style: context.textTheme.s12w400.copyWith(
                color: AppColors.primary010101,
              ),
            ),
            const VerticalSpacing(40),
            DSEmailField(
              validateFunction: Validators.email(),
              controller: emailAddressController,
              hintText: Strings.emailAddress,
              prefixIcon: SvgPicture.asset(
                'assets/icons/email_icon.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            const VerticalSpacing(90),
            Consumer(builder: (context, ref, _) {
              return AbakonSendButton(
                isEnabled: validateInput(),
                onTap: () => Navigator.pop(context),
                title: Strings.continueRegister,
              );
            }),
          ],
        ),
      );
    },
  );
}
