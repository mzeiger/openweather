import 'package:flutter/material.dart';
import 'package:openweather/api/api.dart';
import 'package:openweather/helpers/time_formulars.dart';
import 'package:openweather/models/weather_model.dart';

Widget imageFromOpenWeather(WeatherModel weather) {
  return Column(
    children: [
      Container(
        color: Colors.lightBlue.withOpacity(0.4),
        child: ClipRect(
          child: Align(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Image.network('${iconUrl + weather.weatherIcon!}@2x.png',
                width: 200, height: 200),
          ),
        ),
      ),
      Text(
        '${weather.weatherDescription}',
        style: textStyle(20),
      ),
    ],
  );
}

Widget keyInfo(WeatherModel weather) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Temperature: ${weather.mainTemmp}°F',
              style: TextStyle(
                fontSize: 25,
                color: Formulas.temperatureColor(weather.mainTemmp),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Min Temp: ${weather.mainTempMin}°F',
              style: textStyle(20),
            ),
            Text(
              'Max Temp: ${weather.mainTempMax}°F',
              style: textStyle(20),
            ),
            Text(
              'Humidity: ${weather.mainHumidity}',
              style: textStyle(20),
            ),
            Text(
              'Wind: ${weather.windSpeed} mph',
              style: textStyle(20),
            ),
            Text(
              'Wind Gust: ${weather.windGust} mph',
              style: textStyle(20),
            ),
            Text(
              'Direction: ${weather.windDeg}°',
              style: textStyle(20),
            )
          ],
        ),
      ),
    ),
  );
}

Widget header(WeatherModel weather) {
  return Column(
    children: [
      Text(
        weather.name!,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Text(
        Formulas.getDate(weather.date!, weather.timezone!),
        style: textStyle(20),
      ),
      Text(
        Formulas.getTime(weather.date!, weather.timezone!),
        style: textStyle(20),
      )
    ],
  );
}

Widget timeInfo(WeatherModel weather) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Date: ${Formulas.getDate(weather.date!, weather.timezone!)}',
                  style: textStyle(10)),
              Text(
                  'Time: ${Formulas.getTime(weather.date!, weather.timezone!)}',
                  style: textStyle(10)),
              // Text(
              //     'Sunrise: ${_getSunRiseSunset(weather.sysSunrise!, weather.timezone!)}',
              //     style: textStyle(10)),
              // Text(
              //     'Sunset: ${_getSunRiseSunset(weather.sysSunSet!, weather.timezone!)}',
              // style: textStyle(10)),
            ],
          ),
        ),
      ),
    ),
  );
}

TextStyle textStyle(double size) {
  return TextStyle(
    fontSize: size,
    color: const Color.fromARGB(255, 8, 95, 85),
  );
}
