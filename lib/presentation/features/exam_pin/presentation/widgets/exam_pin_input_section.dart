import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_provider_dropdown_widget.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_text_field.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ExamPinInputSection extends StatelessWidget {
  const ExamPinInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ExamPinProviderDropDown(),
        const VerticalSpacing(16),
        const ExamPinTextField(
          labelText: 'Quantity',
        ),
        const VerticalSpacing(16),
        const ExamPinTextField(
          labelText: 'Amount to pay',
        ),
        const VerticalSpacing(223),
        AbakonSendButton(
          onTap: () {},
          title: 'Continue',
        ),
      ],
    );
  }
}
