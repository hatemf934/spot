import 'accessibility_options.dart';
import 'address_component.dart';
import 'address_descriptor.dart';
import 'containing_place.dart';
import 'current_opening_hours.dart';
import 'current_secondary_opening_hour.dart';
import 'display_name.dart';
import 'google_maps_links.dart';
import 'google_maps_type_label.dart';
import 'location.dart';
import 'parking_options.dart';
import 'payment_options.dart';
import 'plus_code.dart';
import 'postal_address.dart';
import 'price_range.dart';
import 'primary_type_display_name.dart';
import 'regular_opening_hours.dart';
import 'time_zone.dart';
import 'viewport.dart';

class Place {
  String? name;
  String? id;
  List<String>? types;
  String? nationalPhoneNumber;
  String? internationalPhoneNumber;
  String? formattedAddress;
  String? shortFormattedAddress;
  String? adrFormatAddress;
  List<AddressComponent>? addressComponents;
  PlusCode? plusCode;
  Location? location;
  Viewport? viewport;
  double? rating;
  int? userRatingCount;
  String? googleMapsUri;
  String? websiteUri;
  int? utcOffsetMinutes;
  String? businessStatus;
  String? priceLevel;
  PriceRange? priceRange;
  String? iconMaskBaseUri;
  String? iconBackgroundColor;
  DisplayName? displayName;
  String? primaryType;
  PrimaryTypeDisplayName? primaryTypeDisplayName;
  GoogleMapsTypeLabel? googleMapsTypeLabel;
  bool? pureServiceAreaBusiness;
  bool? takeout;
  bool? delivery;
  bool? dineIn;
  bool? curbsidePickup;
  bool? reservable;
  bool? servesBreakfast;
  bool? servesLunch;
  bool? servesDinner;
  bool? servesBeer;
  bool? servesWine;
  bool? servesBrunch;
  bool? servesVegetarianFood;
  bool? servesCoffee;
  bool? servesDessert;
  bool? servesCocktails;
  bool? outdoorSeating;
  bool? liveMusic;
  bool? menuForChildren;
  bool? goodForChildren;
  bool? goodForGroups;
  bool? goodForWatchingSports;
  bool? allowsDogs;
  bool? restroom;
  RegularOpeningHours? regularOpeningHours;
  CurrentOpeningHours? currentOpeningHours;
  List<CurrentSecondaryOpeningHour>? currentSecondaryOpeningHours;
  PaymentOptions? paymentOptions;
  ParkingOptions? parkingOptions;
  AccessibilityOptions? accessibilityOptions;
  List<ContainingPlace>? containingPlaces;
  AddressDescriptor? addressDescriptor;
  GoogleMapsLinks? googleMapsLinks;
  TimeZone? timeZone;
  PostalAddress? postalAddress;

