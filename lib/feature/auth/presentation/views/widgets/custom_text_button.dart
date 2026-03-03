import 'package:flutter/material.dart';
import 'package:spot/core/color_manager.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.textButton,
    required this.textStyle,
    required this.onPressed,
  });
  final String textButton;
  final TextStyle textStyle;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textButton,
        style: textStyle.copyWith(
          fontWeight: FontWeight.bold,
          color: ColorManager.primaryColor,
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.primaryColor,
          decorationThickness: 1.8,
        ),
      ),
    );
  }
}
