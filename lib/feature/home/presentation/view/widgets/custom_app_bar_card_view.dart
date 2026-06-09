import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/styles.dart';

class CustomAppBarCardView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.scaffoldColor,
      title: const Text('Restaurants', style: Styles.textStyleBlack24),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.location_on, size: FontManager.f28),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
