import 'package:flutter/material.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';
import 'package:spot/feature/auth/presentation/views/regester_view.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/change_password.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/forget_password.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/otp_view.dart';
import 'package:spot/feature/home/presentation/view/home_view.dart';
import 'package:spot/feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouteManager.splashRoute:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case RouteManager.loginRoute:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RouteManager.homeviewRoute:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case RouteManager.regesterRoute:
      return MaterialPageRoute(builder: (context) => const RegesterView());
    case RouteManager.changePasswordRoute:
      return MaterialPageRoute(builder: (context) => const ChangePassword());
    case RouteManager.otpRoute:
      return MaterialPageRoute(builder: (context) => const OtpView());
    case RouteManager.forgetRoute:
      return MaterialPageRoute(builder: (context) => const ForgetPassword());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
