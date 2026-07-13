import 'end_price.dart';
import 'start_price.dart';

class PriceRange {
  StartPrice? startPrice;
  EndPrice? endPrice;

  PriceRange({this.startPrice, this.endPrice});

  factory PriceRange.fromJson(Map<String, dynamic> json) {
    return PriceRange(
      startPrice: json['startPrice'] == null
          ? null
          : StartPrice.fromJson(json['startPrice'] as Map<String, dynamic>),
      endPrice: json['endPrice'] == null
          ? null
          : EndPrice.fromJson(json['endPrice'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'startPrice': startPrice?.toJson(), 'endPrice': endPrice?.toJson()};
  }
}
