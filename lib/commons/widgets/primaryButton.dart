import 'package:flutter/material.dart';
import 'package:hackthon/theme/app_theme.dart';

class Primarybutton extends StatefulWidget {
  String text;
  Function() onTap;

  Primarybutton({super.key, required this.text, required this.onTap});

  @override
  State<Primarybutton> createState() => _PrimarybuttonState();
}

class _PrimarybuttonState extends State<Primarybutton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onTap, child: Text(widget.text));
  }
}
