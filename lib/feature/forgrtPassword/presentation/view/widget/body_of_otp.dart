import 'package:flutter/material.dart';
import 'package:spot/core/utils/assets_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/widget/otp_verification.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/widget/text_rich.dart';

class BodyOfOTP extends StatelessWidget {
  const BodyOfOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
      child: Column(
        children: [
          SizedBox(height: HeightManager.h40),
          Image.asset(AssetsManager.logoForgetPassword),
          SizedBox(height: HeightManager.h40),
          TextRich(
            titletext: TextManager.phoneVerificationCode,
            subtitletext: " 01009928340",
          ),
          SizedBox(height: HeightManager.h40),
          OTPverification(),
        ],
      ),
    );
  }
}
