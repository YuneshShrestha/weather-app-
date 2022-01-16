import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/arguments/city_argument.dart';
import 'package:weather_app/arguments/weather_arguments.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> cityName = ["Dharan", "Kathmandu", "Delhi", "London"];
    final _random = Random();
    String? city = cityName[_random.nextInt(cityName.length)];
    print(city);
    final weatherArguments =
        ModalRoute.of(context)!.settings.arguments as WeatherArguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue.shade400,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue.shade400, Colors.blue.shade200],
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
                            Navigator.pushNamed(context, "/loading",
                                arguments:
                                    CityArgument(city: searchController.text));
                            // print(searchController.text);
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
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
                        height: 70,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                                "http://openweathermap.org/img/wn/${weatherArguments.icon}@2x.png"),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${weatherArguments.main}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  "In ${weatherArguments.location}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                // Temperature
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 260,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 10.0),
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [Icon(WeatherIcons.thermometer)],
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${weatherArguments.temperature}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 80,
                                    ),
                                  ),
                                  const Text(
                                    "\u2103",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 30,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
                          height: 140,
                          margin: const EdgeInsets.only(left: 2.0, right: 6.0),
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(WeatherIcons.windy),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${weatherArguments.airSpeed}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    const Text(
                                      "km/hr",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 140,
                          margin: const EdgeInsets.only(left: 2.0, right: 6.0),
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(WeatherIcons.humidity),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${weatherArguments.humidity}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    const Text(
                                      "%",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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