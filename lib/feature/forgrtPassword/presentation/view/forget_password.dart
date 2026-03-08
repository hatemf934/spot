import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/widget/body_of_forget_password.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  static String id = RouteManager.forgetRoute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      appBar: AppBar(
        backgroundColor: ColorManager.scaffoldColor,
        title: Text(TextManager.forgetPassword, style: Styles.textStyle22),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BodyOfForgetPassword(),
        ),
      ),
    );
  }
}
