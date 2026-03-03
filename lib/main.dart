import 'package:flutter/material.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';
import 'package:spot/feature/auth/presentation/views/regester_view.dart';
import 'package:spot/feature/splash/presentation/views/splash_view.dart';

void main() async {
  runApp(const Spot());
}

class Spot extends StatelessWidget {
  const Spot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      routes: {
        SplashView.id: (context) => SplashView(),
        LoginView.id: (context) => LoginView(),
        RegesterView.id: (context) => RegesterView(),
      },
    );
  }
}
