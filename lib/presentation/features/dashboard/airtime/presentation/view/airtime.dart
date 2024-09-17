import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_input_section.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_title_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class Airtime extends StatelessWidget {
  const Airtime({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AirtimeTitleSection(),
            VerticalSpacing(24),
            AirtimeInputSection()
          ],
        ),
      )),
    );
  }
}
