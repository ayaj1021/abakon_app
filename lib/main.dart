import 'package:abakon/core/navigation/router.dart';
import 'package:abakon/core/theme/app_theme.dart';
import 'package:abakon/firebase_options.dart';
import 'package:abakon/presentation/general_widgets/app_overlay.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("6f4849a8-6488-4e71-a7fa-66e663f984c2");
  OneSignal.Notifications.requestPermission(true);
//6f4849a8-6488-4e71-a7fa-66e663f984c2
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
