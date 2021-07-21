import 'dart:convert';
import 'package:bloc_proj/data/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiProvider {

  String baseUrl = "https://goweather.herokuapp.com/weather/";
  final successCode = 200;

  Future<Weather> fetchWeatherByCountry(String country) async {
    final response = await http.get(Uri.parse(baseUrl+country));

    return parseResponse(response);
  }

  Weather parseResponse(http.Response response) {
    final responseString = jsonDecode(utf8.decode(response.bodyBytes));
    // ignore: avoid_print
    print(responseString);
    if (response.statusCode == successCode) {
      return Weather.fromJson(responseString);
    } else {
      throw Exception('failed to load weather');
    }
  }
}