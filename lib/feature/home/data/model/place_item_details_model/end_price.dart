class EndPrice {
  String? currencyCode;
  String? units;

  EndPrice({this.currencyCode, this.units});

  factory EndPrice.fromJson(Map<String, dynamic> json) {
    return EndPrice(
      currencyCode: json['currencyCode'] as String?,
      units: json['units'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'currencyCode': currencyCode, 'units': units};
  }
}
