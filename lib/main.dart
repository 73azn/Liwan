import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/home/home_screen.dart';
import 'package:hackthon/screens/login/login_screen.dart';
import 'package:hackthon/screens/navigation/navigation_screen.dart';
import 'package:hackthon/screens/on_boarding/on_boarding_screen.dart';
import 'package:hackthon/screens/splash/splash_screen.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/lang',
      startLocale: Locale('ar'),
      saveLocale: true,

      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        // home: Scaffold(body: Center(child: Text('amer World!'))),
        // home: AnotherScreen(),
        // home: OnBoardingScreen(),
        // home: Scaffold(
        //   body: Center(
        //     child: Text("السلام عليكم", style: context.mediumTextBold),
        //   ),
        // home: SplashScreen(),
        // home: LoginScreen(),
        home: NavigationScreen(),
        // home: SplashScreen(),
      ),
    );
  }
}
