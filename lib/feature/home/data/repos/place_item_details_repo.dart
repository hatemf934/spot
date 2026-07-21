import 'package:dartz/dartz.dart';
import 'package:spot/core/error/faliure.dart';
import 'package:spot/feature/home/data/model/place_item_details_model/place_item_details_model.dart';

abstract class PlaceItemDetailsRepo {
  Future<Either<Failure, List<PlaceItemDetailsModel>>> getPlaces({
    required String textQuery,
  });
}
