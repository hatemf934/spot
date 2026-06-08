import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
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
          style: Styles.textStyle22.copyWith(color: ColorManager.blackColor),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            TextManager.seeAll,
            style: TextStyle(color: ColorManager.orangeColor),
          ),
        ),
      ],
    );
  }
}
