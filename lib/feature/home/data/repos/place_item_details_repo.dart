import 'package:dartz/dartz.dart';
import 'package:spot/core/error/faliure.dart';
import 'package:spot/feature/home/data/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/feature/home/data/model/places_city_model/places_city_model.dart';
import 'package:spot/feature/home/data/model/places_details_model/places_details_model.dart';

abstract class PlacesRepo {
  Future<Either<Failure, List<PlaceItemDetailsModel>>> getPlaces({
    required String textQuery,
  });
  Future<Either<Failure, List<PlacesCityModel>>> getPredictions({
    required String input,
    required String sesstionToken,
  });
  Future<Either<Failure, PlacesDetailsModel>> getPlaceDetails({
    required String placeId,
  });
}
