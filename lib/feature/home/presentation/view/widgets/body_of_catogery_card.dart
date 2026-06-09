import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/core/utils/width_manager.dart';
import 'package:spot/feature/home/presentation/view/card_view.dart';

class BodyOfCatogeryCard extends StatelessWidget {
  const BodyOfCatogeryCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 2,
          right: 6,
          child: Image.asset(
            image,
            width: WidthManager.w70,
            height: HeightManager.h70,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(PaddingManager.p15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextManager.restaurants,
                style: Styles.textStyle16.copyWith(
                  color: ColorManager.witheColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(TextManager.spotsCount, style: Styles.textStyle13),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CardView.id);
                },
                child: Container(
                  width: WidthManager.w25,
                  height: HeightManager.h25,
                  decoration: BoxDecoration(
                    color: ColorManager.semiTransparentWhite,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: ColorManager.witheColor,
                    size: FontManager.f14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
