


import 'package:weather_app/domain/entities/weather.dart';

abstract class WeatherState{}


class WeatherInitial extends WeatherState{}

class WeatherLoadInProgress extends WeatherState{}

class WeatherLoadSuccess extends WeatherState{
  final Weather weather;

  WeatherLoadSuccess(this.weather);
}

class WeatherLoadFailure extends WeatherState{}