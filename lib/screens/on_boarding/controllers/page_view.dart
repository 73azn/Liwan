import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/screens/on_boarding/widgets/views.dart';

abstract class PageViewItems {
  static final List<Widget> pages = [
    Views(
      key: ValueKey<int>(1),
      svg: SvgPicture.asset("assets/img/onBoard1.svg"),
      title: "title_1",
      des: "des_1",
    ),
    Views(
      key: ValueKey<int>(2),
      svg: SvgPicture.asset("assets/img/onBoard2.svg", height: 230),
      title: "title_2",
      des: "des_2",
    ),
    Views(
      key: ValueKey<int>(3),
      svg: SvgPicture.asset("assets/img/onBoard3.svg"),
      title: "title_3",
      des: "des_3",
    ),
  ];
  static int curPage = 0;
  static PageController controller = PageController();
}
