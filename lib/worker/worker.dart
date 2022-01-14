import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Worker {
  String? location;
  String? temperature;
  String? humidity;
  String? description;
  String? airSpeed;
  String? main;
  Worker({this.location}) {
    location = location;
    // print("$location");
  }
  Future<void> getData() async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=fad041a60b51ade32ee3963413d0df89"));
    Map data = jsonDecode(response.body);
    // Temperature Data , Humidity
    Map tempData = data['main'];
    // Weather Description and main
    List weather = data['weather'];
    Map mainWeather = weather[0];
    // Air Speed
    Map wind = data['wind'];

    temperature = tempData['temp'].toString();
    humidity = tempData['humidity'].toString();
    description = mainWeather['description'];
    main = mainWeather['main'];
    airSpeed = wind['speed'].toString();
  }
}
