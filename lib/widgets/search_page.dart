import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_model_provider.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final cityEntered = TextEditingController();

  void _submit(ctx) async {
    WeatherService service = WeatherService();

    WeatherModel weather = await service.getWeatherAPI(cityEntered.text);
    Provider.of<WeatherModelProvider>(ctx, listen: false).weatherData = weather;

    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search a City')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: cityEntered,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: 'enter city name',
              label: const Text('Search'),
              suffixIcon: IconButton(
                onPressed: () => _submit(context),
                icon: const Icon(Icons.search),
              ),
            ),
            autofocus: true,
            onSubmitted: (_) => _submit(context),
          ),
        ),
      ),
    );
  }
}

// WeatherModel? globalWeatherModel;
