import 'package:abakon/presentation/features/cable/presentation/widgets/cable_screen_header_section.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/cable_screen_input_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class CableScreen extends StatelessWidget {
  const CableScreen({super.key});
  static const routeName = '/cableScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CableScreenHeaderSection(),
              VerticalSpacing(24),
              CableScreenInputSection(),
            ],
          ),
        ),
      ),
    );
  }
}
