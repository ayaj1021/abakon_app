import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_meter_type_dropdown.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_provider_dropdown_widget.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_text_field.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ElectricityInputSection extends StatelessWidget {
  const ElectricityInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ElectricityProviderDropDown(),
        const VerticalSpacing(16),
        const ElectricityMeterTypeDropDown(),
        const VerticalSpacing(16),
        const ElectricityTextField(
          labelText: 'Meter Number',
        ),
        const VerticalSpacing(16),
        const ElectricityTextField(
          labelText: 'Phone Number',
        ),
        const VerticalSpacing(16),
        const ElectricityTextField(
          labelText: 'Amount',
        ),
        const VerticalSpacing(16),
        const ElectricityTextField(
          labelText: 'Amount to pay',
        ),
        const VerticalSpacing(223),
        AbakonSendButton(onTap: () {}, title: 'Continue')
      ],
    );
  }
}

