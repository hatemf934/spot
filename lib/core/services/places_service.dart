import 'package:dio/dio.dart';
import 'package:spot/core/api/dio_class.dart';
import 'package:spot/core/api/end_points_class.dart';
import 'package:spot/core/model/places_city_model/places_city_model.dart';
import 'package:spot/core/model/places_details_model/places_details_model.dart';

class GoogleMapsPlacesService {
  GoogleMapsPlacesService({required this.dioClass});
  final DioClass dioClass;

  Future<List<PlacesCityModel>> getPredictions({required String input}) async {
    try {
      final response = await dioClass.post(
        EndPointClass.autocomplete,
        data: {
          "input": input,
          "includedPrimaryTypes": ["locality"],
        },
      );

      List<dynamic> suggestions = response['suggestions'];
      List<PlacesCityModel> predictions = suggestions
          .map(
            (item) => PlacesCityModel.fromJson(
              item['placePrediction'] as Map<String, dynamic>,
            ),
          )
          .toList();
      return predictions;
    } on DioException catch (e) {
      throw Exception('Failed to fetch predictions: ${e.message}');
    }
  }

  Future<PlacesDetailsModel> getPlaceDetails({required String placeId}) async {
    try {
      final response = await dioClass.get(
        EndPointClass.placesDetails + placeId,
      );
      return PlacesDetailsModel.fromJson(response);
    } on DioException catch (e) {
      throw Exception('Failed to fetch predictions: ${e.message}');
    }
  }
}
