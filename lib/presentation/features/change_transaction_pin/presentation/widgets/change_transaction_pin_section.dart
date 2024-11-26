import 'package:abakon/presentation/general_widgets/digit_send_form_field.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangeTransactionPinSection extends StatelessWidget {
  const ChangeTransactionPinSection({super.key, required this.oldPinController, required this.newPinController, required this.confirmNewPinController});
  final TextEditingController oldPinController;
  final TextEditingController newPinController;
  final TextEditingController confirmNewPinController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbakonFormfield(
          //validateFunction: Validators.pin(),
          controller: oldPinController,
          hintText: 'Old transaction pin',
          keyboardType: TextInputType.number,
          maxLength: 5,
          prefixIcon: SvgPicture.asset(
            'assets/icons/pin_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        const VerticalSpacing(10),
        AbakonFormfield(
         // validateFunction: Validators.pin(),
          controller: newPinController,
          hintText: 'New transaction pin',
          keyboardType: TextInputType.number,
          maxLength: 5,
          prefixIcon: SvgPicture.asset(
            'assets/icons/pin_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        const VerticalSpacing(10),
        AbakonFormfield(
        //  validateFunction: Validators.pin(),
          controller: confirmNewPinController,
          hintText: 'Confirm new transaction pin',
          keyboardType: TextInputType.number,
          maxLength: 5,
          prefixIcon: SvgPicture.asset(
            'assets/icons/pin_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
