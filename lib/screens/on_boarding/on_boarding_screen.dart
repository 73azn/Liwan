import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/commons/widgets/primaryButtonDark.dart';
import 'package:hackthon/commons/widgets/primaryButtonLight.dart';
import 'package:hackthon/screens/on_boarding/controllers/page_view.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.5.sw,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              spacing: 3,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/img/logo.svg"),
                Text("title").tr(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.arrow_back_rounded), Text("skip").tr()],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [
              Container(
                height: 1.15.sw,
                child: PageView.builder(
                  onPageChanged: (value) {
                    PageViewItems.curPage = value;
                  },
                  controller: PageViewItems.controller,
                  itemCount: PageViewItems.pages.length,

                  itemBuilder: (context, index) {
                    return PageViewItems.pages[index];
                  },
                ),
              ),
              SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                  activeDotColor: AppTheme.secondary,
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: AppTheme.white,
                ),
                controller: PageViewItems.controller,
                count: PageViewItems.pages.length,
              ),
              SizedBox(height: 0.2.sw),
              PrimarybuttonDark(
                text: "next".tr(),
                onTap: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.white,
                  foregroundColor: AppTheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
