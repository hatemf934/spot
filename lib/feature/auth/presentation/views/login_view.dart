import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/auth/data/repo/auth_repo_implement.dart';
import 'package:spot/feature/auth/presentation/bloc/login/login_cubit.dart';
import 'package:spot/feature/auth/presentation/views/widgets/body_of_login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = RouteManager.loginRoute;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoImplement()),
      child: Scaffold(
        backgroundColor: ColorManager.scaffoldColor,
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return ModalProgressHUD(
              progressIndicator: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorManager.primaryColor,
                ),
              ),
              inAsyncCall: state is SignInLoading,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: BodyOfLogin(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
