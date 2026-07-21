import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spot/core/error/faliure.dart';
import 'package:spot/feature/home/data/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/feature/home/data/repos/place_item_details_repo.dart';

part 'places_item_state.dart';

class PlacesItemCubitCubit extends Cubit<PlacesItemCubitState> {
  PlacesItemCubitCubit(this.placeItemDetailsRepo)
    : super(PlacesItemCubitInitial());

  final PlaceItemDetailsRepo placeItemDetailsRepo;
  String lastQuery = '';

  Future<void> getPlaces({required String textQuery}) async {
    lastQuery = textQuery;
    emit(PlacesItemCubitLoading());
    final result = await placeItemDetailsRepo.getPlaces(textQuery: textQuery);
    result.fold(
      (failure) => emit(PlacesItemCubitFaliure(failure: failure)),
      (placesList) => emit(PlacesItemCubitSuccses(places: placesList)),
    );
  }
}
