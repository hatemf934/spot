import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/auth/presentation/bloc/regester/regester_cubit.dart';
import 'package:spot/feature/auth/presentation/views/widgets/body_of_regester.dart';

class RegesterView extends StatelessWidget {
  const RegesterView({super.key});
  static String id = RouteManager.regesterRoute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PaddingManager.p20),
        child: BlocBuilder<RegesterCubit, RegesterState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignupLoading,
              child: BodyOfRegester(),
            );
          },
        ),
      ),
    );
  }
}
