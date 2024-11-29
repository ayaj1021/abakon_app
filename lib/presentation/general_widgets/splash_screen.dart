// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:abakon/presentation/features/firebase_token/notifier/send_token_notifier.dart';
import 'package:abakon/presentation/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      sendToken();
    });
    Future.delayed(const Duration(seconds: 3), () async {
      final accessToken = await secureStorage.getUserAccessToken();

      if (accessToken != null) {
        context.pushReplacementNamed(Dashboard.routeName);
      } else {
        context.pushReplacementNamed(OnboardingScreen.routeName);
      }
    });
  }

  sendToken() async {
    await ref.read(sendTokenNotifier.notifier).sendToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  'assets/logo/abakon_icon.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
