import 'package:flutter/material.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/feature/home/presentation/view/card_view_vertical.dart';
import 'package:spot/feature/home/presentation/view/widgets/body_of_catogery_card.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({super.key, required this.color, required this.image});
  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, CardViewVertical.id),
      child: Container(
        width: screenWidth * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RaduisManager.r18),
          color: color,
        ),
        child: BodyOfCatogeryCard(image: image),
      ),
    );
  }
}
