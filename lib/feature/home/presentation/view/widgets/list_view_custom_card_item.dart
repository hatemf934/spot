import 'package:flutter/material.dart';
import 'package:spot/feature/home/presentation/view/widgets/card_item.dart';

class ListviewCardItem extends StatelessWidget {
  const ListviewCardItem({
    super.key,
    required this.scrollDirection,
    required this.sizedBox,
    this.width,
  });
  final Axis scrollDirection;
  final SizedBox sizedBox;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return SizedBox(width: width, child: CustomCardItem());
      },
      separatorBuilder: (context, index) => sizedBox,
      itemCount: 20,
    );
  }
}
