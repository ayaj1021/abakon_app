import 'package:abakon/presentation/features/my_information/presentation/widgets/my_information_header.dart';
import 'package:abakon/presentation/features/my_information/presentation/widgets/my_information_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class MyInformationPage extends StatelessWidget {
  const MyInformationPage({super.key});
  static const routeName = '/myInformationPage';

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
            MyInformationHeader(),
            VerticalSpacing(32),
            MyInformationSection(),
          ],
        ),
      )),
    );
  }
}
