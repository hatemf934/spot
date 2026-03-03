import 'package:flutter/material.dart';
import 'package:spot/core/assets_manager.dart';
import 'package:spot/core/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_social.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocial(
          onTap: () {},
          image: AssetsManager.googleIcon,
          text: TextManager.loginWithGoogle,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.004),
        CustomSocial(
          onTap: () {},
          image: AssetsManager.facebookIcon,
          text: TextManager.loginWithFacebook,
        ),
      ],
    );
  }
}
