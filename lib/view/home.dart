import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/arguments/weather_arguments.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final weatherArguments =
        ModalRoute.of(context)!.settings.arguments as WeatherArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // weatherArguments.temperature.toStringAsFixed();
              "Temperature: ${weatherArguments.temperature} deg Celcius",
              textScaleFactor: 1.4,
            ),
            Text(
              "Wind Speed: ${weatherArguments.airSpeed} km/hr",
              textScaleFactor: 1.4,
            ),
            Column(
              children: [
                const Text(
                  "Description:",
                  textScaleFactor: 1.4,
                ),
                Text(
                  weatherArguments.description.toString(),
                  textScaleFactor: 1.4,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