  Place({
    this.name,
    this.id,
    this.types,
    this.nationalPhoneNumber,
    this.internationalPhoneNumber,
    this.formattedAddress,
    this.shortFormattedAddress,
    this.adrFormatAddress,
    this.addressComponents,
    this.plusCode,
    this.location,
    this.viewport,
    this.rating,
    this.userRatingCount,
    this.googleMapsUri,
    this.websiteUri,
    this.utcOffsetMinutes,
    this.businessStatus,
    this.priceLevel,
    this.priceRange,
    this.iconMaskBaseUri,
    this.iconBackgroundColor,
    this.displayName,
    this.primaryType,
    this.primaryTypeDisplayName,
    this.googleMapsTypeLabel,
    this.pureServiceAreaBusiness,
    this.takeout,
    this.delivery,
    this.dineIn,
    this.curbsidePickup,
    this.reservable,
    this.servesBreakfast,
    this.servesLunch,
    this.servesDinner,
    this.servesBeer,
    this.servesWine,
    this.servesBrunch,
    this.servesVegetarianFood,
    this.servesCoffee,
    this.servesDessert,
    this.servesCocktails,
    this.outdoorSeating,
    this.liveMusic,
    this.menuForChildren,
    this.goodForChildren,
    this.goodForGroups,
    this.goodForWatchingSports,
    this.allowsDogs,
    this.restroom,
    this.regularOpeningHours,
    this.currentOpeningHours,
    this.currentSecondaryOpeningHours,
    this.paymentOptions,
    this.parkingOptions,
    this.accessibilityOptions,
    this.containingPlaces,
    this.addressDescriptor,
    this.googleMapsLinks,
    this.timeZone,
    this.postalAddress,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'] as String?,
      id: json['id'] as String?,
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nationalPhoneNumber: json['nationalPhoneNumber'] as String?,
      internationalPhoneNumber: json['internationalPhoneNumber'] as String?,
      formattedAddress: json['formattedAddress'] as String?,
      shortFormattedAddress: json['shortFormattedAddress'] as String?,
      adrFormatAddress: json['adrFormatAddress'] as String?,
      addressComponents: (json['addressComponents'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      plusCode: json['plusCode'] == null
          ? null
          : PlusCode.fromJson(json['plusCode'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      viewport: json['viewport'] == null
          ? null
          : Viewport.fromJson(json['viewport'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      userRatingCount: json['userRatingCount'] as int?,
      googleMapsUri: json['googleMapsUri'] as String?,
      websiteUri: json['websiteUri'] as String?,
      utcOffsetMinutes: json['utcOffsetMinutes'] as int?,
      businessStatus: json['businessStatus'] as String?,
      priceLevel: json['priceLevel'] as String?,
      priceRange: json['priceRange'] == null
          ? null
          : PriceRange.fromJson(json['priceRange'] as Map<String, dynamic>),
      iconMaskBaseUri: json['iconMaskBaseUri'] as String?,
      iconBackgroundColor: json['iconBackgroundColor'] as String?,
      displayName: json['displayName'] == null
          ? null
          : DisplayName.fromJson(json['displayName'] as Map<String, dynamic>),
      primaryType: json['primaryType'] as String?,
      primaryTypeDisplayName: json['primaryTypeDisplayName'] == null
          ? null
          : PrimaryTypeDisplayName.fromJson(
              json['primaryTypeDisplayName'] as Map<String, dynamic>,
            ),
      googleMapsTypeLabel: json['googleMapsTypeLabel'] == null
          ? null
          : GoogleMapsTypeLabel.fromJson(
              json['googleMapsTypeLabel'] as Map<String, dynamic>,
            ),
      pureServiceAreaBusiness: json['pureServiceAreaBusiness'] as bool?,
      takeout: json['takeout'] as bool?,
      delivery: json['delivery'] as bool?,
      dineIn: json['dineIn'] as bool?,
      curbsidePickup: json['curbsidePickup'] as bool?,
      reservable: json['reservable'] as bool?,
      servesBreakfast: json['servesBreakfast'] as bool?,
      servesLunch: json['servesLunch'] as bool?,
      servesDinner: json['servesDinner'] as bool?,
      servesBeer: json['servesBeer'] as bool?,
      servesWine: json['servesWine'] as bool?,
      servesBrunch: json['servesBrunch'] as bool?,
      servesVegetarianFood: json['servesVegetarianFood'] as bool?,
      servesCoffee: json['servesCoffee'] as bool?,
      servesDessert: json['servesDessert'] as bool?,
      servesCocktails: json['servesCocktails'] as bool?,
      outdoorSeating: json['outdoorSeating'] as bool?,
      liveMusic: json['liveMusic'] as bool?,
      menuForChildren: json['menuForChildren'] as bool?,
      goodForChildren: json['goodForChildren'] as bool?,
      goodForGroups: json['goodForGroups'] as bool?,
      goodForWatchingSports: json['goodForWatchingSports'] as bool?,
      allowsDogs: json['allowsDogs'] as bool?,
      restroom: json['restroom'] as bool?,
      regularOpeningHours: json['regularOpeningHours'] == null
          ? null
          : RegularOpeningHours.fromJson(
              json['regularOpeningHours'] as Map<String, dynamic>,
            ),
      currentOpeningHours: json['currentOpeningHours'] == null
          ? null
          : CurrentOpeningHours.fromJson(
              json['currentOpeningHours'] as Map<String, dynamic>,
            ),
      currentSecondaryOpeningHours:
          (json['currentSecondaryOpeningHours'] as List<dynamic>?)
              ?.map(
                (e) => CurrentSecondaryOpeningHour.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      paymentOptions: json['paymentOptions'] == null
          ? null
          : PaymentOptions.fromJson(
              json['paymentOptions'] as Map<String, dynamic>,
            ),
      parkingOptions: json['parkingOptions'] == null
          ? null
          : ParkingOptions.fromJson(
              json['parkingOptions'] as Map<String, dynamic>,
            ),
      accessibilityOptions: json['accessibilityOptions'] == null
          ? null
          : AccessibilityOptions.fromJson(
              json['accessibilityOptions'] as Map<String, dynamic>,
            ),
      containingPlaces: (json['containingPlaces'] as List<dynamic>?)
          ?.map((e) => ContainingPlace.fromJson(e as Map<String, dynamic>))
          .toList(),
      addressDescriptor: json['addressDescriptor'] == null
          ? null
          : AddressDescriptor.fromJson(
              json['addressDescriptor'] as Map<String, dynamic>,
            ),
      googleMapsLinks: json['googleMapsLinks'] == null
          ? null
          : GoogleMapsLinks.fromJson(
              json['googleMapsLinks'] as Map<String, dynamic>,
            ),
      timeZone: json['timeZone'] == null
          ? null
          : TimeZone.fromJson(json['timeZone'] as Map<String, dynamic>),
      postalAddress: json['postalAddress'] == null
          ? null
          : PostalAddress.fromJson(
              json['postalAddress'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'types': types,
      'nationalPhoneNumber': nationalPhoneNumber,
      'internationalPhoneNumber': internationalPhoneNumber,
      'formattedAddress': formattedAddress,
      'shortFormattedAddress': shortFormattedAddress,
      'adrFormatAddress': adrFormatAddress,
      'addressComponents': addressComponents?.map((e) => e.toJson()).toList(),
      'plusCode': plusCode?.toJson(),
      'location': location?.toJson(),
      'viewport': viewport?.toJson(),
      'rating': rating,
      'userRatingCount': userRatingCount,
      'googleMapsUri': googleMapsUri,
      'websiteUri': websiteUri,
      'utcOffsetMinutes': utcOffsetMinutes,
      'businessStatus': businessStatus,
      'priceLevel': priceLevel,
      'priceRange': priceRange?.toJson(),
      'iconMaskBaseUri': iconMaskBaseUri,
      'iconBackgroundColor': iconBackgroundColor,
      'displayName': displayName?.toJson(),
      'primaryType': primaryType,
      'primaryTypeDisplayName': primaryTypeDisplayName?.toJson(),
      'googleMapsTypeLabel': googleMapsTypeLabel?.toJson(),
      'pureServiceAreaBusiness': pureServiceAreaBusiness,
      'takeout': takeout,
      'delivery': delivery,
      'dineIn': dineIn,
      'curbsidePickup': curbsidePickup,
      'reservable': reservable,
      'servesBreakfast': servesBreakfast,
      'servesLunch': servesLunch,
      'servesDinner': servesDinner,
      'servesBeer': servesBeer,
      'servesWine': servesWine,
      'servesBrunch': servesBrunch,
      'servesVegetarianFood': servesVegetarianFood,
      'servesCoffee': servesCoffee,
      'servesDessert': servesDessert,
      'servesCocktails': servesCocktails,
      'outdoorSeating': outdoorSeating,
      'liveMusic': liveMusic,
      'menuForChildren': menuForChildren,
      'goodForChildren': goodForChildren,
      'goodForGroups': goodForGroups,
      'goodForWatchingSports': goodForWatchingSports,
      'allowsDogs': allowsDogs,
      'restroom': restroom,
      'regularOpeningHours': regularOpeningHours?.toJson(),
      'currentOpeningHours': currentOpeningHours?.toJson(),
      'currentSecondaryOpeningHours': currentSecondaryOpeningHours
          ?.map((e) => e.toJson())
          .toList(),
      'paymentOptions': paymentOptions?.toJson(),
      'parkingOptions': parkingOptions?.toJson(),
      'accessibilityOptions': accessibilityOptions?.toJson(),
      'containingPlaces': containingPlaces?.map((e) => e.toJson()).toList(),
      'addressDescriptor': addressDescriptor?.toJson(),
      'googleMapsLinks': googleMapsLinks?.toJson(),
      'timeZone': timeZone?.toJson(),
      'postalAddress': postalAddress?.toJson(),
    };
  }
}
