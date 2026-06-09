import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';

class Styles {
  Styles._();
  static const TextStyle textStyle12 = TextStyle(
    fontSize: FontManager.f12,
    fontWeight: FontWeight.w400,
    color: ColorManager.colorCoolGray,
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
  static const TextStyle textStyle20 = TextStyle(
    fontSize: FontManager.f20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyle22 = TextStyle(
    fontSize: FontManager.f22,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle textStyleBlack24 = TextStyle(
    fontSize: FontManager.f24,
    fontWeight: FontWeight.bold,
    color: ColorManager.blackColor,
  );
  static const TextStyle textStyle26 = TextStyle(
    fontSize: FontManager.f26,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle isOpenText12 = TextStyle(
    fontSize: FontManager.f12,
    fontWeight: FontWeight.w600,
    color: ColorManager.colorSuccess,
  );
}
