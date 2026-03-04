import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width;
    double buttonHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight * 0.05,
        width: buttonWidth * 0.9,
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(RaduisManager.r10),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle15.copyWith(color: ColorManager.witheColor),
          ),
        ),
      ),
    );
  }
}
