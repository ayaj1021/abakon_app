import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/strings.dart';
import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/general_widgets/digit_send_email_field.dart';
import 'package:abakon/presentation/general_widgets/digit_send_form_field.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterOneInputFieldSection extends StatelessWidget {
  const RegisterOneInputFieldSection(
      {super.key,
      required this.firstNamecontroller,
      required this.lastNamecontroller,
      required this.phoneNumbercontroller,
      required this.emailAddressController});
  final TextEditingController firstNamecontroller;
  final TextEditingController lastNamecontroller;
  final TextEditingController phoneNumbercontroller;
  final TextEditingController emailAddressController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbakonFormfield(
          validateFunction: Validators.name(),
          controller: firstNamecontroller,
          hintText: Strings.firstName,
          prefixIcon: 
          
          const Icon(
            Icons.person,
            color: AppColors.primary591E0C,
          ),
        ),
        AbakonFormfield(
          validateFunction: Validators.name(),
          controller: lastNamecontroller,
          hintText: Strings.lastName,
          prefixIcon: const Icon(
            Icons.person,
            color: AppColors.primary591E0C,
          ),
        ),

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
        DSEmailField(
          validateFunction: Validators.email(),
          controller: emailAddressController,
          hintText: Strings.emailAddress,
          prefixIcon: SvgPicture.asset(
            'assets/icons/@icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        // DSFormfield(
        //   controller: _usernamecontroller,
        //   hintText: 'Username',
        //   prefixIcon: SvgPicture.asset(
        //     'assets/icons/person.svg',
        //     fit: BoxFit.scaleDown,
        //   ),
        // ),
        // DSFormfield(
        //   validateFunction: Validators.date(),
        //   inputFormatters: [
        //     DateFormatter(),
        //   ],
        //   prefixIcon: DigitSendDatePicker(
        //     dobController: _datecontroller,
        //   ),
        //   keyboardType: TextInputType.number,
        //   textInputAction: TextInputAction.next,
        //   controller: _datecontroller,
        //   hintText: 'Date of Birth: DD/MM/YY',
        // ),
        // DSPasswordField(
        //   validateFunction: Validators.password(),
        //   controller: _passwordController,
        //   hintText: Strings.password,
        //   showError: false,
        //   padding: 8.hSpace,
        // ),
        // PasswordValidatorWidget(password: _passwordController.text),
        // 11.hSpace,
        // DSPasswordField(
        //   validateFunction: (val) => Validators.confirmPass(
        //     val,
        //     _passwordController.text,
        //   ),
        //   controller: _confirmPasswordController,
        //   hintText: 'Confirm Password',
        //   showError: false,
        //   padding: 8.hSpace,
        // ),
        // ValidatorText(
        //   isValid: _passwordController.text.isNotEmpty &&
        //       _passwordController.text == _confirmPasswordController.text,
        //   text: 'Password match',
        // ),
        const VerticalSpacing(11),
      ],
    );
  }
}
