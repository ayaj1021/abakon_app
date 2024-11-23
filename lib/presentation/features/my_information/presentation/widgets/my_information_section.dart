import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/notifier/get_all_user_details_notifier.dart';
import 'package:abakon/presentation/features/my_information/presentation/widgets/my_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyInformationSection extends ConsumerStatefulWidget {
  const MyInformationSection({super.key});

  @override
  ConsumerState<MyInformationSection> createState() =>
      _MyInformationSectionState();
}

class _MyInformationSectionState extends ConsumerState<MyInformationSection> {
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
    final loadState =
        ref.watch(getUserDetailsNotifierProvider.select((v) => v.loadState));

    final data = ref.watch(getUserDetailsNotifierProvider
        .select((v) => v.getAllDetails.data?.allDetails));
    return SizedBox(
        child: switch (loadState) {
      LoadState.loading => const Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        )),
      LoadState.error => const Text('Error'),
      _ => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor)
        ),
        child: Column(
            children: [
              MyInformationWidget(
                icon: 'assets/icons/person.svg',
                informationHeader: 'Full name: ',
                information: '${data?.sFname} ${data?.sLname}',
              ),
              MyInformationWidget(
                icon: 'assets/icons/email.svg',
                informationHeader: 'Email: ',
                information: '${data?.sEmail}',
              ),
              MyInformationWidget(
                icon: 'assets/icons/phone.svg',
                informationHeader: 'Phone: ',
                information: '${data?.sPhone}',
              ),
              MyInformationWidget(
                icon: 'assets/icons/state_light_icon.svg',
                informationHeader: 'State: ',
                information: '${data?.sState}',
              ),
            ],
          ),
      ),
    });
  }
}
