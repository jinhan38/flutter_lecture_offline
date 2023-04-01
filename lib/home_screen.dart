import 'package:f_lecture/ch3/widgets/container_widget.dart';
import 'package:f_lecture/ch3/widgets/row_widget.dart';
import 'package:f_lecture/ch4/scaffold_widget.dart';
import 'package:f_lecture/ch4/text_form_field_screen.dart';
import 'package:flutter/material.dart';

import 'ch3/widgets/column_row_widget.dart';
import 'ch3/widgets/column_widget.dart';
import 'ch3/widgets/text_widget.dart';

/// 단축키 stl
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Column(
        children: [
          button(
            context: context,
            text: "Scaffold, Appbar",
            page: const ScaffoldWidget(),
          ),
          button(
            context: context,
            text: "TextFormField",
            page: TextFormFieldScreen(),
          ),
        ],
      ),
    );
  }

  Widget button({
    required BuildContext context,
    required String text,
    required Widget page, // 이동하려는 화면
  }) {
    return Container(
      // double.infinity -> 최대 값 사용
      width: double.infinity,
      height: 70,

      // 패딩을 준다. top(위쪽)만 20.
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          print('HomeScreen.button');

          // 화면이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return page;
              },
            ),
          );
        },
        child: Text(text),
      ),
    );
  }
}
