import 'package:flutter/material.dart';
import 'package:spot/core/height_manger.dart';
import 'package:spot/core/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';

class GroupOfTextFeildRegester extends StatelessWidget {
  const GroupOfTextFeildRegester({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFromFeild(text: TextManager.fullName),
        SizedBox(height: HeightManger.h12),
        const CustomTextFromFeild(text: TextManager.userName),
        SizedBox(height: HeightManger.h12),
        const CustomTextFromFeild(text: TextManager.phoneNumber),
        SizedBox(height: HeightManger.h12),
        const CustomTextFromFeild(text: TextManager.emailOptional),
        SizedBox(height: HeightManger.h12),
        const CustomTextFromFeild(text: TextManager.dateOfBirth),
        SizedBox(height: HeightManger.h12),
        const CustomTextFromFeild(text: TextManager.gender),
        SizedBox(height: HeightManger.h12),
        const CustomTextFromFeild(text: TextManager.password),
        SizedBox(height: HeightManger.h12),
        const CustomTextFromFeild(text: TextManager.confirmPassword),
      ],
    );
  }
}
