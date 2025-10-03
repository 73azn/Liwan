import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
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
        toolbarHeight: 0.40.sw,
        centerTitle: true,
        title: Column(
          children: [
            Row(
              spacing: 3,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/img/logo.svg", height: 54.8),
                Text(
                  "title",
                  style: context.heading4.copyWith(fontWeight: FontWeight.bold),
                ).tr(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (PageViewItems.curPage > 0
                    ? TextButton(
                        onPressed: () {
                          PageViewItems.curPage > 0
                              ? PageViewItems.curPage -= 1
                              : null;
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          "assets/img/arrow-left.svg",
                          width: 35,
                          height: 35,
                        ),
                      )
                    : SizedBox(width: 35, height: 35)),
                TextButton(
                  onPressed: () {
                    //TODO nav to login screen
                  },
                  child: Text(
                    "skip",
                    style: context.normalTextBold.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppTheme.white,
                    ),
                  ).tr(),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),

                child: Container(
                  key: ValueKey(PageViewItems.curPage),
                  child: PageViewItems.pages[PageViewItems.curPage],
                ),
              ),
              // AnimatedSwitcher(
              //   duration: const Duration(milliseconds: 2000),

              //   // The child is now directly the page you want to show.
              //   // When 'PageViewItems.curPage' changes, AnimatedSwitcher detects
              //   // a new child and animates the transition.

              //   // ✨ IMPORTANT: Add a unique key!
              //   // This tells the AnimatedSwitcher that the widget is actually
              //   // different and that it needs to run the animation.
              //   key: ValueKey<int>(PageViewItems.curPage),

              //   // (Optional) Define a custom transition, like a slide.
              //   transitionBuilder: (Widget child, Animation<double> animation) {
              //     return FadeTransition(opacity: animation, child: child);
              //   },
              //   child: PageViewItems.pages[PageViewItems.curPage],
              // ),
              SizedBox(height: 21),
              // SmoothPageIndicator(

              //   controller: PageViewItems.controller,
              //   count: PageViewItems.pages.length,
              // ),
              AnimatedSmoothIndicator(
                activeIndex: PageViewItems.curPage,
                count: PageViewItems.pages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppTheme.secondary,
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: AppTheme.white,
                ),
              ),
              SizedBox(height: 0.1.sw),
              PrimarybuttonDark(
                text: "next".tr(),
                onTap: () {
                  setState(() {
                    PageViewItems.curPage < 2
                        ? PageViewItems.curPage += 1
                        : null;
                  });
                },
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
