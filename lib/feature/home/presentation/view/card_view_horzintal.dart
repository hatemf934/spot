import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/core/utils/width_manager.dart';
import 'package:spot/feature/home/presentation/view/card_view_vertical.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_app_bar_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';
import 'package:spot/feature/home/presentation/view/widgets/list_view_custom_card_item.dart';

class CardViewHorzintal extends StatelessWidget {
  const CardViewHorzintal({super.key});
  static const String id = RouteManager.cardvievHorzental;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldColor,
      appBar: CustomAppBarCardView(
        onPressed: () =>
            Navigator.pushReplacementNamed(context, CardViewVertical.id),
        iconData: Icons.format_list_bulleted,
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.p16),
        child: Column(
          children: [
            CustomSearchField(),
            Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: ListviewCardItem(
                scrollDirection: Axis.horizontal,
                sizedBox: SizedBox(width: WidthManager.w22),
                width: MediaQuery.of(context).size.width * 0.78,
              ),
            ),
            SizedBox(height: HeightManager.h20),
          ],
        ),
      ),
    );
  }
}
