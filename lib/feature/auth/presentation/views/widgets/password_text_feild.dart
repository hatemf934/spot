import 'package:flutter/material.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';

class PasswordTextFeild extends StatefulWidget {
  const PasswordTextFeild({
    super.key,
    required this.isSubmitted,
    required this.hintPassword,
    required this.hintConfirmPassword,
    required this.passwordController,
  });
  final bool isSubmitted;
  final String hintPassword;
  final String hintConfirmPassword;
  final TextEditingController passwordController;
  @override
  State<PasswordTextFeild> createState() => _PasswordTextFeildState();
}

class _PasswordTextFeildState extends State<PasswordTextFeild> {
  bool obscureTextPassword = false;
  bool obscureTextConfirm = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromFeild(
          controller: widget.passwordController,
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validatePassword(value),
          text: widget.hintPassword,
          obscureText: !obscureTextPassword,
          onPressedIcons: () => setState(() {
            obscureTextPassword = !obscureTextPassword;
          }),
          iconData: obscureTextPassword
              ? Icons.visibility
              : Icons.visibility_off,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validateConfirmPassword(value, widget.passwordController.text),
          text: widget.hintConfirmPassword,
          obscureText: !obscureTextConfirm,
          onPressedIcons: () => setState(() {
            obscureTextConfirm = !obscureTextConfirm;
          }),
          iconData: obscureTextConfirm
              ? Icons.visibility
              : Icons.visibility_off,
        ),
      ],
    );
  }
}
