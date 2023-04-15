import 'package:f_lecture/ch6/route/route_second.dart';
import 'package:flutter/material.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  String rValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("RouteScreen"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RouteSecond(message: "안녕하세요");
                    },
                  ),
                ).then((value) {
                  debugPrint("value : $value");
                  setState(() {
                    rValue = value;
                  });
                });
              },
              child: Text("Push"),
            ),
            Text(rValue),
          ],
        ));
  }
}
