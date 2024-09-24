import 'package:abakon/core/extensions/space_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/general_widgets/digit_send_form_field.dart';
import 'package:abakon/presentation/general_widgets/digit_send_password_field.dart';
import 'package:abakon/presentation/general_widgets/password_validator_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterTwoInputFieldSection extends StatelessWidget {
  const RegisterTwoInputFieldSection(
      {super.key,
      required this.statecontroller,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.pinController});
  final TextEditingController statecontroller;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController pinController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbakonFormfield(
          validateFunction: Validators.name(),
          controller: statecontroller,
          hintText: Strings.state,
          prefixIcon: SvgPicture.asset(
            'assets/icons/state_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        AbakonPasswordField(
          validateFunction: Validators.password(),
          controller: passwordController,
          hintText: Strings.password,
          showError: false,
          padding: 8.hSpace,
        ),
        passwordController.text.isEmpty
            ? const SizedBox.shrink()
            : PasswordValidatorWidget(password: passwordController.text),
        const VerticalSpacing(11),
        AbakonPasswordField(
          validateFunction: (val) => Validators.confirmPass(
            val,
            passwordController.text,
          ),
          controller: confirmPasswordController,
          hintText: 'Confirm Password',
          showError: false,
          padding: 8.hSpace,
        ),
        confirmPasswordController.text.isEmpty
            ? const SizedBox.shrink()
            : ValidatorText(
                isValid: passwordController.text.isNotEmpty &&
                    passwordController.text == confirmPasswordController.text,
                text: 'Password match',
              ),
        const VerticalSpacing(11),
        AbakonFormfield(
          validateFunction: Validators.pin(),
          controller: pinController,
          hintText: Strings.setTransactionPin,
          keyboardType: TextInputType.number,
          maxLength: 11,
          prefixIcon: SvgPicture.asset(
            'assets/icons/pin_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              PinInfoWidget(
                info: 'Must be 5 digits',
              ),
              PinInfoWidget(
                info: 'Must not be your phone number',
              ),
            ],
          ),
        ),
        const VerticalSpacing(11),
      ],
    );
  }
}

class PinInfoWidget extends StatelessWidget {
  const PinInfoWidget({
    super.key,
    required this.info,
  });
  final String info;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 4,
          backgroundColor: AppColors.primary010101,
        ),
        const HorizontalSpacing(6),
        Text(
          info,
          style: context.textTheme.s12w400.copyWith(
            color: AppColors.primary010101,
          ),
        ),
      ],
    );
  }
}
