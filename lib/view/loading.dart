import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/arguments/city_argument.dart';
import 'package:weather_app/arguments/weather_arguments.dart';
import 'package:weather_app/worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // var isLoading = true;
  String? temperature;
  String? humidity;
  String? description;
  String? airSpeed;
  String? main;
  String? icon;
  String? city = "Dharān";

  void startApp(String city) async {
    Worker worker = Worker(location: city);
    await worker.getData();

    temperature = worker.temperature!;
    humidity = worker.humidity!;
    description = worker.description!;
    airSpeed = worker.airSpeed!;
    main = worker.main!;
    icon = worker.icon!;
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, "/home",
            arguments: WeatherArguments(
                temperature: temperature,
                humidity: humidity,
                description: description,
                airSpeed: airSpeed,
                main: main,
                icon: icon,
                location: city)));
    print(worker.description);
  }

  @override
  // void initState() {
  //   super.initState();
  //   startApp();
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    if (ModalRoute.of(context)!.settings.name == '/loading') {
      final cityArgument =
          ModalRoute.of(context)!.settings.arguments as CityArgument;
      if (cityArgument.city.isNotEmpty) {
        city = cityArgument.city;
      }
    }
    startApp(city!);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Loading"),
      // ),
      backgroundColor: const Color(0xff2D46B9),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          'image/weather.png',
          width: 160.0,
          height: 100.0,
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          "Weather App",
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade200),
        ),
        const SizedBox(
          height: 48.0,
        ),
        SpinKitDualRing(
          color: Colors.grey.shade400,
          size: 30.0,
        )
      ]),
    );
  }
}
