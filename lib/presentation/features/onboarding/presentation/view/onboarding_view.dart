import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const routeName = '/onboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: Image.asset(
              'assets/images/onboarding_image.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary591E0C,
                  AppColors.primary591E0C.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
          ),
          const OnboardingDetailsWidget()
        ],
      ),
    );
  }
}
