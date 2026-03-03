import 'package:flutter/material.dart';
import 'package:spot/core/styles.dart';
import 'package:spot/core/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_button.dart';

class CustomRegesterText extends StatelessWidget {
  const CustomRegesterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(TextManager.dontHaveAccount, style: Styles.textStyle14),
        CustomTextButton(
          textButton: TextManager.signUp,
          textStyle: Styles.textStyle14,
          onPressed: () {},
        ),
        Spacer(),
      ],
    );
  }
}
