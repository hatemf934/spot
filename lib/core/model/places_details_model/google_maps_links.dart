class GoogleMapsLinks {
  String? directionsUri;
  String? placeUri;
  String? photosUri;

  GoogleMapsLinks({this.directionsUri, this.placeUri, this.photosUri});

  factory GoogleMapsLinks.fromJson(Map<String, dynamic> json) {
    return GoogleMapsLinks(
      directionsUri: json['directionsUri'] as String?,
      placeUri: json['placeUri'] as String?,
      photosUri: json['photosUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'directionsUri': directionsUri,
      'placeUri': placeUri,
      'photosUri': photosUri,
    };
  }
}
