import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/theme/app_theme.dart';

class CategoryButtonWidget extends StatelessWidget {
  final String svgIcon;
  final String label;
  final VoidCallback onTap;

  const CategoryButtonWidget({
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
