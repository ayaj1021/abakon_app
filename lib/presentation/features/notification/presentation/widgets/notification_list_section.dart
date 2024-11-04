import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/notification/presentation/notifier/get_all_notification_notifier.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationListSection extends ConsumerStatefulWidget {
  const NotificationListSection({super.key});

  @override
  ConsumerState<NotificationListSection> createState() =>
      _NotificationListSectionState();
}

class _NotificationListSectionState
    extends ConsumerState<NotificationListSection> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref
          .read(getAllNotificationServiceNotifierProvider.notifier)
          .getAllNotificationService();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadState = ref.watch(
        getAllNotificationServiceNotifierProvider.select((v) => v.loadState));

    final notification = ref.watch(getAllNotificationServiceNotifierProvider
        .select((v) => v.getAllNotificationService.data?.data));
    return SizedBox(
        child: switch (loadState) {
      LoadState.loading => const Center(
            child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        )),
      LoadState.error => const Text('Error'),
      _ => Column(
          children: List.generate(
            notification!.length,
            (index) {
              final data = notification[index];
              return NotificationWidget(
                icon: 'assets/icons/message.svg',
                notificationTitle: '${data.subject}',
                notificationDecription: '${data.message}',
              );
            },
          ),
        ),
    });
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget(
      {super.key,
      required this.icon,
      required this.notificationTitle,
      required this.notificationDecription});
  final String icon;
  final String notificationTitle;
  final String notificationDecription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: AppColors.primary4A89DC,
                  borderRadius: BorderRadius.circular(4)),
              child: SvgPicture.asset(icon),
            ),
            const HorizontalSpacing(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notificationTitle,
                  style: context.textTheme.s12w600.copyWith(
                    color: AppColors.black,
                  ),
                ),
                SizedBox(
                  width: 270.w,
                  child: Text(
                    notificationDecription,
                    style: context.textTheme.s8w500.copyWith(
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            )
          ],
        ),
        const VerticalSpacing(3),
        const Divider(
          color: AppColors.primaryE6E2E0,
        )
      ],
    );
  }
}
