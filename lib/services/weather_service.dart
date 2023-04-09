import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  String key = 'c78d74022b3a4946a30220718231503',
      baseUrl = 'http://api.weatherapi.com/v1';
  int day = 0;
  Future<WeatherModel> getWeatherAPI(String cityName) async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$key&q=$cityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.formJson(data, day);
    return weather;
  }
}
