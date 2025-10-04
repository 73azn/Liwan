import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/home/controllers/category_item_controller.dart';
import 'package:hackthon/screens/home/controllers/indicator_item_controller.dart';
import 'package:hackthon/screens/home/controllers/news_item_controller.dart';
import 'package:hackthon/screens/home/widgets/app_bar_widget.dart';
import 'package:hackthon/screens/home/widgets/category_button_widget.dart';
import 'package:hackthon/screens/home/widgets/current_location_widget.dart';
import 'package:hackthon/screens/home/widgets/customizable_page_button_widget.dart';
import 'package:hackthon/screens/home/widgets/neighborhood_new_widget.dart';
import 'package:hackthon/screens/home/widgets/news_card_widget.dart';
import 'package:hackthon/screens/home/widgets/section_widget.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  Timer? _autoScrollTimer;
  int currentPage = 0;

  // List of Indicator items
  final List<IndicatorItem> indicatorItems = [
    IndicatorItem(
      image: 'assets/img/roshn_sedra.png',
      gradient: [Color(0xFF1a4d3a), Color(0xFF0d2620)],
    ),
    IndicatorItem(
      image: 'assets/img/book_fair.png',
      gradient: [Color(0xFF8B4513), Color(0xFF654321)],
    ),
    IndicatorItem(
      image: 'assets/img/soundstorm.png',
      gradient: [Color(0xFF1a4d3a), Color(0xFF0d2620)],
    ),
  ];

  final List<CategoryItem> categoryItems = [
    CategoryItem(svgIcon: 'assets/img/services.svg', label: 'services'.tr()),
    CategoryItem(svgIcon: 'assets/img/health.svg', label: 'health'.tr()),
    CategoryItem(svgIcon: 'assets/img/education.svg', label: 'education'.tr()),
    CategoryItem(
      svgIcon: 'assets/img/entertainment.svg',
      label: 'entertainment'.tr(),
    ),
    CategoryItem(
      svgIcon: 'assets/img/daily_needs.svg',
      label: 'daily_needs'.tr(),
    ),
  ];

  // News items
  final List<NewsItem> newsItems = [
    NewsItem(
      image: 'assets/img/padel.png',
      title: 'إفتتاح ملعب بادل',
      location: 'منطقة أ',
      category: 'الصحة والرياضة',
      badge: 'جديد',
    ),
    NewsItem(
      image: 'assets/img/entertainment_zone.png',
      title: 'منطقة ترفيهية جديدة',
      location: 'منطقة ب',
      category: 'الترفيه والفعاليات',
      badge: 'جديد',
    ),
    NewsItem(
      image: 'assets/img/internet.png',
      title: 'تدشين خدمة إنترنت',
      location: 'منطقة ج',
      category: 'الخدمات',
      badge: 'جديد',
    ),
    NewsItem(
      image: 'assets/img/library.png',
      title: 'إفتتاح مكتبة سدرة',
      location: 'المنطقة المركزية',
      category: 'التعليم والثقافة',
      badge: 'جديد',
    ),
    NewsItem(
      image: 'assets/img/cafe.png',
      title: 'مقهى جديد',
      location: 'منطقة أ',
      category: 'الإحتياجات اليومية',
      badge: 'جديد',
    ),
    NewsItem(
      image: 'assets/img/health_center.png',
      title: 'إفتتاح مركز صحي ضخم',
      location: 'منطقة ب',
      category: 'الصحة والرياضة',
      badge: 'جديد',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 6), (timer) {
      if (!mounted) return;
      currentPage = (currentPage + 1) % indicatorItems.length;
      _pageController.animateToPage(
        currentPage,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: AppTheme.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 20.h),
            // Indicator
            SizedBox(
              height: 150.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: indicatorItems.length,
                padEnds: false,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: LinearGradient(
                          colors: indicatorItems[index].gradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          indicatorItems[index].image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.image,
                                size: 50.sp,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            // Page Indicator
            Center(
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
            ),
            SizedBox(height: 32.h),

            // Categories Section:
            // Section Area (الأقسام)
            SectionWidget(categoryItems: categoryItems),
            SizedBox(height: 32.h),

            // (أخبار الحي) Section
            NeighborhoodNewWidget(newsItems: newsItems),
            SizedBox(height: 32.h),

            // Location Section (موقعك الحالي)
            CurrentLocationWidget(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
