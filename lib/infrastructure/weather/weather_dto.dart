import 'package:hive/hive.dart';
import 'package:weather_app/domain/entities/weather.dart';

part 'weather_dto.g.dart';

@HiveType(typeId: 0)
class WeatherDTO {
  @HiveField(0)
  final double temperature;

  @HiveField(1)
  final int humidity;

  @HiveField(2)
  final double windSpeed;

  WeatherDTO({required this.temperature, required this.humidity, required this.windSpeed});

  Weather toDomain() {
    return Weather(temperature: temperature, humidity: humidity, windSpeed: windSpeed);
  }

  factory WeatherDTO.fromDomain(Weather weather) {
    return WeatherDTO(
      temperature: weather.temperature,
      humidity: weather.humidity,
      windSpeed: weather.windSpeed,
    );
  }
}
