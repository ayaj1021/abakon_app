import 'package:abakon/core/navigation/router.dart';
import 'package:abakon/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, c) {
          return MaterialApp(
            theme: AppThemes.lightTheme(),
            debugShowCheckedModeBanner: false,
            routes: AppRouter.routes,
            initialRoute: '/',
          );
        });
  }
}

