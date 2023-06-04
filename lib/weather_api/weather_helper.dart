import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:whtear_api/model/weather_model.dart';

class WeatherApi
{
  static WeatherApi weatherApi=WeatherApi();
  Future<WeatherModel> getapi(String? lat,String? long)
  async {
    String link="https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=27b4b62af22f34b9d2cb91d921d3c4cb&units=metric";
    var response=await http.get(Uri.parse(link));
    var json=jsonDecode(response.body);
    print(json);
    return  WeatherModel.fromJson(json);
  }
}