import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/date_text_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/gender_text_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/password_text_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/phone_text_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/user_name_text_feild.dart';

class GroupOfTextFeildRegester extends StatelessWidget {
  const GroupOfTextFeildRegester({
    super.key,
    required this.isSubmitted,
    required this.userNameController,
    required this.fullNameController,
    required this.phoneController,
    required this.emailController,
    required this.dateController,
    required this.genderController,
    required this.passwordController,
  });
  final bool isSubmitted;
  final TextEditingController userNameController;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController dateController;
  final TextEditingController genderController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserNameTextFeild(
          userNameController: userNameController,
          fullNameController: fullNameController,
          isSubmitted: isSubmitted,
        ),
        SizedBox(height: HeightManager.h12),
        PhoneTextFeild(phoneController: phoneController),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          controller: emailController,
          iconData: Icons.email,
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateEmail(value),
          text: TextManager.emailOptional,
        ),
        SizedBox(height: HeightManager.h12),
        DateTextFeild(dateController: dateController, isSubmitted: isSubmitted),
        SizedBox(height: HeightManager.h12),
        GenderTextFeild(
          genderController: genderController,
          isSubmitted: isSubmitted,
        ),
        SizedBox(height: HeightManager.h12),
        PasswordTextFeild(
          passwordController: passwordController,
          hintPassword: TextManager.password,
          hintConfirmPassword: TextManager.confirmPassword,
          isSubmitted: isSubmitted,
        ),
      ],
    );
  }
}
