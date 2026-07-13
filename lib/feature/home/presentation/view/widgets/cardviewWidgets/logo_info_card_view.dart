import 'package:flutter/material.dart';
import 'package:spot/core/utils/width_manager.dart';

class LogoInfoCardItem extends StatelessWidget {
  const LogoInfoCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidthManager.w65,
      height: WidthManager.w65,
      child: ClipRRect(
        child: Image.asset(
          "assets/cardsimages/5b695c00583dd87398022beddb24e21a5e793a07.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
