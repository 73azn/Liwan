import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle heading1 = TextStyle(fontFamily: 'Tajawal', fontSize: 56);
  static TextStyle heading2 = TextStyle(fontFamily: 'Tajawal', fontSize: 48);
  static TextStyle heading3 = TextStyle(fontFamily: 'Tajawal', fontSize: 40);
  static TextStyle heading4 = TextStyle(fontFamily: 'Tajawal', fontSize: 32);
  static TextStyle heading5 = TextStyle(fontFamily: 'Tajawal', fontSize: 24);
  static TextStyle heading6 = TextStyle(fontFamily: 'Tajawal', fontSize: 20);

  ////////////////////////

  static TextStyle largeTextBold = TextStyle(
    fontFamily: 'Intel',
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle largeTextRegular = TextStyle(
    fontFamily: 'Intel',
    fontSize: 20,
  );

  static TextStyle mediumTextBold = TextStyle(
    fontFamily: 'Intel',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle mediumTextRegular = TextStyle(
    fontFamily: 'Intel',
    fontSize: 18,
  );

  static TextStyle normalTextBold = TextStyle(
    fontFamily: 'Intel',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle normalTextRegular = TextStyle(
    fontFamily: 'Intel',
    fontSize: 16,
  );

  static TextStyle smallTextBold = TextStyle(
    fontFamily: 'Intel',
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle smallTextRegular = TextStyle(
    fontFamily: 'Intel',
    fontSize: 14,
  );
}
