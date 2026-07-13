class PaymentOptions {
  bool? acceptsCreditCards;
  bool? acceptsDebitCards;
  bool? acceptsCashOnly;
  bool? acceptsNfc;

  PaymentOptions({
    this.acceptsCreditCards,
    this.acceptsDebitCards,
    this.acceptsCashOnly,
    this.acceptsNfc,
  });

  factory PaymentOptions.fromJson(Map<String, dynamic> json) {
    return PaymentOptions(
      acceptsCreditCards: json['acceptsCreditCards'] as bool?,
      acceptsDebitCards: json['acceptsDebitCards'] as bool?,
      acceptsCashOnly: json['acceptsCashOnly'] as bool?,
      acceptsNfc: json['acceptsNfc'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'acceptsCreditCards': acceptsCreditCards,
      'acceptsDebitCards': acceptsDebitCards,
      'acceptsCashOnly': acceptsCashOnly,
      'acceptsNfc': acceptsNfc,
    };
  }
}
