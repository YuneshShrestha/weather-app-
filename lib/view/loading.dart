import 'package:flutter/material.dart';
import 'package:weather_app/arguments/weather_arguments.dart';
import 'package:weather_app/worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var isLoading = true;
  String? temperature;
  String? humidity;
  String? description;
  String? airSpeed;
  String? main;

  void startApp() async {
    Worker worker = Worker(location: "kathmandu");
    await worker.getData();
    setState(() {
      isLoading = false;
      temperature = worker.temperature!;
      humidity = worker.humidity!;
      description = worker.description!;
      airSpeed = worker.airSpeed!;
      main = worker.main!;
    });
    Navigator.pushReplacementNamed(context, "/home",
        arguments: WeatherArguments(
            temperature: temperature,
            humidity: humidity,
            description: description,
            airSpeed: airSpeed,
            main: main));
    print(worker.description);
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Loading"),
      // ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
