import 'package:spot/core/model/places_details_model/places_details_model.dart';

abstract class PlaceItemDetailsRepo {
  Future<List<PlacesDetailsModel>> getPlaces({required String textQuery});
}
