import 'package:flutter/material.dart';
import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/catogery_card.dart';

class GridViewCatogeryCard extends StatelessWidget {
  const GridViewCatogeryCard({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CatogeryCard(categoryModel: categories[index]);
      },
    );
  }
}
