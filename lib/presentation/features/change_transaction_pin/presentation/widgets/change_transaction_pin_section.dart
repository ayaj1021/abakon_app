import 'package:abakon/core/utils/validators.dart';
import 'package:abakon/presentation/general_widgets/digit_send_form_field.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangeTransactionPinSection extends StatelessWidget {
  const ChangeTransactionPinSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AbakonFormfield(
          validateFunction: Validators.pin(),
          //  controller: pinController,
          hintText: 'Old transaction pin',
          keyboardType: TextInputType.number,
          maxLength: 4,
          prefixIcon: SvgPicture.asset(
            'assets/icons/pin_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        const VerticalSpacing(10),
        AbakonFormfield(
          validateFunction: Validators.pin(),
          //  controller: pinController,
          hintText: 'New transaction pin',
          keyboardType: TextInputType.number,
          maxLength: 4,
          prefixIcon: SvgPicture.asset(
            'assets/icons/pin_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        const VerticalSpacing(10),
        AbakonFormfield(
          validateFunction: Validators.pin(),
          //  controller: pinController,
          hintText: 'Confirm new transaction pin',
          keyboardType: TextInputType.number,
          maxLength: 4,
          prefixIcon: SvgPicture.asset(
            'assets/icons/pin_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
