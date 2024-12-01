import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/notifier/buy_exam_notifier.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_input_section.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/widgets/exam_pin_title_section.dart';
import 'package:abakon/presentation/general_widgets/page_loader.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamPinScreen extends ConsumerWidget {
  const ExamPinScreen({super.key});
  static const routeName = '/examPinScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      buyExamNotifer.select((v) => v.buyExamState.isLoading),
    );
    return PageLoader(
      isLoading: isLoading,
      child: const Scaffold(
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
      ),
    );
  }
}
