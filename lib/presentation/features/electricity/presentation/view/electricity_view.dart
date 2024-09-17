import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_input_section.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_title_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ElectricityView extends StatelessWidget {
  const ElectricityView({super.key});
   static const routeName = '/electricityScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ElectricityTitleSection(),
            VerticalSpacing(24),
            ElectricityInputSection(),
          ],
        ),
      )),
    );
  }
}
