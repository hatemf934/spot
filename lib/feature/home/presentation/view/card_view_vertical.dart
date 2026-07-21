import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/helpers/custom_snack_bar.dart';
import 'package:spot/core/helpers/error_view.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/route_manager.dart';
import 'package:spot/feature/home/data/model/card_view_argement.dart';
import 'package:spot/feature/home/data/model/catogery_model.dart';
import 'package:spot/feature/home/presentation/bloc/places_item_cubit/places_item_cubit.dart';
import 'package:spot/feature/home/presentation/view/card_view_horzintal.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/custom_app_bar_card_view.dart';
import 'package:spot/feature/home/presentation/view/widgets/custom_search_feild.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/list_view_custom_card_item.dart';
import 'package:spot/feature/home/presentation/view/widgets/cardviewWidgets/total_number_text.dart';

class CardViewVertical extends StatelessWidget {
  const CardViewVertical({
    super.key,
    required this.cubit,
    required this.categoryModel,
  });
  static const String id = RouteManager.cardviewVertical;
  final PlacesItemCubitCubit cubit;
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
            CardViewHorzintal.id,
            arguments: CardViewArguments(
              cubit: cubit,
              categoryModel: categoryModel,
            ),
          ),
          spotName: categoryModel.name,
          iconData: Icons.location_on,
        ),
        body: Padding(
          padding: const EdgeInsets.all(PaddingManager.p16),
          child: Column(
            children: [
              const CustomSearchField(),
              SizedBox(height: HeightManager.h20),
              Expanded(
                child: BlocConsumer<PlacesItemCubitCubit, PlacesItemCubitState>(
                  listener: (context, state) {
                    if (state is PlacesItemCubitFaliure) {
                      CustomSnackBar.showError(
                        context,
                        message: state.failure.userMessage,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is PlacesItemCubitLoading ||
                        state is PlacesItemCubitInitial) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primaryColor,
                        ),
                      );
                    }
                    if (state is PlacesItemCubitFaliure) {
                      return ErrorView(
                        failure: state.failure,
                        onRetry: () =>
                            cubit.getPlaces(textQuery: cubit.lastQuery),
                      );
                    }
                    final places = (state as PlacesItemCubitSuccses).places;
                    return Column(
                      children: [
                        TotalNumbersText(
                          textNumber: "${places.length} ${categoryModel.name}",
                        ),
                        SizedBox(height: HeightManager.h12),
                        Expanded(
                          child: ListviewCardItem(
                            places: places,
                            scrollDirection: Axis.vertical,
                            sizedBox: SizedBox(height: HeightManager.h20),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
