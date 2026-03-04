import 'package:flutter/material.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_button.dart';

class AuthSwitchRow extends StatelessWidget {
  const AuthSwitchRow({
    super.key,
    required this.haveAccount,
    required this.textButton,
    required this.onPressed,
  });
  final String haveAccount;
  final String textButton;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(haveAccount, style: Styles.textStyle14),
        CustomTextButton(
          textButton: textButton,
          textStyle: Styles.textStyle14,
          onPressed: onPressed,
        ),
        Spacer(),
      ],
    );
  }
}
