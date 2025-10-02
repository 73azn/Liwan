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
