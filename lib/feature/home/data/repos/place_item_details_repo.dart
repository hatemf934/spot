import 'package:spot/feature/home/data/model/place_item_details_model/place_item_details_model.dart';

abstract class PlaceItemDetailsRepo {
  Future<List<PlaceItemDetailsModel>> getPlaces({required String textQuery});
}
