import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    HomeContent(), // Main home screen
    Center(child: Text('explore'.tr(), style: TextStyle(fontSize: 24))),
    Center(child: Text('community'.tr(), style: TextStyle(fontSize: 24))),
    Center(child: Text('customizable_page'.tr(), style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              // FlexiableSpace to cover all area in the AppBar
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // The image in the AppBar
                    image: AssetImage("assets/img/roshanCity.png"),
                    // Fit: BoxFit.cover so the image will cover all the AppBar Area
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      // %70 as req from Figma
                      AppTheme.primary.withValues(alpha: 0.7),
                      // BlendMode will blend the image and the color so both are shown in the same time and gives the effect of green scale
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ),
              // Set AppBar height to be %20 of the screen
              toolbarHeight: 0.2.sh,
            )
          : null,
      backgroundColor: AppTheme.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppTheme.gray1,
              blurRadius: 0.1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.person_outline,
                  label: 'main'.tr(),
                  index: 0,
                  isSelected: true,
                ),
                _buildNavItem(
                  icon: Icons.groups_outlined,
                  label: 'explore'.tr(),
                  index: 1,
                ),
                _buildNavItem(
                  icon: Icons.explore_outlined,
                  label: 'community'.tr(),
                  index: 2,
                ),
                _buildNavItem(
                  icon: Icons.home,
                  label: 'customizable_page'.tr(),
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    bool isSelected = false,
  }) {
    final bool selected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected ? AppTheme.primary : AppTheme.gray4,
              size: 24.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: selected ? AppTheme.primary : AppTheme.gray4,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Separate widget for home content
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController _pageController = PageController();
  Timer? _autoScrollTimer;
  int _currentPage = 0;

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
      _currentPage = (_currentPage + 1) % indicatorItems.length;
      _pageController.animateToPage(
        _currentPage,
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
    return SingleChildScrollView(
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
                  _currentPage = index;
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

          // Categories Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Title
                Text(
                  'sections'.tr(),
                  style: context.heading6.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.h),

                Wrap(
                  spacing: 12.w,
                  runSpacing: 12.h,
                  alignment: WrapAlignment.start,
                  children: categoryItems.map((category) {
                    return CategoryButton(
                      svgIcon: category.svgIcon,
                      label: category.label,
                      onTap: () {},
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),

          // (أخبار الحي) Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'neighborhood_news'.tr(),
                  style: context.heading6.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              // Horizontal scrollable news list
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: newsItems.length,
                  itemBuilder: (context, index) {
                    return NewsCard(newsItem: newsItems[index]);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),

          // Location Section (موقعك الحالي)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'current_location'.tr(),
                  style: context.heading6.copyWith(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.h),
                // Map image
                Container(
                  height: 125.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppTheme.gray2, width: 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      'assets/img/map.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.gray1,
                          child: Center(
                            child: Icon(
                              Icons.map,
                              size: 50.sp,
                              color: AppTheme.gray4,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                // "تخصيص الصفحة" button
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: AppTheme.secondary, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/img/edit.svg"),
                        SizedBox(width: 8.w),
                        Text(
                          'customizable_page'.tr(),
                          style: context.smallTextBold.copyWith(
                            color: AppTheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

// News Card Widget
class NewsCard extends StatelessWidget {
  final NewsItem newsItem;

  const NewsCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      margin: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppTheme.gray2, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 1, offset: Offset(0, 0)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Image with badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                child: Image.asset(
                  newsItem.image,
                  width: double.infinity,
                  height: 100.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100.h,
                      color: AppTheme.gray1,
                      child: Icon(Icons.image, color: AppTheme.gray4),
                    );
                  },
                ),
              ),
              // Badge
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    newsItem.badge,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem.title,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      newsItem.location,
                      style: TextStyle(fontSize: 11.sp, color: AppTheme.gray4),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      Icons.location_on,
                      size: 12.sp,
                      color: AppTheme.primary,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    newsItem.category,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Category Button Widget
class CategoryButton extends StatelessWidget {
  final String svgIcon;
  final String label;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.svgIcon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppTheme.gray2, width: 1),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 1, offset: Offset(0, 0)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SVG Icon Container
            Container(
              child: SvgPicture.asset(svgIcon, width: 45.w, height: 45.h),
            ),
            SizedBox(height: 5.h),
            // Label
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppTheme.primary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// Model class for indicator items
class IndicatorItem {
  final String image;
  final List<Color> gradient;

  IndicatorItem({required this.image, required this.gradient});
}

// Model class for category items with SVG
class CategoryItem {
  final String svgIcon;
  final String label;

  CategoryItem({required this.svgIcon, required this.label});
}

// Model class for news items
class NewsItem {
  final String image;
  final String title;
  final String location;
  final String category;
  final String badge;

  NewsItem({
    required this.image,
    required this.title,
    required this.location,
    required this.category,
    required this.badge,
  });
}
