import 'package:flutter/material.dart';
import 'package:spot/core/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/width_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/is_open_card_item_section.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/logo_info_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/name_rating_section.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/points_card_item_section.dart';

class InfoCardItem extends StatelessWidget {
  const InfoCardItem({super.key, required this.placeItemDetailsModel});
  final PlaceItemDetailsModel placeItemDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LogoInfoCardItem(),
          SizedBox(width: WidthManager.w12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameAndRatingSection(
                  placeItemDetailsModel: placeItemDetailsModel,
                ),
                SizedBox(height: HeightManager.h5),
                PointsCardItemSection(),
                SizedBox(height: HeightManager.h5),
                IsOpenCardItemSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
