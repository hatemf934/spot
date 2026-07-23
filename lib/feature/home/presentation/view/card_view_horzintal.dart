import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/helpers/custom_snack_bar.dart';
import 'package:spot/core/helpers/error_view.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/data/model/card_view_argement.dart';
import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/presentation/bloc/places_cubit/places_cubit.dart';
import 'package:spot/feature/home/presentation/view/card_view_vertical.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/body_card_view_map.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/custom_app_bar_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';

class CardViewHorzintal extends StatelessWidget {
  const CardViewHorzintal({
    super.key,
    required this.cubit,
    required this.categoryModel,
  });
  static const String id = RouteManager.cardvievHorzental;
  final PlacesCubit cubit;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: ColorManager.scaffoldColor,
        appBar: CustomAppBarCardView(
          onPressed: () => Navigator.pushReplacementNamed(
            context,
            CardViewVertical.id,
            arguments: CardViewArguments(
              cubit: cubit,
              categoryModel: categoryModel,
            ),
          ),
          spotName: categoryModel.name,
          iconData: Icons.format_list_bulleted,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(PaddingManager.p16),
              child: CustomSearchField(),
            ),
            Expanded(
              child: BlocConsumer<PlacesCubit, PlacesState>(
                listener: (context, state) {
                  if (state is PlacesFaliure) {
                    CustomSnackBar.showError(
                      context,
                      message: state.failure.userMessage,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is PlacesLoading || state is PlacesInitial) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryColor,
                      ),
                    );
                  }

                  if (state is PlacesFaliure) {
                    return ErrorView(
                      failure: state.failure,
                      onRetry: () =>
                          cubit.getPlaces(textQuery: cubit.lastQuery),
                    );
                  }

                  final places = (state as PlacesItemSuccses).places;
                  return BodyCardViewMap(places: places);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
