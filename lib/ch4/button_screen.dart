import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  // 1. ElevatedButton
  // 2. TextButton
  // 3. OutLinedButton
  // 4. IconButton

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _elevatedButton(),
            const SizedBox(height: 60),
            _textButton(),
            const SizedBox(height: 60),
            _outlinedButton(),
            const SizedBox(height: 60),
            _iconButton(),
          ],
        ),
      ),
    );
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      // 버튼을 클릭 했을 때 진입
      onPressed: () {
        print('onPressed');
      },

      // 버튼을 누르고 있을 때 진입
      onLongPress: () {
        print('onLongPress');
      },

      // 마우스 커서가 위에 있을 때
      // 웹
      onHover: (value) {
        // print('value : $value');
      },

      // 버튼 비활성화 처리
      // onPressed: null,

      style: buttonStyle(),

      child: Text("ElevatedButton"),
    );
  }

  Widget _textButton() {
    return TextButton(
      onPressed: () {},
      style: buttonStyle(),
      child: Text("TextButton"),
    );
  }

  Widget _outlinedButton() {
    return OutlinedButton(
      onPressed: () {},
      style: buttonStyle(),
      child: Text("OutlinedButton"),
    );
  }

  Widget _iconButton() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.add,
        size: 60,
      ),
      iconSize: 40,
      color: Colors.green,
      // 버튼 클릭했을 때 배경 컬러
      highlightColor: Colors.blue.withOpacity(0.5),
      // 버튼 눌렀을 때 물결 효과 컬러
      splashColor: Colors.black,
      splashRadius: 70,
      focusColor: Colors.purple,
      mouseCursor: SystemMouseCursors.grabbing,
      hoverColor: Colors.red.shade200,

      // 아이콘 사이즈, 클릭 영역 증가
      constraints: const BoxConstraints(minHeight: 100, minWidth: 100),
      padding: EdgeInsets.zero,
      tooltip: "아이콘 버튼",
    );
  }

  ButtonStyle buttonStyle() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton.styleFrom(
      // 버튼의 컬러
      backgroundColor: Colors.orange,

      // 텍스트의 컬러와 클릭했을 때 splash 컬러 변경
      foregroundColor: Colors.black,
      shadowColor: Colors.purple,
      elevation: 5,

      // Size 클래스는 2개의 값을 넣을 수 있어서
      // 첫 번째는 가로(width), 두 번째는 세로(height)
      // 고정된 사이즈
      fixedSize: Size(width * 0.8, height * 0.1),
      // fixedSize: Size(100,400),
      // minimumSize: Size(width - 200, 60),
      // maximumSize: Size(800, 150),

      // 버튼 내부 패딩
      padding: EdgeInsets.only(bottom: 3),

      // child의 위치 설정
      alignment: Alignment.center,

      // Button disabled 됐을 때 배경 컬러
      disabledBackgroundColor: Colors.grey,

      // Button disabled 됐을 텍스트 컬러
      disabledForegroundColor: Colors.white,

      disabledMouseCursor: SystemMouseCursors.basic,

      enabledMouseCursor: SystemMouseCursors.grab,

      shape: _shape(type: OutlinedBorderType.beveledRectangleBorder),
    );
  }

  OutlinedBorder _shape({required OutlinedBorderType type}) {
    var borderSide = const BorderSide(
      color: Colors.red,
      width: 1,
      strokeAlign: 20,
    );
    var borderRadius = BorderRadius.circular(16);

    switch (type) {
      case OutlinedBorderType.roundedRectangleBorder:
        // 테두리와 라운드를 넣을 수 있는 형태
        return RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide,
        );
      case OutlinedBorderType.circleBorder:
        // 원형 형태
        return CircleBorder(
          side: borderSide,

          // 1 : 원이 사각형의 네 면에 닿는 형태
          // 0 : 가장 가까운 두 변에 닿는 원을 그린다.
          eccentricity: 0,
        );
      case OutlinedBorderType.continuousRectangleBorder:
        // 직선 면과 둥근 모서리 사이가 부드럽고 연속적으로 전환되는 테두리
        return ContinuousRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide,
        );
      case OutlinedBorderType.beveledRectangleBorder:
        // 테두리가 있고, 모서리가 경사진 형태
        return BeveledRectangleBorder(
          side: borderSide,
          borderRadius: borderRadius,
        );
      case OutlinedBorderType.stadiumBorder:
        // 긴 쪽의 테두리가 항상 반원인 형태
        return StadiumBorder();
    }

    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(26),
      side: BorderSide(width: 2, color: Colors.blue),
    );
  }
}

enum OutlinedBorderType {
  roundedRectangleBorder,
  circleBorder,
  continuousRectangleBorder,
  beveledRectangleBorder,
  stadiumBorder,
}
