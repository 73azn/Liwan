import 'package:flutter/material.dart';
import 'package:hackthon/theme/app_text_style.dart';

extension ContextExtension on BuildContext {
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  ColorScheme get colors => Theme.of(this).colorScheme;

  //main features needed for our coustome fonts

  TextStyle get heading1 => AppTextStyle.heading1;
  TextStyle get heading2 => AppTextStyle.heading2;
  TextStyle get heading3 => AppTextStyle.heading3;
  TextStyle get heading4 => AppTextStyle.heading4;
  TextStyle get heading5 => AppTextStyle.heading5;
  TextStyle get heading6 => AppTextStyle.heading6;

  TextStyle get largeTextBold => AppTextStyle.largeTextBold;
  TextStyle get largeTextRegular => AppTextStyle.largeTextRegular;

  TextStyle get mediumTextRegular => AppTextStyle.mediumTextRegular;
  TextStyle get mediumTextBold => AppTextStyle.mediumTextBold;

  TextStyle get normalTextRegular => AppTextStyle.normalTextRegular;
  TextStyle get normalTextBold => AppTextStyle.normalTextBold;

  TextStyle get smallTextRegular => AppTextStyle.smallTextRegular;
  TextStyle get smallTextBold => AppTextStyle.smallTextBold;
}
