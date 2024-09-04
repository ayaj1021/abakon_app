import 'package:abakon/core/extensions/text_theme_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
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

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
    this.iconColor,
    this.textColor,
  });
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        color: AppColors.primaryColor,
      ),
      title: Text(
        title,
        style: context.textTheme.s14w600.copyWith(
          color: textColor ?? AppColors.primary010101,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: iconColor ?? AppColors.primary595857,
        size: 14,
      ),
    );
  }
}
