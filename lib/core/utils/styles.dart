import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';

class Styles {
  Styles._();
  static const TextStyle textStyle12 = TextStyle(
    fontSize: FontManager.f12,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle textStyle14 = TextStyle(
    fontSize: FontManager.f14,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyle13 = TextStyle(
    fontSize: FontManager.f13,
    color: ColorManager.witheColor,
  );
  static const TextStyle textStyle15 = TextStyle(
    fontSize: FontManager.f15,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyle16 = TextStyle(
    fontSize: FontManager.f16,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle textStyleBlack = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorManager.blackColor,
  );
}
