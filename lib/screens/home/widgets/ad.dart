import 'package:flutter/material.dart';

class adView extends StatelessWidget {
  String path;
  adView({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354,
      height: 180,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.black,
      ),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }
}
