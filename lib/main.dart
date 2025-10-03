import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/login/login_screen.dart';
import 'package:hackthon/screens/on_boarding/on_boarding_screen.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: Locale('ar'),
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
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        // home: Scaffold(body: Center(child: Text('amer World!'))),
        // home: LoginScreen(),
        // home: OnBoardingScreen(),
        home: Scaffold(
          body: Center(
            child: Text("السلام عليكم", style: context.mediumTextBold),
          ),
        ),
      ),
    );
  }
}
