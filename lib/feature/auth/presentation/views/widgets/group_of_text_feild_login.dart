import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/core/utils/text_validate_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';

class GroupOfTextFeildLogin extends StatefulWidget {
  const GroupOfTextFeildLogin({
    super.key,
    required this.isSubmitted,
    required this.passwordController,
    required this.userNameAndPhoneController,
  });
  final bool isSubmitted;
  final TextEditingController passwordController;
  final TextEditingController userNameAndPhoneController;
  @override
  State<GroupOfTextFeildLogin> createState() => _GroupOfTextFeildLoginState();
}

class _GroupOfTextFeildLoginState extends State<GroupOfTextFeildLogin> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: HeightManager.h32),
        CustomTextFromFeild(
          controller: widget.userNameAndPhoneController,
          validator: (value) =>
              FormValidate(isSubmitted: widget.isSubmitted).validateRequired(
                value,
                TextValidateManager.usernameAndPhoneRequired,
              ),
          text: TextManager.phoneOrUserName,
        ),
        const SizedBox(height: HeightManager.h16),
        CustomTextFromFeild(
          controller: widget.passwordController,
          validator: (value) => FormValidate(
            isSubmitted: widget.isSubmitted,
          ).validateRequired(value, TextValidateManager.passwordRequired),
          text: TextManager.password,
          obscureText: !obscureText,
          onPressedIcons: () => setState(() {
            obscureText = !obscureText;
          }),

          iconData: obscureText ? Icons.visibility : Icons.visibility_off,
        ),
      ],
    );
  }
}
