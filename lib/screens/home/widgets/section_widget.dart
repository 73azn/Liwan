import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/home/controllers/category_item_controller.dart';
import 'package:hackthon/screens/home/widgets/category_button_widget.dart';
import 'package:hackthon/theme/app_theme.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.categoryItems,
  });

  final List<CategoryItem> categoryItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              return CategoryButtonWidget(
                svgIcon: category.svgIcon,
                label: category.label,
                onTap: () {},
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
