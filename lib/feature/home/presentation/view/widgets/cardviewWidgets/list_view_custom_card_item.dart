import 'package:flutter/material.dart';
import 'package:spot/feature/home/data/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/card_item.dart';

class ListviewCardItem extends StatelessWidget {
  const ListviewCardItem({
    super.key,
    required this.scrollDirection,
    required this.sizedBox,
    this.width,
    required this.places,
  });
  final Axis scrollDirection;
  final SizedBox sizedBox;
  final double? width;
  final List<PlaceItemDetailsModel> places;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: scrollDirection,
      itemBuilder: (context, index) {
        return SizedBox(
          width: width,
          child: CustomCardItem(placeItemDetailsModel: places[index]),
        );
      },
      separatorBuilder: (context, index) => sizedBox,
      itemCount: places.length,
    );
  }
}
