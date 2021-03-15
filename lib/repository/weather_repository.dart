import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather.dart';

class WeatherRepository {
  static const _BASE_URL = 'https://www.metaweather.com/api/location';

  // static const _BASE_URL = '217.198.83.164';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<Weather> fetchWeather(String cityName) async {
    var response = await _dio.get("/search/?query=$cityName");
    var res = response.data;
    final id = res[0]["woeid"];
    response = await _dio.get("/$id");
    return Weather(cityName: cityName, temperature: response.data["consolidated_weather"][0]["the_temp"]);
  }

}