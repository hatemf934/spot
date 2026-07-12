import 'structured_format.dart';
import 'text.dart';

class PlacesCityModel {
  String? place;
  String? placeId;
  Text? text;
  StructuredFormat? structuredFormat;
  List<String>? types;

  PlacesCityModel({
    this.place,
    this.placeId,
    this.text,
    this.structuredFormat,
    this.types,
  });

  factory PlacesCityModel.fromJson(Map<String, dynamic> json) {
    return PlacesCityModel(
      place: json['place'] as String?,
      placeId: json['placeId'] as String?,
      text: json['text'] == null
          ? null
          : Text.fromJson(json['text'] as Map<String, dynamic>),
      structuredFormat: json['structuredFormat'] == null
          ? null
          : StructuredFormat.fromJson(
              json['structuredFormat'] as Map<String, dynamic>,
            ),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place': place,
      'placeId': placeId,
      'text': text?.toJson(),
      'structuredFormat': structuredFormat?.toJson(),
      'types': types,
    };
  }
}
