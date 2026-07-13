import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/home/presentation/view/change_map_location_view.dart';

class TitleWelcomeHeader extends StatefulWidget {
  const TitleWelcomeHeader({super.key});

  @override
  State<TitleWelcomeHeader> createState() => _TitleWelcomeHeaderState();
}

class _TitleWelcomeHeaderState extends State<TitleWelcomeHeader> {
  String currentLocation = TextManager.alexandria;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextManager.welcomeBack,
            style: Styles.textStyleBlack.copyWith(fontSize: FontManager.f24),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                TextManager.yourLocation,
                style: Styles.textStyle14.copyWith(
                  color: ColorManager.greyColor400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ChangeMapLocationView.id,
                    arguments: (String locationName) {
                      setState(() {
                        currentLocation = locationName;
                      });
                    },
                  );
                },
                child: Text(
                  currentLocation,
                  style: Styles.textStyle14.copyWith(
                    color: ColorManager.orangeColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
