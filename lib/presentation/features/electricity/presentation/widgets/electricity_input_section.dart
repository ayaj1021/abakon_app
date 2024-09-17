import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_meter_type_dropdown.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_provider_dropdown_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ElectricityInputSection extends StatelessWidget {
  const ElectricityInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ElectricityProviderDropDown(),
        VerticalSpacing(16),
        ElectricityMeterTypeDropDown()
      ],
    );
  }
}
