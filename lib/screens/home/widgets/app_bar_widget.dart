import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackthon/theme/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      );
  }
  @override
  Size get preferredSize => Size.fromHeight(0.2.sh);
}
