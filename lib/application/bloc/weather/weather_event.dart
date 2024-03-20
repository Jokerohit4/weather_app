

abstract class WeatherEvent {}
class WeatherRequested extends WeatherEvent {
  final double latitude;
  final double longitude;

  WeatherRequested(this.latitude, this.longitude);
}