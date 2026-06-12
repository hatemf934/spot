import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/presentation/view/card_view_horzintal.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_app_bar_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';
import 'package:spot/feature/home/presentation/view/widgets/list_view_custom_card_item.dart';
import 'package:spot/feature/home/presentation/view/widgets/total_number_text.dart';

class CardViewVertical extends StatelessWidget {
  const CardViewVertical({super.key});
  static const String id = RouteManager.cardviewVertical;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      appBar: CustomAppBarCardView(
        onPressed: () =>
            Navigator.pushReplacementNamed(context, CardViewHorzintal.id),
        iconData: Icons.location_on,
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.p16),
        child: Column(
          children: [
            CustomSearchField(),
            SizedBox(height: HeightManager.h20),
            TotalNumbersText(),
            SizedBox(height: HeightManager.h12),
            Expanded(
              child: ListviewCardItem(
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
