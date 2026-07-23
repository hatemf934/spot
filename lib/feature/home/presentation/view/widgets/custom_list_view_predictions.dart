import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spot/core/helpers/custom_snack_bar.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/feature/home/data/model/places_details_model/places_details_model.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/feature/home/presentation/bloc/places_cubit/places_cubit.dart';

class CustomListViewPredictions extends StatelessWidget {
  const CustomListViewPredictions({super.key, required this.onPlaceSelect});

  final void Function(PlacesDetailsModel) onPlaceSelect;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesDetailsSuccses) {
          onPlaceSelect(state.placesDeatils);
        }
        if (state is PlacesFaliure) {
          CustomSnackBar.showError(context, message: state.failure.userMessage);
        }
      },
      builder: (context, state) {
        if (state is PlacesLoading) {
          return Container(
            color: ColorManager.witheColor,
            height: HeightManager.h70,
            child: Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            ),
          );
        } else if (state is PredictionsSuccses) {
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Container(
                color: ColorManager.witheColor,
                child: ListTile(
                  title: Text(state.prediction[index].text!.text!),
                  leading: const FaIcon(
                    FontAwesomeIcons.locationDot,
                    color: ColorManager.primaryColor,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<PlacesCubit>().getPlaceDetails(
                        placeId: state.prediction[index].placeId.toString(),
                      );
                    },
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
            itemCount: state.prediction.length,
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
