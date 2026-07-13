import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/width_manager.dart';

class PointsCardItemSection extends StatelessWidget {
  const PointsCardItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: FontManager.f12,
          color: ColorManager.orangeColor,
        ),
        const SizedBox(width: WidthManager.w3),
        Text(
          'Earned 25 Points',
          style: Styles.textStyle12.copyWith(
            color: ColorManager.orangeColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
