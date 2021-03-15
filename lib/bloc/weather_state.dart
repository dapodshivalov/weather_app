import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather.dart';

@immutable
abstract class WeatherState extends Equatable {
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherError extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

// Only the WeatherLoaded event needs to contain data
class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}
