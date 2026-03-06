import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';

class GenderSelected extends StatelessWidget {
  const GenderSelected({
    super.key,
    required this.selectedGender,
    this.onChanged,
  });
  final String selectedGender;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text(
            TextManager.maleText,
            style: Styles.textStyle20.copyWith(
              color: selectedGender == TextManager.maleText
                  ? ColorManager.primaryColor
                  : ColorManager.blackColor,
              fontWeight: selectedGender == TextManager.maleText
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          value: TextManager.maleText,
          // ignore: deprecated_member_use
          groupValue: selectedGender,
          activeColor: ColorManager.primaryColor,
          // ignore: deprecated_member_use
          onChanged: onChanged,
        ),
        Divider(
          thickness: 1,
          endIndent: PaddingManager.p20,
          indent: PaddingManager.p20,
          color: ColorManager.greyColor,
          height: HeightManager.h5,
        ),
        RadioListTile(
          title: Text(
            TextManager.femaleText,
            style: Styles.textStyle20.copyWith(
              color: selectedGender == TextManager.femaleText
                  ? ColorManager.primaryColor
                  : ColorManager.blackColor,
            ),
          ),
          value: TextManager.femaleText,
          // ignore: deprecated_member_use
          groupValue: selectedGender,
          activeColor: ColorManager.primaryColor,
          // ignore: deprecated_member_use
          onChanged: onChanged,
        ),
      ],
    );
  }
}
