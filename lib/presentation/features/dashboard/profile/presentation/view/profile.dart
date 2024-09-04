import 'package:abakon/presentation/features/dashboard/profile/presentation/widgets/profile_header_section.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/widgets/profile_section.dart';
import 'package:abakon/presentation/general_widgets/spacing.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            ProfileHeaderSection(),
            VerticalSpacing(32),
            ProfileSection()
          ],
        ),
      )),
    );
  }
}
