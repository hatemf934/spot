import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/width_manager.dart';

class HeroImageCardItem extends StatelessWidget {
  const HeroImageCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: HeightManager.h180,
          width: double.infinity,
          child: Image.asset(
            "assets/cardsimages/24c2e4958a5559d70910128f2bba71d7f244ff09.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            width: WidthManager.w32,
            height: HeightManager.h32,
            decoration: BoxDecoration(
              color: ColorManager.blackColor.withAlpha(140),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border,
              size: FontManager.f16,
              color: ColorManager.witheColor,
            ),
          ),
        ),
      ],
    );
  }
}
