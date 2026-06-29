import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';

class CustomTextFromFeild extends StatefulWidget {
  const CustomTextFromFeild({
    super.key,
    required this.text,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.controller,
    this.iconData,
    this.onPressedIcons,
    this.readOnly = false,
  });
  final String text;
  final bool obscureText;
  final IconData? iconData;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onPressedIcons;

  @override
  State<CustomTextFromFeild> createState() => _CustomTextFromFeildState();
}

class _CustomTextFromFeildState extends State<CustomTextFromFeild> {
  late bool obscureText = widget.obscureText;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorManager.primaryColor.withAlpha(102),
          selectionHandleColor: ColorManager.primaryColor,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: obscureText,
        readOnly: widget.readOnly,
        cursorColor: ColorManager.primaryColor,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Styles.textStyle14.copyWith(color: ColorManager.blackColor),
        decoration: InputDecoration(
          labelText: widget.text,
          hintText: widget.text,
          hintStyle: Styles.textStyle16.copyWith(color: ColorManager.navyBlue),
          labelStyle: Styles.textStyle14.copyWith(color: ColorManager.navyBlue),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: ColorManager.primaryColor,
                  ),
                )
              : IconButton(
                  onPressed: widget.onPressedIcons,
                  icon: Icon(widget.iconData, color: ColorManager.primaryColor),
                ),

          prefixIcon: widget.prefixIcon,
          errorStyle: TextStyle(color: ColorManager.primaryColor),
          enabledBorder: buildOutlineInputBorder(
            color: ColorManager.borderColor,
          ),
          focusedBorder: buildOutlineInputBorder(
            color: ColorManager.borderColor,
          ),
          focusedErrorBorder: buildOutlineInputBorder(
            color: ColorManager.primaryColor,
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
