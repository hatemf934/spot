import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/core/utils/width_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/change_password.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/widget/text_rich.dart';

class OTPverification extends StatelessWidget {
  const OTPverification({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: WidthManager.w65,
      height: HeightManager.h65,
      textStyle: Styles.textStyle22.copyWith(color: ColorManager.blackColor),
      decoration: BoxDecoration(
        color: ColorManager.witheColor,
        border: Border.all(color: ColorManager.borderColor),
        borderRadius: BorderRadius.circular(RaduisManager.r10),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: ColorManager.primaryColor),
      borderRadius: BorderRadius.circular(RaduisManager.r10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: ColorManager.witheColor,
      ),
    );
    return Column(
      children: [
        Pinput(
          length: 4,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          submittedPinTheme: submittedPinTheme,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          showCursor: true,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: PaddingManager.p5),
                width: WidthManager.w22,
                height: 1,
                color: ColorManager.primaryColor,
              ),
            ],
          ),
          onCompleted: (value) =>
              Navigator.popAndPushNamed(context, ChangePassword.id),
        ),

        SizedBox(height: HeightManager.h30),
        TextRich(titletext: TextManager.verification, subtitletext: " 1:30"),
        SizedBox(height: HeightManager.h16),
        CustomTextButton(
          textButton: TextManager.resedVerification,
          textStyle: Styles.textStyle14,
          onPressed: () {},
        ),
      ],
    );
  }
}
