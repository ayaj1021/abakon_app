// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/data/local_data_source/local_storage_impl.dart';
import 'package:abakon/presentation/features/dashboard/widgets/dashboard.dart';
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
    Timer(const Duration(seconds: 3), () async {
      final token = await secureStorage.getUserToken();
      final accessToken = await secureStorage.getUserAccessToken();

      log('token is ${token.toString()}');
      log('accesstoken is ${accessToken.toString()}');
      if (accessToken != null) {
        context.pushReplacementNamed(Dashboard.routeName);
      } else {
        context.pushReplacementNamed(OnboardingScreen.routeName);
      }
    });
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
                  'assets/logo/abakon_logo.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
