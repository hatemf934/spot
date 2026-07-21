import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spot/core/api/dio_class.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/data/repos/place_item_details_repo_implement.dart';
import 'package:spot/feature/home/presentation/view/card_view_vertical.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/body_of_catogery_card.dart';

class CatogeryCard extends StatefulWidget {
  const CatogeryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<CatogeryCard> createState() => _CatogeryCardState();
}

class _CatogeryCardState extends State<CatogeryCard> {
  late Future<List<dynamic>> placesFuture;

  @override
  void initState() {
    super.initState();
    placesFuture = PlaceItemDetailsRepoImplement(
      dioClass: DioClass(dio: Dio()),
    ).getPlaces(textQuery: widget.categoryModel.name);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<List<dynamic>>(
      future: placesFuture,
      builder: (context, snapshot) {
        final places = snapshot.data ?? [];
        final spotCount = places.length;

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              CardViewVertical.id,
              arguments: places,
            );
          },
          child: Container(
            width: screenWidth * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RaduisManager.r18),
              color: widget.categoryModel.color,
            ),
            child: BodyOfCatogeryCard(
              categoryModel: widget.categoryModel,
              spotCount: spotCount,
            ),
          ),
        );
      },
    );
  }
}
