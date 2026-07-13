import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/total_number_text.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          TextManager.eventsText,
          style: Styles.textStyleBlack.copyWith(fontSize: FontManager.f24),
        ),
      ),
      backgroundColor: ColorManager.scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(PaddingManager.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchField(),
            SizedBox(height: HeightManager.h20),
            TotalNumbersText(textNumber: "24 Spots"),
          ],
        ),
      ),
    );
  }
}
