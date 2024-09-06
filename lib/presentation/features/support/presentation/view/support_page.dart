import 'package:abakon/presentation/features/support/presentation/widgets/support_page_header.dart';
import 'package:abakon/presentation/features/support/presentation/widgets/support_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});
  static const routeName = '/supportPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SupportPageHeader(),
              VerticalSpacing(32),
              SupportSection()
            ],
          ),
        ),
      ),
    );
  }
}
