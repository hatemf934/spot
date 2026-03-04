import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';

class GroupOfTextFeildRegester extends StatefulWidget {
  const GroupOfTextFeildRegester({super.key, required this.isSubmitted});
  final bool isSubmitted;

  @override
  State<GroupOfTextFeildRegester> createState() =>
      _GroupOfTextFeildRegesterState();
}

class _GroupOfTextFeildRegesterState extends State<GroupOfTextFeildRegester> {
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  bool obscureTextPassword = false;
  bool obscureTextConfirm = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromFeild(
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validateFullName(value),
          text: TextManager.fullName,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validateUsername(value),
          text: TextManager.userName,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validatePhone(value),
          text: TextManager.phoneNumber,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validateEmail(value),
          text: TextManager.emailOptional,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validateRequired(value),
          text: TextManager.dateOfBirth,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validateRequired(value),
          text: TextManager.gender,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          controller: passwordController,
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validatePassword(value),
          text: TextManager.password,
          obscureText: !obscureTextPassword,
          onPressedIcons: () {
            setState(() {
              obscureTextPassword = !obscureTextPassword;
            });
          },
          iconData: obscureTextPassword
              ? Icons.visibility
              : Icons.visibility_off,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validateConfirmPassword(value, passwordController.text),
          text: TextManager.confirmPassword,
          obscureText: !obscureTextConfirm,
          onPressedIcons: () {
            setState(() {
              obscureTextConfirm = !obscureTextConfirm;
            });
          },
          iconData: obscureTextConfirm
              ? Icons.visibility
              : Icons.visibility_off,
        ),
      ],
    );
  }
}
