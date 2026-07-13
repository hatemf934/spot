class ParkingOptions {
  bool? freeParkingLot;
  bool? paidParkingLot;
  bool? freeStreetParking;
  bool? paidStreetParking;
  bool? valetParking;
  bool? freeGarageParking;
  bool? paidGarageParking;

  ParkingOptions({
    this.freeParkingLot,
    this.paidParkingLot,
    this.freeStreetParking,
    this.paidStreetParking,
    this.valetParking,
    this.freeGarageParking,
    this.paidGarageParking,
  });

  factory ParkingOptions.fromJson(Map<String, dynamic> json) {
    return ParkingOptions(
      freeParkingLot: json['freeParkingLot'] as bool?,
      paidParkingLot: json['paidParkingLot'] as bool?,
      freeStreetParking: json['freeStreetParking'] as bool?,
      paidStreetParking: json['paidStreetParking'] as bool?,
      valetParking: json['valetParking'] as bool?,
      freeGarageParking: json['freeGarageParking'] as bool?,
      paidGarageParking: json['paidGarageParking'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'freeParkingLot': freeParkingLot,
      'paidParkingLot': paidParkingLot,
      'freeStreetParking': freeStreetParking,
      'paidStreetParking': paidStreetParking,
      'valetParking': valetParking,
      'freeGarageParking': freeGarageParking,
      'paidGarageParking': paidGarageParking,
    };
  }
}
