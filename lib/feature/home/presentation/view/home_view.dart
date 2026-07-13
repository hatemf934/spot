import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/feature/auth/presentation/bloc/login/user_cubit.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/spot_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpotsScreen(),
      // body: Center(
      //   child: TextButton(
      //     onPressed: () async {
      //       Navigator.pop(context);
      //       context.read<UserCubit>().clearSignInFields();
      //       context.read<UserCubit>().clearSignUpFields();
      //       await FirebaseAuth.instance.signOut();
      //     },
      //     child: Text("sign out"),
      //   ),
      // ),
    );
  }
}
