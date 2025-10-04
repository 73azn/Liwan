import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/screens/home/controllers/indicator_item_controller.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    super.key,
    required PageController pageController,
    required this.indicatorItems,
  }) : _pageController = pageController;

  final PageController _pageController;
  final List<IndicatorItem> indicatorItems;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: _pageController,
        count: indicatorItems.length,
        effect: ExpandingDotsEffect(
          activeDotColor: AppTheme.secondary,
          dotColor: AppTheme.gray4,
          dotHeight: 8.h,
          dotWidth: 8.w,
          expansionFactor: 3,
        ),
      ),
    );
  }
}
