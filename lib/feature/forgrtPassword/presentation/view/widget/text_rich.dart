import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/styles.dart';

class TextRich extends StatelessWidget {
  const TextRich({
    super.key,
    required this.titletext,
    required this.subtitletext,
  });
  final String titletext;
  final String subtitletext;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: titletext,
        style: Styles.textStyle16.copyWith(color: ColorManager.navyBlue),
        children: [
          TextSpan(
            text: subtitletext,
            style: TextStyle(
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
