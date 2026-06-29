import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/width_manager.dart';

class TitleShowModel extends StatelessWidget {
  const TitleShowModel({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: WidthManager.w65,
          height: HeightManager.h5,
          decoration: BoxDecoration(
            color: ColorManager.greyColor400,
            borderRadius: BorderRadius.circular(RaduisManager.r10),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: PaddingManager.p16),
          child: Text(title, style: Styles.textStyle22),
        ),
      ],
    );
  }
}
