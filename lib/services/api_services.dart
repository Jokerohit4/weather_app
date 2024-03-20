

import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<void> fetchWeather() async {
    final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=_cityName&appid=_apiKey');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.data);

        // _temperature = (data['main']['temp'] - 273.15); // Convert to Celsius
        // _weatherCondition = data['weather'][0]['main'];

    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
