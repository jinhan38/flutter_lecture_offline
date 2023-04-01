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
      onPressed: () {},

      // 버튼을 누르고 있을 때 진입
      onLongPress: () {},

      // 마우스 커서가 위에 있을 때
      // 웹
      onHover: (value) {
        print('value : $value');
      },
      child: Text("ElevatedButton"),
    );
  }
}
