import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';

class PhoneTextFeild extends StatelessWidget {
  const PhoneTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorManager.primaryColor.withOpacity(0.4),
          selectionHandleColor: ColorManager.primaryColor,
        ),
      ),
      child: IntlPhoneField(
        cursorColor: ColorManager.primaryColor,
        pickerDialogStyle: PickerDialogStyle(
          backgroundColor: ColorManager.witheColor,
          countryCodeStyle: Styles.textStyle16,
          countryNameStyle: Styles.textStyle16,
          searchFieldCursorColor: ColorManager.primaryColor,
          searchFieldInputDecoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primaryColor),
            ),
            hintText: TextManager.searchCountry,
            hintStyle: Styles.textStyle14,
            suffixIcon: Icon(Icons.search, color: ColorManager.primaryColor),
          ),
        ),
        decoration: InputDecoration(
          fillColor: ColorManager.witheColor,
          filled: true,
          labelText: TextManager.phoneNumber,
          hintText: TextManager.hintPhone,
          hintStyle: Styles.textStyle16.copyWith(color: ColorManager.navyBlue),
          labelStyle: Styles.textStyle14.copyWith(color: ColorManager.navyBlue),
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
          suffixIcon: Icon(Icons.person, color: ColorManager.primaryColor),
        ),
        initialCountryCode: 'EG',
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
