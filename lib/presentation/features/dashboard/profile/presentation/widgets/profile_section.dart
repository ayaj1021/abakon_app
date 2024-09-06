import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/change_password/presentation/view/change_password_view.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/view/change_transaction_pin_view.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/widgets/profile_widget.dart';
import 'package:abakon/presentation/features/my_information/presentation/view/my_information_page.dart';
import 'package:abakon/presentation/features/support/presentation/view/support_page.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileWidget(
          title: 'My Information',
          onTap: () {
            context.pushNamed(MyInformationPage.routeName);
          },
          icon: Icons.person,
        ),
        ProfileWidget(
          title: 'My Tranactions',
          onTap: () {},
          icon: Icons.swap_horiz_sharp,
        ),
        ProfileWidget(
          title: 'Change Password',
          onTap: () {
            context.pushNamed(ChangePasswordView.routeName);
          },
          icon: Icons.lock_outline,
        ),
        ProfileWidget(
          title: 'Change Transaction Pin',
          onTap: () {
            context.pushNamed(ChangeTransactionPinView.routeName);
          },
          icon: Icons.pin,
        ),
        ProfileWidget(
          title: 'Support',
          onTap: () {
            context.pushNamed(SupportPage.routeName);
          },
          icon: Icons.support_agent_outlined,
        ),
        ProfileWidget(
          title: 'Log out',
          onTap: () {},
          icon: Icons.logout,
          iconColor: Colors.transparent,
        ),
        ProfileWidget(
          title: 'Delete account',
          textColor: AppColors.primaryColor,
          onTap: () {},
          icon: Icons.delete_forever_outlined,
          iconColor: Colors.transparent,
        ),
      ],
    );
  }
}
