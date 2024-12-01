import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/buy_electricity_notifier.dart';
import 'package:abakon/presentation/features/electricity/presentation/notifier/verify_electricity_notifier.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_input_section.dart';
import 'package:abakon/presentation/features/electricity/presentation/widgets/electricity_title_section.dart';
import 'package:abakon/presentation/general_widgets/page_loader.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ElectricityView extends ConsumerWidget {
  const ElectricityView({super.key});
  static const routeName = '/electricityScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      verifyElectricityNotifer
          .select((v) => v.verifyElectricityState.isLoading),
    );

    final isBuyEleLoading = ref.watch(
      buyElectricityNotifer.select((v) => v.buyElectricityState.isLoading),
    );
    return PageLoader(
      isLoading: isBuyEleLoading,
      child: PageLoader(
        isLoading: isLoading,
        child: const Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(24),
                  ElectricityTitleSection(),
                  VerticalSpacing(24),
                  ElectricityInputSection(),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
