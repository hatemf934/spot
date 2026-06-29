import 'package:flutter/material.dart';
import 'package:spot/core/helpers/custom_aswesome_dialog.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/bloc/login/user_cubit.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';
import 'package:spot/feature/auth/presentation/views/widgets/another_body_of_login_section.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:spot/feature/auth/presentation/views/widgets/group_of_text_feild_regester.dart';
import 'package:spot/feature/auth/presentation/views/widgets/text_of_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/main_screen.dart';

class BodyOfRegester extends StatefulWidget {
  const BodyOfRegester({super.key});

  @override
  State<BodyOfRegester> createState() => _BodyOfRegesterState();
}

class _BodyOfRegesterState extends State<BodyOfRegester> {
  bool isSubmitted = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is SignInSucsses) {
              Navigator.pushReplacementNamed(context, MainScreen.id);
            } else if (state is SignInFailure) {
              CustomAswesomeDialog().AwesomeDialogError(
                context: context,
                description: state.errmessage,
              );
            }
          },
        ),
        BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is SignupSucsses) {
              Navigator.pushReplacementNamed(context, MainScreen.id);
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
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: HeightManager.h40),
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
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<UserCubit>(
                        context,
                      ).signUpWithEmailAndPassword();
                    }
                  });
                },
                text: TextManager.signUp,
              ),
              AnotherAuthSection(
                onPressed: () {
                  context.read<UserCubit>().clearSignUpFields();
                  Navigator.pushNamed(context, LoginView.id);
                },
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
