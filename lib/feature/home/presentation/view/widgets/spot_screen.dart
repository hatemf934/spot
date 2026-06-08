import 'package:flutter/material.dart';
import 'package:spot/constants.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/gird_view_catogery_card.dart';
import 'package:spot/feature/home/presentation/view/widgets/spots_title_row.dart';
import 'package:spot/feature/home/presentation/view/widgets/welcome_header.dart';

class SpotsScreen extends StatelessWidget {
  const SpotsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.p12),
          child: Column(
            children: [
              const WelcomeHeader(),
              const SizedBox(height: HeightManager.h8),
              const SpotsTitleRow(),
              const SizedBox(height: HeightManager.h8),
              const Expanded(
                child: GridViewCatogeryCard(
                  colors: colorCaogety,
                  images: imageCatogery,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
