import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/styles.dart';

class TotalNumbersText extends StatelessWidget {
  const TotalNumbersText({super.key, required this.textNumber});
  final String textNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          textNumber,
          style: Styles.textStyle16.copyWith(color: ColorManager.colorDarkGray),
        ),
      ],
    );
  }
}
