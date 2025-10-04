import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/screens/home/home_screen.dart';
import 'package:hackthon/theme/app_theme.dart';

class BotNavigationBarScreen extends StatefulWidget {
  const BotNavigationBarScreen({super.key});

  @override
  State<BotNavigationBarScreen> createState() => _BotNavigationBarState();
}

class _BotNavigationBarState extends State<BotNavigationBarScreen> {
  int selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> screens = [
    HomeScreen(), // Main home screen
    Center(child: Text('explore'.tr(), style: TextStyle(fontSize: 24))),
    Center(child: Text('community'.tr(), style: TextStyle(fontSize: 24))),
    Center(
      child: Text('customizable_page'.tr(), style: TextStyle(fontSize: 24)),
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.gray1,
              blurRadius: 0.1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(
                  icon: Icons.person_outline,
                  label: 'main'.tr(),
                  index: 0,
                  isSelected: true,
                ),
                buildNavItem(
                  icon: Icons.groups_outlined,
                  label: 'explore'.tr(),
                  index: 1,
                ),
                buildNavItem(
                  icon: Icons.explore_outlined,
                  label: 'community'.tr(),
                  index: 2,
                ),
                buildNavItem(
                  icon: Icons.home,
                  label: 'customizable_page'.tr(),
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    bool isSelected = false,
  }) {
    final bool selected = selectedIndex == index;
    return InkWell(
      onTap: () => onItemTapped(index),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected ? AppTheme.primary : AppTheme.gray4,
              size: 24.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: selected ? AppTheme.primary : AppTheme.gray4,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
