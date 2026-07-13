import 'package:flutter/material.dart';
import 'package:spot/core/utils/font_manager.dart';

class ActionButtonHeader extends StatelessWidget {
  const ActionButtonHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
