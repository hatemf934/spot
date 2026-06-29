import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spot/feature/home/presentation/view/widgets/spot_screen.dart';

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
      //       await FirebaseAuth.instance.signOut();
      //     },
      //     child: Text("sign out"),
      //   ),
      // ),
    );
  }
}
