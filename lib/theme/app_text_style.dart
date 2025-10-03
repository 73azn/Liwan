import 'package:flutter/material.dart';
import 'package:hackthon/theme/app_theme.dart';

abstract class AppTextStyle {
  static TextStyle heading1 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 56,
    color: AppTheme.white,
  );
  static TextStyle heading2 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 48,
    color: AppTheme.white,
  );
  static TextStyle heading3 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 40,
    color: AppTheme.white,
  );
  static TextStyle heading4 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 32,
    color: AppTheme.white,
  );
  static TextStyle heading5 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 24,
    color: AppTheme.white,
  );
  static TextStyle heading6 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 20,
    color: AppTheme.white,
  );

  ////////////////////////

  static TextStyle largeTextBold = TextStyle(
    fontFamily: 'Intel',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppTheme.white,
  );
  static TextStyle largeTextRegular = TextStyle(
    fontFamily: 'Intel',
    fontSize: 20,
    color: AppTheme.white,
  );

  static TextStyle mediumTextBold = TextStyle(
    fontFamily: 'Intel',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppTheme.white,
  );
  static TextStyle mediumTextRegular = TextStyle(
    fontFamily: 'Intel',
    fontSize: 18,
    color: AppTheme.white,
  );

  static TextStyle normalTextBold = TextStyle(
    fontFamily: 'Intel',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppTheme.white,
  );
  static TextStyle normalTextRegular = TextStyle(
    fontFamily: 'Intel',
    fontSize: 16,
    color: AppTheme.white,
  );

  static TextStyle smallTextBold = TextStyle(
    fontFamily: 'Intel',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppTheme.white,
  );
  static TextStyle smallTextRegular = TextStyle(
    fontFamily: 'Intel',
    fontSize: 14,
    color: AppTheme.white,
  );
}
