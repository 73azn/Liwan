import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/commons/widgets/primaryButtonDark.dart';
import 'package:hackthon/commons/widgets/primaryButtonLight.dart';
import 'package:hackthon/screens/login/widgets/number.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                onTap: () {},
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
                  PrimarybuttonLight(text: "next_sign".tr(), onTap: () {}),

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

// Old code:
/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/primaryButtonLight.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: AppBar(
        title: Column(
          children: [SvgPicture.asset("assets/img/logo.svg"), Text("title")],
        ),
        centerTitle: true,
        toolbarHeight: 0.60.sw,
        backgroundColor: AppTheme.primary,
      ),
      body: SafeArea(
        // child: Container(
        //   height: 500,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(Radius.circular(30)),
        //     color: AppTheme.white,
        //   ),

        // ),
        child: Container(
          width: double.infinity,
          height: 2.sw,

          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 41, right: 41, top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("register"),
                Text("register_des"),
                Text("number"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("enter_number"),
                    Container(
                      width: 1.sw,
                      height: 80,
                      child: Row(
                        spacing: 8,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                showDragHandle: true,
                                context: context,
                                builder: (context) {
                                  return Container(height: 2.sw);
                                },
                              );
                            },
                            child: Container(
                              height: 45,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: BoxBorder.all(color: AppTheme.gray2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text("🇸🇦+966"),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              height: 45,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: 
                              child: TextField(
                                keyboardType: TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1.sw,
                      height: 50,
                      child: PrimarybuttonLight(
                        text: "continue",
                        onTap: () {
                          print("ss");
                        },
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Divider(
                    //         endIndent: 10,
                    //         color: AppTheme.gray1,
                    //         indent: 20,
                    //       ),
                    //     ),
                    //     Text("or"),
                    //     Expanded(
                    //       child: Divider(
                    //         indent: 10,
                    //         color: AppTheme.gray1,
                    //         endIndent: 20,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
