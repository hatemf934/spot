import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.textEditingController});
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: HeightManager.h50,
      decoration: BoxDecoration(
        color: ColorManager.witheColor,
        borderRadius: BorderRadius.circular(RaduisManager.r10),
        border: Border.all(color: ColorManager.greyColor300),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: ColorManager.primaryColor.withOpacity(0.4),
            selectionHandleColor: ColorManager.primaryColor,
          ),
        ),
        child: TextFormField(
          controller: textEditingController,
          cursorColor: ColorManager.primaryColor,
          decoration: InputDecoration(
            hint: Padding(
              padding: EdgeInsets.only(top: PaddingManager.p5),
              child: Text(
                TextManager.searchText,
                style: Styles.textStyle16.copyWith(
                  color: ColorManager.greyColor400,
                ),
              ),
            ),
            prefixIcon: Icon(Icons.search, color: ColorManager.greyColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
