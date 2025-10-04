// In your splash_controller.dart file
import 'package:flutter/material.dart';

class SplashController {
  // Use a ValueNotifier to hold the state. It will notify listeners.
  static final ValueNotifier<int> curView = ValueNotifier(0);
}
