import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackthon/screens/home/widgets/ad.dart';
import 'package:hackthon/screens/home/widgets/sections.dart';
import 'package:hackthon/screens/home/widgets/zone.dart';

abstract class views {
  static List pgViews = [
    adView(path: "assets/img/roshn_sedra.png"),
    adView(path: "assets/img/soundstorm.png"),
    adView(path: "assets/img/book_fair.png"),
  ];
  static PageController pc = PageController();

  static List<Widget> wrap1 = [
    Sections(path: "assets/img/health.svg", label: "health".tr(), onTap: () {}),
    Sections(
      path: "assets/img/daily_needs.svg",
      label: "daily_needs".tr(),
      onTap: () {},
    ),
    Sections(
      path: "assets/img/services.svg",
      label: "services".tr(),
      onTap: () {},
    ),
    Sections(
      path: "assets/img/entertainment.svg",
      label: "entertainment".tr(),
      onTap: () {},
    ),
    Sections(
      path: "assets/img/education.svg",
      label: "education".tr(),
      onTap: () {},
    ),
  ];

  static List<Widget> zones = [
    Zone(
      imagePath: "assets/img/padel.png",
      title: "padel_opening".tr(),
      location: "منطقة أ",
      category: "entertainment".tr(),
      categoryIcon: SvgPicture.asset("assets/img/entertainment.svg"),
      isNew: true,
    ),
    Zone(
      imagePath: "assets/img/cafe.png",
      title: "مقهى جديد",
      location: "منطقة أ",
      category: "daily_needs".tr(),
      categoryIcon: SvgPicture.asset("assets/img/daily_needs.svg"),
      isNew: true,
    ),
    Zone(
      imagePath: "assets/img/internet.png",
      title: "تدشين خدمة إنترنت",
      location: "منطقة أ",
      category: "services".tr(),
      categoryIcon: SvgPicture.asset("assets/img/services.svg"),
      isNew: true,
    ),
    Zone(
      imagePath: "assets/img/padel.png",
      title: "padel_opening".tr(),
      location: "منطقة أ",
      category: "entertainment".tr(),
      categoryIcon: SvgPicture.asset("assets/img/entertainment.svg"),
      isNew: true,
    ),
    Zone(
      imagePath: "assets/img/cafe.png",
      title: "مقهى جديد",
      location: "منطقة أ",
      category: "daily_needs".tr(),
      categoryIcon: SvgPicture.asset("assets/img/daily_needs.svg"),
      isNew: true,
    ),
    Zone(
      imagePath: "assets/img/internet.png",
      title: "تدشين خدمة إنترنت",
      location: "منطقة أ",
      category: "services".tr(),
      categoryIcon: SvgPicture.asset("assets/img/services.svg"),
      isNew: true,
    ),
  ];
}
