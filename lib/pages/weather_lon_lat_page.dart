import 'package:flutter/material.dart';
import 'package:openweather/Widgets/weather_widgets.dart';
import 'package:openweather/models/geo_model.dart';
import 'package:openweather/models/weather_model.dart';

class WeatherLLPage extends StatelessWidget {
  const WeatherLLPage(
      {required this.geoModel, super.key, required this.weather});

  final GeoModel geoModel;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Weather Details'),
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
            leading: IconButton(
              onPressed: () => Navigator.of(context)
                ..pop()
                ..pop(),
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(55, 110, 110, 241),
                    Color.fromARGB(120, 13, 13, 77),
                  ]),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _location(),
                  const SizedBox(height: 10),
                  imageFromOpenWeather(weather),
                  const SizedBox(height: 10),
                  keyInfo(weather),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _location() {
    return Column(
      children: [
        Text('${geoModel.name}', style: textStyle(20)),
        Text(
          '${geoModel.state}, ${geoModel.country}',
          style: textStyle(15),
        ),
      ],
    );
  }
}
