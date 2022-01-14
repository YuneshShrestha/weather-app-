import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  String? name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    // alram();
    // getName();
    // getName();
    print("App Started");
  }

  void getData() async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=dharan&appid=fad041a60b51ade32ee3963413d0df89"));
    Map data = jsonDecode(response.body);
    Map temp = data["main"];
    List weather = data["weather"];
    Map mainWeather = weather[0];
    print(temp["temp"]);
    print(mainWeather["main"]);
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("SetStated Called");
  }

  // Future<String?> setName() async {
  //   await Future.delayed(const Duration(seconds: 2), () {
  //     name = "Yunesh";
  //     // return "Yunesh";
  //   });
  //   // print("$name");
  // }

  // void getName() async {
  //   await setName();
  //   print("$name");
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Page Terminated");
  }

  // void alram() {
  //   Future.delayed(const Duration(seconds: 9), () {
  //     print("Alram is ringing");
  //   });
  //   print("Other Works");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "$counter",
                textScaleFactor: 2.0,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text("Count Increase")),
          )
        ],
      ),
    );
  }
}
