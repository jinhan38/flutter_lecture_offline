import 'package:flutter/material.dart';

class RouteSecond extends StatefulWidget {
  /// 생성자, message 값을 받도록 설정
  const RouteSecond({
    required this.message,
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  State<RouteSecond> createState() => _RouteSecondState();
}

class _RouteSecondState extends State<RouteSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RouteSecond'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, "반갑습니다.");
            },
            child: Text("pop"),
          ),
          Text(widget.message),
        ],
      ),
    );
  }
}
