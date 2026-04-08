import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/helpers/custom_aswesome_dialog.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/bloc/login/login_cubit.dart';
import 'package:spot/feature/auth/presentation/views/regester_view.dart';
import 'package:spot/feature/auth/presentation/views/widgets/another_body_of_login_section.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/group_of_text_feild_login.dart';
import 'package:spot/feature/auth/presentation/views/widgets/text_of_login.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/forget_password.dart';
import 'package:spot/feature/home/presentation/view/home_view.dart';

class BodyOfLogin extends StatefulWidget {
  const BodyOfLogin({super.key});

  @override
  State<BodyOfLogin> createState() => _BodyOfLoginState();
}

class _BodyOfLoginState extends State<BodyOfLogin> {
  bool isSubmitted = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameAndPhoneController =
      TextEditingController();
  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    userNameAndPhoneController.dispose();
  }

  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SignInSucsses) {
          Navigator.pushReplacementNamed(context, HomeView.id);
        } else if (state is SignInFailure) {
          CustomAswesomeDialog().AwesomeDialogError(
            context: context,
            description: state.errmessage,
          );
        }
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.08),
              const TitleAuth(
                title: TextManager.welcomeBack,
                subTitle: TextManager.enterLoginInfo,
              ),
              GroupOfTextFeildLogin(
                passwordController: passwordController,
                userNameAndPhoneController: userNameAndPhoneController,
                isSubmitted: isSubmitted,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                  textButton: TextManager.forgetPassword,
                  textStyle: Styles.textStyle16,
                  onPressed: () =>
                      Navigator.pushNamed(context, ForgetPassword.id),
                ),
              ),
              const SizedBox(height: HeightManager.h24),
              CustomButton(
                onTap: () {
                  setState(() {
                    isSubmitted = true;
                  });
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).loginUser(
                        identifier: userNameAndPhoneController.text,
                        password: passwordController.text,
                      );
                    }
                  });
                },
                text: TextManager.login,
              ),
              AnotherAuthSection(
                onPressed: () => Navigator.pushNamed(context, RegesterView.id),
                textGoogle: TextManager.loginWithGoogle,
                textFacebook: TextManager.loginWithFacebook,
                haveAccount: TextManager.dontHaveAccount,
                textButton: TextManager.signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
