import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/login/widgets/trans.dart';
import 'package:hackthon/theme/app_theme.dart';
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
            Text(
              "120 ${translate("sec")}",
              style: context.mediumTextBold.copyWith(color: AppTheme.primary),
            ),
          ],
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            defaultPinTheme: PinTheme(
              width: 44,
              height: 50,
              decoration: BoxDecoration(
                color: AppTheme.white,
                border: Border.all(color: AppTheme.gray2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            controller: controller,
            length: 6,
          ),
        ),
      ],
    );
  }
}
