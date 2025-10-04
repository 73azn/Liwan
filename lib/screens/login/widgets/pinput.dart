import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackthon/screens/login/widgets/trans.dart';
import 'package:pinput/pinput.dart';

class PinPutWtimer extends StatelessWidget {
  TextEditingController? controller;
  PinPutWtimer({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/img/bag-timer.svg"),
            Text(translate("sec")),
          ],
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(controller: controller, length: 6),
        ),
      ],
    );
  }
}
