import 'package:flutter/material.dart';
import 'package:spot/core/color_manager.dart';
import 'package:spot/core/styles.dart';
import 'package:spot/core/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_divider.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: CustomDivider(color: ColorManager.primaryColor)),
        Text(TextManager.or, style: Styles.textStyle14),
        Expanded(child: CustomDivider(color: ColorManager.navyBlue)),
      ],
    );
  }
}
