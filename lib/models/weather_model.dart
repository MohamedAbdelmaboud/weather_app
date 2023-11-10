class WeatherModel {
  final String cityName;
  final String region;
  final String country;
  final DateTime date;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String? imagePath; //may be null

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.avgTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.condition,
      this.imagePath,
     required this.region,
     required this.country});

  factory WeatherModel.fromJson(dynamic json) {
    dynamic details = json['location']; //first map
    dynamic forecast = json['forecast']['forecastday'][0]['day']; //second map
    dynamic current = json['current'];
    return WeatherModel(
      cityName: details['name'],
      date: DateTime.parse(current['last_updated']),
      country: details['country'],
      region: details['region'],
      avgTemp: forecast['avgtemp_c'],
      minTemp: forecast['mintemp_c'],
      maxTemp: forecast['maxtemp_c'],
      condition: forecast['condition']['text'],
      imagePath: forecast['condition']['icon'],
    );
  }
}
