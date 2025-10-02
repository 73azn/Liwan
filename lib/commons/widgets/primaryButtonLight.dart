import 'package:flutter/material.dart';
import 'package:hackthon/theme/app_theme.dart';

class PrimarybuttonLight extends StatefulWidget {
  String text;
  Function() onTap;

  PrimarybuttonLight({super.key, required this.text, required this.onTap});

  @override
  State<PrimarybuttonLight> createState() => _PrimarybuttonLightState();
}

class _PrimarybuttonLightState extends State<PrimarybuttonLight> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onTap, child: Text(widget.text));
  }
}
