import 'package:bloc_proj/blocs/weather_bloc.dart';
import 'package:bloc_proj/repository/weather_repo.dart';
import 'package:bloc_proj/presentation/final_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WeatherRepository _repository = WeatherRepository();
  runApp(MyApp(
    weatherRepository: _repository,
  ));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const MyApp({required this.weatherRepository, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          weatherRepository: weatherRepository,
          title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final WeatherRepository weatherRepository;
  const MyHomePage(
      {required this.weatherRepository, required this.title, Key? key})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(weatherRepository: weatherRepository),
          child: WeatherShow(
            key: key,
          ));
  }
}
