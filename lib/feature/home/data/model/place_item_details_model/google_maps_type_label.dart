class GoogleMapsTypeLabel {
  String? text;
  String? languageCode;

  GoogleMapsTypeLabel({this.text, this.languageCode});

  factory GoogleMapsTypeLabel.fromJson(Map<String, dynamic> json) {
    return GoogleMapsTypeLabel(
      text: json['text'] as String?,
      languageCode: json['languageCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'languageCode': languageCode};
  }
}
