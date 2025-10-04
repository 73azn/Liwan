import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/home/widgets/customizable_page_button_widget.dart';
import 'package:hackthon/theme/app_theme.dart';

class CurrentLocationWidget extends StatelessWidget {
  const CurrentLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          CustomizablePageButtonWidget(),
        ],
      ),
    );
  }
}
