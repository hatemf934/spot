import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/text_manager.dart';

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
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: FontManager.f14,
                    color: ColorManager.greyColor400,
                  ),
                  children: [
                    TextSpan(text: TextManager.yourLocation),
                    TextSpan(
                      text: TextManager.alexandria,
                      style: TextStyle(
                        color: ColorManager.orangeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
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
