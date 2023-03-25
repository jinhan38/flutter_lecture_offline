import 'package:flutter/material.dart';

/// Container -> 하나의 위젯
/// 개념 => 박스
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 지금 저희가 하는건 Container 위젯을 어떻게 사용하는지 배움
    return Container(
      /// double.infinity : 최대한의 길이로 설정
      // width: double.infinity,
      width: 200,
      height: 500,

      /// constraints : 가로세로 최대,최소 값을 설정할 수 있습니다.
      constraints: const BoxConstraints(
        maxWidth: 500,
        minWidth: 100,
        maxHeight: 500,
        minHeight: 100,
      ),

      /// Text라는 다른 위젯을 child(자식)에 넣어준다.
      child: const Text(
        "Container",
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      alignment: Alignment.bottomRight,

      /// margin : 지금 사용하고 있는
      /// Container위젯 주변에 간격을 넣어주는 기능
      margin: const EdgeInsets.all(30),
      // margin: const EdgeInsets.only(left: 50, top: 100),
      /// vertical : 세로, 위아래
      /// horizontal : 가로, 왼쪽 오른쪽
      // margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 70),

      // padding은 위젯 내부 간격을 줍니다.
      padding: const EdgeInsets.all(20),

      // color와 decoration은 동시에 사용할 수 없습니다.
      // color: Colors.orange,

      /// 위쪽을 꾸며줍니다.
      decoration: BoxDecoration(
        color: Colors.purple,

        // border: Border.all(
        //   color: Colors.red,
        //   width: 10,
        // ),

        borderRadius: BorderRadius.circular(30),

        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          /// 1.57 -> 시계방향으로 90도
          /// 3.14 -> 시계방향으로 180도 회전
          /// 6.28 -> 시계방향으로 360도 회전
          /// -1.57 -> 반 시계방향으로 90도
          /// -3.14 -> 반 시계방향으로 180도 회전
          /// -6.28 -> 반 시계방향으로 360도 회전
          transform: GradientRotation(1),
          colors: [
            Colors.red,
            Colors.red,
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.blue,
            Colors.indigo,
            Colors.purple,
          ],
        ),

        /// BoxShape.circle과 borderRaidus 동시 사용 불가
        // shape: BoxShape.circle,

        // border: Border.symmetric(
        //   vertical: BorderSide(
        //     color: Colors.green,
        //     width: 10,
        //   ),
        //   horizontal: BorderSide(
        //     color: Colors.blue,
        //     width: 10,
        //   ),
        // ),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(30),
        //   topRight: Radius.circular(50),
        //   bottomLeft: Radius.circular(20),
        //   bottomRight: Radius.circular(10),
        // ),
      ),

      /// 가장 앞쪽을 꾸며줍니다.
      foregroundDecoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20,
            spreadRadius: 10,

            /// Offset : x, y 값을 넣는 클래스
            /// 기준점 Container의 중심
            /// x : 50 -> 오른쪽으로 50 이동
            /// y : 50 -> 아래로 50 이동
            /// x : -50 -> 왼쪽으로 50 이동
            /// y : -50 -> 위로 50 이동
            offset: Offset(15, 15),

            blurStyle: BlurStyle.normal
          ),
        ],
      ),
    );
  }
}
