import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent extends Equatable {}

// The only event in this app is for getting the weather
class GetWeather extends WeatherEvent {
  final String cityName;

  GetWeather(this.cityName);

  @override
  List<Object> get props => [cityName];

}
