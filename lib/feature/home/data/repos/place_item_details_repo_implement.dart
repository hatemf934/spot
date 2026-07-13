import 'package:dio/dio.dart';
import 'package:spot/core/api/dio_class.dart';
import 'package:spot/core/api/end_points_class.dart';
import 'package:spot/core/model/place_item_details_model/place_item_details_model.dart';
import 'package:spot/feature/home/data/repos/place_item_details_repo.dart';

class PlaceItemDetailsRepoImplement extends PlaceItemDetailsRepo {
  final DioClass dioClass;

  PlaceItemDetailsRepoImplement({required this.dioClass});
  @override
  Future<List<PlaceItemDetailsModel>> getPlaces({
    required String textQuery,
  }) async {
    try {
      final response = await dioClass.post(
        EndPointClass.searchText,
        data: {
          {
            "textQuery": textQuery,
            "locationRestriction": {
              "rectangle": {
                "low": {"latitude": 31.05, "longitude": 29.75},
                "high": {"latitude": 31.35, "longitude": 30.10},
              },
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
      return places;
    } on DioException catch (e) {
      throw Exception('Failed to fetch predictions: ${e.message}');
    }
  }
}
