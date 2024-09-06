import 'package:abakon/presentation/features/change_password/presentation/widget/change_password_header.dart';
import 'package:abakon/presentation/features/change_password/presentation/widget/change_password_section.dart';
import 'package:abakon/presentation/general_widgets/app_button.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const routeName = '/changePassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChangePasswordHeader(),
              const VerticalSpacing(32),
              const ChangePasswordSection(),
              const VerticalSpacing(300),
              AbakonSendButton(
                onTap: () {},
                title: 'Update Password',
              )
            ],
          ),
        ),
      )),
    );
  }
}
