import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';

class Views extends StatelessWidget {
  SvgPicture svg;
  String title;
  String des;

  Views({super.key, required this.svg, required this.title, required this.des});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 455,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          svg,
          SizedBox(height: 8),
          Text(
            title,
            style: context.heading3.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ).tr(),
          SizedBox(height: 16),
          Text(
            des,
            style: context.largeTextRegular,
            textAlign: TextAlign.center,
          ).tr(),
        ],
      ),
    );
  }
}
