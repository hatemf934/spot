import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/feature/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:spot/feature/auth/presentation/views/widgets/or_divider.dart';
import 'package:spot/feature/auth/presentation/views/widgets/social_auth.dart';

class AnotherAuthSection extends StatelessWidget {
  const AnotherAuthSection({
    super.key,
    required this.textGoogle,
    required this.textFacebook,
    required this.haveAccount,
    required this.textButton,
    required this.onPressed,
  });
  final String textGoogle;
  final String textFacebook;
  final String haveAccount;
  final String textButton;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: HeightManager.h30),
        const OrDivider(),
        const SizedBox(height: HeightManager.h30),
        SocialAuth(textGoogle: textGoogle, textFacebook: textFacebook),
        const SizedBox(height: HeightManager.h32),
        Center(
          child: AuthSwitchRow(
            onPressed: onPressed,
            textButton: textButton,
            haveAccount: haveAccount,
          ),
        ),
        const SizedBox(height: HeightManager.h20),
      ],
    );
  }
}
