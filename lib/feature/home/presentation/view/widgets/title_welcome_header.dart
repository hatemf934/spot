import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
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
            style: TextStyle(
              fontSize: FontManager.f24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                TextManager.yourLocation,
                style: TextStyle(
                  fontSize: FontManager.f14,
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
                  style: TextStyle(
                    fontSize: FontManager.f14,
                    color: ColorManager.orangeColor,
                    fontWeight: FontWeight.w600,
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
