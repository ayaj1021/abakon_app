import 'package:abakon/core/navigation/router.dart';
import 'package:abakon/core/theme/app_theme.dart';
import 'package:abakon/presentation/general_widgets/app_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = OverLayController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, c) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: AppOverLay(
                controller: _controller,
                child: MaterialApp(
                  theme: AppThemes.lightTheme(),
                  debugShowCheckedModeBanner: false,
                  routes: AppRouter.routes,
                  initialRoute: '/',
                ),
              ),
            ),
          );
        });
  }
}
