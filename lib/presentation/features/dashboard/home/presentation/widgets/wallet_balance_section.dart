import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/bank_deposits/presentation/view/banks.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_notifier.dart';
import 'package:abakon/presentation/general_widgets/small_button_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletBalanceSection extends ConsumerStatefulWidget {
  const WalletBalanceSection({super.key});

  @override
  ConsumerState<WalletBalanceSection> createState() =>
      _WalletBalanceSectionState();
}

class _WalletBalanceSectionState extends ConsumerState<WalletBalanceSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getUserDetailsNotifierProvider.notifier)
          .getAllUserDetails();
    });
    super.initState();
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, build) {
      final loadState =
          ref.watch(getUserDetailsNotifierProvider.select((v) => v.loadState));

      final accountBalance = ref.watch(getUserDetailsNotifierProvider
          .select((state) => state.getAllDetails.data?.balance));
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 22,
            right: 22,
            top: 20,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Total balance',
                        style: context.textTheme.s12w400
                            .copyWith(color: AppColors.white),
                      ),
                      const HorizontalSpacing(5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                          color: AppColors.white,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                  const VerticalSpacing(8),
                  SizedBox(
                      child: switch (loadState) {
                    LoadState.loading => const Center(child: Text('')),
                    LoadState.error => const Text('Error'),
                    _ => Text(
                        'N${isVisible ? accountBalance : '****'}',
                        style: context.textTheme.s14w600.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                  }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalSpacing(61),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SmallButtonWidget(
                      onTap: () => context.pushNamed(BankScreen.routeName),
                      title: 'Fund wallet',
                      buttonColor: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
