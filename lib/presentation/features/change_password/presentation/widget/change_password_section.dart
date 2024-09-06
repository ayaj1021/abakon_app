import 'package:abakon/presentation/general_widgets/digit_send_password_field.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ChangePasswordSection extends StatelessWidget {
  const ChangePasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AbakonPasswordField(
          hintText: 'Enter your current password',
          label: 'Current password',
        ),
        VerticalSpacing(10),
        AbakonPasswordField(
          hintText: 'Enter your new password',
          label: 'new password',
        ),
        VerticalSpacing(10),
        AbakonPasswordField(
          hintText: 'Confirm your new password',
          label: 'Confirm new password',
        ),
      ],
    );
  }
}
