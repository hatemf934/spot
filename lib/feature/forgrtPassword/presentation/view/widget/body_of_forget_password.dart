import 'package:flutter/material.dart';
import 'package:spot/core/utils/assets_manager.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/regester_view.dart';
import 'package:spot/feature/auth/presentation/views/widgets/auth_switch_row.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/otp_view.dart';

class BodyOfForgetPassword extends StatelessWidget {
  const BodyOfForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
      child: Column(
        children: [
          SizedBox(height: HeightManager.h40),
          Image.asset(AssetsManager.logoForgetPassword),
          SizedBox(height: HeightManager.h40),
          Text(
            TextManager.phoneVerificationTitle,
            textAlign: TextAlign.center,
            style: Styles.textStyle16.copyWith(color: ColorManager.navyBlue),
          ),
          SizedBox(height: HeightManager.h32),
          CustomTextFromFeild(text: TextManager.phoneNumber),
          SizedBox(height: HeightManager.h16),
          CustomButton(
            text: TextManager.continueText,
            onTap: () => Navigator.pushNamed(context, OtpView.id),
          ),
          SizedBox(height: HeightManager.h24),
          AuthSwitchRow(
            haveAccount: TextManager.dontHaveAccount,
            textButton: TextManager.createSellerAccount,
            onPressed: () =>
                Navigator.pushReplacementNamed(context, RegesterView.id),
          ),
        ],
      ),
    );
  }
}
