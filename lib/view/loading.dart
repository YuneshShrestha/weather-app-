import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  var isLoading = true;
  String? des;
  void startApp() async {
    Worker worker = Worker(location: "kathmanduzzzzzzzzz");
    await worker.getData();
    setState(() {
      isLoading = false;

      des = worker.description!;
    });
    print(worker.description);
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Loading"),
      // ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    child: const Text("Go To Home"),
                  ),
                  Text(des.toString())
                ],
              ),
      ),
    );
  }
}
