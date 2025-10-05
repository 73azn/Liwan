import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/commons/widgets/primaryButtonDark.dart';
import 'package:hackthon/commons/widgets/primaryButtonLight.dart';
import 'package:hackthon/screens/login/widgets/number.dart';
import 'package:hackthon/screens/login/widgets/pinput.dart';
import 'package:hackthon/screens/navigation/navigation_screen.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,

      // AppBar Area, where we have a logo and "ليوان" title
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/img/logo.svg", height: 54.8, width: 54.8),
            Text(
              'title'.tr(),
              style: context.heading3.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 0.30.sw,
        backgroundColor: AppTheme.primary,
      ),

      // The middle House picture Area, where we have the house picture and "حياك في حيك" title
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Middle Area contain (House picture & حياك في حيك)
              Padding(padding: EdgeInsets.fromLTRB(1.sw, 0.1.sh, 0, 0)),
              SvgPicture.asset(
                "assets/img/homeIllustration.svg",
                height: 0.28.sh,
              ),
              Text(
                'greeting'.tr(),
                style: context.heading3.copyWith(fontWeight: FontWeight.bold),
              ),

              Spacer(),

              // Bottom Area, contain (المتابعة كضيف & تسجيل الدخول\إنشاء حساب)
              PrimarybuttonDark(
                text: "login_register".tr(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.white,
                ),
                onTap: () {
                  loginBottomSheet(context);
                },
              ),

              // Space between  "المتابعة ضكيف" and "المتابعة كضيف & تسجيل الدخول\إنشاء حساب)" buttons
              Padding(padding: EdgeInsets.only(top: 0.04.sw)),

              // Clikable "المتابعة كضيف"
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (builder) => NavigationScreen()),
                  );
                },
                child: Text(
                  'continue_as_guest'.tr(),
                  style: context.heading6.copyWith(fontWeight: FontWeight.bold),
                ),
              ),

              // So it can have a space under "المتابعة كضيف"
              Padding(padding: EdgeInsets.only(top: 0.065.sw)),
            ],
          ),
        ),
      ),
    );
  }

  //login bottom sheet
  Future<dynamic> loginBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      // 1. Allow the sheet to take up more than half the screen height.
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        // 2. Add padding to the bottom that matches the keyboard's height.
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            // 3. Make the content scrollable
            child: Container(
              width: 1.sw,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // Use mainAxisSize.min to make the column only as tall as its children
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "register".tr(),
                        style: context.heading4.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.black,
                        ),
                      ),
                      Text(
                        "register_des".tr(),
                        style: context.smallTextBold.copyWith(
                          color: AppTheme.gray2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ), // Use SizedBox instead of a spacing property
                  Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "number".tr(),
                        style: context.smallTextBold.copyWith(
                          color: AppTheme.black,
                        ),
                      ),
                      NumberView(),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/img/message-question.svg"),
                      Text(
                        "support_info",
                        style: context.smallTextBold.copyWith(
                          color: AppTheme.black,
                        ),
                      ).tr(),
                      TextButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                        ),
                        onPressed: () {},
                        child: Text(
                          "support_click",
                          style: context.smallTextBold.copyWith(
                            color: AppTheme.secondary,
                          ),
                        ).tr(),
                      ),
                    ],
                  ),
                  PrimarybuttonLight(
                    text: "next_sign".tr(),
                    onTap: () {
                      AuthAndRigester(context);
                    },
                  ),

                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> AuthAndRigester(BuildContext context) {
    return showModalBottomSheet(
      showDragHandle: true,
      context: context,
      // 1. Allow the sheet to be scrollable and resize
      isScrollControlled: true,
      builder: (_) {
        // 2. Add padding that adjusts to the keyboard height
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // 3. (Optional but recommended) Wrap with a scroll view
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "auth".tr(),
                        style: context.heading4.copyWith(
                          color: AppTheme.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "auth_des".tr(),
                        style: context.smallTextBold.copyWith(
                          color: AppTheme.gray3,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: PinPutWtimer(),
                  ),
                  Column(
                    children: [
                      Text(
                        "resend".tr(),
                        style: context.mediumTextBold.copyWith(
                          color: AppTheme.secondary,
                        ),
                      ),
                      PrimarybuttonLight(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => NavigationScreen(),
                            ),
                          );
                        },
                        text: "next_sign".tr(),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
