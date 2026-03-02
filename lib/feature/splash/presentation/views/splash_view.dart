import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spot/core/assets_manager.dart';
import 'package:spot/core/color_manager.dart';
import 'package:spot/core/route_manager.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = RouteManager.splashRoute;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // @override
  @override
  void initState() {
    super.initState();
    navigatorDelayed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.splashColor,
      body: Center(
        child: ShakeY(
          from: 20,
          duration: Duration(seconds: 5),
          infinite: true,
          child: Stack(
            children: [
              Image.asset(AssetsManager.logoSpot),
              Positioned(
                right: MediaQuery.of(context).size.width * 0.12,
                child: Image.asset(AssetsManager.vectorSpot),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigatorDelayed() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, LoginView.id);
    });
  }
}
