import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/styles.dart';

class CustomSocial extends StatelessWidget {
  const CustomSocial({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });
  final String image;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    double socialWidth = MediaQuery.of(context).size.width;
    double socialHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: socialHeight * 0.05,
        width: socialWidth * 0.9,
        decoration: BoxDecoration(
          color: ColorManager.witheColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorManager.borderColor),
        ),
        child: Row(
          children: [
            Spacer(flex: 3),
            Image.asset(image),
            Spacer(),
            Text(
              text,
              style: Styles.textStyle14.copyWith(
                color: ColorManager.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
