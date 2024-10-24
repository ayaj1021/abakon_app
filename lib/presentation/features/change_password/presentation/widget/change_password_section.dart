import 'package:abakon/presentation/general_widgets/digit_send_password_field.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ChangePasswordSection extends StatelessWidget {
  const ChangePasswordSection({super.key, required this.currentPasswordController, required this.newPasswordController, required this.confirmNewPasswordController});
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPasswordController;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        AbakonPasswordField(
          controller: currentPasswordController,
          hintText: 'Enter your current password',
          label: 'Current password',
        ),
        const VerticalSpacing(10),
        AbakonPasswordField(
          controller: newPasswordController,
          hintText: 'Enter your new password',
          label: 'new password',
        ),
        const VerticalSpacing(10),
        AbakonPasswordField(
          controller: confirmNewPasswordController,
          hintText: 'Confirm your new password',
          label: 'Confirm new password',
        ),
      ],
    );
  }
}
