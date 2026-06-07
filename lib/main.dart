import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/helpers/on_generate.dart';
import 'package:spot/feature/auth/data/repo/auth_repo_implement.dart';
import 'package:spot/feature/auth/presentation/bloc/login/login_cubit.dart';
import 'package:spot/feature/splash/presentation/views/splash_view.dart';
import 'package:spot/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Spot());
}

class Spot extends StatelessWidget {
  const Spot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(AuthRepoImplement()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.id,
      ),
    );
  }
}
