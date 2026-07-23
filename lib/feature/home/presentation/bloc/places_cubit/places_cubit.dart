import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spot/core/error/faliure.dart';
import 'package:spot/feature/home/data/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/feature/home/data/model/places_city_model/places_city_model.dart';
import 'package:spot/feature/home/data/model/places_details_model/places_details_model.dart';
import 'package:spot/feature/home/data/repos/place_item_details_repo.dart';

part 'places_state.dart';

class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit(this.placeItemDetailsRepo) : super(PlacesInitial());

  final PlacesRepo placeItemDetailsRepo;
  String lastQuery = '';

  Future<void> getPlaces({required String textQuery}) async {
    lastQuery = textQuery;
    emit(PlacesLoading());
    final result = await placeItemDetailsRepo.getPlaces(textQuery: textQuery);
    result.fold(
      (failure) => emit(PlacesFaliure(failure: failure)),
      (placesList) => emit(PlacesItemSuccses(places: placesList)),
    );
  }

  Future<void> getPlaceDetails({required String placeId}) async {
    emit(PlacesLoading());
    final result = await placeItemDetailsRepo.getPlaceDetails(placeId: placeId);
    result.fold(
      (failure) => emit(PlacesFaliure(failure: failure)),
      (placesDetailsList) =>
          emit(PlacesDetailsSuccses(placesDeatils: placesDetailsList)),
    );
  }

  Future<void> getPredictions({
    required String input,
    required String sesstionToken,
  }) async {
    emit(PlacesLoading());
    final result = await placeItemDetailsRepo.getPredictions(
      input: input,
      sesstionToken: sesstionToken,
    );
    result.fold(
      (failure) => emit(PlacesFaliure(failure: failure)),
      (predictionList) => emit(PredictionsSuccses(prediction: predictionList)),
    );
  }
}
