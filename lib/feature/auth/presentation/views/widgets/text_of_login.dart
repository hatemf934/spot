import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.textStyleBlack.copyWith(
            color: ColorManager.blackColor,
            fontSize: FontManager.f26,
          ),
        ),
        Text(
          subTitle,
          style: Styles.textStyle14.copyWith(color: ColorManager.navyBlue),
        ),
      ],
    );
  }
}
