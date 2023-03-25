import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _container(100, 100, Colors.red),
        _container(100, 100, Colors.yellow),
        _container(100, 100, Colors.purple),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   /// Column : 세로로 위젯들을 쌓는 위젯
  //   /// Column에서 main은 세로(기준축) -> 가능한 세로 사이즈로 최대화
  //   /// Column에서 cross는 가로(교차축) -> 자식 위젯의 사이즈 만큼만
  //   ///
  //   /// SizedBox = Container에서 width, height, child 특성만 빼온 위젯
  //   /// size만 지정할 수 있는 위젯
  //   return SizedBox(
  //     width: double.infinity,
  //     // height: 400,
  //     child: Column(
  //       /// children : 위젯 여러개 사용
  //       children: [
  //         _container(200, 100, Colors.green),
  //         _container(100, 100, Colors.orange),
  //         _container(100, 100, Colors.blue),
  //       ],
  //       /// 자식 위젯들이 기준축(세로)으로 어떻게 위치 할지 설정
  //       mainAxisAlignment: MainAxisAlignment.end,
  //
  //       /// 자식 위젯들이 교차축(가로)로 어떻게 위치 할지 설정
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //
  //       /// 세로축(기준)의 최소/최대 사이즈를 설정합니다.
  //       mainAxisSize: MainAxisSize.max,
  //
  //       // verticalDirection: VerticalDirection.up,
  //
  //     ),
  //   );
  // }

  /// 위젯을 리턴하는 함수
  /// 동일한 형태가 반복될 때 사용
  /// 기존에 함수는 return 타입이 void, String
  Widget _container(
    double width,
    double height,
    Color color,
  ) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
