abstract class WeatherEvent{}


class SearchTextChangedEvent extends WeatherEvent {
  final String country;

  SearchTextChangedEvent({required this.country});
}
