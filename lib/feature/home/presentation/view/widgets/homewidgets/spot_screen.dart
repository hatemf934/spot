import 'package:flutter/material.dart';
import 'package:spot/constants.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/gird_view_catogery_card.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/spots_title_row.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/welcome_header.dart';

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
            children: const [
              WelcomeHeader(),
              SizedBox(height: HeightManager.h8),
              SpotsTitleRow(),
              SizedBox(height: HeightManager.h8),
              Expanded(
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
