import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Views extends StatelessWidget {
  SvgPicture svg;
  String title;
  String des;

  Views({super.key, required this.svg, required this.title, required this.des});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          svg,
          SizedBox(height: 8),
          Text(title),
          SizedBox(height: 16),
          Text(des),
        ],
      ),
    );
  }
}
