import 'package:flutter/material.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/width_manager.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_google_map.dart';
import 'package:spot/feature/home/presentation/view/widgets/list_view_custom_card_item.dart';

class BodyCardViewMap extends StatelessWidget {
  const BodyCardViewMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: CustomGoogleMap()),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.32,
            child: Padding(
              padding: const EdgeInsets.only(left: PaddingManager.p12),
              child: ListviewCardItem(
                scrollDirection: Axis.horizontal,
                sizedBox: SizedBox(width: WidthManager.w22),
                width: MediaQuery.of(context).size.width * 0.78,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
