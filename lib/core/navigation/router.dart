import 'package:abakon/presentation/features/bank_deposits/presentation/view/banks.dart';
import 'package:abakon/presentation/features/cable/presentation/view/cable_screen.dart';
import 'package:abakon/presentation/features/change_password/presentation/view/change_password_view.dart';
import 'package:abakon/presentation/features/change_transaction_pin/presentation/view/change_transaction_pin_view.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/view/reward.dart';
import 'package:abakon/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:abakon/presentation/features/electricity/presentation/view/electricity_view.dart';
import 'package:abakon/presentation/features/exam_pin/presentation/view/exam_pin.dart';
import 'package:abakon/presentation/features/login/presentation/view/forgot_password.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:abakon/presentation/features/my_information/presentation/view/my_information_page.dart';
import 'package:abakon/presentation/features/notification/presentation/view/notification_view.dart';
import 'package:abakon/presentation/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:abakon/presentation/features/other_services/presentation/view/other_services_screen.dart';
import 'package:abakon/presentation/features/sign_up/presentation/view/register_one.dart';
import 'package:abakon/presentation/features/support/presentation/view/support_page.dart';
import 'package:abakon/presentation/features/transactions/presentation/view/transaction_view.dart';
import 'package:abakon/presentation/general_widgets/splash_screen.dart';
import 'package:flutter/widgets.dart';

class AppRouter {
  static final Map<String, Widget Function(BuildContext)> _routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    RegisterOne.routeName: (context) => const RegisterOne(),
    Login.routeName: (context) => const Login(),
    OnboardingScreen.routeName: (context) => const OnboardingScreen(),
    ForgotPasswordView.routeName: (context) => const ForgotPasswordView(),
    // OTPVerification.routeName: (context) => const OTPVerification(),
    Dashboard.routeName: (context) => const Dashboard(),
    
    SupportPage.routeName: (context) => const SupportPage(),
    MyInformationPage.routeName: (context) => const MyInformationPage(),
    ChangePasswordView.routeName: (context) => const ChangePasswordView(),
    ChangeTransactionPinView.routeName: (context) =>
        const ChangeTransactionPinView(),
    CableScreen.routeName: (context) => const CableScreen(),
    OtherServicesScreen.routeName: (context) => const OtherServicesScreen(),
    ElectricityView.routeName: (context) => const ElectricityView(),
    ExamPinScreen.routeName: (context) => const ExamPinScreen(),
    BankScreen.routeName: (context) => const BankScreen(),
    TransactionView.routeName: (context) => const TransactionView(),
    NotificationView.routeName: (context) => const NotificationView(),
    Reward.routeName: (context) => const Reward(),
    // TransactionDetailsView.routeName: (context) =>
    //     const TransactionDetailsView(),
  };
  static Map<String, Widget Function(BuildContext)> get routes => _routes;
}
