import 'package:flutter/material.dart';
import 'package:spot/core/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/presentation/view/card_view_vertical.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/body_card_view_map.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/custom_app_bar_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';

class CardViewHorzintal extends StatelessWidget {
  const CardViewHorzintal({super.key, required this.places});
  static const String id = RouteManager.cardvievHorzental;
  final List<PlaceItemDetailsModel> places;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      appBar: CustomAppBarCardView(
        onPressed: () => Navigator.pushReplacementNamed(
          context,
          CardViewVertical.id,
          arguments: places,
        ),
        iconData: Icons.format_list_bulleted,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(PaddingManager.p16),
            child: CustomSearchField(),
          ),
          Expanded(child: BodyCardViewMap(places: places)),
        ],
      ),
    );
  }
}
