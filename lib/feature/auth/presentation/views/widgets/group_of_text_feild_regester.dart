import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';

class GroupOfTextFeildRegester extends StatelessWidget {
  const GroupOfTextFeildRegester({super.key, required this.isSubmitted});
  final bool isSubmitted;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateFullName(value),
          text: TextManager.fullName,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateUsername(value),
          text: TextManager.userName,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validatePhone(value),
          text: TextManager.phoneNumber,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateEmail(value),
          text: TextManager.emailOptional,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateRequired(value),
          text: TextManager.dateOfBirth,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateRequired(value),
          text: TextManager.gender,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateRequired(value),
          text: TextManager.password,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateRequired(value),
          text: TextManager.confirmPassword,
        ),
      ],
    );
  }
}
