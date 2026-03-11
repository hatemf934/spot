import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/text_fireauth_manager.dart';

class CustomAswesomeDialog {
  // ignore: non_constant_identifier_names
  void AwesomeDialogError({
    required BuildContext context,
    required String description,
    String title = "Error",
    DialogType dialogType = DialogType.error,
    AnimType animType = AnimType.rightSlide,
    VoidCallback? btnOkOnPress,
    Color? dialogBackgroundColor,
    Color? btnOkColor,
    Color? buttonsTextColor,
    TextStyle? titleTextStyle,
    TextStyle? descTextStyle,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: TextFireauthManager.kError,
      desc: description,
      btnOkOnPress: () {},
      dialogBackgroundColor: ColorManager.primaryColor,
      titleTextStyle: TextStyle(
        fontSize: FontManager.f20,
        fontWeight: FontWeight.bold,
      ),
      descTextStyle: TextStyle(fontSize: FontManager.f15),
      btnOkColor: ColorManager.witheColor,
      buttonsTextStyle: TextStyle(color: ColorManager.blackColor),
    ).show();
  }
}
