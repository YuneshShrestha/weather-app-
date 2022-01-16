import 'package:flutter/material.dart';
import 'package:weather_app/arguments/city_argument.dart';
// import 'package:weather_app/binding/controllerBinding.dart';
import 'package:weather_app/view/home.dart';
// import 'package:get/get.dart';
import 'package:weather_app/view/loading.dart';
import 'package:weather_app/view/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // initialBinding: ControllerBinding(),
      // home: const Home(),
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/loading": (context) => const Loading(),

        // "/location": (context) => const Location(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: "/",

      // getPages: [
      //   GetPage(name: "/", page: () => const Home()),
      //   GetPage(name: "/loading", page: () => const Loading()),
      //   GetPage(name: "/location", page: () => const Location())
      // ],
    );
  }
}
