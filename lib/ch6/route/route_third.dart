import 'package:flutter/material.dart';

class RouteThird extends StatefulWidget {
  const RouteThird({Key? key}) : super(key: key);

  @override
  State<RouteThird> createState() => _RouteThirdState();
}

class _RouteThirdState extends State<RouteThird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RouteThird"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // 컨트롤 + 알트 + L
              // 특정 페이지까지 되돌아간다.
              Navigator.popUntil(
                context,
                (route) {
                  return route.isFirst;
                },
              );
            },
            child: Text("popUntil"),
          ),
        ],
      ),
    );
  }
}
