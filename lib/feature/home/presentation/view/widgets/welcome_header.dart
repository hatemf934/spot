import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/home/presentation/view/change_map_location_view.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
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
                    onTap: () =>
                        Navigator.pushNamed(context, ChangeMapLocationView.id),
                    child: Text(
                      TextManager.alexandria,
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
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.storefront_outlined, size: FontManager.f24),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chat_bubble_outline, size: FontManager.f24),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: FontManager.f24,
          ),
        ),
      ],
    );
  }
}
