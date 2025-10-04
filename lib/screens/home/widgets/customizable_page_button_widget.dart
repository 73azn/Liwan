import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/theme/app_theme.dart';

class CustomizablePageButtonWidget extends StatelessWidget {
  const CustomizablePageButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.2.sw, 0, 0.2.sw, 0),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 15.w,
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
                // "تخصيص الصفحة"
                'customizable_page'.tr(),
                style: context.smallTextBold.copyWith(
                  color: AppTheme.secondary,
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
