import 'place.dart';

class PlaceItemDetailsModel {
  List<Place>? places;

  PlaceItemDetailsModel({this.places});

  factory PlaceItemDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlaceItemDetailsModel(
      places: (json['places'] as List<dynamic>?)
          ?.map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'places': places?.map((e) => e.toJson()).toList()};
  }
}
