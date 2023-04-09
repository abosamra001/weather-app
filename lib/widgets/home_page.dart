import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/weather_model_provider.dart';
import '../widgets/search_page.dart';
import '../models/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  void setValues() {
    weatherData = Provider.of<WeatherModelProvider>(context).weatherData;
  }

  @override
  Widget build(BuildContext context) {
    setValues();
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            weatherData == null ? Colors.blue : weatherData!.getThemeColor()[0],
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: weatherData == null
          ? const Center(child: Text('click the search icon to search a city'))
          : Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: weatherData!.getThemeColor(),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset('assets/images/sunny.jpeg'),
                    Text(
                      weatherData!.city,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'last update ${DateFormat.jm().format(DateTime.parse(weatherData!.date))}'),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'http:${weatherData!.icon}',
                        ),
                        Text(
                          weatherData!.temp.toInt().toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text(
                              'maxtemp: ${weatherData!.maxTemp.toInt().toString()}',
                            ),
                            Text(
                              'mintemp: ${weatherData!.minTemp.toInt().toString()}',
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      weatherData!.weatherState,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    // MaterialButton(
                    //   onPressed: () {
                    //     setState(() {});
                    //   },
                    //   child: const Text('setState'),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
