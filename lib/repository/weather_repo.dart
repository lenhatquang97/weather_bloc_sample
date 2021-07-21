import 'package:bloc_proj/data/weather.dart';
import 'package:bloc_proj/data/weather_api_provider.dart';

class WeatherRepository {
  final WeatherApiProvider _weatherApiProvider = WeatherApiProvider();

  Future<Weather> fetchWeatherByCountry(String country) =>
      _weatherApiProvider.fetchWeatherByCountry(country);

}
