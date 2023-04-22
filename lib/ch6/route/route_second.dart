import 'package:f_lecture/ch6/route/route_third.dart';
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
        title: const Text('RouteSecond'),
      ),
      body: Column(
        children: [
          /// 뒤로가기
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, "반갑습니다.");
            },
            child: const Text("pop"),
          ),

          /// 이전 페이지에서 받아온 데이터
          Text(widget.message),

          /// 세번째 페이지로 이동
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RouteThird();
                  },
                ),
              );
            },
            child: const Text("go third"),
          )
        ],
      ),
    );
  }
}
