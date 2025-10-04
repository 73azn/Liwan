import 'package:flutter/material.dart';
import 'package:hackthon/commons/controllers/user.dart';
import 'package:hackthon/commons/widgets/ctx_common.dart';
import 'package:hackthon/screens/login/controllers/countries.dart';
import 'package:hackthon/screens/login/controllers/login_controller.dart';
import 'package:hackthon/theme/app_theme.dart';

class NumberView extends StatefulWidget {
  NumberView({super.key});

  @override
  State<NumberView> createState() => _NumberViewState();
}

class _NumberViewState extends State<NumberView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      textDirection: TextDirection.ltr,
      children: [
        Container(
          decoration: BoxDecoration(
            border: BoxBorder.all(color: AppTheme.gray2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: Countries.countryCode.map((e) {
                        return TextButton(
                          onPressed: () {
                            User.countryCode = e;

                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text(e),
                        );
                      }).toList(),
                    ).toList(),
                  );
                },
              );
            },
            child: Text(
              User.countryCode!,
              style: context.normalTextRegular.copyWith(color: AppTheme.black),
            ),
          ),
        ),
        FillTextField(hint: "050 000 0000"),
      ],
    );
  }
}

class FillTextField extends StatelessWidget {
  String hint;
  TextEditingController? controller;
  FillTextField({super.key, required this.hint, this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(color: AppTheme.gray2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: TextField(
          controller: controller,
          textDirection: TextDirection.ltr,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            border: InputBorder.none,
            hint: Text(
              hint,
              textDirection: TextDirection.ltr,
              style: context.normalTextRegular.copyWith(color: AppTheme.gray2),
            ),
          ),
        ),
      ),
    );
  }
}
