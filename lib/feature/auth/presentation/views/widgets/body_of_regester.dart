import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';
import 'package:spot/feature/auth/presentation/views/widgets/another_body_of_login_section.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/group_of_text_feild_regester.dart';
import 'package:spot/feature/auth/presentation/views/widgets/text_of_login.dart';

class BodyOfRegester extends StatefulWidget {
  const BodyOfRegester({super.key});

  @override
  State<BodyOfRegester> createState() => _BodyOfRegesterState();
}

class _BodyOfRegesterState extends State<BodyOfRegester> {
  bool isSubmitted = false;
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.05),
            TitleAuth(
              title: TextManager.signUp,
              subTitle: TextManager.signUpSubTitle,
            ),
            const SizedBox(height: HeightManager.h32),
            GroupOfTextFeildRegester(isSubmitted: isSubmitted),
            const SizedBox(height: HeightManager.h24),
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
              text: TextManager.signUp,
            ),
            AnotherAuthSection(
              onPressed: () => Navigator.pushNamed(context, LoginView.id),
              textGoogle: TextManager.signUpWithGoogle,
              textFacebook: TextManager.signUpWithFacebook,
              haveAccount: TextManager.alreadyHaveAccount,
              textButton: TextManager.signIn,
            ),
          ],
        ),
      ),
    );
  }
}
