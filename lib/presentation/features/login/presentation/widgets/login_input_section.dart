import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/general_widgets/digit_send_email_field.dart';
import 'package:abakon/presentation/general_widgets/digit_send_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginInputSection extends StatelessWidget {
  const LoginInputSection(
      {super.key,
      required this.emailAddressController,
      required this.passwordController});
  final TextEditingController emailAddressController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       DSEmailField(
          validateFunction: Validators.email(),
          controller: emailAddressController,
          hintText: Strings.emailAddress,
          prefixIcon: SvgPicture.asset(
            'assets/icons/@icon.svg',
            fit: BoxFit.scaleDown,
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
