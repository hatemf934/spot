import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/hero_image_card_item.dart';
import 'package:spot/feature/home/presentation/view/widgets/info_card_item.dart';

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
      decoration: BoxDecoration(
        color: ColorManager.witheColor,
        borderRadius: BorderRadius.circular(RaduisManager.r14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: RaduisManager.r14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [HeroImageCardItem(), InfoCardItem()],
      ),
    );
  }
}
