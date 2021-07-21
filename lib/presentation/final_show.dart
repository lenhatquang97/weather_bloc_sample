import 'package:bloc_proj/blocs/weather_bloc.dart';
import 'package:bloc_proj/blocs/weather_bloc_event.dart';
import 'package:bloc_proj/blocs/weather_bloc_state.dart';
import 'package:bloc_proj/data/forecast.dart';
import 'package:bloc_proj/presentation/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherShow extends StatelessWidget {
  const WeatherShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder(
            bloc: BlocProvider.of<WeatherBloc>(context),
            builder: (context, state) {
              if (state is WeatherUninitializedState) {
                return const Message(message: "Unintialised State");
              } else if (state is WeatherEmptyState) {
                return const Message(message: "Not found");
              } else if (state is WeatherErrorState) {
                return const Message(message: "Something is wrong");
              } else if (state is WeatherFetchingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final stateAsWeatherFetchedState = state as WeatherFetchedState;
                final weather = stateAsWeatherFetchedState.weather;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(weather.temperature),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(weather.wind),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(weather.description),
                    const SizedBox(
                      height: 10,
                    ),
                    Foo(
                      forecast: weather.forecast,
                    ),
                  ],
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<WeatherBloc>(context)
                .add(SearchTextChangedEvent(country: "Germany"));
          },
          child: const Icon(Icons.add)),
    );
  }
}

class Foo extends StatelessWidget {
  final List<Forecast> forecast;
  const Foo({required this.forecast, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (forecast.isEmpty) {
      return const SizedBox(
        height: 10,
      );
    }
    return Column(
        children: forecast
            .map((e) => Text(e.day + " " + e.temperature + " " + e.wind))
            .toList());
  }
}
