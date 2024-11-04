import 'package:abakon/presentation/features/notification/presentation/widgets/notification_header_section.dart';
import 'package:abakon/presentation/features/notification/presentation/widgets/notification_list_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const routeName = '/notificationView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotificationHeaderSection(),
            VerticalSpacing(24),
            NotificationListSection(),
          ],
        ),
      )),
    );
  }
}
