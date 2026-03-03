import 'package:flutter/material.dart';
import 'package:spot/core/color_manager.dart';
import 'package:spot/core/styles.dart';
import 'package:spot/core/text_manager.dart';

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          TextManager.welcomeBack,
          style: Styles.textStyle26.copyWith(color: ColorManager.blackColor),
        ),
        Text(
          TextManager.enterLoginInfo,
          style: Styles.textStyle14.copyWith(color: ColorManager.navyBlue),
        ),
      ],
    );
  }
}
