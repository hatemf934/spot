import 'package:flutter/material.dart';
import 'package:spot/core/styles.dart';
import 'package:spot/core/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_button.dart';

class CustomLoginText extends StatelessWidget {
  const CustomLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(TextManager.alreadyHaveAccount, style: Styles.textStyle14),
        CustomTextButton(
          textButton: TextManager.signIn,
          textStyle: Styles.textStyle14,
          onPressed: () {
            Navigator.pushNamed(context, LoginView.id);
          },
        ),
        Spacer(),
      ],
    );
  }
}
