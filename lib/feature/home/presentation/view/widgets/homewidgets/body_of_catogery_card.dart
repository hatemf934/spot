import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/core/utils/width_manager.dart';
import 'package:spot/feature/home/data/model/catogery_model.dart';

class BodyOfCatogeryCard extends StatelessWidget {
  const BodyOfCatogeryCard({
    super.key,
    required this.categoryModel,
    required this.spotCount,
  });
  final CategoryModel categoryModel;
  final int spotCount;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 2,
          right: 6,
          child: Image.asset(
            categoryModel.image,
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
                categoryModel.name,
                style: Styles.textStyle16.copyWith(
                  color: ColorManager.witheColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${spotCount.toString()} ${TextManager.spotsCount}",
                style: Styles.textStyle13,
              ),
              const Spacer(),
              Container(
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
            ],
          ),
        ),
      ],
    );
  }
}
