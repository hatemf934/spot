import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';

class ButtonSelected extends StatelessWidget {
  const ButtonSelected({super.key, required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingManager.p20),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.05,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RaduisManager.r10),
            ),
            elevation: 0,
          ),
          child: Text(
            TextManager.choose,
            style: Styles.textStyle20.copyWith(color: ColorManager.witheColor),
          ),
        ),
      ),
    );
  }
}
