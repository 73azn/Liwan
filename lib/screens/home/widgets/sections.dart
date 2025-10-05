import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/theme/app_theme.dart';

class Sections extends StatelessWidget {
  // 1. Define final variables for the icon and label.
  final String path;
  final String label;
  Function() onTap;

  // 2. Require them in the constructor.
  Sections({
    super.key,
    required this.path,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.gray2),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        width: 150,
        height: 150,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 27),
        child: Column(
          spacing: 13,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(path),
            Text(
              label,
              style: context.smallTextBold.copyWith(
                color: AppTheme.primary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
