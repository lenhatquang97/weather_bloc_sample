
class Forecast {
  String day;
  String temperature;
  String wind;

  Forecast({required this.day,required this.temperature,required this.wind});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      day: json['day'] ?? "Not found", 
      temperature: json['temperature'] ?? "Not found", 
      wind: json['wind'] ?? "Not found"
      );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['temperature'] = temperature;
    data['wind'] = wind;
    return data;
  }
}
