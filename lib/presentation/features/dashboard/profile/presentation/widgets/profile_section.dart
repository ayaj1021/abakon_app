import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/widgets/profile_widget.dart';
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
          onTap: () {},
          icon: Icons.person,
        ),
        ProfileWidget(
          title: 'My Tranactions',
          onTap: () {},
          icon: Icons.swap_horiz_sharp,
        ),
        ProfileWidget(
          title: 'Change Password',
          onTap: () {},
          icon: Icons.lock_outline,
        ),
        ProfileWidget(
          title: 'Change Transaction Pin',
          onTap: () {},
          icon: Icons.pin,
        ),
        ProfileWidget(
          title: 'Support',
          onTap: () {},
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

