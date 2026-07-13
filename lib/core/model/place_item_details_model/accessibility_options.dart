class AccessibilityOptions {
  bool? wheelchairAccessibleParking;
  bool? wheelchairAccessibleEntrance;
  bool? wheelchairAccessibleRestroom;
  bool? wheelchairAccessibleSeating;

  AccessibilityOptions({
    this.wheelchairAccessibleParking,
    this.wheelchairAccessibleEntrance,
    this.wheelchairAccessibleRestroom,
    this.wheelchairAccessibleSeating,
  });

  factory AccessibilityOptions.fromJson(Map<String, dynamic> json) {
    return AccessibilityOptions(
      wheelchairAccessibleParking: json['wheelchairAccessibleParking'] as bool?,
      wheelchairAccessibleEntrance:
          json['wheelchairAccessibleEntrance'] as bool?,
      wheelchairAccessibleRestroom:
          json['wheelchairAccessibleRestroom'] as bool?,
      wheelchairAccessibleSeating: json['wheelchairAccessibleSeating'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wheelchairAccessibleParking': wheelchairAccessibleParking,
      'wheelchairAccessibleEntrance': wheelchairAccessibleEntrance,
      'wheelchairAccessibleRestroom': wheelchairAccessibleRestroom,
      'wheelchairAccessibleSeating': wheelchairAccessibleSeating,
    };
  }
}
