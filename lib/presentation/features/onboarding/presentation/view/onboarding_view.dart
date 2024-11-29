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
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              // height: height,
              // width: width,
              child: Image.asset(
                'assets/images/onboard_image.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const OnboardingDetailsWidget()
        ],
      ),
    );
  }
}
