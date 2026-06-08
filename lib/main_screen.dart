import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/home/presentation/view/home_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static String id = RouteManager.screenview;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [HomeView()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      body: pages[currentIndex],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: ColorManager.primaryColor,
        activeColor: ColorManager.witheColor,
        initialActiveIndex: currentIndex,
        items: [
          TabItem(icon: Icons.home, title: TextManager.home),
          TabItem(icon: Icons.article_outlined, title: TextManager.plans),
          TabItem(
            icon: Icons.account_tree_outlined,
            title: TextManager.explore,
          ),
          TabItem(icon: Icons.person_outline, title: TextManager.profile),
          TabItem(icon: Icons.chat_bubble_outline, title: TextManager.events),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
