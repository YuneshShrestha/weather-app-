import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alram();
    print("App Started");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("SetStated Called");
  }

  void getData() {}
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Page Terminated");
  }

  void alram() {
    Future.delayed(const Duration(seconds: 9), () {
      print("Alram is ringing");
    });
    print("Other Works");
  }

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