import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/feature/home/data/model/places_details_model/places_details_model.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_list_view_predictions.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';

class MapSearchOverlay extends StatelessWidget {
  const MapSearchOverlay({
    super.key,
    required this.textEditingController,
    required this.onPlaceSelect,
  });

  final TextEditingController textEditingController;
  final void Function(PlacesDetailsModel place) onPlaceSelect;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(PaddingManager.p16),
        child: Column(
          children: [
            CustomSearchField(textEditingController: textEditingController),
            SizedBox(height: HeightManager.h12),
            CustomListViewPredictions(onPlaceSelect: onPlaceSelect),
          ],
        ),
      ),
    );
  }
}
