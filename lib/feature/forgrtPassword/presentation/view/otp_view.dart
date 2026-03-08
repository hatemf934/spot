import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/widget/body_of_otp.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  static String id = RouteManager.otpRoute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      appBar: AppBar(
        backgroundColor: ColorManager.scaffoldColor,
        title: Text(TextManager.otp, style: Styles.textStyle22),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
        child: BodyOfOTP(),
      ),
    );
  }
}
