class Weather {
  final String locationName;
  final String country;
  final double tempC;
  final String condition;
  final double windmph;
  final int cloud;
  final String localTime;
  // final double lat;
  // final double lon;
  // final String conditionText;

  Weather({
    required this.locationName,
    required this.country,
    required this.tempC,
    required this.condition,
    required this.windmph,
    required this.cloud,
    required this.localTime,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      locationName: json["location"]["name"],
      country: json["location"]["country"],
      tempC: json["current"]["temp_c"],
      condition: (json["current"]["condition"]["icon"]),
      windmph: json['current']["wind_mph"],
      cloud: json['current']["cloud"],
      localTime: json["location"]["localtime"],
    );
  }
}
