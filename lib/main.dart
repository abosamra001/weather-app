import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/home_page.dart';
import './providers/weather_model_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherModelProvider(),
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherModelProvider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<WeatherModelProvider>(context)
                      .weatherData!
                      .getThemeColor()[0] as MaterialColor),
      home: const HomePage(),
    );
  }
}
