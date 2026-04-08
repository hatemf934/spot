import 'package:flutter/material.dart';
import 'package:spot/core/utils/assets_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_social.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({
    super.key,
    required this.textGoogle,
    required this.textFacebook,
    required this.onPressedGoogle,
  });
  final String textGoogle;
  final String textFacebook;
  final Function() onPressedGoogle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocial(
          onTap: onPressedGoogle,
          image: AssetsManager.googleIcon,
          text: textGoogle,
        ),
      ],
    );
  }
}
