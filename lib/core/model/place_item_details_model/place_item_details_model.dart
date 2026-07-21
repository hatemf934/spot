

import 'place.dart';

class PlaceItemDetailsModel {
  Place? place;

  PlaceItemDetailsModel({this.place});

  factory PlaceItemDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlaceItemDetailsModel(place: Place.fromJson(json));
  }

  Map<String, dynamic> toJson() {
    return place?.toJson() ?? {};
  }
}
