import 'package:flutter/material.dart';
import 'package:spot/core/color_manager.dart';
import 'package:spot/core/padding_manager.dart';
import 'package:spot/core/route_manager.dart';
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
        child: BodyOfRegester(),
      ),
    );
  }
}
