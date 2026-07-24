import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/home/presentation/view/change_map_location_view.dart';

class LocationSelectorRow extends StatelessWidget {
  const LocationSelectorRow({
    super.key,
    required this.currentLocation,
    required this.onLocationChanged,
  });

  final String currentLocation;
  final void Function(String locationName) onLocationChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          TextManager.yourLocation,
          style: Styles.textStyle14.copyWith(color: ColorManager.greyColor400),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            ChangeMapLocationView.id,
            arguments: onLocationChanged,
          ),
          child: Text(
            currentLocation,
            style: Styles.textStyle14.copyWith(color: ColorManager.orangeColor),
          ),
        ),
      ],
    );
  }
}
