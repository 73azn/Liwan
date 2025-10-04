import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/home/controllers/news_item_controller.dart';
import 'package:hackthon/screens/home/widgets/news_card_widget.dart';
import 'package:hackthon/theme/app_theme.dart';

class NeighborhoodNewWidget extends StatelessWidget {
  const NeighborhoodNewWidget({
    super.key,
    required this.newsItems,
  });

  final List<NewsItem> newsItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'neighborhood_news'.tr(),
            style: context.heading6.copyWith(
              color: AppTheme.black,
              fontWeight: FontWeight.w600,
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
    );
  }
}
