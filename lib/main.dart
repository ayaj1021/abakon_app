import 'dart:developer';

import 'package:abakon/core/navigation/router.dart';
import 'package:abakon/core/notification_service/notification_service.dart';
import 'package:abakon/core/theme/app_theme.dart';
import 'package:abakon/firebase_options.dart';
import 'package:abakon/presentation/general_widgets/app_overlay.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

//function to listen to background changes
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    log('Some notification received in background');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'com.abakon.app',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //initialize firebase messaging
  await PushNotifications.init();
  //initialize local notificatio
  await PushNotifications.localNotificationInit();
//Listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("ae8d7353-6707-42ee-8637-0185ba1d46b7");

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
