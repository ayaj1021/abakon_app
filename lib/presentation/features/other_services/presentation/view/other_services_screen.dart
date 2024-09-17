import 'package:abakon/presentation/features/dashboard/home/presentation/widgets/refer_and_earn_section.dart';
import 'package:abakon/presentation/features/other_services/presentation/widgets/other_services_header_section.dart';
import 'package:abakon/presentation/features/other_services/presentation/widgets/other_services_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class OtherServicesScreen extends StatelessWidget {
  const OtherServicesScreen({super.key});
  static const routeName = '/otherServicesScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OtherServicesHeaderSection(),
                    VerticalSpacing(32),
                    OtherServicesSection(),
                  ],
                ),
              ),
              VerticalSpacing(80),
              ReferAndEarnSection()
            ],
          ),
        ),
      ),
    );
  }
}
