import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/home/widgets/pageView.dart';
import 'package:hackthon/screens/on_boarding/widgets/views.dart';
import 'package:hackthon/theme/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 215.h,
              pinned: true,
              automaticallyImplyLeading: false,

              // Set the title for the collapsed bar to be empty.
              title: const Text(''),

              flexibleSpace: FlexibleSpaceBar(
                // ✅ 1. REMOVE the title property from here.
                // The background will now handle everything.
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Layer 1: Background Image & Overlay
                    Positioned.fill(
                      child: Image.asset(
                        "assets/img/roshanCity.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: AppTheme.primary.withOpacity(0.7),
                      ),
                    ),
                    // Layer 2: Your UI Content
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            // Top row with "welcome" and notification icon
                            Row(
                              // ✅ 2. SET MainAxisAlignment back to spaceBetween.
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // ✅ 3. ADD the "Welcome" Text WIDGET BACK.
                                // It will now stay here and fade with the background.
                                Row(
                                  spacing: 8,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/img/logo_green.svg",
                                    ),
                                    Text(
                                      "مرحباً طلال",
                                      style: context.heading6.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            // Main content card (This remains the same)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/img/sdra.svg",
                                  width: 50.w,
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        Text(
                                          "الرياض",
                                          style: context.smallTextBold,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.crop_square,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        Text(
                                          "سدرة 3",
                                          style: context.smallTextBold,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.house,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        Text(
                                          "منطقة ب",
                                          style: context.smallTextBold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: SizedBox(
                                    height: 139 - 0.1799,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.info,
                                              color: AppTheme.secondary,
                                            ),
                                            Text(
                                              "تنبيه",
                                              style: context.heading6.copyWith(
                                                color: AppTheme.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "هناك ازدحام في طريق المطار بسبب الإقبال على معرض الكتاب من الساعة 11 صباحاً إلى  12 صباحاً ",
                                          style: context.smallTextRegular,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // The rest of your page content
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          child: Container(
                            height: 0.40.sw,
                            child: PageView.builder(
                              itemCount: views.pgViews.length,
                              controller: views.pc,
                              itemBuilder: (BuildContext context, int index) {
                                return views.pgViews[index];
                              },
                            ),
                          ),
                        ),
                        SmoothPageIndicator(
                          effect: ExpandingDotsEffect(
                            activeDotColor: AppTheme.secondary,
                            dotHeight: 10,
                            dotWidth: 10,
                            dotColor: AppTheme.gray3,
                          ),
                          controller: views.pc,
                          count: views.pgViews.length,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 17,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "sections".tr(),
                                style: context.heading6.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.black,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              alignment: WrapAlignment.end,
                              children: views.wrap1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              spacing: 12,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      child: Text(
                                        "neighborhood_news",
                                        style: context.heading6.copyWith(
                                          color: AppTheme.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ).tr(),
                                    ),
                                  ],
                                ),
                                SingleChildScrollView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    spacing: 12,
                                    children: views.zones,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 24,
                                  ),
                                  child: Column(
                                    spacing: 12,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "موقغك الحالي",
                                            style: context.heading6.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Use a Stack to layer widgets on top of each other
                                      Stack(
                                        children: [
                                          // This is the bottom layer (the map image)

                                          // Outer container for border and padding
                                          Container(
                                            padding: const EdgeInsets.all(
                                              2,
                                            ), // Padding between border and image
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppTheme.secondary,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            // Inner container for the image
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              width: 1.sw,
                                              height: 147,
                                              decoration: BoxDecoration(
                                                // Match the outer radius to ensure the clip shape is correct
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      14,
                                                    ), // Slightly smaller radius
                                              ),
                                              child: Image.asset(
                                                "assets/img/map.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),

                                          // This is the top layer (the frame image)
                                        ],
                                      ),

                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 24,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Image.asset(
                                          "assets/img/Frame 2147238255.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                childCount: 1,
              ),
            ),
          ],
        ),
        backgroundColor: AppTheme.white,
      ),
    );
  }
}
