import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/notifier/buy_airtime_notifier.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_input_section.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/widgets/airtime_title_section.dart';
import 'package:abakon/presentation/general_widgets/page_loader.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Airtime extends ConsumerWidget {
  const Airtime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      buyAirtimeNotifer.select((v) => v.buyAirtimeState.isLoading),
    );
    return PageLoader(
      isLoading: isLoading,
      child: const Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AirtimeTitleSection(),
                VerticalSpacing(24),
                AirtimeInputSection()
              ],
            ),
          ),
        )),
      ),
    );
  }
}
