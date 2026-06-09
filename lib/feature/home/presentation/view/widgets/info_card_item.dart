import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/width_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/is_open_card_item_section.dart';
import 'package:spot/feature/home/presentation/view/widgets/logo_info_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/name_rating_section.dart';
import 'package:spot/feature/home/presentation/view/widgets/points_card_item_section.dart';

class InfoCardItem extends StatelessWidget {
  const InfoCardItem({super.key});

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
                NameAndRatingSection(rating: 4.2),
                const SizedBox(height: HeightManager.h5),
                PointsCardItemSection(),
                const SizedBox(height: HeightManager.h5),
                IsOpenCardItemSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
