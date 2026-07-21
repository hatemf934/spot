import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spot/core/api/dio_class.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/data/repos/place_item_details_repo_implement.dart';
import 'package:spot/feature/home/presentation/view/card_view_vertical.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/body_of_catogery_card.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        final places = await PlaceItemDetailsRepoImplement(
          dioClass: DioClass(dio: Dio()),
        ).getPlaces(textQuery: categoryModel.name);
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, CardViewVertical.id, arguments: places);
      },
      child: Container(
        width: screenWidth * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RaduisManager.r18),
          color: categoryModel.color,
        ),
        child: BodyOfCatogeryCard(categoryModel: categoryModel),
      ),
    );
  }
}
