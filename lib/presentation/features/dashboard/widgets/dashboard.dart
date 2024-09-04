import 'package:abakon/core/theme/app_colors.dart';
import 'package:abakon/presentation/features/dashboard/airtime/presentation/view/airtime.dart';
import 'package:abakon/presentation/features/dashboard/data/presentation/view/data.dart';
import 'package:abakon/presentation/features/dashboard/home/presentation/view/home.dart';
import 'package:abakon/presentation/features/dashboard/profile/presentation/view/profile.dart';
import 'package:abakon/presentation/features/dashboard/support/presentation/view/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List pages = [
    const Airtime(),
    const Data(),
    const Home(),
    const Support(),
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
                height: 24.h,
                width: 24.w,
                child: const Icon(Icons.call),
              ),
              label: 'Airtime'),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: const Icon(Icons.network_cell_outlined),
              ),
              label: 'Data'),
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: const Icon(Icons.home)),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: const Icon(Icons.support_agent)),
              label: 'Reward'),
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: const Icon(Icons.person),
              ),
              label: 'Profile')
        ],
      ),
    );
  }
}
