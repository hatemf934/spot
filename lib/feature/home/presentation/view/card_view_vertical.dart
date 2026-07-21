import 'package:flutter/material.dart';
import 'package:spot/core/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/presentation/view/card_view_horzintal.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/custom_app_bar_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/list_view_custom_card_item.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/total_number_text.dart';

class CardViewVertical extends StatelessWidget {
  const CardViewVertical({super.key, required this.places});
  static const String id = RouteManager.cardviewVertical;
  final List<PlaceItemDetailsModel> places;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      appBar: CustomAppBarCardView(
        onPressed: () => Navigator.pushReplacementNamed(
          context,
          CardViewHorzintal.id,
          arguments: places,
        ),
        iconData: Icons.location_on,
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.p16),
        child: Column(
          children: [
            CustomSearchField(),
            SizedBox(height: HeightManager.h20),
            TotalNumbersText(textNumber: "12 Restaurants"),
            SizedBox(height: HeightManager.h12),
            Expanded(
              child: ListviewCardItem(
                places: places,
                scrollDirection: Axis.vertical,
                sizedBox: SizedBox(height: HeightManager.h20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
