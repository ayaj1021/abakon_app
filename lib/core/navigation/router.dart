

import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:abakon/presentation/features/sign_up/presentation/view/register_one.dart';
import 'package:abakon/presentation/general_widgets/splash_screen.dart';
import 'package:flutter/widgets.dart';


class AppRouter {
  static final Map<String, Widget Function(BuildContext)> _routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    RegisterOne.routeName: (context) => const RegisterOne(),
    Login.routeName: (context) => const Login(),
    OnboardingScreen.routeName: (context) => const OnboardingScreen(),
    // OTPVerification.routeName: (context) => const OTPVerification(),
   // Dashboard.routeName: (context) => const Dashboard(),


  };
  static Map<String, Widget Function(BuildContext)> get routes => _routes;
}
