import 'package:flutter/material.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/theme/app_theme.dart';

class PrimarybuttonDark extends StatefulWidget {
  String text;
  Function() onTap;
  ButtonStyle? style;

  PrimarybuttonDark({
    super.key,
    required this.text,
    required this.onTap,
    this.style,
  });

  @override
  State<PrimarybuttonDark> createState() => _PrimarybuttonDarkState();
}

class _PrimarybuttonDarkState extends State<PrimarybuttonDark> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.style ?? Theme.of(context).elevatedButtonTheme.style,
      onPressed: widget.onTap,
      child: Text(
        widget.text,
        style: context.heading6.copyWith(color: AppTheme.primary),
      ),
    );
  }
}
