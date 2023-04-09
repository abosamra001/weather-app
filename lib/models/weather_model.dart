import 'package:flutter/material.dart';

class WeatherModel {
  String city, weatherState, icon, date;
  double temp, minTemp, maxTemp;
  WeatherModel({
    required this.city,
    required this.temp,
    required this.weatherState,
    required this.date,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
  });
  factory WeatherModel.formJson(data, int day) {
    var jsonDataOfDay = data['forecast']['forecastday'][day];
    return WeatherModel(
      city: data['location']['name'],
      temp: data['current']['temp_c'],
      date: data['current']['last_updated'],
      maxTemp: jsonDataOfDay['day']['maxtemp_c'],
      minTemp: jsonDataOfDay['day']['mintemp_c'],
      icon: jsonDataOfDay['day']['condition']['icon'],
      weatherState: jsonDataOfDay['day']['condition']['text'],
    );
  }

  List<Color> getThemeColor() {
    if (weatherState.contains('thunder')) {
      return [Colors.purple, Colors.purple[300]!, Colors.white];
    } else if (weatherState == 'Partly cloudy' ||
        weatherState == 'Cloudy' ||
        weatherState == 'Mist' ||
        weatherState == 'Overcast' ||
        weatherState.contains('rain')) {
      return [Colors.grey, Colors.grey[300]!, Colors.white];
    } else if (weatherState == 'Sunny' || weatherState == 'Clear') {
      return [Colors.orange, Colors.orange[300]!, Colors.yellow];
    } else {
      return [Colors.green, Colors.white];
    }
  }
}
