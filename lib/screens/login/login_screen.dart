import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/commons/widgets/primaryButtonDark.dart';
import 'package:hackthon/commons/widgets/primaryButtonLight.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({super.key});

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  List<String> countryCode = [
    "🇸🇦 +966",
    "🇪🇬 +20",
    "🇦🇪 +971",
    "🇶🇦 +974",
    "🇰🇼 +965",
    "🇴🇲 +968",
    "🇧🇭 +973",
    "🇯🇴 +962",
    "🇱🇧 +961",
    "🇸🇾 +963",
    "🇮🇶 +964",
    "🇾🇪 +967",
    "🇲🇦 +212",
    "🇩🇿 +213",
    "🇹🇳 +216",
    "🇱🇾 +218",
    "🇺🇸 +1",
    "🇨🇦 +1",
    "🇬🇧 +44",
    "🇫🇷 +33",
    "🇩🇪 +49",
    "🇮🇹 +39",
    "🇪🇸 +34",
    "🇹🇷 +90",
    "🇮🇳 +91",
    "🇵🇰 +92",
    "🇧🇩 +880",
    "🇯🇵 +81",
    "🇨🇳 +86",
    "🇰🇷 +82",
    "🇮🇩 +62",
    "🇧🇷 +55",
    "🇲🇽 +52",
    "🇦🇷 +54",
    "🇿🇦 +27",
    "🇦🇺 +61",
    "🇳🇿 +64",
  ];
  String? selectedCountryCode = "🇸🇦 +966";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,

      // AppBar Area, where we have a logo and "ليوان" title
      appBar: AppBar(
        title: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 0.3.sw)),
            SvgPicture.asset("assets/img/logo.svg", height: 0.065.sh),
            Padding(padding: EdgeInsets.only(left: 0.0175.sw)),
            Text('title'.tr(), style: context.heading1),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 0.30.sw,
        backgroundColor: AppTheme.primary,
      ),

      // The middle House picture Area, where we have the house picture and "حياك في حيك" title
      body: SafeArea(
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
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            Spacer(),

            // Bottom Area, contain (المتابعة كضيف & تسجيل الدخول\إنشاء حساب)
            Padding(
              padding: EdgeInsets.fromLTRB(0.03.sw, 0, 0.03.sw, 0),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    builder: ((context) {
                      // "التسجيل" area, where you can input your phone number and signing in
                      return Container(
                        height: 0.45.sh,
                        width: 1.sh,

                        // Here are the all data when you press "التسجيل" button
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 0.02.sh)),
                            Text(
                              'registration'.tr(),
                              style: context.headlineSmall,
                            ),

                            // I have a problem here
                            Text(
                              'login_prompt'.tr(),
                              style: context.bodyMedium,
                              textAlign: TextAlign.right,
                            ),

                            Row(
                              children: [
                                // Here starts the Dropdown Button for countries
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: selectedCountryCode,
                                      isDense: true,
                                      items: countryCode
                                          .map(
                                            (toElement) =>
                                                DropdownMenuItem<String>(
                                                  value: toElement,
                                                  child: Text(toElement),
                                                ),
                                          )
                                          .toList(),
                                      onChanged: (toElement) => setState(
                                        () => selectedCountryCode = toElement,
                                      ),
                                      // Dropdown arrow == Does not do anything. It supposed to change the place of the arrow
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.white,
                  foregroundColor: AppTheme.primary, // Text on the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text('login_register'.tr()),
              ),
            ),

            // Space between  "المتابعة ضكيف" and "المتابعة كضيف & تسجيل الدخول\إنشاء حساب)" buttons
            Padding(padding: EdgeInsets.only(top: 0.04.sw)),

            // Clikable "المتابعة كضيف"
            InkWell(
              onTap: () {},
              child: Text(
                'continue_as_guest'.tr(),
                style: context.headlineSmall,
              ),
            ),

            // So it can have a space under "المتابعة كضيف"
            Padding(padding: EdgeInsets.only(top: 0.065.sw)),
          ],
        ),
      ),
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
                              decoration: BoxDecoration(
                                border: BoxBorder.all(color: AppTheme.gray2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
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

