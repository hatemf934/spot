import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spot/core/api/dio_class.dart';
import 'package:spot/core/api/end_points_class.dart';
import 'package:spot/core/error/faliure.dart';
import 'package:spot/core/error/general_failure.dart';
import 'package:spot/core/error/server_failure.dart';
import 'package:spot/feature/home/data/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/feature/home/data/repos/place_item_details_repo.dart';

class PlaceItemDetailsRepoImplement extends PlaceItemDetailsRepo {
  final DioClass dioClass;

  PlaceItemDetailsRepoImplement({required this.dioClass});
  @override
  Future<Either<Failure, List<PlaceItemDetailsModel>>> getPlaces({
    required String textQuery,
  }) async {
    try {
      final response = await dioClass.post(
        EndPointClass.searchText,
        data: {
          "textQuery": textQuery,
          "locationRestriction": {
            "rectangle": {
              "low": {"latitude": 31.05, "longitude": 29.75},
              "high": {"latitude": 31.35, "longitude": 30.10},
            },
          },
        },
      );
      List<dynamic> data = response['places'];
      List<PlaceItemDetailsModel> places = data
          .map(
            (item) =>
                PlaceItemDetailsModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
      return right(places);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } on TypeError catch (e) {
      return left(GeneralFailure.fromException(e));
    } on FormatException catch (e) {
      return left(GeneralFailure.fromException(e));
    } catch (e) {
      return left(GeneralFailure.fromException(e));
    }
  }
}
