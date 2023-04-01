import 'package:flutter/material.dart';

class TextFormFieldScreen extends StatefulWidget {
  const TextFormFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFormFieldScreen> createState() => _TextFormFieldScreenState();
}

class _TextFormFieldScreenState extends State<TextFormFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFormFieldScreen"),

        // true : back 버튼 자동으로 보여줌
        // false : back 버튼 자동으로 보여주지 않음
        automaticallyImplyLeading: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        style: TextStyle(fontSize: 20),
        cursorColor: Colors.pink,
        cursorWidth: 5,
        // cursorHeight: 35,
        cursorRadius: Radius.circular(3),
        decoration: InputDecoration(
          // hint : 글자를 입력하지 않았을 때 보여주는 문구
          hintText: "아이디를 입력하세요",
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          hintMaxLines: 1,
        ),
      ),
    );
  }
}
