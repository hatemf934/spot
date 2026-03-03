import 'package:flutter/material.dart';
import 'package:spot/core/height_manger.dart';
import 'package:spot/core/styles.dart';
import 'package:spot/core/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_regester_text.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/or_divider.dart';
import 'package:spot/feature/auth/presentation/views/widgets/social_auth.dart';
import 'package:spot/feature/auth/presentation/views/widgets/text_of_login.dart';

class BodyOfLogin extends StatelessWidget {
  const BodyOfLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(flex: 1),
        const TextLogin(),
        const Spacer(flex: 2),
        const CustomTextFromFeild(text: TextManager.phoneOrUserName),
        SizedBox(height: HeightManger.h16),
        const CustomTextFromFeild(text: TextManager.password),
        Align(
          alignment: Alignment.centerRight,
          child: CustomTextButton(
            textButton: TextManager.forgetPassword,
            textStyle: Styles.textStyle16,
            onPressed: () {},
          ),
        ),
        const CustomButton(text: TextManager.login),
        const OrDivider(),
        const SocialAuth(),
        const CustomRegesterText(),
        const Spacer(flex: 3),
      ],
    );
  }
}
