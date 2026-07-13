import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/width_manager.dart';

class IsOpenCardItemSection extends StatelessWidget {
  const IsOpenCardItemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Open',
          style: Styles.textStyle12.copyWith(color: ColorManager.colorSuccess),
        ),
        SizedBox(width: WidthManager.w12),
        Text(
          'Closes 12 PM',
          style: Styles.textStyle12.copyWith(color: ColorManager.colorDarkGray),
        ),
        const Spacer(),
        const Icon(
          Icons.location_on_outlined,
          size: FontManager.f13,
          color: ColorManager.colorMediumGray,
        ),
        Text(
          '400m',
          style: Styles.textStyle12.copyWith(
            color: ColorManager.colorMediumGray,
          ),
        ),
      ],
    );
  }
}
