import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/buy_cable_notifier.dart';
import 'package:abakon/presentation/features/cable/presentation/notifer/verify_cable_notifier.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/cable_screen_header_section.dart';
import 'package:abakon/presentation/features/cable/presentation/widgets/cable_screen_input_section.dart';
import 'package:abakon/presentation/general_widgets/page_loader.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CableScreen extends ConsumerWidget {
  const CableScreen({super.key});
  static const routeName = '/cableScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVerifyLoading = ref.watch(
      verifyCableNotifer.select((v) => v.verifyCableState.isLoading),
    );
    final isBuyLoading = ref.watch(
      buyCableNotifer.select((v) => v.buyCableState.isLoading),
    );
    return PageLoader(
      isLoading: isBuyLoading,
      child: PageLoader(
        isLoading: isVerifyLoading,
        child: const Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
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
          ),
        ),
      ),
    );
  }
}
