import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';

class CustomAppBarCardView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarCardView({
    super.key,
    required this.onPressed,
    required this.iconData,
  });
  final VoidCallback onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.scaffoldColor,
      title: const Text('Restaurants', style: Styles.textStyleBlack24),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(iconData, size: FontManager.f28),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
