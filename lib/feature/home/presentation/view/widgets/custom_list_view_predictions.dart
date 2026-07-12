import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spot/core/model/places_city_model/places_city_model.dart';
import 'package:spot/core/utils/color_manager.dart';

class CustomListViewPredictions extends StatelessWidget {
  const CustomListViewPredictions({super.key, required this.places});

  final List<PlacesCityModel> places;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Container(
          color: ColorManager.witheColor,
          child: ListTile(
            title: Text(places[index].text!.text!),
            leading: const FaIcon(
              FontAwesomeIcons.locationDot,
              color: ColorManager.primaryColor,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                color: ColorManager.primaryColor,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(height: 0);
      },
      itemCount: places.length,
    );
  }
}
