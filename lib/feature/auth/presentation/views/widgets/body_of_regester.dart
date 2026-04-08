import 'package:flutter/material.dart';
import 'package:spot/core/helpers/custom_aswesome_dialog.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/bloc/login/login_cubit.dart';
import 'package:spot/feature/auth/presentation/bloc/regester/regester_cubit.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';
import 'package:spot/feature/auth/presentation/views/widgets/another_body_of_login_section.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/group_of_text_feild_regester.dart';
import 'package:spot/feature/auth/presentation/views/widgets/text_of_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/feature/home/presentation/view/home_view.dart';

class BodyOfRegester extends StatefulWidget {
  const BodyOfRegester({super.key});

  @override
  State<BodyOfRegester> createState() => _BodyOfRegesterState();
}

class _BodyOfRegesterState extends State<BodyOfRegester> {
  bool isSubmitted = false;
  final GlobalKey<FormState> formkey = GlobalKey();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dateController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
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
        ),
        BlocListener<RegesterCubit, RegesterState>(
          listener: (context, state) {
            if (state is SignupSucsses) {
              Navigator.pushReplacementNamed(context, HomeView.id);
            } else if (state is SignupFailure) {
              CustomAswesomeDialog().AwesomeDialogError(
                context: context,
                description: state.errmessage,
              );
            }
          },
        ),
      ],

      child: SingleChildScrollView(
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
              GroupOfTextFeildRegester(
                isSubmitted: isSubmitted,
                fullNameController: fullNameController,
                userNameController: userNameController,
                phoneController: phoneController,
                emailController: emailController,
                passwordController: passwordController,
                dateController: dateController,
                genderController: genderController,
              ),
              const SizedBox(height: HeightManager.h24),
              CustomButton(
                onTap: () {
                  setState(() {
                    isSubmitted = true;
                  });
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<RegesterCubit>(
                        context,
                      ).signUpWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                        fullName: fullNameController.text,
                        phone: phoneController.text,
                        userName: userNameController.text,
                        dateOfBirth: dateController.text,
                        gender: genderController.text,
                      );
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
      ),
    );
  }
}
