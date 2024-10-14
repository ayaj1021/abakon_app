import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_input_section.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_title_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ExamPinScreen extends StatelessWidget {
  const ExamPinScreen({super.key});
  static const routeName = '/examPinScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(30),
              ExamPinTitleSection(),
              VerticalSpacing(24),
              ExamPinInputSection()
            ],
                    ),
                  ),
          )),
    );
  }
}
