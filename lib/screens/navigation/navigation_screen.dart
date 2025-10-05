import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/navigation/controllers/pages.dart';
import 'package:hackthon/theme/app_theme.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppTheme.primary,
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedLabelStyle: context.smallTextBold,
        unselectedLabelStyle: context.smallTextRegular.copyWith(
          color: AppTheme.gray1,
        ),
        unselectedItemColor: AppTheme.gray2,

        onTap: (value) {
          _selectedIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            // The icon when it's NOT selected
            icon: SvgPicture.asset(
              "assets/img/home-2.svg",
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),

            // ✨ The icon when it IS selected
            activeIcon: SvgPicture.asset(
              "assets/img/home-2_active.svg",
              colorFilter: ColorFilter.mode(AppTheme.primary, BlendMode.srcIn),
            ),
            label: "main".tr(), // It's good practice to have labels
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/img/search-normal.svg",
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset("assets/img/search-normal_active.svg"),
            label: "explore".tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/img/people.svg",
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              "assets/img/people_active.svg",
              colorFilter: ColorFilter.mode(AppTheme.primary, BlendMode.srcIn),
            ),
            label: "community".tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/img/user.svg",
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              "assets/img/user_active.svg",
              colorFilter: ColorFilter.mode(AppTheme.primary, BlendMode.srcIn),
            ),
            label: "profile".tr(),
          ),
        ],
      ),
      body: Pages.pages[_selectedIndex],
    );
  }
}
