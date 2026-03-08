import 'package:flutter/material.dart';
import 'package:spot/core/utils/assets_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/password_text_feild.dart';

class BodyOfChangePassword extends StatefulWidget {
  const BodyOfChangePassword({super.key});

  @override
  State<BodyOfChangePassword> createState() => _BodyOfChangePasswordState();
}

class _BodyOfChangePasswordState extends State<BodyOfChangePassword> {
  bool isSubmitted = false;
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
        child: Column(
          children: [
            SizedBox(height: HeightManager.h40),
            Image.asset(AssetsManager.logoForgetPassword),
            SizedBox(height: HeightManager.h40),
            PasswordTextFeild(
              hintPassword: TextManager.newPassword,
              hintConfirmPassword: TextManager.newPassword,
              isSubmitted: isSubmitted,
            ),
            SizedBox(height: HeightManager.h40),
            CustomButton(
              onTap: () {
                setState(() {
                  isSubmitted = true;
                });
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (formkey.currentState!.validate()) {
                    Navigator.pushNamed(context, LoginView.id);
                  }
                });
              },
              text: TextManager.save,
            ),
          ],
        ),
      ),
    );
  }
}
