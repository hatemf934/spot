import 'package:flutter/material.dart';
import 'package:spot/core/utils/assets_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_social.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({
    super.key,
    required this.textGoogle,
    required this.textFacebook,
  });
  final String textGoogle;
  final String textFacebook;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocial(
          onTap: () {},
          image: AssetsManager.googleIcon,
          text: textGoogle,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.004),
        CustomSocial(
          onTap: () {},
          image: AssetsManager.facebookIcon,
          text: textFacebook,
        ),
      ],
    );
  }
}
