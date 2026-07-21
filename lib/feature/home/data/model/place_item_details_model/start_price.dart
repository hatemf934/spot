class StartPrice {
  String? currencyCode;
  String? units;

  StartPrice({this.currencyCode, this.units});

  factory StartPrice.fromJson(Map<String, dynamic> json) {
    return StartPrice(
      currencyCode: json['currencyCode'] as String?,
      units: json['units'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'currencyCode': currencyCode, 'units': units};
  }
}
