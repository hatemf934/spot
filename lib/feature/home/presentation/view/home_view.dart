import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/route_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = RouteManager.homeviewRoute;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      body: Center(
        child: TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          child: Text("sign out"),
        ),
      ),
    );
  }
}
