import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';

class SpotsTitleRow extends StatelessWidget {
  const SpotsTitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          TextManager.spots,
          style: Styles.textStyleBlack.copyWith(fontSize: FontManager.f22),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            TextManager.seeAll,
            style: TextStyle(color: ColorManager.orangeColor),
          ),
        ),
      ],
    );
  }
}
