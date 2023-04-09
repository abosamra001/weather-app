import 'package:flutter/widgets.dart';

import '../models/weather_model.dart';

class WeatherModelProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
