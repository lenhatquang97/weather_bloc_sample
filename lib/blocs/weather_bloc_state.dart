import 'package:bloc_proj/data/weather.dart';
abstract class WeatherState{}
class WeatherUninitializedState extends WeatherState{}
class WeatherFetchingState extends WeatherState{}
class WeatherFetchedState extends WeatherState{
  final Weather weather;
  WeatherFetchedState({required this.weather});
}
class WeatherErrorState extends WeatherState{

}
class WeatherEmptyState extends WeatherState{

}