import 'package:flutter/material.dart';
import 'package:whtear_api/model/weather_model.dart';
import 'package:whtear_api/weather_api/weather_helper.dart';

class WeatherProvider extends ChangeNotifier
{
  String lat='21.1702',long='72.8311';

  WeatherModel? weatherModel;

  void changlat(String plat,String plong)
  {
    lat=plat;
    long=plong;
    notifyListeners();
  }
  Future<WeatherModel?> loadData(String lat, String? long)
  async {
    weatherModel= await WeatherApi.weatherApi.getapi(lat, long);
    return weatherModel;
    notifyListeners();
  }
  String selectimage = "assets/images/img.png";
  void imagechange(double temp)
  {
    if(temp>=32)
    {
      selectimage = "assets/images/daily/sun.png";
    }
    else if(temp>=25)
    {
      selectimage ="assets/images/img4.png";
    }
    else if(temp>=20)
    {
      selectimage ="assets/images/img1.png";
    }
    else if(temp>=15)
    {
      selectimage ="assets/images/img3.png";
    }
    else if(temp>=8)
    {
      selectimage ="assets/images/img2.png";
    }
    else
    {
      selectimage ="assets/images/img4.png";
    }

  }

}