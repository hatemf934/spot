import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';

class CustomTextFromFeild extends StatelessWidget {
  const CustomTextFromFeild({
    super.key,
    required this.text,
    this.onPressedIcons,
    this.iconData,
    this.obscureText = false,
    required this.validator,
    this.prefixIcon,
    this.controller,
    this.readOnly = false,
  });
  final String text;
  final Function()? onPressedIcons;
  final IconData? iconData;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorManager.primaryColor.withOpacity(0.4),
          selectionHandleColor: ColorManager.primaryColor,
        ),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        readOnly: readOnly,
        cursorColor: ColorManager.primaryColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Styles.textStyle14.copyWith(color: ColorManager.blackColor),
        decoration: InputDecoration(
          labelText: text,
          hintText: text,
          hintStyle: Styles.textStyle16.copyWith(color: ColorManager.navyBlue),
          labelStyle: Styles.textStyle14.copyWith(color: ColorManager.navyBlue),
          suffixIcon: IconButton(
            onPressed: onPressedIcons,
            icon: Icon(iconData, color: ColorManager.primaryColor),
          ),
          prefixIcon: prefixIcon,
          errorStyle: TextStyle(color: ColorManager.primaryColor),
          enabledBorder: buildOutlineInputBorder(
            color: ColorManager.borderColor,
          ),
          focusedBorder: buildOutlineInputBorder(
            color: ColorManager.borderColor,
          ),
          errorBorder: buildOutlineInputBorder(
            color: ColorManager.primaryColor,
          ),
          fillColor: ColorManager.witheColor,
          filled: true,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(RaduisManager.r5),
      borderSide: BorderSide(color: color),
    );
  }
}
