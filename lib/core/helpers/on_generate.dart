import 'package:flutter/material.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/auth/presentation/views/login_view.dart';
import 'package:spot/feature/auth/presentation/views/regester_view.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/change_password.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/forget_password.dart';
import 'package:spot/feature/forgrtPassword/presentation/view/otp_view.dart';
import 'package:spot/feature/home/data/model/card_view_argement.dart';
import 'package:spot/feature/home/presentation/view/card_view_horzintal.dart';
import 'package:spot/feature/home/presentation/view/card_view_vertical.dart';
import 'package:spot/feature/home/presentation/view/change_map_location_view.dart';
import 'package:spot/feature/home/presentation/view/home_view.dart';
import 'package:spot/feature/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RouteManager.splashRoute:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case RouteManager.loginRoute:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RouteManager.regesterRoute:
      return MaterialPageRoute(builder: (context) => const RegesterView());
    case RouteManager.spotsView:
      return MaterialPageRoute(builder: (context) => const SpotsScreen());
    case RouteManager.changePasswordRoute:
      return MaterialPageRoute(builder: (context) => const ChangePassword());
    case RouteManager.otpRoute:
      return MaterialPageRoute(builder: (context) => const OtpView());
    case RouteManager.forgetRoute:
      return MaterialPageRoute(builder: (context) => const ForgetPassword());

    case RouteManager.cardviewVertical:
      final args = routeSettings.arguments as CardViewArguments;
      return MaterialPageRoute(
        builder: (context) => CardViewVertical(
          cubit: args.cubit,
          categoryModel: args.categoryModel,
        ),
      );

    case RouteManager.cardvievHorzental:
      final args = routeSettings.arguments as CardViewArguments;
      return MaterialPageRoute(
        builder: (context) => CardViewHorzintal(
          cubit: args.cubit,
          categoryModel: args.categoryModel,
        ),
      );

    case RouteManager.changeMapLocationView:
      final onLocationSelected =
          routeSettings.arguments as void Function(String);
      return MaterialPageRoute(
        builder: (context) =>
            ChangeMapLocationView(onLocationSelected: onLocationSelected),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
