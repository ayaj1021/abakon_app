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

// ignore: must_be_immutable
class RegisterTwoInputFieldSection extends StatefulWidget {
  RegisterTwoInputFieldSection({
    super.key,
    required this.statecontroller,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.pinController,
    required this.selectedState,
    required this.onStateSelected,
  });
  final TextEditingController statecontroller;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController pinController;
  String? selectedState;
  final Function(String) onStateSelected;

  @override
  State<RegisterTwoInputFieldSection> createState() =>
      _RegisterTwoInputFieldSectionState();
}

class _RegisterTwoInputFieldSectionState
    extends State<RegisterTwoInputFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          elevation: 0,
          value: widget.selectedState,
          decoration: InputDecoration(
            labelText: 'Choose state',
            labelStyle: context.textTheme.s12w500.copyWith(
              color: AppColors.primary595857,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.white,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.white,
                style: BorderStyle.none,
              ),
            ),
          ),
          // dropdownColor: Colors.transparent,
          items: states.map((states) {
            return DropdownMenuItem<String>(
              value: states,
              child: Text(
                states,
                style: context.textTheme.s12w500.copyWith(
                  color: AppColors.black,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.selectedState = newValue!;
            });

            widget.onStateSelected(newValue!);
          },
        ),
        // AbakonFormfield(
        //   validateFunction: Validators.name(),
        //   controller: widget.statecontroller,
        //   hintText: Strings.state,
        //   prefixIcon: SvgPicture.asset(
        //     'assets/icons/state_icon.svg',
        //     fit: BoxFit.scaleDown,
        //   ),
        // ),
        const VerticalSpacing(24),
        AbakonPasswordField(
          validateFunction: Validators.password(),
          controller: widget.passwordController,
          hintText: Strings.password,
          showError: false,
          padding: 8.hSpace,
        ),
        widget.passwordController.text.isEmpty
            ? const SizedBox.shrink()
            : PasswordValidatorWidget(password: widget.passwordController.text),
        const VerticalSpacing(11),
        AbakonPasswordField(
          validateFunction: (val) => Validators.confirmPass(
            val,
            widget.passwordController.text,
          ),
          controller: widget.confirmPasswordController,
          hintText: 'Confirm Password',
          showError: false,
          padding: 8.hSpace,
        ),
        widget.confirmPasswordController.text.isEmpty
            ? const SizedBox.shrink()
            : ValidatorText(
                isValid: widget.passwordController.text.isNotEmpty &&
                    widget.passwordController.text ==
                        widget.confirmPasswordController.text,
                text: 'Password match',
              ),
        const VerticalSpacing(11),
        AbakonFormfield(
          // validateFunction: Validators.pin(),
          controller: widget.pinController,
          hintText: Strings.setTransactionPin,
          keyboardType: TextInputType.number,
          maxLength: 4,
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
                info: 'Must be 4 digits',
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

final List<String> states = [
  "Abia",
  "Adamawa",
  "Akwa Ibom",
  "Anambra",
  "Bauchi",
  "Bayelsa",
  "Benue",
  "Borno",
  "Cross River",
  "Delta",
  "Ebonyi",
  "Edo",
  "Ekiti",
  "Enugu",
  "Gombe",
  "Imo",
  "Jigawa",
  "Kaduna",
  "Kano",
  "Katsina",
  "Kebbi",
  "Kogi",
  "Kwara",
  "Lagos",
  "Nasarawa",
  'Niger',
  'Ogun',
  "Ondo",
  "Osun",
  "Oyo",
  "Plateau",
  "Rivers",
  "Sokoto",
  "Taraba",
  "Yobe",
  "Zamfara",
  "FCT"
];
