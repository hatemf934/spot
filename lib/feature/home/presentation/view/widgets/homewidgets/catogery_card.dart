import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/feature/home/data/model/card_view_argement.dart';
import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/presentation/bloc/places_item_cubit/places_item_cubit.dart';
import 'package:spot/feature/home/presentation/view/card_view_vertical.dart';
import 'package:spot/feature/home/presentation/view/widgets/homewidgets/body_of_catogery_card.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({
    super.key,
    required this.categoryModel,
    required this.cubit,
  });

  final CategoryModel categoryModel;
  final PlacesItemCubitCubit cubit;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<PlacesItemCubitCubit, PlacesItemCubitState>(
        builder: (context, state) {
          final spotCount = state is PlacesItemCubitSuccses
              ? state.places.length
              : 0;

          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              CardViewVertical.id,
              arguments: CardViewArguments(
                cubit: cubit,
                categoryModel: categoryModel,
              ),
            ),
            child: Container(
              width: screenWidth * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RaduisManager.r18),
                color: categoryModel.color,
              ),
              child: BodyOfCatogeryCard(
                categoryModel: categoryModel,
                spotCount: spotCount,
              ),
            ),
          );
        },
      ),
    );
  }
}
