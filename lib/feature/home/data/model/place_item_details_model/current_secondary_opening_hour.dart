import 'period.dart';

class CurrentSecondaryOpeningHour {
  bool? openNow;
  List<Period>? periods;
  List<String>? weekdayDescriptions;
  String? secondaryHoursType;
  String? nextOpenTime;

  CurrentSecondaryOpeningHour({
    this.openNow,
    this.periods,
    this.weekdayDescriptions,
    this.secondaryHoursType,
    this.nextOpenTime,
  });

  factory CurrentSecondaryOpeningHour.fromJson(Map<String, dynamic> json) {
    return CurrentSecondaryOpeningHour(
      openNow: json['openNow'] as bool?,
      periods: (json['periods'] as List<dynamic>?)
          ?.map((e) => Period.fromJson(e as Map<String, dynamic>))
          .toList(),
      weekdayDescriptions: (json['weekdayDescriptions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      secondaryHoursType: json['secondaryHoursType'] as String?,
      nextOpenTime: json['nextOpenTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'openNow': openNow,
      'periods': periods?.map((e) => e.toJson()).toList(),
      'weekdayDescriptions': weekdayDescriptions,
      'secondaryHoursType': secondaryHoursType,
      'nextOpenTime': nextOpenTime,
    };
  }
}
