import 'package:abakon/presentation/features/cable/presentation/widgets/disable_number_validator_widget.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_text_field.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_network_dropdown_widget.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_type_dropdown_widget.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class AirtimeInputSection extends StatelessWidget {
  const AirtimeInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const AirtimeNetWorkDropDown(),
        const VerticalSpacing(16),
        const AirtimeTypeDropDown(),
        const VerticalSpacing(16),
        const AirtimeTextField(labelText: 'Amount to pay'),
        const VerticalSpacing(16),
        const AirtimeTextField(labelText: 'Amount'),
        const VerticalSpacing(16),
        const AirtimeTextField(labelText: 'Discount'),
        const VerticalSpacing(197),
        const DisableNumberValidatorCheckbox(),
        const VerticalSpacing(12),
        AbakonSendButton(onTap: (){}, title: 'Buy Airtime')


      ],
    );
  }
}

