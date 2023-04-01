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

      shape: _shape(),
    );
  }


  OutlinedBorder _shape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(26),
      side: BorderSide(width: 2, color: Colors.blue),
    );
  }
}
