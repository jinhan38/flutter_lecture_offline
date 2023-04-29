import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  // 1. 문법의 형태 -> 1
  // 2. Future.microtask -> 3
  // 3. Future.delayed -> 2
  // 4. Future.any
  // 5. Future.doWhile
  // 6. Future.forEach
  // 7. Future.wait -> 4
  // 8. Future.sync
  // 9. Future.value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // await을 사용한다면 동기 처리(순서대로 진행되기 때문에)
              // await을 지운다면 비동기 처리
              // (futureBasic함수가 완료되지 않아도 다음 코드 실행하기 때문)
              futureBasic().then((value) {
                print("value : $value");
              });
              print("함수 다음에 호출");
            },
            child: Text("버튼"),
          ),
          ElevatedButton(
            onPressed: () async {
              // Future<String> d1000 = delay1000();
              // print("d1000 : $d1000");

              final Stopwatch stopwatch = Stopwatch();
              stopwatch.start();
              delay1000().then((value) {
                print('delay1000 : $value, ${stopwatch.elapsed}');
              });
              delay2000().then((value) {
                print('delay2000 : $value, ${stopwatch.elapsed}');
              });
              delay3000().then((value) {
                print('delay3000 : $value, ${stopwatch.elapsed}');
                stopwatch.stop();
              });
            },
            child: Text("Delay test"),
          ),
          ElevatedButton(
              onPressed: () async {
                final Stopwatch stopwatch = Stopwatch();
                stopwatch.start();
                var d1 = await delay1000();
                print("d1 : $d1, ${stopwatch.elapsed}");
                var d2 = await delay2000();
                print("d2 : $d2, ${stopwatch.elapsed}");
                var d3 = await delay3000();
                print("d3 : $d3, ${stopwatch.elapsed}");
                stopwatch.stop();
              },
              child: Text("await")),
        ],
      ),
    );
  }

  /// Future를 사용할 것이고,
  /// <void> => return type void
  /// async = 중괄호 앞에 사용
  /// await = Future 함수 앞에 사용
  Future<String> futureBasic() async {
    print("1");

    // 1000 = 1초
    // 1초 후에 특정 코드를 실행
    // await은 Future함수가 끝날 때 까지 기다린다.
    // 네트워크 통신을 할때
    // 그 결과값을 가지고 무엇을 해야될 때
    // 혹은 해당 함수가 완료되고 다른 작업을 해야할 때
    await Future.delayed(
      Duration(milliseconds: 1000),
      () {
        print("2");
        print("3");
      },
    );

    return "완료";
  }

  Future<String> delay1000() async {
    await Future.delayed(Duration(seconds: 1));
    return "1000";
  }

  Future<String> delay2000() async {
    await Future.delayed(Duration(seconds: 2));
    return "2000";
  }

  Future<String> delay3000() async {
    await Future.delayed(Duration(seconds: 3));
    return "3000";
  }
}
