import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/feature/home/presentation/view/widgets/card_item.dart';

class ListviewCardItem extends StatelessWidget {
  const ListviewCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return CustomCardItem();
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: HeightManager.h20),
      itemCount: 20,
    );
  }
}
