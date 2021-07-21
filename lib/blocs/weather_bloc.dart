import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_proj/blocs/weather_bloc_event.dart';
import 'package:bloc_proj/blocs/weather_bloc_state.dart';
import 'package:bloc_proj/data/weather.dart';
import 'package:bloc_proj/data/weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}): super(WeatherUninitializedState());

  WeatherState get initialState => WeatherUninitializedState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    // ignore: avoid_print
    print('Start');
     yield WeatherFetchingState();
     Weather? weather;
      try {   
        if (event is SearchTextChangedEvent) {
          weather = await weatherRepository.fetchWeatherByCountry(event.country);
        } 
        // ignore: unnecessary_null_comparison
        if (weather == null) {
          yield WeatherEmptyState();
        } else {
          yield WeatherFetchedState(weather: weather);
        }
      } catch (_) {
        yield WeatherErrorState();
      }
    }
  }

