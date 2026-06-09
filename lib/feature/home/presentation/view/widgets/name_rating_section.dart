import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/width_manager.dart';

class NameAndRatingSection extends StatelessWidget {
  const NameAndRatingSection({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Drda Coffee",
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingManager.p7,
            vertical: PaddingManager.p3,
          ),
          decoration: BoxDecoration(
            color: ColorManager.colorRating,
            borderRadius: BorderRadius.circular(RaduisManager.r18),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_rounded,
                size: FontManager.f14,
                color: ColorManager.primaryColor,
              ),
              SizedBox(width: WidthManager.w3),
              Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: FontManager.f12,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
