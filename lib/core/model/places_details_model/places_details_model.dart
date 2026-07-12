import 'address_component.dart';
import 'display_name.dart';
import 'google_maps_links.dart';
import 'location.dart';
import 'time_zone.dart';
import 'viewport.dart';

class PlacesDetailsModel {
  String? name;
  String? id;
  List<String>? types;
  String? formattedAddress;
  List<AddressComponent>? addressComponents;
  Location? location;
  Viewport? viewport;
  String? googleMapsUri;
  int? utcOffsetMinutes;
  String? adrFormatAddress;
  String? iconMaskBaseUri;
  String? iconBackgroundColor;
  DisplayName? displayName;
  String? shortFormattedAddress;
  bool? pureServiceAreaBusiness;
  GoogleMapsLinks? googleMapsLinks;
  TimeZone? timeZone;

  PlacesDetailsModel({
    this.name,
    this.id,
    this.types,
    this.formattedAddress,
    this.addressComponents,
    this.location,
    this.viewport,
    this.googleMapsUri,
    this.utcOffsetMinutes,
    this.adrFormatAddress,
    this.iconMaskBaseUri,
    this.iconBackgroundColor,
    this.displayName,
    this.shortFormattedAddress,
    this.pureServiceAreaBusiness,
    this.googleMapsLinks,
    this.timeZone,
  });

  factory PlacesDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlacesDetailsModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      formattedAddress: json['formattedAddress'] as String?,
      addressComponents: (json['addressComponents'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      viewport: json['viewport'] == null
          ? null
          : Viewport.fromJson(json['viewport'] as Map<String, dynamic>),
      googleMapsUri: json['googleMapsUri'] as String?,
      utcOffsetMinutes: json['utcOffsetMinutes'] as int?,
      adrFormatAddress: json['adrFormatAddress'] as String?,
      iconMaskBaseUri: json['iconMaskBaseUri'] as String?,
      iconBackgroundColor: json['iconBackgroundColor'] as String?,
      displayName: json['displayName'] == null
          ? null
          : DisplayName.fromJson(json['displayName'] as Map<String, dynamic>),
      shortFormattedAddress: json['shortFormattedAddress'] as String?,
      pureServiceAreaBusiness: json['pureServiceAreaBusiness'] as bool?,
      googleMapsLinks: json['googleMapsLinks'] == null
          ? null
          : GoogleMapsLinks.fromJson(
              json['googleMapsLinks'] as Map<String, dynamic>,
            ),
      timeZone: json['timeZone'] == null
          ? null
          : TimeZone.fromJson(json['timeZone'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'types': types,
      'formattedAddress': formattedAddress,
      'addressComponents': addressComponents?.map((e) => e.toJson()).toList(),
      'location': location?.toJson(),
      'viewport': viewport?.toJson(),
      'googleMapsUri': googleMapsUri,
      'utcOffsetMinutes': utcOffsetMinutes,
      'adrFormatAddress': adrFormatAddress,
      'iconMaskBaseUri': iconMaskBaseUri,
      'iconBackgroundColor': iconBackgroundColor,
      'displayName': displayName?.toJson(),
      'shortFormattedAddress': shortFormattedAddress,
      'pureServiceAreaBusiness': pureServiceAreaBusiness,
      'googleMapsLinks': googleMapsLinks?.toJson(),
      'timeZone': timeZone?.toJson(),
    };
  }
}
