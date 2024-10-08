import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeaderSection extends ConsumerStatefulWidget {
  const HomeHeaderSection({super.key});

  @override
  ConsumerState<HomeHeaderSection> createState() => _HomeHeaderSectionState();
}

class _HomeHeaderSectionState extends ConsumerState<HomeHeaderSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getUserDetailsNotifierProvider.notifier)
          .getAllUserDetails();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final loadState =
          ref.watch(getUserDetailsNotifierProvider.select((v) => v.loadState));

      final firstName = ref.watch(getUserDetailsNotifierProvider
          .select((v) => v.getAllDetails.data?.allDetails?.sFname));

      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: switch (loadState) {
            LoadState.loading => const Center(child: Text('')),
            LoadState.error => const Text('Error'),
            _ => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Welcome $firstName 👋',
                        style: context.textTheme.s20w700.copyWith(
                          color: AppColors.black,
                        ),
                      )
                    ],
                  ),
                  const Icon(Icons.notifications_outlined),
                ],
              ),
          });
    });
  }
}
