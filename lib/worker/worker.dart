import 'dart:convert';

// import 'package:flutter/material.dart';
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
    try {
      var response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=fad041a60b51ade32ee3963413d0df89"));
      Map data = jsonDecode(response.body);
      // Temperature Data , Humidity
      // print(data);
      Map tempData = data['main'];
      // Weather Description and main
      List weather = data['weather'];
      Map mainWeather = weather[0];
      // Air Speed
      Map wind = data['wind'];
      double getTemperature = tempData['temp'] - 273.15.round(); //deg celcius
      double preciseGetTemperature =
          double.parse((getTemperature).toStringAsFixed(2));
      var getHumidity = tempData['humidity']; // percent
      var getDescription = mainWeather['description'];
      var getMain = mainWeather['main'];
      var getAirSpeed = wind['speed'] * 3.6; //km per hr

      temperature = preciseGetTemperature.toString();
      humidity = getHumidity.toString();
      description = getDescription;
      main = getMain;
      airSpeed = getAirSpeed.toString();
    } catch (e) {
      // print(e.toString());
      temperature = "No Data Found";
      humidity = "No Data Found";
      description = "No Data Found";
      main = "No Data Found";
      airSpeed = "No Data Found";
    }
  }
}
