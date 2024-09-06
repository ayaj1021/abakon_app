import 'package:abakon/presentation/features/support/presentation/widgets/support_functions.dart';
import 'package:abakon/presentation/features/support/presentation/widgets/support_type_widget.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SupportTypeWidget(
          supportType: 'Call:',
          supportTypeImage: 'assets/icons/phone_icon.svg',
          supportTypeContent: '09022193069',
          onTap: () => makePhoneCall('09022193069'),
        ),
        const VerticalSpacing(20),
        SupportTypeWidget(
          onTap: () => mailSupport(),
          supportType: 'Email:',
          supportTypeImage: 'assets/icons/email_icon.svg',
          supportTypeContent: 'support@abakon.ng',
        )
      ],
    );
  }
}
