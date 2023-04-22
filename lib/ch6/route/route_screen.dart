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
            // Push, 페이지 이동
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

            // pushReplacement, 페이지 교체
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 이동할 페이지를 리턴
                      return const RouteSecond(message: "pushReplacement");
                    },
                  ),
                );
              },
              child: Text("pushReplacement"),
            ),
          ],
        ));
  }
}
