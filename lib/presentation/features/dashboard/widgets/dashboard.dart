import 'package:abakon/core/extensions/build_context_extension.dart';
import 'package:abakon/core/extensions/overlay_extension.dart';
import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/core/utils/enums.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/view/airtime.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/view/data.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/view/home.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/notifier/log_out_notifier.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/view/profile.dart';
import 'package:abakon/presentation/features/dashboard/reward/presentation/view/reward.dart';
import 'package:abakon/presentation/features/login/presentation/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});
  static const routeName = '/dashboard';

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  List pages = [
    const Airtime(),
    const Data(),
    const Home(),
    const Reward(),
    const Profile()
  ];

  int selectedIndex = 2;

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(logOutNotifer, (previous, next) {
      if (next.homeSessionState == HomeSessionState.logout) {
        context
          ..replaceNamed(Login.routeName)
          ..showSuccess(
            title: 'Session ended',
            message: 'Kindly login to continue',
          );
      }
    });
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 10,
        selectedItemColor: AppColors.primaryColor,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (index) {
          changePage(index);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 20.h,
                width: 20.w,
                child:
                    SvgPicture.asset('assets/icons/airtime_outline_icon.svg'),
              ),
              label: 'Airtime'),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 17.h,
                width: 17.w,
                child: SvgPicture.asset('assets/icons/data_outline_icon.svg'),
              ),
              label: 'Data'),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: const Icon(Icons.home),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset('assets/icons/reward_icon.svg')),
              label: 'Reward'),
          BottomNavigationBarItem(
              // activeIcon: Container(
              //   height: 30,
              //   color: AppColors.primaryColor,
              // ),
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: SvgPicture.asset('assets/icons/profile_icon.svg'),
              ),
              label: 'Profile')
        ],
      ),
    );
  }
}
