import 'dart:convert';
import 'dart:math';

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
    List<String> cityName = ["Dharan", "Kathmandu", "Delhi", "London"];
    final _random = Random();
    String? city = cityName[_random.nextInt(cityName.length)];
    print(city);
    final weatherArguments =
        ModalRoute.of(context)!.settings.arguments as WeatherArguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue.shade400, Colors.blue.shade100],
              // stops: [0.1, 0.4],
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            print("Hello");
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search $city",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Description
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text("Hello World"),
                      ),
                    )
                  ],
                ),

                // Temperature
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 300,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text("Hello World"),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.only(left: 2.0, right: 6.0),
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text("Hello World"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.only(right: 2.0, left: 6.0),
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text("Hello World"),
                        ),
                      )
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Created By Yunesh Shrestha"),
                      Text("Data Provided By Openweathermap.org"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Text(
//               // weatherArguments.temperature.toStringAsFixed();
//               "Temperature: ${weatherArguments.temperature} deg Celcius",
//               textScaleFactor: 1.4,
//             ),
//             Text(
//               "Wind Speed: ${weatherArguments.airSpeed} km/hr",
//               textScaleFactor: 1.4,
//             ),
//             Column(
//               children: [
//                 const Text(
//                   "Description:",
//                   textScaleFactor: 1.4,
//                 ),
//                 Text(
//                   weatherArguments.description.toString(),
//                   textScaleFactor: 1.4,
//                 ),
//               ],
//             )