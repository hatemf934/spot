import 'package:flutter/material.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/catogery_card.dart';

class GridViewCatogeryCard extends StatelessWidget {
  const GridViewCatogeryCard({
    super.key,
    required this.colors,
    required this.images,
  });
  final List<Color> colors;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return CatogeryCard(color: colors[index], image: images[index]);
      },
    );
  }
}
