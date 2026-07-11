import 'package:flutter/material.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_google_map.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';

class ChangeMapLocationView extends StatelessWidget {
  const ChangeMapLocationView({super.key});
  static const String id = RouteManager.changeMapLocationView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          CustomGoogleMap(),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(PaddingManager.p16),
              child: CustomSearchField(),
            ),
          ),
        ],
      ),
    );
  }
}
