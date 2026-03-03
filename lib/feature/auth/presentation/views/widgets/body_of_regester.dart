import 'package:flutter/material.dart';
import 'package:spot/core/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_login_text.dart';
import 'package:spot/feature/auth/presentation/views/widgets/group_of_text_feild_regester.dart';
import 'package:spot/feature/auth/presentation/views/widgets/or_divider.dart';
import 'package:spot/feature/auth/presentation/views/widgets/social_auth.dart';
import 'package:spot/feature/auth/presentation/views/widgets/text_of_login.dart';

class BodyOfRegester extends StatelessWidget {
  const BodyOfRegester({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleAuth(
          title: TextManager.signUp,
          subTitle: TextManager.signUpSubTitle,
        ),
        GroupOfTextFeildRegester(),
        CustomButton(text: TextManager.signUp),
        OrDivider(),
        const SocialAuth(
          textGoogle: TextManager.signUpWithGoogle,
          textFacebook: TextManager.signUpWithFacebook,
        ),
        CustomLoginText(),
      ],
    );
  }
}
