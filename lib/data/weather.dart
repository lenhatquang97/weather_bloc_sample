import 'forecast.dart';
class Weather {
  String temperature;
  String wind;
  String description;
  List<Forecast> forecast;

  Weather({required this.temperature,required this.wind,required this.description,required this.forecast});

  factory Weather.fromJson(Map<String, dynamic> json) {
    List<Forecast> temp=[];
    if (json['forecast'] != null) {
      json['forecast'].forEach((v) {
        if(v['wind'].toString()!=" km/h") {
          temp.add(Forecast.fromJson(v));
        }
      });
    }
    return Weather(
      temperature: json['temperature'] ??"Not found", 
      wind: json['wind']?? "Not found",
      description: json['description'] ?? "Not found", 
      forecast: temp);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temperature'] = temperature;
    data['wind'] = wind;
    data['description'] = description;
    data['forecast'] = forecast.map((v) => v.toJson()).toList();
    return data;
  }
}
