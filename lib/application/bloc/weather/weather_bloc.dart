import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/application/bloc/weather/weather_event.dart';
import 'package:weather_app/application/bloc/weather/weather_state.dart';
import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<WeatherRequested>(_onWeatherRequested);
  }

  Future<void> _onWeatherRequested(
      WeatherRequested event,
      Emitter<WeatherState> emit,
      ) async {
    emit(WeatherLoadInProgress());
    try {
      final Weather weather = await weatherRepository.getWeather(event.latitude, event.longitude);
      emit(WeatherLoadSuccess(weather));
    } catch (_) {
      emit(WeatherLoadFailure());
    }
  }
}
