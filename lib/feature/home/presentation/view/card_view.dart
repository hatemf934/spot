import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_app_bar_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';
import 'package:spot/feature/home/presentation/view/widgets/list_view_custom_card_item.dart';
import 'package:spot/feature/home/presentation/view/widgets/total_number_text.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});
  static const String id = RouteManager.cardview;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      appBar: CustomAppBarCardView(),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.p16),
        child: Column(
          children: [
            CustomSearchField(),
            SizedBox(height: HeightManager.h20),
            TotalNumbersText(),
            SizedBox(height: HeightManager.h12),
            Expanded(child: ListviewCardItem()),
          ],
        ),
      ),
    );
  }
}
