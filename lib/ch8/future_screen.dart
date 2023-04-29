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
        title: const Text("FutureScreen"),
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
            child: const Text("버튼"),
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
            child: const Text("Delay test"),
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
              child: const Text("await")),
          ElevatedButton(
              onPressed: () {
                final Stopwatch stopwatch = Stopwatch();
                stopwatch.start();
                delay1000().then((value) async {
                  // delay1000이 완료된 후에 진입
                  // 1초
                  print("delay1000 : $value, ${stopwatch.elapsed}");

                  var d3000 = await delay3000();
                  // 3초 뒤에-> stopwatch는 4초
                  print("d3000 : $d3000, ${stopwatch.elapsed}");

                  var d2000 = await delay2000();
                  // 2초 뒤에 -> stopwatch는 6초
                  print("d2000 : $d2000, ${stopwatch.elapsed}");
                  stopwatch.stop();
                });
              },
              child: const Text("test 2")),
          ElevatedButton(
              onPressed: () async {
                /// 네트워크 통신을 동기적으로 실행하는 것과 같은 예제
                var typeValue = await type(1);
                if (typeValue == 1) {
                  bool productValue = await product();
                  print("productValue : $productValue");
                } else if (typeValue == 2) {
                  await category();
                }
                print("로직 완료");
              },
              child: Text("Commerce button"))
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
      const Duration(milliseconds: 1000),
      () {
        print("2");
        print("3");
      },
    );

    return "완료";
  }

  Future<String> delay1000() async {
    await Future.delayed(const Duration(seconds: 1));
    return "1000";
  }

  Future<String> delay2000() async {
    await Future.delayed(const Duration(seconds: 2));
    return "2000";
  }

  Future<String> delay3000() async {
    await Future.delayed(const Duration(seconds: 3));
    return "3000";
  }

  /// Future함수는 총 3개
  /// 1. int를 return하는 Future함수(type) 만들어주세요
  /// 2. bool 값을 return하는 Future 함수(product)
  /// 3. return값 없는 Future 함수(category)
  /// 1번 함수를 호출했을 때 return 값이 1이면 2번 함수
  /// return값이 2라면 3번 함수 호출

  /// value라는 인자 받는 Future 함수
  Future<int> type(int value) async {
    // delay를 사용해서 1초 후 값 리턴
    await Future.delayed(const Duration(seconds: 1));
    print("type : $value");
    return value;
  }

  /// bool 타입 리턴하는 Future 함수
  /// delay 이후에 true 리턴
  Future<bool> product() async {
    print("product 함수");
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  /// 리턴 타입이 없는 Future 함수
  /// delay 1초 후에 프린트 출력
  Future<void> category() async {
    await Future.delayed(const Duration(seconds: 1));
    print("category");
  }
}
