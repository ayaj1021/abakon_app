import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/general_widgets/digit_send_form_field.dart';
import 'package:abakon/presentation/general_widgets/digit_send_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginInputSection extends StatelessWidget {
  const LoginInputSection(
      {super.key,
      required this.phoneNumbercontroller,
      required this.passwordController});
  final TextEditingController phoneNumbercontroller;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbakonFormfield(
          validateFunction: Validators.phone(),
          controller: phoneNumbercontroller,
          hintText: Strings.phoneNumber,
          keyboardType: TextInputType.number,
          maxLength: 11,
          prefixIcon: const Icon(
            Icons.phone,
            color: AppColors.primary591E0C,
          ),
        ),
        AbakonPasswordField(
          controller: passwordController,
          validateFunction: Validators.notEmpty(),
          hintText: 'Password',
          prefixIcon: SvgPicture.asset(
            'assets/icons/password.svg',
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: SvgPicture.asset(
            'assets/icons/eye.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
