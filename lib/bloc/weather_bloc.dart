import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/repository/weather_repository.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherRepository _weatherRepository = WeatherRepository();

  WeatherBloc(WeatherState initialState) : super(initialState);

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // Distinguish between different events, even though this app has only one
    try {
      if (event is GetWeather) {
        // Outputting a state from the asynchronous generator
        yield WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      }
    } catch (ex){
      yield WeatherError();
    }
  }

  Future<Weather> _fetchWeatherFromFakeApi(String cityName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return Weather(
          cityName: cityName,
          // Temperature between 20 and 35.99
          temperature: 20 + Random().nextInt(15) + Random().nextDouble(),
        );
      },
    );
  }
}
