import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio dio;
  final String apiKey = 'YOUR_API_KEY_HERE'; // Replace with your actual OpenWeatherMap API key
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  WeatherRepositoryImpl(this.dio);

  @override
  Future<Weather> getWeather(double latitude, double longitude) async {
    try {
      final response = await dio.get(
        '$baseUrl/weather',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': apiKey,
          'units': 'metric', // Use 'imperial' for Fahrenheit
        },
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to load weather data');
    }
  }
}
